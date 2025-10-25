Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D39CCF9E0
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 02:49:13 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.413.1761360544756885954
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Oct 2025 19:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FE6szrnB;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8923b2d9954so188795685a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 19:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761360544; x=1761965344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U00UQlUC4O2KF53OjP8vPe8bLeSUXkoI0+bblrao1WY=;
        b=FE6szrnB07rfsk0pLMrwC2+LrnTQNYChx6qy88Qg47lRRMrRvlELxx8K7w+tw4nNvY
         8pQJUDmOoOefe546hryn51ICkckM1Piu+SIOl2olSDgch6q39XikrTFwafEV5QyUWLdS
         XDcqYLiGA7r9sASrvn6ZrJUJLBdIUXILo0vVP3vifec3RemvkTXl0qsywpd9oLFCM9/d
         7f7G3uMhOJZyfy/FGIq/vDKKf5tPO9SbdAOkqwHwUauzR34KE7+WnwMTbA7Cxkx3HHd9
         X3H9m5MnR5FqvFMC+QygdoFlZIf/gYkEnVd4uis/1WCSfug2E8qqrMwc/59F1aiUITHk
         Cm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761360544; x=1761965344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U00UQlUC4O2KF53OjP8vPe8bLeSUXkoI0+bblrao1WY=;
        b=Hc9laWAxpwHrsWoDs/uOOM53GzOVFY81spAgJ0DKhVhgKteXPEZi31E0EitYGwduPW
         32KKBNYkmE50DvOw4/I+UnGhTQgyaB0SAEddq6iehqoYIEC3/46DCthmOEBKC4xqRhoE
         gqRf4vvcJUfSJ648cOa83WBWK3TAjVrcoe4CyfXez0UktLvXEG6Dm3fA9YKwc1afEZfz
         Qzn4xvDQC6LTiqBScja2pCDiH/eM+pK+uvZgrhpQ3Rih8ZGQI6l40XA+L7eXAktuoYpP
         +1cpfG0gbjrl9lNMmqcySTFgK9drRTI/f9WshA//g6vkxxwEZwBZQzPWQLILAvnx/f9O
         pA+g==
X-Gm-Message-State: AOJu0YxM+wapxlxrl0Qo5Kj3dR2zC/opkZpwzLr20gixYQfu2GuDinbV
	mv+7L7AHyMfYXq/1/rw9m5E6FBnQGmJsbhX13IgY57x/luEcqiUyXyLcw0eUrbJ0TkY=
X-Gm-Gg: ASbGnctfNtWWaZs60HwhjzMNgs9YzaT47PLxgm3zS/H40va0FkzuR/z8eRbT6ZwS9Ve
	0juYxctPmGE21Y/EBdaMZKt5vh5vSYIxbCqe/w01KJ3O1Y7j1Z/WrWoLVC8+69HRH+BbgythxXa
	AyrypbvHSUTDPV+OS4cjuedAad7+ulA3aYKZiZtGupRaFeaRmDzNtuDLp8GWDFWavY5p/cmeKnF
	1+AwUJ0VVEyE7p568l4Ysda5vYzltm9E2VI6s5x9NmaI2KPwydEFKr/huupd0NNUDt+ifh9Zjq+
	NM71waSN4yKppHG7RaclHBS3lDLx97+MqzBJU/pCw8Zs/lu43msqC2E8HVBP81D6mbs6hgb3W89
	yA19pesQp9HhOqws8Gqcsfqe4EJKZ6wEL/CPsh9V3yJqttjK8GwPlBfSF7QzDcGaKAqf50SwRxL
	Bm6YMGMQF6k8IFRNm0cSJYlGuLGp7/GJvQDqOZq3j2C5jTJYX/7kayy7aWzR7KEL48lQDFC1BC3
	ZcY/IXvTFC/ywD5jj15LZ4QBA==
X-Google-Smtp-Source: AGHT+IHkXTaJyN+5o4kxkCfB7UlNhq4jLauSWJlXF/jli5skMiso9oXUBTTXp3Ee0BNvzXJusfzO4g==
X-Received: by 2002:a05:620a:3184:b0:892:1a47:d5cf with SMTP id af79cd13be357-8921a571937mr2956909385a.90.1761360543643;
        Fri, 24 Oct 2025 19:49:03 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f2421f6a5sm62447285a.5.2025.10.24.19.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 19:49:02 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto: introduce 6.17 reference kernels
Date: Fri, 24 Oct 2025 22:48:57 -0400
Message-Id: <65b6f4cb57e6738e48560539cf2c0485e0469b65.1761360245.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1761360245.git.bruce.ashfield@gmail.com>
References: <cover.1761360245.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Oct 2025 02:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225303

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 6.17 kernel went through quite a bit of testing via
linux-yocto-dev, so it is a relatively well understood release.

These recipes introduce it as a fully tested reference with the
potential to replace the EOL 6.16 refs.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.17.bb              | 48 +++++++++++
 .../linux/linux-yocto-tiny_6.17.bb            | 33 ++++++++
 meta/recipes-kernel/linux/linux-yocto_6.17.bb | 79 +++++++++++++++++++
 3 files changed, 160 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.17.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
new file mode 100644
index 0000000000..a8dd6bfb2b
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
@@ -0,0 +1,48 @@
+KBRANCH ?= "v6.17/standard/preempt-rt/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion_6.17.inc
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
+SRCREV_machine ?= "268abc460d21fe8510bc8a521f3ea887f2bbeef0"
+SRCREV_meta ?= "07eb16989b3f0b4fdfd433e602d70d0e0538495a"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.17;destsuffix=${KMETA};protocol=https"
+
+LINUX_VERSION ?= "6.17.5"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+PV = "${LINUX_VERSION}+git"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "1"
+
+LINUX_KERNEL_TYPE = "preempt-rt"
+
+COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)$"
+
+KERNEL_DEVICETREE:qemuarmv5 = "arm/versatile-pb.dtb"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
+KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES:append:qemuall = " cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
+KERNEL_FEATURES:append:qemux86 = " cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append:qemux86-64 = " cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
new file mode 100644
index 0000000000..989b114769
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
@@ -0,0 +1,33 @@
+KBRANCH ?= "v6.17/standard/tiny/base"
+
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion_6.17.inc
+
+LINUX_VERSION ?= "6.17.5"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
+SRCREV_meta ?= "07eb16989b3f0b4fdfd433e602d70d0e0538495a"
+
+PV = "${LINUX_VERSION}+git"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.17;destsuffix=${KMETA};protocol=https"
+
+COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
+
+# Functionality flags
+KERNEL_FEATURES:append:qemuall = " cfg/virtio.scc cfg/fs/ext4.scc"
+
+KERNEL_DEVICETREE:qemuarmv5 = "arm/versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.17.bb b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
new file mode 100644
index 0000000000..399dfa171b
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
@@ -0,0 +1,79 @@
+KBRANCH ?= "v6.17/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
+include recipes-kernel/linux/cve-exclusion_6.17.inc
+
+# board specific branches
+KBRANCH:qemuarm  ?= "v6.17/standard/arm-versatile-926ejs"
+KBRANCH:qemuarm64 ?= "v6.17/standard/base"
+KBRANCH:qemumips ?= "v6.17/standard/mti-malta32"
+KBRANCH:qemuppc  ?= "v6.17/standard/qemuppc"
+KBRANCH:qemuriscv64  ?= "v6.17/standard/base"
+KBRANCH:qemuriscv32  ?= "v6.17/standard/base"
+KBRANCH:qemux86  ?= "v6.17/standard/base"
+KBRANCH:qemux86-64 ?= "v6.17/standard/base"
+KBRANCH:qemuloongarch64  ?= "v6.17/standard/base"
+KBRANCH:qemumips64 ?= "v6.17/standard/mti-malta64"
+
+SRCREV_machine:qemuarm ?= "23c78022fc97ea5ebc19ea8fb86d324c23a6fbaa"
+SRCREV_machine:qemuarm64 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
+SRCREV_machine:qemuloongarch64 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
+SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
+SRCREV_machine:qemuppc ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
+SRCREV_machine:qemuriscv64 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
+SRCREV_machine:qemuriscv32 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
+SRCREV_machine:qemux86 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
+SRCREV_machine:qemux86-64 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
+SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
+SRCREV_machine ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
+SRCREV_meta ?= "07eb16989b3f0b4fdfd433e602d70d0e0538495a"
+
+# set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
+# get the <version>/base branch, which is pure upstream -stable, and the same
+# meta SRCREV as the linux-yocto-standard builds. Select your version using the
+# normal PREFERRED_VERSION settings.
+BBCLASSEXTEND = "devupstream:target"
+SRCREV_machine:class-devupstream ?= "99efbd4259f384718dd16a7423d8e944396b65d4"
+PN:class-devupstream = "linux-yocto-upstream"
+KBRANCH:class-devupstream = "v6.17/base"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.17;destsuffix=${KMETA};protocol=https"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+LINUX_VERSION ?= "6.17.5"
+
+PV = "${LINUX_VERSION}+git"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "1"
+
+KERNEL_DEVICETREE:qemuarmv5 = "arm/versatile-pb.dtb"
+
+COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32|qemuloongarch64)$"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
+KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES:append:qemuall = " cfg/virtio.scc features/drm-bochs/drm-bochs.scc cfg/net/mdio.scc"
+KERNEL_FEATURES:append:qemux86 = " cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append:qemux86-64 = " cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("KERNEL_DEBUG", "True", " features/reproducibility/reproducibility.scc features/debug/debug-btf.scc", "", d)}"
+# libteam ptests from meta-oe needs it
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/net/team/team.scc", "", d)}"
+# openl2tp tests from meta-networking needs it
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " cgl/cfg/net/l2tp.scc", "", d)}"
+KERNEL_FEATURES:append:powerpc = " arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64 = " arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
+# Do not add debug info for riscv32, it fails during depmod
+# ERROR: modpost: __ex_table+0x17a4 references non-executable section '.debug_loclists'
+# Check again during next major version upgrade
+KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
+INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
-- 
2.39.2


