Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA60D3516C
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 10:03:39 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9600.1775037811955405138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 03:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KyiwviHx;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2317; q=dns/txt;
  s=iport01; t=1775037812; x=1776247412;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=1yvVojrpUi8ty43GsJgXdQB5BV6eVpHnceEY9j03+zo=;
  b=KyiwviHxfTxz3tJjR9D+tAPK3meUxTwJzVVxe7IJbDUULqDbrNcOwQ2o
   6cOgqZWBDHAloiNx25n7b2I5JKtesYey61o+TzdJYQtJuKx1LgMTLgMmR
   KQE1MYnaLP4QUecj4L7rm3VSJBcyg4V7lB+DKDYRu5fAW32lGZmV4qpJF
   G4LPmyETDtRFTDMu4hOR/8FK9/nEO8tmXmxrAJ9dQ2Apoe37cNtfrO+xb
   OPGnBBvYdRpfgypgJb+vg8Kqg2NJtiMBjuv0eJC8+r1Qg+ljj5Ze7oZ8b
   zno+7d57EiUfQe4aO6W3T4fDGU6bW0QszhWSezYqkLPUbeZ9KsC6GEiPt
   g==;
X-CSE-ConnectionGUID: lC1uwv4PTpSnksUuMewycQ==
X-CSE-MsgGUID: yhg+N9sRRNSWi2k1t03lRw==
X-IPAS-Result: =?us-ascii?q?A0AmCQBr7Mxp/5P/Ja1agjQQGoJED3FfQkmUKoIki2SSN?=
 =?us-ascii?q?oF/DwEBAQ9EDQQBAYUHAo0lAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2GWgECAQMnCwFWHAMBAi8gCyMIGYMCAYI6AzYCA?=
 =?us-ascii?q?RGzfoF5M4EBg2gCQ0+yKQ2CUgEFBhQBgTiFPoJ5hSNbGAGEeicbG4FygRWBO?=
 =?us-ascii?q?4ItgQWBGkIBAxiCE4V3BIIigQ6BYY8LSIEeA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EMGwcFgUuHXHRtgRODfkUDCxgNSBEsNxQbBD5uB4trKYI1gQ4sq?=
 =?us-ascii?q?CCgHXEKKIN0jB6PPoV8GjOqawuYe44JhAmSR4RogWg8gUcLB3AVgyJSGQ+OO?=
 =?us-ascii?q?IVogxTBLSM1AgkzAQcCBw4CgXORfQEB?=
IronPort-Data: A9a23:8b0DFK4VRqkpJ8mGjBMwzQxRtHzGchMFZxGqfqrLsTDasY5as4F+v
 mRLDG+Bb/iDN2Skc91/Oorn90wD65CGm4RnS1Zp+ytnZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOO/9xGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+KUzBHf/g2Qqaj5MsvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoZWk
 M6akdlVVkuAl/scIovNfoTTKyXmcZaOVeS6sUe6boD56vR0SoPe5Y5gXBYUQR8/ZzxkBLmdw
 v0V3XC7YV9B0qEhBI3xXjEAexySM5Gq95fDCiGirtLP93HeSH3v2MhzKUwpLIYhr7Mf7WFmr
 ZT0KRgXZRyFwubzy7WhR6w13oIoLdLgO8UUvXQIITPxVKl9B8ucBf+XuJkBgGhYasNmRZ4yY
 +IVZDd1ZQjAZDVEO0wcD9Q1m+LAanzXLGcC+QvL/vNpi4TV5B1x3/vLYcHvQPqxesQPnR+E/
 jnCxXusV3n2M/Tak1Jp6EmEgffCmy7+Uo8eGLC0s/VtmlC7wm0IFAZQUkO2p/S8gEOyV99Tb
 UsO9UITQbMa7kenSJz5Gha/unPB50ZaUNtLGOp84waIokbJ3zuk6qE/ZmYpQLQbWAUeH1TGC
 nfhcwvVOAFS
IronPort-HdrOrdr: A9a23:nceKKag7B5aS7sGgrYBu8eFjUnBQXtsji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchD4BmaNykdsS48izPIdOod/A==
X-Talos-CUID: =?us-ascii?q?9a23=3AO3TY92ql+elINASOm5+qWNzmUcQOK2DC0ivoH1e?=
 =?us-ascii?q?DD2VydaCwRECB85oxxg=3D=3D?=
X-Talos-MUID: 9a23:6wwzIwipkrghQ+d6F/3Hn8MpJcdnoIL/E3o3t645upOHbDAoYDOnk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,153,1770595200"; 
   d="scan'208";a="722916316"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Apr 2026 10:03:29 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 3C93F18000277
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Apr 2026 10:03:29 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id DD82DCC12B5; Wed,  1 Apr 2026 03:03:28 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter][PATCH v3 3/4] binutils: Fix CVE-2025-69649
Date: Wed,  1 Apr 2026 03:03:20 -0700
Message-Id: <20260401100320.1176171-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260313062532.3247430-1-deeratho@cisco.com>
References: <20260313062532.3247430-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 10:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234337

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] as mentioned in [2]

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=66a3492ce68e1ae45b2489bd9a815c39ea5d7f66
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69649

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 48579b3602..2f34037eed 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -48,4 +48,5 @@ SRC_URI = "\
      file://0020-CVE-2025-11840.patch \
      file://CVE-2025-69648.patch \
      file://CVE-2025-69644_CVE-2025-69647.patch \
+     file://CVE-2025-69649.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
new file mode 100644
index 0000000000..05b382ea52
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
@@ -0,0 +1,41 @@
+From cc53801dff2ba4bc62eaa666b3b7d9401232089c Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 8 Dec 2025 15:58:33 +1030
+Subject: [PATCH] PR 33697, fuzzer segfault
+
+	PR 33697
+	* readelf.c (process_relocs): Don't segfault on no sections.
+
+CVE: CVE-2025-69649
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=66a3492ce68e1ae45b2489bd9a815c39ea5d7f66]
+
+(cherry picked from commit 66a3492ce68e1ae45b2489bd9a815c39ea5d7f66)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ binutils/readelf.c | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/binutils/readelf.c b/binutils/readelf.c
+index 8f188e8c3e2..8d28b1c30e4 100644
+--- a/binutils/readelf.c
++++ b/binutils/readelf.c
+@@ -9621,13 +9621,11 @@ process_relocs (Filedata * filedata)
+       size_t i;
+       bool found = false;
+ 
+-      for (i = 0, section = filedata->section_headers;
+-	   i < filedata->file_header.e_shnum;
+-	   i++, section++)
+-	{
++      section = filedata->section_headers;
++      if (section != NULL)
++	for (i = 0; i < filedata->file_header.e_shnum; i++, section++)
+ 	  if (display_relocations (section, filedata))
+ 	    found = true;
+-	}
+ 
+       if (! found)
+ 	{
+-- 
+2.35.6
+
-- 
2.35.6


