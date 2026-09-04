Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25185C624D3
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 12:08:43 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12258.1788523718853493136
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 05:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GnMapk1+;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5960; q=dns/txt;
  s=iport01; t=1788523718; x=1789733318;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KFixegvjdJ0MbS4StT8jeYLMnYMOrLlIcXinLqXLrMM=;
  b=GnMapk1+T6rm+PCxszG0PgsCSnp+7wWCx462IQIdrlQwexfMycy6fvsk
   LFlUy0qDAA4xD0EXR/B4CkjAVuOhYgOOkCUcQx2tSEsikgjmtq6JLy18W
   Bna3RJFLW/W5ITkJk8IvU/iEzX/1n7Bb/em76yBT1Zpc4k8WpjmpwcA/B
   g89VnzrEFTsxMu3aHrxHKxmpOOHI8p4ZLcgz8K/QtQwbdrRtYtzOQnFUJ
   eEPzAp81ajHsCS0tdS17hpYiCb+4VNLOnkRxZmqxuFWAPyxVKWrei/ABl
   X9b5BHvLvQypthdyyG9IcDNqgbqE01nreSv+OOGPHdXYBEpB5c/RZHsDG
   A==;
X-CSE-ConnectionGUID: j5qiA0EXQ5aqbfIndTb3Dg==
X-CSE-MsgGUID: KJXK6st3TieVg9Kc+BNThw==
X-IPAS-Result: =?us-ascii?q?A0AoAABEtJpq/4wQJK1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0YUJJjHKVP5I3gX4PAQEBD0QNBAEBhQWOBAImNAkOAQIEAwIDAQEBAQEBA?=
 =?us-ascii?q?QEBAQELAQEFAQEBAgEHBYEOE4ZPDZAcAQIBNQEYAS0sAwECTwsjIYMCAYI6A?=
 =?us-ascii?q?zcCARHCXoIsgQGDKAE/AkNQ2EsNglkBCxQBBYEzAYU+gn+FI10YAYR8Jxsbg?=
 =?us-ascii?q?XKBFYNpgQWBGkIBgUmGXQSCIoEMgVoYBpFvSIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4EHGwYFgR2BJ4M/Ixk2eoEJXoErKWABEheBCYIIAoJUggMCA?=
 =?us-ascii?q?UlDDgdHUwknQQQLGA1IESw3FRkEPm4Hjl8fglCBDgEqAZVkB5I3oB5xCiiDd?=
 =?us-ascii?q?owijz6FfBozqm0LmH2OCoQJkkeEaYFoPIFHCwdwFYMiCUoZD44rDguDYIF/y?=
 =?us-ascii?q?jokNQIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:ZsW1T6rLiE/P3BXOh08+IW6jIIdeBmJPZBIvgKrLsJaIsI4StFCzt
 garIBmPMq2IamLzKNF/PY6090kEsMTTytViS1Q+rC5jESIb+OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrS8E835ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0uQqGGBnr
 dEoEW0EdxqNpuS6/LjgZuY506zPLOGzVG8eknhkyTecCbMtRorOBv2Ro9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtPYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9KofSGJwJwxvEz
 o7A10fbMjJEL8DE9TuIzH39peSMtwXHWJ1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFmUHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:0Y4fpqhF6t3ATBTxr4NKMgxH2nBQXvYji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8gTFh4pgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:WtuwymAPDXclRNb6Eys67U89Qu0VSyDU1X3eAkm0NWwyZLLAHA==
X-Talos-MUID: 9a23:k/NDNwryB7644/SUHD4ezxJABOQ2+Lj1NEEAr5pXmMLHHwpMOyjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,262,1779148800"; 
   d="scan'208";a="830514554"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Sep 2026 12:08:37 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id B289F180007CC;
	Fri,  4 Sep 2026 12:08:37 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 4A3C5CE1C03; Fri,  4 Sep 2026 05:08:37 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH v2] wget: Fix CVE-2026-58470
Date: Fri,  4 Sep 2026 05:08:30 -0700
Message-Id: <20260904120830.665130-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 12:08:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245092

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].
It also includes the upstream regression patch from commit
shown in [3] which changes all three Content-Range conversions to strtoll().

[1] https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c6ffd30c34ffcf
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58470
[3] https://gitlab.com/gnuwget/wget/-/commit/01ff771caac1958662ca8665eed2021ec386a7af

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
Changes in v2
- added the regression commit
---
 .../wget/wget/CVE-2026-58470-regression.patch | 48 +++++++++++
 .../wget/wget/CVE-2026-58470.patch            | 79 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.21.4.bb     |  2 +
 3 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470-regression.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58470-regression.patch b/meta/recipes-extended/wget/wget/CVE-2026-58470-regression.patch
new file mode 100644
index 0000000000..c452261a9a
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58470-regression.patch
@@ -0,0 +1,48 @@
+From 01ff771caac1958662ca8665eed2021ec386a7af Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Wed, 12 Aug 2026 19:45:21 +0200
+Subject: [PATCH] * src/http.c (parse_content_range): Use strtoll instead of
+ strtol.
+
+CVE: CVE-2026-58470
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/01ff771caac1958662ca8665eed2021ec386a7af]
+
+(cherry picked from commit 01ff771caac1958662ca8665eed2021ec386a7af)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/http.c b/src/http.c
+index e5e75ee695..8170a43c27 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -949,7 +949,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+     return false;
+ 
+   errno = 0;
+-  num = strtol(hdr, &end, 10);
++  num = strtoll(hdr, &end, 10);
+   if (errno == ERANGE)
+     return false;
+   hdr = end;
+@@ -959,7 +959,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+   *first_byte_ptr = num;
+ 
+   errno = 0;
+-  num = strtol(hdr, &end, 10);
++  num = strtoll(hdr, &end, 10);
+   if (errno == ERANGE)
+     return false;
+   hdr = end;
+@@ -976,7 +976,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+   else
+     {
+       errno = 0;
+-      num = strtol(hdr, NULL, 10);
++      num = strtoll(hdr, NULL, 10);
+       if (errno == ERANGE)
+         return false;
+     }
+-- 
+2.35.6
diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58470.patch b/meta/recipes-extended/wget/wget/CVE-2026-58470.patch
new file mode 100644
index 0000000000..7ee4e87344
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58470.patch
@@ -0,0 +1,79 @@
+From bfbab29e0a94160b283a8101e122d07684104955 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Mon, 29 Jun 2026 18:57:54 +0200
+Subject: [PATCH] * src/http.c (parse_content_range): Fix integer overflow
+
+Reported-by: TristanInSec@gmail.com
+
+CVE: CVE-2026-58470
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c6ffd30c34ffcf]
+
+(cherry picked from commit 43d3ba9336bc94937e6fae2365c6ffd30c34ffcf)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http.c | 35 ++++++++++++++++++++++++-----------
+ 1 file changed, 24 insertions(+), 11 deletions(-)
+
+diff --git a/src/http.c b/src/http.c
+index 116a93a3..4dc6b70f 100644
+--- a/src/http.c
++++ b/src/http.c
+@@ -914,6 +914,7 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+                      wgint *last_byte_ptr, wgint *entity_length_ptr)
+ {
+   wgint num;
++  char *end;
+ 
+   /* Ancient versions of Netscape proxy server, presumably predating
+      rfc2068, sent out `Content-Range' without the "bytes"
+@@ -932,27 +933,39 @@ parse_content_range (const char *hdr, wgint *first_byte_ptr,
+     }
+   if (!c_isdigit (*hdr))
+     return false;
+-  for (num = 0; c_isdigit (*hdr); hdr++)
+-    num = 10 * num + (*hdr - '0');
+-  if (*hdr != '-' || !c_isdigit (*(hdr + 1)))
++
++  errno = 0;
++  num = strtol(hdr, &end, 10);
++  if (errno == ERANGE)
++    return false;
++  hdr = end;
++
++  if (*hdr++ != '-' || !c_isdigit (*hdr))
+     return false;
+   *first_byte_ptr = num;
+-  ++hdr;
+-  for (num = 0; c_isdigit (*hdr); hdr++)
+-    num = 10 * num + (*hdr - '0');
+-  if (*hdr != '/')
++
++  errno = 0;
++  num = strtol(hdr, &end, 10);
++  if (errno == ERANGE)
++    return false;
++  hdr = end;
++
++  if (*hdr++ != '/')
+     return false;
+   *last_byte_ptr = num;
+-  if (!(c_isdigit (*(hdr + 1)) || *(hdr + 1) == '*'))
++  if (!(c_isdigit (*hdr) || *hdr == '*'))
+     return false;
+   if (*last_byte_ptr < *first_byte_ptr)
+     return false;
+-  ++hdr;
+   if (*hdr == '*')
+     num = -1;
+   else
+-    for (num = 0; c_isdigit (*hdr); hdr++)
+-      num = 10 * num + (*hdr - '0');
++    {
++      errno = 0;
++      num = strtol(hdr, NULL, 10);
++      if (errno == ERANGE)
++        return false;
++    }
+   *entity_length_ptr = num;
+   if ((*entity_length_ptr <= *last_byte_ptr) && *entity_length_ptr != -1)
+     return false;
diff --git a/meta/recipes-extended/wget/wget_1.21.4.bb b/meta/recipes-extended/wget/wget_1.21.4.bb
index cb05ff34f8..606aea1940 100644
--- a/meta/recipes-extended/wget/wget_1.21.4.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -5,6 +5,8 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58469.patch \
            file://CVE-2026-58469-regression_p1.patch \
            file://CVE-2026-58469-regression_p2.patch \
+           file://CVE-2026-58470.patch \
+           file://CVE-2026-58470-regression.patch \
           "
 
 SRC_URI[sha256sum] = "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea51df27525bcde04c"
-- 
2.35.6


