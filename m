Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.11014.1625238840129324019
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 08:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=slu0wrEz;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id w22so892914qtj.8
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 08:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lmkfEHAgir65t5RWKk7A3ohrJhgYq5obuantj2GK1q8=;
        b=slu0wrEzeenm64zaL9UwSjJ/ZPdKNwbU7eu/2PjJWH+iWp0vCgsTDKJMa0aO6DX1eT
         M+GP32TUnZcgP4NM4mupcN6xLSgPvk6HG6GTDGBg646enZLocDOqq4rYArgjIfj1Z/iT
         ycqx8Zlj1wjO8yHOWEYdOaWrdKfjfOT4/DKWvMLudDBLZ5gk/eSxbwLhytM9J1tWSAn0
         X/0m64OOhr2NNX8lpSlCbeRQaGqY4LAUOu30lj5v/xU8aFD7x7aMEBcAEtpLn+keg/rS
         bS0fEeuDnkM4XqXAsFf0mwWcAk1GgzbLobBdTjflPi286XmShCasVXr1qAqVig2JmU1s
         zXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lmkfEHAgir65t5RWKk7A3ohrJhgYq5obuantj2GK1q8=;
        b=bGB8mPtpq8z5ydKx7oJ/w+JaRbqUprJkWpVlcx82UjjdNc59Y/O4gU36LxBcD/Ozmf
         qjIU8LaIiCdPwp3u/pLwDWLt6clWiFRQcZgBZnR5x+kibbP7WM1uJsq8ZP5KnMI/dAm0
         9/lwVY0z0RgHoVmXFfP3qgrmoh3i4DTm7nv5hjBU5MnRkbmKJxhCPtYtAAYEcUHjIjo3
         nhMU3lg8Kx0i8ZWXAH6Ow+PMZJ1rdi6zWxTXDC/ehCeQ5qjNd9S11OxqtB2FdbqTRJk4
         q5V6NxtXOD+LvSEka42x1zwSIJWdfP+O6QCd2qgl7MbN68ulMOj4NdUWLc0Rktn7DVUq
         OGpw==
X-Gm-Message-State: AOAM532vT1Qm/BUpnggwg+xCBGufTwu0oX49001GqvpA2Zq+67cwlDiT
	Xz2T0IJiXExOgLGNczgSYoU=
X-Google-Smtp-Source: ABdhPJyrbcTtrqEb+7QwXp3V4YpJXPR8OGmlUGp0kvJpYEYnj7Afsdao+t4ZeTyduDB2CXmBRyPOPg==
X-Received: by 2002:a05:622a:1a97:: with SMTP id s23mr191613qtc.75.1625238839268;
        Fri, 02 Jul 2021 08:13:59 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id o200sm1466800qke.105.2021.07.02.08.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 08:13:58 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] linux-yocto: introduce 5.13 recipes
Date: Fri,  2 Jul 2021 11:13:48 -0400
Message-Id: <554806ab3388c5ef1ad5e10d909d097efbda412c.1625238537.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1625238537.git.bruce.ashfield@gmail.com>
References: <cover.1625238537.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

5.13 will be the next release/reference kernel (matched with a
libc-headers version bump), this commit creates the recipes, but
does not make it the default kernel (yet).

This has been built and booted on all supported qemu platforms,
as well as with musl and glibc based userspace stacks. Full
core-image-kernel-dev, sato and minimal images have been
tested and show no obvous issues (either locally or on the
autobuilder).

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.13.bb              | 45 ++++++++++++++
 .../linux/linux-yocto-tiny_5.13.bb            | 32 ++++++++++
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 58 +++++++++++++++++++
 3 files changed, 135 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.13.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
new file mode 100644
index 0000000000..f87ab6bcfd
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
@@ -0,0 +1,45 @@
+KBRANCH ?= "v5.13/standard/preempt-rt/base"
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
+SRCREV_machine ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
+SRCREV_meta ?= "ceb5fa598d08902fe2934c041875aa92d9a6fa19"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "5.13"
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
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
+KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
new file mode 100644
index 0000000000..f01133c761
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
@@ -0,0 +1,32 @@
+KBRANCH ?= "v5.13/standard/tiny/base"
+KBRANCH_qemuarm  ?= "v5.13/standard/tiny/arm-versatile-926ejs"
+
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+LINUX_VERSION ?= "5.13"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine_qemuarm ?= "84e5292c5adf2e715e842a9eb3985034941e0798"
+SRCREV_machine ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
+SRCREV_meta ?= "ceb5fa598d08902fe2934c041875aa92d9a6fa19"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
+
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
+
+# Functionality flags
+KERNEL_FEATURES = ""
+
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
new file mode 100644
index 0000000000..66384d8f7d
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
@@ -0,0 +1,58 @@
+KBRANCH ?= "v5.13/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# board specific branches
+KBRANCH_qemuarm  ?= "v5.13/standard/arm-versatile-926ejs"
+KBRANCH_qemuarm64 ?= "v5.13/standard/qemuarm64"
+KBRANCH_qemumips ?= "v5.13/standard/mti-malta32"
+KBRANCH_qemuppc  ?= "v5.13/standard/qemuppc"
+KBRANCH_qemuriscv64  ?= "v5.13/standard/base"
+KBRANCH_qemuriscv32  ?= "v5.13/standard/base"
+KBRANCH_qemux86  ?= "v5.13/standard/base"
+KBRANCH_qemux86-64 ?= "v5.13/standard/base"
+KBRANCH_qemumips64 ?= "v5.13/standard/mti-malta64"
+
+SRCREV_machine_qemuarm ?= "9c2fd4b59ebf57f1900f82d49d6bf4fe074cf818"
+SRCREV_machine_qemuarm64 ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
+SRCREV_machine_qemumips ?= "1ea414ef9e3a9744ec09f7ecebcc3b9aeffe39d0"
+SRCREV_machine_qemuppc ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
+SRCREV_machine_qemuriscv64 ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
+SRCREV_machine_qemuriscv32 ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
+SRCREV_machine_qemux86 ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
+SRCREV_machine_qemux86-64 ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
+SRCREV_machine_qemumips64 ?= "b74fe3dcca0653609fcb75aad883b1db07619081"
+SRCREV_machine ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
+SRCREV_meta ?= "ceb5fa598d08902fe2934c041875aa92d9a6fa19"
+
+# remap qemuarm to qemuarma15 for the 5.8 kernel
+# KMACHINE_qemuarm ?= "qemuarma15"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+LINUX_VERSION ?= "5.13"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+DEPENDS += "gmp-native"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "1"
+
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
+
+COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
+KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
-- 
2.19.1

