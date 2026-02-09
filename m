Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B69CE7E0A3
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:47 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44210.1770629381235303135
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=E1r+RxJ+;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4362507f0bcso2465682f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629379; x=1771234179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWwpq+K4lfAsHS8hIwa3kzMwrcicgqjiPOa8LAL2Ko4=;
        b=E1r+RxJ+ue3sh+NoHd2s471LSWPPBEF8zI6zuic/INYRBSF44vBK1M/awUwbOrBOiK
         cv4Mj8izJDSkvKpwC8W4Xwm8XGdfdgTNewQwSePH+CoIw/sj8hH1ULh2bAS3nfmeJWGS
         OHkTl0ct22YxEt/RIF6rTACPNweEvqafpj1vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629379; x=1771234179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eWwpq+K4lfAsHS8hIwa3kzMwrcicgqjiPOa8LAL2Ko4=;
        b=lCjWFtn1d1S+LipdnWpElpGBGjjQbxcWT4gQ/TSK5fSLyJtn6vU8TCsDFyTlf2a2mT
         PV8mSkKiZnooORFsCbT0uaOf+7pjilW5wAXHGVNQ05Mj+k/GqkcU6H4gxQYbozgxAYve
         1d4BnJ21knC1QqfdCR7by8X5832pX8+En6YoVt5e8l4mqWE93jngyjB5NVj6D0p7RBuT
         GcBrHnFXsI4i/21qNOWEs2SdXZBdBOevtf+6BZdwyVqJWg9QLPKOwIVyV0l1cA/BwEin
         oLG7+yGML8ObuLdWeSr9FDapBSIuiJm0LEdWkv5MKFlHEI572mEtbZhVGTmqfw3jRfpc
         SrfQ==
X-Gm-Message-State: AOJu0YwCIDNgVUGXzIqS93e97r9VTfJIiPV1QWGQ4Gl6roBPipDIgUvs
	27+r0zynuKyFHVXBopBExAHpkmUia0rIpydSI2vY+K+jj4WAEZm/AhrHr5jdTz902FkU3JfzTNb
	6N1+KNxY=
X-Gm-Gg: AZuq6aKZoyAPCrzzJoztys89zU3ZiNRwDrKi+4X/I65Akt8nZeUouS4iBG1vbzMxoif
	jjnt26obYTRPH2cps+7KA9BKAXWVoIta2TkGnLGfqtsBruPcPzr+ZtuHzTDx8vvBAx/NwjaImso
	iw7mdzjzYcmC9ogDZ8B0b1Fk8hWplXo8nuRc65P/JJm3YUYtZ1ZGPDlozZArkQKao/Ak+e5JtOL
	6eIofo95e5XTNI9lGBU2CTaCpbJ55aU8j/I23y00li8HLBrRt+unOwhZ9qaGRYbqQGuWCbkSVB7
	TlH276PZ8BSOddBZKkjuRvuS5zuWkiswVoDKeDacT3JnmCVbREf5qZstw+TgSqUCVrS9AhEZPkV
	d/JpLGQ5FKyYsEZwFxtPWsVn9FawHHStTHE00IyVfbHL0X94kPDm9ISNAEszCINcVTb9gd4aUII
	sAPVfQVjVoR1UmSmqUENSCWPqIU5JJGcV2b+q+p/5IDbRo67k367a29tbx+6p8VNXOyGx0nqC/C
	5gTgy4RQTy1ru0=
X-Received: by 2002:a5d:64c9:0:b0:436:180e:78d9 with SMTP id ffacd0b85a97d-43629035082mr15327800f8f.1.1770629379306;
        Mon, 09 Feb 2026 01:29:39 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:38 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/25] pseudo: Update to 1.9.3 release
Date: Mon,  9 Feb 2026 10:29:07 +0100
Message-ID: <cd31c73663bbc42209eba1743cd82bc77ddf48e9.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230775

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in the following changes:

  Makefile.in: Bump version to 1.9.3
  configure: Minor code quality changes
  pseudo: code quality scan - resolved various potential issues
  makewrappers: improve error handling and robustness
  Update COPYRIGHT files
  ports/linux/pseudo_wrappers.c: Call the wrappers where possible
  ports/linux/pseudo_wrappers.c: Workaround compile error on Debian 11
  ports/linux/pseudo_wrappers.c: Reorder the syscall operations
  ports/unix/guts/realpath.c: Fix indents
  pseudo_util.c: Skip realpath like expansion for /proc on Linux
  test/test-proc-pipe.sh: Add test case for proc pipes
  ports/unix/guts/realpath.c: realpath fails if the resolved path doesn't exist

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 524f4bbb11f9c7e0126e8bd46af217b452d48f5e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index c78f1ab724d..d08fe9f42c3 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,9 +12,9 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "125b020dd2bc46baa37a80784704e382732357b4"
+SRCREV = "750362cc7b9fa58dffccd95d919b435c6d8ac614"
 S = "${WORKDIR}/git"
-PV = "1.9.2+git"
+PV = "1.9.3+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

