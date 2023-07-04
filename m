Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2B3C001B1
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:29:49 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.61386.1688484588942016936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=UWDDvdm2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b8918dadbdso12840565ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484588; x=1691076588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWWShG9nAKZIWpVw7KA9nyvXL+pqyKt4gjS1DRKiBkc=;
        b=UWDDvdm25Onh/Jnz/MTitNhz5F0+z6cgc49EIl9FIoSPA5aKCTTpJUiUh4bhFho4/c
         m7HlyJC4qSt6eKHkeMi6nvdgmJO6+O8PbueWKMCl1EkxgYSi0AxMu1gdcblNg55b1WTh
         nLTAbF5t5ufcIz34szicYR3/IdRJWwL1Hq4dgX06/P1TO0YRq1+cgIoWRzC2djK3b7LL
         fey9ad9Gbv8UcHMU1QaFR0Ttm3nBfnNrD3bsN2mSmDRNv8g18xLyHC7p2cF85PilWgfi
         Hibi2jAoQfa5ldKYqbO1GBviLUdMuUY+4ybioyRJ7X59t/pKvZMFFzvdo7fayIyW6k56
         HlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484588; x=1691076588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWWShG9nAKZIWpVw7KA9nyvXL+pqyKt4gjS1DRKiBkc=;
        b=aEMmtgJ/etyGykup2N3s8DdnmF8Gez/rVT8+JPYfwKYcyV/dayLmiBKOxt1BBU5lW9
         FHB48NlPqNEgXj3WXdl4k3QNN8iMy5D8P3HE2KJziUqAYVl1hVTuqOleoUhgaby96eIy
         vV6DFZY+uJAHkb97uYcS76+CCTbGCCVAshFPk2rhY9coYiQBhqtZKzBkFqMy+8t48Gf4
         BOEz4ZMSNYlw420uDi6SNq8XfTxVrnHNr2/p6jbZRfgCVxL6ROs+gX9RyTRC/03V0eGt
         Gzrk+ErbBOzapiNTLrXjvBPP5uTmigiFpRmNhaKDs7TRd7V3kwnAqSmg6Hqo1MxPPN5B
         V0ag==
X-Gm-Message-State: ABy/qLbHQetNq7FWofHcMdTRUILQ6YZAtu9T/cDgSOufEBoX5SIVvFcH
	C37s95sNjtgrLI7MmLqjtfiun1zM7QfCsXVxxlz+Lw==
X-Google-Smtp-Source: APBJJlF1x3rCL/rF9VJ5u6kpCHaWC72DuyQbffLIxOeKGqEPJxd4koou4oPnANReL0zCDFhY0El84w==
X-Received: by 2002:a17:902:e845:b0:1b0:6c10:6836 with SMTP id t5-20020a170902e84500b001b06c106836mr13096668plg.33.1688484588106;
        Tue, 04 Jul 2023 08:29:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.29.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:29:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 04/30] libx11: upgrade 1.8.4 -> 1.8.5
Date: Tue,  4 Jul 2023 05:29:06 -1000
Message-Id: <fe81e39b0bac276bda508e4b2667c81c052392e2.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183839

From: Alexander Kanavin <alex.kanavin@gmail.com>

Bug fix release

 * autoconf & libtool updates (!187, !188)
 * Restore missing text in XSetScreenSaver man page (#187, !203)
 * Update am_ET.UTF-8 compose keys to use dead-vowel symbols,
   in coordination with xkeyboard-config 2.39 (!205)
 * Assorted updates to en_US.UTF-8 compose keys (!189, !195, !196, !198,
   !199, !200, !201, !207, !208, !209)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4e931f490854100c2504ce771d5c920e3a62efdd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/{libx11_1.8.4.bb => libx11_1.8.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.4.bb => libx11_1.8.5.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb
index 9058c1844e..cf2e29471a 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb
@@ -24,7 +24,7 @@ XORG_PN = "libX11"
 
 SRC_URI += "file://disable_tests.patch"
 
-SRC_URI[sha256sum] = "c9a287a5aefa9804ce3cfafcf516fe96ed3f7e8e45c0e2ee59e84c86757df518"
+SRC_URI[sha256sum] = "e362c6f03c793171becd1ce2078c64789504c7d7ff48ee40a76ff76b59f6b561"
 
 inherit gettext
 
-- 
2.34.1


