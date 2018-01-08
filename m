Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B91AB7894F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 09:33:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w089X8m5021073
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Jan 2018 01:33:08 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 8 Jan 2018 01:33:08 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Jan 2018 17:33:04 +0800
Message-ID: <daddaf3ba137a3f2341215eae82f2296c793c94c.1515403603.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1515403603.git.liezhi.yang@windriver.com>
References: <cover.1515403603.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/12] package_manager.py: reverse archs correctly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jan 2018 09:33:06 -0000
Content-Type: text/plain

It had reversed all the archs, which mixed multilib and common archs, e.g.:
"all any noarch x86_64 core2-64 qemux86_64 x86 i586 core2-32"
After reversed:
"core2-32 i586 x86 qemux86_64 core2-64 x86_64 noarch any all"
The core2-32 has a higher priority than core2-64 after reversed which is
incorrect. Don't mix with mulitlib when reverse can fix the problem, and let
multilib archs have a higher priority for multilib image.

Fixed:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "core2-32"
IMAGE_INSTALL_append = " ca-certificates"

$ bitbake wrlinux-image-glibc-small
Check rootfs.manifest, no core_32 packages is installed, this is
correct, but after we build lib32-bash, it will be incorrect:
$ bitbake lib32-bash
$ bitbake wrlinux-image-glibc-small
Check rootfs.manifest, a few lib32 packages are installed, such as
lib32-bash, this is incorrect. It was because ca-certificates is
allarch, and requires /bin/sh, which is provided by both bash and
lib32-bash, and lib32-bash has a higher priority than bash, so it would
be installed.

[YOCTO #12288]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/package_manager.py | 57 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index ea99165..3ef6698 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -467,10 +467,10 @@ class RpmPM(PackageManager):
         self.target_rootfs = target_rootfs
         self.target_vendor = target_vendor
         self.task_name = task_name
-        if arch_var == None:
-            self.archs = self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS').replace("-","_")
-        else:
-            self.archs = self.d.getVar(arch_var).replace("-","_")
+
+        self.archs = self._determine_archs(arch_var)
+        bb.note("The archs used by package manager: %s" % self.archs)
+
         if task_name == "host":
             self.primary_arch = self.d.getVar('SDK_ARCH')
         else:
@@ -489,9 +489,56 @@ class RpmPM(PackageManager):
         if not os.path.exists(self.d.expand('${T}/saved')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved'))
 
+    def _determine_archs(self, arch_var):
+        if arch_var:
+            archs = self.d.getVar(arch_var).replace("-","_").split()
+        else:
+            archs = self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS').replace("-","_").split()
+        # Reverse archs to ensure the -best- match is listed firstly, but need
+        # make sure not mixed with multilib archs, and let multilib archs have
+        # higher a priority for multilib image:
+        # For non-multilib image: (e.g., core-image-minimal)
+        # machine_arch:package_archs:multilib_archs:allarch_archs
+        # For multilib image: (e.g., lib32-core-image-minimal)
+        # machine_arch:multilib_archs:package_archs:allarch_archs
+        package_archs_var = self.d.getVar('PACKAGE_ARCHS').replace("-","_").split()
+        machine_arch_var = [self.d.getVar('MACHINE_ARCH').replace("-","_")]
+        package_archs = []
+        allarch_archs = []
+        ml_archs = []
+        machine_arch = []
+        for arch in archs:
+            if arch in machine_arch_var:
+                bb.note("Found MACHINE_ARCH: %s" % arch)
+                machine_arch.append(arch)
+            elif arch in package_archs_var:
+                bb.note("Found PACKAGE_ARCH: %s" % arch)
+                package_archs.append(arch)
+            elif arch in 'all any noarch'.split():
+                bb.note("Found allarch: %s" % arch)
+                allarch_archs.append(arch)
+            else:
+                bb.note("Found multilib arch: %s" % arch)
+                ml_archs.append(arch)
+        package_archs.reverse()
+        if machine_arch:
+            archs = machine_arch
+        mlprefix = self.d.getVar('MLPREFIX')
+        if ml_archs:
+            ml_archs.reverse()
+            if mlprefix:
+                archs += ml_archs + package_archs
+            else:
+                archs += package_archs + ml_archs
+        else:
+            archs += package_archs
+
+        archs += allarch_archs
+        return ' '.join(archs)
+
     def _configure_dnf(self):
         # libsolv handles 'noarch' internally, we don't need to specify it explicitly
-        archs = [i for i in reversed(self.archs.split()) if i not in ["any", "all", "noarch"]]
+        archs = [i for i in self.archs.split() if i not in ["any", "all", "noarch"]]
         # This prevents accidental matching against libsolv's built-in policies
         if len(archs) <= 1:
             archs = archs + ["bogusarch"]
-- 
2.7.4


