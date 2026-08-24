Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FDDC5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:00:45 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16149.1787576440668814926
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=It3eeDbP;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4956869750eso19626045e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787576439; x=1788181239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vb3I4Ohhr0SmaHeYlyvoWVduqUmt5y0yK4UDMz7eKm4=;
        b=It3eeDbPvqaENSvBSR3Oh45r+6846+hxcTvmCG5VGaIqiTaWcfp7f9PO7VatxoKU/G
         INlX9sPQZBiBJWPruzUQq7D3azmd0jNyuAUHPvd0wF3MNmWebFHTglB4LDMbyoJjYH7W
         fCBfl+DDz8kqjTKz/GoAkJZMbzDV6S0qhIJWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576439; x=1788181239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vb3I4Ohhr0SmaHeYlyvoWVduqUmt5y0yK4UDMz7eKm4=;
        b=mY9n2ty2O0++Ah6gYdzG6dp0D2pHgKNR+hPlqmqS8jNKyYwqXaXjbyY6DE3cr7EAjU
         KSAx6JVC3qi5imgX5TGKwwUPlvU/fVtXKts3lnLIv+txRBs22DtyT3lpGb954rFcmBZ0
         ICm9MqDEY/+/Amc7meiJFo5zLhlk3lTYnII6dsHg36rhcSs55olszJWLAKrxarqztxCH
         P3YYayaNeum8EbAkSyyjnKmtsO3bZSiKfF8zhToKujLLxpeJZSF4ozI1Bg1BQSZt9NtB
         cNHfXgWaupMNCvPDkC/jtQag3dOK5gNCvlneJJOlbnIR9ZP3/DPDVhI8n1/0Hw4IR8HY
         uSPg==
X-Gm-Message-State: AFuF++kBozNHDKlZ+8BC88H4fdRKFfqBG8L8dy7Qa+fZm7E+Y2W6C1hH
	YS0SUL12OPmJDYlEKHj3GBCUUCoFA5H5C4MQu1YL4acPReigZxwmg9a/dGVw0ZT1e9AWr1eGF+7
	ubPkHiIc=
X-Gm-Gg: AR+sD13zu7OGPTZoIkG3WfnAcb5CAMJ6AOIyjZSwmcThNW0J1c1Y8hLoUSUPxVKR82Y
	c8n/JblrtALBYfslwpgWGGIiKAMEraa1bXUpq4VNTLVArK+vUOgZcL8MDT0jqaNi5deRgQ/kzH1
	251ncjpucDnHV/bDZUKbjjgPAnM+N8F7J4J0lY7V/QgSYe78dBVpO3/W/EPs6mPmDtZtkCkqvhg
	O/T7F/qHTPvasyPhAlGyc2nGfLps6lx2ehY9DGze8x9Aa8OFewktelsyd4ctNQwa1W16T5oc3pv
	4/1GEe1FjCozw+el2HmrSyRm/2zPIIu1hLqke9WIQhGfAsO+k7Oik6zKxu4pLye2silfr5f+pmO
	WPSECeLyZ1lOBFIVcZsXmkYVAEZ/9rGOIJKMJkXnobqzuIc+njcd9PGnORzZVgFT9v2XBjwhH28
	fLyKcZXTV8mwy/ahRG0QA9jIgJaA6wMgRPHP8pe8+TqoWiadfEJ+L0TsvtpDnC+OgYdEhhgehK3
	gDEfWA2C2rMnbE3WNf6nKKs6Exq1S4q5Nf1GewcEAhh+28Yj7iCLOsaTFY7NIVNeXMHsa4=
X-Received: by 2002:a05:600c:a01:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-499c19bfd2dmr173562375e9.3.1787576438716;
        Mon, 24 Aug 2026 06:00:38 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm61379865e9.2.2026.08.24.06.00.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:00:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 02/19] curl: fix CVE-2026-4873
Date: Mon, 24 Aug 2026 14:59:44 +0200
Message-ID: <7e44b94a57a1b7d9ec043554fb7f1f4c3fbfbbaf.1787576160.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787576160.git.yoann.congal@smile.fr>
References: <cover.1787576160.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244100

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream backport for CVE-2026-4873.
The upstream fix commit is referenced in [1], and the public
CVE advisory is referenced in [2].

[1] https://github.com/curl/curl/commit/507e7be573b0a76fca597b75ff7cb27a66e7d865
[2] https://curl.se/docs/CVE-2026-4873.html

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../curl/curl/CVE-2026-4873.patch             | 52 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-4873.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-4873.patch b/meta/recipes-support/curl/curl/CVE-2026-4873.patch
new file mode 100644
index 00000000000..b288de93066
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-4873.patch
@@ -0,0 +1,52 @@
+From 4d13e431d26c3097e6dff49ba069061b588461af Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 24 Mar 2026 08:35:08 +0100
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
+(cherry picked from commit 507e7be573b0a76fca597b75ff7cb27a66e7d865)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/url.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 7c24f1a002..4ebff50ef1 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -745,7 +745,7 @@ struct url_conn_match {
+   BIT(want_proxy_ntlm_http);
+   BIT(want_nego_http);
+   BIT(want_proxy_nego_http);
+-
++  BIT(req_tls); /* require TLS use from a clear-text start */
+   BIT(wait_pipe);
+   BIT(force_reuse);
+   BIT(seen_pending_conn);
+@@ -897,6 +897,9 @@ static bool url_match_ssl_use(struct connectdata *conn,
+        (get_protocol_family(conn->scheme) != m->needle->scheme->protocol))
+       return FALSE;
+   }
++  else if(m->req_tls)
++    /* a clear-text STARTTLS protocol with required TLS */
++    return FALSE;
+   return TRUE;
+ }
+ 
+@@ -1361,6 +1364,7 @@ static bool url_attach_existing(struct Curl_easy *data,
+     (needle->scheme->protocol & PROTO_FAMILY_HTTP);
+ #endif
+ #endif
++  match.req_tls = data->set.use_ssl >= CURLUSESSL_CONTROL;
+ 
+   /* Find a connection in the pool that matches what "data + needle"
+    * requires. If a suitable candidate is found, it is attached to "data". */
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 097b3056d8e..5ba881bd762 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://CVE-2026-6429-dependent.patch \
     file://CVE-2026-6429.patch \
     file://CVE-2026-7168.patch \
+    file://CVE-2026-4873.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

