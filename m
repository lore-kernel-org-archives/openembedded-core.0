Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB77C77B7E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 12:29:49 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.10316.1685017779694192239
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 05:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=gKBoNgAC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f42ba32e24so3997285e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 05:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685017778; x=1687609778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z5rT98tuhfiycNkHUjuvPjagzES25lmI7nj58faBsg0=;
        b=gKBoNgACcmdq2SVLFuORGD6OPvIC3vY7UiZL1afTngWgaIImPAL4zF80XAlkv+Yhq0
         wzDMn35TdheA9cjYB/x8e+r2KAR8yK8PfNcLDsoEWNaBPyANcfS2b9WX7dyAIzEMPTtB
         NFrggCsmZeSdUP0Oelvy3ByZfcBi8ufzJ22qI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685017778; x=1687609778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5rT98tuhfiycNkHUjuvPjagzES25lmI7nj58faBsg0=;
        b=f4S4XZGViE3H9z76kG7Ukd2G9UHQxxXVmaz2TzvU3XjHEbusCH7LjvJqwXQPpa3gez
         /AbKN587cRRboIzEwziaB9WG8dQAAWxen9AE3iiNWdFV6XXMwsbbCkvWSxRGF9JhBJt3
         f7b1VmJsfC32bb6/nm+U1GbiuYAOYXP7Hi37e16Z5O8bA8MrMrZygdqVEKVChqeOXia4
         MEsBFmukRbkERdzwvna2wTRlh4sKcwFxfkBGHnq2X1n2CwY5ESSJjiq63K7bMS5ybR2X
         tH08VTX18DyFtjeZmX3wTTbxrH5LsUDFci5uUC37I90wwNonWEkG+gCdvuM4Q/9qrx0V
         k5QA==
X-Gm-Message-State: AC+VfDyBJT5LA+L1lETVPyVd4QWBZvkymwkScWpaR7dRqW4GHg+cgQE7
	mf1n9eALT8K67yG9IrkNznDhBwIs8D0+KkylN0o=
X-Google-Smtp-Source: ACHHUZ71RP+ur5Nnr5HZLHX3aFU+r9rATlkaOrs4fysRs8zRKWBuEbxJ6phPLrEkW8KA+6/mdq1Hqg==
X-Received: by 2002:a7b:cc8c:0:b0:3f6:787:4a70 with SMTP id p12-20020a7bcc8c000000b003f607874a70mr2243141wma.15.1685017777755;
        Thu, 25 May 2023 05:29:37 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:85f3:29ee:f2af:493a])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d4584000000b003079693eff2sm1689271wrq.41.2023.05.25.05.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 05:29:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] linux-yocto: Drop 5.15 support
Date: Thu, 25 May 2023 13:29:36 +0100
Message-Id: <20230525122936.2733864-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 12:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181711

5.15 doesn't work with gcc 13 and we'll be replacing 5.15 with a new kernel
version later in the release cycle. Drop 5.15 now so we can move forward
with gcc 13 and we'll add a new kernel version later.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../linux/linux-yocto-rt_5.15.bb              | 45 ------------
 .../linux/linux-yocto-tiny_5.15.bb            | 30 --------
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 70 -------------------
 3 files changed, 145 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_5.15.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
deleted file mode 100644
index 475fe34066d..00000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-KBRANCH ?= "v5.15/standard/preempt-rt/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# Skip processing of this recipe if it is not explicitly specified as the
-# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
-# to build multiple virtual/kernel providers, e.g. as dependency of
-# core-image-rt-sdk, core-image-rt.
-python () {
-    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
-        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
-}
-
-SRCREV_machine ?= "8e0611e36c848a07f9cdd778903c9e51bb90b319"
-SRCREV_meta ?= "e4b95ec17228274acb38bf10061448224df3a312"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
-
-LINUX_VERSION ?= "5.15.108"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "1"
-
-LINUX_KERNEL_TYPE = "preempt-rt"
-
-COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)$"
-
-KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
-KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
-KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
deleted file mode 100644
index 365d01db781..00000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-KBRANCH ?= "v5.15/standard/tiny/base"
-
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "5.15.108"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine ?= "3d762b85647844790979dd1e17a762003aaa7476"
-SRCREV_meta ?= "e4b95ec17228274acb38bf10061448224df3a312"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
-
-COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
-
-# Functionality flags
-KERNEL_FEATURES = ""
-
-KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
deleted file mode 100644
index 54c8e126449..00000000000
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ /dev/null
@@ -1,70 +0,0 @@
-KBRANCH ?= "v5.15/standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# board specific branches
-KBRANCH:qemuarm  ?= "v5.15/standard/arm-versatile-926ejs"
-KBRANCH:qemuarm64 ?= "v5.15/standard/qemuarm64"
-KBRANCH:qemumips ?= "v5.15/standard/mti-malta32"
-KBRANCH:qemuppc  ?= "v5.15/standard/qemuppc"
-KBRANCH:qemuriscv64  ?= "v5.15/standard/base"
-KBRANCH:qemuriscv32  ?= "v5.15/standard/base"
-KBRANCH:qemux86  ?= "v5.15/standard/base"
-KBRANCH:qemux86-64 ?= "v5.15/standard/base"
-KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
-
-SRCREV_machine:qemuarm ?= "80421c525a12141d31bf1592b0d8c176defe3010"
-SRCREV_machine:qemuarm64 ?= "9d140dbc3171bf272f51b524edeeb2f22783aca5"
-SRCREV_machine:qemumips ?= "b29a8fa62d88db512f1fa5d60e430a851d7e3aaf"
-SRCREV_machine:qemuppc ?= "7ee6b7fc4b57933114376cf012218c2ae3d23558"
-SRCREV_machine:qemuriscv64 ?= "e8c818cce43dd720c366d831aeb102c20c237652"
-SRCREV_machine:qemuriscv32 ?= "e8c818cce43dd720c366d831aeb102c20c237652"
-SRCREV_machine:qemux86 ?= "e8c818cce43dd720c366d831aeb102c20c237652"
-SRCREV_machine:qemux86-64 ?= "e8c818cce43dd720c366d831aeb102c20c237652"
-SRCREV_machine:qemumips64 ?= "5c900befc90365f6daa80989e8de0ccc546ff0f5"
-SRCREV_machine ?= "e8c818cce43dd720c366d831aeb102c20c237652"
-SRCREV_meta ?= "e4b95ec17228274acb38bf10061448224df3a312"
-
-# set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-# get the <version>/base branch, which is pure upstream -stable, and the same
-# meta SRCREV as the linux-yocto-standard builds. Select your version using the
-# normal PREFERRED_VERSION settings.
-BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "3299fb36854fdc288bddc2c4d265f8a2e5105944"
-PN:class-devupstream = "linux-yocto-upstream"
-KBRANCH:class-devupstream = "v5.15/base"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};protocol=https \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.108"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-DEPENDS += "gmp-native libmpc-native"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "1"
-
-KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
-
-COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32)$"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
-KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
-KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
-KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
-KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
-KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
-
-INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
-
-- 
2.39.2


