Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588C6106FD90
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 06:26:21 +0000 (UTC)
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10010.1773383166525131734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 23:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EqA9Fl+F;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2387; q=dns/txt;
  s=iport01; t=1773383166; x=1774592766;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=aWVjnXaEGkibU6bSadIDlRL5mGIHdIOranxb3/S1L0k=;
  b=EqA9Fl+FL09g5G4RpP5SdVSmSar3rn0Cn3YADG3LTgjwASLwr3LnK57e
   J6DAbOe1KaHu/d+K00gThpVpi3BjvltmAS64pfmIiLKNdQzTBndYWacYE
   4bHZA2barwBHr6khVwR0JB8wnYuXv1wK9WeJlbqbcL/59ktqxHjbm61zH
   zQvx0nTCvqLIEWJSN/m3IQ3/B8RAaOTF77RZs4xOHIEKjP/NeQ+my6BTK
   0Bx3Gq7eN8WMkxze0uv2RmTKvYfWj1wGxxV5ikwjd+LG1gQKGv4OIq3Fg
   kmTRQ/2y8nJzPzpbCgrSSCyOgXlxvCWtoi2HZPhA5Pqh1rnBdYCkOJtuF
   A==;
X-CSE-ConnectionGUID: d8AGY6FvQTG1TCjbaCnW3Q==
X-CSE-MsgGUID: nCRVE1TWSzOUnvAv1xlsJQ==
X-IPAS-Result: =?us-ascii?q?A0CrBgAArbNp/89K/pBaHgEBCxIMggULgkgPcV9CSZQqg?=
 =?us-ascii?q?iSLZJI2gX8PAQEBD0QNBAEBhQcCjSICJjQJDgECBAEBAQEDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAgEDJwsBVhwDAQIvIAsjCBEIgwIBg?=
 =?us-ascii?q?joDNgMRrziBeTOBAYNoAkNP2EcNglIBBQYUAYE4hTyCeYUgWxgBhHonGxuBc?=
 =?us-ascii?q?oEVgTuCLYEFgRpCAQMYghOFdwSCIoEOgWGRS0iBHgNZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBCxsHBYUaD4hwdG2BE4MoAwsYDUgRLDcUGwQ+bgeNeD2CN?=
 =?us-ascii?q?IEOLKgdoCBxCiiDdIwejz6FfBozqmsLmHuOCYQJkkeEaIFoPIFHCwdwFYMiU?=
 =?us-ascii?q?hkPjjiFaIMUw2M7NQIJMQIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:DtPwxaLcO1wcWoxkFE+RhZQlxSXFcZb7ZxGr2PjKsXjdYENSgzUOz
 zNKXT/SaP7bYGD0eNEnbdvk90IP7MOGnYMxS1Ad+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnW0
 T/Oi5eHYgH9gGcuajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1iXGgZDNM25N9LLjhy3
 v4SIRsLUUu60rfeLLKTEoGAh+wqIdOuOMYUvWttiGmHS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A3M3wsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQsjOCwbYGOJ7RmQ+1TtXymi
 zv6wF/rJSwcKvWBkCqB6VCV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIkvSS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:QHmjNah7UMnBFCIIDqdKqocxdnBQXtsji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchD4BmaNykdsS48izPIdOod/A==
X-Talos-CUID: 9a23:UE88+266T9QIBA5a7Nss+B49NfF7XGPk8FiJH2S6A29CToLOcArF
X-Talos-MUID: =?us-ascii?q?9a23=3AX4iztA1w8l5picTFppSWnltmmzUj5Y+UNm1Urao?=
 =?us-ascii?q?9qe65MzJZJW6NiC+Ve9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,117,1770595200"; 
   d="scan'208";a="54055335"
Received: from aer-l-core-06.cisco.com ([144.254.74.207])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 Mar 2026 06:26:02 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-06.cisco.com (Postfix) with ESMTPS id 9C6E3180004B2
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 06:26:02 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id B8B4BCC1255; Fri, 13 Mar 2026 11:56:00 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][whinlatter][PATCH 3/3] binutils: CVE-2025-69652
Date: Fri, 13 Mar 2026 11:55:32 +0530
Message-Id: <20260313062532.3247430-3-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260313062532.3247430-1-deeratho@cisco.com>
References: <20260313062532.3247430-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 06:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233028

From: Deepak Rathore <deeratho@cisco.com>

pick the patch [1] as mentioned in [2]

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=44b79abd0fa12e7947252eb4c6e5d16ed6033e01
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69652

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index ff521e1b46..ca134051d5 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -48,4 +48,5 @@ SRC_URI = "\
      file://0020-CVE-2025-11840.patch \
      file://CVE-2025-69644.patch \
      file://CVE-2025-69649.patch \
+     file://CVE-2025-69652.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
new file mode 100644
index 0000000000..d345e33d04
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
@@ -0,0 +1,39 @@
+From 69d20318286c467efc764585e6c4967793bfd198 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 8 Dec 2025 16:04:44 +1030
+Subject: [PATCH] PR 33701, abort in byte_get_little_endian
+
+	PR 33701
+	* dwarf.c (process_debug_info): Set debug_info_p NULL when
+	DEBUG_INFO_UNAVAILABLE.
+
+CVE: CVE-2025-69652
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=44b79abd0fa12e7947252eb4c6e5d16ed6033e01]
+
+cherry picked from commit 44b79abd0fa12e7947252eb4c6e5d16ed6033e01)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ binutils/dwarf.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 3c53821149c..d9f514180de 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -4248,9 +4248,11 @@ process_debug_info (struct dwarf_section * section,
+	      break;
+	    }
+
+-	  debug_info *debug_info_p = ((debug_information
+-				       && unit < alloc_num_debug_info_entries)
+-				      ? debug_information + unit : NULL);
++	  debug_info *debug_info_p = NULL;
++	  if (debug_information
++	      && num_debug_info_entries != DEBUG_INFO_UNAVAILABLE
++	      && unit < alloc_num_debug_info_entries)
++	    debug_info_p = debug_information + unit;
+
+	  assert (!debug_info_p
+		  || (debug_info_p->num_loc_offsets
+--
+2.44.1
-- 
2.35.6


