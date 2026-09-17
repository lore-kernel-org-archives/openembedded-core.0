Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F4DC982E5
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:28 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1598.1789682903144730582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mtPnRRJy;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b965f447cso894735e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682901; x=1790287701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LCWbq0xb8gkSNiooL/JJN/2siO+Hzlle7aYzpv46Ihg=;
        b=mtPnRRJy6cF2hT4yKgpRhrQGhxZa8gxK4SSNJxeXn1RbQ1s5xdOXa+CW3Cj4UtdWdC
         mKXCri2qaOizsEJYoovFM3Cdzx1D7E0Mrkek/Lx7LW5qLmIqR/b2ruI6mmQsENOZlmD+
         VHYbStJNyZ5U2Bp8spmwhLBA8/zeWgsBpx8bA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682901; x=1790287701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LCWbq0xb8gkSNiooL/JJN/2siO+Hzlle7aYzpv46Ihg=;
        b=xFqQicLoX6cU5VHhdL20aeuuLVf4uHVCaJXaafTmfV8FEB28UQKR7PcZnwqkECTOoZ
         sST6mazZJBiBNzRrryt5a0PKqKfJ31/IDXDQTuTQiri3HxqHZ0PbF8x89Qbd83OlZSsY
         1jIrk2AtJSAXvEL+dUWyVypHEtrcdrE7mObIRIoWxbqWL3YCQcV/H7I+K7dvQ8FRRUFi
         jEmcWDIHDItdxQ0FELjj1i4xWKhNoaIzQsd+ADvpFsTW5AHYuebWhtir8mMmynbuDzHk
         73LTYyiJI0vMwHcFMQpfBHAVRDntoKFj1oB/QJzsGOcw4Q87XzVaIhVb91vEen7c0x9I
         tIpQ==
X-Gm-Message-State: AFuF++kpChSqvNBfghUa/6p96vIhOOb5DASy5awYaYVBRc8w7M+AtGxp
	SWgfChQxo67YSs7Gbr13pvZAI7qm+VKiXgK7s77BqWIuS1o2K2dGTlBq0yur6q/I6dPi5z7P4/s
	fKjl2YRc=
X-Gm-Gg: AYBFou0o/oDCoyZYn7jCnDNBFsdNcgQEhZsTWuJd1c0lEVvjSCAfwsuaPyBb3yuF43m
	igngFlrJKUBYI65WLq4f36rYGdI8rp3s2ADjfpbjtRmI33ohAtcBo6vAcY5VNywJk8CeOvSXiWR
	YNiH/Bysmm1aLSCqcaqcNdUNvxdExImbScqjnkrsG5J1ZXmzCNpdm78d6xSDZ/4NyIyNJdbXGlG
	W7BAevY2nv7B4q7+SeK1hCre4PjiAUKm6nzF/97BmigrxlonIwkl5E7FBQ/OpPBGSJMHeuW9lif
	pIlXz2G/agBlYGrrxVOEo4OkomwwkZ4mVCKpvZmePh2y2E45Fd9egmk6RU6U2UmL4ufPxj891yD
	/VOk7cn+fuAaRvRAFuP3VPbk3lu/3CLhlbT/ihB+5KywN0hmGHFDvFi6luLRzin6MLgg6DhGvt+
	LPDvbull/1h5PYENt4+nn+2hRiTMqtosRUtD7Jebsjq9n0hc6M7vRfD3pmjdlSl4wAQ+wZOAtIe
	4cK1bHx4Rjw/C5n81WLnFDCF9cMtZ5UyBrYcU4PVbhWsb1fE1g7gKKh7OqxYH81pxtSoVsa8IQ=
X-Received: by 2002:a05:600c:1d29:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-49fc572b7afmr3464125e9.22.1789682901404;
        Thu, 17 Sep 2026 15:08:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 59/79] curl: Security Fix for CVE-2026-80229
Date: Fri, 18 Sep 2026 00:06:44 +0200
Message-ID: <ba351121c3a212ab91f3e719d11de6b4b8db0841.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246154

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

[1] https://curl.se/docs/CVE-2026-80229.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-80229

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-80229.patch            | 35 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80229.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-80229.patch b/meta/recipes-support/curl/curl/CVE-2026-80229.patch
new file mode 100644
index 00000000000..74be963fa4d
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-80229.patch
@@ -0,0 +1,35 @@
+From 272d5928188bc2171fdeba81027b24145a033fb2 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 25 Aug 2026 11:14:30 +0200
+Subject: [PATCH 3/5] openssl: avoid conn reuse if provider is used
+
+Reported-by: Stanislav Fort
+
+Closes #22665
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/7ea37abc6ac0120ba5f6d94be8d196f7cf1506bb]
+CVE: CVE-2026-80229
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ lib/vtls/openssl.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index 9cbab14..1d0f7b7 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -3753,6 +3753,11 @@ CURLcode Curl_ossl_ctx_init(struct ossl_ctx *octx,
+           ossl_strerror(ERR_peek_error(), error_buffer, sizeof(error_buffer)));
+     return CURLE_OUT_OF_MEMORY;
+   }
++#ifdef OPENSSL_HAS_PROVIDERS
++  if(data->state.libctx)
++    /* forbid connection reuse with provider/engine use */
++    connclose(data->conn, "forbid connection reuse with provider/engine use");
++#endif
+ 
+   if(cb_setup) {
+     result = cb_setup(cf, data, cb_user_data);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index ccf8de0b90e..33aed045117 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -37,6 +37,7 @@ SRC_URI = " \
     file://CVE-2026-9079.patch \
     file://CVE-2026-13608.patch \
     file://CVE-2026-18924.patch \
+    file://CVE-2026-80229.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

