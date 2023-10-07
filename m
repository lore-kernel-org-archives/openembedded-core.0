Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F6BE95A80
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:26:02 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.27942.1696717559354459565
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 15:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SAaUaCVm;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.182, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3aec067556dso2189755b6e.2
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 15:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696717558; x=1697322358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvqA4Vjtc7uQYbFqpEPovjNHJYEaTjLi3fGNBWFWRrQ=;
        b=SAaUaCVmO1NatVKOadYL/JL3lLPOFBwX8LnYyC+QH+FVVa0UuYuZ3dRK7wVs0QuxnV
         hLABiMg/MA9CRvwSKxlXdHO1V8GNGOMcgGvOKhwL7mHzmYJ/j21KK5+NuvvSPQTpfXJA
         X9oxQaYi3lDb4GbT5awqQWb/VjSRykQnCSXpyaox/guUtwp9w/31sGaw2jEjaE/ot2Rn
         tKXrSGhCBi40tDv1xUmAfRBmE2AWjZNbj8UWcL99dwELbOw4e6dUzdscwGfIOGwyY7yh
         g3D1ZF3UDiil0VH35aRcUY5mlQfxADz87c70/765wx0/NpTdTwtAwvDyIGpn4LsPi5Pj
         4w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696717558; x=1697322358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvqA4Vjtc7uQYbFqpEPovjNHJYEaTjLi3fGNBWFWRrQ=;
        b=cDGJ3zadkOSz+spQ1BckO9pwg5FMtBo8pQmjGK83acfbGGyhMge5WlrsNclexFkOuu
         LcOJNMsItoJxSiR15LqsaxDwhzycbnWF+Hj1iicpsV4x0GO3kCD7knCbqitPvEb4+JN2
         Oa/GbR0Vjalgw9yJC6U43yx5VPPkbsxXaHmtohbEDJRs7ovasZoI+X/vXBbZaHG7DnNL
         a2jM6XLemfEG0Nkat6tfptdRZlHyhHbXxAwP/zlsXjU+bjjmVnYzMRyu7q+T24H4jxC3
         DkE3dLDlKh/rH3nFA7g/QQIf1fJyhiy23by6b8kDWtNBPhYV9WN+vVmTZNPnbLgGGrFG
         sdlw==
X-Gm-Message-State: AOJu0Ywk1PizhtYp0RAZJkejV7g1CpBa5JgL8YWEBOYg4HEgfrsEKhya
	9mPc4iH/Iux+LuGGt2vlOR/hMUmpiPRwohLJ0io=
X-Google-Smtp-Source: AGHT+IFeLezE0HP+5oLNsLpqw/s3Zp9RKQJ9ig9jq6UOG2ipR75ZmXdgUJbJbWQeJd1BhUEG9ofxmA==
X-Received: by 2002:a05:6358:4188:b0:139:d5f0:c027 with SMTP id w8-20020a056358418800b00139d5f0c027mr11717035rwc.30.1696717558130;
        Sat, 07 Oct 2023 15:25:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b8c6890623sm6424076plb.7.2023.10.07.15.25.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:25:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 17/19] ffmpeg: avoid neon on unsupported machines
Date: Sat,  7 Oct 2023 12:25:13 -1000
Message-Id: <866d3ca22ca30bff9d7b85b87387f40b59d60113.1696702947.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696702947.git.steve@sakoman.com>
References: <cover.1696702947.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 22:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188818

From: Benjamin Bara <benjamin.bara@skidata.com>

Disable neon if the machine does not support it.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0c3a6a74531d3860a3849a1f53f6709d6a0e88a5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.3.bb
index 9899e570ad..cecaeded8c 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.3.bb
@@ -136,6 +136,8 @@ EXTRA_OECONF:append:mips = " --extra-libs=-latomic --disable-mips32r5 --disable-
 EXTRA_OECONF:append:riscv32 = " --extra-libs=-latomic"
 EXTRA_OECONF:append:armv5 = " --extra-libs=-latomic"
 EXTRA_OECONF:append:powerpc = " --extra-libs=-latomic"
+EXTRA_OECONF:append:armv7a = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
+EXTRA_OECONF:append:armv7ve = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
 
 # gold crashes on x86, another solution is to --disable-asm but thats more hacky
 # ld.gold: internal error in relocate_section, at ../../gold/i386.cc:3684
-- 
2.34.1


