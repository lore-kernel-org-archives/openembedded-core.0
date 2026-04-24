Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10944FDEE45
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:56:51 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32574.1777064203151993172
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PGP3xaR4;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so59583725e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064201; x=1777669001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVoGt3caDMmWOYK5iNGAgDLiWoHa2dIuOdBYvVZQrfc=;
        b=PGP3xaR4JPOUJkb+6eK7+F80r4+oMqA7Ko01uFWLl1SSeZYsti8Cxe2YhKWq75BikE
         1KZNO1UtwSjDTqmQ9zd3Dsfgf9m3B8KUiLeexSniWAjOKt1wMVvKI7xrHv5ZYUZVnF5s
         fbOv0PDk6eBROX6rSZy8l9X4Y7r1DGXGyjIEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064201; x=1777669001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dVoGt3caDMmWOYK5iNGAgDLiWoHa2dIuOdBYvVZQrfc=;
        b=AMwWV0PZM8AniJ5IpjFQEeA4jH44KcXUdBkpluLryE78NHFSCDzr2ryVTkAomkNYSf
         JaQdJAH/GRNBJnCjBGa9x8gBLOPGNi6QsA3axHV1y/qZ+tyl66J2AsQfJetjPBU7B9n5
         pqksgbeK/ALFU2TE9BgNMZhuxZ8OsGn9UF3jQxiC+5vf8+CwEE+Sg8bSowUyE12SUkDa
         MMALQRa3rt+miTy+Xm0DSYhLTbKwdReD8HQPpBc5G3fg1S1ebDVGu0dmpqvj6IVfmd7T
         5OcfEO3j/+HlLMO2C6iLQ2xZJh354CIHiMfTibrSheozSKJPRrWwK8agrPnu8/pXYS2K
         c1WA==
X-Gm-Message-State: AOJu0Yz/LBQZsaZFHf0lthvK/DdgDkeFNn/B4qtVJOdis6SFuegA8gLr
	e8ItNmvXCV7Xrm1d/XUaCjab8T8IHTw2y8+nx8sSIHr82WBGtiPPObc5an2RC3HMQk/EwqRWfHz
	KnyoOhC/pWBLy
X-Gm-Gg: AeBDievB/zfzge4Op1tp7kk3Os0kb+TmyxElsL8qonSAzVagn0SoU4wW4djgBHlFDNI
	zRJtY2Vsp1FKllpI7u+LOdIWWTsAi6YrQILXcrKILMs83UASsjO8JTJdbBoUEN5zmR2kdRQaf62
	CIThTb1jJ6xZHTbW8RCo1e2/RqSoxM3WiAH/3mlLG9TEGMQ1wbv+xpORFNM9STOsd4DqI3sW6pk
	Urd4Sb1mU8UuKrBHE4x6KBwBVd3dZzK4I+YSAGWtrrPwXPKFSBLMlOBVaqubevVCZZj7142PRtI
	stWL8vyEQAz63g5DyNURon3K4CGgV22BHcp72e3S7P/BrocbsNw4yCV9fAIM4gqH6yfXpiLNdQ5
	iBfnGLNIyJZU8Ng3Xd2Wvmayoys6CNNfpUtBqaN5WLf0eCXSxwkqZXRaoT5CrgIxrMYQ9QNGBtT
	N4jSBEEtZLSNqCvhab9gn4l1UQMxFsU3oxtz+Hz8kjmUYM344fV6heko6IAlvEwLeUXFbAx34+j
	ICYJe0Fa16i/duE6wD51xnsjPKuVC/RiOOp/Q==
X-Received: by 2002:a05:600c:a414:b0:48a:53ea:13e6 with SMTP id 5b1f17b1804b1-48a53ea14d3mr214769505e9.25.1777064201274;
        Fri, 24 Apr 2026 13:56:41 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/66] curl: patch CVE-2026-3784
Date: Fri, 24 Apr 2026 22:55:05 +0200
Message-ID: <1142953d395cd8de187fbd0dc8c143b953c42612.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235879

From: Vijay Anusuri <vanusuri@mvista.com>

pick patch from ubuntu per [1]

[1] http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_8.5.0-2ubuntu10.8.debian.tar.xz
[2] https://ubuntu.com/security/CVE-2026-3784
[3] https://curl.se/docs/CVE-2026-3784.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-3784.patch             | 77 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-3784.patch b/meta/recipes-support/curl/curl/CVE-2026-3784.patch
new file mode 100644
index 00000000000..c3bdb672474
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-3784.patch
@@ -0,0 +1,77 @@
+From 5f13a7645e565c5c1a06f3ef86e97afb856fb364 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Fri, 6 Mar 2026 14:54:09 +0100
+Subject: [PATCH] proxy-auth: additional tests
+
+Also eliminate the special handling for socks proxy match.
+
+Closes #20837
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/5f13a7645e565c5c1a06f3]
+Backported by Ubuntu team http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_8.5.0-2ubuntu10.8.debian.tar.xz
+
+CVE: CVE-2026-3784
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/url.c | 35 ++++++++---------------------------
+ 1 file changed, 8 insertions(+), 27 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 22ed0be..76360c8 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -703,34 +703,15 @@ proxy_info_matches(const struct proxy_info *data,
+ {
+   if((data->proxytype == needle->proxytype) &&
+      (data->port == needle->port) &&
+-     strcasecompare(data->host.name, needle->host.name))
+-    return TRUE;
++     curl_strequal(data->host.name, needle->host.name)) {
+ 
++    if(Curl_timestrcmp(data->user, needle->user) ||
++       Curl_timestrcmp(data->passwd, needle->passwd))
++      return FALSE;
++    return TRUE;
++  }
+   return FALSE;
+ }
+-
+-static bool
+-socks_proxy_info_matches(const struct proxy_info *data,
+-                         const struct proxy_info *needle)
+-{
+-  if(!proxy_info_matches(data, needle))
+-    return FALSE;
+-
+-  /* the user information is case-sensitive
+-     or at least it is not defined as case-insensitive
+-     see https://datatracker.ietf.org/doc/html/rfc3986#section-3.2.1 */
+-
+-  /* curl_strequal does a case insensitive comparison,
+-     so do not use it here! */
+-  if(Curl_timestrcmp(data->user, needle->user) ||
+-     Curl_timestrcmp(data->passwd, needle->passwd))
+-    return FALSE;
+-  return TRUE;
+-}
+-#else
+-/* disabled, won't get called */
+-#define proxy_info_matches(x,y) FALSE
+-#define socks_proxy_info_matches(x,y) FALSE
+ #endif
+ 
+ /* A connection has to have been idle for a shorter time than 'maxage_conn'
+@@ -1085,8 +1066,8 @@ ConnectionExists(struct Curl_easy *data,
+       continue;
+ 
+     if(needle->bits.socksproxy &&
+-      !socks_proxy_info_matches(&needle->socks_proxy,
+-                                &check->socks_proxy))
++      !proxy_info_matches(&needle->socks_proxy,
++                          &check->socks_proxy))
+       continue;
+ 
+     if(needle->bits.httpproxy) {
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index ff4524e1bd1..14d63d63733 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -35,6 +35,7 @@ SRC_URI = " \
     file://CVE-2026-1965-1.patch \
     file://CVE-2026-1965-2.patch \
     file://CVE-2026-3783.patch \
+    file://CVE-2026-3784.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

