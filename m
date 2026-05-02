Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C0ECD342F
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:09 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9476.1777739403584328565
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KpLUlcqo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44509921fbcso1472730f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739401; x=1778344201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q6Xwvw/ZVKfv/gGTHsdQ3eiXpcbem4sDzk9B0Hc2OKI=;
        b=KpLUlcqo60tPWntTis45AowBqyxBUSHc1OzUPB0Jf9speOPOjaXfFHAwt7mNQTd7zQ
         gP/LyXmvyqvNobCEuay5pRfg0FkngEqMscr/XZkbD4c16S1FsbJXmE045YD1yKgJFdxu
         rou3PjURsgRf5FMZpnvjGrXLGvn1Qgb9QAzqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739401; x=1778344201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q6Xwvw/ZVKfv/gGTHsdQ3eiXpcbem4sDzk9B0Hc2OKI=;
        b=tEgc8MZ8cmFE8Z1fpcfF9cOJOu7SnuYmDriXlNojvjLKLkn7DHvW4wQ3iN9ei3xRFw
         pFG9fpxB5S9Azydo9evCPVDfi98RqVqkcgu+2FkJTcFB2CZ7Og13spGNZ3c39HjrKzfp
         zpbzo9W4hjB7Qn+uPnWx+sP1rpgt9g2U3GszzI6aGrRh9kGjo1awhipGy4qhhgpsI83T
         saNhgU4KRp5Ene0znlk4jIQpJ8Bjg0YDsgNs8vHRvczDoHUWCpeGAGpht1BXOYM39ldI
         hCYdXq3eENyGTYPNQrOGlq7hBxbea2FnFmmx+OY38QiV3dXJdL0UnNmwukPzkjM2YEyK
         De3w==
X-Gm-Message-State: AOJu0YyXJSXZhvqfaLATGzNyZyFC+8z7RCSzErm94H7o2j6BKEmOQIHz
	G8yia5o9nN9DfaicesntN+8RXCCefDJyoiZl2nbRWE5wivYGZTGbpnppJUGHHTmbVxpuvqAhp/w
	zUuYc35LOhkxXSjAE4YjfR0j5DINRgS/ahSzbvLaq/bvGC8OLSFXeoVPFqrs68n9NZot+uxQm1j
	Td+gjptfFysJGubPs=
X-Gm-Gg: AeBDievBafqELJvuor46XHLfNC5QKbJIWwUKkjmbtJdmphDyFXALE4xely2OMByaeok
	wAMXzGTr0nhYvNWaXoTpfhNhYl0IeB31j2CnFBcnGBkT7WyHSzlI41xpz17PE/mrtG+28kqBv2/
	Z7gooB/UNW2x7mujFf14mumnLKZ6PNRV2RptVZvrBCJw6sB1GLf8fcPEH+AIH3VmH341nIIpdRh
	mR1LY54yg8fHuP5fWVWKgvisJjGTWoUlrh1OQmPxIgCId9Z4ZiG6sq1RS6w5xl+imMls4fn34Gq
	991RAS5U9Z9cWe1s7qg6lzRSMrl7OHtwkDjxAOnjMmPEsNoSIbgAn4xbQ3KGtmnY79WfR/FkLTg
	w9tmTxk+Uc73LFhtG63GldHUiGlmizK6kvbV8GO6Z6AHZmADLs3xypE5OgnXbwa88BpXwGgqyNN
	U2KzJnACO3SZvstxwwdA4YaVyP0G9VQJ5+DJQ3iAV5bz1A1O8CFjYZiNXsvSSt+GU=
X-Received: by 2002:a05:6000:4304:b0:43b:8858:1146 with SMTP id ffacd0b85a97d-44bb62073b9mr6245656f8f.41.1777739401421;
        Sat, 02 May 2026 09:30:01 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.29.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/62] libgpg-error: upgrade 1.59 -> 1.60
Date: Sat,  2 May 2026 17:28:37 +0100
Message-ID: <20260502162929.1377831-17-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236326

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-Do-not-fail-when-testing-config-scripts.patch      | 6 +++---
 .../libgpg-error/libgpg-error/pkgconfig.patch               | 5 +----
 .../{libgpg-error_1.59.bb => libgpg-error_1.60.bb}          | 2 +-
 3 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.59.bb => libgpg-error_1.60.bb} (95%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
index 39798c009fa..3484af63b3d 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
@@ -1,4 +1,4 @@
-From b1b6c28b4753c027052aeb6275a73eed06f0bf49 Mon Sep 17 00:00:00 2001
+From 48d457a819d1bf4171c6cc7fe161cdfc66770be2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 28 Feb 2020 09:19:56 +0000
 Subject: [PATCH] Do not fail when testing config scripts
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index e56bb23..8c3ba7b 100644
+index 7fd1d98..93a95c8 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -326,6 +326,5 @@ gpg-error-config: gpgrt-config gpg-error-config-old gpg-error-config-test.sh
+@@ -331,6 +331,5 @@ gpg-error-config: gpgrt-config gpg-error-config-old gpg-error-config-test.sh
  	else                                                   \
  	  echo "no";                                           \
  	  echo "***  Please report to <https://bugs.gnupg.org> with gpg-error-config-test.log"; \
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index 38c55ad342e..485c079a2bb 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -1,4 +1,4 @@
-From fdc0b6f84bae7cd6eea18712049da62cdfd5e630 Mon Sep 17 00:00:00 2001
+From 3648accd954d86b14f7a4eb72b9ffa4fe57b72d5 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 21 Aug 2024 20:03:29 -0700
 Subject: [PATCH] support pkgconfig
@@ -241,6 +241,3 @@ index 263f21b..e54ab38 100644
 -  AC_SUBST(GPG_ERROR_MT_LIBS)
  ])
 +
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb
similarity index 95%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.59.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.60.bb
index 53280f57700..622827c2ca5 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "a19bc5087fd97026d93cb4b45d51638d1a25202a5e1fbc3905799f424cfa6134"
+SRC_URI[sha256sum] = "11b2a738e212f3eab0fe8637bc341d3181ca964e97bb2654de91aab7dae4ce09"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 

