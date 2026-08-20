Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03258C5DF8C
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:07:30 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3032.1787216847044408415
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FjJ7aqX1;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1180; q=dns/txt;
  s=iport01; t=1787216847; x=1788426447;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kel0jPVVZHvHsIL5UDmXg1Gwqs9nJjRFr9ShfmATlNo=;
  b=FjJ7aqX1H1eUCIGjY7CyrJK4rmyjbf0LZE29t6lH2MkXISMN1mgwVvSK
   Wxn20Tvlt9rIzZnJ/aB6cLYlzqJ1npV3t2ajVamYzFKqEO91UshL3u23G
   5IJPzU134VJTWCiTIlt92eq4/u6jWP37v+YrTQoXMY0B0pXoHWzf9RUYb
   Y8bAVtEasrGl8Y+Do48cYzXJhGeIoEn0p3b/ObUk917fFC6b80OjjqiQh
   2fiv3CjumcfgKXFbB8hZGnx+hVz38SND80e5733ACQlT0xT3ZkX/Vz4BY
   S5QZntgDRihW8cbmEWikPGdRL4MAr8MN2l5HTLcvJoZs9GIogAsM4M7vK
   w==;
X-CSE-ConnectionGUID: 6lyxgXMvSXupOVQZw752wA==
X-CSE-MsgGUID: 7oRDtIu0QdyUl+DW5mfA+A==
X-IPAS-Result: =?us-ascii?q?A0D2AgBrwoZq/5IQJK1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjW0CJjYHDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdKwsBGAEtMFxEgwIBgnQDwkKBeTOBAYMoAYFU2zABCxQBBYEzhT+II?=
 =?us-ascii?q?naEfCcbG4FyhH6FEIV4BIIiehKBeJFSSIEeA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+F4ENGwYFgR2BKIQ3Ixk2fIEJXoErKmEBEheBCYIKAoJwggYCAUlFD?=
 =?us-ascii?q?gkXCxgNSBEsNxQZBD5uB45RIIJLgQ6BRKcKoQ8KKIN2jCGVOhozqmwumFqkW?=
 =?us-ascii?q?oRpgW4BNYFZcBWDIglKGQ/eXCcyAjsCBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:Puwx+6kawi1MH5rsTB+Tc1jo5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfX2CBOauCZGLyL48iYNng9B4H7MKGm9NiQQc6+X0xQ1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpEsvPb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FdMc6/Z4MURQz
 swFMBczVyKc2L/s35vuH4GAhux7RCXqFIobvnclyXTSCuwrBMiSBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkERUrsUIMpWcOOAinThejtDqEq9rqss6G+Vxwt0uFToGIqMIIzbG58LwS50o
 EqZ+F7VHjAHbOWT2AeBsV6T2+rBtGDSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBVCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:bOowYqNyxy5fKsBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:kBPKZmO/n8Nj1+5DBi125EEkP94eQmDF60npEVDnVDx2YejA
X-Talos-MUID: =?us-ascii?q?9a23=3APZf2Ew7wtbzu/7zYZX4eo4FHxow35J6CFGEQyaw?=
 =?us-ascii?q?KqvSAdgBPZjKTpXeeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="812896267"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:07:26 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id 2CECD18000146;
	Thu, 20 Aug 2026 09:07:26 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id C6BA1CC12A6; Thu, 20 Aug 2026 02:07:25 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH] python3-babel: fix CVE_PRODUCT
Date: Thu, 20 Aug 2026 02:07:25 -0700
Message-Id: <20260820090725.60570-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243825

From: Tim Orling <tim.orling@konsulko.com>

Recipe (PV): python3-babel (2.14.0)
Before -> After: python:Babel -> pocoo:babel
Newly caught CVEs: CVE-2021-42771 (locale .dat deserialization RCE)
Status: patched (fixed 2.9.1)

Note: The original commit targeted python3-babel_2.18.0.bb. This is
adjusted for Scarthgap, where the recipe version is 2.14.0.

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 134175fa92b85e639dc4646d9a88eeaba0fae4d3)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-babel_2.14.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-babel_2.14.0.bb b/meta/recipes-devtools/python/python3-babel_2.14.0.bb
index cd40d4222b..5185fb21f5 100644
--- a/meta/recipes-devtools/python/python3-babel_2.14.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.14.0.bb
@@ -9,6 +9,8 @@ PYPI_PACKAGE = "Babel"
 
 inherit pypi setuptools3
 
+CVE_PRODUCT = "pocoo:babel"
+
 CLEANBROKEN = "1"
 
 RDEPENDS:${PN} += " \
-- 
2.35.6

