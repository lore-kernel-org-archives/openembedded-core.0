Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB10CCA494
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:47:29 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.7381.1654699648789379991
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=SckR3U9r;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id a10so18781230pju.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Rwp8nfudl04hX2UK9Zsn5hTcgV+9qkDe6MeF+pArDao=;
        b=SckR3U9rZ2WmG8lka4Hc5FgUD68gf36Pkd6frXMXD6mV0Bf7ktR+CmLDhLO/roQwWO
         FDKnZZCCKEvHpn7aVf0kyHQY6e8n9CbHdc8SHX2keppOisozXWngrFqsNiNSlK7uNRqd
         FsiFhj3zmobADAJabUqVBzE0oaBSefEgc+Nc4NqPehe5AAK9yKsG+9+Ip5zYfMlB+fk+
         SnaArHbqNY90UPOpocrX56LKjFmmro+wAY3oo2e+RafCgn3PM+nmKOUIy7T4n9kdHToH
         yE/umY3gVHZxpo93tsvH3jegDGGgppGdI353u8Fpwkiy1N1G6J+jFAQ6OI0Fr13SIE2x
         uqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rwp8nfudl04hX2UK9Zsn5hTcgV+9qkDe6MeF+pArDao=;
        b=mWpgjIjb0tzASM200JwOF9SyxppXZaPnH0Ykmm7gBydAYyWxWMwD6ljm2s4BHpSBMk
         kSo6WyNoJHAqB2sPDY08tb2RixtyDKo9PohoRv+i2ErQRvikkF0NiR4u3f+Ny4HLuuI+
         YQmExg8aGeYVw5Nn34GBZopJ9W5TzY/XtwJwSBQ/n4BxVEzRBKaVY96OknSDE1RjLwBc
         1Hy7iD8nccf+gXa98AhQIWqtRgfwaLCHkxuq1PoySbGuJZtNd03yYMbQgzzBMQ+L6OMw
         r1pBk74KmStUwTgpxuduXHTgwHwPK1iqR9EAmU2pk86cZdzJosxwrwE6lfMdwldZnnof
         32Dw==
X-Gm-Message-State: AOAM530TEV8J233n9YQtySPBrr56jmdwDKd2ECdHpZ4nYAtsVP7uslKZ
	w2C03TMMaullLEXEv/2gIPElL+dddDdfe8OF
X-Google-Smtp-Source: 
 ABdhPJy3V+6rohjmPJ9EFa9Tbt/1tb8LayhTuCZ/lCbjs+sauFQdeqUbhDO1wdMi326cFwsnTt2A/A==
X-Received: by 2002:a17:90a:2e87:b0:1e8:895c:e543 with SMTP id
 r7-20020a17090a2e8700b001e8895ce543mr15856478pjd.100.1654699647436;
        Wed, 08 Jun 2022 07:47:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 bg13-20020a17090b0d8d00b001e08461ceaesm16709701pjb.37.2022.06.08.07.47.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:47:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/14] cve-check: add coverage statistics on
 recipes with/without CVEs
Date: Wed,  8 Jun 2022 04:46:36 -1000
Message-Id: 
 <c63d06becc340270573bdef2630749db1f5230d4.1654699348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654699348.git.steve@sakoman.com>
References: <cover.1654699348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:47:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166747

From: Marta Rybczynska <rybczynska@gmail.com>

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d1849a1facd64fa0bcf8336a0ed5fbf71b2e3cb5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 48 ++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 48f75456f2..894cebaaa4 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -56,6 +56,9 @@ CVE_CHECK_FORMAT_TEXT ??= "1"
 # Provide JSON output - disabled by default for backward compatibility
 CVE_CHECK_FORMAT_JSON ??= "0"
 
+# Check for packages without CVEs (no issues or missing product name)
+CVE_CHECK_COVERAGE ??= "1"
+
 # Whitelist for packages (PN)
 CVE_CHECK_PN_WHITELIST ?= ""
 
@@ -137,10 +140,10 @@ python do_cve_check () {
             patched_cves = get_patches_cves(d)
         except FileNotFoundError:
             bb.fatal("Failure in searching patches")
-        whitelisted, patched, unpatched = check_cves(d, patched_cves)
-        if patched or unpatched:
+        whitelisted, patched, unpatched, status = check_cves(d, patched_cves)
+        if patched or unpatched or (d.getVar("CVE_CHECK_COVERAGE") == "1" and status):
             cve_data = get_cve_info(d, patched + unpatched)
-            cve_write_data(d, patched, unpatched, whitelisted, cve_data)
+            cve_write_data(d, patched, unpatched, whitelisted, cve_data, status)
     else:
         bb.note("No CVE database found, skipping CVE check")
 
@@ -312,17 +315,19 @@ def check_cves(d, patched_cves):
     suffix = d.getVar("CVE_VERSION_SUFFIX")
 
     cves_unpatched = []
+    cves_status = []
+    cves_in_recipe = False
     # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
     products = d.getVar("CVE_PRODUCT").split()
     # If this has been unset then we're not scanning for CVEs here (for example, image recipes)
     if not products:
-        return ([], [], [])
+        return ([], [], [], [])
     pv = d.getVar("CVE_VERSION").split("+git")[0]
 
     # If the recipe has been whitelisted we return empty lists
     if pn in d.getVar("CVE_CHECK_PN_WHITELIST").split():
         bb.note("Recipe has been whitelisted, skipping check")
-        return ([], [], [])
+        return ([], [], [], [])
 
     cve_whitelist = d.getVar("CVE_CHECK_WHITELIST").split()
 
@@ -332,6 +337,7 @@ def check_cves(d, patched_cves):
 
     # For each of the known product names (e.g. curl has CPEs using curl and libcurl)...
     for product in products:
+        cves_in_product = False
         if ":" in product:
             vendor, product = product.split(":", 1)
         else:
@@ -349,6 +355,11 @@ def check_cves(d, patched_cves):
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
@@ -395,9 +406,13 @@ def check_cves(d, patched_cves):
                 # TODO: not patched but not vulnerable
                 patched_cves.add(cve)
 
+        if not cves_in_product:
+            bb.note("No CVE records found for product %s, pn %s" % (product, pn))
+            cves_status.append([product, False])
+
     conn.close()
 
-    return (list(cve_whitelist), list(patched_cves), cves_unpatched)
+    return (list(cve_whitelist), list(patched_cves), cves_unpatched, cves_status)
 
 def get_cve_info(d, cves):
     """
@@ -428,7 +443,6 @@ def cve_write_data_text(d, patched, unpatched, whitelisted, cve_data):
     CVE manifest if enabled.
     """
 
-
     cve_file = d.getVar("CVE_CHECK_LOG")
     fdir_name  = d.getVar("FILE_DIRNAME")
     layer = fdir_name.split("/")[-3]
@@ -442,6 +456,10 @@ def cve_write_data_text(d, patched, unpatched, whitelisted, cve_data):
     if include_layers and layer not in include_layers:
         return
 
+    # Early exit, the text format does not report packages without CVEs
+    if not patched+unpatched:
+        return
+
     nvd_link = "https://nvd.nist.gov/vuln/detail/"
     write_string = ""
     unpatched_cves = []
@@ -518,7 +536,7 @@ def cve_check_write_json_output(d, output, direct_file, deploy_file, manifest_fi
         with open(index_path, "a+") as f:
             f.write("%s\n" % fragment_path)
 
-def cve_write_data_json(d, patched, unpatched, ignored, cve_data):
+def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
     """
     Prepare CVE data for the JSON format, then write it.
     """
@@ -540,11 +558,19 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data):
 
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
 
@@ -583,7 +609,7 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data):
 
     cve_check_write_json_output(d, output, direct_file, deploy_file, manifest_file)
 
-def cve_write_data(d, patched, unpatched, ignored, cve_data):
+def cve_write_data(d, patched, unpatched, ignored, cve_data, status):
     """
     Write CVE data in each enabled format.
     """
@@ -591,4 +617,4 @@ def cve_write_data(d, patched, unpatched, ignored, cve_data):
     if d.getVar("CVE_CHECK_FORMAT_TEXT") == "1":
         cve_write_data_text(d, patched, unpatched, ignored, cve_data)
     if d.getVar("CVE_CHECK_FORMAT_JSON") == "1":
-        cve_write_data_json(d, patched, unpatched, ignored, cve_data)
+        cve_write_data_json(d, patched, unpatched, ignored, cve_data, status)
-- 
2.25.1


