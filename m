Return-Path: <lemagoup@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id C6A737E968
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 14:27:11 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id n4so2796184wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 07:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=13tc/A/Ni7WSXI++E0FoQ6WW2RKXdKZksPEJ0++TxUE=;
	b=cDRTGsgjHb6qhKarSelqcVOaPJkEKB/GhfeopA7wq0puEIyqQOf6LYQBxYeOEmGa/R
	KoSylp63bjhJFS83khf3gcRbxQvA/ZHnGX4sNO8UDkbN2+aLWWqsv0fdawwU2qNnwaeg
	vcNgCmnrBR8LR/ozdyNyYx1eIDs2jrDecOoqIA9ihsi1xZyLkcpUX5XoURClzIDpxK6b
	5v8kqW0K8/RaBWTZARXkl1gIOv2jciEotZ5AnAnRaHPKw7oGe3hW/wMIeFjsIRQQJM5H
	8raO242JlaKjs18h+tVjr4QkGjEdWk8orjNCDEZs0rVpOPWab/0GL2Ml/vNsmEdBaBeY
	Od+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=13tc/A/Ni7WSXI++E0FoQ6WW2RKXdKZksPEJ0++TxUE=;
	b=uZo/XtMBbvsySjeo4BFrfWFV4PB0xW8H8ydztbMYXs2voMW5d4+QPGwBr2NBAtalUO
	cg0SH17fdrfR5yg7C3YPTV5BOH/p45Wl4d3Svb1dQ7EHG7FrxCkR6ayhWaZaeunmnvyn
	Hw+MPeZ27zXKVySNliJXAvuRB6qROboUQyy08v8h0uOwtX2OhJTFTQBfc865JdKX+XKQ
	+rcSgB5LaqUQsCq9Yi21cxPT1/HkEhR4GXznFYzmgx+ZXC3IN8xja3sxV/MfEdX56lRr
	BtZVqcAlYYPoUEtywdvP/QJsn2m+tcO61qJtk6+4yUMtq9PsMo15WhqUk3zjktdf1PWb
	Ce4w==
X-Gm-Message-State: APjAAAWo7ZxpHCV4thuSDJH4VUwJ/xurATNSV6W0U6LZwhLRZs2Ccwyy
	c/KyHKH4XWUSYcG5ONNFBptehaO3
X-Google-Smtp-Source: APXvYqyRaDW+bfx1u/xsZ/eXo3WQklkLHZDLdJvJ8XTRjOkdnPm+iTMmJtNMjBg7uYETx53OjYOsXA==
X-Received: by 2002:adf:f582:: with SMTP id f2mr1104115wro.144.1561645632221; 
	Thu, 27 Jun 2019 07:27:12 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194])
	by smtp.gmail.com with ESMTPSA id l1sm7001887wrf.46.2019.06.27.07.27.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jun 2019 07:27:11 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 16:25:51 +0200
Message-Id: <20190627142551.788-1-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH v4] cve-update-db: do_populate_cve_db depends on do_fetch
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
X-List-Received-Date: Thu, 27 Jun 2019 14:27:12 -0000

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
index 522fd23807..0875c00835 100644
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
+    db_dir = d.getVar("DL_DIR") + '/CVE_CHECK'
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


