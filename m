Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web12.233.1632333238330185700
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Sep 2021 10:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V33fPWTo;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id c19so3508003qte.7
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Sep 2021 10:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IbAjKLxIDSYLNuoFw73gywpwxeBCyZQzHJWHAiSPrx4=;
        b=V33fPWTo6yC2PZ5T6RZI3J/eN7Hs6aqFKmepU0g0pfiIgXBhHcEgLQouWtKryHZbuM
         yo+mvpv+oP1RoQrAAZka4J/zWFV3/LLd9eUf4aNzf6jrKqxOpOiUGKUy5pL5SJuriqf0
         gln/kH6cOBDxVwc6M4rseMXur9Su20c4ND4nMc3yGB8pECaRME0bMbg58zbooW4rYrSF
         oaxwegVfonl13DeWJZiLb5dHryHizvtqYedrMlKTQiOH9cv4uMYHibQMkBqW7IaEGBbU
         RL+TRR0r4riptpRftwzk4XHIkOnm3cAZPrDKFbY1jRMxb358fORV/1sWy4FoVW6+i4w/
         kd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IbAjKLxIDSYLNuoFw73gywpwxeBCyZQzHJWHAiSPrx4=;
        b=dAVic+to1Hw164p3D+ndtCki8en6Sv8xfxLCq8FwoN0g+abOkunSgpoDVmtP598LH9
         l1MtajmkR0k72mB7syHTtu6gLUmDatwPgnCgNvfmhDaysE8O5k3vu+LlYFpZSE7U+A7n
         ZrBlpBO29i+fcuCCusazUS5xg209xDG+jB132wMDOfQRhsDxE7HEha8KXpaMTwO1ubDp
         mlOapI5q4tHpaXkWaWQvD5bJGVwpqyV5b/PUpDnJi/zDzJUxWAt0kRhLtWa7RdRu3tGI
         2/T1/PU1gkCNkZrJ81oZGf4qRd/PbKpPzy6KgeR10k1m9TrMz5r9EJP+HUO1mIDjaikh
         OOGA==
X-Gm-Message-State: AOAM533IM4npQ3RmjMWuDhgwRG4Awda+kl0wJGK6RvY4A3WxAwN70A0q
	pEfwPUs0u+uLS/iep5gH7lMZ/XD3n7hcWQ==
X-Google-Smtp-Source: ABdhPJyhHVa6+T4qQ/P1ITrqbn85jgZxpOLvyyZ9tnRuhUHfKrfYmXRgTsOFqC7/g3yP0P3Ye6lHkw==
X-Received: by 2002:ac8:3b51:: with SMTP id r17mr510691qtf.139.1632333237330;
        Wed, 22 Sep 2021 10:53:57 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id n16sm1809484qta.51.2021.09.22.10.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 10:53:56 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto: introduce 5.14 reference kernel
Date: Wed, 22 Sep 2021 13:53:50 -0400
Message-Id: <2baef7d539683cb483aff26f35ce742dbcb9ecb5.1632332981.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1632332981.git.bruce.ashfield@gmail.com>
References: <cover.1632332981.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Each release of the kernel is not typically used as a versioned
reference kernel, but since 5.13 has gone EOL upstream and was
never part of a release, we take the opportunity to udpate our
reference to 5.14.

5.13 will be removed in subsequent commits, once all dependent
BSPs and layers have been updated.

No issues were found across all architectures, images in qemu
boot testing.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.14.bb              | 45 ++++++++++++
 .../linux/linux-yocto-tiny_5.14.bb            | 32 +++++++++
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 68 +++++++++++++++++++
 3 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.14.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
new file mode 100644
index 0000000000..a147e632e4
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
@@ -0,0 +1,45 @@
+KBRANCH ?= "v5.14/standard/preempt-rt/base"
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
+SRCREV_machine ?= "7630ebb9fd510cf7aa31b6f1dd472f3b0442afb3"
+SRCREV_meta ?= "42d2cf670ed06f4dddd2a035611a519ea68e2d26"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "5.14.6"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
new file mode 100644
index 0000000000..20ff40d267
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
@@ -0,0 +1,32 @@
+KBRANCH ?= "v5.14/standard/tiny/base"
+KBRANCH:qemuarm  ?= "v5.14/standard/tiny/arm-versatile-926ejs"
+
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+LINUX_VERSION ?= "5.14.6"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine:qemuarm ?= "ee2ccc84e65ade5ba0f8e1a700fba29a755746a1"
+SRCREV_machine ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
+SRCREV_meta ?= "42d2cf670ed06f4dddd2a035611a519ea68e2d26"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
+
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
+
+# Functionality flags
+KERNEL_FEATURES = ""
+
+KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
new file mode 100644
index 0000000000..0c6fbff75e
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
@@ -0,0 +1,68 @@
+KBRANCH ?= "v5.14/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# board specific branches
+KBRANCH:qemuarm  ?= "v5.14/standard/arm-versatile-926ejs"
+KBRANCH:qemuarm64 ?= "v5.14/standard/qemuarm64"
+KBRANCH:qemumips ?= "v5.14/standard/mti-malta32"
+KBRANCH:qemuppc  ?= "v5.14/standard/qemuppc"
+KBRANCH:qemuriscv64  ?= "v5.14/standard/base"
+KBRANCH:qemuriscv32  ?= "v5.14/standard/base"
+KBRANCH:qemux86  ?= "v5.14/standard/base"
+KBRANCH:qemux86-64 ?= "v5.14/standard/base"
+KBRANCH:qemumips64 ?= "v5.14/standard/mti-malta64"
+
+SRCREV_machine:qemuarm ?= "8226a3a65df2dbae0fe71e9ff54cba70a9ba85e5"
+SRCREV_machine:qemuarm64 ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
+SRCREV_machine:qemumips ?= "b5389debd85300e24b877f25c2e90381f1df7678"
+SRCREV_machine:qemuppc ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
+SRCREV_machine:qemuriscv64 ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
+SRCREV_machine:qemuriscv32 ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
+SRCREV_machine:qemux86 ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
+SRCREV_machine:qemux86-64 ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
+SRCREV_machine:qemumips64 ?= "56cc67b699194944809832f4c8f58b9828f02bf9"
+SRCREV_machine ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
+SRCREV_meta ?= "42d2cf670ed06f4dddd2a035611a519ea68e2d26"
+
+# set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
+# get the <version>/base branch, which is pure upstream -stable, and the same
+# meta SRCREV as the linux-yocto-standard builds. Select your version using the
+# normal PREFERRED_VERSION settings.
+BBCLASSEXTEND = "devupstream:target"
+DEFAULT_PREFERENCE:class-devupstream = "-1"
+SRCREV_machine:class-devupstream ?= "6a7ababc0268063d0798c46d5859a90ee996612f"
+PN:class-devupstream = "linux-yocto-upstream"
+KBRANCH:class-devupstream = "v5.14/base"
+
+# remap qemuarm to qemuarma15 for the 5.8 kernel
+# KMACHINE:qemuarm ?= "qemuarma15"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+LINUX_VERSION ?= "5.14.6"
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
-- 
2.19.1

