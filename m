Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2ECC54F5F
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:32 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43760.1785192990154458313
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tXTisG0Z;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493f6de72faso2743345e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192988; x=1785797788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RAYbAO3yz0HgBfZKL+8QFnT3xh8K5sIV4NyKAQbwoXk=;
        b=tXTisG0ZunISyyWsT+NlIWSkmF/WIvRgwlFnWsAHODldPhhJ8WXIRa77mVZzD6G8a1
         U8Qb7lKL3g6iXasbszEuGtpXOhuJW6LjLkuH9sigz4viwjIf3Ildyq0KxLVHSrRc23/E
         9vGlD7vozQHmEpNQ9qKKPFpUCHMp7YsT7CpEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192988; x=1785797788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RAYbAO3yz0HgBfZKL+8QFnT3xh8K5sIV4NyKAQbwoXk=;
        b=sJgy0jOe6y9WFxNP3gutTcktAqG3RcpNZ9cGGdUtT9ZeAvEDWk1N6eR51A0kM7UY6f
         HHmykviDa5x9Gg5YeJ+xje1l1mQOYuDuuBjTRTgTZVbnT+1+rAqEeukOSv4NVNFzobD0
         rmIP0iQg9rBsgr9ff36v8PJCKRK9K++9FLM26XtM7bqkPKQvM9zXzh0FNYtOVdZBcAEO
         610shmzrwU4TkO+02bEcAwehM8rLzx8SGc28ZiXNPmzbWbO46dBrnobNi2BNmLDOsCGW
         NU5yLPWHdF4a5qJFyfISFoGpzm/KAFxUGDQ/RFYbkVFx4KUP8c/90djl+DKY1c4JURxR
         xaOA==
X-Gm-Message-State: AOJu0YxRFXHvn37zHVFmLHHrUB7TzJakQ0c4IC3Vo+8c+YbjQmN3Gf2K
	qbuPvldwvpqA1hM3OHZJRhs2PwMg7YeKEz4NPE6wK/8x7PNpYNUEG83HbE/WAjcpSW9Ooq4RHEi
	sthzInWU=
X-Gm-Gg: AR+sD13PL1YPoHVsLHtGLnOjeunRRTm5dkJuCqeACVZJ1h/fEyMrwjlLW0c9B2hS9QO
	wtFXjlO5wQY1f/HHMWhwl0RxlhRoRDu2AhHuO/KN10YwZyQ+ui8Mm/rfPZX1IGVp+caeoBrWVpm
	rDoqLtmT3iCAPDjbfhJ4hf7nXd2ekL1bJi8oSMdZFDcADKPa6ewUfYbXys7p3rB1GSAhm/ZTngl
	CH+6v/TGKzPGwtA5I1Vp4i9qr3Rvld7ve9evCPxF4Sd4di6JDeHGBIW0GVRZ12r/zqizIHYMjJy
	I/WB/Q44EZnLrAhEUo2wAVm2vs+oPKphZSgWJiII6UZjFRD/iuCAyWZVgmyKc9WBHlf3HJG4LUu
	EJNRAIFZ5ISkbF8wk1EFpZHMaPHAxMf6V+vOHItWzdXpqPHmW4WS+cLc/tCLLmU2r/zvmsYMOCg
	lkKZVT5sPXrdA324HzCgaY1He1i4a5TeYQnqI6zRklsdij68K66dqqS0ZUYgKEJm4n/gm1jgakZ
	mBZjA==
X-Received: by 2002:a05:600c:b99:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-496c56840c5mr3617665e9.16.1785192988359;
        Mon, 27 Jul 2026 15:56:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 19/36] libgcrypt: fix CVE-2026-41989
Date: Tue, 28 Jul 2026 00:55:33 +0200
Message-ID: <d137592e193b0ea08ac46f3be82cb2cdf362618e.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242136

From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>

Backport patch to fix CVE-2026-41989.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-41989
  https://osv.dev/list?q=CVE-2026-41989

Upstream fix:
  https://github.com/gpg/libgcrypt/commit/2d3d732c9bf87cc10729f69678dd9e6862f99fa3

Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libgcrypt/files/CVE-2026-41989.patch      | 42 +++++++++++++++++++
 .../libgcrypt/libgcrypt_1.12.1.bb             |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch

diff --git a/meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch b/meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch
new file mode 100644
index 00000000000..aba3ca318b4
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch
@@ -0,0 +1,42 @@
+From d8874dd38f78454dd3a760617ebe8d9aa9270649 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Fri, 10 Apr 2026 16:58:57 +0900
+Subject: [PATCH] cipher:ecc: Fix decoding a point on Montgomery curve.
+
+* cipher/ecc-misc.c (_gcry_ecc_mont_decodepoint): Fix the padding
+mistake and add updating RAWMPILEN.
+
+--
+
+Reported by Calif.io in collaboration with Claude and Anthropic
+Research.
+
+GnuPG-bug-id: 8211
+Fixes-commit: bbe15758c893dbf546416c1a6bccdad1ab000ad7
+Suggested-by: Bronson Yen <bronson@calif.io>
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+CVE: CVE-2026-41989
+Upstream-Status: Backport [https://github.com/gpg/libgcrypt/commit/2d3d732c9bf87cc10729f69678dd9e6862f99fa3]
+
+Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
+---
+ cipher/ecc-misc.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/cipher/ecc-misc.c b/cipher/ecc-misc.c
+index 615b0df2..ab3799dc 100644
+--- a/cipher/ecc-misc.c
++++ b/cipher/ecc-misc.c
+@@ -438,7 +438,10 @@ _gcry_ecc_mont_decodepoint (gcry_mpi_t pk, mpi_ec_t ec, mpi_point_t result)
+         *--p = *buf++;
+ 
+       if (rawmpilen < nbytes)
+-        memset (rawmpi + nbytes - rawmpilen, 0, nbytes - rawmpilen);
++        {
++          memset (rawmpi + rawmpilen, 0, nbytes - rawmpilen);
++          rawmpilen = nbytes;
++        }
+     }
+   else
+     {
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
index b3c0d050b7d..55872a5c237 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
@@ -25,6 +25,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-native-gpg-error.patch \
            file://no-bench-slope.patch \
            file://run-ptest \
+           file://CVE-2026-41989.patch \
            "
 SRC_URI[sha256sum] = "7df5c08d952ba33f9b6bdabdb06a61a78b2cf62d2122c2d1d03a91a79832aa3c"
 

