Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.33175.1620046477975554378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 05:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I+fdWHG6;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id v20so4820407qkv.5
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 05:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V9QQDWtOrP0VEO2XHW7bTdWPZh2ZOlUQmzAizKZsTzc=;
        b=I+fdWHG6R4XgXd+/GNmz+Ziuc7auFL3liB0mQdUDuZELDuXC7Mz0F3qHSubPQHP7L4
         xwWF2Uv4sJbAhd6x1YameeLrHgPnNL/0aKsd8RVC9ZXl0acMvL0dAOeuQ3Ezji/KcGs4
         321g55duWdWVeRj19Ro4A3oQsObgq9omIZ4VwwfpzsuFidNZ4KyYMC2eAbNIqxu1wsQf
         pgWou8Y+WFqQvh00Cefi3dTsHtl8qwpr2FU6Me18ytlR4sHO786uelI31WM6kAQ2rbQM
         zmst04VINEUbJrd/TGviFgv5hYOW5lRQA/U83kZzkMhUX+aWuISqIU95VzYNlb6kfzp6
         EnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V9QQDWtOrP0VEO2XHW7bTdWPZh2ZOlUQmzAizKZsTzc=;
        b=kvoadvlDY8p5fuTxug3k+gBUOQdUt1joc7O/MK6+hb7jhgSFvX5RpTclyDmfxjHqPA
         HyQL/rBzNgAn+xAjhqm6qgdbi54FUt8JBNCQa/LYEAn/z2AUuvykKlkRAWU50/EPaNiK
         o4PLEUgdEngT7naLmAeGRP0pckQpOmpg/OKuyoXkj8bzrAytmxFcDfCqaadUaY8Gg2ja
         Pekiz1WuJOCxhCqvkEXASPRkFeaHM6c221AWleZDMpuudxwqdFr740VyUApSa+revwuK
         hHJsnoTYEaOn9BU0ZaNsq7fFTTK4Ok8O9p1s4GRLgf62txmdnWUjx+Ys/Ytc5v85bHMx
         92UA==
X-Gm-Message-State: AOAM530vtJg0vuLe0Ye/4cO2R2rsVyyTke+OcKjonESlHfXBlgjWhwMy
	1AIVpXYw2pdZjIQx1TTe92F127bzlS9fiA==
X-Google-Smtp-Source: ABdhPJwhswhwhkIf9LG+lNHbsUARIgzfugrfare9j41mbtwAvimmbqhuTxrrIUfzieF9n2KJdZgfoQ==
X-Received: by 2002:a05:620a:a51:: with SMTP id j17mr18628963qka.36.1620046477137;
        Mon, 03 May 2021 05:54:37 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id 19sm1940867qkn.111.2021.05.03.05.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 05:54:36 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto/5.10: aufs fixes
Date: Mon,  3 May 2021 08:54:27 -0400
Message-Id: <5fe3a3e2565e94f57b52c76772eec4b168f66a65.1620046297.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1620046297.git.bruce.ashfield@gmail.com>
References: <cover.1620046297.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

It was reported that aufs was behaving incorrectly on arm/x86. Although
we don't have an exact fix for the issues, the Wind River guys were able
to come up with a minimal patch set to fix just the core issue, versus
a full aufs uprev.

We didn't have time to get this in before the release, but picking it up
in a dot release is sufficient. (given that it took several months for
the issue to be noticed).

Integrating the following commit(s) to linux-yocto/5.10:

    a8808e541750 aufs: linux-v5.10-rc1, no more f_op->read() and ->write()
    cb1c41dac775 for aufs: linux-v5.10-rc1, no more vfs_(read|write)f_t
    a5805df6583f aufs: linux-v5.10-rc1, no more set_fs()
    64e145dcca8c Revert "aufs: initial port to v5.10"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index dacff74bce..c491eed163 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ac98a75ef2bc550f67454bd738ede581c8846ff3"
-SRCREV_meta ?= "40a967b115fdbac34fc980d0e27ac2373a031189"
+SRCREV_machine ?= "196677064883beeaacb68de437512a0e4ee07050"
+SRCREV_meta ?= "8f16b5cfe0600f2a7ed1ce68633a88a1196b9776"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 21a2e89115..0e3771461b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ee7efde0c94e8b2eba1a5a2709f2d21874ac7525"
-SRCREV_machine ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
-SRCREV_meta ?= "40a967b115fdbac34fc980d0e27ac2373a031189"
+SRCREV_machine_qemuarm ?= "bcb76d132fb1e90f6db0a598b3c46b180a9b71ea"
+SRCREV_machine ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
+SRCREV_meta ?= "8f16b5cfe0600f2a7ed1ce68633a88a1196b9776"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index e6859a2319..2221e99f3c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "4f13e8499f2bfc9d95dcc70b981ea16351ff088b"
-SRCREV_machine_qemuarm64 ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
-SRCREV_machine_qemumips ?= "64f8949180b1a6375abef20eebf735e853701c71"
-SRCREV_machine_qemuppc ?= "8465e471f5b4855d01012a18cd5fa516061c0358"
-SRCREV_machine_qemuriscv64 ?= "d6e20b2257ecfa6e796a45a4175863862a28fa11"
-SRCREV_machine_qemuriscv32 ?= "d6e20b2257ecfa6e796a45a4175863862a28fa11"
-SRCREV_machine_qemux86 ?= "d6e20b2257ecfa6e796a45a4175863862a28fa11"
-SRCREV_machine_qemux86-64 ?= "d6e20b2257ecfa6e796a45a4175863862a28fa11"
-SRCREV_machine_qemumips64 ?= "6bf49ed9b223173d918b7c0140b8d0561bc2674c"
-SRCREV_machine ?= "d6e20b2257ecfa6e796a45a4175863862a28fa11"
-SRCREV_meta ?= "40a967b115fdbac34fc980d0e27ac2373a031189"
+SRCREV_machine_qemuarm ?= "68066f8eb689b650bc95dd5abbba2336e11ca896"
+SRCREV_machine_qemuarm64 ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
+SRCREV_machine_qemumips ?= "e609eb0cc21b9037f0adf73dfb524d4e44d0f51c"
+SRCREV_machine_qemuppc ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
+SRCREV_machine_qemuriscv64 ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
+SRCREV_machine_qemuriscv32 ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
+SRCREV_machine_qemux86 ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
+SRCREV_machine_qemux86-64 ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
+SRCREV_machine_qemumips64 ?= "f89a64b85a068ac96ccd69f5170b2fbe957d4162"
+SRCREV_machine ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
+SRCREV_meta ?= "8f16b5cfe0600f2a7ed1ce68633a88a1196b9776"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

