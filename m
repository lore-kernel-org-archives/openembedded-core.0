Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74732F31E2E
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:28:47 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.134994.1775748525536118722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 08:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FlYEHxB7;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b949bf4easo600679f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 08:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775748524; x=1776353324; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xYx6+4w7jX3M6Aoup4NUI8Mc3h5JJeX9em16Jcc7Fk=;
        b=FlYEHxB7PSizmAbtk0BVDyF/J5OSPsefFOldpk8Jsc+B4f9Y3njNrfKrP8U91FduB4
         byFb6DVa4AqSYhg3y56qnV3LoLouvfw9LGeP2yjAj9KdSP50J5bz4V+0vaEDEkLKzyg7
         lAOUK7mvWaAU3GGljGZYuPODUuykKLl8DnPrYGxvKJ2G3zMHBW9rZlPLxB6fMQHgi69R
         CiVSHd/Wec6+uki8IjNIPQ+FFqr7ousKq8OBH7sAUGoU8H4/GdVgRLXCyCg+8v0Y8VBQ
         rSdNuyVXYNU1X4xD7mcH2aKLL7NzMUggVGHCC+9eIanoZG8ppU4CwuRNYLv6+tT1pHQn
         BP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775748524; x=1776353324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6xYx6+4w7jX3M6Aoup4NUI8Mc3h5JJeX9em16Jcc7Fk=;
        b=ThFjpEGdSLpEXBqOpBuW+bRb6sz1OU27LNmaPdah30VW/zHWAvycbz72SXM/bjT+VN
         S1SOnfX9s7WvlZS2DEZ0uPBB5pV//yOHK3oP5QaXVjeSdXFobAjfrZK4rVEZnz2iUMrd
         draqHTbR+k75AURmLk2Ah249F5xQGFE1xntJFt4t3W8T9uJnrRcQMXSrIw1gLHYOQe6v
         T8lIaccpQoS3sc/mV6YaVc30VyfU7YiHhVKn2fXTW9V8TH23D6GE6rG93qxs131UC06R
         HoO4iBabpohogPlFebrs+oIXFGaMVYr6/qo1UjH5xLPE7KF14hL+PAWpggxmnHgReAEQ
         ynCQ==
X-Gm-Message-State: AOJu0YyuDHDdHRgD1eC2CPdwPEOVudvbldd+bycR1jzAqA+/rp4f7cvp
	czdYSkbKVaUevC0H3jP1z5hMcjYgsQfcAKX3vMzGqZ2TUnBlxfkwJj/bkFnaXQ==
X-Gm-Gg: AeBDiet9ZGLw62+9D9q+861pRjmXFBO15pPGhjVOb/jvHv+MaUkGfHBydnXnTKXvaqq
	XGXF53XifeQBH0bbZzm1WN4SW6BTqLOwaL0WB7a9Gry6dS0kvjkiFJSTj9ngOs/DpPWZdl2QKmh
	Sw5ZMzI9cczDxtBorAlb3ftQJeDGxZBKAZpuYcTMB8+fnbsJg7DTXW8Sxaq79xBQ6uOkxMtMBNG
	bvmyun2ZgL4i4TYznV4SubtdXxRzpYzPxglXVi0gCO1RbCpNZt338ewjoxCsiZIrwW46m3xb7XP
	uToo7HNyVqgPgbmJphIVvSGIOqNjZMtsxFrXVXEbCKc1jisSAW9y5527KM2WANO6EQbZejwiPnZ
	nIPN1ZjaQur8R336bXT35yTFAdMq6RvEg9exumyNKDS2/OLeCLhMWlaxHr7t9X9YPC9GPqLxm/e
	v/afXJwImdhj5lw/Y6yRhleQ1mGz/B4uDXFA29
X-Received: by 2002:a05:6000:22c9:b0:43d:1bf6:91b with SMTP id ffacd0b85a97d-43d595b09d3mr6041976f8f.16.1775748523641;
        Thu, 09 Apr 2026 08:28:43 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d214f2b63sm62481250f8f.28.2026.04.09.08.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:28:43 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [whinlatter][PATCH 3/9] yocto-uninative: Update to 5.1 for glibc 2.43
Date: Thu,  9 Apr 2026 17:28:22 +0200
Message-ID: <20260409152839.2894434-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409152839.2894434-1-martin.jansa@gmail.com>
References: <20260409152839.2894434-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 15:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234919

From: Michael Halstead <mhalstead@linuxfoundation.org>

yocto-uninative: Update to 5.1 for glibc 2.43

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index e9dc6c8640..d97c96f631 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.42"
-UNINATIVE_VERSION = "5.0"
+UNINATIVE_MAXGLIBCVERSION = "2.43"
+UNINATIVE_VERSION = "5.1"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "a25f2174d0cefcb22af005e9bc72ac01ae83b011c5b6d6d5bf00dac979877f76"
-UNINATIVE_CHECKSUM[i686] ?= "959cc2539b692f9b9862825c7324a0fe4d061fca742f6c259f67f581c59af956"
-UNINATIVE_CHECKSUM[x86_64] ?= "96045e8b1e242c8a849426a8506c7043f354b39f2bc0035192780e8205e23e9d"
+UNINATIVE_CHECKSUM[aarch64] ?= "4166237a9dabd222dcb9627a9435dffd756764fabf76ed7ef2e93dc2964567ad"
+UNINATIVE_CHECKSUM[i686] ?= "761502cc9aef4d54d0c6fe9418beb9fdd2c6220da6f2b04128c89f47902ab9ae"
+UNINATIVE_CHECKSUM[x86_64] ?= "2b63a078c26535e0786e87f81ae69509df30f4dce40693004c527bd5e4ab2b85"

