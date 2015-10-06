Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 895BA600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 23:08:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 06 Oct 2015 16:08:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,646,1437462000"; d="scan'208";a="786162249"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga001.jf.intel.com with ESMTP; 06 Oct 2015 16:08:09 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Oct 2015 23:05:09 +0000
Message-Id: <ae731b150c8613e7fa468c918e5de6096b3a8230.1444172541.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1444172541.git.alejandro.hernandez@linux.intel.com>
References: <cover.1444172541.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH v2 1/1] archiver.bbclass: Fixes and improves archiver class for kernel and gcc packages
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
X-List-Received-Date: Tue, 06 Oct 2015 23:08:14 -0000

gcc packages use a shared source directory, this causes an issue since the archiver will
try to patch the same source several times (one for each gcc package), producing an error,
the archiver class used stamp-base to check this, nonetheless our gcc packages no longer
use stamp-base, they use gcc-shared instead, which is what broke this functionality.
This patch adds a check to see whether or not the source should be patched,
avoiding patching the source when it shouldn't.

Also, we dont need to create multiple identical tarballs for all gcc packages,
this patch fixes this and creates a single source tarball for gcc.

When requesting patched sources, a race condition is created for linux-yocto tasks,
unpack_and_patch is executed along with kernel_configme, which most of the time
causes errors during configure, since kernel_configme task is specific to the kernel,
simply modifying the tasks order by creating a dependency to kernel_configme was impossible,
causing errors on all other packages that didnt use kernel_configme, this is fixed by
creating a special case for the kernel, adding tasks with correct dependencies,
avoiding the race condition and behaving the way it should for all other packages as well.

[YOCTO #8378]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/classes/archiver.bbclass | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index eec8024..41a552c 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -157,7 +157,7 @@ python do_ar_patched() {
     # Get the ARCHIVER_OUTDIR before we reset the WORKDIR
     ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
     bb.note('Archiving the patched source...')
-    d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR', True))
+    d.setVar('WORKDIR', ar_outdir)
     create_tarball(d, d.getVar('S', True), 'patched', ar_outdir)
 }
 
@@ -202,6 +202,10 @@ def create_tarball(d, srcdir, suffix, ar_outdir):
     """
     import tarfile
 
+    # Make sure we are only creating a single tarball for gcc sources
+    if d.getVar('SRC_URI', True) == "" and 'gcc' in d.getVar('PN', True):
+        return
+
     bb.utils.mkdirhier(ar_outdir)
     tarname = os.path.join(ar_outdir, '%s-%s.tar.gz' % \
             (d.getVar('PF', True), suffix))
@@ -246,11 +250,9 @@ python do_unpack_and_patch() {
             [ 'patched', 'configured'] and \
             d.getVarFlag('ARCHIVER_MODE', 'diff', True) != '1':
         return
-
-    ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
-
     # Change the WORKDIR to make do_unpack do_patch run in another dir.
-    d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR', True))
+    ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
+    d.setVar('WORKDIR', ar_outdir)
 
     # The changed 'WORKDIR' also casued 'B' changed, create dir 'B' for the
     # possibly requiring of the following tasks (such as some recipes's
@@ -270,7 +272,11 @@ python do_unpack_and_patch() {
         src = d.getVar('S', True).rstrip('/')
         src_orig = '%s.orig' % src
         oe.path.copytree(src, src_orig)
-    bb.build.exec_func('do_patch', d)
+
+    # Make sure gcc sources are patched only once
+    if not ((d.getVar('SRC_URI', True) == "" and 'gcc' in d.getVar('PN', True))):
+        bb.build.exec_func('do_patch', d)
+
     # Create the patches
     if d.getVarFlag('ARCHIVER_MODE', 'diff', True) == '1':
         bb.note('Creating diff gz...')
@@ -341,7 +347,6 @@ do_deploy_archives[sstate-inputdirs] = "${ARCHIVER_TOPDIR}"
 do_deploy_archives[sstate-outputdirs] = "${DEPLOY_DIR_SRC}"
 
 addtask do_ar_original after do_unpack
-addtask do_unpack_and_patch after do_patch
 addtask do_ar_patched after do_unpack_and_patch
 addtask do_ar_configured after do_unpack_and_patch
 addtask do_dumpdata
@@ -354,3 +359,11 @@ do_deploy_all_archives[recideptask] = "do_${BB_DEFAULT_TASK}"
 do_deploy_all_archives() {
         :
 }
+
+python () {
+    # Add tasks in the correct order, specifically for linux-yocto to avoid race condition
+    if bb.data.inherits_class('kernel-yocto', d):
+        bb.build.addtask('do_kernel_configme', 'do_configure', 'do_unpack_and_patch', d)
+    else:
+        bb.build.addtask('do_unpack_and_patch', None, 'do_patch', d)
+}
-- 
1.8.4.5


