Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0A2D6ACCD
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 13:00:00 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.71076.1732712392091950341
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 04:59:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EO6H/4+s;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: colinmca242@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-8419d05aa66so158373339f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732712390; x=1733317190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xYOpT2IYe+dPDewcbqZf5IVXjeu0HK+lc1hZRofz9Qk=;
        b=EO6H/4+sOtaG7CmqqHwtywolUq9pjJ5G3zylv4N+Y/xSThV8JDmAQEqBbDI0OoI6u7
         bFkt7UKSkkVc1qat2Y8qAs5pt3Ed/G57GN4+SNvGWHAm2DPUfSZMw3n4xTVacoI/7nmF
         wyjq+U+kPgWV/zuVeZa9QvYZwBe54GtniDt+9BPbbgTaI4o4HNxJ1FPkllK4EBV3ynIp
         V/qEoIFWPk05iGMg4fc0BAAFFcJJLvylaEygDZVl4DUigUCliZnlIaz4WM73saiSBR2+
         ZQIQQYFvChY7DBE1AFGp9KA3QJGKSYjdiDixjlDTKU/SLtg8MVSiH4/EZ+FAfBwSHNhG
         R9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732712390; x=1733317190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYOpT2IYe+dPDewcbqZf5IVXjeu0HK+lc1hZRofz9Qk=;
        b=Pgu1Zsy36WE7mANGfaAbveYQkoMc/tm7mOlOZFgGfUqakz8rmv0KCbXyC3J3lqM83v
         RHaSsCCrrziGYEea0HazVlh2rlqVYcDCH0HvXdhXWs6OuTjh1NF3Y8J6LNvlIW6nW5Ih
         IGyK4ZQLrMFEfE/Uw7HBkOudPhwu9aXI/sh0NbNhj8QuBwgNqJEsut+IFsA8zwQQxWNH
         IJmwAGTY52wG8LFjALCWbuWOBWmcNltF25/2V72f8udKq6+hTj6fOw5NzS4SKuXQKvvZ
         cIHmoFBzkPJSAn5by0w6IGSq2/t24DEBv1BHZjezNbwXf11SIJqO6fPOEVBizpVpFmvt
         ONCw==
X-Gm-Message-State: AOJu0YyP/hDtNxbsESm5zUVAtSd2QosoaCRF88rN9ojVm4ds/GdSURcH
	odw44V34/EJAFIWZlUARHFtrj4UkbyvJgRvsgpy6uWmcd9CNwCNLyk6ziA==
X-Gm-Gg: ASbGncvaSELVKZVesSevVR4KrtgLVcPPWJnugOQWkE5reOAnOKgbdDKDLm1FskwhKdR
	PBlVgmVEdNmZ8kmc94k9XBaPBYfYEingVrnmIP3Iy+dgZDyUo8DA3vI0s6+mJ5aoNpswZ/hUn9u
	wQB7ul3w5FNLQoVpsUSIyMGHYmmeck+xuW8wpOQMIIs0LqvUThElHMuMHyoQgi9qH93/RKYqdnP
	YRDObtCs7Fun+XUukjTMK2vbAXPuuoeoZNZ9z1BGkldbvSiYFE8VrPMsCrhywyW
X-Google-Smtp-Source: AGHT+IForzxp02arpT0m7o0E64+Rd62+wFfWnVNxep5DALnmSVVlHBUAmZuejSADAgaTK2n2Bo2qQQ==
X-Received: by 2002:a05:6602:140f:b0:83a:b74c:800e with SMTP id ca18e2360f4ac-843ecfeee99mr343902139f.12.1732712390460;
        Wed, 27 Nov 2024 04:59:50 -0800 (PST)
Received: from monolith.localdomain ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83ecd3ea0f5sm272657239f.32.2024.11.27.04.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 04:59:49 -0800 (PST)
From: Colin McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>
Subject: [PATCH] cve-update-nvd2-native: Update vector logic
Date: Wed, 27 Nov 2024 12:59:45 +0000
Message-Id: <20241127125945.3211089-1-colinmca242@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 13:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207929

The database used by cve-check currently stores the access vector and
vector string for the oldest CVSS version for each CVE. This should be
reversed, where the newest possible CVSS version is included instead.

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
---
 meta/classes/cve-check.bbclass                   |  2 +-
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 0c92b87f52..c4cbcdf8e3 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -31,7 +31,7 @@
 CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
-CVE_CHECK_DB_FILENAME ?= "nvdcve_2-2.db"
+CVE_CHECK_DB_FILENAME ?= "nvdcve_2-3.db"
 CVE_CHECK_DB_DIR ?= "${STAGING_DIR}/CVE_CHECK"
 CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
 CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index a68a8bb89f..e111709b22 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -355,21 +355,21 @@ def update_db(conn, elt):
         cvssv2 = 0.0
     cvssv3 = None
     try:
-        accessVector = accessVector or elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['attackVector']
-        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['vectorString']
+        accessVector = elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['attackVector']
+        vectorString = elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['vectorString']
         cvssv3 = elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['baseScore']
     except KeyError:
         pass
     try:
-        accessVector = accessVector or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['attackVector']
-        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['vectorString']
+        accessVector = elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['attackVector']
+        vectorString = elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['vectorString']
         cvssv3 = cvssv3 or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['baseScore']
     except KeyError:
         pass
     cvssv3 = cvssv3 or 0.0
     try:
-        accessVector = accessVector or elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['attackVector']
-        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['vectorString']
+        accessVector = elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['attackVector']
+        vectorString = elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['vectorString']
         cvssv4 = elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['baseScore']
     except KeyError:
         cvssv4 = 0.0
-- 
2.34.1


