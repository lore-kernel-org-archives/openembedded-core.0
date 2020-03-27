Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.5459.1585281466111879207
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 20:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: GIePVllnq3A5Y+2u86UEP4F18AH85AIhQDwiKNkWPTJ8fGsf8Svlv3vcS6HF1K5Hnbsw4ObidD
 hRRaVf+Ybagg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2020 20:57:45 -0700
IronPort-SDR: pVcw59Z8Rbjw7fs3PjEtnhrIn4SnAihjFaqrtF8zKepthwooXVCcOxQ8KPfQPYtIskgUUhKQFq
 f4QsFXxxwoGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,310,1580803200"; 
   d="scan'208";a="448873404"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga006.fm.intel.com with ESMTP; 26 Mar 2020 20:57:44 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-update-db-native: clean DB if temporary file exist
Date: Fri, 27 Mar 2020 11:57:43 +0800
Message-Id: <1585281463-64878-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4

From: Lee Chee Yang <chee.yang.lee@intel.com>

when do_populate_cve_db forced stop at certain point, the
DB execution are stoped however the temporary database
file (DB-JOURNAL) are not removed. This db-journal file
indicates that DB is incomplete and set DB in readonly
mode. So when db-journal exist, remove both DB and the
db-journal and build the DB again from scratch.

[YOCTO #13682]

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 575254a..a24ddc0 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -13,8 +13,15 @@ deltask do_install
 deltask do_populate_sysroot
 
 python () {
-    if not d.getVar("CVE_CHECK_DB_FILE"):
+    cve_check_db_file = d.getVar("CVE_CHECK_DB_FILE")
+    if not cve_check_db_file:
         raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
+
+    if os.path.exists("%s-journal" % cve_check_db_file ):
+        os.remove("%s-journal" % cve_check_db_file)
+
+        if os.path.exists(cve_check_db_file):
+            os.remove(cve_check_db_file)
 }
 
 python do_populate_cve_db() {
-- 
2.7.4

