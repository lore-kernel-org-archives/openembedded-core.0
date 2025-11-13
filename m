Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273C8CD98FA
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 21:47:54 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4356.1763070472106120162
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 13:47:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=c2Xg1goH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-297ef378069so12447475ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 13:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763070471; x=1763675271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2nbZF6O84rpgmwBMajw97MJQNOVnxUvse5Kt2ml0Ww=;
        b=c2Xg1goHhBVBT9PPFb6Z3WfY3XS3copXcyOCHlj9B1MB0Ia8jgzWdhjyoM6h1a8ts1
         fVAA9gGaW23mtfS3maX8KkUtPmlVCPsTGUnQFHxH5lQ+jIQbFG0LY2aXThA0A2fkwzrX
         6oFT4M85q/pstk6k2zdBK1Xu/X0Fwx7XGNOOTFdqNLtCAdS1Idk75AQRoae3PGChw13k
         g8BzS9gXbqUdJozuKniEk1WwIBx5muXdVgO8NsfPJFnts5r2Z5tTMFhzOYb4Rv5+x2LC
         iLap/lkYqj81xzuVN7PwFVzZbbEgDmLHKrlUkre+dHZRc1EgtmvPlWXpMMR1r7JPgRzu
         BcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763070471; x=1763675271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A2nbZF6O84rpgmwBMajw97MJQNOVnxUvse5Kt2ml0Ww=;
        b=YRZEds6OHBrAd22V8U3YIQtBvuced/Xqwatz1RJ4SSDmRXXgl2ye7F+a7224dZTDO9
         YznlvIVgM9TNBMBmjMfL8WLmtZ2Ang78BmQ+DOX2dNvmFOubJLEBiT5J8q/eItzdSCZN
         SiIjJ5PvM6nkVopU8MNz01ztuLztZVK7GWkDU+T4NucahZgjkHgvuNtkdAQfFz1Em3aY
         4KaR9Xa7yO9o1ffEtfQhxNYJ3pibD3tcvGO/6RY+qZdeH/VIBy3bYLqh00yIF5thDhYj
         wLY7h/8tGVSxjnkFA4Oa1q8JxAtaJ9LPP7aRRomiZ22YgBtrz+Qj3fuC/0lPnplNCCyy
         oGyg==
X-Gm-Message-State: AOJu0YyuMcbUy4QCamnVlwo03QG7cB5qoYfQNEzsSKY09m4Uzxb8Thpj
	W//wDGXEXSGd1pH1wBN6InBCoVKyTseQHW4TVV9x6vI/KQA8Ssht94UWoUg/nP3HrmwGqjkSvKC
	9fWpK
X-Gm-Gg: ASbGncu7epLWfMXXjlNxrZcxSVMnROe/gUpQ7I6fWf/5rpE6TJuQfFpmSZrJ9vGvBYt
	HJ37NH+MA3y24qYGkjgEbkVm0cWaVx0TN9BEmV90mZWoq7p35Ih4uUt5Q8EM6+j0m8pdkvw5WO6
	Xler7mR8fbWdPwDfTvA51CisOGx6WZQOSueQUYNeVF1uibNCPHcoVcfqNGU7wkEdqc9W7k4ZuU1
	V+gKsZSUetFFRdKTw2pUHJRhxGBfG5i+ibZiNf+mjbeObnGWCdfGMCsMboXuLwjhZwqVQvQvvvV
	Z5WCP04v7VQmLTKyjuUThcAqBMPHiAMeBeH52N+d9N7wa2fGyyUBybAsFMqf0Qb6MsdseprFXim
	6SJcINvbJXNkB3ZV7Oi8AnF3ARCI/BLnlFKjv1SvSimtMXu52Os++iWn0gP1NOxHPig==
X-Google-Smtp-Source: AGHT+IFyrJFvU23sMqEfMBsYoht1WJ20tPgu483hIomrAVjlyXqdOso2UXxVu56QE4sHUhT4IWGyOQ==
X-Received: by 2002:a17:902:d486:b0:297:df4e:fdd2 with SMTP id d9443c01a7336-2986a6b77b4mr4057675ad.9.1763070471451;
        Thu, 13 Nov 2025 13:47:51 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:70b:f91f:acd9:f6d9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d68sm34639815ad.61.2025.11.13.13.47.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:47:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/10] goarch.bbclass: do not leak TUNE_FEATURES into crosssdk task signatures
Date: Thu, 13 Nov 2025 13:47:29 -0800
Message-ID: <8aad87c12a809d790175b9848f5802d0a28eecac.1763070333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763070333.git.steve@sakoman.com>
References: <cover.1763070333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 21:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226282

From: Alexander Kanavin <alex@linutronix.de>

The default assignments look like this:
TARGET_GO386 = "${@go_map_386(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"

TUNE_FEATURES is a target-specific variable, and so should be used
only for target builds. The change is similar to what is already done
for native packages.

(From OE-Core rev: cfff8e968257c44880caa3605e158764ed5c6a2a)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/goarch.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 394c0c5d84..5996bf1805 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -18,6 +18,9 @@ TARGET_GOMIPS = "${@go_map_mips(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES
 TARGET_GOARM:class-native = "7"
 TARGET_GO386:class-native = "sse2"
 TARGET_GOMIPS:class-native = "hardfloat"
+TARGET_GOARM:class-crosssdk = "7"
+TARGET_GO386:class-crosssdk = "sse2"
+TARGET_GOMIPS:class-crosssdk = "hardfloat"
 TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
 GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE') == d.getVar('HOST_GOTUPLE')]}"
 
-- 
2.43.0


