Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9457FC433FE
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 19:48:44 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web12.2786.1636055315541310168
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JeWHhTel;
 spf=pass (domain: gmail.com, ip: 209.85.219.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id b11so6025601qvm.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pkDQF7kM/G8lnS5sh056HjXPAvme/FV2ymydHUIINtw=;
        b=JeWHhTel4y4DnSR9vYqW3yv3nTh1rrV2Ac6V9Z4hip77pDEkqXZW5iDjlUBND8cW5f
         A4dTdElUrgObf7uQFhDkLbYLE6Vyw1BSRgUV59VXovgNZQ8YkR2AwRQwxF9OgiiZh01z
         uWs0aKmoMBsykXlsM176dnaXvH13mtTLIoqrbIiDqrqDm3IH5dCfrCNmdVmD2oQhUF1h
         G/yeeoVHSpXJ6N1IjDh74tkxryadk2VbbLYZN5i3Zn2IAO/op+3n632TwRn/65PJG4lI
         5KDB+QPnSX0a4zxC1d/uXJPp77DkPpFisBwELRj/NqO6LsWzFAX8LnXZId5k0NG3MnN1
         /jeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pkDQF7kM/G8lnS5sh056HjXPAvme/FV2ymydHUIINtw=;
        b=S5Wh/Amu01uhizqsmvvwRaA7eLzRTGa8YQOFaB8wacPGnrZq2Ypdwtu5njqjOg9IlR
         KvjbrhSakOxM6LEgAyPK/rJyRfVFLqTYZia9PeduBcBd2C+oFZ28n9bCDVpfc6DwNurV
         lDFC99sGLiX3zk9QgRNWbJoeeIRUxP3zYb1LMLSQ4tbfxvct4Na3NJhsgrBfEUuHm2cc
         72n76zk8TaRcYazIUTIRQDAjA2fENiojR+XuT4ffnE4+dW6d6fcyGhE7TlkvPuG0yw8M
         CCPPz+Q+P8NveZP2BxDij0jZoSJwErZFJ7ujmnWJR3003+pIznP4iSM4o0PaHL9RYwkT
         KgRQ==
X-Gm-Message-State: AOAM530ik+FazeeW78WE/ib9Ss2u3QLPGgAXAPd4QnxxV2Jfp/fSK5KS
	s0mUIRHWj2mdlMgYs0WqkJ9/XtwTXgvBdw==
X-Google-Smtp-Source: 
 ABdhPJzwrm9d+Cskp/IOkTEnl/zRGCdkVtC2wh5pDUvZz4W3AmxLsT+L+o9FCHL3uVtF2c6b7Aa2hQ==
X-Received: by 2002:a05:6214:e83:: with SMTP id
 hf3mr11946545qvb.52.1636055314676;
        Thu, 04 Nov 2021 12:48:34 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 br17sm4276771qkb.10.2021.11.04.12.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 12:48:33 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/5.15: introduce recipes
Date: Thu,  4 Nov 2021 15:48:25 -0400
Message-Id: 
 <639436eb895d5d1b8c4837a013c8adf9810877da.1636054726.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1636054726.git.bruce.ashfield@gmail.com>
References: <cover.1636054726.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 19:48:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157867

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 5.15 kernel will be a LTS release, so we introduce our reference
recipes to track the release.

We have some configuration tweaks for the final 5.15 release, but this
is otherwise the same as the kernel that was tested in linux-yocto-dev.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              | 45 ++++++++++++
 .../linux/linux-yocto-tiny_5.15.bb            | 32 +++++++++
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 68 +++++++++++++++++++
 3 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.15.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
new file mode 100644
index 0000000000..81440b65fa
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -0,0 +1,45 @@
+KBRANCH ?= "v5.15/standard/preempt-rt/base"
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
+SRCREV_machine ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
+SRCREV_meta ?= "177a773f3c223d057e34cd341268d2656b89ea01"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "5.15"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
new file mode 100644
index 0000000000..b2bd8e070c
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -0,0 +1,32 @@
+KBRANCH ?= "v5.15/standard/tiny/base"
+KBRANCH:qemuarm  ?= "v5.15/standard/tiny/arm-versatile-926ejs"
+
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+LINUX_VERSION ?= "5.15"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine:qemuarm ?= "5fbef884c98a51679ab4ab566568b1e89123c011"
+SRCREV_machine ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
+SRCREV_meta ?= "177a773f3c223d057e34cd341268d2656b89ea01"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
+
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
+
+# Functionality flags
+KERNEL_FEATURES = ""
+
+KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
new file mode 100644
index 0000000000..e45208e436
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -0,0 +1,68 @@
+KBRANCH ?= "v5.15/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# board specific branches
+KBRANCH:qemuarm  ?= "v5.15/standard/arm-versatile-926ejs"
+KBRANCH:qemuarm64 ?= "v5.15/standard/qemuarm64"
+KBRANCH:qemumips ?= "v5.15/standard/mti-malta32"
+KBRANCH:qemuppc  ?= "v5.15/standard/qemuppc"
+KBRANCH:qemuriscv64  ?= "v5.15/standard/base"
+KBRANCH:qemuriscv32  ?= "v5.15/standard/base"
+KBRANCH:qemux86  ?= "v5.15/standard/base"
+KBRANCH:qemux86-64 ?= "v5.15/standard/base"
+KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
+
+SRCREV_machine:qemuarm ?= "83100b68b82b6f2dabb72b7f707fcfd6d2d06f96"
+SRCREV_machine:qemuarm64 ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
+SRCREV_machine:qemumips ?= "efcb751af175ea5e17234b05305829c97fb1e7a5"
+SRCREV_machine:qemuppc ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
+SRCREV_machine:qemuriscv64 ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
+SRCREV_machine:qemuriscv32 ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
+SRCREV_machine:qemux86 ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
+SRCREV_machine:qemux86-64 ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
+SRCREV_machine:qemumips64 ?= "2cf7c4b42019c88e1e6e56b660eacf355058f8b8"
+SRCREV_machine ?= "a4b3abf4d96d765bea92af652d8ae020c365d46a"
+SRCREV_meta ?= "177a773f3c223d057e34cd341268d2656b89ea01"
+
+# set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
+# get the <version>/base branch, which is pure upstream -stable, and the same
+# meta SRCREV as the linux-yocto-standard builds. Select your version using the
+# normal PREFERRED_VERSION settings.
+BBCLASSEXTEND = "devupstream:target"
+DEFAULT_PREFERENCE:class-devupstream = "-1"
+SRCREV_machine:class-devupstream ?= "8bb7eca972ad531c9b149c0a51ab43a417385813"
+PN:class-devupstream = "linux-yocto-upstream"
+KBRANCH:class-devupstream = "v5.15/base"
+
+# remap qemuarm to qemuarma15 for the 5.8 kernel
+# KMACHINE:qemuarm ?= "qemuarma15"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+LINUX_VERSION ?= "5.15"
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
-- 
2.19.1


