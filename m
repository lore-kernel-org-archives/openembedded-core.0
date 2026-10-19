Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09F6CCF2E3
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 06:43:33 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28814.1792392206059043169
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 23:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VV30YKyl;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3163; q=dns/txt;
  s=iport01; t=1792392206; x=1793601806;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B2XFghZ/d7zWU8L9Iuccc9vF2Rg+kD2nXiVzDRyzPvo=;
  b=VV30YKyllG52TzBo/dBnpSzK2wWzCDSr4qoWutOzJ/blvBqrsYU8DwT4
   Gh3yUeEbqFXmx3o0UiR1rXbZ04ab+D0udU4IwQu/BYhCDenuwFxSxRx+4
   T23VPbRp5Pa34XalHrePLI917/5DhAEYteKFBCf1mB9D799GmR5o4vRB8
   rGVw5fPs+d5DgbKgxfvYuVIVgHRE1tiHJWhwk9DUeKqPSa7B4IUmG2q1o
   6q2JDiQpCawIJ/kNSnMJzzWUfZcRx+zs1gDuzWGVqpuNFtWSZutYcJ6rI
   053griBkTZkP9TKBwD0p7vi3cXNIQ+LtxqOmaD5p1mWfpPjdG1GV8lYPi
   Q==;
X-CSE-ConnectionGUID: AEARg5QHRHOaOsH+FQvviw==
X-CSE-MsgGUID: VlSkR1FUT42gK04Fg/g2yg==
X-IPAS-Result: =?us-ascii?q?A0BIAgBsu9Vq/5T/Ja1aglmCV3VgQ0mWSgOeHIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBmDAgGCdAMRBr0dGzeBeTOBA?=
 =?us-ascii?q?YMpAT8CAkABUNsyAQsUAYE4hUCII10YAYR8JxsbgXKEfoEFgVwCAYgkBIIie?=
 =?us-ascii?q?hKBWh6VP0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgSCCF?=
 =?us-ascii?q?iMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJARMaM?=
 =?us-ascii?q?AuBGzg8CShBFwxzDB0FcggCDQkHTRgNSBEsNxUZBD5uB5IqHoJkAWEtASkCg?=
 =?us-ascii?q?j2TJpI/oQ8KKIN2jCKVOhozqm8LmH2OCpZQhGmBaDyBWXAVgyIJFjQZD445g?=
 =?us-ascii?q?2uGQMgaJzICCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:ZTpqk6i9Mo/rfIULGYf/yUsNX161MREKZh0ujC45NGQN5FlHY01je
 htvDDjQP6nYM2SmLtxxO4Ti/BsBuZ6AmoUwTgE+/iw2FShjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/vS8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUx189NDjx31
 cY4DzkqdTDAqduo3rOkH7wEasQLdKEHPasFsX1miDWcBvE8TNWaGuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgd/5JEWxI9EglHzcDBcoVOErII84nPYy0p6172F3N/9J4fVHJUFzx7Gz
 o7A11r9ORIgbfKi9Wbf/VH02sHA2iyhSY1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBF2cHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:8MXHF6rKOvB4xfdaXvtI/x4aV5oJeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ANV0mlhD0Jcjpy1SZNNXB7OaY=
X-Talos-CUID: =?us-ascii?q?9a23=3AoXEtDGmvyb56CHUE2TFooULTEq7XOVTw5U3ffna?=
 =?us-ascii?q?YM0ZOQZqOaRy+wb16ktU7zg=3D=3D?=
X-Talos-MUID: 9a23:BGvdVAhygUCR6MkqsnAfS8MpCsNT4J73Jn0xzc8JmJHYGyM3NG2Mg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,167,1787011200"; 
   d="scan'208";a="537188906"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Oct 2026 06:43:25 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 17B3A180002EA;
	Mon, 19 Oct 2026 06:43:25 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 9CE90CBF204; Sun, 18 Oct 2026 23:43:24 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 4/5] curl: fix CVE-2026-82208
Date: Sun, 18 Oct 2026 23:43:19 -0700
Message-Id: <20261019064320.3978613-5-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261019064320.3978613-1-dkelaiya@cisco.com>
References: <20261019064320.3978613-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 06:43:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248133

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/curl/curl/commit/ed0338befd1d865a8ea1fbaa90013a096dedd07a
[2] https://curl.se/docs/CVE-2026-82208.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-82208.patch            | 52 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-82208.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-82208.patch b/meta/recipes-support/curl/curl/CVE-2026-82208.patch
new file mode 100644
index 0000000000..2c733de210
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-82208.patch
@@ -0,0 +1,52 @@
+From ed0338befd1d865a8ea1fbaa90013a096dedd07a Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Wed, 26 Aug 2026 13:46:13 +0200
+Subject: [PATCH] wolfssl: do not run Curl_wssl_setup_x509_store() twice
+
+The flag preventing a rerun was not set when a cached_store
+was used.
+
+CURL_UNCONST an ech string for my old wolfssl version
+
+Closes #22689
+
+CVE: CVE-2026-82208
+Upstream-Status: Backport [https://github.com/curl/curl/commit/ed0338befd1d865a8ea1fbaa90013a096dedd07a]
+
+Backport Changes:
+- Omitted the unrelated CURL_UNCONST ECH compatibility change because
+  curl 8.19.0 uses a mutable ECH configuration string and a different
+  code path.
+
+(cherry picked from commit ed0338befd1d865a8ea1fbaa90013a096dedd07a)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/vtls/wolfssl.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/lib/vtls/wolfssl.c b/lib/vtls/wolfssl.c
+index 74bd247..fdf33a8 100644
+--- a/lib/vtls/wolfssl.c
++++ b/lib/vtls/wolfssl.c
+@@ -597,9 +597,6 @@ static CURLcode wssl_populate_x509_store(struct Curl_cfilter *cf,
+   bool imported_native_ca = FALSE;
+   bool imported_ca_info_blob = FALSE;
+ 
+-  /* We do not want to do this again, no matter the outcome */
+-  wssl->x509_store_setup = TRUE;
+-
+ #ifndef NO_FILESYSTEM
+   /* load native CA certificates */
+   if(ssl_config->native_ca_store) {
+@@ -802,6 +799,9 @@ CURLcode Curl_wssl_setup_x509_store(struct Curl_cfilter *cf,
+   WOLFSSL_X509_STORE *cached_store;
+   bool cache_criteria_met;
+ 
++  /* We do not want to do this again, no matter the outcome */
++  wssl->x509_store_setup = TRUE;
++
+   /* Consider the X509 store cacheable if it comes exclusively from a CAfile,
+      or no source is provided and we are falling back to wolfSSL's built-in
+      default. */
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 33954465f7..0418bec61c 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -44,6 +44,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-11564.patch \
            file://CVE-2026-80255-dependent.patch \
            file://CVE-2026-80255.patch \
+           file://CVE-2026-82208.patch \
            file://CVE-2026-80230.patch \
            "
 
-- 
2.35.6


