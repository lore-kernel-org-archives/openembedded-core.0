Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 235C073C63
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 21:51:18 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 25 Jun 2015 14:51:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,680,1427785200"; d="scan'208";a="514338992"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jun 2015 14:51:19 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jun 2015 13:46:47 +0000
Message-Id: <1435240007-1878-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Cc: swg@linux.intel.com
Subject: [PATCH] buildhistory.bbclass: Create a files-in-<pkg>.txt containg recipe's pkg files
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
X-List-Received-Date: Thu, 25 Jun 2015 21:51:21 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

A file similar (in format) to files-in-image.txt is created for each
recipe's build package. This would allow to easily see what the
recipe's package may install when including it into an image.

These files reside on the specific buildhistory recipe package (i.e.
buildhistory/packages/i586-poky-linux/busybox/busybox-dev/files-in-busybox-dev.txt
for busybox-dev package)

[YOCTO #5870]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 777aabc..8fc8a3a 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -242,6 +242,9 @@ python buildhistory_emit_pkghistory() {
         pkginfo.size = int(pkgdata['PKGSIZE'])
 
         write_pkghistory(pkginfo, d)
+
+    # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
+    bb.build.exec_func("buildhistory_list_pkg_files", d)
 }
 
 
@@ -435,6 +438,16 @@ buildhistory_list_files() {
 	( cd $1 && find . -printf "%M %-10u %-10g %10s %p -> %l\n" | sort -k5 | sed 's/ * -> $//' > $2 )
 }
 
+buildhistory_list_pkg_files() {
+        file_prefix="files-in-"
+
+        # Create individual files-in-package for each recipe's package
+        for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
+                pkgname=$(basename ${pkgdir})
+                outfile="${BUILDHISTORY_DIR_PACKAGE}/${pkgname}/${file_prefix}${pkgname}.txt"
+                buildhistory_list_files ${pkgdir} ${outfile}
+        done
+}
 
 buildhistory_get_imageinfo() {
 	if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'image', '1', '0', d)}" = "0" ] ; then
-- 
1.8.4.5


