Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696EECCA47B
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 19:15:20 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web09.256.1657826111134285549
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GVElW2rD;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id c20so2211043qtw.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yWzo2tbtEtThRGGd6dZa37RE5Vk1qYfZlWp3iE6Xwyg=;
        b=GVElW2rDqoJsD6xQaSsa0/i3YtNueNGKm/UX0E3ovVxVlZfs4GYTS6RgOjik5w9lUv
         oiqzrrrWv+axH3ZL9vYgRJXdTqow8cuYz6QfQAwbm1PDtLnLuefBSV8ipSpPtv2rgA1M
         bmiop72X3OTjJZ7vEKg1UvgQqMrDp2S+TPK0+7bfk9yxkK5gW4vxyUaUI7KDYSxlumG0
         EOxSANLwsYqRjON5YJaxLdkoodtb9X0OQSv4fZ7QNsayc0dNJmVIshpvWIdaxzq06+bn
         MQX0VjhKmcBbWY1ey++i7J6R00HfUeseGck7ERaLEu1pmJLXJznXCVopi/2LYV7p+R7S
         HBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yWzo2tbtEtThRGGd6dZa37RE5Vk1qYfZlWp3iE6Xwyg=;
        b=Q70L5Sp/mGbpwPNX7ERTVUkOR0p56S80/xJkMAOLG4p4TsNuAP9QRrSh5FTW/i9tgu
         xC7ARnJKlB2j9E8UfydPhmStafED+dPlCl59dOP1P9JvhZ0wWGqx4Lc4YNqNs6Ikacu9
         H/VSgOqKTSAaRGpjmMA9WrcO2LbcX34/bM1zElxjtV+4XMpwnaNXSglk2cZxAGIDy62c
         3Og0L3uWYY1BlZSN1YLNtSzV+MW9eOHGF+ULwEMlUcQpzIqOnPTrrdHqyvX/v8gltEpD
         QVKaLnTK5Gc6Nly2ngQFGo6I4g408KuSryWkxE+MbCfuah7NtQ7XoOwvngHjye0y26rz
         CqMQ==
X-Gm-Message-State: AJIora8LrYMe/uM6j3hJ5OT+fs7C4pvFbUZ/fIl93VGzZ+3E0qjkY+lB
	a3myJGxCk18l5YcAmiZlV1g=
X-Google-Smtp-Source: 
 AGRyM1v4gfl2tYtDtLJ/k+KHr0xS7JQikiZspXtS9xWvAUuWUR94cbNRHGYo4rxd5UWLJCNqGRmUHA==
X-Received: by 2002:ac8:5a81:0:b0:31e:cb79:346 with SMTP id
 c1-20020ac85a81000000b0031ecb790346mr8872836qtc.19.1657826110110;
        Thu, 14 Jul 2022 12:15:10 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a05620a240b00b006b253a6dd1fsm1966022qkn.125.2022.07.14.12.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 12:15:08 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/10] linux-yocto/5.15: fix buildpaths issue with pnmtologo
Date: Thu, 14 Jul 2022 15:14:50 -0400
Message-Id: 
 <b4092dd48e0b86e5832db5ab1befd4965ddcff24.1657825809.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1657825809.git.bruce.ashfield@gmail.com>
References: <cover.1657825809.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 19:15:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168047

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    a40d2daf2795 pnmtologo: use relocatable file name

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 20 +++++++++----------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 0cac752eba..b6e443d4da 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3a0e5a16b0c30008959538258553ca70f33ff2fc"
+SRCREV_machine ?= "0222cbb8d40318cf5377875017e32eebefa59ab8"
 SRCREV_meta ?= "0e3a81a5aefbea03388b1235fbcc3dec278425d0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 3a35c1e44c..aadf014463 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,7 +14,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e7447cb9afee4a22b0d3102922c3430eeb44bcc3"
+SRCREV_machine ?= "9b1d0e5eb8b08323577f5e2b21cbb2065aba0aa1"
 SRCREV_meta ?= "0e3a81a5aefbea03388b1235fbcc3dec278425d0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 0b499b29ff..4c1d163a1e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "e12b73a556e5cbd2c5cb157aba0d84e2c3be1ddf"
-SRCREV_machine:qemuarm64 ?= "b1f3c7dddb39848a5b6bae9f6490927bf090de84"
-SRCREV_machine:qemumips ?= "aa4bd512de00a1054205069ac334d97f82564b1e"
-SRCREV_machine:qemuppc ?= "fcd84bc0d01c29fe94f736812ef58978c57d6836"
-SRCREV_machine:qemuriscv64 ?= "d81d20a55992c55475d7b5570589cd5884059147"
-SRCREV_machine:qemuriscv32 ?= "d81d20a55992c55475d7b5570589cd5884059147"
-SRCREV_machine:qemux86 ?= "d81d20a55992c55475d7b5570589cd5884059147"
-SRCREV_machine:qemux86-64 ?= "d81d20a55992c55475d7b5570589cd5884059147"
-SRCREV_machine:qemumips64 ?= "694134b0fceb27051d3b0cfccc7ba0649319aa7e"
-SRCREV_machine ?= "d81d20a55992c55475d7b5570589cd5884059147"
+SRCREV_machine:qemuarm ?= "c284142affccb534122ad93bdcd4774af161d767"
+SRCREV_machine:qemuarm64 ?= "c4c194a34c568c17389120608b2ee8a7a988150a"
+SRCREV_machine:qemumips ?= "7b446965d9659d312952ef4dedf5b50a493e60c2"
+SRCREV_machine:qemuppc ?= "0c2a4ad856c8f0c1b3ca8a38c17e1194f47e4643"
+SRCREV_machine:qemuriscv64 ?= "a40d2daf2795d89e3ef8af0413b25190558831ec"
+SRCREV_machine:qemuriscv32 ?= "a40d2daf2795d89e3ef8af0413b25190558831ec"
+SRCREV_machine:qemux86 ?= "a40d2daf2795d89e3ef8af0413b25190558831ec"
+SRCREV_machine:qemux86-64 ?= "a40d2daf2795d89e3ef8af0413b25190558831ec"
+SRCREV_machine:qemumips64 ?= "9a8d4e00df67daf224ae62b238c151a3f3f70ae7"
+SRCREV_machine ?= "a40d2daf2795d89e3ef8af0413b25190558831ec"
 SRCREV_meta ?= "0e3a81a5aefbea03388b1235fbcc3dec278425d0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.19.1


