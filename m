Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F83BC4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 22:43:24 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.4587.1670539401547272448
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 14:43:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=dWopbV4P;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so6170181pjj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 14:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYpu9m/Y7zssU+vmNrOZYju82zhxqPAY0ai2LyYZvG8=;
        b=dWopbV4PBo2g0kBvb2NgmYJNQjkNDUAdxIDWMVj5x68kL1a8KdSHrEao5+JKSIXS3q
         nqRPuvrasbji/y2+bEsmJDCU87/jFWoqX3khqM/oeUah0sBzmY4qbQVD2g48DJF5A8dS
         Mfs4rLAAgQeAcd72cIdE+fgo8pXnDCuxWKqZP8ykrPfOraI97CcRqHWi2IL3tCXlqDN4
         QLxLPlcIXz9Pcvzs5S7qqX0l2feTMzV4yZToGFzz8zvKKtBfDpGMWs+WCA5pl/5vOMQ+
         bgxKQzA8UDzzDxjxgCTrAghtxLp0H/FZp203tP5xwzSpyAo++HSTVug0lE8w9CFLbAmK
         dbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYpu9m/Y7zssU+vmNrOZYju82zhxqPAY0ai2LyYZvG8=;
        b=RT8v05nmKwzxUrMN0iRygGIjmngQwekdvTSs4SYz0paOexon+OofrSUXrLy/kRzGng
         9qOGVLVwqKXW8fndFLfxFaJ5qfHvk/vych4xghi2NMI974pwICGjDxRnbe/eMtZpwiEF
         ncOgRp+TpF6x3xK5m7hON3FkFqX9mKzjMJNV9MIsJ16CRuVw80IYlmziV8BBipl2U6DI
         O4mkZjZ3i/aX+Xg8MmOBqokquq0qUufqpt2ataK6CEXAW1xaMFvfqVVD0gvXykDx8tg2
         8nq4DSZS4CMz50yYOb2SHKO+82A2tra03j1QnEWuLMkMx62ikE8JAOPL+dCqqp4Vqf1+
         mIQg==
X-Gm-Message-State: ANoB5pnC6tWptjoMhHUpaXDZuXblyb6DIlaEJq+1VIT53u9AD/20amHQ
	O6SUvDSWEcP+/ahdkHLLaohIsz9TJvTrctFLqiLHXg==
X-Google-Smtp-Source: AA0mqf5F1wZ37QhWybxnVS3pH3iRiisrwPVIFmKLysGX6jHVBHq17xAU0BDtFv5nVu+tfNuU5zU+Qg==
X-Received: by 2002:a17:902:d50c:b0:186:8d4c:1399 with SMTP id b12-20020a170902d50c00b001868d4c1399mr4728805plg.31.1670539400528;
        Thu, 08 Dec 2022 14:43:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p1-20020a1709027ec100b00172973d3cd9sm1675980plb.55.2022.12.08.14.43.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 14:43:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/12] classes: make TOOLCHAIN more permissive for kernel
Date: Thu,  8 Dec 2022 12:42:51 -1000
Message-Id: <fa87f5c5a30e065ee367ca69aedfd5274a484f1d.1670539237.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1670539235.git.steve@sakoman.com>
References: <cover.1670539235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 22:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174423

From: Alexey Smirnov <pyih.soft@gmail.com>

Currently TOOLCHAIN is strictly set to gcc in kernel-arch.bbclass.
And this prevents any TOOLCHAIN changes for any kernel recipe.
This change makes TOOLCHAIN configurable as usual.

Signed-off-by: Alexey Smirnov <pyih.soft@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit be1634fc35dcc81f0301d942064a6eed584e0704)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-arch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 348a3adf22..4cd08b96fb 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -64,5 +64,5 @@ HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}"
 KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
-TOOLCHAIN = "gcc"
+TOOLCHAIN ?= "gcc"
 
-- 
2.25.1


