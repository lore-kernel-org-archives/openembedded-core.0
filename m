Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E551C982E4
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:28 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1595.1789682898930844096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Tuydu5S4;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso1213985e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682897; x=1790287697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=486eR0RSbIvl43Gqk3wsnojPV7p+RPUqxOycUF8Ao6I=;
        b=Tuydu5S4ftmiRCKBJAtCDBIGeuTinEN2SxQoYHlqF31lJbzgyqbF0VbD95F/9bEY8j
         SMqTVScO2XkeOmTGWkRO/HAe6O08dncHW8Cg4uf0ZhlGPVMfEfR391l+9n72N5w9pfa1
         cNg5Ra4DHwl+NtcWmo6rpVqPplilNzYpi2rnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682897; x=1790287697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=486eR0RSbIvl43Gqk3wsnojPV7p+RPUqxOycUF8Ao6I=;
        b=yV7ZFrVEz3leo0CqEZYZFpaWVLEjuZlbW++GDce3uCtBjAF9NgcDgMSoM3zcoqHL5l
         kIfqb9QNsyK6t5PjZmeRx87JE+IcVmtHTjsWr8zH/9+uWaSmGKyEDYQourK8nGyHt7z+
         +Vd5h7D2CKkUNM8WIK5f+d/J0Js23Is8I1SzDHlEJJLGGBDHDcy/etVCT/1U03HnQoaE
         RjFYxHQ4Gkn+0hB9+XoXAc89rfahdYi8eHJSJ/YDhE0ImFEez4M7PcngZlnyxhNQmYbb
         uaB0xzdPUE0QkG8OJVK3gDZi3f5s78KJfr+RqxaRNhkBfS54/IdbnY8e7UZYeuEw5TSY
         SmtQ==
X-Gm-Message-State: AFuF++muKznreb7GFCN1F3ia3eJ2hXfGaJMD7ULuY+oOldGMAOtcCpyE
	c/hhWisnEa8CpneVOiOwbtbayMe9ycpBJAqhHfwVpV3JPADm+yjmNNixq3wyj6EBgtwbXMiAvYc
	gtUtEiqQ=
X-Gm-Gg: AYBFou3CkZHqUQPmgKiy2KqUytHVXy777Lhd4lPzTOVVi7JV0lZNRAz4Knox4IUnhHF
	9CgxTn7arRPKGYn5VHVTv32ZskB1M7IHc2nrlMz0yCBORqispGqpM3HZ5rwpTSg0EyrRCTFpL7V
	om8disAi9QaIBKmXDycC06np+NXpqsAV6rshH5CQvJUm8cN2a1ytB3lfB1Hs6NNX5A8/hDluOZn
	qM34Ou/gPGiQV7Gnwy75mQRBDTsZ1aUQpEoEPVOu6+jMn7wMCjJk7RbqD8ytC5995shDjCTJwbz
	/CAfprANgV+seoM3MAlRB5KX1peRb66e/sp8GE2h073wR1QuPbZUYOPuml71A8oJAtZ9XU8Q3Sa
	cbntk6fRMSd++Xsc8OvMgm4CnFjcdsp91ZdLvzbAwuJMefN+QI41oYhlPQ5n/oqCgaKxvN1xXEe
	pam/7G2IU9fQ7SzqPIFF2GTZbdQpa+CoojyznitY7bNtF3c4t6BdGymfj4bH6HigDEVnOHwEMjD
	r8UtYq0w0X/vvVBjThlrfDOQ/6Tmsda1DIlg36/Mox8DWfg2wI8jC7WuEpbn9oUl4ikKp6BRf4=
X-Received: by 2002:a05:600c:8b61:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-49fc5749edemr3654755e9.31.1789682897195;
        Thu, 17 Sep 2026 15:08:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 51/79] curl: patch CVE-2026-7009
Date: Fri, 18 Sep 2026 00:06:36 +0200
Message-ID: <d95aa60c430be8e54fc017d3e7c8113f0aca6da9.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246145

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2026-7009.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-7009.patch             | 50 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-7009.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-7009.patch b/meta/recipes-support/curl/curl/CVE-2026-7009.patch
new file mode 100644
index 00000000000..ec124378eca
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-7009.patch
@@ -0,0 +1,50 @@
+From 51905671e07f087e28e5741063646c379fe17d89 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Sat, 25 Apr 2026 10:34:06 +0200
+Subject: [PATCH] sectrust: fail on missing OCSP stapling
+
+When using Apple SecTrust, requiring the server to send
+an OCSP response and does not, fail correctly.
+
+Reported-by: Carlos Carrillo
+Closes #21444
+
+CVE: CVE-2026-7009
+Upstream-Status: Backport [https://github.com/curl/curl/commit/51905671e07f087e28e5741063646c379fe17d89]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/vtls/openssl.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index c84ef8bc65..4629ca4444 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -4744,16 +4744,26 @@ static CURLcode ossl_apple_verify(struct Curl_cfilter *cf,
+     unsigned char *ocsp_data = NULL;
+ #endif
+     long ocsp_len = 0;
++    bool ocsp_missing = FALSE;
+     if(conn_config->verifystatus && !octx->reused_session)
+       ocsp_len = (long)SSL_get_tlsext_status_ocsp_resp(octx->ssl, &ocsp_data);
+ 
+     /* SSL_get_tlsext_status_ocsp_resp() returns the length of the OCSP
+        response data or -1 if there is no OCSP response data. */
+-    if(ocsp_len < 0)
++    if(ocsp_len < 0) {
+       ocsp_len = 0; /* no data available */
++      ocsp_missing = TRUE;
++    }
+     result = Curl_vtls_apple_verify(cf, data, peer, chain.num_certs,
+                                     ossl_chain_get_der, &chain,
+                                     ocsp_data, ocsp_len);
++    if(!result && ocsp_missing && conn_config->verifystatus &&
++       !octx->reused_session) {
++      /* verified, but OCSP stapling is required and server sent none */
++      *pverified = TRUE;
++      failf(data, "No OCSP response received");
++      return CURLE_SSL_INVALIDCERTSTATUS;
++    }
+   }
+   *pverified = !result;
+   return result;
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index a964868d872..2a27fd4d5bf 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -29,6 +29,7 @@ SRC_URI = " \
     file://CVE-2026-8932.patch \
     file://CVE-2026-11352.patch \
     file://CVE-2026-11586.patch \
+    file://CVE-2026-7009.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

