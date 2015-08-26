Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0905776DC5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 14:17:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2015 07:17:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,416,1437462000"; d="scan'208";a="776041397"
Received: from tlomotow-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.18.45])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2015 07:17:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 15:17:16 +0100
Message-Id: <bf9a233322a901e6607cfc75d8833918b26bbf80.1440598330.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1440598330.git.paul.eggleton@linux.intel.com>
References: <cover.1440598330.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1440598330.git.paul.eggleton@linux.intel.com>
References: <cover.1440598330.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/8] classes/buildhistory: tweak buildhistory_list_pkg_files
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
X-List-Received-Date: Wed, 26 Aug 2015 14:17:46 -0000

* Avoid using ${...} for shell variables (since they could be
  expanded as bitbake variables if present)
* Use files-in-package.txt rather than files-in-<packagename>.txt; the
  file is already in a subdirectory named with the package name and this
  naming is consistent with that of files-in-image.txt.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 054a81f..3d459c7 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -439,16 +439,14 @@ buildhistory_list_files() {
 }
 
 buildhistory_list_pkg_files() {
-	file_prefix="files-in-"
-
 	# Create individual files-in-package for each recipe's package
 	for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
-		pkgname=$(basename ${pkgdir})
-		outfolder="${BUILDHISTORY_DIR_PACKAGE}/${pkgname}"
-		outfile="${outfolder}/${file_prefix}${pkgname}.txt"
-		# Make sure the output folder, exist so we can create the files-in-$pkgname.txt file
-		if [ ! -d ${outfolder} ] ; then
-			bbdebug 2 "Folder ${outfolder} does not exist, file ${outfile} not created"
+		pkgname=$(basename $pkgdir)
+		outfolder="${BUILDHISTORY_DIR_PACKAGE}/$pkgname"
+		outfile="$outfolder/files-in-package.txt"
+		# Make sure the output folder exists so we can create the file
+		if [ ! -d $outfolder ] ; then
+			bbdebug 2 "Folder $outfolder does not exist, file $outfile not created"
 			continue
 		fi
 		buildhistory_list_files ${pkgdir} ${outfile}
-- 
2.1.0


