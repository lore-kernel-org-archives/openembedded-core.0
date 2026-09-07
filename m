Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93811C79FAA
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:16 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35230.1788788169918749717
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SQY9z3Gt;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-484362f5c4aso4504773f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788168; x=1789392968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fhxCQ0JhLa+ziiL5np+9BJZT9LEeedqIjYH+gyte3NM=;
        b=SQY9z3GtJChJIKIUNRnLs0B932r5j9qZnnXQaTOIVUzxFdTfISCMpD5lVrsZCUxr/M
         /oAyqXgRXEr+Ci36JvtwC23I9cVOuaXAsCkNx6zs7gZdjBGwlU5GLUcbLc2B+6VcDzc6
         VyV26EXQuqNv5RytmmLsbr/iRjW4eEtgddIFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788168; x=1789392968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fhxCQ0JhLa+ziiL5np+9BJZT9LEeedqIjYH+gyte3NM=;
        b=UWlz3h4Pgf0al95i71JI7ZQSa+pJqVz/S1N3TrUJGtAwGQNoS00KBVrFdxZ5Vg24Bl
         jvNO06DsLL+DzmT0NrTma5xhnFHwzoW1fxEire7V8hRnWAdofAd4hgxK5pcXtBbUWsFD
         oNZhG1DRoeyTKeqCzXTWXX0QezM5Jozm3+3nzSTb605D8GgCrwJcaChbkAfEwaqva8Wr
         YQNOzts4ziFbTKWE57lnHBcDXdDLP7CoDMLALdyNNavhFJ3IXx7xXAnuKJE0Xt9No57v
         M+zmZJ543bGC7RQ34OD8XmiN7iYgS3oOSxrWcSH8tNNPhTaBlgdeNMF7PLY02N/LMNgb
         ZOSQ==
X-Gm-Message-State: AFuF++k/o+i6ucAqgwURw9oCp8Akb82LHxpeS7xoAJ/3v0SLsh9aEQnY
	djn32ZX74rPiJnvKTyRu1RwhYDIoCzAWtARXxO+wCJz4NqElX5+ghQ4s4ra4PIyuGRjhecuuDEX
	BZft3eVA=
X-Gm-Gg: AYBFou0d24QvnSn3oZLSNO65z2qrscnM4ZnHN32QZ0tMHKLa61tOsidNMpp7aya4lm3
	1c3WNaRMO1M2BikkHWESImXKYxRuIE8VIK7tUCdRilZ2KXitrbYEc6XnzM50a+70vCrvwm9Sha8
	SsGIV2oEj3iFjkq0Sedp98vxPNayN60iLoem2LAt58xMEmsdFcqxwbriGefx6ikLy7Yh3WsgzsM
	1yzy9js3CB/ljhRKRdiO/F6g38znAbwUwIocDI5p/Bg0sbrC+PZxqLvqqw7+JgoH1FF7Qrfahmj
	Jr4YzJOSiED+p10ugMsy1SY8qbuiBRVd9rciHL28q0jrulLtmW7HaL8y0AGvm1wzMdsnw7kjqf/
	2YKn3IEtoVxd3s1Ustl9ySbMO/LSfDiPVvDuWKT5novaCX/5Hxg4KetwlDGV/wo0a+rxSorhW3Z
	jvl39y4biIT3ORaaIF60JTO7QDgw2+sJEBE4sGXSC2xyav6eJ/22LMs5ViKtw9krFGD8UI/1sGh
	Xd61ZeH+pYZ6cIqvsrTB/1F3OmVVw8xN1gqZBIsuy7D2WKqsVlUBN9FdPnZwRrM
X-Received: by 2002:a05:6000:41cb:b0:482:f61c:7cdd with SMTP id ffacd0b85a97d-48586e4a6bbmr48561335f8f.4.1788788168119;
        Mon, 07 Sep 2026 06:36:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.36.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:36:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 31/35] linux-yocto/6.6: fix tiny build
Date: Mon,  7 Sep 2026 15:35:27 +0200
Message-ID: <fb5ca655981bdae70aefda823a5bdb9fd01b137a.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245288

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.6:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: pinctrl: core: include gpio/driver.h for struct gpio_chip
    Date: Tue, 18 Aug 2026 14:34:22 -0400

    Stable commit f53dd26462b8e ("pinctrl: remove pinctrl_gpio_direction_output()")
    [ upstream 45d2055b0067 ] changed pinctrl_gpio_direction_input/output() to take
    a struct gpio_chip * and dereference gc->base. Those functions are compiled
    unconditionally, but in 6.6 core.c the struct gpio_chip definition is only
    pulled in via "../gpio/gpiolib.h" under #ifdef CONFIG_GPIOLIB. Configurations
    with CONFIG_PINCTRL=y and CONFIG_GPIOLIB=n (e.g. linux-yocto-tiny on x86, built
    with --allnoconfig) therefore fail to build:

      drivers/pinctrl/core.c: error: invalid use of undefined type 'struct gpio_chip'

    Include <linux/gpio/driver.h> directly so struct gpio_chip is always a complete
    type, matching how mainline core.c has included it since commit ec963d04ca865
    ("pinctrl: provide new GPIO-to-pinctrl glue helpers"), present in 6.12/6.18 but
    not 6.6.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.6.bb               |  4 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 39fa0a56c2e..1d4f95e42c8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c0f2d7109571c01223cbd3738db96b5ea20ddc68"
-SRCREV_meta ?= "b768be4d32d53a825349353e988ca5930e83f99c"
+SRCREV_machine ?= "eaa4bfd4f99ab0f3cf46ec5a207b73e22fb1c3f9"
+SRCREV_meta ?= "dd201eb6ec53179f45836d41610ca68c725d28e2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 7675e325422..f2d6e5eef53 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "20c2ecb592178ed51039ae1a75a523c66c1eee5d"
-SRCREV_meta ?= "b768be4d32d53a825349353e988ca5930e83f99c"
+SRCREV_machine ?= "c51e01ecff210644b5d199a4edb30cb1a94a746f"
+SRCREV_meta ?= "dd201eb6ec53179f45836d41610ca68c725d28e2"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 7a273f9cc6f..c1ac8e0a08f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "06b8a8a900edeb9770128b2e25e7814ff0638c72"
-SRCREV_machine:qemuarm64 ?= "bcdc0007d72899e94de35713c4c18e0ad581f41b"
-SRCREV_machine:qemuloongarch64 ?= "491a3d5683a61ca2a7911f748661cfad50b8d05c"
-SRCREV_machine:qemumips ?= "9023f83c1acc4010d43c5891c641a671a12d264e"
-SRCREV_machine:qemuppc ?= "a76593fcb6c3b2183877d531562237a9def7acc5"
-SRCREV_machine:qemuriscv64 ?= "491a3d5683a61ca2a7911f748661cfad50b8d05c"
-SRCREV_machine:qemuriscv32 ?= "491a3d5683a61ca2a7911f748661cfad50b8d05c"
-SRCREV_machine:qemux86 ?= "491a3d5683a61ca2a7911f748661cfad50b8d05c"
-SRCREV_machine:qemux86-64 ?= "491a3d5683a61ca2a7911f748661cfad50b8d05c"
-SRCREV_machine:qemumips64 ?= "50376ca9492c97cc4d6d291d06e52db021aeb1f1"
-SRCREV_machine ?= "491a3d5683a61ca2a7911f748661cfad50b8d05c"
-SRCREV_meta ?= "b768be4d32d53a825349353e988ca5930e83f99c"
+SRCREV_machine:qemuarm ?= "ed7cf749dcade8ded9fda05be53c235a446dcbff"
+SRCREV_machine:qemuarm64 ?= "b96d2d770cab02b84c46606fa538ce027bee6b08"
+SRCREV_machine:qemuloongarch64 ?= "5ae544e1312ed5b4ed130d22ff1f44333494c4c3"
+SRCREV_machine:qemumips ?= "fcfa6f13ad7894cedda5f59124e7a6f6f0100a67"
+SRCREV_machine:qemuppc ?= "89811e5148d2a4c925940684ad9126bd08de9799"
+SRCREV_machine:qemuriscv64 ?= "5ae544e1312ed5b4ed130d22ff1f44333494c4c3"
+SRCREV_machine:qemuriscv32 ?= "5ae544e1312ed5b4ed130d22ff1f44333494c4c3"
+SRCREV_machine:qemux86 ?= "5ae544e1312ed5b4ed130d22ff1f44333494c4c3"
+SRCREV_machine:qemux86-64 ?= "5ae544e1312ed5b4ed130d22ff1f44333494c4c3"
+SRCREV_machine:qemumips64 ?= "b6dc41bac21f990565fffb211d470fdc97533291"
+SRCREV_machine ?= "5ae544e1312ed5b4ed130d22ff1f44333494c4c3"
+SRCREV_meta ?= "dd201eb6ec53179f45836d41610ca68c725d28e2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same

