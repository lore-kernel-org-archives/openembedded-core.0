Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4D6D360088
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 19:24:18 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jun 2015 12:24:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,379,1432623600"; d="scan'208";a="516755721"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jun 2015 12:24:13 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2015 11:19:40 +0000
Message-Id: <1435663180-43011-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] buildhistory.bbclass: Check output folder is present before creating files-in-$pkg.txt
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
X-List-Received-Date: Tue, 30 Jun 2015 19:24:20 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

This is just a safe check to make sure the output folder is present, before
creating the files-in-$pkg.txt file.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 8fc8a3a..cad5116 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -444,7 +444,13 @@ buildhistory_list_pkg_files() {
         # Create individual files-in-package for each recipe's package
         for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
                 pkgname=$(basename ${pkgdir})
-                outfile="${BUILDHISTORY_DIR_PACKAGE}/${pkgname}/${file_prefix}${pkgname}.txt"
+                outfolder="${BUILDHISTORY_DIR_PACKAGE}/${pkgname}"
+                outfile="${outfolder}/${file_prefix}${pkgname}.txt"
+                # Make sure the output folder, exist so we can create the files-in-$pkgname.txt file
+                if [ ! -d ${outfolder} ] ; then
+                        bbdebug 2 "Folder ${outfolder} does not exist, file ${outfile} not created"
+                        continue
+                fi
                 buildhistory_list_files ${pkgdir} ${outfile}
         done
 }
-- 
1.8.4.5


