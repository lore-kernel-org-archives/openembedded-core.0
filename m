Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.5257.1588370360310332024
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 14:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=UDcT8ufO;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=4yvm=6p=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49DR3p3cnXz5R
	for <openembedded-core@lists.openembedded.org>; Fri,  1 May 2020 23:59:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1588370358;
	bh=ocztr2xxvF0h2qSpgtDrrhoMJ/1YCjwSR8z0z8vKvWo=;
	h=From:To:Subject:Date:From;
	b=UDcT8ufOJJZkmR9l/UKfSXk9g+jhHu86PsrZPlHA6MthSD7Pg90z1LevsdisdVe0m
	 krQaTTcRWdZGlcyPZavs20XJj6Y3zkb4HfbZKU7Qmtmln4a35E6PFbWIfgB2A4Q1VR
	 UCw0EEw6tAU9zSFfFVh4Ln+t2QNadbCcV6mvkXd2Ny7Vsigl2aUsevw9ZB8hiCDP43
	 1vWwR2I3YOzf2+yotdjZlngCP3L/probz/TpqiJjizuTIjF1Ud4QyI12DwHgYEtHu6
	 Kqk6yAH/N87dArvox1FB9LJsCDVSEkf/0zL0d1BUxiMUBTnW6Gtp9FKzj14U+KJtE3
	 F93H9cUibzEl/DpKIC1KZWzmozHL1lMIsN8AKytPKhsUSdPieZu3YOaI7/rod0gK4e
	 NVOBahnMILugJ8CshBVVIOQ6/tjxW/0Ak2mRZmezt2gKyNSQyN1R4uA0FSVLpRI4ok
	 /eyxLoPS3mDGW/LYf99MrLg5v8Dx2DMBnUuSrJY4w3RdGfJO22lW5xPFhEjWPxxiPH
	 CyRX8PhKKAsXEfyJaBhVXgumM1n98wbc1ITl/MAn9ynceBbWm/zPyEWbAXjVFiOIg8
	 UYkysJNj27OWtJKbySqRdzc4D7An6QVkH3AlBW/WMyXFmlKKLNIbtjEtFUKpCLT/41
	 3OgKgJhFeu4e/uABtNaRZYwU=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH] cve-update-db-native: clean DB if temporary file exist
Date: Sat,  2 May 2020 00:59:17 +0300
Message-Id: <20200501215917.6760-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

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
2.17.1

