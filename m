Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EEB9C624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:27:49 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12880.1788355660602243363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 06:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eo6ZFiaH;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93906e8a5feso121056785a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 06:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788355659; x=1788960459; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5qo3mDXTvFABph4022PI65b6n1YxyigNjUaD+fUWgxQ=;
        b=eo6ZFiaHaZkB2Vty8mxKRHn+k1qzlOIk+pK8WjxrCn+Gi1HDa4jBCMXrXWi8/iACu9
         tD8fDTShyZUvsZV4ge4MMW9g9w2U8ux9XMrZsREC3HJIV/YAy11nfogwZlDBAx16kS1o
         5kpvHXb4iVkgeNzgrLnSuind/4YEzoeybFR2ztdOKd89ZkkMJyd956K+KnXdOFVf4IXC
         4GK4rWqUY90iNUHdJFHqjm2+rzTmvu8Ij1DeHU5Gamfhe4Yt9rxBDqCiXbMkcqMbNIQ4
         YTNC6fATalLvoa57i70Iro+Ho7OtazhJonGnDHIVq51b8aCRC9eG2PB6v1xDwSHvDEaE
         wgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355659; x=1788960459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5qo3mDXTvFABph4022PI65b6n1YxyigNjUaD+fUWgxQ=;
        b=TXunXM6DISl7ZlAB/fzQo1p2ylI3jjQqxd16upD4KluRyJar3erm/PhLv9lAUsVqqp
         y+o+PUEjhhe7MgvEyg3GkxBUuBm5GdyRThYqCVdGiCJQ9l0SogKZf5NDBxii+W1YhMfs
         JfK3C3DYtJAkSH5GzkmeZsPEYIokJkAs+ys58OpcviUNP21GHYfpZpobxl3LfjNBaGGb
         zvqBKE1kzjoA7OiIGMAWmP4ELExg3vvZbLsc3Cm+D50N7I8t/BhL+Ht7vVIXFQ7VbYYx
         maEXECLfNUA/y18WtQ2bFxRqcFAi5Ou21bvN8udMJvNJK0+5BMjV27JUosCDXCz0Zys6
         OwVA==
X-Gm-Message-State: AFuF++mly6c8358j9DyI7bvl1i7SaGoQVp8OiYtJNBRxA28kamOlEMol
	Xa2Vk/BJhevyj/sS8AVuredIw2Uo7H95w3W2DN8onzPM6XAuME5Hh6LPTVQvnpoW
X-Gm-Gg: AR+sD13VYonDehqYlwi9hc0a39mbzEfm1qzZSs38vN0WF7B1WU7DD6CNXo6Ttc3C1KC
	e8v9OxKIhoMoJsiGDrg6q5sA93AHjIJqJVWsDYt3lwcrb7+TkHIsDmMCwMjxbq2DN1XmGJ4YTd/
	rykUztOOM/CYFJAlnn7AsQS+g0qpJSdxAkHo/ybj6CynSUSKRJXo3sNylW7GJ0i68lR7FB6MejM
	t6T7IAtNSxlRV0k1TGVGUJpEqGgh7ZfPUWsmlh8EDb9DyszHRPZbNLH+/f92+/QaUjLDAgGfuEp
	IYrpi4SXvHz7NpLZz8Oli/l9Gc7fbHhptBsdmkoWaUBtHQkd+J9K50iSZ1cQQQyoatDovtAYy4W
	gN5PJSt5WUE3bdumqOtGvvcEOPO0EX8t5BxpH64R/OlwQl72hQFOwUne10Qy63BABAWMjqs5uNz
	ggQzBk2T7A2MkYblzdIoql6BFD4Cnrx4/XG/89YXOBR/t0dPVktVifdfK0hMwhu/SprTx4rh31e
	ZBJo0CzsLAYY/DcjZbyoBPrkdKCJ4F1yvxfXVUsW96tbsdTvs/rw2BE1/9JSv1NyivrctL4Bmgm
	NIzbCjbPzMd7+cPbcckpn1Ihov6tavF1ZdawYJHeIYxPOxVVAA3Djsn3fSQeYM9B6Z/c+HrYIa+
	MzqZMSSCwVdmEBkw=
X-Received: by 2002:a05:620a:4054:b0:939:2d8e:dc5e with SMTP id af79cd13be357-93960f702damr556504785a.31.1788355659355;
        Wed, 02 Sep 2026 06:27:39 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f398a18sm203691085a.37.2026.09.02.06.27.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:27:38 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/3] linux-yocto/6.6: fix tiny build
Date: Wed,  2 Sep 2026 09:27:33 -0400
Message-ID: <20260902132733.3685768-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902132733.3685768-1-bruce.ashfield@gmail.com>
References: <20260902132733.3685768-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 13:27:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244959

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
---
 .../linux/linux-yocto-rt_6.6.bb               |  4 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 39fa0a56c2..1d4f95e42c 100644
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
index 7675e32542..f2d6e5eef5 100644
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
index 7a273f9cc6..c1ac8e0a08 100644
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
-- 
2.43.0


