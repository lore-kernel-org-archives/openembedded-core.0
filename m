Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EAF1CD37AA
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:39 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8242.1778224358202547357
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=en/QflDz;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-453903ee4adso1139283f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224356; x=1778829156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZlvH4Qlxr4pfTNI6JPT04GlFfYyBBmRxIhweEJ1SXY=;
        b=en/QflDzefl+/kQXpgwAI62uYfFnaqCz/3RSEScsuRlXkNYTinp08VE/BBkcL9Uned
         LZUw8ixMfcmm2IMfSEb6DKgK71kcjloFs6X2MLeGmrA9sGzqlSlKSRBbqKd5W2QF2jnh
         TnXOmsIo5rVbsOf3qYQm13Ly3gMX+WAaFN5kE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224356; x=1778829156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KZlvH4Qlxr4pfTNI6JPT04GlFfYyBBmRxIhweEJ1SXY=;
        b=BmxYWOYlsS5OBwD1R84Ni041ARv0O03HDwUpNSfZBKyGjGF/USqqSjGqQnP6QihPdS
         UjCoOXeiFZS2/C4G9NDb7P92jSKEJb2VCtuRBpiFTASuFZmKxg2vMkEJ2USOf52Mtwbl
         urmvKIxtYQ56DXUV+gA5JcpvOsblXb/APGhrY/NFbpTETVsF4eNB3esMSk4XhTBf+frY
         2uS25Ttjl/W3h87keu5n3aSpGBdgQL177ObNUXvdpirgmmt5lPYXDWABYWmV0mHhVuRF
         aNZlbWeWo2K17mkj1Y+vvQ7NhirBZ47LMv+vUaESmmZfTxM95QQwpx/ny9+I93/H0zve
         7yyw==
X-Gm-Message-State: AOJu0YyAXpUygbNLTZfRYv5yZyRFvyy8ra6Dtk4DxmbTzOhhf8yArodL
	I0v2lJmiAq/eR6lbyg3nNn51U2v3Tr8f+4r66/WUdkDskVCPWN742KBXMOV7USZ70FhyMAiZiw5
	g/VVleeM=
X-Gm-Gg: Acq92OGEwUL6T/4gdSrbdfa3ceOnXUwP8RSLuP6vqx9V+jYubG5RIADxGDnUF5LkAg/
	AbwuEGnN5PmfmJPQvOYcOI3C6cHpwXXoe1zWFeo1V8Vn4z6CJDfFQhOfARBIxd2ucNiUE+ICGoH
	L6GVQldSJ4Oc1i3l3bRxdZakRXGalwnz4IJvw3UBG2P+FAKc/JN9FfwwPZIZy13x57lmfg1aXwu
	5JvpeW1AdwTnP54jvktWFPhnMk8i6LMMmelJwcR+L9UDdDhhadL1745w0zq/m3lxpTlnsrFf/X6
	RoHn6s8VhHvKwKrXJM4Z/R/g+FSrGkTmLuSpm2/dDKO4WMkGqPDR4qZ+IUhKTNv3TAPqRGmN2+r
	MmjK1RD4v2bceoeaN3iWYa1Sgasf9bMGpEs/s2T2md0q63ODb28xQtBlV5xTmWywZ6bbs3mMuXY
	/f+D9z/NkVx8LWmz7UOyFPlwugdgfnKWe4pj/JhBgR9uwDcHyKwbs/BhwkH2qVt2TfjY4BdsRP4
	tA0XEIUsBSXekHjTjuaEz9LhDOBFLljCJvA5Q==
X-Received: by 2002:adf:e54c:0:b0:452:3677:3fb3 with SMTP id ffacd0b85a97d-452367740c4mr9762468f8f.1.1778224356174;
        Fri, 08 May 2026 00:12:36 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 35/52] pseudo: Update 1.9.5 -> 1.9.6
Date: Fri,  8 May 2026 09:11:28 +0200
Message-ID: <b7200282f2c8b8ad9545f0bc1cfb140ba62f4573.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236677

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in the changes:

  * Makefile.in: Bump version to 1.9.6
  * pseudo_util.c: Fix symlink processing for symlinkat and related
  * test: Add test symlinkat and related
  * ports/unix: realpath: Fix chroot processing
  * test: Add test cases for canonicalize functions
  * ports/unix: fts_open: Fix chroot behavior
  * ports/unix: fts_*: Certain functions were incorrectly returning stat data
  * test: Add fts test case
  * test: Add test for linkat chroot path stripping
  * linkat: Avoid a segmentation fault
  * Only copy xattrs on a rename if it's cross-filesystem

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50e769a598e79ed4600f7362d5f40799a48f9273)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 8c16aa71355..b118f436db8 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "0bad85523ff71f1a84cea5fdf72e7f560c4aeed4"
-PV = "1.9.5"
+SRCREV = "7109ac1b417cd31e0100f6e1c4f3e5743541b9ed"
+PV = "1.9.6"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

