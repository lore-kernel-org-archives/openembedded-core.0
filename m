Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06913C4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 17:42:38 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29038.1784655753035930417
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 10:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KpOA2Vn4;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4064; q=dns/txt;
  s=iport01; t=1784655753; x=1785865353;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=5Hq/M8PWr5i98Y7LrY/pQn/gSb9YXPZLFN2a7S/n1go=;
  b=KpOA2Vn42JS8T9YipTQvl9elHNwIt2XIcyU3Dnk++cAoxGnetJUouZ7x
   J8x32xiT2sSMYZKhTvQC+aBWXIl0QORVEDuP4DXhevTwxhtK2oIoAJ/l4
   9P7rz6thprP6EAUD0RWmq4EfHKoSX0Clfc0+V0QmPK1HIGIPnuZXzAcSv
   /6Ib7U0GPYk3qIMwgRXqkrENxCdi/rkENkbwwTR76YEp4UYyZ8SVup3EA
   Twb0cBOAjj4ucoFum864yV0keUvpJOcDxWykhB5H41s16eVu7hDs2LoNp
   nVXI5o5N24bfdjZ3Uqj+hpsitXu2VpXa4uvgpGbDXNz52USIr6ksO8pxh
   w==;
X-CSE-ConnectionGUID: OwLDT1XQTm21q+jJxzeFew==
X-CSE-MsgGUID: wN+zys6gTkuDAgzUW0bypQ==
X-IPAS-Result: =?us-ascii?q?A0BLAgCXrl9q/4r/Ja1aHgEBCxIMggULgld0X0JJA4RUj?=
 =?us-ascii?q?1KCIQOeGxSBag8BAQEPRA0EAQGCEoJzAo1XAiY0CQ4BAgQDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAgEDIwQLAVYcAwECAwImAgIrIwgRC?=
 =?us-ascii?q?IMCAYJ0AxGoeZcXGjd6fzOBAYNoAkNQ2y4BBQYUAYEKLoU/gx0BhQJcGAGEf?=
 =?us-ascii?q?CcbG4FygRWDaYEFgVwCgSMVhAOCagSCIoEMgVoYBoNXgRiLIEiBAhwDWSwBV?=
 =?us-ascii?q?RMNCgsHBYFmAzUSKhVuMh2BIz4XNFgbBwWBHYEugQKEbiMfAzl/gS91Sncta?=
 =?us-ascii?q?hIXgSaCFIE6AlUDCxgNSBEsNxQZBD0BbgeNVCOBcUgHPVEBK4EFgSeTaZIKo?=
 =?us-ascii?q?RIKKIN1jCGVOhozqmwLmH2OCpYAUIRpgWg8gVlwFYMiUxkPjioOC4NghRPHJ?=
 =?us-ascii?q?jw1CwMvAQEHAgcOAwuBaJABgX0BAQ?=
IronPort-Data: A9a23:XpF1tq6yfMhlkWZkTQAIcwxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 jZKDWGDbveCZmvzKdF2Ot+19E1UsZ6AyNMwHAJl+Xo9Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1OsvrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eGpI81touMVhy8
 KZBMXMPTACRisy73+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcmFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkYfUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIeMIILUGZsLxS50o
 ErZ2SfrEwpEO+Cc1Bas/WCRubfFjDvCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBdCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:nm+fIavgsdYMQifvDIUIzVB57skDVNV00zEX/kB9WHVpm6uj5q
 eTdZUgpHvJYVkqNk3I9ersBEDEewK+yXcX2/h1AV7dZmjbUQKTRekIh7cKgQeQeREWndQz6U
 4PScRD4aXLbWRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3Aju0iL2j0SlcF5AE2Ss/wMoashjJuVWL54EuJE3a?=
 =?us-ascii?q?EDDwwUf6Xa0+C9Y1pjJ87?=
X-Talos-MUID: 9a23:Xw5aZgXxNmIMZuDq/CDKxyNzL5ln36ezJGkCg6g548OVLRUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,177,1779148800"; 
   d="scan'208";a="512664663"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jul 2026 17:42:32 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id DBAF9180001DF
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 17:42:31 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 0AC9ECC037D; Tue, 21 Jul 2026 23:12:30 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 2/8] cups: fix CVE-2026-41079
Date: Tue, 21 Jul 2026 23:12:11 +0530
Message-Id: <20260721174217.229620-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260721174217.229620-1-deeratho@cisco.com>
References: <20260721174217.229620-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 17:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241560

From: Deepak Rathore <deeratho@cisco.com>

Pick the upstream fix [1] for CVE-2026-41079 as referenced by Debian [2].

[1] https://github.com/OpenPrinting/cups/commit/b7c2525a885f528d243c3a92197ca99609b3f080
[2] https://security-tracker.debian.org/tracker/CVE-2026-41079

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v2:
- Rebased the patch on current Scarthgap CUPS recipe context.
- Corrected the SRC_URI placement so CVE-2026-41079 is added before
  the later CUPS CVE patches in the series.

 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-41079.patch            | 71 +++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-41079.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index ec9392b73d..f74bcaffab 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -23,6 +23,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-27447.patch \
            file://CVE-2026-27447-regression_p1.patch \
            file://CVE-2026-27447-regression_p2.patch \
+           file://CVE-2026-41079.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-41079.patch b/meta/recipes-extended/cups/cups/CVE-2026-41079.patch
new file mode 100644
index 0000000000..a04d956afc
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-41079.patch
@@ -0,0 +1,71 @@
+From a331e93e2f9baf411715ef69ae19b73827da23d7 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Mon, 13 Apr 2026 11:50:23 -0400
+Subject: [PATCH] Limit num_bytes for SNMP string values.
+
+CVE: CVE-2026-41079
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/b7c2525a885f528d243c3a92197ca99609b3f080]
+
+(cherry picked from commit b7c2525a885f528d243c3a92197ca99609b3f080)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ cups/snmp-private.h | 6 +++---
+ cups/snmp.c         | 8 ++++++--
+ 2 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/cups/snmp-private.h b/cups/snmp-private.h
+index 52b8740..015f53e 100644
+--- a/cups/snmp-private.h
++++ b/cups/snmp-private.h
+@@ -1,7 +1,7 @@
+ /*
+  * Private SNMP definitions for CUPS.
+  *
+- * Copyright © 2020-2024 by OpenPrinting.
++ * Copyright © 2020-2026 by OpenPrinting.
+  * Copyright © 2007-2014 by Apple Inc.
+  * Copyright © 2006-2007 by Easy Software Products, all rights reserved.
+  *
+@@ -58,9 +58,9 @@ typedef enum cups_asn1_e cups_asn1_t;	/**** ASN1 request/object types ****/
+ 
+ typedef struct cups_snmp_string_s	/**** String value ****/
+ {
+-  unsigned char	bytes[CUPS_SNMP_MAX_STRING];
+-					/* Bytes in string */
+   unsigned	num_bytes;		/* Number of bytes */
++  unsigned char	bytes[CUPS_SNMP_MAX_STRING + 1];
++					/* Bytes in string */
+ } cups_snmp_string_t;
+ 
+ union cups_snmp_value_u			/**** Object value ****/
+diff --git a/cups/snmp.c b/cups/snmp.c
+index 54e348f..2fcb38d 100644
+--- a/cups/snmp.c
++++ b/cups/snmp.c
+@@ -1,7 +1,7 @@
+ /*
+  * SNMP functions for CUPS.
+  *
+- * Copyright © 2020-2024 by OpenPrinting.
++ * Copyright © 2020-2026 by OpenPrinting.
+  * Copyright © 2007-2019 by Apple Inc.
+  * Copyright © 2006-2007 by Easy Software Products, all rights reserved.
+  *
+@@ -1042,10 +1042,14 @@ asn1_decode_snmp(unsigned char *buffer,	/* I - Buffer */
+ 	        case CUPS_ASN1_OCTET_STRING :
+ 	        case CUPS_ASN1_BIT_STRING :
+ 	        case CUPS_ASN1_HEX_STRING :
+-		    packet->object_value.string.num_bytes = length;
+ 		    asn1_get_string(&bufptr, bufend, length,
+ 		                    (char *)packet->object_value.string.bytes,
+ 				    sizeof(packet->object_value.string.bytes));
++
++		    if (length >= sizeof(packet->object_value.string.bytes))
++		      packet->object_value.string.num_bytes = sizeof(packet->object_value.string.bytes) - 1;
++		    else
++		      packet->object_value.string.num_bytes = length;
+ 	            break;
+ 
+ 	        case CUPS_ASN1_OID :
+-- 
+2.43.7
-- 
2.35.6


