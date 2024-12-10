Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B8CC3DA4A
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 21:06:37 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.4183.1733864787541920619
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 13:06:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HBexCLGQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-46753228bfbso24576331cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 13:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733864786; x=1734469586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mL/jXUhH28PnQFdwoAzp1mLDN1XZ/lysT4u7AbUncjc=;
        b=HBexCLGQmBvvz1XwQovH10O+4/2V8qh49+HORz/es+7BAG+19IkhEO2tpL1CbWtQNX
         GVvzWAlnAXFd09whwJldI5rUpEmldKp0U8CZOTv6wE45IUp6v+gjZIS7+EHN9zE3riR7
         a2pxENHkkUhQNiNb4HPquBKillrMGBo3U6oA0XwZbl+eAflj8tcButQUSZp+jyN23FW8
         bfTSDtSNHIcknGVjRjsrUkntlI0h5k/xcJU+E9Hyl8ggSNZkvvPdYqf1ywFd0Wp6lYe6
         rWOVeklPG5sQEi6GxovCt0zGbUHL2YLj3AThGBuBe0PMPmARM8w43wIP27mvixvuj+2q
         NTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864786; x=1734469586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mL/jXUhH28PnQFdwoAzp1mLDN1XZ/lysT4u7AbUncjc=;
        b=kQAQqWwZCWhYy5kfhxWxg8bzRxM0jcilezSrBpS3gcJpU5c+md0wvr8pNB37xJUMxa
         +K3UXygShDKscSDOcWLDuQUvs1m3MkAQjeSyTMKKHFa0QDaGnJnj9+mvrM83bxwh8w0J
         SCBuZ7aThknBnPBy72rimvi3t1khe03t58RpCmmpOMMljqiy8k+BHPDh3DmgMzAXUtWw
         bnXwn5S5cYHed8dX29FLCWGUE/HTU91Tr0mYHF58BhgURmpSPwa/xsIACO4uMdoCDzkR
         /milg/p3d5PlcWwSdKRo4jnOebDy8ga+hS9OJPurudqiIHHxRstes9DshM47/1w7HBGj
         iKjg==
X-Gm-Message-State: AOJu0YygkDWZgLGQqOQJIT03qa9tgSH+l0z00ozgvCl3WCNfouUZ5txk
	j42FxM4U7yWFPOPdn1e8YJJgJo6rk2PQ/GVLTrJsPBTSz0KOdcEV
X-Gm-Gg: ASbGnctDzxfmuTJ94oq8txIYvHNUjZw0WhITlG+hJPp8t5Vfxg13+CaePiqnBEpxP3E
	NSVxOA9we/SvgMYfD1/m5oAtyvlhTvlpP3qZu677jF0JVCPy+kXsnDqCLIcIcFJNgOu4S7k3o4n
	aVY5R5DzbyU/Mfi+pQRDQjmQ4XgLCFKuRoGIWHRJaYOKg7MYOJ/sb5cgx66qvI+NlkMJ38MA0dC
	e6dF+Cym9xC3+QeUOQ7gauhbOqyrt+TmlX+6N6iYoPzpmqS8Iu1KJ00Tz4XFqrTK7HlMNpl5aiP
	pA/l5DhPbQcfKm62cYqcVBw/XD6ERcfHW40xdBnWvNDZ/ZW1NAiYxfs=
X-Google-Smtp-Source: AGHT+IHt4iH5/6MJE7hiSxQ+g2b5Nwd+NU82vXLyFWzaJ38W9xV127q28ZeRaxo5/ngP7+UIUJiY+Q==
X-Received: by 2002:a05:622a:1245:b0:467:867b:ff55 with SMTP id d75a77b69052e-467892d8d32mr8910361cf.27.1733864786400;
        Tue, 10 Dec 2024 13:06:26 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4676e091d95sm18415301cf.12.2024.12.10.13.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 13:06:25 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto/6.12: introduce v6.12 reference kernel
Date: Tue, 10 Dec 2024 16:06:15 -0500
Message-Id: <5280714c1cce9fb62aaa83e2c7504c0c9ecf7edf.1733864271.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1733864271.git.bruce.ashfield@gmail.com>
References: <cover.1733864271.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 21:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208559

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Introducing the v6.12 reference kernel recipes. This version
has been designated a LTS and will be the default kernel for
the next yocto release.

Some notes:

  - Two fragments are added to linux-yocto-tiny to allow booting
    on qemu out of the box
  - preempt-rt is smaller, but still has patches on top of mainline

This has been boot tested on all architectures, qemu* machine variants,
systemd, sysvinit and both musl and glibc.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              | 48 ++++++++++++
 .../linux/linux-yocto-tiny_6.12.bb            | 33 ++++++++
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 76 +++++++++++++++++++
 3 files changed, 157 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.12.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
new file mode 100644
index 0000000000..ff1962590a
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -0,0 +1,48 @@
+KBRANCH ?= "v6.12/standard/preempt-rt/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion_6.12.inc
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
+SRCREV_machine ?= "b01e5cf7ee075ac6fae18ee9eb0ecfaaf024f394"
+SRCREV_meta ?= "38b941ae2f4f28c0ba40b2ba6da466f6f5fe3ba0"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
+
+LINUX_VERSION ?= "6.12.3"
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
+KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
+KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
new file mode 100644
index 0000000000..84c4353008
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -0,0 +1,33 @@
+KBRANCH ?= "v6.12/standard/tiny/base"
+
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion_6.12.inc
+
+LINUX_VERSION ?= "6.12.3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
+SRCREV_meta ?= "38b941ae2f4f28c0ba40b2ba6da466f6f5fe3ba0"
+
+PV = "${LINUX_VERSION}+git"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
+
+COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
+
+# Functionality flags
+KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc cfg/fs/ext4.scc"
+
+KERNEL_DEVICETREE:qemuarmv5 = "arm/versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
new file mode 100644
index 0000000000..54ab7ce2b6
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -0,0 +1,76 @@
+KBRANCH ?= "v6.12/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
+include recipes-kernel/linux/cve-exclusion_6.10.inc
+
+# board specific branches
+KBRANCH:qemuarm  ?= "v6.12/standard/arm-versatile-926ejs"
+KBRANCH:qemuarm64 ?= "v6.12/standard/base"
+KBRANCH:qemumips ?= "v6.12/standard/mti-malta32"
+KBRANCH:qemuppc  ?= "v6.12/standard/qemuppc"
+KBRANCH:qemuriscv64  ?= "v6.12/standard/base"
+KBRANCH:qemuriscv32  ?= "v6.12/standard/base"
+KBRANCH:qemux86  ?= "v6.12/standard/base"
+KBRANCH:qemux86.104 ?= "v6.12/standard/base"
+KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
+KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
+
+SRCREV_machine:qemuarm ?= "c2bc3bf6168351b86c1940020a05bc3907bd97af"
+SRCREV_machine:qemuarm64 ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
+SRCREV_machine:qemuloongarch64 ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
+SRCREV_machine:qemumips ?= "9537ff669bd3fded04ef795aad118851a2bd210c"
+SRCREV_machine:qemuppc ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
+SRCREV_machine:qemuriscv64 ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
+SRCREV_machine:qemuriscv32 ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
+SRCREV_machine:qemux86 ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
+SRCREV_machine:qemux86-64 ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
+SRCREV_machine:qemumips64 ?= "c804d6e613ac8dce9cfde9a245ad3496ad835e0c"
+SRCREV_machine ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
+SRCREV_meta ?= "38b941ae2f4f28c0ba40b2ba6da466f6f5fe3ba0"
+
+# set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
+# get the <version>/base branch, which is pure upstream -stable, and the same
+# meta SRCREV as the linux-yocto-standard builds. Select your version using the
+# normal PREFERRED_VERSION settings.
+BBCLASSEXTEND = "devupstream:target"
+SRCREV_machine:class-devupstream ?= "47edb26c8ed9dd1877f8623ee1cd3b998874ca65"
+PN:class-devupstream = "linux-yocto-upstream"
+KBRANCH:class-devupstream = "v6.12/base"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+LINUX_VERSION ?= "6.12.3"
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
+KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc cfg/net/mdio.scc"
+KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("KERNEL_DEBUG", "True", " features/reproducibility/reproducibility.scc features/debug/debug-btf.scc", "", d)}"
+# libteam ptests from meta-oe needs it
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/net/team/team.scc", "", d)}"
+# openl2tp tests from meta-networking needs it
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " cgl/cfg/net/l2tp.scc", "", d)}"
+KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
+
+INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
-- 
2.39.2


