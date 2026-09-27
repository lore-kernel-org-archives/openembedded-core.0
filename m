Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A2FC98338
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:44:07 +0000 (UTC)
Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33593.1790495038630802444
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=waQw+5+h;
 spf=pass (domain: smile.fr, ip: 74.125.225.97, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-482f6351831so1149019f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495037; x=1791099837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HY39bORHzKaiAIfiMh1fv9OVVPpBGCw12z5aytjyCAc=;
        b=waQw+5+hpl41GxHDgQDnBbqL60dZI0PRe4aP0RWyBghzUZ3CMDbDRR3jGvY97fvbzt
         4pYD9sQp7dVuFKKsQQ8m+DFbeGyVb42O1adQQdVsyt70VNFXkg2axnkk3iga+CyrOE7I
         Eoc0XWZb+DPYck+hwKlxuOkIKh9ME5el29ODI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495037; x=1791099837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HY39bORHzKaiAIfiMh1fv9OVVPpBGCw12z5aytjyCAc=;
        b=2Qwf8YCqXrZafJIFMPPphML05XFJ1JX4T8NtzK3nC1vpLbGBp7HcFz/N9sVctO+G6D
         V9lrXrrUM9LdCVFeYBMCNKx6ucQ8gVAE9IvrsG9yixpIVBghXYH6jEw6xP4aLZt1NXII
         GYlxRJ3cLbrCGLV66Ifeb+4wS26/xYiC5mBUKuR8fAzfDkKfRT3zMx/ZIZOFxGdmgfxT
         QxgWa7OgbA9Io8j8plPeAQVAz+QWqokazw9i0JoJ+E3Rk4ZoiTFJMmyormk1C3DzjerF
         bYv4/I81o8HZzxIxQHtzza7yLAHXvbw4AJPVSqsiVcgbs4tybRf5P7V1ZmbA/PH+Sji5
         Dwxg==
X-Gm-Message-State: AFq9FYKdb6jyY68MBWfjrx4yWaMiDb2iCGaYW6VMmg3I2QgO8w5PLt11
	1/ZKgfUmLuiqwQMA/MEBfW2OaEEFF1RbAP5tEWXRyB92UTBf1Rw1ffggZnp+y1KGgDXdu9QU6Eg
	n/RS7Mj0=
X-Gm-Gg: AYBFou1x8+izMiHU54A2O9TgqKaITT0TNTKc95mSFYzhQ54z9jcqSXrUMNjVQs9B+Sj
	e549EnyJ/L5Bd2nKx1nq1htGEJTeTk2IQJOt3m+WkEw4R87FAgb5fkyGE6i4V5tHmMoK+8D5Pkr
	9spul0IzUruaXuXI98UvIXizLJJmB00fXs2Xc3yq1BcVrOhSys1l3B+emL05WfGaRqpiUxqIAv9
	yocr8kBmHbQw1zHFvUrlA1CZwS0ssgdwJZdvzRH4E3afoW8do6RUbQqA6quI+jDX1/xz7/ZZd2X
	DThGQrpA7HaOUNEFX1aSIQN0JtZ3E5VPGigFosrOcUIhhD/ctjzfIUboiplKhiBjsVVgfD3Nucn
	9aqZlAau6ZJmD2eGDOALKKXbjHhnqF5rE7cU9J4M1YdlpH2bPt4xoMaGZnLkH1CFk6MaZuVw+FD
	uwt8j/RzQvac98jsdVCuOBT/Fm5WgzTnP5lv1XLVS+8SUOU5Aks82yTd+SbSGYUo42avTYFet4n
	Hi43y352lsuqoBwDuRuCz7tmCKoaoaM5uhLABiXIG9xrrF7YCDttLETAigZkQ89fBQd0ZQlEw==
X-Received: by 2002:a5d:59c5:0:b0:487:faa:b1e0 with SMTP id ffacd0b85a97d-4887170dd86mr19486220f8f.12.1790495036814;
        Sun, 27 Sep 2026 00:43:56 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 25/28] linux-yocto/6.18: rt: update to v6.18.37-rt6
Date: Sun, 27 Sep 2026 09:43:16 +0200
Message-ID: <904f0f2ead7c8b53fd3dc8807d2597f0cdb00f77.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246675

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.18:

1/4 [
    Author: Sebastian Andrzej Siewior
    Email: bigeasy@linutronix.de
    Subject: v6.18.13-rt4
    Date: Wed, 25 Feb 2026 11:35:17 +0100

    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
]

2/4 [
    Author: Sebastian Andrzej Siewior
    Email: bigeasy@linutronix.de
    Subject: v6.18.35-rt5
    Date: Wed, 17 Jun 2026 09:43:08 +0200

    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
]

3/4 [
    Author: Sebastian Andrzej Siewior
    Email: bigeasy@linutronix.de
    Subject: ARM: Fixup the stable merge.
    Date: Mon, 29 Jun 2026 16:47:21 +0200

    This a merge fixup, properly replaces
    	ARM: mm: fault: Move harden_branch_predictor() before interrupts are enabled
    	ARM: mm: fault: Enable interrupts before invoking __do_user_fault()

    with
    	ARM: ensure interrupts are enabled in __do_user_fault()

    It is needed because "other" patches were applied as part of the stable
    series. This contains the patches that were applied upstream.

    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
]

4/4 [
    Author: Sebastian Andrzej Siewior
    Email: bigeasy@linutronix.de
    Subject: v6.18.37-rt6
    Date: Mon, 29 Jun 2026 16:52:33 +0200

    Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e9a7fd90765d277d126cc58a5c4905e4e200ae39)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.18.bb              |  4 ++--
 .../linux/linux-yocto-tiny_6.18.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 20 +++++++++----------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index a0c2abf1c5f..55f3fe8907c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,8 +15,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "40cf3a2e9ae15c3d4b3a528d4de015263639cac3"
-SRCREV_meta ?= "185549fc38a492dc3e431b32ac6774620ae6b468"
+SRCREV_machine ?= "c82ff0cbda2a00b9073e06c9fe4ba550c9056d45"
+SRCREV_meta ?= "c8484925c85ec1e6510c75d9e1b36e01d6e2e904"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 0d4c98f2840..3b1342d6774 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
-SRCREV_meta ?= "185549fc38a492dc3e431b32ac6774620ae6b468"
+SRCREV_machine ?= "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
+SRCREV_meta ?= "c8484925c85ec1e6510c75d9e1b36e01d6e2e904"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 1a7a8659bf8..80301434799 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -17,18 +17,18 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "1cd95e881ac1b4f07906bd0e9482891e12f84a83"
-SRCREV_machine:qemuarm64 ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
-SRCREV_machine:qemuloongarch64 ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
+SRCREV_machine:qemuarm ?= "0f778c0a178fdc50063c212b5320b1f082f83f1a"
+SRCREV_machine:qemuarm64 ?= "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
+SRCREV_machine:qemuloongarch64 ?= "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
-SRCREV_machine:qemuriscv64 ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
-SRCREV_machine:qemuriscv32 ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
-SRCREV_machine:qemux86 ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
-SRCREV_machine:qemux86-64 ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
+SRCREV_machine:qemuppc ?= "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
+SRCREV_machine:qemuriscv64 ?= "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
+SRCREV_machine:qemuriscv32 ?= "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
+SRCREV_machine:qemux86 ?= "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
+SRCREV_machine:qemux86-64 ?= "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
-SRCREV_meta ?= "185549fc38a492dc3e431b32ac6774620ae6b468"
+SRCREV_machine ?= "ad9d5e451874e64e4e51093f3c9c6ca4426d3b0a"
+SRCREV_meta ?= "c8484925c85ec1e6510c75d9e1b36e01d6e2e904"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same

