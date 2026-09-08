Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D8FC79FAC
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 01:17:41 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9883.1788830256351467958
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 18:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HtKFWRgN;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-90e7fd978beso74120926d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 18:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788830255; x=1789435055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uFCV+nUQ64Zvttrq///ehdTcCcDysCtiRCuA9BlHz/Y=;
        b=HtKFWRgNEvv3aqoahbri+hofp8aGL4WtIxQNmP8msPwQJ9QyjIZwO3bVhudX4BN3i9
         h9PaNm2CnPikGGtfJgqg4Bj8P6NiPfclQwIheQGlku4McFzqmMPrdCxSdvcVZlRmaPc0
         2vRUUBCqH6jDemrNmT1TIsu+sW8qKOiJa/BBrE32Kthn44r38rAc5p4md6MzSHrREyhs
         dWLIXqXFTrw8wi21UBhcWq2jp55chelhN06qiehMIrhGheGKepX0Z1cYBK9TftAY2xO7
         LT7Rq/qeJBGBAn7h84IDKOq5fxSnf+Frc+EEisVA8ZDJmiO406OGFL2W5c7F441KYt7Q
         LeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830255; x=1789435055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uFCV+nUQ64Zvttrq///ehdTcCcDysCtiRCuA9BlHz/Y=;
        b=jfNW1ZXofTvPRD3VJrANiEuHKmXrvujbXqQp1bG9KY+N2tawFsxi0um7tZ9TUH3G/b
         rlwsfVOq9gwzXCsa5pSaWoXyHQYSXvpI0ugGEmSNv4fnhsKqVAzLwAAFWuZujwcf9WMq
         9J/p3gJNYhxdthptX5YwLyNrkYDHb9F835FwQbciT8ur7Z3yxlGVtoM4k7yvINCTBDfj
         b4cHp31dZzePRrZk5SNhl4G2lqjrg+sXz5wWEXIxryoEox5WAMK6wu1VyuUFTO9h3W+0
         1lRY2K2UquMkLSt8Qb0Ntjagh+x6SMnv4c8ipRASjABBSSWDRz5axsnzZcI3CgJGdOgX
         0m2A==
X-Gm-Message-State: AFuF++mHARSv18HNFYzR0ghFUHQeJpfZXZcSCfuNMnFcqAdIrK3j+E29
	mCkXs6Hz41dO28/eTcgykEwkT79OT89wDw0zxPoMlYo5KeUC3wNyJ3IK
X-Gm-Gg: AYBFou1E4jrqOBhKzHTeZfGFNP4E4edwHatPmUk4/qGjKw2Nzps7naoIx4dPcmZhNIH
	bbPsMQqlGo9WIYRguUIBUq3uzQfiwibAiPlGqP6RbQ2jZOwMzY+5HuBJ4AgeuInXj0CKHn59wUI
	zzio8vkvR42koJ4hh9hmUx2QBbyDU0nUVrrGOXFq655K4BzVm1Q32s0JAXz6wCzNYra48xjgZaj
	zw2NroOunAS4i8/Dl+zCPYHkoDrTzwI8Yi6qWqFi5c9bxZUSf/SvoZYxM/pCQqPIcBcUdeaCcvI
	eH5lY4icdXUhYKQnw8atertywRF6mp1wZ62EPJ1ROxbJnaRJWwXdPeSe2LVldlGHu0nOlt4CkTZ
	aj6+DscLQk+ECvNVN7qRJp3lvD/GpO/P920ftqxVCM9jucFwHf76UowkaBoDiRxwvWuRsp7mZKM
	TBhm4NzlcBKJUTKGcp5CvrCylsH/C9CDsvOaAHnK1Y8SLuNzXnjPUbY9c/F1YvBvVzG78tlL5X3
	1LonrYA9FClAAR3U82ll3RPby9lzhL79gHMetZ+YhOr5NLdx0F1XMCO8jG7qf9INX6Q1Or7/9vx
	8pKoSOY6WJoUpqEuxD+CzUDftC51THnhNhooAnIZUpI4AD3MtrptrMiYE593y1XBakqcZBdaguP
	zBxhh
X-Received: by 2002:a05:6214:f6e:b0:910:4b05:fea1 with SMTP id 6a1803df08f44-9104b05ff9cmr211394646d6.22.1788830254973;
        Mon, 07 Sep 2026 18:17:34 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104049d30asm105271876d6.0.2026.09.07.18.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 18:17:34 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 01/05] linux-yocto/7.2: menuconfig,mconf-cfg: Fix broken menuconfig outside of Yocto env
Date: Mon,  7 Sep 2026 21:17:26 -0400
Message-ID: <20260908011731.2895743-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908011731.2895743-1-bruce.ashfield@gmail.com>
References: <20260908011731.2895743-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 01:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245313

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/7.2:

1/1 [
    Author: Roland Kovacs
    Email: roland.kovacs@est.tech
    Subject: menuconfig,mconf-cfg: Fix broken menuconfig outside of Yocto env
    Date: Wed, 2 Sep 2026 09:51:58 -0400

    Due to an upstream change running menuconfig fails with:
    	$ make menuconfig
    	scripts/kconfig/mconf-cfg.sh: 12: CROSS_CURSES_LIB: parameter not set

    Fix the error by checking against CROSS_CURSES_LIB with undefined var defaulting
    explicitly to empty string.

    Fixes: 01505857ec741 ("menuconfig,mconf-cfg: Allow specification of ncurses location")
    Ref: https://lore.kernel.org/linux-kbuild/20240611160938.3511096-1-masahiroy@kernel.org/

    Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_7.2.bb               |  4 ++--
 .../linux/linux-yocto-tiny_7.2.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_7.2.bb  | 20 +++++++++----------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
index 503a0ee260..fc76baf359 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
@@ -15,8 +15,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3d984c8bbdb878fc240fdf9b59892e56802b278d"
-SRCREV_meta ?= "48dd3364f8af7104c75e86ea3c2bd0e55352b59b"
+SRCREV_machine ?= "97c8cde82374f1359a27f1bca7783406a8c58a7f"
+SRCREV_meta ?= "03cb449bc3f6a9ce9599e2b3fb4ad2b3fc0c0b85"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-7.2;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
index 6478274956..76521bf9fc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "eaf351389aa8a14680ad327afecb5abb78347081"
-SRCREV_meta ?= "48dd3364f8af7104c75e86ea3c2bd0e55352b59b"
+SRCREV_machine ?= "6a8c7c1a4e71cb451c93ec975591179856cf885d"
+SRCREV_meta ?= "03cb449bc3f6a9ce9599e2b3fb4ad2b3fc0c0b85"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_7.2.bb b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
index 98f1041a46..1decf0c608 100644
--- a/meta/recipes-kernel/linux/linux-yocto_7.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
@@ -17,18 +17,18 @@ KBRANCH:qemux86-64 ?= "v7.2/standard/base"
 KBRANCH:qemuloongarch64  ?= "v7.2/standard/base"
 KBRANCH:qemumips64 ?= "v7.2/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "6390ad2592faab51e5930cdcd4073805ebeb3096"
-SRCREV_machine:qemuarm64 ?= "eaf351389aa8a14680ad327afecb5abb78347081"
-SRCREV_machine:qemuloongarch64 ?= "eaf351389aa8a14680ad327afecb5abb78347081"
+SRCREV_machine:qemuarm ?= "d4b8eb4a386a99edc670c6a988b30c6470975013"
+SRCREV_machine:qemuarm64 ?= "6a8c7c1a4e71cb451c93ec975591179856cf885d"
+SRCREV_machine:qemuloongarch64 ?= "6a8c7c1a4e71cb451c93ec975591179856cf885d"
 SRCREV_machine:qemumips ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine:qemuppc ?= "eaf351389aa8a14680ad327afecb5abb78347081"
-SRCREV_machine:qemuriscv64 ?= "eaf351389aa8a14680ad327afecb5abb78347081"
-SRCREV_machine:qemuriscv32 ?= "eaf351389aa8a14680ad327afecb5abb78347081"
-SRCREV_machine:qemux86 ?= "eaf351389aa8a14680ad327afecb5abb78347081"
-SRCREV_machine:qemux86-64 ?= "eaf351389aa8a14680ad327afecb5abb78347081"
+SRCREV_machine:qemuppc ?= "6a8c7c1a4e71cb451c93ec975591179856cf885d"
+SRCREV_machine:qemuriscv64 ?= "6a8c7c1a4e71cb451c93ec975591179856cf885d"
+SRCREV_machine:qemuriscv32 ?= "6a8c7c1a4e71cb451c93ec975591179856cf885d"
+SRCREV_machine:qemux86 ?= "6a8c7c1a4e71cb451c93ec975591179856cf885d"
+SRCREV_machine:qemux86-64 ?= "6a8c7c1a4e71cb451c93ec975591179856cf885d"
 SRCREV_machine:qemumips64 ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
-SRCREV_machine ?= "eaf351389aa8a14680ad327afecb5abb78347081"
-SRCREV_meta ?= "48dd3364f8af7104c75e86ea3c2bd0e55352b59b"
+SRCREV_machine ?= "6a8c7c1a4e71cb451c93ec975591179856cf885d"
+SRCREV_meta ?= "03cb449bc3f6a9ce9599e2b3fb4ad2b3fc0c0b85"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


