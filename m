Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0B6C25B07
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 22:58:05 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.720.1659653882141254720
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lrzm9KDx;
 spf=pass (domain: gmail.com, ip: 209.85.219.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id h8so690050qvs.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=r9gHBL8OT7IgdI+LqknsRlUFd50Y6OWj6WrWslq3HCg=;
        b=lrzm9KDxhZAwgYvTZ0arHRpUKqFQSMKlsQacBatFCNItQc0CpQwKevZj9ZmGT1Le0B
         E3E0xFrFhoqA6mqgduazTVR1tFEQ22+FggJ0sZlpVKIaIEI8tBxA/+qyaMGWnRyUVbZP
         KeaOSAF0yQ+TCoHPxSeerIVWzK+/Hh8Wt72hUc6PVItNG1G1IAOQY98iXh3xhNr57ypZ
         TLhvWNEaYtXicoN4WUz6KNbAv+hYuNZuk8z7w6IZDUpNc3YIcNJCfHiMdcB4fkYi0zGQ
         zInLOm0cYW2OyjvkFl5f/OdabDqJA42tt8a6B5RRorIzfYaIywdeB+Vwy/Bbz5q5z/HZ
         mJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=r9gHBL8OT7IgdI+LqknsRlUFd50Y6OWj6WrWslq3HCg=;
        b=14ugAzRYn7pY2mGCtW2+NqrBXUhl++k7onOg5BmiTuiXYOACebNF4JpQMiVMs6FFIv
         gS/PdvBVUKsNmC3iy+MCzruC27MBIoLqIo1Derg8X/+xZ/Dp1Dmr/NUd19M56H2QSuQI
         NNPCTOQzBmLYWKpAjxazwW1cL+DJXf+encV6t5DiiIpqkaTkXAciUfP6jO+/8VchpPhd
         IRUVqRbiyg2jKu0DfGeqswdes0l24BY0AFmHRcW62l0BzIUmrDcgHUym0n/sEHYLL8t1
         ZEz9PZir0ECloQgbyI+sIbxx3ROjm1fnb9sFhvIHCpS8sxvyQ8rkkkovtPFg/VS0h5iW
         +08g==
X-Gm-Message-State: ACgBeo2ETDf+8bj+Jg/I3DMu9P20IqxhH6Rmaxr975reiiBqf+0lhvTb
	iaL1AWtAwtYBlbvLvGKn57PLi/uveeg63Q==
X-Google-Smtp-Source: 
 AA6agR6t+aZ8f0nQIPMcTTMhqdBlZnmLegiQ8DPVQmdqrs4T6XnrPML6YljSr7E7/s3oj3GAbc/PIQ==
X-Received: by 2002:a05:6214:cad:b0:474:92f4:3db3 with SMTP id
 s13-20020a0562140cad00b0047492f43db3mr3442470qvs.78.1659653881045;
        Thu, 04 Aug 2022 15:58:01 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 bl38-20020a05620a1aa600b006b8df80471csm1500818qkb.119.2022.08.04.15.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 15:58:00 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/13] linux-yocto: introduce v5.19 reference kernel recipes
Date: Thu,  4 Aug 2022 18:57:42 -0400
Message-Id: 
 <ca337d88429c13fe3c86ea1ba083249b0aa88074.1659653543.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1659653543.git.bruce.ashfield@gmail.com>
References: <cover.1659653543.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 22:58:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168869

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Introducing the v5.19 reference kernels. Test built and booted
against arm/arm64, mips/mips64, x86-64, ppc in combination with
musl and glibc.

No issues found, and this becomes the 'newest' reference kernel.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.19.bb              | 45 ++++++++++++
 .../linux/linux-yocto-tiny_5.19.bb            | 30 ++++++++
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 70 +++++++++++++++++++
 3 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.19.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
new file mode 100644
index 0000000000..54982bc200
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -0,0 +1,45 @@
+KBRANCH ?= "v5.19/standard/preempt-rt/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# Skip processing of this recipe if it is not explicitly specified as the
+# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
+# to build multiple virtual/kernel providers, e.g. as dependency of
+# core-image-rt-sdk, core-image-rt.
+python () {
+    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
+        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
+}
+
+SRCREV_machine ?= "e41cf2ea686c923a56b8fbc52ea998dc7193f099"
+SRCREV_meta ?= "eb7088accaa0347a5b627952e48bb8800ff15cf3"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "5.19"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "1"
+
+LINUX_KERNEL_TYPE = "preempt-rt"
+
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
+
+KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
+KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
+KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
new file mode 100644
index 0000000000..716e5aa652
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -0,0 +1,30 @@
+KBRANCH ?= "v5.19/standard/tiny/base"
+
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+LINUX_VERSION ?= "5.19"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
+SRCREV_meta ?= "eb7088accaa0347a5b627952e48bb8800ff15cf3"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
+
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5"
+
+# Functionality flags
+KERNEL_FEATURES = ""
+
+KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
new file mode 100644
index 0000000000..a1a2e72774
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -0,0 +1,70 @@
+KBRANCH ?= "v5.19/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# board specific branches
+KBRANCH:qemuarm  ?= "v5.19/standard/arm-versatile-926ejs"
+KBRANCH:qemuarm64 ?= "v5.19/standard/qemuarm64"
+KBRANCH:qemumips ?= "v5.19/standard/mti-malta32"
+KBRANCH:qemuppc  ?= "v5.19/standard/qemuppc"
+KBRANCH:qemuriscv64  ?= "v5.19/standard/base"
+KBRANCH:qemuriscv32  ?= "v5.19/standard/base"
+KBRANCH:qemux86  ?= "v5.19/standard/base"
+KBRANCH:qemux86-64 ?= "v5.19/standard/base"
+KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
+
+SRCREV_machine:qemuarm ?= "fdb9f8c3f9a6762603e4d71e3f678dfae1afced6"
+SRCREV_machine:qemuarm64 ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
+SRCREV_machine:qemumips ?= "128ff884612b479168e68519bb69d1c7a5180b7d"
+SRCREV_machine:qemuppc ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
+SRCREV_machine:qemuriscv64 ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
+SRCREV_machine:qemuriscv32 ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
+SRCREV_machine:qemux86 ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
+SRCREV_machine:qemux86-64 ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
+SRCREV_machine:qemumips64 ?= "a078f75cccc88d26763cab4762ed00418813f2cd"
+SRCREV_machine ?= "43e6ab6ed043f4bc8e7cffbb08af86af0bdb5e12"
+SRCREV_meta ?= "eb7088accaa0347a5b627952e48bb8800ff15cf3"
+
+# set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
+# get the <version>/base branch, which is pure upstream -stable, and the same
+# meta SRCREV as the linux-yocto-standard builds. Select your version using the
+# normal PREFERRED_VERSION settings.
+BBCLASSEXTEND = "devupstream:target"
+SRCREV_machine:class-devupstream ?= "3d7cb6b04c3f3115719235cc6866b10326de34cd"
+PN:class-devupstream = "linux-yocto-upstream"
+KBRANCH:class-devupstream = "v5.19/base"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.19;destsuffix=${KMETA}"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+LINUX_VERSION ?= "5.19"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+DEPENDS += "gmp-native libmpc-native"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "1"
+
+KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
+
+COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
+KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
+KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
+KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
+
+INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+
-- 
2.19.1


