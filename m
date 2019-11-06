Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 38AC07F889
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:References:In-Reply-To:Message-Id:Date:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k4MQMpMc0QHdn9nlctlEHw4Xrn9vqeDVwI0xIcK/uqk=;
	b=hcUYAWi9lF2qVK03kQ6FgqVZgJ
	JOWv6CGKiLN44f0VGzUCwDs+3TWzXg6hCeh1nQVNezOVcipNZnCMSTwiprx2/kHoRTU2RRMDmDNIs
	eU67qXbPsEMA3zSVAYmHQHeRyAFez9yUHRVey+LcpZPnz/Wb4j0qNBvVwYM+4/u2xo9SmCiE0JDwG
	uJM22bqeKMxiy1wB/AU4kOgi/ZQOfvc2QBgxV7LoEbwIffGhtjMgRBcGjCNDzQaUah6wlC92qFdl9
	Xq0ox1SNejPb6ZjT+77MHjANjzHyqBatKtXpPmmZ1D50IKjr2GXBOin2W5+YO6ElwnLzfqwxXGLwg
	oRBRvhJg==;
Received: from [2001:67c:1be8::12] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOa-00009s-7b; Wed, 06 Nov 2019 17:38:56 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO5-0007XB-OL; Wed, 06 Nov 2019 17:38:25 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:39 +0200
Message-Id: <45dd5c1feb860bc1153bc0e22b1707b122868eb2.1573047194.git.mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
X-Rspam-Score: 8.3 (++++++++)
X-Rspam-Report: Action: add header Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: FROM_HAS_DN(0.00)
	Symbol: RCPT_COUNT_THREE(0.00) Symbol: R_SPF_ALLOW(-0.20)
	Symbol: MULTIPLE_UNIQUE_HEADERS(4.89) Symbol: MIME_GOOD(-0.10)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00) Symbol: NEURAL_SPAM(0.00)
	Symbol: TO_DN_SOME(0.00) Symbol: RCVD_TLS_LAST(0.00)
	Symbol: MID_CONTAINS_FROM(1.00) Symbol: IP_SCORE(-0.19)
	Symbol: FORGED_SENDER(0.30) Symbol: R_DKIM_NA(0.00)
	Symbol: MIME_TRACE(0.00) Symbol: ASN(0.00)
	Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: HFILTER_HOSTNAME_UNKNOWN(2.50)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf allow
	Message-ID:
	45dd5c1feb860bc1153bc0e22b1707b122868eb2.1573047194.git.mikko.rapeli@bmw.de
X-Rspam-Status: Yes
X-Rspam-Bar: ++++++++
X-SA-Exim-Connect-IP: 2001:67c:1be8::12
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_HELO_NONE,SPF_NEUTRAL,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.2
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Subject: [PATCH RFC CFH][sumo 24/47] cve-update-db-native: use executemany() to optimise CPE insertion
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
X-List-Received-Date: Wed, 06 Nov 2019 15:38:57 -0000

From: Ross Burton <ross.burton@intel.com>

Instead of calling execute() repeatedly, rewrite the function to be a generator
and use executemany() for performance.

(From OE-Core rev: b309840b6aa3423b909a43499356e929c8761318)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 85 ++++++++++----------------
 1 file changed, 32 insertions(+), 53 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 9470cbe..a5d8e32 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -97,70 +97,49 @@ def initialize_db(c):
         VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
         VERSION_END TEXT, OPERATOR_END TEXT)")
 
-def insert_elt(c, db_values):
-    query = "insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)"
-    c.execute(query, db_values)
-
 def parse_node_and_insert(c, node, cveId):
     # Parse children node if needed
-    try:
-        for child in node['children']:
-            parse_node_and_insert(c, child, cveId)
-    except:
-        pass
-
-    # Exit if the cpe_match node does not exists
-    try:
-        cpe_match = node['cpe_match']
-    except:
-        return
-
-    for cpe in cpe_match:
-        if not cpe['vulnerable']:
-            return
-        cpe23 = cpe['cpe23Uri'].split(':')
-        vendor = cpe23[3]
-        product = cpe23[4]
-        version = cpe23[5]
-
-        if version != '*':
-            # Version is defined, this is a '=' match
-            db_values = [cveId, vendor, product, version, '=', '', '']
-            insert_elt(c, db_values)
-        else:
-            # Parse start version, end version and operators
-            op_start = ''
-            op_end = ''
-            v_start = ''
-            v_end = ''
-
-            try:
-                if cpe['versionStartIncluding']:
+    for child in node.get('children', ()):
+        parse_node_and_insert(c, child, cveId)
+
+    def cpe_generator():
+        for cpe in node.get('cpe_match', ()):
+            if not cpe['vulnerable']:
+                return
+            cpe23 = cpe['cpe23Uri'].split(':')
+            vendor = cpe23[3]
+            product = cpe23[4]
+            version = cpe23[5]
+
+            if version != '*':
+                # Version is defined, this is a '=' match
+                yield [cveId, vendor, product, version, '=', '', '']
+            else:
+                # Parse start version, end version and operators
+                op_start = ''
+                op_end = ''
+                v_start = ''
+                v_end = ''
+
+                if 'versionStartIncluding' in cpe:
                     op_start = '>='
                     v_start = cpe['versionStartIncluding']
-            except:
-                pass
-            try:
-                if cpe['versionStartExcluding']:
+
+                if 'versionStartExcluding' in cpe:
                     op_start = '>'
                     v_start = cpe['versionStartExcluding']
-            except:
-                pass
-            try:
-                if cpe['versionEndIncluding']:
+
+                if 'versionEndIncluding' in cpe:
                     op_end = '<='
                     v_end = cpe['versionEndIncluding']
-            except:
-                pass
-            try:
-                if cpe['versionEndExcluding']:
+
+                if 'versionEndExcluding' in cpe:
                     op_end = '<'
                     v_end = cpe['versionEndExcluding']
-            except:
-                pass
 
-            db_values = [cveId, vendor, product, v_start, op_start, v_end, op_end]
-            insert_elt(c, db_values)
+                yield [cveId, vendor, product, v_start, op_start, v_end, op_end]
+
+    c.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", cpe_generator())
 
 def update_db(c, json_filename):
     import json
-- 
1.9.1


