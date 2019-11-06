Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5FC7F899
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uGziAfjOSxnkNrexjZ/jkqOxvYb38GQuJYlUjrRSyek=;
	b=jGU/z9yR0QulafT0bJwt4k82UO
	c+50TUSHDhxc+deOgxsMVyVLNPN2gXVqv5rekTakhzEUKaQL4ZFATrdark77hWzIkMua1fmoi3tmR
	YWsQo6x58n6vtBJPoa2oEfrmhCSno8LZsI9N+/5pH7P7WA4G75x5G2Z2AyRQ2FL0aC4Y/pIghzenl
	jHICUY06yTFkeSnFURdoAurT2RLIDE/L2x9ZqY0DL264L8+PB//L6UGoH+oeA6ZHtkLSlnZz9CaX7
	d4QGZrkD77Um2vatzKeyW/4a3KtP5KmlbtsNWYvlfdaNSGA5xP4TT4DY/UpSwyrcZvaNVLwkF/r/+
	OQES51Bg==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOa-0000AC-1n; Wed, 06 Nov 2019 17:38:56 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO5-0007XP-TV; Wed, 06 Nov 2019 17:38:25 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:41 +0200
Message-Id: <311cfe9aa30c7d4a9476dec12769d2c4290f5a91.1573047194.git.mikko.rapeli@bmw.de>
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
	311cfe9aa30c7d4a9476dec12769d2c4290f5a91.1573047194.git.mikko.rapeli@bmw.de
X-Rspam-Status: Yes
X-Rspam-Bar: ++++++
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH RFC CFH][sumo 26/47] cve-update-db-native: clean up JSON fetching
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

Currently the code fetches the compressed JSON, writes it to a temporary file,
uncompresses that with gzip and passes the fake file object to update_db().

Instead, uncompress the gzip'd data in memory and pass the JSON directly to
update_db().

(From OE-Core rev: 9422745979256c442f533770203f62ec071c18fb)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 29 +++++++++++---------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 6907197..a06b74a 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -62,25 +62,20 @@ python do_populate_cve_db() {
         meta = c.fetchone()
         if not meta or meta[0] != last_modified:
             # Clear products table entries corresponding to current year
-            cve_year = 'CVE-' + str(year) + '%'
-            c.execute("delete from PRODUCTS where ID like ?", (cve_year,))
+            c.execute("delete from PRODUCTS where ID like ?", ('CVE-%d%%' % year,))
 
             # Update db with current year json file
-            req = urllib.request.Request(json_url)
-            if proxy:
-                req.set_proxy(proxy, 'https')
             try:
-                with urllib.request.urlopen(req, timeout=1) as r, \
-                     open(json_tmpfile, 'wb') as tmpfile:
-                    shutil.copyfileobj(r, tmpfile)
-            except:
+                req = urllib.request.Request(json_url)
+                if proxy:
+                    req.set_proxy(proxy, 'https')
+                with urllib.request.urlopen(req) as r:
+                    update_db(c, gzip.decompress(r.read()))
+                c.execute("insert or replace into META values (?, ?)", [year, last_modified])
+            except urllib.error.URLError as e:
                 cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
-                break
-
-            with gzip.open(json_tmpfile, 'rt') as jsonfile:
-                update_db(c, jsonfile)
-            c.execute("insert or replace into META values (?, ?)",
-                    [year, last_modified])
+                bb.warn("Cannot parse CVE data (%s), update failed" % e.reason)
+                return
 
         # Update success, set the date to cve_check file.
         if year == date.today().year:
@@ -143,9 +138,9 @@ def parse_node_and_insert(c, node, cveId):
 
     c.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", cpe_generator())
 
-def update_db(c, json_filename):
+def update_db(c, jsondata):
     import json
-    root = json.load(json_filename)
+    root = json.loads(jsondata)
 
     for elt in root['CVE_Items']:
         if not elt['impact']:
-- 
1.9.1


