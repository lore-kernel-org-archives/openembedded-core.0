Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA398D3EE72
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 14:59:29 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39028.1769093960500555980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 06:59:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PZKWm8Jj;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4507; q=dns/txt;
  s=iport01; t=1769093960; x=1770303560;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=r4twCh+AG/obSLDVu9MevUski9F8CO2WHuEG9kLgqdA=;
  b=PZKWm8Jj+qmNqI6JrLbCmsou8vHRn4GSds1LmkOSnoqgl6QxZ5Hs6asS
   J8D3jUJtLSc6TCKE4Y1YgTssq7INuweC2CGi2BYqceayDrL9yeOcRV1T7
   /R7/rIeRd4zbvtPxVKilAf7K/xuT5FHxEY/d19gA4R0d46TkNkDaKhrt3
   Tm4EXWOXnfU6dNFe6rIrkPhK/qno5GhbIfXd0HhtZFk2qBkKaKQCoSdjt
   tahe1xrw0WtvLRweGZ1jbIcVVGeJHrMiLZ79CO+LgSftqpfxI2jY3UYRr
   NyiKrlcjfx2PwBy0dGugENw6C3fnS0i5dhYxelN+8EebUUKwQs8cWKU4t
   A==;
X-CSE-ConnectionGUID: KdKhxWabS6iq0GYc91b6aw==
X-CSE-MsgGUID: t/TyCOBdTy2/EtAea0lx1Q==
X-IPAS-Result: =?us-ascii?q?A0CmCADvOnJp/5L/Ja1aglmCSA9xX0JJA5NXAYJwnh2Bf?=
 =?us-ascii?q?w8BAQEPPRQEAQGFB40JAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4YVCDINhl0CNAFGMFxEgwIBgnMCAREGrwqCLIEBg2gBRE/bJ?=
 =?us-ascii?q?gELFAGBOIU7iBdoCYR4JxsbgXKBFIJ6b4JhA4IFhh4EgiKBDoxnhxpIgR4DW?=
 =?us-ascii?q?SwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQobBwVoBoNshQ4PiSJ4gRMDCxgNS?=
 =?us-ascii?q?BEsNxQbBD5uB45mRIIoBwFzGixmCwolgSiTYLMGCiiDdIwelToaM4QEpmeZB?=
 =?us-ascii?q?oJYogGEaIFoPEaBE3AVgyIJSRkPh36GYYIdhjjAPEM1AhEpAgcLAQEDCZNnA?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:aqs6AKhKcjWeoBuoe4s8LsycX161NxEKZh0ujC45NGQN5FlHY01je
 htvCjvUaa2Ca2qmLo9zb4208h5V7ZbWyIU3TwVvqyhgQStjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeGULOZ82QsaDxMsvjZ8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU79sV3EV5H/
 8dGKSlVQSGI1ru8nrukH7wEasQLdKEHPasFsX1miDWcBvE8TNWbEuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgl/5JEWxI9EglH/fiFAoU69rqss6G+Vxwt0uFToGIaII4LQFJgNxC50o
 ErauFjoKTYwOOCOk32o7luhj7fLjXrCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBVCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:SJjHkqx6jP+DcW0aNXYgKrPwJ71zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcKuweQeBEXMoVmpM
 Bdm28UMqyVMWRH
X-Talos-CUID: 9a23:l4KCM2Ez1ShBBW6xqmJE+G0UCv8seEaDzW6IDH6zWD9jFrSKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3ArAZ8Ew53VcOGfTfZjFDiznl+xox0pJi/I2cnnak?=
 =?us-ascii?q?X4Y6pKQV9Mm+ZnG2OF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,246,1763424000"; 
   d="scan'208";a="451629502"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jan 2026 14:59:19 +0000
Received: from sjc-ads-1153.cisco.com (sjc-ads-1153.cisco.com [171.70.58.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 7F05D18000487;
	Thu, 22 Jan 2026 14:59:19 +0000 (GMT)
Received: by sjc-ads-1153.cisco.com (Postfix, from userid 1847788)
	id 22BB2C667C3; Thu, 22 Jan 2026 06:59:19 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core] [PATCH v3] cve-update-nvd2-native: Use maximum CVSS score from all sources
Date: Thu, 22 Jan 2026 14:59:18 +0000
Message-Id: <20260122145919.4148193-1-hetpat@cisco.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.58.95, sjc-ads-1153.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 14:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229846

From: Het Patel <hetpat@cisco.com>

The CVE check system was incorrectly reporting lower CVSS scores when
multiple scoring sources were available in the NVD database. This
occurred because the code only extracted the first element from the
metrics arrays, which could be a "Secondary" source with a lower score
rather than the "Primary" source or the highest available vendor score.

According to the CVSS v4.0 User Guide, "In situations where multiple
CVSS-B scores are applicable but only one is provided, the highest
CVSS-B score must be utilized." This follows the "reasonable worst-case"
principle established by the CVSS SIG.

This fix iterates through all available sources (v2, v3.0, v3.1, and
v4.0) and selects the maximum CVSS score to ensure the highest severity
is reported.

Fixes [YOCTO #15931]

References:
- https://www.first.org/cvss/v4.0/user-guide
- https://www.first.org/cvss/v3.1/user-guide
- https://www.first.org/cvss/v2/minutes/cvss-meeting-minutes-06202006.pdf

Signed-off-by: Het Patel <hetpat@cisco.com>
---
 .../meta/cve-update-nvd2-native.bb            | 55 +++++++++++++------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 8c8148dd92..41c34ba0d0 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -350,32 +350,55 @@ def update_db(conn, elt):
         if desc['lang'] == 'en':
             cveDesc = desc['value']
     date = elt['cve']['lastModified']
+
+    # Extract maximum CVSS scores from all sources (Primary and Secondary)
+    cvssv2 = 0.0
     try:
-        accessVector = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['accessVector']
-        vectorString = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['vectorString']
-        cvssv2 = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['baseScore']
+        # Iterate through all cvssMetricV2 entries and find the maximum score
+        for metric in elt['cve']['metrics']['cvssMetricV2']:
+            score = metric['cvssData']['baseScore']
+            if score > cvssv2:
+                cvssv2 = score
+                accessVector = metric['cvssData']['accessVector']
+                vectorString = metric['cvssData']['vectorString']
     except KeyError:
-        cvssv2 = 0.0
-    cvssv3 = None
+        pass
+
+    cvssv3 = 0.0
     try:
-        accessVector = accessVector or elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['attackVector']
-        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['vectorString']
-        cvssv3 = elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['baseScore']
+        # Iterate through all cvssMetricV30 entries and find the maximum score
+        for metric in elt['cve']['metrics']['cvssMetricV30']:
+            score = metric['cvssData']['baseScore']
+            if score > cvssv3:
+                cvssv3 = score
+                accessVector = accessVector or metric['cvssData']['attackVector']
+                vectorString = vectorString or metric['cvssData']['vectorString']
     except KeyError:
         pass
+
     try:
-        accessVector = accessVector or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['attackVector']
-        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['vectorString']
-        cvssv3 = cvssv3 or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['baseScore']
+        # Iterate through all cvssMetricV31 entries and find the maximum score
+        for metric in elt['cve']['metrics']['cvssMetricV31']:
+            score = metric['cvssData']['baseScore']
+            if score > cvssv3:
+                cvssv3 = score
+                accessVector = accessVector or metric['cvssData']['attackVector']
+                vectorString = vectorString or metric['cvssData']['vectorString']
     except KeyError:
         pass
-    cvssv3 = cvssv3 or 0.0
+
+    cvssv4 = 0.0
     try:
-        accessVector = accessVector or elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['attackVector']
-        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['vectorString']
-        cvssv4 = elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['baseScore']
+        # Iterate through all cvssMetricV40 entries and find the maximum score
+        for metric in elt['cve']['metrics']['cvssMetricV40']:
+            score = metric['cvssData']['baseScore']
+            if score > cvssv4:
+                cvssv4 = score
+                accessVector = accessVector or metric['cvssData']['attackVector']
+                vectorString = vectorString or metric['cvssData']['vectorString']
     except KeyError:
-        cvssv4 = 0.0
+        pass
+
     accessVector = accessVector or "UNKNOWN"
     vectorString = vectorString or "UNKNOWN"
 

