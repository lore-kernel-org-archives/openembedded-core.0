Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 633637C69C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 07:56:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1F7uMc5013637
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 23:56:23 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.435.0; Thu, 14 Feb 2019 23:56:22 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Feb 2019 16:14:51 +0800
Message-ID: <2b9d87d41667d287d9775ee45eb1d9a9a07c4328.1550218243.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1550218243.git.liezhi.yang@windriver.com>
References: <cover.1550218243.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] runqemu: Let qemuparams override default settings
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
X-List-Received-Date: Fri, 15 Feb 2019 07:56:22 -0000
Content-Type: text/plain

Fixed:
In meta/conf/machine/include/qemuboot-x86.inc:
QB_CPU_x86-64 = "-cpu core2duo"

$ runqemu qemux86-64 qemuparams="-cpu coreduo"
Check /proc/cpuinfo, it should use coreduo rather than core2duo since user
specifies it, but it doesn't, append qemuparams to the last can fix the
problem.

[YOCTO #11773]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c4a0ca8..10f61e4 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -189,6 +189,7 @@ class BaseConfig(object):
 
         self.qemu_opt = ''
         self.qemu_opt_script = ''
+        self.qemuparams = ''
         self.clean_nfs_dir = False
         self.nfs_server = ''
         self.rootfs = ''
@@ -460,7 +461,7 @@ class BaseConfig(object):
             elif arg.startswith('biosfilename='):
                 self.qemu_opt_script += ' -bios %s' % arg[len('biosfilename='):]
             elif arg.startswith('qemuparams='):
-                self.qemu_opt_script += ' %s' % arg[len('qemuparams='):]
+                self.qemuparams = ' %s' % arg[len('qemuparams='):]
             elif arg.startswith('bootparams='):
                 self.bootparams = arg[len('bootparams='):]
             elif os.path.exists(arg) or (re.search(':', arg) and re.search('/', arg)):
@@ -667,7 +668,11 @@ class BaseConfig(object):
             raise RunQemuError("Invalid custombiosdir: %s" % self.custombiosdir)
 
     def check_mem(self):
-        s = re.search('-m +([0-9]+)', self.qemu_opt_script)
+        """
+        Both qemu and kernel needs memory settings, so check QB_MEM and set it
+        for both.
+        """
+        s = re.search('-m +([0-9]+)', self.qemuparams)
         if s:
             self.set('QB_MEM', '-m %s' % s.group(1))
         elif not self.get('QB_MEM'):
@@ -1169,6 +1174,10 @@ class BaseConfig(object):
 
         self.qemu_opt += ' ' + self.qemu_opt_script
 
+        # Append qemuparams to override previous settings
+        if self.qemuparams:
+            self.qemu_opt += ' ' + self.qemuparams
+
         if self.snapshot:
             self.qemu_opt += " -snapshot"
 
-- 
2.7.4


