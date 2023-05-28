Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBE7C77B7C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 23:05:00 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.38984.1685315090733040160
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 16:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=hOqL2mFp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.216.44, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-256712d65ceso357304a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 16:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685315089; x=1687907089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tgSrLgb1Tt0/5XO1Y+0rgL4dF2gT2vZ58FOHJZMwLrI=;
        b=hOqL2mFp+H+kCJKetg3O21gOmUHNjqyTJsCBcIbomhWtTk5wSUmVMApOWYU+rpY2BP
         MbNFaqq91HK8K9JfUvfgMOMH/OBGnJmray/GMuCDITPS8VVDHgPMqnm+7d4MlY4uqBUV
         Q8MKR31QrWnyR9wZGX7xp+eOTbtJZ+eyrNq3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685315089; x=1687907089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgSrLgb1Tt0/5XO1Y+0rgL4dF2gT2vZ58FOHJZMwLrI=;
        b=WOs3GYP5Nlfn/wRre86fPg6rPbbGhX45EAwyY/gaqt2AfcjvO5uODyKEuTXpwIVuzP
         bUx7q9dKRMxku3Mp+Pk4DAlvU41EBbV9hqZ1qaOLQufcDhcoMpSJTOjlHXy+g0E3bo5v
         M30dGI2Udk3oARe4En13OozeGNfyc/wJrXvHSTfPJrBUGvZ5NSjkn60U26D/tMsvbjll
         wfBk44ZFNDy0HXJf2M+4DIajLl/FKy3MANrPlGxM+SOlL4JnRxr2bU5eatvAqyXidOYw
         cd2zxokjUTglWd0chPQzS+wN+e6chQNqAtWYLE/4oC3w/JL3+D7n7R/4b/pyspW+l1li
         YePw==
X-Gm-Message-State: AC+VfDzCcLCwIR8Ir7li7SlcTJkJLpaVhY660XYyjPHP6kploC6Hwj1n
	ufAAzNr8Ka7IQp2x4w2SDLzsaABoc+vkIThW+ZY=
X-Google-Smtp-Source: ACHHUZ7ES1+nRqqw5HuJN9Cme0HS8v3e/YRfIf6THKgK/lVvJIVSmLhacYbdTWi9lgGuBfugC+8TvQ==
X-Received: by 2002:a17:90b:1c12:b0:255:dc71:737d with SMTP id oc18-20020a17090b1c1200b00255dc71737dmr9150617pjb.43.1685315089601;
        Sun, 28 May 2023 16:04:49 -0700 (PDT)
Received: from localhost.localdomain ([97.115.159.33])
        by smtp.gmail.com with ESMTPSA id g3-20020a17090a578300b00247735d1463sm5851372pji.39.2023.05.28.16.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 16:04:48 -0700 (PDT)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [OE-core][PATCH] uninative: Upgrade to 4.0 to include latest gcc 13.1.1
Date: Sun, 28 May 2023 16:03:48 -0700
Message-Id: <20230528230347.915443-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 23:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181850

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index f3c05b7e20..ad4816a1f3 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.37"
-UNINATIVE_VERSION = "3.10"
+UNINATIVE_VERSION = "4.0"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "b11f7dff0ff5e3c971f22e89a105efb0f8d2006fd71d1ea3e5da771e416b0e01"
-UNINATIVE_CHECKSUM[i686] ?= "ad7daa7fca7693ca07eea5279f830333530171d357759b380954a25254edd8dd"
-UNINATIVE_CHECKSUM[x86_64] ?= "ce8ff7e3247da312fbf84008f415bc1b4d113ac9fe4ec91581e4a20cd8b475d3"
+UNINATIVE_CHECKSUM[aarch64] ?= "7baa8418a302df52e00916193b0a04f318356d9d2670c9a2bce3e966efefd738"
+UNINATIVE_CHECKSUM[i686] ?= "83114d36883d43a521e280742b9849bf85d039b2f83d8e21d480659babe75ee8"
+UNINATIVE_CHECKSUM[x86_64] ?= "fd75b2a1a67a10f6b7d65afb7d0f3e71a63b0038e428f34dfe420bb37716558a"
-- 
2.34.1


