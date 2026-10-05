Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B35FCA6001
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 09:23:56 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16134.1791192229269951145
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 02:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bjfxFJ/n;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3193; q=dns/txt;
  s=iport01; t=1791192229; x=1792401829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tNvc3OU0PD8PB4E0sqombF2QregvsOM5kAbxn9esO8Q=;
  b=bjfxFJ/ntwLBq9CJr2QjENsicmr4qGO8VHI6LsJdyHTeKQgxm++OM57n
   neVTn5McSfHA9WU/xB6fkRNp025Kz8SL5Rwa3nJrVju7P7GsKJ4QeQdSJ
   BYDQCvK0W84cfegX63LYwglXe3ZtwSRsdVn/8pnkOe81pnSCgoCXQpIP2
   QiKMX+iJK/vAluuYEcLZkNFdxNWU478EZVIjhRdkpd41q9U3KsmYbc0/l
   8qlQu4RBCk+f+mdNTOp11Jpw8ISPSo6ZYnuJVrRwHRX6ESjy0dak2qNh7
   Gj8ozbUyzKEof3Q67hcEDCzI99bBzDLXVpEqjTNazh9skhPbXlQyv7juc
   Q==;
X-CSE-ConnectionGUID: ITr+F7SGS8KC9KnmOykIUw==
X-CSE-MsgGUID: tOwNL8iwQNyuz+U1TL30dg==
X-IPAS-Result: =?us-ascii?q?A0BJAgA6a8Nq/4r/Ja1aglmCV3VhQkmWTYtkkjaBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGEP0YCjgkCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvIAsjCBmDAgGCOgM3AgERtTWBe?=
 =?us-ascii?q?TOBAYMpAT8CQ1DYSw2CWgELFAEFgTOFQIJ/hSRdGAGEfCcbG4FygRWDaYEFg?=
 =?us-ascii?q?RpCAQECiCMEgiKBDIFaHpNOSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F?=
 =?us-ascii?q?4EHGwYFgR2BIIIWIxk2eoEJXoErKWABEBeBCYIHAoJUggACAUlBDgdFUwklR?=
 =?us-ascii?q?RJHJiIIEgkBExowC4EbODwJKEQXDBAYDUgRLDcVGQQ+bgeQUB6CE02BDgEqA?=
 =?us-ascii?q?YJOozOCIaAecQoog3aMIo8+hXwaM6pvC5h9jgqECZJHhGmBaDyBRwsHcBWDI?=
 =?us-ascii?q?glKGQ+OOYNrgX+DFMcmJDUCCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:U+O3yagyUn/3cH/XoyZPoRG+X161NhEKZh0ujC45NGQN5FlHY01je
 htvDDvTbKqPYGD3et13aNzg80NU75CHzIU1SAs+/31gEStjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/rf8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU5xvw0Lz512
 sdICxtcTRaGoPO14Y+kH7wEasQLdKEHPasFsX1miDWcBvE8TNWbGuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWYQd/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKIIIfTH5QLwxzwS
 mTu40PmJDVKNcOm7yuY4DGR39Prxnv3V9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:P2tXu6HK35lXKE5ipLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:dchCcmOiEUTv4O5DeRV9t2BLIe8eIl72nVTWJmipCkdUV+jA
X-Talos-MUID: 9a23:3B/9cAbuMaQ3ceBTqxjzohUyNdhRxbWzGgMwyKki4JGIOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="523129652"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Oct 2026 09:23:48 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 44368180001C5;
	Mon,  5 Oct 2026 09:23:48 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 95908CC1273; Mon,  5 Oct 2026 02:23:47 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH v2 4/8] libxml2: Fix CVE-2026-86140
Date: Mon,  5 Oct 2026 02:23:42 -0700
Message-Id: <20261005092346.1670265-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261005092346.1670265-1-hthakar@cisco.com>
References: <20261005092346.1670265-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 09:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247230

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/GNOME/libxml2/commit/d1686f91dbda141a752200419d35639fd6b38340
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86140

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../libxml/libxml2/CVE-2026-86140.patch       | 56 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86140.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86140.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86140.patch
new file mode 100644
index 0000000000..bc7e069b09
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86140.patch
@@ -0,0 +1,56 @@
+From 7d324fcfa71e8567678ad254c0e10e509ebae99b Mon Sep 17 00:00:00 2001
+From: mohammadmseet-hue <mohammadmseet@gmail.com>
+Date: Thu, 16 Apr 2026 02:54:37 +0200
+Subject: [PATCH] fix: add bounds checks to xmlSnprintfElements in valid.c
+
+CVE-2025-24928 fixed xmlSnprintfElementContent for unchecked strcat()
+writes, but the sibling function xmlSnprintfElements has the identical
+unfixed pattern. The strcat(buf, "(") before the while loop and
+strcat(buf, ")") after the loop exit have no bounds checks.
+
+Add remaining-space checks before both strcat calls, with early return
+and ellipsis when space is insufficient.
+
+CVE: CVE-2026-86140
+Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/d1686f91dbda141a752200419d35639fd6b38340]
+
+(cherry picked from commit d1686f91dbda141a752200419d35639fd6b38340)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ valid.c | 16 ++++++++++++++--
+ 1 file changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/valid.c b/valid.c
+index ae4bb822..718e6d85 100644
+--- a/valid.c
++++ b/valid.c
+@@ -5047,7 +5047,15 @@ xmlSnprintfElements(char *buf, int size, xmlNodePtr node, int glob) {
+     int len;
+ 
+     if (node == NULL) return;
+-    if (glob) strcat(buf, "(");
++    len = strlen(buf);
++    if (glob) {
++        if (size - len < 50) {
++            if ((size - len > 4) && (buf[len - 1] != '.'))
++                strcat(buf, " ...");
++            return;
++        }
++        strcat(buf, "(");
++    }
+     cur = node;
+     while (cur != NULL) {
+ 	len = strlen(buf);
+@@ -5111,7 +5119,11 @@ xmlSnprintfElements(char *buf, int size, xmlNodePtr node, int glob) {
+ 	}
+ 	cur = cur->next;
+     }
+-    if (glob) strcat(buf, ")");
++    if (glob) {
++        len = strlen(buf);
++        if (size - len > 1)
++            strcat(buf, ")");
++    }
+ }
+ 
+ /**
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 53e8660366..98a3e3ce36 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -34,6 +34,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-11979.patch \
            file://CVE-2026-86137.patch \
            file://CVE-2026-86138.patch \
+           file://CVE-2026-86140.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.35.6


