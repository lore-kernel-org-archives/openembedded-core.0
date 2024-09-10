Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DDBECE564
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 13:38:25 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.23746.1725975504343500746
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 06:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JIJ97XRo;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6c54a5fbceeso12925096d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 06:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725975503; x=1726580303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bxNZ7aisTKZtSWje0ZSxigsGCucv+B5udnaD8nGJ6po=;
        b=JIJ97XRoer0AQ899l2j4jVfvTI2MxKC9tTvkv1yUx+Tvo2izXa0H7oPSxknq9JTJBh
         Z87KbIlVe45mxrl0lCXvMfCLLEJY+4VdQVXsPT3pWIRpiWIGlIv21eBXUMT+NA8g6IxN
         IixhJupWujinmzwU2WY0VPavWL35G6WbaQs0oGsAee47E360oh1/AW4IyOXNx2jNxYWZ
         zyEy34Pgv+4wDbvW92AAtImf12xA6h0MfCJp3inEKsvCnTCM+wmwS2kkn/Ohz54y2ZDu
         6KbbXthpzSD2+nu+2pEv9GQTCu0hzxUkzW/xEqToatshyjOBFSDZroyQipk5hUV8d/xk
         8ZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725975503; x=1726580303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxNZ7aisTKZtSWje0ZSxigsGCucv+B5udnaD8nGJ6po=;
        b=NyljiDPx7rPwuD/VG+5mXfR8SPe7i3x+TZprxZA2tyKFbQ1RTMKEXAXheoFzigCaKj
         A9H3MPjxEX29c8v8L8Wyx/yPlcqOSat6PUux/K1cE0mOPHI869aMh6Db2WaWOECi8OoB
         JtVZMUGEpu9U/XSPCGJrdbKCnb+I+3X/L8Ex5oCj/loOUHDd6wcP8e3uRm0p8eY5jKuG
         yjdyTlCcke/2GiMy7AE88p6N7fI+W0eVgPg+KMmi+EaL15fNY4vzS7u1zJ7lOljQ2EKT
         zzfSdhnS+EZLLi6boAQGfOWyl5S1Tl9Z3MW0bx+SAjz3jWeq+jGwaj/Dje3m2W52gVRB
         TOsQ==
X-Gm-Message-State: AOJu0YyNQ1X878ttmi/wAI1RgFC4i1Q8GdZ0Hiv/GqQnnSCk1bYUDTJz
	SMgzHcu2eCSniPFcI+QR1unFCtntm2JxXQovrrePuYXTEP7zj8XM
X-Google-Smtp-Source: AGHT+IEYBKviGrmAL/tr6OPGwjHXAHIai459yNvU42iaY2/Q24b2HZ7VflNIphLgJr8t6F1Be5BKqg==
X-Received: by 2002:a05:6214:4a02:b0:6bf:8aca:2e8b with SMTP id 6a1803df08f44-6c528508bd8mr201761176d6.34.1725975502882;
        Tue, 10 Sep 2024 06:38:22 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c53433b551sm30269566d6.55.2024.09.10.06.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 06:38:22 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone] linux-yocto/5.10: fix NFSV3 config warning
Date: Tue, 10 Sep 2024 09:38:21 -0400
Message-Id: <20240910133821.1394242-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 13:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204350

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: nfsd: drop CONFIG_NFSD_V3
    Date: Tue, 2 Aug 2022 10:52:25 -0400

      commit 5f9a62ff7d2808c7b56c0ec90f3b7eae5872afe6
      Author: Chuck Lever <chuck.lever@oracle.com>
      Date:   Sun Feb 6 12:25:47 2022 -0500

        NFSD: Remove CONFIG_NFSD_V3

        Eventually support for NFSv2 in the Linux NFS server is to be
        deprecated and then removed.

        However, NFSv2 is the "always supported" version that is available
        as soon as CONFIG_NFSD is set.  Before NFSv2 support can be removed,
        we need to choose a different "always supported" version.

        This patch removes CONFIG_NFSD_V3 so that NFSv3 is always supported,
        as NFSv2 is today. When NFSv2 support is removed, NFSv3 will become
        the only "always supported" NFS version.

        The defconfigs still need to be updated to remove CONFIG_NFSD_V3=y.

        Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 96208b6731..268b5d1ec1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "131cb7adf814a294e91b1f130596274dcf946acc"
-SRCREV_meta ?= "a0827028a62288d735501a325eb8dfb9c9f0d701"
+SRCREV_machine ?= "3a31ff0840cedf5e78ef3490e604a9f66f9b1f1f"
+SRCREV_meta ?= "a26c1def6dceccb96ab9a707072d22e75888eda9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 5a86306584..d35ac04135 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "b1e71e9f64f711f24a5b4d1c9b95268d85f55223"
-SRCREV_machine ?= "1058d8075ff9a651366d135278effaaf707ee8ba"
-SRCREV_meta ?= "a0827028a62288d735501a325eb8dfb9c9f0d701"
+SRCREV_machine:qemuarm ?= "fe7f23b30d73333007fe54c96cdb579a31da43bf"
+SRCREV_machine ?= "ca19be2d9d77072cfdde806553e729752b0d9241"
+SRCREV_meta ?= "a26c1def6dceccb96ab9a707072d22e75888eda9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 0a643ebf8a..f20804e7fc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,17 +14,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1b786a40d06acef91fe972e1e0ea0fba35c952f1"
-SRCREV_machine:qemuarm64 ?= "1a521d8f1fd43a00256c93eedbb1dcb411c3936b"
-SRCREV_machine:qemumips ?= "730441c1cf02c3ee9176ffb23fe686ef4162e1ff"
-SRCREV_machine:qemuppc ?= "051b2b500b8f91b670d3d65ad0decf4e077c2727"
-SRCREV_machine:qemuriscv64 ?= "0e60e683b3a30c66c24a779c8f928d60b1fbb940"
-SRCREV_machine:qemuriscv32 ?= "0e60e683b3a30c66c24a779c8f928d60b1fbb940"
-SRCREV_machine:qemux86 ?= "0e60e683b3a30c66c24a779c8f928d60b1fbb940"
-SRCREV_machine:qemux86-64 ?= "0e60e683b3a30c66c24a779c8f928d60b1fbb940"
-SRCREV_machine:qemumips64 ?= "3b07617401af5767816a9d60cd2b40dcb9244a2b"
-SRCREV_machine ?= "0e60e683b3a30c66c24a779c8f928d60b1fbb940"
-SRCREV_meta ?= "a0827028a62288d735501a325eb8dfb9c9f0d701"
+SRCREV_machine:qemuarm ?= "2524a39d1d5f16980df4f15ef9a7ac2e148795c0"
+SRCREV_machine:qemuarm64 ?= "57e9463c04f9b211dcedd7b92e32cac9b198bccb"
+SRCREV_machine:qemumips ?= "e8d524ff4ca12d884df488db504b35b97f394b78"
+SRCREV_machine:qemuppc ?= "0f0b7bfda26ff5ea9790d648fd82777486b181c7"
+SRCREV_machine:qemuriscv64 ?= "03a85a51f33ae656439b764cd94e795a055e665e"
+SRCREV_machine:qemuriscv32 ?= "03a85a51f33ae656439b764cd94e795a055e665e"
+SRCREV_machine:qemux86 ?= "03a85a51f33ae656439b764cd94e795a055e665e"
+SRCREV_machine:qemux86-64 ?= "03a85a51f33ae656439b764cd94e795a055e665e"
+SRCREV_machine:qemumips64 ?= "6e5d351f2d183cf91d030fc78b4b176338bcb141"
+SRCREV_machine ?= "03a85a51f33ae656439b764cd94e795a055e665e"
+SRCREV_meta ?= "a26c1def6dceccb96ab9a707072d22e75888eda9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
-- 
2.39.2


