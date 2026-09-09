Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47815C79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 20:33:43 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.749.1788986020004622459
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 13:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HqMXMcoK;
 spf=pass (domain: mvista.com, ip: 74.125.227.140, mailfrom: sdoshi@mvista.com)
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so1510253a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 13:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788986019; x=1789590819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVuC3ZW5JZcXgRAxBzE0vqO/7/A75EZVN650LNuqKLg=;
        b=HqMXMcoKhQN+FYnst3RTUIBwaYDDKJ0n4ZaV9W7kfouUkfEYqdC2tf4VwWyTDa3EHk
         Ipb76+jGyXHmIhvRLtyT+ONIlnbzfB6YJ/35hMDolQ8txYVfsC3+ds77H6XCe7h0IW05
         ssX7XD//YCWtjXgSEqKa7H2xDBCIucpT+NZq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986019; x=1789590819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cVuC3ZW5JZcXgRAxBzE0vqO/7/A75EZVN650LNuqKLg=;
        b=gUgW6rLM+5T+W0IMDH8AmrRgTw755hd6Mi+aTOgnBW3NnoNHP+VabnvDBHakWEbxk/
         dxx0OIrTXfbzKgrMA4fAM9rl1sbV8GLWCp3EoywCCZ7eivBt55v0RayDTyKX2TYsE/un
         SQ+Vw1N1CrPZvW0WFg4yJ2T9SBz5Ik5q6Cc5DshqAWLWrN/7MO4fCbS9r3BA7z9FZsYE
         W1y18j2Vjs2q1auwVQTajs3aWNWQN7eFmiMdrArzycYYoBL3cu9JYzjZ/W1Xo4SkMlkw
         mZHOHdgk5+tOyOt5118VaMDFE6UsKKwWqI93G0H4UL1hiy52rr1s1qywBmZfBn0+eRBN
         omfg==
X-Gm-Message-State: AFuF++n+P7SnggPjofA5ChRJkf/LAjqSgysFh+ZrB2ylyK4aee9N8cZM
	0jB0P1TCkAfu/8mogknpc09c/bu17spX3L3u7UWCzglXVXopUOidIRxYZk/rqPH26MtFC1fqbkK
	7dQSZlj8=
X-Gm-Gg: AYBFou0W8HpTe8ISgzzX2TFeqIQmfCTjn5aKzU8wf50H3STU/AcLVbtGaf4LNPRnLQB
	l6/5td2PR3ta0WaVwmeeZmbvbwkzbPm7sX1oRQ8pHjk6TNioP4DYN6c1ua8Ickp1eSBxjgR3CsO
	i0t9o2b6+opE9Kat7Jwkqj/rttbI4u+QqANtl7YMPRGxVzQILDCKTucoQAOBQ9CCtFF9khCVqtR
	XjC1LVisH6GtY5VpyNVESN2xlsdl/b5HXZrYvkP4poJVxLa9TiKo/HMFTcDzHB+1Sobpso8Uwp9
	sn/rk2a3OuD7meWP5mFnuL9NlOusnvezlYtL7gsLNYZQRe2vTJwkhfxG04oABm9FceTwRzbPyyJ
	kmov5A3WJsyFZBbRMTurhBOCZmj2paLriGvGfeQh+2xDL8+6AFtYUWByYyjkCxJ174mnDAsLUjI
	gdZM93RPJ/GYe194eZuGR7OmLNYOFevz27A9mUU5CF8dhEa2dlsO6E52yXe1egGQYG2fI7QtoLC
	UaUrLQ=
X-Received: by 2002:a17:90b:2e86:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-39bac3b0c7emr12100634a91.17.1788986019372;
        Wed, 09 Sep 2026 13:33:39 -0700 (PDT)
Received: from MVIN00030.mvista.com ([117.254.227.91])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434c745a09sm14163385c88.7.2026.09.09.13.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:33:39 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][wrynose][PATCH 3/6] curl: Security Fix for CVE-2026-80229
Date: Thu, 10 Sep 2026 02:03:21 +0530
Message-Id: <20260909203324.765094-3-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909203324.765094-1-sdoshi@mvista.com>
References: <20260909203324.765094-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 20:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245496

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

[1] https://curl.se/docs/CVE-2026-80229.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-80229

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../curl/curl/CVE-2026-80229.patch            | 35 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80229.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-80229.patch b/meta/recipes-support/curl/curl/CVE-2026-80229.patch
new file mode 100644
index 0000000000..74be963fa4
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
index c466132ca4..a55cea4e31 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -29,6 +29,7 @@ SRC_URI = " \
     file://CVE-2026-8932.patch \
     file://CVE-2026-13608.patch \
     file://CVE-2026-18924.patch \
+    file://CVE-2026-80229.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.34.1


