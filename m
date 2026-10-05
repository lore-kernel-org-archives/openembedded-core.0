Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED465CA6004
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 09:23:56 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16132.1791192228644084262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 02:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Ssor2DJj;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3589; q=dns/txt;
  s=iport01; t=1791192228; x=1792401828;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wpD1Sv+wphFbxMIssDf6pxmxfHDetGjI3YkBAsFIwQQ=;
  b=Ssor2DJjub49Shlg36pozw/sKrKN+ktTxh3KVpl8qmaOd0NmoSWhnIox
   E6R/s05db7BNKVkr61qNQhRQHgc2DfkTTR6G2a1nodMhd1AiiEJdu0uI1
   5v8CX7AIjlWwr7+MvVgaCcAcgzACiGWR6Oayb4z+7tIeBjBjg9VeMB/u9
   HD/h3iTzkB2qmftt2qr+lLdyCVdDblQnBB0GIYJApj3B+Tq02RCPpp/5C
   Ls4gQbFtRSifZD4OXUDB5cV4TGrUQHyabFFFal/wi0/FxL7f/CTm5bOy4
   suh4S9oQTF5OKlkzujE/RfmP8tF+Dag6k2lDQ6aadZh8xoZA5YSLJ9OeF
   w==;
X-CSE-ConnectionGUID: Wiuxby0cThetPiDvI+Na8w==
X-CSE-MsgGUID: iZTZ4yNuRbmUnefyONSd5Q==
X-IPAS-Result: =?us-ascii?q?A0BGAgC3a8Nq/5T/Ja1aglmCV3VhQkmWSotnkjaBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGEP0aOCwImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECASoLARgBLSwDAQJPCyMhgwIBgjoDNwIBEbUxgXkzgQGDK?=
 =?us-ascii?q?QE/AkNQ2EsNgloBCxQBBYEzhUCCf4UkXRgBhHwnGxuBcoEVg2mBBYEaQgEBA?=
 =?us-ascii?q?oE2hm0EgiKBDIFaHpNOSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EHG?=
 =?us-ascii?q?wYFgR2BIIIWIxk2eoEJXoErKWABEBeBCYIHAoJUggACAUlBDgdFUwklRRJHJ?=
 =?us-ascii?q?iIIEgkBExowC4EbODwJKEQXDBAYDUgRLDcVGQQ+bgeQUB6CE00BegkKASoBI?=
 =?us-ascii?q?oEhQaN9giGgHnEKKIN2jCKPPoV8GjOEBJQXklQLmH2OCoQJkV9ohGmBaDyBR?=
 =?us-ascii?q?wsHcBWDIglKGQ+OOYNrgX+DFMcmJDUCCTIBAQcCBw4DC4FokAGBfQEB?=
IronPort-Data: A9a23:PaT0kKIgxP3QROwwFE+Rh5QlxSXFcZb7ZxGr2PjKsXjdYENS0TcBy
 2ROWDuDaf3fa2anf99yYY3n8kwHsJLUmtBgTQAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2Yoajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1RDVwmN5xA8dp3DH129
 NAGCXMrZ0Cc0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAVLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MESojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQsi+G3YIaFJ4ziqcN9n3Skl
 D7X2XnDCBQnMtGR2B2jyX7xv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++NukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:qNk5NqN2bY1n1cBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:Q2YplmM1yNEF6u5DZyh65EQFQssZcnDB9Hb8PW77L285V+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AchJUIg6rHUXDHIlvduLNtQk/xoxp0ZicVFErjK8?=
 =?us-ascii?q?MvvSCOCJhHBGmgGmOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="531284858"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Oct 2026 09:23:47 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 9397618000140;
	Mon,  5 Oct 2026 09:23:47 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id BE38DCC1292; Mon,  5 Oct 2026 02:23:46 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH v2 1/8] libxml2: Fix CVE-2026-86137
Date: Mon,  5 Oct 2026 02:23:39 -0700
Message-Id: <20261005092346.1670265-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 09:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247226

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/GNOME/libxml2/commit/76fe08d97de88bfaef2f7d5cd27f11954cc5bee2
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86137

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
Changes in v2
- limit backport changes to 80 characters
---
 .../libxml/libxml2/CVE-2026-86137.patch       | 63 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch
new file mode 100644
index 0000000000..4a22436563
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch
@@ -0,0 +1,63 @@
+From a9d489b86e46188d1c0fde7dbd0aa8281596e6d6 Mon Sep 17 00:00:00 2001
+From: Hieu Le Minh <leminhhieu.opensource@gmail.com>
+Date: Sat, 18 Apr 2026 21:18:24 +0700
+Subject: [PATCH] xmlregexp: Prevent out-of-bounds read in NXT macro
+
+Fixes: https://gitlab.gnome.org/GNOME/libxml2/-/issues/1099
+
+CVE: CVE-2026-86137
+Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/76fe08d97de88bfaef2f7d5cd27f11954cc5bee2]
+
+Backport Changes:
+- Add the parser-context length field and allocation-failure guard required by
+  the Scarthgap 2.12.10 source, which lacks both pieces of the upstream
+  context.
+- The allocation-failure guard is completed by the subsequent
+  CVE-2026-86141.patch, which moves strlen() after the xmlStrdup() null check;
+  keep that patch after this one in SRC_URI.
+
+(cherry picked from commit 76fe08d97de88bfaef2f7d5cd27f11954cc5bee2)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ xmlregexp.c | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/xmlregexp.c b/xmlregexp.c
+index f434a0cf..320a35ce 100644
+--- a/xmlregexp.c
++++ b/xmlregexp.c
+@@ -56,7 +56,9 @@
+     xmlRegexpErrCompile(ctxt, str);
+ #define NEXT ctxt->cur++
+ #define CUR (*(ctxt->cur))
+-#define NXT(index) (ctxt->cur[index])
++#define NXT(index)									\
++    (((size_t)(ctxt->cur + index - ctxt->string) < ctxt->len)				\
++      ? ctxt->cur[index] : 0)
+ 
+ #define NEXTL(l) ctxt->cur += l;
+ #define XML_REG_STRING_SEPARATOR '|'
+@@ -245,6 +247,7 @@ typedef xmlRegParserCtxt *xmlRegParserCtxtPtr;
+ struct _xmlAutomata {
+     xmlChar *string;
+     xmlChar *cur;
++    size_t len;
+ 
+     int error;
+     int neg;
+@@ -698,8 +701,14 @@ xmlRegNewParserCtxt(const xmlChar *string) {
+     if (ret == NULL)
+ 	return(NULL);
+     memset(ret, 0, sizeof(xmlRegParserCtxt));
+-    if (string != NULL)
++    if (string != NULL) {
+ 	ret->string = xmlStrdup(string);
++	ret->len = strlen((const char *) ret->string);
++        if (ret->string == NULL) {
++            xmlFree(ret);
++            return(NULL);
++        }
++    }
+     ret->cur = ret->string;
+     ret->neg = 0;
+     ret->negs = 0;
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index d476ba14b6..e4db345af4 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -32,6 +32,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-0992-03.patch \
            file://CVE-2026-1757.patch \
            file://CVE-2026-11979.patch \
+           file://CVE-2026-86137.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.35.6


