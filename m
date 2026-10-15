Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 888E1CC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:04:02 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32831.1792040640011001419
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=k5+MmZU3;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df4f540ebso90864f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040638; x=1792645438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=glyw5Xe3Xtc53xsckQm0QIXUZGH6KB3/Q7Ot9xrqPwI=;
        b=k5+MmZU3cs/ULGGW7Z7ycixhjjgie2JnJ14V49GbpjA9djylfBl1k5G3QNwmYPVd94
         6BY/OznNtU+WxpdfG6hGM0XTacYOwxU3k37LbgWVTT5u4AC+sYcJ7yzizppYD3SD9iGu
         WZ2oAyYRpK0zV7eQsUMhcVnFB7OmNAXU9MeCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040638; x=1792645438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=glyw5Xe3Xtc53xsckQm0QIXUZGH6KB3/Q7Ot9xrqPwI=;
        b=Cv+9GsI3UWWdJGY8omZJ7Wv0JJHfk/+Q6VPV6bFU+ZcgbJE/yAGzStauVwlSg60rgW
         rA4nHxofGNzmsoVy0/ChGPPsK5TlOXuMNxed6SuPmsSehXCaXuofxrsE35X4SSMxLXiU
         opXvAvxlEfVEwZpCsHu2b7U05GHI8dryuH9olCCflcJhDyHnDydkgr3qs6ClOp2OhyBL
         dfsPwisA/bFPwuYAT3Fkg1DTEMLi6obukdPCEeAf5QH0eYB6ZskLVl0iFzF/fybbVO4I
         3zmwi3vnfaTAqICXr22NQmrBIHxmnA74/vcYuyE49tvu2FLUlvWAvKqLF9nnF07uPx3a
         T2Eg==
X-Gm-Message-State: AFq9FYIJ7za13NiNmDnN3pBsobu9FTSVNMQ2eD/xF/Fj26pLWf5sbgrb
	QrkOqrtEHVe8JSYVV63Gk+FKGGF8fA4DtB5XPDkrGeKTcPD4x3nzKzB+Sn+1iXmiHEFL/POXP4X
	H/cGIIM8=
X-Gm-Gg: AYBFou1jFoYYqheJlOFGdElzJCXJvICib+XVsTlFcWdBj0+Y/oide+Y4kFJZ5wIsBjO
	9pgvw8RiQAvPudUlExhCboV9ElSrJAs/U/lFRvUD42m1wPTDTAHjmQLUm4fqZaLsl6LxUUgHJyo
	dYdJWKUWRBW56hjoyNxH2/UEx96yPDZ/BHkb7LHdCOjsEJl67+9Z29eFN1jOXwrvRvRhDfIi6tx
	XpBp/wcEbek3BJHXDCoXiHi4rWZjr0+JZa4KX3Bx51fhDe17KpQ90GeH7tsmgtAKBbJTJ4cMTIv
	2UD9Rr0VnGEC0u0V472gTK3iXx4+HedPK8ZmQkZOvndwBsvCfh+XkPhETLdBUHlpU11Y2dCqBJQ
	rQYFf4j1equVObeT7PbkHrkg03fuPuLom5idK+H8Zq5iH/gW3KltZiD5kgyozqCjI/wFnwUGe2a
	PXcJY7gbqR7Hu8T+4p9a2Rll+vxSTo64PYa8VgD25IN5EmDFuSIwwJvYtfS4dWTKDDunMNmzvfS
	8njgbCswMgw/tY7nYxYLHhOCbtcxLeYMFYEVNCRTqsWtx8wBgZqAPUW1Oakhl9RbL2RRkO/JEOq
	kRY1dGGK
X-Received: by 2002:a05:600c:4747:b0:4a1:80d8:aed0 with SMTP id 5b1f17b1804b1-4a18e4a9862mr364370595e9.15.1792040638195;
        Wed, 14 Oct 2026 22:03:58 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 31/55] curl: fix CVE-2026-8286
Date: Thu, 15 Oct 2026 07:02:54 +0200
Message-ID: <bff4e98852cdb376eb4dd3c69ea73ea5181a723d.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247829

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/curl/curl/commit/a86efdd7ca5433de9231e650f18247de8319ad16
[2] https://curl.se/docs/CVE-2026-8286.html

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-8286.patch             | 60 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8286.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-8286.patch b/meta/recipes-support/curl/curl/CVE-2026-8286.patch
new file mode 100644
index 00000000000..f05d399eeed
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
index ba2968fc6c4..38083b58427 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -42,6 +42,7 @@ SRC_URI = " \
     file://CVE-2026-6253.patch \
     file://CVE-2026-4873.patch \
     file://CVE-2026-13608.patch \
+    file://CVE-2026-8286.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

