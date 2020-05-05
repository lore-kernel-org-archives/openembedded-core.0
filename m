Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web12.3192.1588661903506234162
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 23:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: AbzbMUE/4zZUZmhC/Vq8ipkKUqQan41RXqTiXt3p4abrShyqWX6fLW1i6+8gBoHpnVkN6xBtEL
 BFIisrcNtryw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:23 -0700
IronPort-SDR: EobC82yVuISxoe821evCfpORgGQVaKJ/UQs4Wuikp7cO9Zhu0N2zkBlk9NYFXbB6BhkWC0vz7Q
 /Yz31gcpBmqg==
X-IronPort-AV: E=Sophos;i="5.73,354,1583222400"; 
   d="scan'208";a="284144797"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.72.16])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:22 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 08/18] cve-update-db-native: clean DB if temporary file exist
Date: Tue,  5 May 2020 14:56:43 +0800
Message-Id: <3f3bdb014cb6d87ee2e22db3c76b99ca6085787a.1588661196.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588661196.git.anuj.mittal@intel.com>
References: <cover.1588661196.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

when do_populate_cve_db forced stop at certain point, the
DB execution are stoped however the temporary database
file (DB-JOURNAL) are not removed. This db-journal file
indicates that DB is incomplete and set DB in readonly
mode. So when db-journal exist, remove both DB and the
db-journal and build the DB again from scratch.

[YOCTO #13682]

(From OE-Core rev: 70713df25b8ae27a21e53b0b9234567d7053800a)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 1b4f31692b..d69d79cb31 100644
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
2.25.4

