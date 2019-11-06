Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD5D7F895
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YI8XShzA0FjpelZ+DPcqRe7psfe++srLUXtyfUNaodY=;
	b=y2f/L0qO7djiz/P9Gga5LRsJ23
	cX/r6kH3bqWBn5W6Avr4kqkXEanTpfukgrQf+gN+lJzaB/QL10hI/gPlvWdyPT7W51lTiUzWhpopT
	A6GWCHScVofh7SH60aSkctrXRepiA8Qda89qk8aeEJiJyOXPSdC3qIYZxwEmfeQWfHweSJ2p86SCE
	b3YjqFtiFOx8EDB/QXtimkXnnOGofzOoeWlOoo+2F9ASsKJjgOc9klPuHXtNbxG9uLllWUN4+YqnM
	Tcopz+Pj0ZhQfR1m4myIYEXJJNMucPurte0HmZIuAQo1tLnA3WrRc3O8szoDI1tlW5ZOS/nQh23Ye
	bVjcJAJA==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOa-0000A1-1q; Wed, 06 Nov 2019 17:38:56 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO5-0007XI-RH; Wed, 06 Nov 2019 17:38:25 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:40 +0200
Message-Id: <487417678e7175395516806742a481b47fd0a151.1573047194.git.mikko.rapeli@bmw.de>
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
	487417678e7175395516806742a481b47fd0a151.1573047194.git.mikko.rapeli@bmw.de
X-Rspam-Status: Yes
X-Rspam-Bar: ++++++
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH RFC CFH][sumo 25/47] cve-update-db-native: improve metadata parsing
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

From: Ross Burton <ross.burton@intel.com>

The metadata parser is fragile: first it coerces a bytes() to a str() (so the
string is b'LastModifiedDate:2019...'), assumes the first line is the date, and
then uses a regex to parse (which then includes the trailing quote as part of
the date).

Clean this up by parsing the bytes as UTF-8 (ASCII is probably fine, but this is
safer), iterate through the lines and split on colons to find the right
key/value pair.

(From OE-Core rev: bb4e53af33d6ca1e9346464adbdc1b39c47530f3)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index a5d8e32..6907197 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -17,7 +17,7 @@ python do_populate_cve_db() {
     Update NVD database with json data feed
     """
 
-    import sqlite3, urllib, shutil, gzip, re
+    import sqlite3, urllib, shutil, gzip
     from datetime import date
 
     BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
@@ -47,13 +47,15 @@ python do_populate_cve_db() {
         req = urllib.request.Request(meta_url)
         if proxy:
             req.set_proxy(proxy, 'https')
-        try:
-            with urllib.request.urlopen(req, timeout=1) as r:
-                date_line = str(r.read().splitlines()[0])
-                last_modified = re.search('lastModifiedDate:(.*)', date_line).group(1)
-        except:
-            cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
-            break
+        with urllib.request.urlopen(req) as r:
+            for l in r.read().decode("utf-8").splitlines():
+                key, value = l.split(":", 1)
+                if key == "lastModifiedDate":
+                    last_modified = value
+                    break
+            else:
+                bb.warn("Cannot parse CVE metadata, update failed")
+                return
 
         # Compare with current db last modified date
         c.execute("select DATE from META where YEAR = ?", (year,))
-- 
1.9.1


