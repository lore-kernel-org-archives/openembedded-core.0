Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F75CC52D11
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:12:10 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.82184.1674238327344929246
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:12:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=To6ejj7R;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id g68so4729203pgc.11
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0D7WZ/G3EN83TwhNEsHPQkcMNdzzg7sAC4hiYjdSB8=;
        b=To6ejj7R9bzQN/p3Dp/+gFo8b5je4AWgi2r9AwlJoLFwoAogbAmCWzh7iwBRRoohDr
         k0RFAGqcyfU54fR8s+MKDwGYifGfb4JJ96+Ez16WH9Ete36l41eJkzo7EWAjkUKCBoSN
         6/IvtrGO6LRNUD7VL0HcQ4IrJeCYzjtAH65Uh4Oj/K9kAJfdms09cYRNofRkzXtBeQpa
         qY5A9op6wJfLn0BbPMA0kHWcurNcg9q63xV5MNwFKgJeKwqWpT5SsNnDBMgDsqCrQXwP
         zpbH47JsRchl/etJhhh+d+xGhFK1heVMR9Twv9wWdIOoQ6bXX2wx0WEuSueq0cOOs9Qf
         go3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0D7WZ/G3EN83TwhNEsHPQkcMNdzzg7sAC4hiYjdSB8=;
        b=ii0ErH0PtWkmbyp8G4tFyI4Vy2uASf0NYpHfyr9f9lwMz8a3+Ywfei9xjSulFbPelL
         yOcPhdZBBtecqo7VGJvzuemFCuvU1uE2UJQEbi7I9ibNvNzgLXCNMKVxI0uJP/lH9LaU
         SzR5ZHAcZAPnoVGo3Zyb8Uvk0ILaoosMJ6m+3i6Ucpy2v5g3bn888c8EPXOQugG6dns+
         YmNWcugzXZ2/zD1Fwl009QS62iXbnPKcDlJdUUCrBRBO3CAgoXbOlROPsv7Yem9n/+zI
         l/S2UCxE6PJ4RQ4S1wagYXXha4F32Pw+g/AXOnjrhOGK0bXsQgm/AYhm13ZWqE4Q9T5I
         CcWg==
X-Gm-Message-State: AFqh2krjwviB8hXdPRs1UiO4RSgQUgltgZfqplEUMpXSgyDj7lUYICJm
	qrzDmii8fXR0s46yC0EPjT8+YfLkIr26U00soOQ=
X-Google-Smtp-Source: AMrXdXu9QfdAfw9sf/1PIP6RWY1EI3RQga/kbT6CPaNK0laesnYafVFxijMCEOOV+iSNrtjy8z1BsQ==
X-Received: by 2002:a62:6441:0:b0:585:f9c5:6e91 with SMTP id y62-20020a626441000000b00585f9c56e91mr16727886pfb.29.1674238326312;
        Fri, 20 Jan 2023 10:12:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.12.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:12:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 34/41] libpng: Enable NEON for aarch64 to enensure consistency with arm32.
Date: Fri, 20 Jan 2023 08:10:51 -1000
Message-Id: <27a58c11536bc0e804904c2dd97820973d0b9a2f.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176241

From: leimaohui <leimaohui@fujitsu.com>

NEON is enabled for aarch64 by default, so, to ensure consistency with
arm32, reference to libpng-1.6.38/configure, added
enable_hardware_optimizations option for aarch64.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 12e68d5824849fa20f0e3fe8fc1921da111bb6fb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.39.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
index d9dcf379e9..a6c229f5cf 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
@@ -22,7 +22,9 @@ BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 inherit autotools binconfig-disabled pkgconfig
 
 # Work around missing symbols
-EXTRA_OECONF:append:class-target = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off", d)}"
+ARMNEON = "${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off", d)}"
+ARMNEON:aarch64 = "--enable-hardware-optimizations=on"
+EXTRA_OECONF += "${ARMNEON}"
 
 PACKAGES =+ "${PN}-tools"
 
-- 
2.25.1


