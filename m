Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id AD62B7F838
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0+YBdF5TD+c6s0tGVi2dDjgG/WScGQv7sSetV/wURvA=;
	b=1WRmudAjsVkb3f2ofIQ07K1zot
	mPjRtyF+hTGtJh8FStm6Kprp0toNvm2aS1vUxrFg2nZRlwvHMNSfeU0onvtiyzNpQij8aYzIgUhDw
	/SrRFD1ddSPmHhLrOW2XMO7OKY6ePYl4yCS1R7urudqyZjs79EJ06qTCGPhtM8o/7edg+0nE873cZ
	pcg4PgM+OzU9gF030Ld1CXHSY8HKm2cgwVIvkvgN61DbNaRju+9Z8Ltc/gWizLyyI2HUsn9T1lD8P
	9g/sCDbzmUyGBwjhDK98KK3WRpgIpahTZTuKtrRzRKlt2qr4gOP5jUtBi9PQnUljCbgrjegxo8hVJ
	+hAfaDvg==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOE-00009u-Th; Wed, 06 Nov 2019 17:38:35 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO4-0007Ug-LB; Wed, 06 Nov 2019 17:38:24 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:24 +0200
Message-Id: <4fb965e2e77e6bb831328a51af3b0197554e7355.1573047194.git.mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
X-Rspam-Score: 6.0 (++++++)
X-Rspam-Report: Action: add header Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: R_SPF_NEUTRAL(0.00)
	Symbol: FROM_HAS_DN(0.00) Symbol: TO_DN_SOME(0.00)
	Symbol: MULTIPLE_UNIQUE_HEADERS(4.89) Symbol: MIME_GOOD(-0.10)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
	Symbol: RCPT_COUNT_THREE(0.00) Symbol: NEURAL_SPAM(0.00)
	Symbol: RCVD_TLS_LAST(0.00) Symbol: MID_CONTAINS_FROM(1.00)
	Symbol: IP_SCORE(-0.15) Symbol: FORGED_SENDER(0.30)
	Symbol: R_DKIM_NA(0.00) Symbol: MIME_TRACE(0.00)
	Symbol: ASN(0.00) Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf neutral
	Message-ID:
	4fb965e2e77e6bb831328a51af3b0197554e7355.1573047194.git.mikko.rapeli@bmw.de
X-Rspam-Status: Yes
X-Rspam-Bar: ++++++
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH RFC CFH][sumo 09/47] cve-update-db: do_populate_cve_db depends on do_fetch
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
X-List-Received-Date: Wed, 06 Nov 2019 15:38:36 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

To be able to populate NVD database on a fetchall
(bitbake <image> --run-all=fetch), set the do_populate_cve_db task to be
executed before do_fetch.

Do not get CVE_CHECK_DB_DIR, CVE_CHECK_DB_FILE and CVE_CHECK_TMP_FILE
variable because do_populate_cve_db can be called in a context where
cve-check class is not loaded.

(From OE-Core rev: 975793e3825a2a9ca6dc0e43577f680214cb7993)

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/cve-update-db.bb | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db.bb b/meta/recipes-core/meta/cve-update-db.bb
index 4c896dc..3e5bae8 100644
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
1.9.1


