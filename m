Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E8FC0032E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:51:49 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.57860.1697817101149470423
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=t/R3chac;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c9b1e3a809so7226225ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817100; x=1698421900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=768Hamxh1W7UHjXIzL4qVKf4VJVdj4GmOWJRL9ZTihU=;
        b=t/R3chacQSZ2535nwdOH9ceM9484G7bAM6QchUjkN9o/RoVUDYyhWjFEm0jeffFrQk
         rpf31z2E84rGX7eChczUlBb5Bn/AdckbxYnAhUGmTM/IJf6GUJRqgtatwrJ+sumpwo8y
         EJWyULokbHNxXKUmSqpaMzn7irK/Att1yoFg8ZLkS3ufUCWzKSE1A5bXa40OnW6Ii1qR
         SJz8t2JuPHcDQUyQJSn1HseAT8LWuHZ49i8rdccRZGSr/ThFEPiWb2wEypjU/RMuPbbg
         0k6Rj5EVbXoep7lQHCNyJaREWoMXulI7efmM41F+IL69a2kBiwYnXSVaZeM17j108ur1
         SFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817100; x=1698421900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=768Hamxh1W7UHjXIzL4qVKf4VJVdj4GmOWJRL9ZTihU=;
        b=JPFLhRxaXnJReu51eYcAcafbt9l0g0VVkeHpnnOc/QRHrie+w8oWTAeaFmkHIFDj0k
         0NJitbvJkD3pFjWiAoMDmV3fyE3w0zqYlzo/Vu1ZrvJH8i/1bbi/7Ho5U22aT0+tzMCY
         YP6yAn2St70qYRFEFzE8PEL4BK7at3PUNYo3SVn5CkfzAj25z7McICMnR/mfyPJergEv
         4wvthUvq2PGs1UuCau2gwDTk6KMns2MgQYtYsUJZvUWE6v4a5Y82qw3gSBCAgWxOknDg
         RE7GHGMGAu/tOAc95PvCBU5Ni2arzniHDlvdVPfFpYSREdNKQa24fOBrfncnapyDoJFp
         S4GQ==
X-Gm-Message-State: AOJu0YwU2CL85+6pEpcW5s0Bse/PrUpU0k0nMe2sRCrGpL7zm1nOL8jA
	fFQvPXHvxbvb/7SB2T8X9KCdz9cUNtzzysqYcH8=
X-Google-Smtp-Source: AGHT+IFxNMhFHp4GGOHQ2VbFz8H3OIIsDl7DRMb6bCC4+w5kdHcPo6XpUNbuJ06RpFxFm/f2N82hNA==
X-Received: by 2002:a17:902:dac9:b0:1bb:30c5:835a with SMTP id q9-20020a170902dac900b001bb30c5835amr2733677plx.7.1697817099956;
        Fri, 20 Oct 2023 08:51:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.51.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:51:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 04/24] cve-check: add CVSS vector string to CVE database and reports
Date: Fri, 20 Oct 2023 05:51:06 -1000
Message-Id: <587ae7bc85fc471d927308d866821d463799023d.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189549

From: Antoine Lubineau <antoine.lubineau@easymile.com>

This allows building detailed vulnerability analysis tools without
relying on external resources.

Signed-off-by: Antoine Lubineau <antoine.lubineau@easymile.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 048ff0ad927f4d37cc5547ebeba9e0c221687ea6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass                   |  5 ++++-
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 11 ++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index bd9e7e7445..3846aee5ea 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -32,7 +32,7 @@ CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
 CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2.db"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2-1.db"
 CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
@@ -403,6 +403,7 @@ def get_cve_info(d, cves):
             cve_data[row[0]]["scorev3"] = row[3]
             cve_data[row[0]]["modified"] = row[4]
             cve_data[row[0]]["vector"] = row[5]
+            cve_data[row[0]]["vectorString"] = row[6]
         cursor.close()
     conn.close()
     return cve_data
@@ -459,6 +460,7 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
         write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scorev2"]
         write_string += "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scorev3"]
         write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
+        write_string += "VECTORSTRING: %s\n" % cve_data[cve]["vectorString"]
         write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
 
     if unpatched_cves and d.getVar("CVE_CHECK_SHOW_WARNINGS") == "1":
@@ -573,6 +575,7 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
             "scorev2" : cve_data[cve]["scorev2"],
             "scorev3" : cve_data[cve]["scorev3"],
             "vector" : cve_data[cve]["vector"],
+            "vectorString" : cve_data[cve]["vectorString"],
             "status" : status,
             "link": issue_link
         }
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 2f7dad7e82..d0321f1bb5 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -225,7 +225,7 @@ def initialize_db(conn):
         c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DATE TEXT)")
 
         c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
-            SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
+            SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT, VECTORSTRING TEXT)")
 
         c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
             VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
@@ -299,6 +299,7 @@ def update_db(conn, elt):
     """
 
     accessVector = None
+    vectorString = None
     cveId = elt['cve']['id']
     if elt['cve']['vulnStatus'] ==  "Rejected":
         return
@@ -309,25 +310,29 @@ def update_db(conn, elt):
     date = elt['cve']['lastModified']
     try:
         accessVector = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['accessVector']
+        vectorString = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['vectorString']
         cvssv2 = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['baseScore']
     except KeyError:
         cvssv2 = 0.0
     cvssv3 = None
     try:
         accessVector = accessVector or elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['attackVector']
+        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['vectorString']
         cvssv3 = elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['baseScore']
     except KeyError:
         pass
     try:
         accessVector = accessVector or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['attackVector']
+        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['vectorString']
         cvssv3 = cvssv3 or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['baseScore']
     except KeyError:
         pass
     accessVector = accessVector or "UNKNOWN"
+    vectorString = vectorString or "UNKNOWN"
     cvssv3 = cvssv3 or 0.0
 
-    conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)",
-                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector]).close()
+    conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?, ?)",
+                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector, vectorString]).close()
 
     try:
         for config in elt['cve']['configurations']:
-- 
2.34.1


