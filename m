Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB759C54F54
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:49 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32606.1771565685734441813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bwPiw9f9;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4186; q=dns/txt;
  s=iport01; t=1771565686; x=1772775286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AhyZZafUbhpfkjZfg6JAESe88U4/jNix8aF7XCCzffQ=;
  b=bwPiw9f9+kGY8MEils+2KUNi5kb2vL3bc2Xlqnq9qmVYUNKHtiGMW8tK
   KpkeDJeoLGViYv3fdneq+CEFAidf+0O0I1RdO/qsBYNZn/6GD9w4Xbw0p
   I3uDyzZy6hUN6W85ewt/0R1nRnYF43PNRNnSf+aTrFg7Mx9GlmTTgu9y2
   Rn6iVLrddJbSyWJNtZE9eN3y7ZFag5+WTT5RwhifQHgDaSiMvwKoZFWfd
   mKPyYXn1TEVRB4H3sIvkfqFA/QiH4IA802y8eTzJsGRrVRRcY7LwP06GG
   Ykh1yPjHUS/QTdQf3OeOAKNgNK2PVEgdQ1lWAFikn31u4olDStCIQa9pZ
   w==;
X-CSE-ConnectionGUID: MKn8/nfvT0OGY3H+x8fSqA==
X-CSE-MsgGUID: Q1Wq4uTySuS+V550zEZ9uQ==
X-IPAS-Result: =?us-ascii?q?A0BEBABB8Zdp/4v/Ja1aglmCSA9xX0JJA5ZIA4tkkjaBf?=
 =?us-ascii?q?w8BAQEPNxoEAQGFBwKNHwImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWwIBAzIBRhAgMSALKxmDAgGCOgM2AgGnBRo3giyBA?=
 =?us-ascii?q?YR82EcNglIBCxQBgTiFPIJ5hSBrCYR6JxsbgXKEfYIfiGgEgiKBDoIAi0KGD?=
 =?us-ascii?q?UiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBCxsHBYJChREPiQV4boEgg?=
 =?us-ascii?q?RsDCxgNSBEsNxQbBD5uB44vP4I0ASwQUYEAgSmTXTsTkXiBNZ5ocQoog3SMH?=
 =?us-ascii?q?o8+hXwaM4QEpmeZBoJYjzqSR4RogWg8RoETcBWDIglJGQ+OX4Idu30iNRMpA?=
 =?us-ascii?q?gcLAQEDCZFqLIFRAQE?=
IronPort-Data: A9a23:DLDlCq+6fMqiqReRUAHPDrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 DYZWmqBaPaOZmWhc9wibIrkp0oO7MXUxoU2HlM/qytEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mryyHjEAX9gWAsaDhMs/nrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kTHotIveB5H10W0
 tMpcxBOfkCNvPuflefTpulE3qzPLeHxN48Z/3UlxjbDALN+G9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZOEwn1lQ/UPrSmM+oi2XneiFwo1OOrq1x6G/WpOB0+OayaYqEJYPRFK25mG6h/
 13fo3nFEyoHD5+hlGfd4F+e1/L2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7DQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:gYuVCqH2kPz9UOlipLqE78eALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1rZ
 0QEJSXzLbLfCFHZQGQ2njfL+od
X-Talos-CUID: 9a23:l6X+smw4LRRfphnHboh3BgUxOcZ1NXvT0kuIBGCJUkYqWO2bcka5rfY=
X-Talos-MUID: 9a23:yUWBbwQtHGmbREjHRXTV3Q57aNpU8p+zMwMzzMheqeS2ZDFJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="671897739"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:45 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 826601800023F;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id ABB46CC8D03; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 18/34] cve-update-db-native: update structure
Date: Thu, 19 Feb 2026 21:34:27 -0800
Message-Id: <20260220053443.3006180-18-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231472

From: Marta Rybczynska <rybczynska@gmail.com>

Update the database structure and tasks to fit the current YP master.
This means:
- add the unpack task
- update the database structure (CVSS, vector string)
- use the temporary database in the same directory as the download

However, the old feed does not include CVSS4

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dd249921a5d6b8e472242b57415de3f210dc81f1)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 .../recipes-core/meta/cve-update-db-native.bb | 28 ++++++++++++++-----
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index e042e67b09..3a9d43943c 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -5,7 +5,6 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 inherit native
 
-deltask do_unpack
 deltask do_patch
 deltask do_configure
 deltask do_compile
@@ -21,7 +20,10 @@ CVE_DB_UPDATE_INTERVAL ?= "86400"
 # Timeout for blocking socket operations, such as the connection attempt.
 CVE_SOCKET_TIMEOUT ?= "60"
 
-CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DIR}/temp_nvdcve_1.1.db"
+CVE_CHECK_DB_DLDIR_FILE ?= "${DL_DIR}/CVE_CHECK2/${CVE_CHECK_DB_FILENAME}"
+CVE_CHECK_DB_DLDIR_LOCK ?= "${CVE_CHECK_DB_DLDIR_FILE}.lock"
+
+CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DLDIR_FILE}.tmp"
 
 python () {
     if not bb.data.inherits_class("cve-check", d):
@@ -38,7 +40,7 @@ python do_fetch() {
 
     bb.utils.export_proxies(d)
 
-    db_file = d.getVar("CVE_CHECK_DB_FILE")
+    db_file = d.getVar("CVE_CHECK_DB_DLDIR_FILE")
     db_dir = os.path.dirname(db_file)
     db_tmp_file = d.getVar("CVE_DB_TEMP_FILE")
 
@@ -72,10 +74,16 @@ python do_fetch() {
         os.remove(db_tmp_file)
 }
 
-do_fetch[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
+do_fetch[lockfiles] += "${CVE_CHECK_DB_DLDIR_LOCK}"
 do_fetch[file-checksums] = ""
 do_fetch[vardeps] = ""
 
+python do_unpack() {
+    import shutil
+    shutil.copyfile(d.getVar("CVE_CHECK_DB_DLDIR_FILE"), d.getVar("CVE_CHECK_DB_FILE"))
+}
+do_unpack[lockfiles] += "${CVE_CHECK_DB_DLDIR_LOCK} ${CVE_CHECK_DB_FILE_LOCK}"
+
 def cleanup_db_download(db_file, db_tmp_file):
     """
     Cleanup the download space from possible failed downloads
@@ -183,7 +191,7 @@ def initialize_db(conn):
         c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DATE TEXT)")
 
         c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
-            SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
+            SCOREV2 TEXT, SCOREV3 TEXT, SCOREV4 TEXT, MODIFIED INTEGER, VECTOR TEXT, VECTORSTRING TEXT)")
 
         c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
             VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
@@ -263,23 +271,29 @@ def update_db(conn, jsondata):
             continue
 
         accessVector = None
+        vectorString = None
+        cvssv2 = 0.0
+        cvssv3 = 0.0
+        cvssv4 = 0.0
         cveId = elt['cve']['CVE_data_meta']['ID']
         cveDesc = elt['cve']['description']['description_data'][0]['value']
         date = elt['lastModifiedDate']
         try:
             accessVector = elt['impact']['baseMetricV2']['cvssV2']['accessVector']
+            vectorString = elt['impact']['baseMetricV2']['cvssV2']['vectorString']
             cvssv2 = elt['impact']['baseMetricV2']['cvssV2']['baseScore']
         except KeyError:
             cvssv2 = 0.0
         try:
             accessVector = accessVector or elt['impact']['baseMetricV3']['cvssV3']['attackVector']
+            vectorString = vectorString or elt['impact']['baseMetricV3']['cvssV3']['vectorString']
             cvssv3 = elt['impact']['baseMetricV3']['cvssV3']['baseScore']
         except KeyError:
             accessVector = accessVector or "UNKNOWN"
             cvssv3 = 0.0
 
-        conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)",
-                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector]).close()
+        conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?, ?, ?)",
+                [cveId, cveDesc, cvssv2, cvssv3, cvssv4, date, accessVector, vectorString]).close()
 
         configurations = elt['configurations']['nodes']
         for config in configurations:

