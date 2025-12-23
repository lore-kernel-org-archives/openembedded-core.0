Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C215E6FE45
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:23:16 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.109355.1766524988171557108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:23:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=m7CrMFCc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.193, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a0ac29fca1so47623565ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766524987; x=1767129787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMj53PIJ3XWsNnCqvGtne3dbeqaS5i2pw0yaiah0u+k=;
        b=m7CrMFCcn5IYRKOKDYRWOYaeNth7KIxEIJyXc1Kzti5Po1RIo59vqoQD22G8wueRmS
         S3QcufaRnZ3tiZ/vV/5ybyhThmX8vRY5Ewa7F4Wi3l1DO4wYiEOyabu5sCp9VP2SkIxY
         iA6yUICq1O2VDum61P0TwrGPAsQBLayeMTkSieZ5JtfbajEjYI3sQ6SgcADtG7rJVd5E
         rCDHVqeZtrraBN/tRZ2Vom9D5y3fXAR8cbNbjepdDiEUfh1LA8w2Dp0+BKgq2Bs5DKXu
         8Mnw2TuZuXgGDEJ2rkygQDqDPOcd/2Rexxbf9ZTZE7AG3YkAXCiyAeD78gxVlGt/lUD2
         2qSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766524987; x=1767129787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sMj53PIJ3XWsNnCqvGtne3dbeqaS5i2pw0yaiah0u+k=;
        b=L2flXDmz0HyPpRU2QqOkF9GG2SOKi/sj6Kmpu0rvWSia9HCEM59lBLwVwQ8mZzDeDy
         zX10n5EhESieFh8j0JR4RAf2VFwyCyzqXp1OtaFQ6ykWdswCfMRJsO3aN6ndn9d8WBp3
         dreJUQXW3ZwexwJfwmzevlRYhoXs/vbn4m4/4cwT9lOewM44MLthekYo9fTDc4fMQwh1
         8nS4bfwnHGOLQC5IqFOdlq1hk5k6rdS+0VyIefd3JNyeyxHE1EzqNC6kyUHKUlL62jbf
         K+XKjW+AFSCyQ5oczI1dm+P0QwXo0brwkC8YWZFAPw4yupGlCW8LsGwZzGv9lz4GQbu2
         OUqQ==
X-Gm-Message-State: AOJu0Ywwqx3Lzi9aklJ6yWf/hSVMlIAugIhIJOFys5Gsb875F8UI1Lg+
	SZnR9nv7w6ruI0OvtGVEg7xbZFlB7TOGWbgBB2n5zjPhahKMF5KZaTI5PWgFu2356ywp/0FejKO
	hk4AIE7k=
X-Gm-Gg: AY/fxX76MSgkKqruZS4aHeskxQPS1+XYcF1/UkrMa+Y8zY5Qjl28geIyLc5RH8qn3rU
	VQm2JrZDCgTc9v5ZlfQfuomJMj0hbRwbITurXXNRrFKYx+5hHJgpsraLiUTYDDnAqQioROPxqHz
	eRGB+HQ92WfUJ3Wqut4xzc0Z4D06p2j5ay2xMOG7Hz22gTNYKOKM3bME/LiUhCRcfYH2kXsreqd
	HhiWaMdXawx4pkFwK9liPEwLV9+AEhhNbIVdBJJO02S8wnHLnlDnXlWHNMWvzWHz8ZXo4wplGIw
	9eU9gMPBVYjYO5rylidb2S11aLRaguVdpojPRJO1D3+FP3TTMYkj48Z14Snvo3FHz3D6JWXzF4R
	p6sTRi4SMNbiII/nfZhWQeA2cxr88GVbUr/EmZWtRnfXdoUH/O01eWnAAAegJms0GBP3kbO7a0o
	YOMA==
X-Google-Smtp-Source: AGHT+IFBmHZUbLsUJoeINBm1xx1KVGW76ztpmWjUco2MRJgFRCKlixjuT2sH3tZV51IFlnb0vIE+KA==
X-Received: by 2002:a17:902:ef43:b0:2a0:945d:a195 with SMTP id d9443c01a7336-2a2f283beabmr151678865ad.45.1766524987428;
        Tue, 23 Dec 2025 13:23:07 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbe5sm137258785ad.60.2025.12.23.13.23.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:23:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/18] cml1.bbclass: use consistent make flags for menuconfig
Date: Tue, 23 Dec 2025 13:22:22 -0800
Message-ID: <a7dd1c221e42fd8df1d6f1c76c6a5ab7a3e19542.1766524798.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766524798.git.steve@sakoman.com>
References: <cover.1766524798.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:23:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228490

From: Enrico Jörns <ejo@pengutronix.de>

The class called 'make menuconfig' without any of the make variables and
options set in EXTRA_OEMAKE, resulting in a quite different build
environment than actually intended.

For the kernel.bbclass this was fixed in commit 8c616bc0 ("kernel: Use
consistent make flags for menuconfig") by appending ${EXTRA_OEMAKE} to
KCONFIG_CONFIG_COMMAND.

Instead of fixing this individually for additional recipes, we simply
include ${EXTRA_OEMAKE} in KCONFIG_CONFIG_COMMAND by default.

For most class users, this change is directly visible in the generated
.config file:

* For barebox and u-boot, the CONFIG_GCC_VERSION erroneously reflected
  the host GCC version before where it now correctly reflects the target
  toolchain's GCC.

* For u-boot, also the "Compiler: " line at the beginning of the .config
  now prints the target toolchain instead of the host ones.

* The kernel had this already set.

* busybox did not produce any difference.

Note that these projects might base some compile-time decisions on e.g.
the actual compiler version used. Having the wrong one in the
menuconfig-generated .config affects at least the visibility and
consistency.

Reported-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1b6ddd452837e67b500a84455a234f5edc8250a9)
Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/cml1.bbclass   | 2 +-
 meta/classes-recipe/kernel.bbclass | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.bbclass
index 456305a315..5519fb61b3 100644
--- a/meta/classes-recipe/cml1.bbclass
+++ b/meta/classes-recipe/cml1.bbclass
@@ -31,7 +31,7 @@ CROSS_CURSES_LIB = "-lncurses -ltinfo"
 CROSS_CURSES_INC = '-DCURSES_LOC="<curses.h>"'
 TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
 
-KCONFIG_CONFIG_COMMAND ??= "menuconfig"
+KCONFIG_CONFIG_COMMAND ??= "menuconfig ${EXTRA_OEMAKE}"
 KCONFIG_CONFIG_ENABLE_MENUCONFIG ??= "true"
 KCONFIG_CONFIG_ROOTDIR ??= "${B}"
 python do_menuconfig() {
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index d557e98d65..39e198864e 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -697,9 +697,6 @@ addtask savedefconfig after do_configure
 
 inherit cml1 pkgconfig
 
-# Need LD, HOSTLDFLAGS and more for config operations
-KCONFIG_CONFIG_COMMAND:append = " ${EXTRA_OEMAKE}"
-
 EXPORT_FUNCTIONS do_compile do_transform_kernel do_transform_bundled_initramfs do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
-- 
2.43.0


