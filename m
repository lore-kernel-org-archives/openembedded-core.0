Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 57EEC7E504
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 10:42:57 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n4so13300937wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=3XYrAvbD5wx2XwX7bjlTgr2FwPFHEqdslufpqwYEgRE=;
	b=rvUUhD2iUCG4xoMcbjGpQD+Ursm89LqmzqTp93o2CshPAUJMmMyrgfPxtvF+Ozebyu
	UbZiJzyboHtc31aVokJkDcOXzkfIHKAuu5HNjIZIc70HUnN4M+bq5dh9pQUtzkMgvt+m
	sJhPv+xVihmUk8CrhM2khGc0SN73J+ngwbB/XjHfpkYWIdTQZAldhZ2OkbEV+3/gXTHB
	ZC1PIY2uHBvQDF8nIEuNtC5cjUFWPMjOZkOaKo4WljIvrrcoBtzhz/dOhdK1cNwA462S
	ztZ41Q3SIVCwUsQvMY4Km2kCLWwXBQK6b6fS6+E0vldiDLKdfE9t29n7Ms4zl+azeGFz
	58eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3XYrAvbD5wx2XwX7bjlTgr2FwPFHEqdslufpqwYEgRE=;
	b=QWbT/5nm4U9srYCpeZTMCRvVwHZ5DBrFKIOzmW3cWzpk7hm2jO2GwccFOvVLECFkGA
	pfRbRUEacSWOQqtD7QQw7bY3TVYyYe+Vrwv8XzSQ8OazTO16vlq4P7ryAjbmUzmm9HXq
	zWVdM6aK1jnX+pxJxK+wjr756meFVT6LaBQW6jWDrY6rchx10Ojq2oDH3+Jx4/MC4v/6
	guciGwYZpCtMu9qB02Qy1tV6fxnxg03iZbhG8WpnlMeFlAWmcx3Eq3Iaq8XxoimgGLqK
	Y4nkT+NCl7hxycf/j5m9wpvxrJFvFLuiwhOEEo1BKFrxFic7pf50zfLZzuWYuJjkphie
	6K1w==
X-Gm-Message-State: APjAAAUs5B9sHXPDAvaYIjb0huoepbx9FKM/hIaep5Dw+vwffMqwdkJ4
	pyr986mdoOaRikP4e9SINvuR2tY1gG0=
X-Google-Smtp-Source: APXvYqxhgM0Pbm8nz542tdH/uYLlOnPpAeP2rSCWzuqcJxlpZNn8EsIB+Y+Kdo5OsOb2vjeJNvAJNw==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr16199923wrn.281.1561372977650; 
	Mon, 24 Jun 2019 03:42:57 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o126sm12827381wmo.1.2019.06.24.03.42.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jun 2019 03:42:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jun 2019 11:42:55 +0100
Message-Id: <20190624104255.5544-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] cve-check: be idiomatic
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
X-List-Received-Date: Mon, 24 Jun 2019 10:42:57 -0000

Instead of generating a series of indexes via range(len(list)), just iterate the
list.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cve-check.bbclass | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 379f7121cc1..1e7e8dd4413 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -170,18 +170,19 @@ def check_cves(d, patched_cves):
 
     cves_unpatched = []
     # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
-    bpn = d.getVar("CVE_PRODUCT").split()
+    products = d.getVar("CVE_PRODUCT").split()
     # If this has been unset then we're not scanning for CVEs here (for example, image recipes)
-    if len(bpn) == 0:
+    if not products:
         return ([], [])
     pv = d.getVar("CVE_VERSION").split("+git")[0]
-    cve_whitelist = ast.literal_eval(d.getVar("CVE_CHECK_CVE_WHITELIST"))
 
     # If the recipe has been whitlisted we return empty lists
     if d.getVar("PN") in d.getVar("CVE_CHECK_PN_WHITELIST").split():
         bb.note("Recipe has been whitelisted, skipping check")
         return ([], [])
 
+    cve_whitelist = ast.literal_eval(d.getVar("CVE_CHECK_CVE_WHITELIST"))
+
     import sqlite3
     db_file = d.getVar("CVE_CHECK_DB_FILE")
     conn = sqlite3.connect(db_file)
@@ -190,8 +191,8 @@ def check_cves(d, patched_cves):
     query = """SELECT * FROM PRODUCTS WHERE
                (PRODUCT IS '{0}' AND VERSION = '{1}' AND OPERATOR IS '=') OR
                (PRODUCT IS '{0}' AND OPERATOR IS '<=');"""
-    for idx in range(len(bpn)):
-        for row in c.execute(query.format(bpn[idx],pv)):
+    for product in products:
+        for row in c.execute(query.format(product, pv)):
             cve = row[1]
             version = row[4]
 
@@ -200,15 +201,15 @@ def check_cves(d, patched_cves):
             except:
                 discardVersion = True
 
-            if pv in cve_whitelist.get(cve,[]):
-                bb.note("%s-%s has been whitelisted for %s" % (bpn[idx], pv, cve))
+            if pv in cve_whitelist.get(cve, []):
+                bb.note("%s-%s has been whitelisted for %s" % (product, pv, cve))
             elif cve in patched_cves:
                 bb.note("%s has been patched" % (cve))
             elif discardVersion:
                 bb.debug(2, "Do not consider version %s " % (version))
             else:
                 cves_unpatched.append(cve)
-                bb.debug(2, "%s-%s is not patched for %s" % (bpn[idx], pv, cve))
+                bb.debug(2, "%s-%s is not patched for %s" % (product, pv, cve))
     conn.close()
 
     return (list(patched_cves), cves_unpatched)
-- 
2.11.0


