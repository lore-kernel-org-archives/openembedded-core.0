Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102EAC433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 12:55:00 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.6106.1648558498656778763
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 05:54:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jirC+IIG;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id b19so24641545wrh.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 05:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=79HTi2YaUoj4kcwLV0VMEh/hN95v82/Sds8CE9g3pTk=;
        b=jirC+IIGYgKw152fyU4pubPkbg63Zj0zVwW9HoEAqpYPJIHVuv/NwqjL67Qs60kryf
         /fM4dylZy31Fs9m4rzM1bEey923CkPiWNu9Z6fFwOaU580mJ9D1YVuY0RIk/1jiYI5y/
         aY6INiypxi4s6R5KPe+nvzV6wJwx9PaM6FFvx5wtvD6SAeNIdfq/2qmYKTAd++mo66ac
         cWBR8hTuJcepkTqXeshPMKaVOZQvbL7Q+IUW5LeGCd8b1EPGJQlfhe3apwkzwSDBbgtV
         JGQGVHuoOP+LTvb6hQef/HOLu1Ipzz1l4bBYLZNV537YojgB1uacA+HjbuUIYhfJ4VRS
         0cPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=79HTi2YaUoj4kcwLV0VMEh/hN95v82/Sds8CE9g3pTk=;
        b=P++GIJ7XkvBls56GR7fJ4BJxzGuuOIC9BrzKcEGmbPxJWEcUwt3rIa7QdXhXva8LkU
         DEzcl7XVdB/M/qrdS0XwnUXY1RrSTAZGd0Lw/Tr4ggHOuMgoYkJRPdmeKukSUtfNW/nG
         poQw8Y6EbqRx39K9kVJMjelnyMezL/nDA2XmEUB85ttsn3yuLFuVLaxq9PRLwsnQDiz9
         xHK2wMMw+mOos2BDtfLxuKJaiY8CWls1U4itW0kLXIwrlCHDGHyWX7slD/mwePwnRWre
         JnOeX8pdOTxzpAOQOzKM/J2/z7q/1p7QEKav5yGeEhEZxC5w6avlS9PDUNccNtStyfEG
         7t3A==
X-Gm-Message-State: AOAM533bGuWwTLSxoXZ9pjSxSVyGhlExwo8Eqg+2l6lMP7zcw7B6nVrK
	l1xRt5iA38pE8lgapZAK77LqP1NsSBE=
X-Google-Smtp-Source: 
 ABdhPJzbokvQc5fTlDJ75OxMRBL9J2+pBGWBSagg5zKuJ9RfFb1Jdklu+fWaiDR8Du4RktkWiuOdXw==
X-Received: by 2002:adf:eb48:0:b0:203:f854:86cc with SMTP id
 u8-20020adfeb48000000b00203f85486ccmr30374524wrn.102.1648558496743;
        Tue, 29 Mar 2022 05:54:56 -0700 (PDT)
Received: from localhost.localdomain ([80.215.138.119])
        by smtp.gmail.com with ESMTPSA id
 bg42-20020a05600c3caa00b00380deeaae72sm2361165wmb.1.2022.03.29.05.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 05:54:56 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ross@burtonini.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [OE-core][PATCH v3 2/2] cve-check: add coverage statistics on recipes
 with/without CVEs
Date: Tue, 29 Mar 2022 14:54:32 +0200
Message-Id: <20220329125432.78608-2-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220329125432.78608-1-rybczynska@gmail.com>
References: <20220329125432.78608-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 12:55:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163746

Until now the CVE checker was giving information about CVEs found for
a product (or more products) contained in a recipe. However, there was
no easy way to find out which products or recipes have no CVEs. Having
no reported CVEs might mean there are simply none, but can also mean
a product name (CPE) mismatch.

This patch adds CVE_CHECK_COVERAGE option enabling a new type of
statistics. Then we use the new JSON format to report the information.
The legacy text mode report does not contain it.

This option is expected to help with an identification of recipes with
mismatched CPEs, issues in the database and more.

This work is based on [1], but adding the JSON format makes it easier
to implement, without additional result files.

[1] https://lists.openembedded.org/g/openembedded-core/message/159873

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 meta/classes/cve-check.bbclass | 51 ++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 11 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index f574f5daa4..78516d0bb6 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -55,6 +55,9 @@ CVE_CHECK_FORMAT_TEXT ??= "1"
 # Provide JSON output
 CVE_CHECK_FORMAT_JSON ??= "1"
 
+# Check for packages without CVEs (no issues or missing product name)
+CVE_CHECK_COVERAGE ??= "1"
+
 # Skip CVE Check for packages (PN)
 CVE_CHECK_SKIP_RECIPE ?= ""
 
@@ -114,10 +117,10 @@ python do_cve_check () {
             patched_cves = get_patched_cves(d)
         except FileNotFoundError:
             bb.fatal("Failure in searching patches")
-        ignored, patched, unpatched = check_cves(d, patched_cves)
-        if patched or unpatched:
+        ignored, patched, unpatched, status = check_cves(d, patched_cves)
+        if patched or unpatched or (d.getVar("CVE_CHECK_COVERAGE") == "1" and status):
             cve_data = get_cve_info(d, patched + unpatched)
-            cve_write_data(d, patched, unpatched, ignored, cve_data)
+            cve_write_data(d, patched, unpatched, ignored, cve_data, status)
     else:
         bb.note("No CVE database found, skipping CVE check")
 
@@ -207,17 +210,19 @@ def check_cves(d, patched_cves):
     suffix = d.getVar("CVE_VERSION_SUFFIX")
 
     cves_unpatched = []
+    cves_status = []
+    cves_in_recipe = False
     # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
     products = d.getVar("CVE_PRODUCT").split()
     # If this has been unset then we're not scanning for CVEs here (for example, image recipes)
     if not products:
-        return ([], [], [])
+        return ([], [], [], {})
     pv = d.getVar("CVE_VERSION").split("+git")[0]
 
     # If the recipe has been skipped/ignored we return empty lists
     if pn in d.getVar("CVE_CHECK_SKIP_RECIPE").split():
         bb.note("Recipe has been skipped by cve-check")
-        return ([], [], [])
+        return ([], [], [], [])
 
     cve_ignore = d.getVar("CVE_CHECK_IGNORE").split()
 
@@ -227,6 +232,7 @@ def check_cves(d, patched_cves):
 
     # For each of the known product names (e.g. curl has CPEs using curl and libcurl)...
     for product in products:
+        cves_in_product = False
         if ":" in product:
             vendor, product = product.split(":", 1)
         else:
@@ -244,6 +250,11 @@ def check_cves(d, patched_cves):
             elif cve in patched_cves:
                 bb.note("%s has been patched" % (cve))
                 continue
+            # Write status once only for each product
+            if not cves_in_product:
+                cves_status.append([product, True])
+                cves_in_product = True
+                cves_in_recipe = True
 
             vulnerable = False
             for row in conn.execute("SELECT * FROM PRODUCTS WHERE ID IS ? AND PRODUCT IS ? AND VENDOR LIKE ?", (cve, product, vendor)):
@@ -290,9 +301,16 @@ def check_cves(d, patched_cves):
                 # TODO: not patched but not vulnerable
                 patched_cves.add(cve)
 
+        if not cves_in_product:
+            bb.note("No CVE records found for product %s, pn %s" % (product, pn))
+            cves_status.append([product, False])
+
     conn.close()
 
-    return (list(cve_ignore), list(patched_cves), cves_unpatched)
+    if not cves_in_recipe:
+        bb.note("No CVE records for products in recipe %s" % (pn))
+
+    return (list(cve_ignore), list(patched_cves), cves_unpatched, cves_status)
 
 def get_cve_info(d, cves):
     """
@@ -323,7 +341,6 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
     CVE manifest if enabled.
     """
 
-
     cve_file = d.getVar("CVE_CHECK_LOG")
     fdir_name  = d.getVar("FILE_DIRNAME")
     layer = fdir_name.split("/")[-3]
@@ -337,6 +354,10 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
     if include_layers and layer not in include_layers:
         return
 
+    # Early exit, the text format does not report packages without CVEs
+    if not patched+unpatched:
+        return
+
     nvd_link = "https://nvd.nist.gov/vuln/detail/"
     write_string = ""
     unpatched_cves = []
@@ -414,7 +435,7 @@ def cve_check_write_json_output(d, output, direct_file, deploy_file, manifest_fi
         with open(index_path, "a+") as f:
             f.write("%s\n" % fragment_path)
 
-def cve_write_data_json(d, patched, unpatched, ignored, cve_data):
+def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
     """
     Prepare CVE data for the JSON format, then write it.
     """
@@ -436,11 +457,19 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data):
 
     unpatched_cves = []
 
+    product_data = []
+    for s in cve_status:
+        p = {"product": s[0], "cvesInRecord": "Yes"}
+        if s[1] == False:
+            p["cvesInRecord"] = "No"
+        product_data.append(p)
+
     package_version = "%s%s" % (d.getVar("EXTENDPE"), d.getVar("PV"))
     package_data = {
         "name" : d.getVar("PN"),
         "layer" : layer,
-        "version" : package_version
+        "version" : package_version,
+        "products": product_data
     }
     cve_list = []
 
@@ -479,7 +508,7 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data):
 
     cve_check_write_json_output(d, output, direct_file, deploy_file, manifest_file)
 
-def cve_write_data(d, patched, unpatched, ignored, cve_data):
+def cve_write_data(d, patched, unpatched, ignored, cve_data, status):
     """
     Write CVE data in each enabled format.
     """
@@ -487,4 +516,4 @@ def cve_write_data(d, patched, unpatched, ignored, cve_data):
     if d.getVar("CVE_CHECK_FORMAT_TEXT") == "1":
         cve_write_data_text(d, patched, unpatched, ignored, cve_data)
     if d.getVar("CVE_CHECK_FORMAT_JSON") == "1":
-        cve_write_data_json(d, patched, unpatched, ignored, cve_data)
+        cve_write_data_json(d, patched, unpatched, ignored, cve_data, status)
-- 
2.33.0


