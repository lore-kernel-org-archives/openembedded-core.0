Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D245C25B06
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 22:58:45 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.696.1659653899835778726
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ayx1cWTB;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id e23so966161qts.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=r0ILM5ylyS/sKMzuX0jQ6kKL27KOoNz+NGoZc5piweU=;
        b=ayx1cWTB6hfIOKHYGMzZGeZuGE05M8a8SHFKp+OkJPhaEbMorRR9MEmnO3J+2q83Tp
         UtdDLl3bUsYBf6BN6B4yvlj6rs8AiA2W2HanhejN1Y2ualPWLYljPoWUQYiTcLB7iRD4
         rQTQeIVdBjdEOhJIzRXFclZZaiIdkScnvkQ00EXDBZFcI2HZT0mLkTSDhbT6D1AGK0+E
         1uKgMH52Xx4bFxmh6TU8qrYXP3P/Q8SIHVvkIcHCLz1uAykPvDQVx64U6D4HjXbObtTa
         NsyF0DILt8r3VGExr0RALx/t7eFjDZ7jYQ+aoHkRptD3XkibO3w6VIFfTAcO7iIJcRp8
         ZYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=r0ILM5ylyS/sKMzuX0jQ6kKL27KOoNz+NGoZc5piweU=;
        b=MAnLZ7zE/XqJJQIwZva3twwxSwiR79YhO3P+zAn0UzsHeVGa6StPiBbbug3W/YOH0w
         Q37r/PE9Fk57nXFiReTmDfMqorPs3MgXtNGqq3Kz3vy9T5Utqa79c3gCgi4yo76OfVSn
         kp9sMqYzDh9gWLx7K/S/w+iWF4naHd/odUwpZs1MRDUnlA5ZUUkRhifnX9G0z7Eaqsmq
         759/exDf/C/mmjKRgLB32eabtosKgwHFwiGdbekV8loOaNGSX/XSXEOBOw1gXUwgERH9
         jSHZbwMt9RH+XJyLFXT1swCU5UzynVwf78WFVCbhlLZBBx+AuurC1PTBD7qKXMZhTE99
         MNfw==
X-Gm-Message-State: ACgBeo2L2i/fcB0RyfUAmWpP38PiZa4Ul9eVyY1ANSITqcHlVx5azPqz
	k0ib+XKDWJFviqrbKHni4T3Z1ANC84S8Kw==
X-Google-Smtp-Source: 
 AA6agR4furiRRrXQnPfST739ldbrsHafvHmbsBCBfFb77cqRxoEi/f18XzcGJhxaRpkh6I8oYkGwbw==
X-Received: by 2002:a05:622a:94:b0:31f:2ae8:332d with SMTP id
 o20-20020a05622a009400b0031f2ae8332dmr3695536qtw.390.1659653898803;
        Thu, 04 Aug 2022 15:58:18 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 bl38-20020a05620a1aa600b006b8df80471csm1500818qkb.119.2022.08.04.15.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 15:58:18 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/13] yocto-bsp: drop v5.10 bbappend and create 5.19
 placeholder
Date: Thu,  4 Aug 2022 18:57:50 -0400
Message-Id: 
 <9bafcf46ce9a14fbc5db0f659e61ae83f0468fcd.1659653543.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1659653543.git.bruce.ashfield@gmail.com>
References: <cover.1659653543.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 22:58:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168877

From: Bruce Ashfield <bruce.ashfield@gmail.com>

5.10 has been replaced in oe-core by the 5.19 kernel. We drop
our bbappend accordingly.

Although 5.19 has not been fully validated, we also create a
5.19 bbapend as a placeholder.

5.15 is the default for these reference boards, so there is
no immediate change.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto_5.10.bbappend           | 23 -------------------
 .../linux/linux-yocto_5.19.bbappend           | 23 +++++++++++++++++++
 2 files changed, 23 insertions(+), 23 deletions(-)
 delete mode 100644 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.10.bbappend
 create mode 100644 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.19.bbappend

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.10.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.10.bbappend
deleted file mode 100644
index bec8319c34..0000000000
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.10.bbappend
+++ /dev/null
@@ -1,23 +0,0 @@
-KBRANCH:genericx86  = "v5.10/standard/base"
-KBRANCH:genericx86-64  = "v5.10/standard/base"
-KBRANCH:edgerouter = "v5.10/standard/edgerouter"
-KBRANCH:beaglebone-yocto = "v5.10/standard/beaglebone"
-
-KMACHINE:genericx86 ?= "common-pc"
-KMACHINE:genericx86-64 ?= "common-pc-64"
-KMACHINE:beaglebone-yocto ?= "beaglebone"
-
-SRCREV_machine:genericx86 ?= "2883e69e202dc7948c99a7828e192b2b42c2d90a"
-SRCREV_machine:genericx86-64 ?= "2883e69e202dc7948c99a7828e192b2b42c2d90a"
-SRCREV_machine:edgerouter ?= "7c9332d91089ee63581be6cd3e7197c9d3e9a883"
-SRCREV_machine:beaglebone-yocto ?= "3c44f12b9de336579d00ac0105852f4cbf7e8b7d"
-
-COMPATIBLE_MACHINE:genericx86 = "genericx86"
-COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
-COMPATIBLE_MACHINE:edgerouter = "edgerouter"
-COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
-
-LINUX_VERSION:genericx86 = "5.10.130"
-LINUX_VERSION:genericx86-64 = "5.10.130"
-LINUX_VERSION:edgerouter = "5.10.130"
-LINUX_VERSION:beaglebone-yocto = "5.10.130"
diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.19.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.19.bbappend
new file mode 100644
index 0000000000..ff5070ba4a
--- /dev/null
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.19.bbappend
@@ -0,0 +1,23 @@
+KBRANCH:genericx86  = "v5.19/standard/base"
+KBRANCH:genericx86-64  = "v5.19/standard/base"
+KBRANCH:edgerouter = "v5.19/standard/edgerouter"
+KBRANCH:beaglebone-yocto = "v5.19/standard/beaglebone"
+
+KMACHINE:genericx86 ?= "common-pc"
+KMACHINE:genericx86-64 ?= "common-pc-64"
+KMACHINE:beaglebone-yocto ?= "beaglebone"
+
+SRCREV_machine:genericx86 ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
+SRCREV_machine:genericx86-64 ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
+SRCREV_machine:edgerouter ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
+SRCREV_machine:beaglebone-yocto ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
+
+COMPATIBLE_MACHINE:genericx86 = "genericx86"
+COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
+COMPATIBLE_MACHINE:edgerouter = "edgerouter"
+COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
+
+LINUX_VERSION:genericx86 = "5.19"
+LINUX_VERSION:genericx86-64 = "5.19"
+LINUX_VERSION:edgerouter = "5.19"
+LINUX_VERSION:beaglebone-yocto = "5.19"
-- 
2.19.1


