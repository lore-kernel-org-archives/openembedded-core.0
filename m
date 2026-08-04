Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA6AC5518F
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 10:33:41 +0000 (UTC)
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13358.1785839617522410577
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 03:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BVx2g6uS;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3877; q=dns/txt;
  s=iport01; t=1785839617; x=1787049217;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+Cuo21ozdDdcvbLYrgjR7XCRvQyd4Dpbf6j0BQ8c3uY=;
  b=BVx2g6uSwjhClGn8K/OVrmE+hRyRdt5Y69lP0MJa8KZsKL1JZb6uyaRz
   g+YQ89pkFSI6leZS1dUfkw0QZI351zNxcI9wzu3AeVoFzFTs/ApRzlsKs
   zov6qqG5/RaetdRmCQwVdOmKPy3mWqJTh20DPABCHOisjrihQFyisu0Hf
   biA2n4kca70v2iiM7YaNHnq8RUBqCjgohYXSi9v5sihjuF1L9gOsKkHQx
   YXMwYKtAUP4OR0xfBy2ftdb8FrNX6vyoT9STR42O4M7674CrjRxxs54ZZ
   choCi7OnruMi5Sj/WBbgNLZZY7YdVXQyPDwboMJXEJknsOAiy64GySdO9
   Q==;
X-CSE-ConnectionGUID: 6g4HRCLoTACw+pEY8GbDgg==
X-CSE-MsgGUID: MbaU1vVpRmSoW26Nc3V6WQ==
X-IPAS-Result: =?us-ascii?q?A0BHAgCJv3Fq/9BK/pBaHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOeG4F+DwEBAQ9EDQQBAYUFAo1nAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBAgEDJwsBGAE9HAMBAi8rIwgRCIMCAYJ0AxEGv?=
 =?us-ascii?q?miBeTOBAYMoAT8CAkABUNsuAQsUAYE4hT+IIV0YAYR8JxsbgXKBFYNpgQWBX?=
 =?us-ascii?q?AIBgVCGVASCIoEMgVqQeUiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBD?=
 =?us-ascii?q?RsHBYEdgSsshFMjGTZ8gS91SnUtahIXgRqDFQKCekMLGA1IESw3FBkEPm4Hj?=
 =?us-ascii?q?gYggkQBLDQtASkBAYIFOAUMkxZCkXmhEgoog3WMIZU6GjOqbJkIjgqWAAFPh?=
 =?us-ascii?q?GmBaDyBWXAVgyIJFjQZD444g2uGQMVhPDUCCTIBAQcCBw4DC4FokAKBfAEB?=
IronPort-Data: A9a23:F1tDdapOL5Gh+L7uRHh9YshUwCBeBmJMZBIvgKrLsJaIsI4StFCzt
 garIBnSa6nbY2Ghed4lOo2woxwFvcfSnNc3HgRr+3g3ES8Xo+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrT8E835ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0rh4XUF03
 tgfFBkmcVObqtPm77iXReY506zPLOGzVG8eknht13TdSP0hW52GG/qM7t5D1zB2jcdLdRrcT
 5NFNXw1MUiGPEEJYA9HYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoHbGZwFxx3Iz
 o7A10HzCyxDKuKH8z++9U322MnExh2lZ7tHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QyXj66R6AGDCy1cEXhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:waA9nKlHXK9eyUwVoKC50039oWvpDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3AQda4zWgcGBLv7DVVqiVEFYFNUDJuLHKB7E37B0i?=
 =?us-ascii?q?EIE12C6W4eA+/8o9rnJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A+LZdHA6lyL1rgLYQLmigHnq9xoxN6a2TUV4zia8?=
 =?us-ascii?q?DgM67b3JWMGyj0guOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,204,1779148800"; 
   d="scan'208";a="59418138"
Received: from aer-l-core-07.cisco.com ([144.254.74.208])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Aug 2026 10:33:13 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-07.cisco.com (Postfix) with ESMTPS id 585A918000215
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 10:33:13 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 163ADCC037D; Tue,  4 Aug 2026 16:03:12 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 1/5] curl: fix CVE-2026-4873
Date: Tue,  4 Aug 2026 16:03:01 +0530
Message-Id: <20260804103305.1180770-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260629104801.972184-1-adongare@cisco.com>
References: <20260629104801.972184-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 10:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242710

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream backport for CVE-2026-4873.
The upstream fix commit is referenced in [1], and the public
CVE advisory is referenced in [2].

[1] https://github.com/curl/curl/commit/507e7be573b0a76fca597b75ff7cb27a66e7d865
[2] https://curl.se/docs/CVE-2026-4873.html

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
- Changes from v1 to v2: Rebase the patches on top of scarthgap latest
fixes and updated the patch to include the fixed commit instead of
CVE_STATUS as per Paul's suggestion in Wrynose series.
 .../curl/curl/CVE-2026-4873.patch             | 58 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-4873.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-4873.patch b/meta/recipes-support/curl/curl/CVE-2026-4873.patch
new file mode 100644
index 0000000000..bc6268da7d
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-4873.patch
@@ -0,0 +1,58 @@
+From a7e6dd14ee3900226066819a0334defb58c52486 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 28 Jul 2026 04:35:55 -0700
+Subject: [PATCH] url: do not reuse a non-tls starttls connection if new
+ requires TLS
+
+Reported-by: Arkadi Vainbrand
+
+Closes #21082
+
+CVE: CVE-2026-4873
+Upstream-Status: Backport [https://github.com/curl/curl/commit/507e7be573b0a76fca597b75ff7cb27a66e7d865]
+
+Backport Changes:
+- Upstream adds req_tls to struct url_conn_match, sets match.req_tls in
+  url_attach_existing(), and enforces it in url_match_ssl_use() when a
+  clear-text requested scheme is matched with a candidate connection
+  that is not actually using TLS.
+- Scarthgap curl 8.7.1 does not have struct url_conn_match or the
+  url_attach_existing()/url_match_ssl_use() split. The equivalent reuse
+  matching still happens directly in ConnectionExists(), so this backport
+  keeps the same state in a local req_tls variable derived from
+  data->set.use_ssl.
+- The rejection check is placed after the general SSL compatibility
+  check and uses Curl_conn_is_ssl(check, FIRSTSOCKET). This preserves
+  valid implicit-TLS IMAPS/POP3S/SMTPS reuse while still rejecting a
+  clear-text STARTTLS-capable cached connection for a request that
+  requires TLS.
+
+(cherry picked from commit 507e7be573b0a76fca597b75ff7cb27a66e7d865)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/url.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/url.c b/lib/url.c
+index 30f215f..c4c5982 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -935,6 +935,7 @@ ConnectionExists(struct Curl_easy *data,
+   /* plain HTTP with upgrade */
+   bool h2upgrade = (data->state.httpwant == CURL_HTTP_VERSION_2_0) &&
+     (needle->handler->protocol & CURLPROTO_HTTP);
++  bool req_tls = data->set.use_ssl >= CURLUSESSL_CONTROL;
+ 
+   *usethis = NULL;
+   *force_reuse = FALSE;
+@@ -1052,6 +1053,10 @@ ConnectionExists(struct Curl_easy *data,
+         /* except protocols that have been upgraded via TLS */
+         continue;
+ 
++    if(!(needle->handler->flags & PROTOPT_SSL) &&
++       req_tls && !Curl_conn_is_ssl(check, FIRSTSOCKET))
++      continue;
++
+     if(needle->bits.conn_to_host != check->bits.conn_to_host)
+       /* don't mix connections that use the "connect to host" feature and
+        * connections that don't use this feature */
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 276526f01e..043143d30d 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -38,6 +38,7 @@ SRC_URI = " \
     file://CVE-2026-3784.patch \
     file://CVE-2026-5773.patch \
     file://CVE-2026-6276.patch \
+    file://CVE-2026-4873.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6

