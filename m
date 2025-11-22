Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02D6CFD301
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:14:43 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3746.1763849680934568740
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:14:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=z8U/oKna;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-343f35d0f99so2605766a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 14:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763849680; x=1764454480; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTpTa/2AILc3xxtKO5TTYvCq4xhh+HEXVGRI0v41INs=;
        b=z8U/oKnamgqyEyenSJfUK68EQXCGu14TS1Gw/Y/EBFKUyd8RBxr9pM8fOKlF5hHiLW
         7rLLBhzPxKzlRQCgMsUL/mCUPd/p8EtX3GPeKVl6wui7FckzSY/gL2uvpPi9bG2upOgN
         4sYN087hor1LFiJx4kAh9n4FrLaDlKUDxFI4/qTBDO0LxBvfnihs7uuQV5z/zH7OY569
         8gZlrM/ScJkTRTF8noSzNhQhxFGkwUZ44c2roj5yIkFVhxxV8qRs97vmioqVQfBA5wpY
         sw7CwGcWhfJxMRO7wZpWX9CPBZyWWVQRlwBVCZSWgal62WnJfuTyfc58hYsWNUVSkfCs
         C3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763849680; x=1764454480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wTpTa/2AILc3xxtKO5TTYvCq4xhh+HEXVGRI0v41INs=;
        b=RDxzCFp5BFeiLNpfRlrIB8Pc6sY5SZEquGSHwqc78OWVlgvH/n8U6jSbEWKElZvFA/
         Sppx/hDS3eLA3HfJmDMBl/9yNTsnNOB1svBzTJlZf8QzZUBDXkDNceit2L+G9bzoC/Hn
         mEzff5HXzrUqeACIWcspWfWRh71M7j3Br8/k+neqwpPhA7LwRlCPUNxBITJRNy+tH6bK
         tE7di/Q/RKgEmmVPN8nztEjlxBGjZUzwhz6I1jTWSFTs7cfwiXKVS82OFRJp7VYtp6pp
         Iis4jmiVKq/nI0AuXpg+fT7ryUwBePujCjwtSvAa4y2zdSoIXwEaSjaby6xy+U6OPWAc
         5zlg==
X-Gm-Message-State: AOJu0YxANWvTRiXbBUpXQY6U/H8BncYnj2HJhVKHmNSBphkCcaXt239u
	m9rN8ZhBJXfC1qUEC8jFAiPMoEablFjUDabXY+I+8zTlAcCgGBNiF/LI9rdI0QAcM4HKs8M+JTQ
	kvWpo
X-Gm-Gg: ASbGncvmLEJtfQNXyFXsn8mVCr1Fc0DbqRkmtx7W8cb5vTYVmpfLokYUVOU9oQac67R
	qG3DoqKz6/EVoiBkAcHjCrLcg07RgT3PsFUFGlGVeEKc0AtIlQBrVTZHKH1SZ09wMWp793kFA/Y
	t9u21K2K2zOkMBVD4lWjf6vSbQpPRPe+ejirVp9TtB95dxVoW7JQE7PcODhbeKuBOzn/lD6IQ+r
	jMI+Pvm4UK+8fBvEs7IHpzgC0w8uE0TsCBV+/xYRUkfN+9ykrUefAw9myL5No6ApYY9htr/fNkT
	k2aans4JGYENP4wjjQi2nKsoj+YrXdFaHLJruL59ZguUWl9GjTfI4mBA2pOqZqfo9hpR900xS+I
	OvxK5QZlAcomdkCm1Q+XSY2vwlgjC6bqvv/strzf5Tjd6ZD2mRR6XrXKvm0BqULSunNQvd+kFvh
	FOZw==
X-Google-Smtp-Source: AGHT+IGdAB8umAEoHoghGYlIf+sslQcDsLB8+ZvLTu+EcFaQ8cpyGJAf9ivcPs2Se9MM9Ho/i9OudA==
X-Received: by 2002:a17:90b:5112:b0:33b:a5d8:f198 with SMTP id 98e67ed59e1d1-34733f3b29emr6743980a91.25.1763849680084;
        Sat, 22 Nov 2025 14:14:40 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:a812:a9e4:3291:bb61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm7158274a91.3.2025.11.22.14.14.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:14:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/21] xserver-xorg: remove redundant patch
Date: Sat, 22 Nov 2025 14:14:10 -0800
Message-ID: <f1b064e684cebc3e0c6ca36eb585e26b8da5583b.1763849517.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763849517.git.steve@sakoman.com>
References: <cover.1763849517.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:14:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226701

From: Ross Burton <ross.burton@arm.com>

The underlying issue with -fno-common was resolved upstream in xserver
21.1.0 onwards[1].

[1] xserver 0148a15da ("compiler.h: don't define inb/outb and friends on mips")

(From OE-Core rev: 74b77ee90efd50a703af76769fac66a0f7c394ca)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-duplicate-definitions-of-IOPortBase.patch | 28 -------------------
 .../xorg-xserver/xserver-xorg_21.1.18.bb      |  4 +--
 2 files changed, 1 insertion(+), 31 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
deleted file mode 100644
index e9cbc9b4da..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From cedc797e1a0850039a25b7e387b342e54fffcc97 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 17 Aug 2020 10:50:51 -0700
-Subject: [PATCH] Avoid duplicate definitions of IOPortBase
-
-This fixed build with gcc10/-fno-common
-
-Fixes
-compiler.h:528: multiple definition of `IOPortBase';
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- hw/xfree86/os-support/linux/lnx_video.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/hw/xfree86/os-support/linux/lnx_video.c b/hw/xfree86/os-support/linux/lnx_video.c
-index fd83022..1d0d96e 100644
---- a/hw/xfree86/os-support/linux/lnx_video.c
-+++ b/hw/xfree86/os-support/linux/lnx_video.c
-@@ -78,6 +78,7 @@ xf86OSInitVidMem(VidMemInfoPtr pVidMem)
- /***************************************************************************/
- /* I/O Permissions section                                                 */
- /***************************************************************************/
-+_X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area */
- 
- #if defined(__powerpc__)
- volatile unsigned char *ioBase = NULL;
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
index 14c45be432..1e341553f9 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
@@ -1,8 +1,6 @@
 require xserver-xorg.inc
 
-SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
-           file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
-           "
+SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
 SRC_URI[sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
 
 # These extensions are now integrated into the server, so declare the migration
-- 
2.43.0


