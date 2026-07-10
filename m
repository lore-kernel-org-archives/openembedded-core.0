Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1994FC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 13:08:50 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12273.1783688925296239023
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 06:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kETpNx4v;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2768; q=dns/txt;
  s=iport01; t=1783688925; x=1784898525;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f2BocryYHJH5e6jIn00jU3SJmuBsL4QB6XOvDC8blwg=;
  b=kETpNx4voa6ZrXocaxMLHA/Mur7yyO5JTgpai//ZxdLo+V4qTwHZX+Ns
   kd8P1Ky9nUKSpaPI9hzoFGJILNTPwUAfVFsIcjVjPUqFC/iwAPh4y15Fc
   TPkRs3A6qQFK4Fu80RCxJh1B95jSuUtK6cGOAVXpe9xlZirWst/Ko38wA
   A5m37KW8SwMyLXqva456G9sIM8s9gsvbSQx8G/c8/IsmgMZx1HpOBJy9C
   1+QYbg4YIzzgoSIyKye3DwJk1Iid39rK4wRMgshyO5FJTfddoV+q9lwKT
   hrKQs9XXwYXYu1Z2C+yBmoKNI5B98cGpnRXD0ADq4BNFnXC034lbhIXH1
   Q==;
X-CSE-ConnectionGUID: IwBN4XVOQdm5mBSQbh1RJQ==
X-CSE-MsgGUID: K3z9YcCrRpmbq8nggzGH3w==
X-IPAS-Result: =?us-ascii?q?A0BFAgA+7VBq/4v/Ja1aglmCV3RfQkmUKYIhi2eSN4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/jhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgEtCwEYAVkDAQJPCyMhgwIBgjoDNgIBEblNGjeBeTOBAYMoA?=
 =?us-ascii?q?T8CQ1DYSQ2CWAELFAGBOIU/gnyFI1sYAYR8JxsbgXKEfoEFgRpCAQGBJ4EGh?=
 =?us-ascii?q?XgEgiKBDIFaHoUHimtIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbB?=
 =?us-ascii?q?wWBHYFZgQKEeSMfAzl/gTB1SnktcxIeCoFSghZUAwsYDUgRLDcUGwQ+bgeNP?=
 =?us-ascii?q?hcPgj6BDiyBQxGmTqAecQoog3WMIY8+hXwaM6psC5h9jgqECZJHhGmBaDyBK?=
 =?us-ascii?q?B8LB3AVgm4BMwlKGQ+OOINrgX/MWyQ1AgkyAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-Data: A9a23:O/tQm6wysij5CWv9WgZ6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUDz
 mZLDWrQPv7eYjGmKdt2YIXnoE0P75WEyIMyGgZt/FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYrajJMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGApF6tEythQOG1Lq
 PkyEwkHbkm5pdvjldpXSsE07igiBNPgMIVavjRryivUSK58B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2bMnWjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCwaIWFI4fQHZo9ckCwh
 TnUrlXyKQsgLNmV0GqD/X2+qc+UgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:lrOFsqoww5GNXkp6rJa46zAaV5obeYIsimQD101hICG9Ffbo9f
 xG88506faZslsssRIb6LO90cu7IE80nKQdieJ6AV7IZmbbUQWTQL2KlbGD/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njcLz7lq+P3l5xBQozlvhNQcT0=
X-Talos-CUID: =?us-ascii?q?9a23=3ArkNsEmkRFk/ohYMKPKvssPU5izjXOVzC5lGME3G?=
 =?us-ascii?q?fMGpsFbi/cmaa+PpesfM7zg=3D=3D?=
X-Talos-MUID: 9a23:+9Xclgqv9Et9+sL5KjwezxI5JpZZ6I+0MlgIm4xWvcaLJwNQYCjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="507813207"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jul 2026 13:08:44 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 4670A18000206
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:08:44 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id E8B3FCC2EC3; Fri, 10 Jul 2026 06:08:43 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 03/10] expat: fix CVE-2026-56404
Date: Fri, 10 Jul 2026 06:08:37 -0700
Message-ID: <20260710130837.2820614-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240643

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/babfc48090977cbf7be24b2c48f6053dca75c164
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56404

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56404.patch b/meta/recipes-core/expat/expat/CVE-2026-56404.patch
new file mode 100644
index 0000000000..8c72838f68
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56404.patch
@@ -0,0 +1,46 @@
+From 8cb4583ac3204175a03c8ea8e371adee583b0bec Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Thu, 28 May 2026 12:44:11 +0530
+Subject: [PATCH] lib: protect function addBinding from signed integer overflow
+
+CVE: CVE-2026-56404
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/babfc48090977cbf7be24b2c48f6053dca75c164]
+
+(cherry picked from commit babfc48090977cbf7be24b2c48f6053dca75c164)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 53f842d1..33b92c9c 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -4485,6 +4485,10 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
+   }
+ 
+   for (len = 0; uri[len]; len++) {
++    /* Detect and prevent signed integer overflow */
++    if (len == INT_MAX) {
++      return XML_ERROR_NO_MEMORY;
++    }
+     if (isXML && (len > xmlLen || uri[len] != xmlNamespace[len]))
+       isXML = XML_FALSE;
+ 
+@@ -4525,8 +4529,13 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
+   if (isXMLNS)
+     return XML_ERROR_RESERVED_NAMESPACE_URI;
+ 
+-  if (parser->m_namespaceSeparator)
++  if (parser->m_namespaceSeparator) {
++    /* Detect and prevent signed integer overflow */
++    if (len == INT_MAX) {
++      return XML_ERROR_NO_MEMORY;
++    }
+     len++;
++  }
+   if (parser->m_freeBindingList) {
+     b = parser->m_freeBindingList;
+     if (len > b->uriAlloc) {
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index 267e7db35b..affc134285 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56403_p1.patch;striplevel=2 \
            file://CVE-2026-56403_p2.patch;striplevel=2 \
            file://CVE-2026-56408.patch;striplevel=2 \
+           file://CVE-2026-56404.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


