Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C58CA6003
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 09:23:56 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16133.1791192228872231660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 02:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Z3JHCE1f;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2892; q=dns/txt;
  s=iport01; t=1791192229; x=1792401829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YbvEYg8TC0HWh0dA/x3iLMSyl7iJ8mGtEGLlEVBDxak=;
  b=Z3JHCE1f7bR64M08sOl7Oy2iOqnuojgI9vtCLjNP/oPpVGe2pqvfaoIk
   BlBRShWNJdn0EAkZNPr5bGeIza8wNSDgCXThyzrSzpwUyQHq0dp4STAG6
   dedYNpkElB13Ec+BykR1G+LrQNjWz6y5AUt++TIpAfcwDy0iy79D1DFXa
   spAEP8YtG4+fD+FvJ5A7XqzvZ/rJNReHm6gccoFSiL7qcwCrlHiby+DFU
   ugxItj3z2J2z7PNlnnCzCDgIulHDC1aniM6tR5jkwqBW9TpnoV4TUpCOs
   dNdkRvYUDMmTT0kM+zgS0xy+/vXaxuwzC55hCR8kpmJf4hkjlT2DssyDJ
   A==;
X-CSE-ConnectionGUID: eNOMHENwTECIl7YdNpubNw==
X-CSE-MsgGUID: 8UJwV8cgS2uUNEtmw3q3Yg==
X-IPAS-Result: =?us-ascii?q?A0BNAgA6a8Nq/5H/Ja1aglmCV3VhQkmWSgOaFoQEgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4JAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBmDAgGCdAIBEbU1gXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2zIBCxQBBYEzhUCII10YAYR8JxsbgXKBFYNpgQWBXAEBAoE2d?=
 =?us-ascii?q?YV4BIIigQyBWh6TTkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBBxsGB?=
 =?us-ascii?q?YEdgSCCFiMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJUUSRyYiC?=
 =?us-ascii?q?BIJARMaMAuBGzg8CShEFwwQGA1IESw3FRkEPm4HkFAeghNNAXoJCgEqAYFal?=
 =?us-ascii?q?AqQHYIhoQ8KKIN2jCKVOhozqm8LmH2KC4N/llCEaYFoPIFHCwdwFYMiCUoZD?=
 =?us-ascii?q?445g2uBf4MUxyYkNQIJMgEBBwIHDgMLgWiQAYF9AQE?=
IronPort-Data: A9a23:UheJa6qm0290/N9zP0zP2E5KWvVeBmJOZBIvgKrLsJaIsI4StFCzt
 garIBnSMveIN2LxeNt+O4yx9x8PvpDcmIUxTVBvrHhmFiIUoOPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8E835pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0utRJkRu2
 NoHFB0mTxTctu6Q2K+xbPY506zPLOGzVG8ekmtrwTecCbMtRorOBv2ao9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVfrSn8/w7pX7Wz1EqFuWrLAf6GnIxws327/oWDbQUoHRHZsPwxvD+
 woq+UypPzMFCoyUxgHf70+Kq/PKgnjiA7MdQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YRLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:eobiIKDRfjB/0FDlHel055DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygd179
 YHT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ASV0mlhD0JcTpy1SZNNXF7OaY=
X-Talos-CUID: 9a23:qfkjGG8Eued4GnGviQGVv0MyPeUFX1vC8Fr7AkvnOGpPUKCfb0DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AaGQQUA/MlxaMeCCYctrSSXuQf5dVwbuQWEsCqs8?=
 =?us-ascii?q?bhu+pKSlvYC7GvTviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="530625535"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Oct 2026 09:23:48 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id B6E21180001C1;
	Mon,  5 Oct 2026 09:23:48 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 4FE36CC129C; Mon,  5 Oct 2026 02:23:48 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH v2 6/8] libxml2: Fix CVE-2026-86142
Date: Mon,  5 Oct 2026 02:23:44 -0700
Message-Id: <20261005092346.1670265-6-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261005092346.1670265-1-hthakar@cisco.com>
References: <20261005092346.1670265-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 09:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247229

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/GNOME/libxml2/commit/6b3a736c0edc74ceec3d82f5252499d7911b3a58
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86142

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
Changes in v2
- limit backport changes to 80 characters
---
 .../libxml/libxml2/CVE-2026-86142.patch       | 40 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86142.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86142.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86142.patch
new file mode 100644
index 0000000000..3308188649
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86142.patch
@@ -0,0 +1,40 @@
+From 51f0e78349cbbc9081f14e02f440733e5880fb3d Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Mon, 4 May 2026 09:32:43 +0200
+Subject: [PATCH] xpointer: Check overflow in xmlXPtrEvalXPtrPart
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1113
+
+CVE: CVE-2026-86142
+Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/6b3a736c0edc74ceec3d82f5252499d7911b3a58]
+
+Backport Changes:
+- Use xmlXPathErr(ctxt, XPATH_MEMORY_ERROR) because the Scarthgap xpointer
+  implementation does not provide the newer xmlXPathPErrMemory() call shape.
+  This preserves the XPath parser error state as well as reporting the
+  allocation failure.
+
+(cherry picked from commit 6b3a736c0edc74ceec3d82f5252499d7911b3a58)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ xpointer.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/xpointer.c b/xpointer.c
+index 6e1e5f46..f5457c9f 100644
+--- a/xpointer.c
++++ b/xpointer.c
+@@ -956,6 +956,13 @@ xmlXPtrEvalXPtrPart(xmlXPathParserContextPtr ctxt, xmlChar *name) {
+     level = 1;
+ 
+     len = xmlStrlen(ctxt->cur);
++    /* Overflow in xmlStrlen */
++    if (len == 0 && ctxt->cur != NULL && *ctxt->cur != 0) {
++        xmlXPathErr(ctxt, XPATH_MEMORY_ERROR);
++        xmlFree(name);
++        return;
++    }
++
+     len++;
+     buffer = (xmlChar *) xmlMallocAtomic(len);
+     if (buffer == NULL) {
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 240e8fe670..ec4b41bde5 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -36,6 +36,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-86138.patch \
            file://CVE-2026-86140.patch \
            file://CVE-2026-86141.patch \
+           file://CVE-2026-86142.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.35.6


