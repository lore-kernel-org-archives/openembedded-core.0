Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6272CA600B
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:24:14 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7413.1791372244554303592
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=i6pqJUPC;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3619; q=dns/txt;
  s=iport01; t=1791372244; x=1792581844;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=sE/faF/GoizlWdEKNR5em8Ju03e0AkbvcwSo/8Z0uog=;
  b=i6pqJUPCUJbZ7xPm2wjhWwABIPWIJaGa4KtiZ8yUb1NubheTTphWohCa
   9hzLsDeIVkwhjeh3f7KbST3Z5FTXb/WP5ZgwRoTD34RH1ZTRReIwsYVFA
   TSgAGHhALWqETSc0kYlL7fzbWUWzm1JfX96z3rhE6/xk3lzxZITgrVJ9m
   ExY4XWvUXn+VquDTpScLizCI1eyxiLpzPJZ03PdV6P5G7+iFyWA/EaBgO
   33YRal+TuE8H1V8Q1Q6pKNxV24Ociy2cQLssdQ8y6EhlBxYX4xZSK1aGs
   105yq/Xjs3XP3nTCgVkulduniYvi5u1rYNqJOLaDhVNE5kvPGmq8vEhpu
   g==;
X-CSE-ConnectionGUID: 49exehSgRZ+d3wcaB36nKw==
X-CSE-MsgGUID: +0gshxegRCa6PIhkDTSeVQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgCcKsZq/4z/Ja1aglmCV3VhQkmUKYIhA54agX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjgkCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgQCYMCAYJ0AgERBrVmgXkzg?=
 =?us-ascii?q?QGDKQE/AgJAAVDbMgELFAGBOIVAiCNdGAGEfCcbG4FygRWDaYEFgVwCAYFQh?=
 =?us-ascii?q?lQEgiKBDIFak3VIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQcbBgWBH?=
 =?us-ascii?q?YEgghYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJA?=
 =?us-ascii?q?RMaMAuBGzg8CShBFwwpGA1IESw3FRkEPm4HkFsegmABLDQtASkBAYIDOgeTI?=
 =?us-ascii?q?EKRfKEPCiiDdowilToaM6pvmQiOCpVoaIRpgWg8gVlwFYMiCRY0GQ+OOYNrh?=
 =?us-ascii?q?kDFeSQ1AgkyAQEHAgcOAwuBaJACgXwBAQ?=
IronPort-Data: A9a23:Bz6tw6s7x+8PAXLqQzMIP7YiV+fnVAdfMUV32f8akzHdYApBsoF/q
 tZmKTiAb66ONzajKNEiPorl8hxVvZ/WztVmSgRtr38xHykTgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvrb90s21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwprd6EWxOz
 vMiGnMBNQ+IjsjtnrSYVbw57igjBJGD0II3oHpsy3TdSP0hW52GG/6M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtPYH49tL/Aan3XfzBGoVSOpbIf6GnIxws327/oWDbQUoHQGZ4Mwx3A+
 Qoq+Uy6Wh4BNMySxgCu+yyUp+/MsR/AVbwrQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YaLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehW/a1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:vi6rGqooen8O73b5ZgVw+0MaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3A0KonP2tp5iQaTSDAqlOGlDbS6It5I3DNwXfrLHW?=
 =?us-ascii?q?KSmoyV7acYwTO/oB7xp8=3D?=
X-Talos-MUID: 9a23:9ekCFAUvkJAYWuzq/Hy0iypiJMpn2Y+nVngskZYqh/KJCxUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,144,1787011200"; 
   d="scan'208";a="524315307"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Oct 2026 11:24:03 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id A06EF180001F0
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Oct 2026 11:24:03 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id 486DDCBF202; Wed,  7 Oct 2026 04:24:03 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 3/8] curl: fix CVE-2026-8286
Date: Wed,  7 Oct 2026 04:23:58 -0700
Message-Id: <20261007112403.486499-3-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261007112403.486499-1-devanshp@cisco.com>
References: <20261007112403.486499-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 11:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247390

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/curl/curl/commit/a86efdd7ca5433de9231e650f18247de8319ad16
[2] https://curl.se/docs/CVE-2026-8286.html

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../curl/curl/CVE-2026-8286.patch             | 60 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8286.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-8286.patch b/meta/recipes-support/curl/curl/CVE-2026-8286.patch
new file mode 100644
index 0000000000..f05d399eee
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8286.patch
@@ -0,0 +1,60 @@
+From 9fcd9cead5edb8638d4d767bd0077c405b0390be Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Thu, 7 May 2026 10:30:07 +0200
+Subject: [PATCH] url: fix connection reuse for starttls protocols
+
+When a connection is tested for reuse in a transfer that *may* upgrade
+to TLS (commonly via STARTTLS), the SSL configuration must match the
+existing connection.
+
+Reported-by: Andrew Nesbit
+Closes #21522
+
+CVE: CVE-2026-8286
+Upstream-Status: Backport [https://github.com/curl/curl/commit/a86efdd7ca5433de9231e650f18247de8319ad16]
+
+Backport Changes:
+- curl 8.7.1 predates the url_conn_match refactor. Carry the upstream
+  may-TLS and require-TLS distinction in ConnectionExists() and keep
+  the upstream TLS configuration matching behavior.
+
+(cherry picked from commit a86efdd7ca5433de9231e650f18247de8319ad16)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ lib/url.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index dfcd6f4841..9e1ca0336c 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -935,7 +935,8 @@ ConnectionExists(struct Curl_easy *data,
+   /* plain HTTP with upgrade */
+   bool h2upgrade = (data->state.httpwant == CURL_HTTP_VERSION_2_0) &&
+     (needle->handler->protocol & CURLPROTO_HTTP);
+-  bool req_tls = data->set.use_ssl >= CURLUSESSL_CONTROL;
++  bool require_tls = data->set.use_ssl >= CURLUSESSL_CONTROL;
++  bool may_tls = data->set.use_ssl > CURLUSESSL_NONE;
+ 
+   *usethis = NULL;
+   *force_reuse = FALSE;
+@@ -1054,7 +1055,7 @@ ConnectionExists(struct Curl_easy *data,
+         continue;
+ 
+     if(!(needle->handler->flags & PROTOPT_SSL) &&
+-       req_tls && !Curl_conn_is_ssl(check, FIRSTSOCKET))
++       require_tls && !Curl_conn_is_ssl(check, FIRSTSOCKET))
+       continue;
+ 
+     if(needle->bits.conn_to_host != check->bits.conn_to_host)
+@@ -1202,8 +1203,8 @@ ConnectionExists(struct Curl_easy *data,
+          needle->remote_port != check->remote_port)
+         continue;
+ 
+-      /* If talking TLS, check needs to use the same SSL options. */
+-      if((needle->handler->flags & PROTOPT_SSL) &&
++      /* If talking/upgrading to TLS, check needs the same SSL options. */
++      if(((needle->handler->flags & PROTOPT_SSL) || may_tls) &&
+          !Curl_ssl_conn_config_match(data, check, FALSE)) {
+         DEBUGF(infof(data,
+                      "Connection #%" CURL_FORMAT_CURL_OFF_T
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index ba2968fc6c..38083b5842 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -42,6 +42,7 @@ SRC_URI = " \
     file://CVE-2026-6253.patch \
     file://CVE-2026-4873.patch \
     file://CVE-2026-13608.patch \
+    file://CVE-2026-8286.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


