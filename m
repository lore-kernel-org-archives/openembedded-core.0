Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42433EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 03:34:46 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.77.1689651282713082572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 20:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ArD164A6;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-403aa5d07caso33227711cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 20:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689651282; x=1692243282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjt7AhU1ierdI5MlpffqNP2McjmeBC9pG8VrEcDkHOc=;
        b=ArD164A68aIqdfgInL4UvKJS5BYZuKOlHmpYyVNAUvWI81XsUmGQH17PNjOPU5GrEF
         /nhzJjbLdJFkwrSiSo51Aexv7NmXuT3wbIZZqTzR0BQTzt7ip62dxjnX3hr2n/rnDVG8
         fqhK+2tUDF8TKOoXz+2sDjFPUt9vqYaRMMuGZSui8z4QMFvXq825sR+ofgmskOZ+hhvL
         RpiBOfBD4N5wg5H6KEjEgP+syR3BZVYX357fGlTwe+4YmEvyLJ+XqaCqPJK68uB4zLBa
         7Qso2TNp7DQ5h7Fk8JP+DDeHWFqB0+5VrO7iwx78qsdZNJ1PTM6uJWdpGvC23w1db7qC
         eoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689651282; x=1692243282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjt7AhU1ierdI5MlpffqNP2McjmeBC9pG8VrEcDkHOc=;
        b=M95HtC4g+QrIqx5Bo9vJfmcwW3qy0IsZA+3S/tZCC4W8sjqgRUJ5CnqqKBHvSLaKwc
         B4fYpG01pY0pNcX0U2tP3o1Q27KNFpS/hPuSedENcQerd3pT6fB6WlNiIiEsWL9vu1IF
         yRQ5G1u51j2YNTyiIF47KkSVrxumtDmExIoEaJEYOSb8YizMGDLb52SQ9PVFihzNpJfb
         fo+c6dAigybrExfBEgeLk9bwHi1Hhen8S/vN/gJ6fwkFrMDmHH1mvvIWO7hQ4x5hfomS
         vEficmhw4+zVqvuDn3wT5Kvqo+vmau6lISs6KHYApuiiaSVPY9zS75gMD87oa7OXEoSV
         iFOg==
X-Gm-Message-State: ABy/qLZYV3lt85XmK0RNN3Ll9OejqGoXDpldAcfzt2PeSuf1LowlC3XC
	Z0zaFD4o5gOzEZ61kbi67JKoY8iphCjbsg==
X-Google-Smtp-Source: APBJJlE8Wl/8Ect0JrKDYc6bysD2rCR/8u2OU/G4OGblJpNVLIkH01B/MCuDSTrsyXeeUL5qdj/ZAA==
X-Received: by 2002:ac8:59c1:0:b0:403:df34:9575 with SMTP id f1-20020ac859c1000000b00403df349575mr10789567qtf.34.1689651281728;
        Mon, 17 Jul 2023 20:34:41 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id k5-20020ac80745000000b00403715e4cb7sm356633qth.79.2023.07.17.20.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 20:34:41 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/6.4: fix menuconfig
Date: Mon, 17 Jul 2023 23:34:36 -0400
Message-Id: <d28fcd1f70879529a8d4598f744af290694e61bf.1689651113.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689651113.git.bruce.ashfield@gmail.com>
References: <cover.1689651113.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 03:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184493

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.4:

    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: mconf: fix output of cflags and libraries
    Date: Mon, 17 Jul 2023 17:17:55 -0400

    commit 3122c84409d578a5df8bcb1 [kconfig: refactor Makefile to reduce
    process forks] changes the way that flags are detected. They are
    no longer just echo'd and captured, they are written to a file and
    later read.

    We adjust our CROSS ncurses patch accordingly.

    We'll eventually be able to drop this patch, but not quite yet.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.4.bb               |  4 ++--
 .../linux/linux-yocto-tiny_6.4.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index 26b4eb5658..9273a08c61 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7682858d44d18f0aef63a29ae7a575fd06b839f1"
-SRCREV_meta ?= "ba6cc4ef36e055aaa7710111d55ea30fa0549fc6"
+SRCREV_machine ?= "917d160a84f61aada28d09f5afc04d6451fa52a0"
+SRCREV_meta ?= "dab56f52aa33b5cea1513b36b98e50a6c7c31f47"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index 3bb562789c..39abfcbb08 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "17eff7ed940e09879e95c77bb66d5c3ffaed682e"
-SRCREV_meta ?= "ba6cc4ef36e055aaa7710111d55ea30fa0549fc6"
+SRCREV_machine ?= "dee78ad1963cff9c063fba486d43fc9670285883"
+SRCREV_meta ?= "dab56f52aa33b5cea1513b36b98e50a6c7c31f47"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index 723bf4b0c6..443a89cc1e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -17,18 +17,18 @@ KBRANCH:qemux86-64 ?= "v6.4/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.4/standard/base"
 KBRANCH:qemumips64 ?= "v6.4/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "16c806279fc162e769b1359be53941c210074bb6"
-SRCREV_machine:qemuarm64 ?= "17eff7ed940e09879e95c77bb66d5c3ffaed682e"
-SRCREV_machine:qemuloongarch64 ?= "17eff7ed940e09879e95c77bb66d5c3ffaed682e"
-SRCREV_machine:qemumips ?= "1e22bf901a1b9e56293f93a8f06638608a64944b"
-SRCREV_machine:qemuppc ?= "17eff7ed940e09879e95c77bb66d5c3ffaed682e"
-SRCREV_machine:qemuriscv64 ?= "17eff7ed940e09879e95c77bb66d5c3ffaed682e"
-SRCREV_machine:qemuriscv32 ?= "17eff7ed940e09879e95c77bb66d5c3ffaed682e"
-SRCREV_machine:qemux86 ?= "17eff7ed940e09879e95c77bb66d5c3ffaed682e"
-SRCREV_machine:qemux86-64 ?= "17eff7ed940e09879e95c77bb66d5c3ffaed682e"
-SRCREV_machine:qemumips64 ?= "0dfb1ac4cd963c856a8dc956cf79f561cf56e83f"
-SRCREV_machine ?= "17eff7ed940e09879e95c77bb66d5c3ffaed682e"
-SRCREV_meta ?= "ba6cc4ef36e055aaa7710111d55ea30fa0549fc6"
+SRCREV_machine:qemuarm ?= "aa7642358697dc9be32c4563a3d950f257a3f2ed"
+SRCREV_machine:qemuarm64 ?= "dee78ad1963cff9c063fba486d43fc9670285883"
+SRCREV_machine:qemuloongarch64 ?= "dee78ad1963cff9c063fba486d43fc9670285883"
+SRCREV_machine:qemumips ?= "8a3ac37b45e7dcc98d28ab3920309340202272d9"
+SRCREV_machine:qemuppc ?= "dee78ad1963cff9c063fba486d43fc9670285883"
+SRCREV_machine:qemuriscv64 ?= "dee78ad1963cff9c063fba486d43fc9670285883"
+SRCREV_machine:qemuriscv32 ?= "dee78ad1963cff9c063fba486d43fc9670285883"
+SRCREV_machine:qemux86 ?= "dee78ad1963cff9c063fba486d43fc9670285883"
+SRCREV_machine:qemux86-64 ?= "dee78ad1963cff9c063fba486d43fc9670285883"
+SRCREV_machine:qemumips64 ?= "144ff37fee7f0499574d5b508e4db82234f38fec"
+SRCREV_machine ?= "dee78ad1963cff9c063fba486d43fc9670285883"
+SRCREV_meta ?= "dab56f52aa33b5cea1513b36b98e50a6c7c31f47"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


