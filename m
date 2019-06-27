Return-Path: <lemagoup@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id B33BF7E7D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 14:16:21 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n9so2812384wru.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 07:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=D1khFhnn3QiMRIf9RDvwIqkpTMcKx36OE54zSfCBdV4=;
	b=aEqCMqFUU1vSTmVkYSEmB42ecgKlhxXsKAgeJyp9mDsbQKU02odzpxnbMTUUipqXbQ
	1+8XoU3ptfBHRddx/iOqbZu4rt3T4TWOg4K1OyXWYiiTQoqs0EPfwjkYRWjYHTGSauu/
	t7B8QwUTM91dAPk7Z6JELDnLVQJ3VFkEF/uW1/KBf41I7Rhrf/td0L1SdiePT4PnF078
	+O9LSybUPN1US5lZJMsw3U3T9Cngk82mmLqrkBQo223BVLwEGU7XLkdFpZFWyT/NjvPu
	T0M6D7Bc/RSS99Na38i8f54wv0gQ2MfdhQfwG0VTfWBuPD0bJwC7+8D+qEzQBuU4OQtc
	lCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=D1khFhnn3QiMRIf9RDvwIqkpTMcKx36OE54zSfCBdV4=;
	b=jnvMfMCnasWUhMQgg/3tDeu5gqkhb/u4go3NFg5iezLBUtaBHeIiGRoGaA0DYFqfVk
	o4qVB2RQ5VaCcpo1yKhA3Ykcin8LpgmcOILpKePlrAMWcOFrD/uNy0znn21jPGw4LWjp
	8Hrf24pUv4ZyuWA9L4YG4V1nVtUgxGJSynScNCkBfeiNVpZIubZZf9oaCFCIGNxbJ7Rm
	LHAuyUujFle19xPTQdxAXXpGuYvxYNJryRQYN0AeIewVfloL3t/eh+NfXj8BF7bjR4wu
	u/2VMUB/XTY3wQ8zO7cq5hwZ1/afCFkmtJUgYp3VaZAidUsPRVaHl3bBSh5eCxsa2Fyg
	6v4Q==
X-Gm-Message-State: APjAAAWgxNRDg7C/sAPPwW26RSvUIrSxDidhuGm8B4Czxb5knfFKJEgP
	oXc7RHPTuum7y1Y9znNfZvah55wb
X-Google-Smtp-Source: APXvYqw4UtoEJC5qvcpC4nfx+LDC1j4JDtmJOd1/uMr2EI/aafGCcj5rZ1qqwXcVMS1gKNbkVPnLBA==
X-Received: by 2002:a5d:618d:: with SMTP id j13mr3472632wru.195.1561644981969; 
	Thu, 27 Jun 2019 07:16:21 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194]) by smtp.gmail.com with ESMTPSA id
	n14sm5462529wra.75.2019.06.27.07.16.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jun 2019 07:16:20 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 16:14:45 +0200
Message-Id: <20190627141445.31528-1-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH v3] cve-update-db: do_populate_cve_db depends on do_fetch
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
X-List-Received-Date: Thu, 27 Jun 2019 14:16:21 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

To be able to populate NVD database on a fetchall
(bitbake <image> --run-all=fetch), set the do_populate_cve_db task to be
executed before do_fetch.

Do not get CVE_CHECK_DB_DIR, CVE_CHECK_DB_FILE and CVE_CHECK_TMP_FILE
variable because do_populate_cve_db can be called in a context where
cve-check class is not loaded.

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
---
 meta/recipes-core/meta/cve-update-db.bb | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db.bb b/meta/recipes-core/meta/cve-update-db.bb
index 522fd23807..5c14cf60af 100644
--- a/meta/recipes-core/meta/cve-update-db.bb
+++ b/meta/recipes-core/meta/cve-update-db.bb
@@ -6,7 +6,6 @@ PACKAGES = ""
 
 inherit nopackages
 
-deltask do_fetch
 deltask do_unpack
 deltask do_patch
 deltask do_configure
@@ -24,10 +23,16 @@ python do_populate_cve_db() {
 
     BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
     YEAR_START = 2002
-    JSON_TMPFILE = d.getVar("CVE_CHECK_DB_DIR") + '/nvd.json.gz'
+
+    db_dir = d.getVar("DL_DIR") + 'CVE_CHECK'
+    db_file = db_dir + '/nvd-json.db'
+    json_tmpfile = db_dir + '/nvd.json.gz'
+    proxy = d.getVar("https_proxy")
+
+    if not os.path.isdir(db_dir):
+        os.mkdir(db_dir)
 
     # Connect to database
-    db_file = d.getVar("CVE_CHECK_DB_FILE")
     conn = sqlite3.connect(db_file)
     c = conn.cursor()
 
@@ -50,9 +55,9 @@ python do_populate_cve_db() {
         meta = c.fetchone()
         if not meta or meta[0] != last_modified:
             # Update db with current year json file
-            with http.request('GET', json_url, preload_content=False) as r, open(JSON_TMPFILE, 'wb') as tmpfile:
+            with http.request('GET', json_url, preload_content=False) as r, open(json_tmpfile, 'wb') as tmpfile:
                 shutil.copyfileobj(r, tmpfile)
-            with gzip.open(JSON_TMPFILE, 'rt') as jsonfile:
+            with gzip.open(json_tmpfile, 'rt') as jsonfile:
                 update_db(c, jsonfile)
             c.execute("insert or replace into META values (?, ?)",
                     [year, last_modified])
@@ -60,8 +65,9 @@ python do_populate_cve_db() {
     conn.commit()
     conn.close()
 
-    with open(d.getVar("CVE_CHECK_TMP_FILE"), 'a'):
-        os.utime(d.getVar("CVE_CHECK_TMP_FILE"), None)
+    cve_check_tmp_file =  d.getVar("TMPDIR") + '/cve_check'
+    with open(cve_check_tmp_file, 'a'):
+        os.utime(cve_check_tmp_file, None)
 }
 
 # DJB2 hash algorithm
@@ -115,7 +121,7 @@ def update_db(c, json_filename):
 
 
 
-addtask do_populate_cve_db before do_cve_check
+addtask do_populate_cve_db before do_fetch
 do_populate_cve_db[nostamp] = "1"
 
 EXCLUDE_FROM_WORLD = "1"
-- 
2.11.0


