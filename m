Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3230C43602
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 04:53:09 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37887.1782881583613887333
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 21:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=j1nDT+2a;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3870; q=dns/txt;
  s=iport01; t=1782881586; x=1784091186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y3tFHh45ad8tFYdM+ls35aDSHWZbOx6HRLhBWHELf3U=;
  b=j1nDT+2ac0Rcd+nqqlFYxyWXSp+d9NcjgL2WpsribzB0Pak1j5zcxqJI
   otd/OUAjHmGMhhfRX9EvyCnKFLF6CpVxUZFCXDbLU79ywc+ydo4MTdOB4
   lI+oTaFIMEypKLOYxmQpW6P6Pc2D8bPVyAU0g1sK5gnyuxZjGFYYeuHY4
   UkWmVlB9qVF/06KBPtjfb0HvsL+Y50Ryj7jw3SAaeBFq6PjZ85iU4I4r9
   920QsVzVHMyjSI5Yiz0njEejY1zTibJ0yfCtQYbeLp1I54ryGpRLqkcwC
   1wiZYwzSZeLiC62w5fcR7zMLG+uRW/kphfNlossm47rtheY4QhAiWPhQn
   g==;
X-CSE-ConnectionGUID: tQy3hnTdSiiVGmu9ZyQuyg==
X-CSE-MsgGUID: H7o3gL2GSxSKsEqwaN8Jww==
X-IPAS-Result: =?us-ascii?q?A0BKAgCunERq/5L/Ja1aHgEBCxIMggULgld0X0JJA4RUk?=
 =?us-ascii?q?XQDnhsUgWoPAQEBD0QNBAEBghKCdAKNSwImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAyMECwFGEBwDAQIDAiYCAisjCBmDA?=
 =?us-ascii?q?gGCcwIBEZ4flxcaN3p/M4EBg2gCQ1DbLAEFBhQBBYEFLoU/gxwBhQJbGAGEf?=
 =?us-ascii?q?CcbG4FygRWDaYEFgVwCgSMVhAOCagSCIoEMgVoYBoQBiztIgQIcA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+FzRYGwcFgR2Ba4EDhHojHwM5f4EwdVhmFTA1g?=
 =?us-ascii?q?QIBEh4KgVKBDAMLGA1IESw3FBsEPQFuB40PFw+BbkgHgQ4BK4EFgSeTaZINo?=
 =?us-ascii?q?Q8KKIN1jCGVOhozqmwLmH2OCpYAUIRogWg8gVlwFYMiUxkPjioOC4NghRPIE?=
 =?us-ascii?q?SQ1CwMvAQEHAgcOAwuBaJABgXwBAQ?=
IronPort-Data: A9a23:7ZXmiK0lrRY4NbBiBfbD5YJwkn2cJEfYwER7XKvMYLTBsI5bp2ECx
 msbCmiFPfaKZ2SnL4p3OYm/9U9UupbTmNZjGwto3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 bsen+WFYAX7g2EsazpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGEHgnZo0exupMAGBw2
 vkFeQIcVw2SiLfjqF67YrEEasULNsLnOsYb/3pn1zycVadgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUieC/FMEg9/5JYWleuvgHb2aTBwo1OOrq1x6G/WpOB0+OW1a4OPJYbRGa25mG64+
 WWd8ECjLSoKD/+E5COa+1T8pPDQyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7IQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:lM+GSK8ptzOZKCT197huk+AGI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HJoB17726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKPjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykCsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfiLqWzLzM2f6bQ0/
 Gnl7F6mwY=
X-Talos-CUID: 9a23:y47Ov2C7LiUP0VD6EzVe5RUUHPwpSXzc8ljVPh6KGF90WbLAHA==
X-Talos-MUID: 9a23:1mJLFQT9JCG5p05wRXTM2zY5O+MyzJ++M2MWvIwZsu/UFzNvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,235,1774310400"; 
   d="scan'208";a="503127234"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Jul 2026 04:53:05 +0000
Received: from sjc-ads-4153.cisco.com (sjc-ads-4153.cisco.com [171.70.54.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 7619318000481;
	Wed,  1 Jul 2026 04:53:05 +0000 (GMT)
Received: by sjc-ads-4153.cisco.com (Postfix, from userid 1870532)
	id 2411CCC12A6; Tue, 30 Jun 2026 21:53:05 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [wrynose] [PATCH 2/2] cups: fix CVE-2026-41079
Date: Tue, 30 Jun 2026 21:52:54 -0700
Message-ID: <20260701045257.41443-2-adongare@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260701045257.41443-1-adongare@cisco.com>
References: <20260701045257.41443-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4153.cisco.com [171.70.54.174];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.174, sjc-ads-4153.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 04:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239928

From: Anil Dongare <adongare@cisco.com>

Pick the upstream fix [1] for CVE-2026-41079 as referenced by Debian [2].

[1] https://github.com/OpenPrinting/cups/commit/b7c2525a885f528d243c3a92197ca99609b3f080
[2] https://security-tracker.debian.org/tracker/CVE-2026-41079

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-41079.patch            | 73 +++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-41079.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 49b828506a..9f5d5fe726 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -24,6 +24,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-27447.patch \
            file://CVE-2026-27447-regression_p1.patch \
            file://CVE-2026-27447-regression_p2.patch \
+           file://CVE-2026-41079.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-41079.patch b/meta/recipes-extended/cups/cups/CVE-2026-41079.patch
new file mode 100644
index 0000000000..2392a77311
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-41079.patch
@@ -0,0 +1,73 @@
+From a331e93e2f9baf411715ef69ae19b73827da23d7 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Mon, 13 Apr 2026 11:50:23 -0400
+Subject: [PATCH] Limit num_bytes for SNMP string values.
+
+CVE: CVE-2026-41079
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/b7c2525a885f528d243c3a92197ca99609b3f080]
+
+(cherry picked from commit b7c2525a885f528d243c3a92197ca99609b3f080)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
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
++                    if (length >= sizeof(packet->object_value.string.bytes))
++		      packet->object_value.string.num_bytes = sizeof(packet->object_value.string.bytes) - 1;
++                    else
++		      packet->object_value.string.num_bytes = length;
+ 	            break;
+ 
+ 	        case CUPS_ASN1_OID :
+-- 
+2.43.7
+
-- 
2.44.4


