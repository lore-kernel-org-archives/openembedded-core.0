Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D910EE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 15:45:07 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.302.1692632698857995418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 08:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IZ+6LN3P;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6490c2c4702so17850316d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 08:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692632698; x=1693237498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFMmDKIOZWLYisWm9jBAixVOJ9dRvvaGR7tz5AJEJ2U=;
        b=IZ+6LN3Pvy8og8DS5Y+8r4YgzEgjNw+MM4U3JEynWp0y1dN86EL2yHfv5q0I4+ZuFY
         jDFWXLEubdlGkkhnU++9GgymWNa/T9HA9uPFA2+Uo/jvaIy/wm13wRN59qi1q8pdzzNx
         jpC56LXvoGNEQ2Q3RitYhrqwazDNZZs9NHvi33t3h+ddsGtYg83aqByGJf9nz+31KmUG
         1Hg/ngoDH0cs/3mLJ7qB0xoM5NFjpeqs90Ke4rRjpJAIfRJwcUW3xxN6iSP7et8BNMVC
         1R3h5yONwUpXs4JSeupypeKmRLLeSuGnkLVE7bvneGXKSOCAMMV0SOdHYpbpqZnknDzH
         2t6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692632698; x=1693237498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFMmDKIOZWLYisWm9jBAixVOJ9dRvvaGR7tz5AJEJ2U=;
        b=g1t29yjByKzHK4DUy8HKWtZ4VlIeaaKJVrUZtIfx7yw+0a/y6tC0sMVnmeSMiSUZst
         qcXqHwgzGtq+j4aTYM0TH5whye3M+UavWRRczamfl27kAYedUd+3XuALuQZEi7gH8+wt
         5zhSpJDOvUEAmOGlf4C4UOjjnaDJfN5/Kp4G4MUBSLtuJBBiZF0NXZBHHMPzjyaWLwmB
         he3GxYNNbpy0VhEsB9jY3qF1eUaZj3VRyq5BxeAL8R+rcrFITZMWmzn0BY/HlQCaSULi
         ObcPNF0dOCX416pf5xVmugceoTEOaatjHM5DeJKOS8sLvJuYTOQkOQJXkbR4OPhP6yWJ
         CdCA==
X-Gm-Message-State: AOJu0YwRWPzFNr3NcQJCyhmtfrSfyy8Mc/H/H2hzwBtVw2xolIsJSvBw
	mshoTmJDRjhc6KDUg7T8PUHD5fH7k5SaAA==
X-Google-Smtp-Source: AGHT+IHwBpAx8INkIG4pRdyb2mMZW+s9Ik0yVpLX91h4DM/1IDgYApVsg8tswWOYlWz2gkVOPwriGQ==
X-Received: by 2002:a05:6214:4017:b0:649:384f:edc with SMTP id kd23-20020a056214401700b00649384f0edcmr6958670qvb.2.1692632697842;
        Mon, 21 Aug 2023 08:44:57 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id w2-20020a0cb542000000b00647248b3615sm3030090qvd.4.2023.08.21.08.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 08:44:57 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/10] linux-yocto/6.4: fix IRQ-80 warnings
Date: Mon, 21 Aug 2023 11:44:45 -0400
Message-Id: <63c2398ce630db14fd8942620efbf07628c39347.1692632563.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692632563.git.bruce.ashfield@gmail.com>
References: <cover.1692632563.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 15:45:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186460

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.4:

    9753b4497951 tick/rcu: fix false positive "softirq work is pending" messages on RT

Paul Gortmaker has found and fixed the root cause of why we are
getting "softirq work is pending" messages on boot with -rt ..
although the issue is not rt-specific.

The fix has been submitted to lkml, but we are integrating it
to avoid the delay of -stable picking it up and then linux-yocto
doing the same.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.4.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.4.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index 95891cdf60..5f633405ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "efba76521c3c18fc10ab88e3b94293f19be9fdc8"
+SRCREV_machine ?= "7b9505550d7a84a1f30b9af8b90aafc8dde37023"
 SRCREV_meta ?= "d9483a24c9ee33b6e566baa5233cbd9feaeb5212"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index 5de53abcd2..982352b010 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e28e14070ba4eba3b6832a8329d4120ed5de8efa"
+SRCREV_machine ?= "9753b4497951a5bd1a921e784532257d26a8b008"
 SRCREV_meta ?= "d9483a24c9ee33b6e566baa5233cbd9feaeb5212"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index 45d19edb79..ce406db90e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.4/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.4/standard/base"
 KBRANCH:qemumips64 ?= "v6.4/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1918d171c09ab3aeedcf7c9f0a98d7c3c10a8524"
-SRCREV_machine:qemuarm64 ?= "e28e14070ba4eba3b6832a8329d4120ed5de8efa"
-SRCREV_machine:qemuloongarch64 ?= "e28e14070ba4eba3b6832a8329d4120ed5de8efa"
-SRCREV_machine:qemumips ?= "f3ec8aee3f7ce0adc65668dd18347f144c12709c"
-SRCREV_machine:qemuppc ?= "e28e14070ba4eba3b6832a8329d4120ed5de8efa"
-SRCREV_machine:qemuriscv64 ?= "e28e14070ba4eba3b6832a8329d4120ed5de8efa"
-SRCREV_machine:qemuriscv32 ?= "e28e14070ba4eba3b6832a8329d4120ed5de8efa"
-SRCREV_machine:qemux86 ?= "e28e14070ba4eba3b6832a8329d4120ed5de8efa"
-SRCREV_machine:qemux86-64 ?= "e28e14070ba4eba3b6832a8329d4120ed5de8efa"
-SRCREV_machine:qemumips64 ?= "bc7632d06c742e712514981591ce647b5d6cbd15"
-SRCREV_machine ?= "e28e14070ba4eba3b6832a8329d4120ed5de8efa"
+SRCREV_machine:qemuarm ?= "d4dbcad8e827ce8e71a29b69acc19f4d3f689119"
+SRCREV_machine:qemuarm64 ?= "9753b4497951a5bd1a921e784532257d26a8b008"
+SRCREV_machine:qemuloongarch64 ?= "9753b4497951a5bd1a921e784532257d26a8b008"
+SRCREV_machine:qemumips ?= "3bab6247ffb07f9de6bdb388854461d0ab7bc7dd"
+SRCREV_machine:qemuppc ?= "9753b4497951a5bd1a921e784532257d26a8b008"
+SRCREV_machine:qemuriscv64 ?= "9753b4497951a5bd1a921e784532257d26a8b008"
+SRCREV_machine:qemuriscv32 ?= "9753b4497951a5bd1a921e784532257d26a8b008"
+SRCREV_machine:qemux86 ?= "9753b4497951a5bd1a921e784532257d26a8b008"
+SRCREV_machine:qemux86-64 ?= "9753b4497951a5bd1a921e784532257d26a8b008"
+SRCREV_machine:qemumips64 ?= "de0569e0860973391d16074bbe9366afb15594bf"
+SRCREV_machine ?= "9753b4497951a5bd1a921e784532257d26a8b008"
 SRCREV_meta ?= "d9483a24c9ee33b6e566baa5233cbd9feaeb5212"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.34.1


