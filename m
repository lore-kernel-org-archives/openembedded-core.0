Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C208C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 00:32:08 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.21796.1658104288602879558
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NA956k1b;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id p9so10304347pjd.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IXd3zbsdVGHSC7ajSCU91vsmf6dRO8hJ7KIkxCM4VA0=;
        b=NA956k1bs6NFNe/5UD368lNWTpxVws59hjv0AYy8aRELZSOS86igQG8n6MiUyIzOdO
         WaZTDvBGv5nxzFUqI2/6ieFoHrjDT7KqyH9Pv7lKarBC0ljpsD48zQ6SdOQHtHc0GEP9
         bY25pcvit+kp0u1b9qFrBmewyU4+k2HDpFQN4jbVXQEMlJUk1zEJ9G2xAg6hOHxdH+59
         DyZ+whF/+NOoKv9BQN5g6cS+suSuy6UfQpe6hSdmJ6495JHwAu14ca1UAheg74KgbkrB
         3ZsWMVVBw4Wjj/MxG5VRjj6mg1RR1LNaZYUxQ3agq4mixjeK6WMXqgvalWsapd2Lz1VU
         efqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IXd3zbsdVGHSC7ajSCU91vsmf6dRO8hJ7KIkxCM4VA0=;
        b=pBbH5Y4hiAe4LkW42jamIsGJkjmAfPkF5vLMyyobWgx6tv0x2k+6x5RPeWEQTdOQ7z
         gtFkG9MulXUk9YIELLWm96UsyFSaORy4YTYzA9AkQ0tX2GVza/DV7al+uehrjec4dHTh
         9Acg9q+mo7msX3ftBDhPErKmNHZMY/oA8CbOBK++vEhRrFs6txd5GZ8/j8ytEcCJIFcn
         nhFkgyLKOhDDqEcdYP16wT2P9MP7uuRDJNe8xLA5VPQsw8QGzY9lv3I1fDqCXDuoQZ/A
         iPveFJA6trDy2ZesYmVQ5Pfpz+IrwVjwcrAVGQvnWPsbnFhgRc9XD9UDAx43Gdz+iPRf
         lYTg==
X-Gm-Message-State: AJIora8pEkSL5FuvnyQd2g8E1M6ijXjDJQ5HMqCFi7Vdkueb+huu9zZt
	sFq2ERdZCeV9QjrMjtXTD2VIcSLKzUNyeeih
X-Google-Smtp-Source: 
 AGRyM1v5mQToaDQC+r4+tqBAPVb6jxmxH+cN/PjQ0VV00cnrGnfQqpnWTvLMruOM+RCD+RIhgMjgyg==
X-Received: by 2002:a17:902:b083:b0:16b:f145:f345 with SMTP id
 p3-20020a170902b08300b0016bf145f345mr26311719plr.105.1658104319271;
        Sun, 17 Jul 2022 17:31:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s30-20020a17090a2f2100b001ef831a2015sm9958183pjd.22.2022.07.17.17.31.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 17:31:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/23] linux-yocto/5.15: fix buildpaths issue
 with pnmtologo
Date: Sun, 17 Jul 2022 14:30:19 -1000
Message-Id: 
 <f64ad686324f1014d258f3381774608def04cba0.1658093505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658093505.git.steve@sakoman.com>
References: <cover.1658093505.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 00:32:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168183

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    a40d2daf2795 pnmtologo: use relocatable file name

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3c2bd1b975b05df30af21475b33aaf3d6fb192e6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


