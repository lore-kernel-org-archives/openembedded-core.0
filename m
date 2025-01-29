Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DC2C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 18:05:08 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.19353.1738173905385537653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 10:05:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RZ+6c5E1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-216634dd574so87960135ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 10:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738173904; x=1738778704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=K6Mc0QH7tAmksUvJXDvE3GFYIYu+6ybgT611cCCK9Eg=;
        b=RZ+6c5E1hA622/CcZ6EWBiICntzLV/CwyMqXKpTRcx1IMbppbYVcYa6BbK6RJMurUQ
         Vwp1n4dQIOFNgIvC6XXRhTjsWm1BxAKVGfMiy4qIvv/YVW168nCkPL6SZ2k9lXRDml75
         rPdu4wBlE1OkGLhiySPv5jPoBbmYF38OEGijquKtA4IvaAR+U39v6QtU7+O/4do1HVlv
         EsCr/TdNgK2j8nzjR3xO5kHrcUJrz2D2tjIW+vN8GLA5iEY2LoUFkxkQCWbBkfptYSIo
         xlfk848HK67d57mQV0aPAGuwDq99YFkXFRvlMyuo023VMOOKFNlyMIiIqQJmw7C/JiLA
         j10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738173904; x=1738778704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K6Mc0QH7tAmksUvJXDvE3GFYIYu+6ybgT611cCCK9Eg=;
        b=VDai+/5rt0wIo5BIu/MbMRZEl5LWnakrf3NHpqcjFacRx16X82CZdU7ZOb6ELtpt/i
         /CtjqhJGuVq8XxQblPVmKhB7HvBnwDw3gmXjYtQ3O6XbMSe8B5jUjXBxXNJ5oYPUyOke
         qnUfW/I1B8VinnSesr+JAbnUzd3ZvKXxN9oFHs/OlPB18Qp7ZcErG9vcABoXgDyB9WMR
         rcrmVBtCVaDS71WJp6cIdTdEjS7Oz+arAPNzRPPe5ZBlcLEqYs/7+VcCUk8Y3qCR11mS
         /Q6nWqxkdeAbEtXo8Eky6OY5I4MmpnPezETS4jH3dHh+Zt3+wrcSZMFn9DLQJR0SKFjW
         FuVQ==
X-Gm-Message-State: AOJu0Yzl6gu/jB/vn+g9fYcwBJq3CXSzPgDfFxAAp1jTrO06DExhf+0G
	LtBhuk6mR9Ta7h8lKC0f/3PHaj89lQOsBrCEbuPQ0y50rVe/Jx6WVwQeTEm4SWcDAZwbQWNlKbk
	UOtU=
X-Gm-Gg: ASbGncvOsjvUdO5iYUPkf8inaXgM0hfBS3ghXOca/9f2k50EiQxNfdhFPcYDEnV5oxw
	aFIXzL1wWZl6qLqIX+fp4qIgn+tDAG3eUzZZHdcFb4WBrweyhs6Jy6X9CtIBX/p6t53BR1r3HSb
	g/Mei3bMrIw0SEAhOs+8tx+Fi1Q0QkZbYCAH6K6Fvu6VTpT2ZRJJWSpgK/lJmNpStmsebbD/qbr
	WEkaymFfOOHkG/8FtSnMl1maghwzlp4hcTi+l32A0s0IsVZ/idhO1AzZ0Ane+tBbzBtJHuW4pzW
	hwnO
X-Google-Smtp-Source: AGHT+IGoR3D5fYSVwju/8Mlllkdle8dsSeSt5buHQkACbtXmaoGHE7X1hHAAalOQJ7e4g7/Cpp+j7w==
X-Received: by 2002:a05:6a21:3406:b0:1e1:a576:aec with SMTP id adf61e73a8af0-1ed7a462f1dmr6939936637.8.1738173904351;
        Wed, 29 Jan 2025 10:05:04 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a69fb24sm11496435b3a.8.2025.01.29.10.05.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 10:05:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 0/8] Patch review
Date: Wed, 29 Jan 2025 10:04:49 -0800
Message-ID: <cover.1738173760.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210394

Please review this set of changes for styhead and have comments back by
end of day Friday, January 31

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/905

The following changes since commit 06439dff5437782f7b6627e0374eaa24ca5aee4a:

  boost: fix do_fetch error (2025-01-23 08:26:01 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/styhead-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/styhead-nut

Adrian Freihofer (5):
  devtool: modify support debug-builds
  devtool: ide-sdk sort cmake preset
  devtool: ide-sdk recommend DEBUG_BUILD
  oe-selftest: devtool ide-sdk use modify debug-build
  devtool: ide-sdk remove the plugin from eSDK installer

Peter Marko (3):
  go: upgrade 1.22.8 -> 1.22.9
  go: upgrade 1.22.9 -> 1.22.10
  go: upgrade 1.22.10 -> 1.22.11

 meta/lib/oeqa/selftest/cases/devtool.py       |  2 +-
 .../go/{go-1.22.8.inc => go-1.22.11.inc}      |  2 +-
 ..._1.22.8.bb => go-binary-native_1.22.11.bb} |  6 +-
 ...1.22.8.bb => go-cross-canadian_1.22.11.bb} |  0
 ...go-cross_1.22.8.bb => go-cross_1.22.11.bb} |  0
 ...sssdk_1.22.8.bb => go-crosssdk_1.22.11.bb} |  0
 ...untime_1.22.8.bb => go-runtime_1.22.11.bb} |  0
 .../go/{go_1.22.8.bb => go_1.22.11.bb}        |  0
 scripts/lib/devtool/ide_sdk.py                | 63 ++++++-------------
 scripts/lib/devtool/standard.py               |  3 +
 10 files changed, 28 insertions(+), 48 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.8.inc => go-1.22.11.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.8.bb => go-binary-native_1.22.11.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.8.bb => go-cross-canadian_1.22.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.8.bb => go-cross_1.22.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.8.bb => go-crosssdk_1.22.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.8.bb => go-runtime_1.22.11.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.8.bb => go_1.22.11.bb} (100%)

-- 
2.43.0


