Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 827CAD5AE50
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 03:38:01 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.64434.1730950681086252452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 19:38:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qIb2leW0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7203c431f93so355420b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 19:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730950680; x=1731555480; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5u7o7BYFREAtCEyBMZqDq5ry27SwHE9oBwjrwRIEbQ=;
        b=qIb2leW0UQxR8TlWR6izhhfdx3D4TysMKr9ScM2a+45eogmcKA8GxaNTyzeCeX6jWd
         dE1ZAlWqVg1vs8tnA4NGgjqQXTHkMUS5mBZ4zHd6D6uUVIMhHr0krARi7CYw68k+XChc
         v043rXR/uZ+EKRdUz0UxEw4Yx/R+ZHylekt8RxOQ2puUcXQzdHBK88dR7ns9/qMa86v6
         qy8zRBg2MoqAxsiACZ809iBnygm2jILYiLD6EsERHz4sdI/ZdkeQhWS5MAQDy+HL69fW
         J8iFucmLNFE5M7ftALaKsvCCOZmv8eKF1XrBRKy3OFykOK8G5NtUxLra87rzFsukmicg
         UL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730950680; x=1731555480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5u7o7BYFREAtCEyBMZqDq5ry27SwHE9oBwjrwRIEbQ=;
        b=D+TCMyRcPlVn58fNylo6FpbMJyW98dZE4rKYZNY94NCwKHtKHgg4WdsbXOYwkoTREB
         9rsXzpfXu4EaUgVTCTP7O26H51G0/m3gDQEutVW//ZinsC0I18lH8qX1GeqDbyANR7Sh
         ALE2Svn1od50W7F4/gjuSRsavxi1FN8l9jb7Dvm3S0WpC+qfbBLegTk4pdNohjXz+wCs
         6+NfxRFYszr5kPUHjBgWLx/vntU8m8ouIZx2hXCjFxzg+ixhnuaktEQW58PUOqm/VoWq
         Y5P4H/3MJ0/H+8iMCwCx8mIacbsQgwBcUCQqhyrxIb0zVWk9Z05oz/DXZTcwD8h5qH4J
         gxmg==
X-Gm-Message-State: AOJu0Yy1tcMAk2Jt/h3ytMCNvQo7lfix2kFnSUX9vttLG3OYOrWJ1tQy
	oiUN19YYpwpThJjsrzSqkzRS3piblS3jyhHCgh/S4S9fjMx8yCc4iyap58u9CMZiBzYaK8p0ijF
	g
X-Google-Smtp-Source: AGHT+IE2KUY8g13FagHHUVkyqlGwlP/lIQGVMlTkl6yFu5kPDCQDmCLLZkm2abQhAp8tZ/tgFqOJ1A==
X-Received: by 2002:a05:6a21:3298:b0:1db:dce8:c26f with SMTP id adf61e73a8af0-1dc12957b16mr970199637.33.1730950680227;
        Wed, 06 Nov 2024 19:38:00 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078cd2bcsm366803b3a.84.2024.11.06.19.37.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 19:37:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/10] cve-check: add support for cvss v4.0
Date: Wed,  6 Nov 2024 19:37:41 -0800
Message-Id: <290407b3785bce2d22212a7ab9d3a349c8935cc0.1730950520.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730950520.git.steve@sakoman.com>
References: <cover.1730950520.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 03:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206819

From: Peter Marko <peter.marko@siemens.com>

https://nvd.nist.gov/general/news/cvss-v4-0-official-support

CVSS v4.0 was released in November 2023
NVD announced support for it in June 2024

Current stats are:
* cvss v4 provided, but also v3, so cve-check showed a value
sqlite> select count(*) from nvd where scorev4 != 0.0 and scorev3 != 0.0;
2069
* only cvss v4 provided, so cve-check did not show any
sqlite> select count(*) from nvd where scorev4 != 0.0 and scorev3 = 0.0;
260

(From OE-Core rev: 358dbfcd80ae1fa414d294c865dd293670c287f0)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass                   | 11 +++++++----
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 14 ++++++++++----
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 93a2a1413d..d287cf1457 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -32,7 +32,7 @@ CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
 CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2-1.db"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2-2.db"
 CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
@@ -447,9 +447,10 @@ def get_cve_info(d, cves):
             cve_data[row[0]]["summary"] = row[1]
             cve_data[row[0]]["scorev2"] = row[2]
             cve_data[row[0]]["scorev3"] = row[3]
-            cve_data[row[0]]["modified"] = row[4]
-            cve_data[row[0]]["vector"] = row[5]
-            cve_data[row[0]]["vectorString"] = row[6]
+            cve_data[row[0]]["scorev4"] = row[4]
+            cve_data[row[0]]["modified"] = row[5]
+            cve_data[row[0]]["vector"] = row[6]
+            cve_data[row[0]]["vectorString"] = row[7]
         cursor.close()
     conn.close()
     return cve_data
@@ -514,6 +515,7 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
         write_string += "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
         write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scorev2"]
         write_string += "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scorev3"]
+        write_string += "CVSS v4 BASE SCORE: %s\n" % cve_data[cve]["scorev4"]
         write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
         write_string += "VECTORSTRING: %s\n" % cve_data[cve]["vectorString"]
         write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
@@ -631,6 +633,7 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
             "summary" : cve_data[cve]["summary"],
             "scorev2" : cve_data[cve]["scorev2"],
             "scorev3" : cve_data[cve]["scorev3"],
+            "scorev4" : cve_data[cve]["scorev4"],
             "vector" : cve_data[cve]["vector"],
             "vectorString" : cve_data[cve]["vectorString"],
             "status" : status,
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 1901641965..92177712dc 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -247,7 +247,7 @@ def initialize_db(conn):
         c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DATE TEXT)")
 
         c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
-            SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT, VECTORSTRING TEXT)")
+            SCOREV2 TEXT, SCOREV3 TEXT, SCOREV4 TEXT, MODIFIED INTEGER, VECTOR TEXT, VECTORSTRING TEXT)")
 
         c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
             VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
@@ -353,12 +353,18 @@ def update_db(conn, elt):
         cvssv3 = cvssv3 or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['baseScore']
     except KeyError:
         pass
+    cvssv3 = cvssv3 or 0.0
+    try:
+        accessVector = accessVector or elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['attackVector']
+        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['vectorString']
+        cvssv4 = elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['baseScore']
+    except KeyError:
+        cvssv4 = 0.0
     accessVector = accessVector or "UNKNOWN"
     vectorString = vectorString or "UNKNOWN"
-    cvssv3 = cvssv3 or 0.0
 
-    conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?, ?)",
-                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector, vectorString]).close()
+    conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?, ?, ?)",
+                [cveId, cveDesc, cvssv2, cvssv3, cvssv4, date, accessVector, vectorString]).close()
 
     try:
         # Remove any pre-existing CVE configuration. Even for partial database
-- 
2.34.1


