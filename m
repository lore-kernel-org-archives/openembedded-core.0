Return-Path: <lemagoup@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id F241F7CFA4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 09:35:33 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id v19so1576733wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 02:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1yjP1oGjiA0G/cOWBPjHIu1PcWKqRWTXks5GMlV21bM=;
	b=VHphoVUD8NcdLZ9wvGYtQYSV1I6+7sVioqeO38wWYGcEt53u8P9lQdKdbEnlgZ2Cb6
	pT7epNCIc9B/IMwu0LHb8E8McQCDcUcDC73lPrmlZ9c4G1HgpT1rnLDlmAHsHrZJgL4G
	m7a+nr6xL3fELZbwgMNV360WZmqpKJWo8bo25I4ceXYDRZxzEzIRPPkEbmNJeNZn0P6r
	NDdHiEoEEV8xhZhmt5mqTPrTwr7O/yiS4XL+5A4ByziZYtQFdhF+Oih8Naf+ulgHMBEJ
	kxO9iI84BX/YfLm1dcn8l3vXTrdIcFIHFjpwOnW/5QjgwYA7oTtCXSdpYUpCv9lzuvrZ
	3LeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1yjP1oGjiA0G/cOWBPjHIu1PcWKqRWTXks5GMlV21bM=;
	b=CiI12xORosEz+6W6cjwAqiuey8o5HjnWIB0oaQDOOnQEh2g4Opgb35Bv2edqJQvZAA
	XTJNGa7eFL8UQ5+PWtQz5tmNjipnJBA2zfGgLm2f8jjn6Jl2w1y7j25pk0vBGyT1txz+
	IzU4w7UvxzwoAcoJY3FZmlm7hGlrOQrO699/hVaUUauGqnHG7IpZhQIuTcEa9TjuSgbN
	LIS6lkgKCXHviqJqEQYX13axOZ8mU4XdaKFMEMOQ3HNEcbZs9qAQLZI8dD20Ln0akFHD
	U7vD9dl7YvW/mr2Dv+dgqcOMA2jqVvTLQQiGw+anmZrtzdXZemK8o81axVXf/Rz/1ULk
	hlnw==
X-Gm-Message-State: APjAAAVTpTMu0pZAXVRL6ksVDOiU/aYGOtC1Yk73T/1EaxjoTgl0nKYF
	xuyvmJgllQmMkBPGtN2aP24bUSn1
X-Google-Smtp-Source: APXvYqxplumgfYgyoP4cN3uKiOlz8NrEOJBSb6rlJQaAdpxGjRw8byIz293sTo6kZwx6kVHD1CWsnQ==
X-Received: by 2002:a7b:c313:: with SMTP id k19mr7030998wmj.2.1562146534317;
	Wed, 03 Jul 2019 02:35:34 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194]) by smtp.gmail.com with ESMTPSA id
	f10sm1871997wru.31.2019.07.03.02.35.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jul 2019 02:35:33 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2019 11:35:06 +0200
Message-Id: <20190703093506.8141-1-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] cve-update-db: Catch request.urlopen errors.
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
X-List-Received-Date: Wed, 03 Jul 2019 09:35:34 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

If the NVD url is not accessible, print a warning on top of the CVE
report, and continue. The database will not be fully updated, but
cve_check can still run on the previous database.

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
---
 meta/classes/cve-check.bbclass          |  5 +++--
 meta/recipes-core/meta/cve-update-db.bb | 30 +++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 1e7e8dd441..81071e3f19 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -51,14 +51,15 @@ python do_cve_check () {
     Check recipe for patched and unpatched CVEs
     """
 
-    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE")):
+    if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
         patched_cves = get_patches_cves(d)
         patched, unpatched = check_cves(d, patched_cves)
         if patched or unpatched:
             cve_data = get_cve_info(d, patched + unpatched)
             cve_write_data(d, patched, unpatched, cve_data)
     else:
-        bb.note("Failed to update CVE database, skipping CVE check")
+        bb.note("No CVE database found, skipping CVE check")
+
 }
 
 addtask cve_check after do_unpack before do_build
diff --git a/meta/recipes-core/meta/cve-update-db.bb b/meta/recipes-core/meta/cve-update-db.bb
index 3e5bae8b1d..ae8f1a958b 100644
--- a/meta/recipes-core/meta/cve-update-db.bb
+++ b/meta/recipes-core/meta/cve-update-db.bb
@@ -28,6 +28,7 @@ python do_populate_cve_db() {
     db_file = db_dir + '/nvd-json.db'
     json_tmpfile = db_dir + '/nvd.json.gz'
     proxy = d.getVar("https_proxy")
+    cve_f = open(d.getVar("TMPDIR") + '/cve_check', 'a')
 
     if not os.path.isdir(db_dir):
         os.mkdir(db_dir)
@@ -47,9 +48,13 @@ python do_populate_cve_db() {
         req = urllib.request.Request(meta_url)
         if proxy:
             req.set_proxy(proxy, 'https')
-        with urllib.request.urlopen(req) as r:
-            date_line = str(r.read().splitlines()[0])
-            last_modified = re.search('lastModifiedDate:(.*)', date_line).group(1)
+        try:
+            with urllib.request.urlopen(req, timeout=1) as r:
+                date_line = str(r.read().splitlines()[0])
+                last_modified = re.search('lastModifiedDate:(.*)', date_line).group(1)
+        except:
+            cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
+            break
 
         # Compare with current db last modified date
         c.execute("select DATE from META where YEAR = '%d'" % year)
@@ -59,19 +64,26 @@ python do_populate_cve_db() {
             req = urllib.request.Request(json_url)
             if proxy:
                 req.set_proxy(proxy, 'https')
-            with urllib.request.urlopen(req) as r, open(json_tmpfile, 'wb') as tmpfile:
-                shutil.copyfileobj(r, tmpfile)
+            try:
+                with urllib.request.urlopen(req, timeout=1) as r, \
+                     open(json_tmpfile, 'wb') as tmpfile:
+                    shutil.copyfileobj(r, tmpfile)
+            except:
+                cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
+                break
+
             with gzip.open(json_tmpfile, 'rt') as jsonfile:
                 update_db(c, jsonfile)
             c.execute("insert or replace into META values (?, ?)",
                     [year, last_modified])
 
+        # Update success, set the date to cve_check file.
+        if year == date.today().year:
+            cve_f.write('CVE database update : %s\n\n' % date.today())
+
+    cve_f.close()
     conn.commit()
     conn.close()
-
-    cve_check_tmp_file =  d.getVar("TMPDIR") + '/cve_check'
-    with open(cve_check_tmp_file, 'a'):
-        os.utime(cve_check_tmp_file, None)
 }
 
 # DJB2 hash algorithm
-- 
2.11.0


