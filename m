Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86606D63956
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:54 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.13864.1732111073865571734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aBFy87q6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20cb7139d9dso21762615ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111073; x=1732715873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5oOFCFpI6IwA+PzzonMbGpqWHBJ9FCgmFPEOsPEqoM=;
        b=aBFy87q69gw59oAiFENW/x5fWAPBK5NGrJB0JlF5KYu52Ub9MOiQuuaU2jvRQWhZsB
         pIJ5olOzGAYREhY2QwRDw8CNIt5aU92GvAzcU1enjizrttSicOa7ZTr1pk0MiFpctJf9
         u8tNDdQrzKYLXELZCT0iSfr2sc4mCIE9KTV+qr8Qjha4b5gEx2omjgGup6t46rtAgQtv
         +zVUOw8aWOOXUK5cLi8SsLlAA9jltYMxNX/iZ1OWqcH6IDaZXG4Oiu0arFp9KYnPfqvy
         AU7m1jowX3eqGO3wJOtdAI74fAekBNC1bljd8CvYMQVakxV5EOeRxV4JtLo6EGdNqSdV
         o/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111073; x=1732715873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5oOFCFpI6IwA+PzzonMbGpqWHBJ9FCgmFPEOsPEqoM=;
        b=i8hwwC7Qv1Fms9eHXCnwJ75RFmzCpw1P9ztOTqSDexKdF3R5UBwg2EmZAwOjAXNTvY
         SpkBe5vMzBtP7kKtJL+67LxJuIZXFF5Ycafw23cTuswxI1EvlxMJYa0jfMmH2Hcfs/r0
         BpYNjAYC+0qQU2vqjsBBcm/3mFtFczuLulb4PZnylG56kDG+RqTCucn2OdRXcTxC4mJ5
         ITQ9n/HQRCm8d1jeTu9xbV4N/wy+/BaNprTIt9Apmgih5iVsClPaOKx8BH7cRpypsVnY
         OxQwjGm9vPSOpoUC2mEMI4ktTLfKysZnl2kX51ZfjvHzuoLOocQOZoUGE0X5DKRlG4O4
         G8Pg==
X-Gm-Message-State: AOJu0Yx6D9Jh3rUEPhFEslK746sI1PMeR9D4IUWF4bxuR6H1O+9zqouq
	IkLumth4Ylgrt54Ei1nAqL3nKDyyzEhC3/KdUVKG6ZcITC9xLYwLacpaGU2xQof7je69zJW0Z+I
	2
X-Gm-Gg: ASbGnctkKsvwbM2XGK78sZ0l+IIlKFBqOfXEhVkK7cMI5JVajZ0j3vpQAm7U/dzqEvZ
	XtDTht8P/4vBrI5SIwKx4XBB0U28Xjigy4+1OEJqjReVphvgRBoSLiM8J1FLGjUM4DSNOhLLrjs
	UFa9Xc5U3y0LWxHif1EKZTtqpIcDd/VbhR8qxAIWccpq14w7ZO7RGE9DbvcY1d5gw3uZ9EYcfMS
	p0ENedQktcpQFpCj76tM83HY93ZGw4zCSpbfZ0=
X-Google-Smtp-Source: AGHT+IEcyvBCNYASbBBiTBx0jwkk3UbLG0j9CdXR3lYphm87TTNRfiX/+93bfQ9c7YevyyL2HpdMMA==
X-Received: by 2002:a17:902:c94a:b0:211:3275:409 with SMTP id d9443c01a7336-2126a3f418emr30486775ad.33.1732111073107;
        Wed, 20 Nov 2024 05:57:53 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 25/31] tune-cortexa32: set tune feature as armv8a
Date: Wed, 20 Nov 2024 05:56:57 -0800
Message-Id: <2ff1c65ad0df7ad40939765f5cf0c08afcecd01e.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207449

From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>

Cortexa32 is a 32-bit armv8a architecture processor, so set the tune feature
as armv8a instead of aarch64 which is 64-bit armv8a architecture.

It solves the following build error while compiling libgcc-initial
and libssp-nonshared.
-- snip --
aarch64-poky-linux-musl-gcc: error: unrecognized command-line option '-mfpu=neon'
aarch64-poky-linux-musl-gcc: error: unrecognized command-line option '-mfloat-abi=hard'
-- snip --

Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3b898270aca62559dfa42ed71d296fe8a8b46a41)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
index 25bdf12b18..0eb938a240 100644
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
@@ -10,7 +10,7 @@ AVAILTUNES += "cortexa32 cortexa32-crypto"
 ARMPKGARCH:tune-cortexa32             = "cortexa32"
 ARMPKGARCH:tune-cortexa32-crypto      = "cortexa32"
 # We do not want -march since -mcpu is added above to cover for it
-TUNE_FEATURES:tune-cortexa32          = "aarch64 cortexa32 crc callconvention-hard neon"
+TUNE_FEATURES:tune-cortexa32          = "armv8a cortexa32 crc callconvention-hard neon"
 TUNE_FEATURES:tune-cortexa32-crypto   = "${TUNE_FEATURES:tune-cortexa32} crypto"
 PACKAGE_EXTRA_ARCHS:tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa32 cortexa32hf-neon"
 PACKAGE_EXTRA_ARCHS:tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa32 cortexa32hf-neon cortexa32hf-neon-crypto"
-- 
2.34.1


