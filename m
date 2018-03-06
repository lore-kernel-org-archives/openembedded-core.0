Return-Path: <kamensky@cisco.com>
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
	by mail.openembedded.org (Postfix) with ESMTP id 9F28E78A83
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 17:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=9786; q=dns/txt; s=iport;
	t=1520358676; x=1521568276;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=ApLmlhzPGJ+3OEyEFHOwOnIYcJFu2vweZpt9Y/fIE/8=;
	b=HZlrgFdVxfdMq+l97DuRdQlaJsLtx8enW/p+3yP70bJQVHiB2D8eIinL
	q12nXPqXeAIS6RCMdzoJIy29RdDwtyhNt+egsJRw+WodsmltzkR3+eyLa
	ruRtkCoe8a3HD+wYccWmqW5w40MRAxupoC7ZlmmYlFEBetMzQ5pSYte11 Y=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BKAgCN1J5a/5xdJa1dGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYNQZnAom3GDGIwYg0yEUIIVChuFFQKDAyE1FwECAQEBAQE?=
	=?us-ascii?q?BAmsnhSQGeRA7FlcZhRurQoRyg3SCJoUxgi6GNIVDYoR/IASII4ZOi3YJhlS?=
	=?us-ascii?q?KKwKBZU6HBYU+MJB5AhEZAYEuHwE2QIESTSMVgn0JhGAfN4ldJIIkAQEB?=
X-IronPort-AV: E=Sophos;i="5.47,432,1515456000"; d="scan'208";a="364094102"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
	by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Mar 2018 17:50:51 +0000
Received: from kamensky-w541.cisco.com ([10.24.22.184]) (authenticated bits=0)
	by rcdn-core-5.cisco.com (8.14.5/8.14.5) with ESMTP id w26HofYo007528
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Tue, 6 Mar 2018 17:50:51 GMT
From: Victor Kamensky <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2018 09:50:39 -0800
Message-Id: <1520358641-7062-4-git-send-email-kamensky@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520358641-7062-1-git-send-email-kamensky@cisco.com>
References: <1520358641-7062-1-git-send-email-kamensky@cisco.com>
X-Authenticated-User: kamensky@cisco.com
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: [RFC PATCH 3/5] image: add IMAGE_GEN_COMBINED_DEBUGFS build option
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
X-List-Received-Date: Tue, 06 Mar 2018 17:51:14 -0000

There is IMAGE_GEN_DEBUGFS="1" variable that enables build of
additional rootfs-dbg and additional archive that contains
complimentary symbols files for a given image. But the issue
with this resulting directory and tarball that before use it
has to be combined with original image content. It is required
since all cross debugging tools like gdb, perf, and systemtap
need file system that contains both target executables/libraries
and their symbols. Those tools need to find executable/library
first and through it debuglink note find corresponding symbols
file.

IMAGE_GEN_DEBUGFS="1" variable as storage strategy may have
some sense it removes duplicate content, but from engineer
work flow point of view it requires extra steps of recombining,
unpacking two tarball archives. I.e there is no directory in
image build workspace that can be used to run gdb, perf, and
systemtap.

In addition to IMAGE_GEN_DEBUGFS variable new variant of
the same functionality IMAGE_GEN_COMBINED_DEBUGFS is introduced.
Unlike IMAGE_GEN_DEBUGFS additional rootfs-dbg and additional
tarball would contain both all target material plus symbols.
Resulting rootfs-dbg directory in build workspace can be
directly used by all cross debugging tools like gdb, perf, and
systemtap.

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
 meta/classes/image-prelink.bbclass | 13 +++++++++
 meta/classes/image.bbclass         | 11 +++++--
 meta/lib/oe/rootfs.py              | 59 +++++++++++++++++++++-----------------
 3 files changed, 55 insertions(+), 28 deletions(-)

diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
index f3bb68b..5470e63 100644
--- a/meta/classes/image-prelink.bbclass
+++ b/meta/classes/image-prelink.bbclass
@@ -35,6 +35,11 @@ prelink_image () {
 
 	dynamic_loader=$(linuxloader)
 
+        if [ "$IMAGE_GEN_COMBINED_DEBUGFS" = "1" ]; then
+                cp ${IMAGE_ROOTFS}${sysconfdir}/prelink.conf ${IMAGE_ROOTFS}-dbg${sysconfdir}/prelink.conf
+                cp ${IMAGE_ROOTFS}${sysconfdir}/ld.so.conf ${IMAGE_ROOTFS}-dbg${sysconfdir}/ld.so.conf
+        fi
+
 	# prelink!
 	if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
 		bbnote " prelink: BUILD_REPRODUCIBLE_BINARIES..."
@@ -44,8 +49,16 @@ prelink_image () {
 			export PRELINK_TIMESTAMP=$REPRODUCIBLE_TIMESTAMP_ROOTFS
 		fi
 		${STAGING_SBINDIR_NATIVE}/prelink --root ${IMAGE_ROOTFS} -am -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
+                if [ "$IMAGE_GEN_COMBINED_DEBUGFS" = "1" ]; then
+                         bbnote " prelink: IMAGE_GEN_COMBINED_DEBUGFS..."
+		         ${STAGING_SBINDIR_NATIVE}/prelink --root ${IMAGE_ROOTFS}-dbg -am -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
+                fi
 	else
 		${STAGING_SBINDIR_NATIVE}/prelink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
+                if [ "$IMAGE_GEN_COMBINED_DEBUGFS" = "1" ]; then
+                         bbnote " prelink: IMAGE_GEN_COMBINED_DEBUGFS..."
+		         ${STAGING_SBINDIR_NATIVE}/prelink --root ${IMAGE_ROOTFS}-dbg -amR -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
+                fi
 	fi
 
 	# Remove the prelink.conf if we had to add it.
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 23ed53d..3d1b9e4 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -28,6 +28,12 @@ IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs empty-root-password
 # Generate companion debugfs?
 IMAGE_GEN_DEBUGFS ?= "0"
 
+# Generate companion combined debugfs? The difference from IMAGE_GEN_DEBUGFS
+# is that in case of IMAGE_GEN_COMBINED_DEBUGFS resulting debufs contains full
+# copy of original symbols plus -dbg packages, whereas in case of IMAGE_GEN_DEBUGFS
+# it contains only -dbg packages
+IMAGE_GEN_COMBINED_DEBUGFS ?= "0"
+
 # rootfs bootstrap install
 ROOTFS_BOOTSTRAP_INSTALL = "run-postinsts"
 
@@ -117,7 +123,7 @@ def rootfs_variables(d):
                  'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS',
                  'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
                  'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
-                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS']
+                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'IMAGE_GEN_COMBINED_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS']
     variables.extend(rootfs_command_variables(d))
     variables.extend(variable_depends(d))
     return " ".join(variables)
@@ -268,6 +274,7 @@ fakeroot python do_image () {
     from oe.utils import execute_pre_post_process
 
     d.setVarFlag('REPRODUCIBLE_TIMESTAMP_ROOTFS', 'export', '1')
+    d.setVarFlag('IMAGE_GEN_COMBINED_DEBUGFS', 'export', '1')
     pre_process_cmds = d.getVar("IMAGE_PREPROCESS_COMMAND")
 
     execute_pre_post_process(d, pre_process_cmds)
@@ -381,7 +388,7 @@ python () {
     alltypes = d.getVar('IMAGE_FSTYPES').split()
     typedeps = {}
 
-    if d.getVar('IMAGE_GEN_DEBUGFS') == "1":
+    if d.getVar('IMAGE_GEN_DEBUGFS') == "1" or d.getVar('IMAGE_GEN_COMBINED_DEBUGFS') == "1" :
         debugfs_fstypes = d.getVar('IMAGE_FSTYPES_DEBUGFS').split()
         for t in debugfs_fstypes:
             alltypes.append("debugfs_" + t)
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index bf2aea2..a2e809a 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -107,7 +107,9 @@ class Rootfs(object, metaclass=ABCMeta):
 
     def _setup_dbg_rootfs(self, dirs):
         gen_debugfs = self.d.getVar('IMAGE_GEN_DEBUGFS') or '0'
-        if gen_debugfs != '1':
+        gen_combined_debugfs = self.d.getVar('IMAGE_GEN_COMBINED_DEBUGFS') or '0'
+
+        if gen_debugfs != '1' and gen_combined_debugfs != '1':
            return
 
         bb.note("  Renaming the original rootfs...")
@@ -118,32 +120,37 @@ class Rootfs(object, metaclass=ABCMeta):
         os.rename(self.image_rootfs, self.image_rootfs + '-orig')
 
         bb.note("  Creating debug rootfs...")
-        bb.utils.mkdirhier(self.image_rootfs)
 
-        bb.note("  Copying back package database...")
-        for dir in dirs:
-            if not os.path.isdir(self.image_rootfs + '-orig' + dir):
-                continue
-            bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(dir))
-            shutil.copytree(self.image_rootfs + '-orig' + dir, self.image_rootfs + dir, symlinks=True)
-
-        cpath = oe.cachedpath.CachedPath()
-        # Copy files located in /usr/lib/debug or /usr/src/debug
-        for dir in ["/usr/lib/debug", "/usr/src/debug"]:
-            src = self.image_rootfs + '-orig' + dir
-            if cpath.exists(src):
-                dst = self.image_rootfs + dir
-                bb.utils.mkdirhier(os.path.dirname(dst))
-                shutil.copytree(src, dst)
-
-        # Copy files with suffix '.debug' or located in '.debug' dir.
-        for root, dirs, files in cpath.walk(self.image_rootfs + '-orig'):
-            relative_dir = root[len(self.image_rootfs + '-orig'):]
-            for f in files:
-                if f.endswith('.debug') or '/.debug' in relative_dir:
-                    bb.utils.mkdirhier(self.image_rootfs + relative_dir)
-                    shutil.copy(os.path.join(root, f),
-                                self.image_rootfs + relative_dir)
+        if gen_combined_debugfs != '1':
+            bb.utils.mkdirhier(self.image_rootfs)
+
+            bb.note("  Copying back package database...")
+            for dir in dirs:
+                if not os.path.isdir(self.image_rootfs + '-orig' + dir):
+                    continue
+                bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(dir))
+                shutil.copytree(self.image_rootfs + '-orig' + dir, self.image_rootfs + dir, symlinks=True)
+
+            cpath = oe.cachedpath.CachedPath()
+            # Copy files located in /usr/lib/debug or /usr/src/debug
+            for dir in ["/usr/lib/debug", "/usr/src/debug"]:
+                src = self.image_rootfs + '-orig' + dir
+                if cpath.exists(src):
+                    dst = self.image_rootfs + dir
+                    bb.utils.mkdirhier(os.path.dirname(dst))
+                    shutil.copytree(src, dst)
+
+            # Copy files with suffix '.debug' or located in '.debug' dir.
+            for root, dirs, files in cpath.walk(self.image_rootfs + '-orig'):
+                relative_dir = root[len(self.image_rootfs + '-orig'):]
+                for f in files:
+                    if f.endswith('.debug') or '/.debug' in relative_dir:
+                        bb.utils.mkdirhier(self.image_rootfs + relative_dir)
+                        shutil.copy(os.path.join(root, f),
+                                    self.image_rootfs + relative_dir)
+        else:
+            bb.note("  Copying back original image...")
+            shutil.copytree(self.image_rootfs + '-orig', self.image_rootfs, symlinks=True)
 
         bb.note("  Install complementary '*-dbg' packages...")
         self.pm.install_complementary('*-dbg')
-- 
2.7.4


