Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6789FC52D1F
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:27 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.55658.1722258799407072792
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uKWSaxT9;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-710437d0affso1981297a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258798; x=1722863598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+DZT/6YvMGaD+jpCufnA5XxiMp32uZATzUjFoGGBDw=;
        b=uKWSaxT9AYtZMcRMkd9saXStF50rKlr2jIXyRkhz6c/u4m6pS9sGZ/A4c9L2Wk3LIr
         4qDv5kJuNP5xuWDmaE3jF8HnrVqUJjFAi6F4V+gZYHPl5Hj7fdxh6W6ai1lLwcqG65r/
         g7AepwDfn3/10o0lEZhsSIrLJnR9E3yQ0DQpC3AfIjsH5lJm7ujuB08Yl3bRKP2516lE
         8CtNL2aUsr4xZiCUXV+Dck79Q9i+rZ9A8LcBKPa4Zi2h2gpzMgy29+veOgn0Xwe4z4Yy
         eUu7xHJXHVG8sLeGCIoapi52KOoH58Yg8IS3j2D/0VG29StBulSGr521EWrZLJ3RryBo
         yQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258798; x=1722863598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+DZT/6YvMGaD+jpCufnA5XxiMp32uZATzUjFoGGBDw=;
        b=LMUk0nvEgzhz2aqUo68wnW+ytnR5C3lekuUUqVB/httOJxs0tbMpJT09HoEHY7c4YR
         a5eqQJld7BLZ0uD2xNo1CLsYO775CkI612X1lSjAxTJlNx2BfmB3ggKUq+W0G2Ab1MCJ
         Hagf8bxci6jyuK0Uq34Wk8FVsk7A4lnf2eCbW6KAo3JVzRDygSqp6D85kdrkTXY1sAW4
         SJy9/3mn4qzL6SM+6pFU/fOgP1oJSUbIRmBEYS368cMXpfbXYUe5ikzXGV3EKh1C1wPX
         n8rw42hU92ucBviq4MrVVWEqH+g1QtmKTzaXKe/QxpD5LqsryqoWS0akpVSZui2Rr368
         B4Wg==
X-Gm-Message-State: AOJu0YzSGbyUYMp1Su7z0jYsQS7JMZtqnI/hoWxOBBqYzBpFxvI/Z76O
	Vlvrnu/wlrcU8JKG9iWmTUwG3C9g1rjaM4rHSkQO2ZCKGRN/6UP+Nn+SmyfA7/h13v0tHW2Nk58
	82smTkQ==
X-Google-Smtp-Source: AGHT+IFkULXin/4Gr9qIMx9d6CM/OFeiPZ4D8IIgwj75f5YFpd0wj2fIPUerKV322dkRODMTqjBBcQ==
X-Received: by 2002:a17:90b:270b:b0:2cd:3445:f87b with SMTP id 98e67ed59e1d1-2cf7e5c12damr5185301a91.29.1722258798566;
        Mon, 29 Jul 2024 06:13:18 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/37] grub,grub-efi: Remove -mfpmath=sse on x86
Date: Mon, 29 Jul 2024 06:12:26 -0700
Message-Id: <17273366f23702077fe7a270afc7b5d26a650bf7.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202630

From: Khem Raj <raj.khem@gmail.com>

This option fails with clang compiler when testing for soft-float because
OE enforces this option via CCARGS however, gtub's
makefile/configure does disable all sse options when checking for
soft-float support, but it can not disable -mfpmath=sse as its inserted
by OE, therefore remove it in recipe

Fixes build errors seen with clang/musl like on x86
error: the 'sse' unit is not supported with this instruction set

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad76da4ff6d7110747b620621ae3728de9905465)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/grub/grub2.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index bb9aacb478..54c0e9bdd5 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -52,6 +52,10 @@ GRUBPLATFORM ??= "pc"
 inherit autotools gettext texinfo pkgconfig
 
 CFLAGS:remove = "-O2"
+# It doesn't support sse, its make.defaults sets:
+# CFLAGS += -mno-mmx -mno-sse
+# So also remove -mfpmath=sse from TUNE_CCARGS
+TUNE_CCARGS:remove = "-mfpmath=sse"
 
 EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} \
                 --disable-grub-mkfont \
-- 
2.34.1


