Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99CCC41513
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:18 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.15279.1720960755891363826
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=A7faUH4d;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-6eab07ae82bso2015440a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960755; x=1721565555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CeAf5ssNogx1pkL93L41Fd0mS8W7tqR4Ta1SkhETv70=;
        b=A7faUH4d7VKj5iLCOLiyKZqLgZGuPBZVmdKoA7HfgEhR0bZ4R3rOgsSOUBIzo/I2Hk
         tLqGPe+cr6ULtjAH21hg/GEp164yHZK95WOMgnl3XimBSTDs+ZYa9aidEbrPHeuHWqnp
         2nw2S9x5yX4LCNLc77p1dA4Jw1bRwNA+xoSXqkXMM/UIcMSGjMCXczL/tSraxKzZUTLx
         YjrXc4mRP87QILatOKP9BF92mZswWk3/l9bJK5eelbw+gZtBb8zn9NKMFqlqUhXfzLtc
         t0VWq3ML9NZpO1KUx64CVJ1qsi05QMSSyukycTDL0lu2bsdOMUIS3N1Oahf+StdwE0te
         FHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960755; x=1721565555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeAf5ssNogx1pkL93L41Fd0mS8W7tqR4Ta1SkhETv70=;
        b=cZP4hoJ7N17DSAWiIs66lcycGOs55UdJy/vWE7DC+Qnb3d++Rxo7xTVzZo5jkOuOBY
         mXans0Dj7cLdeajULZ3Ghq6Smd43nNG/crGC090mBFjsy/Ne41hbXadxxdbQv/wehy0Z
         mWK8y64TLKPZhWj7GalS7qtkxtWuYN6oiZU3MF/nNas343pm8gekIU53zkzRbfgGL/Ig
         u/iAkKlJsppU/KIFx/qcUQvAdX2sXBzoFQUqzVKRazUTfVJ34Gszm0+weirRANbswdDM
         9wtadIbiLHJkDr08ivqqv9LsUXBH8WaeOiAsMqAQTLVyZvTZsuJpKMSeksLFtd4jZ4dB
         0wsQ==
X-Gm-Message-State: AOJu0YxOlSw05lOxqcIvLJ40JQ3bkq0L8caLMEP8c2qO28jAbFxWEhV4
	veavmmtQ42Jp2WRcZS1Auu6O3SL3ASGjwaB/oU9dfKdGoL7Y7KLWykLNOQxPoRkppC2qKewP/X5
	Bojc=
X-Google-Smtp-Source: AGHT+IE/SN6nm9XFzD3ddVVRFfOADYEbzylyAi5sx8layqvtP0jnaad4HFWIDkqhdx6Dstif4eOMGw==
X-Received: by 2002:a05:6a20:8403:b0:1c3:a55f:6ba3 with SMTP id adf61e73a8af0-1c3a55f7bb0mr12174257637.50.1720960755094;
        Sun, 14 Jul 2024 05:39:15 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/27] llvm: upgrade 18.1.5 -> 18.1.6
Date: Sun, 14 Jul 2024 05:38:36 -0700
Message-Id: <941474ed77f6f5397ff4f83a4e4dae1c3b9103d3.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201866

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixes issues where LLVM is either generating the incorrect thunk for a
  function with aligned parameters or didn't correctly pass through the
  return value when StructRet was used.
- -Xclang -target-feature -Xclang +unaligned-scalar-mem can be used to enable
  unaligned scalar memory accesses for CPUs that do not support unaligned
  vector accesses. -mno-strict-align will enable unaligned scalar and vector
  memory accesses.
- Don't replace an aliasee with an alias that has weak linkage. This avoids
  incorrect linkage that can lead to using the wrong symbols during linking time.
- This patch fixes build failures when compiling AVX512 code using
  -march=native on machines without AVX512.
- Fixes crash in AArch64 backend when having true or false as operand for a
  fcmp instruction on IR level.
- Fixes compiler crash when user specifies -mno-evex512 with AVX512 features
  but no AVX512VL.
- Fixes a bug that tries to do VBROADCAST_LOAD for f16 without AVX2.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3cd5c40f5736506b2cfc23b180fa915b01d8220c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/llvm/{llvm_18.1.5.bb => llvm_18.1.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/llvm/{llvm_18.1.5.bb => llvm_18.1.6.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm_18.1.5.bb b/meta/recipes-devtools/llvm/llvm_18.1.6.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_18.1.5.bb
rename to meta/recipes-devtools/llvm/llvm_18.1.6.bb
index b03cf1465e..b2df5b60e3 100644
--- a/meta/recipes-devtools/llvm/llvm_18.1.5.bb
+++ b/meta/recipes-devtools/llvm/llvm_18.1.6.bb
@@ -28,7 +28,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0002-llvm-Fix-CVE-2024-0151.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "3591a52761a7d390ede51af01ea73abfecc4b1d16445f9d019b67a57edd7de56"
+SRC_URI[sha256sum] = "bd4b4cb6374bcd5fc5a3ba60cb80425d29da34f316b8821abc12c0db225cf6b4"
 
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


