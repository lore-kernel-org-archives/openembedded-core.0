Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id B12BD7F841
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BabuYpVGTR6W+8m3XaV/V7s2R5sCJIiU/+NalIkNquc=;
	b=qBDZhd63kDMekzg1Pi+HsePopE
	m4S1dntxJWnGECX7CP2HVnzY4yB8qctCI5yliMqPtPMzPcfFdKqx+gFPF5bs+bolSIpveifZ/NlMJ
	CczIuYGihHYeWp4k1vXVyEQu3Q4j9Y9x2xMs+kc4UGgJp5HhUUe9J7eLpM0NztVqHTl8ww1C8ZBs0
	XAQVIVswqBfBcDxIq1PdDRtCWjJiScrGJN1b1+E7sOKA/WxCUPV3co1C/OvNXGOX0VtiekOimLSBB
	Pn1w1S5JT/MtSZKhnlcMjqg1xTZu6oOGW2SBvEzLGK57XkaRIxwszhfWBNsXF0hKn5wh77e16jjn2
	Eg8W1Mlw==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOE-00009z-UE; Wed, 06 Nov 2019 17:38:35 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO4-0007Um-NX; Wed, 06 Nov 2019 17:38:24 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:25 +0200
Message-Id: <bcbd05ea9c73ee496988ac64d06676548762c1ed.1573047194.git.mikko.rapeli@bmw.de>
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
	Symbol: RCPT_COUNT_THREE(0.00) Symbol: RCVD_TLS_LAST(0.00)
	Symbol: MID_CONTAINS_FROM(1.00) Symbol: NEURAL_HAM(-0.00)
	Symbol: IP_SCORE(-0.15) Symbol: FORGED_SENDER(0.30)
	Symbol: R_DKIM_NA(0.00) Symbol: MIME_TRACE(0.00)
	Symbol: ASN(0.00) Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf neutral
	Message-ID:
	bcbd05ea9c73ee496988ac64d06676548762c1ed.1573047194.git.mikko.rapeli@bmw.de
X-Rspam-Status: Yes
X-Rspam-Bar: ++++++
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH RFC CFH][sumo 10/47] cve-update-db: Catch request.urlopen errors.
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

If the NVD url is not accessible, print a warning on top of the CVE
report, and continue. The database will not be fully updated, but
cve_check can still run on the previous database.

(From OE-Core rev: 0325dd72714f0b447558084f481b77f0ec850eed)

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cve-check.bbclass          |  5 +++--
 meta/recipes-core/meta/cve-update-db.bb | 30 +++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 1e7e8dd..81071e3 100644
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
index 3e5bae8..ae8f1a9 100644
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
1.9.1


