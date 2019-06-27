Return-Path: <lemagoup@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9C3BF7E95A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 14:59:31 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f15so2974237wrp.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 07:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ILr3kdPfSqgWxPlVA19ZQjyFB8vW2+5BfRnShqp7kjM=;
	b=ZC3jKlS50X5eDZxjScMNboOCtXwNPtQJbePBfNIQHqQtfdQQF9ykm3EVjmLj7J7J7U
	b9AdrVMw6NywZOc437sdvZ6WUSph4lBP9Ki3hBQMjoNXM45hCnTfIYhTvGMFzWZi1NzO
	laEq847+orS0NKFHl6IU/hzw1bujbhG0VQmyRDZ1JOpjSfiLF+5YbZhQaZ8K9UT1RKmV
	msN8NRQVQjJy9TVZnK6F4cH/cF0csyf6csWC3fzsLVKNlT11lu+itpcmg19SY+77AoY4
	lFtaDw21IGcpkNktOnSV/6fy5NsqlGgNHLJVl2mDYvUej61OfmSgeLbm0Gy96/5v2xMr
	00Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ILr3kdPfSqgWxPlVA19ZQjyFB8vW2+5BfRnShqp7kjM=;
	b=j2luntOYtcaeySmzrWMeJLW8GIqU/xxl9OO1Hsm5+1i/osKPWEJrsnmuPyUclMuGYT
	0ZkP+tUTzMpLdXR56nAGRMUAxp0WJ6dbtp8JaXPO0S2hMKXCpVwr3m38+hF8nr7NT3gT
	G9UnNppa1Yc2Iv11KP7YMpoBgvpLmfCoSw/lgNkoLBPD8C4v7nbueDm2rfPXvo1i4TLh
	ap3pCDDbMclA/UOgV7tccjZ7piE3fvfy5a8qsXfod82nwyk65neYcVERAChfIfTWPifm
	dvl2TpPKuRpeZKdmrKcrcerjwS4P7Rs1OwEH/uRsvc/sl9+1AmtIuZgCV3DS3ZeYSrBk
	xibA==
X-Gm-Message-State: APjAAAW88HkQHzCj+x3z8iVPqXATYll8rAIG0R8YYEfEOIcS2ZFYkLpB
	lAu8amUvTlu2djLNE6uhQT3ZGath
X-Google-Smtp-Source: APXvYqzqZ6Kfj8UblMqBX/T6PRPbqIP8z3zZ8ENNekdkxEggJYmqwoc/caII8CfyQH/8+kxmFsnjjA==
X-Received: by 2002:a5d:65c5:: with SMTP id e5mr3960865wrw.266.1561647571816; 
	Thu, 27 Jun 2019 07:59:31 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194]) by smtp.gmail.com with ESMTPSA id
	j189sm7195103wmb.48.2019.06.27.07.59.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jun 2019 07:59:30 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 16:59:17 +0200
Message-Id: <20190627145917.1774-1-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH v5] cve-update-db: do_populate_cve_db depends on do_fetch
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
X-List-Received-Date: Thu, 27 Jun 2019 14:59:31 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

To be able to populate NVD database on a fetchall
(bitbake <image> --run-all=fetch), set the do_populate_cve_db task to be
executed before do_fetch.

Do not get CVE_CHECK_DB_DIR, CVE_CHECK_DB_FILE and CVE_CHECK_TMP_FILE
variable because do_populate_cve_db can be called in a context where
cve-check class is not loaded.

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
---
 meta/recipes-core/meta/cve-update-db.bb | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db.bb b/meta/recipes-core/meta/cve-update-db.bb
index 4c896dc880..3e5bae8b1d 100644
--- a/meta/recipes-core/meta/cve-update-db.bb
+++ b/meta/recipes-core/meta/cve-update-db.bb
@@ -6,7 +6,6 @@ PACKAGES = ""
 
 inherit nopackages
 
-deltask do_fetch
 deltask do_unpack
 deltask do_patch
 deltask do_configure
@@ -24,11 +23,16 @@ python do_populate_cve_db() {
 
     BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
     YEAR_START = 2002
-    JSON_TMPFILE = d.getVar("CVE_CHECK_DB_DIR") + '/nvd.json.gz'
+
+    db_dir = d.getVar("DL_DIR") + '/CVE_CHECK'
+    db_file = db_dir + '/nvd-json.db'
+    json_tmpfile = db_dir + '/nvd.json.gz'
     proxy = d.getVar("https_proxy")
 
+    if not os.path.isdir(db_dir):
+        os.mkdir(db_dir)
+
     # Connect to database
-    db_file = d.getVar("CVE_CHECK_DB_FILE")
     conn = sqlite3.connect(db_file)
     c = conn.cursor()
 
@@ -55,9 +59,9 @@ python do_populate_cve_db() {
             req = urllib.request.Request(json_url)
             if proxy:
                 req.set_proxy(proxy, 'https')
-            with urllib.request.urlopen(req) as r, open(JSON_TMPFILE, 'wb') as tmpfile:
+            with urllib.request.urlopen(req) as r, open(json_tmpfile, 'wb') as tmpfile:
                 shutil.copyfileobj(r, tmpfile)
-            with gzip.open(JSON_TMPFILE, 'rt') as jsonfile:
+            with gzip.open(json_tmpfile, 'rt') as jsonfile:
                 update_db(c, jsonfile)
             c.execute("insert or replace into META values (?, ?)",
                     [year, last_modified])
@@ -65,8 +69,9 @@ python do_populate_cve_db() {
     conn.commit()
     conn.close()
 
-    with open(d.getVar("CVE_CHECK_TMP_FILE"), 'a'):
-        os.utime(d.getVar("CVE_CHECK_TMP_FILE"), None)
+    cve_check_tmp_file =  d.getVar("TMPDIR") + '/cve_check'
+    with open(cve_check_tmp_file, 'a'):
+        os.utime(cve_check_tmp_file, None)
 }
 
 # DJB2 hash algorithm
@@ -120,7 +125,7 @@ def update_db(c, json_filename):
 
 
 
-addtask do_populate_cve_db before do_cve_check
+addtask do_populate_cve_db before do_fetch
 do_populate_cve_db[nostamp] = "1"
 
 EXCLUDE_FROM_WORLD = "1"
-- 
2.11.0


