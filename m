Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4E70365CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 22:53:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 09 Nov 2015 14:53:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,267,1444719600"; d="scan'208";a="832148118"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2015 14:53:17 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 22:49:03 +0000
Message-Id: <d3ea1a3288f2d5dbccd4a8604386ff8d689d1591.1447109204.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1447109204.git.alejandro.hernandez@linux.intel.com>
References: <cover.1447109204.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] archiver.bbclass Fixes previous issue regarding work-shared for linux-yocto
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
X-List-Received-Date: Mon, 09 Nov 2015 22:53:21 -0000

A previous patch intended to fix and improve the archiver class, and while it did
for gcc packages, with it some issues ended up being hidden, the kernel tasks taken
from kernel.bbclass and kernel-yocto.bbclass specifically expect the kernel to use
work-shared, which either ended up causing issues or wasting time doing unnecessary work,
this patch fixes these issues by performing the right tasks within the archiver in the right order

[YOCTO #8378]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/classes/archiver.bbclass | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 41a552c..d7a159d 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -203,7 +203,7 @@ def create_tarball(d, srcdir, suffix, ar_outdir):
     import tarfile
 
     # Make sure we are only creating a single tarball for gcc sources
-    if d.getVar('SRC_URI', True) == "" and 'gcc' in d.getVar('PN', True):
+    if (d.getVar('SRC_URI', True) == ""):
         return
 
     bb.utils.mkdirhier(ar_outdir)
@@ -259,22 +259,21 @@ python do_unpack_and_patch() {
     # do_patch required 'B' existed).
     bb.utils.mkdirhier(d.getVar('B', True))
 
-    # The kernel source is ready after do_validate_branches
-    if bb.data.inherits_class('kernel-yocto', d):
-        bb.build.exec_func('do_unpack', d)
-        bb.build.exec_func('do_kernel_checkout', d)
-        bb.build.exec_func('do_validate_branches', d)
-    else:
+    # The kernel class functions require it to be on work-shared, so we dont change WORKDIR
+    if not bb.data.inherits_class('kernel-yocto', d):
+        ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
+        d.setVar('WORKDIR', ar_outdir)
         bb.build.exec_func('do_unpack', d)
 
     # Save the original source for creating the patches
     if d.getVarFlag('ARCHIVER_MODE', 'diff', True) == '1':
         src = d.getVar('S', True).rstrip('/')
         src_orig = '%s.orig' % src
         oe.path.copytree(src, src_orig)
 
-    # Make sure gcc sources are patched only once
-    if not ((d.getVar('SRC_URI', True) == "" and 'gcc' in d.getVar('PN', True))):
+    # Make sure gcc and kernel sources are patched only once
+    if not ((d.getVar('SRC_URI', True) == "" or bb.data.inherits_class('kernel-yocto', d))):
         bb.build.exec_func('do_patch', d)
 
     # Create the patches
@@ -347,6 +346,7 @@ do_deploy_archives[sstate-inputdirs] = "${ARCHIVER_TOPDIR}"
 do_deploy_archives[sstate-outputdirs] = "${DEPLOY_DIR_SRC}"
 
 addtask do_ar_original after do_unpack
+addtask do_unpack_and_patch after do_patch
 addtask do_ar_patched after do_unpack_and_patch
 addtask do_ar_configured after do_unpack_and_patch
 addtask do_dumpdata
@@ -364,6 +364,4 @@ python () {
     # Add tasks in the correct order, specifically for linux-yocto to avoid race condition
     if bb.data.inherits_class('kernel-yocto', d):
         bb.build.addtask('do_kernel_configme', 'do_configure', 'do_unpack_and_patch', d)
-    else:
-        bb.build.addtask('do_unpack_and_patch', None, 'do_patch', d)
 }
-- 
1.8.4.5


