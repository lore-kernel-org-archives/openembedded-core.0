Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4F5C44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 06:05:37 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7799.1784268319713933405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 23:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SPINqKeQ;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2975; q=dns/txt;
  s=iport01; t=1784268319; x=1785477919;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=A1fvM1ebbTeedBXwM/XRlKM940h+7WSbtr33iP1qMEQ=;
  b=SPINqKeQrppN9/hee/raNxxO70nkGkqg3ImJw/QLFVEtN7rYv5AJeRf1
   KsHY4mVKqyBqYFdNM1jsuneneoIH0+UwgHDIOdaXmS+j7YvZqA+3+GPlY
   MNIeEfS9VyXCzrHbL0yf6LmG742nguj9d4Ecx6HVI6l1/8uXzxtmApkCe
   bjPBL81oR45uS7RrQiw2fKaGYOr4yIHMzKops3grSmKTKW6/1Nhe7f2fP
   AHjvFp08HB8FZaVLbPZtsyaiDIaMk6FnFThNl7Uls+OUSmgdsqYxTOeXC
   rra9SCwCUJir2yshBs0E9KX/mKlYDrEnU452d9qwP2mw+gLhFFtn93n10
   g==;
X-CSE-ConnectionGUID: 2nvmsg9TQLyGCDmeiHnHPQ==
X-CSE-MsgGUID: yXKfwgxfTS24QKYwhMHsVw==
X-IPAS-Result: =?us-ascii?q?A0BJAgBIxVlq/43/Ja1aglmCV3RfQkmUKYIhA4tkkjeBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGEP0YCjVICJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GWgECAQMnCwEYAT0cAwECLyALIwgRCIMCAYI6AzcDEbx6G?=
 =?us-ascii?q?jeBeTOBAYMoAT8CQ1DYSQ2CWAELFAGBOIU/gn2FI1wYAYR8JxsbgXKEfoEFg?=
 =?us-ascii?q?RpCAQGBJ4EGhXgEgiKBDIFaHoRziw5IgR4DWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQwbBwWBHYE6gQCEdiMfAzl/gS91SnctahIXgU6CFIE+AwsYDUgRL?=
 =?us-ascii?q?DcUGwQ+bgeNSCOCP4EOASuBQxGmS6AhcQoog3WMIY8+hXwaM6psC5h9jgqEC?=
 =?us-ascii?q?ZJHhGmBaDyBKB8LB3AVgm4BMwlKGQ+OOINrgX/MQTw1AgkyAQEHAgcOAwuBa?=
 =?us-ascii?q?JAAgX4BAQ?=
IronPort-Data: A9a23:9BwMAq/0K24JmAHki5EhDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 TEXCjiPO/qCMGegLY11Pd+y80sP6sTWndFhHFQ4pH1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbTtKs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lsO5Md4ekmPVhq5
 NMzBDUAbzCFp9qPlefTpulE3qzPLeHxN48Z/3UlxjbDALN+HdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Qn1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FbYOMJoXbGZQL9qqej
 nP23GrmDQEUCOfFlQOmw22so8/UozyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjRCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:b/IZL66hVHYN9pKnwgPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AFZ2Kn2oNU3Jli8vyLt3l4w3mUZojbHjGwybsGmu?=
 =?us-ascii?q?pJk1FTbCUaVmwwJoxxg=3D=3D?=
X-Talos-MUID: 9a23:eqPSOAXcGPZzOc7q/C7cpz99O9dm35/0VHkuoIoGnumfCzMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="511419496"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 06:05:18 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 946CE180005C6
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:05:18 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id B3B71CC037D; Fri, 17 Jul 2026 11:35:16 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 03/10] expat: fix CVE-2026-56404
Date: Fri, 17 Jul 2026 11:34:30 +0530
Message-Id: <20260717060437.2910653-4-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260717060437.2910653-1-deeratho@cisco.com>
References: <20260717060437.2910653-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241142

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/babfc48090977cbf7be24b2c48f6053dca75c164
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56404

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../expat/expat/CVE-2026-56404.patch          | 45 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56404.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56404.patch b/meta/recipes-core/expat/expat/CVE-2026-56404.patch
new file mode 100644
index 0000000000..d147a7502c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56404.patch
@@ -0,0 +1,45 @@
+From d8e09a54fa9214e64d8e73057ca6918d08857022 Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Thu, 28 May 2026 12:44:11 +0530
+Subject: [PATCH 04/17] lib: protect function addBinding from signed integer
+ overflow
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
+index 12bbe23e..9d21e136 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -4456,6 +4456,10 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
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
+@@ -4496,8 +4500,13 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
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
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index acd943b4e6..815b31fc10 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -54,6 +54,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56403_p1.patch;striplevel=2 \
            file://CVE-2026-56403_p2.patch;striplevel=2 \
            file://CVE-2026-56408.patch;striplevel=2 \
+           file://CVE-2026-56404.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

