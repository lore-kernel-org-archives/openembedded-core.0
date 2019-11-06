Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id B1B5D7F8AF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9rpowhjnoD8oVkodDB29oLD79JdOQ2krwLcmoPyyGPE=;
	b=Z5VoYEvV5nv4U2aNWzP7AI7wPl
	10wU0PLt1Kxq21yf5hXTx9TKFu4mPWR3cFMQ7imQIYjqF4ab24mZMEys7oMWf2jReGtHMeQmeAmZc
	qT6Eo5+WwIzytrUvYmCxTru9FU8BhZxVMMSzEoK4kl+6mMurQDl+Rld5pINFPBHwbim6iYS47Zpu2
	aoVpNF8ZpSaKpcKYn7v79bKcN96Wu2Qn/A+ojCkVr5okH+6xIml2fWV5NTPf3Rb25bz9BKXZYT6Xu
	NWpDYn4iTrc5FoHEy6jtVo/yN55ha8ez8PtCJut90XubVzOAg1PrfMnYcsa9jVNW3apiuBcJ9C0BF
	n1Sy7h8Q==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOa-00009u-1g; Wed, 06 Nov 2019 17:38:56 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO6-0007XV-0S; Wed, 06 Nov 2019 17:38:26 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:42 +0200
Message-Id: <487a87e89e7dba681e17dc7ac56e3c17c365560e.1573047194.git.mikko.rapeli@bmw.de>
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
	487a87e89e7dba681e17dc7ac56e3c17c365560e.1573047194.git.mikko.rapeli@bmw.de
X-Rspam-Status: Yes
X-Rspam-Bar: ++++++
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH RFC CFH][sumo 27/47] cve-update-db-native: fix https proxy issues
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
X-List-Received-Date: Wed, 06 Nov 2019 15:38:56 -0000

From: Chin Huat Ang <chin.huat.ang@intel.com>

When https_proxy is set, use proxy opener to open CVE metadata and
database URLs, otherwise fallback to the urllib.request.urlopen.

Also fix a minor issue where the json database which has been gzip
decompressed as byte object should be decoded as utf-8 string as
expected by update_db.

(From OE-Core rev: 95438d52b732bec217301fbfc2fb019bbc3707c8)

Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 41 +++++++++++++++++++-------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index a06b74a..9fbe686 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -17,7 +17,7 @@ python do_populate_cve_db() {
     Update NVD database with json data feed
     """
 
-    import sqlite3, urllib, shutil, gzip
+    import sqlite3, urllib, urllib.parse, shutil, gzip
     from datetime import date
 
     BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
@@ -27,6 +27,16 @@ python do_populate_cve_db() {
     db_file = os.path.join(db_dir, 'nvdcve_1.0.db')
     json_tmpfile = os.path.join(db_dir, 'nvd.json.gz')
     proxy = d.getVar("https_proxy")
+
+    if proxy:
+        # instantiate an opener but do not install it as the global
+        # opener unless if we're really sure it's applicable for all
+        # urllib requests
+        proxy_handler = urllib.request.ProxyHandler({'https': proxy})
+        proxy_opener = urllib.request.build_opener(proxy_handler)
+    else:
+        proxy_opener = None
+
     cve_f = open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a')
 
     if not os.path.isdir(db_dir):
@@ -44,11 +54,17 @@ python do_populate_cve_db() {
         json_url = year_url + ".json.gz"
 
         # Retrieve meta last modified date
-        req = urllib.request.Request(meta_url)
-        if proxy:
-            req.set_proxy(proxy, 'https')
-        with urllib.request.urlopen(req) as r:
-            for l in r.read().decode("utf-8").splitlines():
+
+        response = None
+
+        if proxy_opener:
+            response = proxy_opener.open(meta_url)
+        else:
+            req = urllib.request.Request(meta_url)
+            response = urllib.request.urlopen(req)
+
+        if response:
+            for l in response.read().decode("utf-8").splitlines():
                 key, value = l.split(":", 1)
                 if key == "lastModifiedDate":
                     last_modified = value
@@ -66,11 +82,14 @@ python do_populate_cve_db() {
 
             # Update db with current year json file
             try:
-                req = urllib.request.Request(json_url)
-                if proxy:
-                    req.set_proxy(proxy, 'https')
-                with urllib.request.urlopen(req) as r:
-                    update_db(c, gzip.decompress(r.read()))
+                if proxy_opener:
+                    response = proxy_opener.open(json_url)
+                else:
+                    req = urllib.request.Request(json_url)
+                    response = urllib.request.urlopen(req)
+
+                if response:
+                    update_db(c, gzip.decompress(response.read()).decode('utf-8'))
                 c.execute("insert or replace into META values (?, ?)", [year, last_modified])
             except urllib.error.URLError as e:
                 cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
-- 
1.9.1


