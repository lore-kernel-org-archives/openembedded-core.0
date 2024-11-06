Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10008D44D6D
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 13:49:57 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.45911.1730900992739659800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 05:49:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pHaLi6G3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e5130832aso5474941b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 05:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730900992; x=1731505792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GtNhVfWPd+czOHWHr/WAKFNMuU31DEUD1izz9AZ/q8Y=;
        b=pHaLi6G3ACND5gF9jMRclvM1TE8I578XuJDSUNxzQlFcjJVAKtV5owgeUXgGnIAI8w
         I9g1G8boNOCTQB3FI9l+XqqIJVKZiW59CtJPLY6lqBQuN1/ap+tQBNX4QsmNfWYq5rlO
         RqLNFJujcdvn0hTSCUViOx0gMXMp0AkRIFxAWFxlqkF9UVzMgQ+xtVTAnRfKif4MKwCG
         3HuIMChZOdjfgK997irL92fQUJGWHPhUlhXnllwkFt4piAWzpWwqV2bUekY3z2kZ1FH1
         pAYU2vgoZFp2vdarE/ugG/yWtLr55xGAYat1Zz2LrPuITcDPLCbZ8uxU/7tN9Vk4oZ3i
         /0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900992; x=1731505792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtNhVfWPd+czOHWHr/WAKFNMuU31DEUD1izz9AZ/q8Y=;
        b=JLriiYSzcgnGhvEWcu0FJu4g8Fkb3MteHdhB9O2p/bR5aI7/KxOd28y+qH8UE6E6Hi
         REqxnKuiaCwQUhYseqqMIdJA+Sbbm6N21djFjbXwxJwRwqYSpuZrI03rMKsELq8oLMz2
         04ZWvGBfP72EceaGQ7+PoCJOkoeUS/z6FtxKbdofJ0cr89ZJqVBVQcwQA6ZbVCBieU76
         jfGb6XPbeuUe+YEt3SgcXF/3WF27hNJFAFCDxBykqjYn1cXUqNxg23gI5pkJ4jAq0g0W
         On22E4z2rv8W297CZCm481wk+3J4wJcoZqrL0WyGyYbfedZJ6d42K5rwtG7sJe2rFcyq
         aKxw==
X-Gm-Message-State: AOJu0YwiSQgR+IWM4NByiA6Og3LIZieEdjfFrvUglob6npxR/5GtUycW
	pVweh1xpH4yGVReBRfhE9PfE/i2aY4udqINz0XC5awaMBmY28XIwTfX+Mr4a4R23D5PTLEgxhGp
	7
X-Google-Smtp-Source: AGHT+IFinN8Y0yP4c3X1Ab+lbJuds3WMdv9DO6I5rQMRU7FAAigRgH/ErvZexLbNNtXDik6qXu5OEA==
X-Received: by 2002:a05:6a21:328c:b0:1db:e1ce:8eaf with SMTP id adf61e73a8af0-1dbe1ce9763mr12354264637.6.1730900991854;
        Wed, 06 Nov 2024 05:49:51 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a541e16sm1491795a91.21.2024.11.06.05.49.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:49:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 5/7] ffmpeg: Disable asm optimizations on x86
Date: Wed,  6 Nov 2024 05:49:35 -0800
Message-Id: <03c20ece58f4368ff95241e90063269f75e1b81d.1730900782.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730900782.git.steve@sakoman.com>
References: <cover.1730900782.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 13:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206778

From: Khem Raj <raj.khem@gmail.com>

disable asm code if PIC is required, as the provided asm
decidedly is not PIC for x86.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 941fc40ca971f87e61c19e5a0703caa304ec7547)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
index af66104ebf..3c66851b8d 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
@@ -129,6 +129,8 @@ EXTRA_OECONF = " \
 "
 
 EXTRA_OECONF:append:linux-gnux32 = " --disable-asm"
+# --enable-pic is used and x86 assembly is not PIC on x86
+EXTRA_OECONF:append:x86 = " --disable-asm"
 
 EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa64r6', '--disable-mips64r2 --disable-mips32r2', '', d)}"
 EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa64r2', '--disable-mips64r6 --disable-mips32r6', '', d)}"
-- 
2.34.1


