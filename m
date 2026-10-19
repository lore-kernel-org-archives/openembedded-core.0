Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAFDCCF2DA
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 06:43:33 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28813.1792392205794689588
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 23:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=N0Mkpg9a;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6557; q=dns/txt;
  s=iport01; t=1792392207; x=1793601807;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+RRrR0R3b70wKGNoBZ3NsqrUSI48gLYYobqeyO8Blsk=;
  b=N0Mkpg9aNeP+qC1d0ZBRqtamPjfigWFT2j2qxxcAWPEAdHY02Jv7g4Q0
   Zv9MXd+GgyS4r8N7cSfVxa6nQzufb6RPy3Vws2WvlbiTyG0TbSG2W9L8c
   3ZgwbeIKoYc/Kn4k11jYDlNnd3qg9gaIrOP3SeFOBiUXhGXCfWyyA913X
   ciI13CQoRsvlPy1cCoFT8zuh+hCKEFJGoYPBmWWZz7tnSfCLnrUWFkZ9o
   tBp0wxlV2wJdlxB1zYEhFxV8YW4kIhBfCsSL7An10OM38y05JO1vJAsm7
   nP/cDz9JKWFAVAJZc3AyrfbYOcvxEaEZTzav9IUOq1abllwe49ovwN1im
   w==;
X-CSE-ConnectionGUID: ofCgf3FqQ76HmvWGkDRKGQ==
X-CSE-MsgGUID: TykQ/MLnQ1CZUlu8DRYZ4g==
X-IPAS-Result: =?us-ascii?q?A0BIAgBsu9Vq/5T/Ja1aglmCV3VgQ0mWSgOeHIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBAJgwIBgnQDEQa9HRs3gXkzg?=
 =?us-ascii?q?QGDKQE/AgJAAVDbMgELFAGBOIVAiCNdGAGEfCcbG4FyhH6BBYFcAgGIJASCI?=
 =?us-ascii?q?noSgVoegUiTd0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdg?=
 =?us-ascii?q?SCCFiMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJA?=
 =?us-ascii?q?RMaMAuBGzg8CShBFwxzDB0FcggCDQkHTRgNSBEsNxUZBD5uB5IqHoJeBQJhL?=
 =?us-ascii?q?QEpAoILMpMnB5I3oQ8KKIN2jCKVOhozqm8LmH2OCpVoaIRpgWg8gVlwFYMiC?=
 =?us-ascii?q?RY0GQ+OLgsLg2CGQMgaJzICCTIBAQcCBw4DC4FokAAqgVQBAQ?=
IronPort-Data: A9a23:zDVd2ao+H8dnBCW7SDxCnpoYhXJeBmJJZBIvgKrLsJaIsI4StFCzt
 garIBnQO/eJZjHyfot+Pdjl/U4DvcPRmIQ3SFc9ryg8FC0W9OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8UI35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0uF5Km5Ar
 tIBEW9TThWduM217IiYZdA506zPLOGzVG8ekmtrwTecCbMtRorOBvyTo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LWPrSn8/w7pX7WzFbpVacpLs+y2PS1wd2lrPqNbI5f/TXHpoNxx7C/
 D2uE2LRPgAZDZu67Ty8q1meu+vSzQ/BabBOG+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvoUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:z/E/L67JhcTwgHmdlAPXwOrXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: 9a23:Jt8dVmMhkhmdXu5DXydM+0BPNNkcLSP9yWnvDEyUM0VGcejA
X-Talos-MUID: 9a23:G7A5fwtQsVPxp7ZzP82nuCBhDYBNx6KXUWs/rJEb6+W+BB4sNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,167,1787011200"; 
   d="scan'208";a="537010227"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Oct 2026 06:43:25 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id D959D18000163;
	Mon, 19 Oct 2026 06:43:24 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 6BCFACBF202; Sun, 18 Oct 2026 23:43:24 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 2/5] curl: fix CVE-2026-11564
Date: Sun, 18 Oct 2026 23:43:17 -0700
Message-Id: <20261019064320.3978613-3-dkelaiya@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248137

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Restore the upstream native CA and proxy-origin comments while
retaining the curl 8.19.0 option-completion API.

[1] https://github.com/curl/curl/commit/d69bfad3fa3daf5e72331f6870667607828d5891
[2] https://curl.se/docs/CVE-2026-11564.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-11564.patch            | 132 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11564.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-11564.patch b/meta/recipes-support/curl/curl/CVE-2026-11564.patch
new file mode 100644
index 0000000000..539236228c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-11564.patch
@@ -0,0 +1,132 @@
+From d69bfad3fa3daf5e72331f6870667607828d5891 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Mon, 8 Jun 2026 10:11:30 +0200
+Subject: [PATCH] ssl native_ca_store: always reinit
+
+Add bit `native_ca_store_opt` to keep the setting of
+CURLOPT_(PROXY_)SSL_OPTIONS and use that to calculate every easy
+transfer if a native CA store shall be used or not.
+
+This avoids `native_ca_store` getting stuck on TRUE after being set
+once.
+
+Closes #21902
+
+CVE: CVE-2026-11564
+Upstream-Status: Backport [https://github.com/curl/curl/commit/d69bfad3fa3daf5e72331f6870667607828d5891]
+
+Backport Changes:
+- Applied the option-completion helper to lib/vtls/vtls.c because curl
+  8.19.0 does not have lib/vtls/vtls_config.c.
+- Retained the curl 8.19.0 auto-client-certificate behavior because the
+  later initial-origin tracking API is not available.
+
+(cherry picked from commit d69bfad3fa3daf5e72331f6870667607828d5891)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/doh.c       |  3 ++-
+ lib/setopt.c    | 20 ++------------------
+ lib/vtls/vtls.c | 21 +++++++++++++++++++++
+ 3 files changed, 25 insertions(+), 19 deletions(-)
+
+diff --git a/lib/doh.c b/lib/doh.c
+index 4488d42..80da94b 100644
+--- a/lib/doh.c
++++ b/lib/doh.c
+@@ -397,7 +397,8 @@ static CURLcode doh_probe_run(struct Curl_easy *data,
+   }
+ 
+   (void)curl_easy_setopt(doh, CURLOPT_SSL_OPTIONS,
+-                         (long)data->set.ssl.primary.ssl_options);
++                         ((long)data->set.ssl.primary.ssl_options &
++                           ~CURLSSLOPT_AUTO_CLIENT_CERT));
+ 
+   doh->state.internal = TRUE;
+   doh->master_mid = data->mid; /* master transfer of this one */
+diff --git a/lib/setopt.c b/lib/setopt.c
+index 7e6960c..3603912 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -407,22 +407,6 @@ static CURLcode setopt_RTSP_REQUEST(struct Curl_easy *data, long arg)
+ }
+ #endif /* !CURL_DISABLE_RTSP */
+ 
+-#ifdef USE_SSL
+-static void set_ssl_options(struct ssl_config_data *ssl,
+-                            struct ssl_primary_config *config,
+-                            long arg)
+-{
+-  config->ssl_options = (unsigned char)(arg & 0xff);
+-  ssl->enable_beast = !!(arg & CURLSSLOPT_ALLOW_BEAST);
+-  ssl->no_revoke = !!(arg & CURLSSLOPT_NO_REVOKE);
+-  ssl->no_partialchain = !!(arg & CURLSSLOPT_NO_PARTIALCHAIN);
+-  ssl->revoke_best_effort = !!(arg & CURLSSLOPT_REVOKE_BEST_EFFORT);
+-  ssl->native_ca_store = !!(arg & CURLSSLOPT_NATIVE_CA);
+-  ssl->auto_client_cert = !!(arg & CURLSSLOPT_AUTO_CLIENT_CERT);
+-  ssl->earlydata = !!(arg & CURLSSLOPT_EARLYDATA);
+-}
+-#endif
+-
+ static CURLcode setopt_long_bool(struct Curl_easy *data, CURLoption option,
+                                  long arg)
+ {
+@@ -1002,11 +986,11 @@ static CURLcode setopt_long_ssl(struct Curl_easy *data, CURLoption option,
+       s->use_ssl = (unsigned char)arg;
+     break;
+   case CURLOPT_SSL_OPTIONS:
+-    set_ssl_options(&s->ssl, &s->ssl.primary, arg);
++    s->ssl.primary.ssl_options = (unsigned char)(arg & 0xff);
+     break;
+ #ifndef CURL_DISABLE_PROXY
+   case CURLOPT_PROXY_SSL_OPTIONS:
+-    set_ssl_options(&s->proxy_ssl, &s->proxy_ssl.primary, arg);
++    s->proxy_ssl.primary.ssl_options = (unsigned char)(arg & 0xff);
+     break;
+ #endif
+   case CURLOPT_SSL_ENABLE_NPN:
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index 6dcc67d..35cb4f0 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -306,6 +306,22 @@ static void free_primary_ssl_config(struct ssl_primary_config *sslc)
+ #endif
+ }
+ 
++static void ssl_easy_config_compl_options(struct ssl_config_data *sslc)
++{
++  uint8_t options = sslc->primary.ssl_options;
++  /* If set via CURLOPT_(PROXY_)SSL_OPTIONS, we definitely use it.
++   * If not, we switch it on for supported backends if no custom
++   * ca settings exist. */
++  sslc->native_ca_store = !!(options & CURLSSLOPT_NATIVE_CA);
++  sslc->enable_beast = !!(options & CURLSSLOPT_ALLOW_BEAST);
++  sslc->no_partialchain = !!(options & CURLSSLOPT_NO_PARTIALCHAIN);
++  sslc->no_revoke = !!(options & CURLSSLOPT_NO_REVOKE);
++  sslc->revoke_best_effort = !!(options & CURLSSLOPT_REVOKE_BEST_EFFORT);
++  sslc->earlydata = !!(options & CURLSSLOPT_EARLYDATA);
++
++  sslc->auto_client_cert = !!(options & CURLSSLOPT_AUTO_CLIENT_CERT);
++}
++
+ CURLcode Curl_ssl_easy_config_complete(struct Curl_easy *data)
+ {
+   struct ssl_config_data *sslc = &data->set.ssl;
+@@ -314,6 +330,8 @@ CURLcode Curl_ssl_easy_config_complete(struct Curl_easy *data)
+   CURLcode result;
+ #endif
+ 
++  ssl_easy_config_compl_options(sslc);
++
+   if(Curl_ssl_backend() != CURLSSLBACKEND_SCHANNEL) {
+ #if defined(USE_APPLE_SECTRUST) || defined(CURL_CA_NATIVE)
+     if(!sslc->custom_capath && !sslc->custom_cafile && !sslc->custom_cablob)
+@@ -360,6 +378,9 @@ CURLcode Curl_ssl_easy_config_complete(struct Curl_easy *data)
+ 
+ #ifndef CURL_DISABLE_PROXY
+   sslc = &data->set.proxy_ssl;
++  /* no initial origin for proxy, it is not changed for redirects */
++  ssl_easy_config_compl_options(sslc);
++
+   if(Curl_ssl_backend() != CURLSSLBACKEND_SCHANNEL) {
+ #if defined(USE_APPLE_SECTRUST) || defined(CURL_CA_NATIVE)
+     if(!sslc->custom_capath && !sslc->custom_cafile && !sslc->custom_cablob)
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index af76f5d53b..322304f47d 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -41,6 +41,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-8926-dependent.patch \
            file://CVE-2026-8926_p1.patch \
            file://CVE-2026-8926_p2.patch \
+           file://CVE-2026-11564.patch \
            file://CVE-2026-80230.patch \
            "
 
-- 
2.35.6


