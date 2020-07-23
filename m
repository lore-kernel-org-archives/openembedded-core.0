Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.3192.1595466983694827224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 18:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: yUTZMmb05C/XHe+X2eZCXgEvs3do5RJ7czy2fLrMB69/kiwJj9qAtABDBxI17Xm7Xsolm8+7nc
 aK1QBkhbCK0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="149624476"
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; 
   d="scan'208";a="149624476"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2020 18:16:14 -0700
IronPort-SDR: lhdqDNwzUTb5ivS1tjL+x29Imy/sLldIePrAdsQkopoKrvlWW1pFqlMFE/wEMlE3Cp0NLJInma
 IjmBSnQCflfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; 
   d="scan'208";a="488189076"
Received: from andromeda01.png.intel.com (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.10])
  by fmsmga006.fm.intel.com with ESMTP; 22 Jul 2020 18:16:13 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] buildhistory: use pid for temporary txt file name
Date: Thu, 23 Jul 2020 09:16:13 +0800
Message-Id: <20200723011613.63042-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

buildhistory create .txt file bh_installed_pkgs.txt and
bh_installed_pkgs_deps.txt while listing down installed package.
These file is later removed in buildhistory_get_installed().

when multiple process runs in parellal there are chances to race for
the file where one process created the file while another task remove
the file right after it.

using different file name for each process should avoid the race. So
add PID to the file name to make it unique.

[yocto #13709]

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/classes/buildhistory.bbclass | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index a4288ef9e1..805e976ac5 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -429,8 +429,8 @@ def buildhistory_list_installed(d, rootfs_type="image"):
     from oe.sdk import sdk_list_installed_packages
     from oe.utils import format_pkg_list
 
-    process_list = [('file', 'bh_installed_pkgs.txt'),\
-                    ('deps', 'bh_installed_pkgs_deps.txt')]
+    process_list = [('file', 'bh_installed_pkgs_%s.txt' % os.getpid()),\
+                    ('deps', 'bh_installed_pkgs_deps_%s.txt' % os.getpid())]
 
     if rootfs_type == "image":
         pkgs = image_list_installed_packages(d)
@@ -460,9 +460,10 @@ buildhistory_get_installed() {
 
 	# Get list of installed packages
 	pkgcache="$1/installed-packages.tmp"
-	cat ${WORKDIR}/bh_installed_pkgs.txt | sort > $pkgcache && rm ${WORKDIR}/bh_installed_pkgs.txt
+	cat ${WORKDIR}/bh_installed_pkgs_${PID}.txt | sort > $pkgcache && rm ${WORKDIR}/bh_installed_pkgs_${PID}.txt
 
 	cat $pkgcache | awk '{ print $1 }' > $1/installed-package-names.txt
+
 	if [ -s $pkgcache ] ; then
 		cat $pkgcache | awk '{ print $2 }' | xargs -n1 basename > $1/installed-packages.txt
 	else
@@ -471,8 +472,8 @@ buildhistory_get_installed() {
 
 	# Produce dependency graph
 	# First, quote each name to handle characters that cause issues for dot
-	sed 's:\([^| ]*\):"\1":g' ${WORKDIR}/bh_installed_pkgs_deps.txt > $1/depends.tmp &&
-		rm ${WORKDIR}/bh_installed_pkgs_deps.txt
+	sed 's:\([^| ]*\):"\1":g' ${WORKDIR}/bh_installed_pkgs_deps_${PID}.txt > $1/depends.tmp &&
+		rm ${WORKDIR}/bh_installed_pkgs_deps_${PID}.txt
 	# Remove lines with rpmlib(...) and config(...) dependencies, change the
 	# delimiter from pipe to "->", set the style for recommend lines and
 	# turn versioned dependencies into edge labels.
-- 
2.17.1

