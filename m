Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AA3CD13DA
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:42 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9385.1777739431338938674
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MCyNjM6R;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d734223e4so1608077f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739429; x=1778344229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7oKfN0eSp/+SzfNUVrcihr9Jgffd3M9Kw8g/vTrLwNE=;
        b=MCyNjM6RTETqFttrzEaQXyg79IppQQM6XJ7dT5eHIb760iE5lHpX4al9pGfegtjNIa
         nXU1syU5WJnS+QpZH2EhRfSeEI6TN6Qt1SbLK+jN1AjQ7GEk8TnTAFPTYnP22+j9h8dq
         BLoUQG6jqW5p/Ge7u56K5ST7TXMWksnxJ4EUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739429; x=1778344229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7oKfN0eSp/+SzfNUVrcihr9Jgffd3M9Kw8g/vTrLwNE=;
        b=fqP+qqmuljLeJVW7VuaRoAK/CArVYHu532McJiR7FYRCjHOhQpcmt2hmyMT8mSRKf0
         2wvztGwlcldLCBlCp+Yi7vgi+CYW51rnG75rIX1sDPrZxETDdYOqIggvvTD7gTY9k9LE
         ZxKz5Frkobta2kayUIFzs4Wgb4eSSPcpk/y3xlwDN5B25gQ412oWhrBjKiYQOSuvQdGc
         1WmKatym8PFBT0FmOrmw5jr2pjfsDmZqIDje9Zjv9yEnFnR2W6kZy5BFqzAe7WYQrZZL
         bms0ypV23ZY+4kgSKuFyjGoWJGu/7FBmDegLkransVp3g6Kzdguleb+47AzRYXoWCyTG
         ZApw==
X-Gm-Message-State: AOJu0YzQVdQRgiGEX2GhxUBY660X4frDH95zB55eQv0KWV+Dk3XVUnLU
	rfEB4LlNksota7TB1/E3f5daPuJxSAyP1MjQilzzC5eVWiCQX/xmPze8R+2dVIrW1VBUoymPKwl
	JwYbkht5otpmy04tJp+e+UiiWy7yUtPYTtefqxeLTtP7u8M3EQ1to+zVCPLi9JACLjllB8H2kGe
	I5wMxTNwqeNRANZqg=
X-Gm-Gg: AeBDiev+ZGeBAOuMa7HMV2US1cQdFUfegwD6LTtaP5KoifwwhYRBzNsHX9U7jKP8EnL
	awm0qBXWjo/sOaP13DbWKxreGBzFYHKCIPsCTd4/QLgIDaV3n+hQdeXmUnrnVMfxVt9QqoM4k+Q
	yrnQCGwaUzj1RPSjlFBQZfP/57Vz1Yscp/JpX4MujSTljRfYboMCVAL4BtRtDnYD//sQCPy9hZj
	Lu52oegvQuiAEpid/65/EvB4TczOOvYawBJnnN4JR5gasyg64DsyhIBm21+pIucjrVzVhHzte63
	wa7N/Gx+BCZpWSRl0kV05fVyBgCnBoXX2BaeZlxqTSYF9+LpgwYiYCFqkTq51D8Exx6MAZUv1xn
	SdY51h2ISnu+SPDhBYtzPntRgoVt+ZUlhIsGFYsLJvYiqff4wPQYPH/yL5ECOnEvRa/jRZCOKG7
	+RcdmCQMseNzOH4pFhQBtcijrhfe2uRp6Dd7mpWp9g6VB4pGczB22AIL5D+v56xgM=
X-Received: by 2002:a05:6000:2dc6:b0:43d:7874:5d3b with SMTP id ffacd0b85a97d-44bb444316cmr5743753f8f.9.1777739429132;
        Sat, 02 May 2026 09:30:29 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 30/62] puzzles: upgrade to latest revision
Date: Sat,  2 May 2026 17:28:50 +0100
Message-ID: <20260502162929.1377831-30-richard.purdie@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236339

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 9745c265023..3a6b38f01fe 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "ecb576fb2a0a47df6486919c1ebb945f7f252234"
+SRCREV = "06e37f1e334d85c7c779f79ef9e484ff2f708269"
 PE = "2"
 PV = "0.0+git"
 

