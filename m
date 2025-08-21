Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9B4CA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 14:03:32 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.10285.1755785007385924533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 07:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LZcFWpG/;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4b109919a09so13006431cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 07:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755785006; x=1756389806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FiNpjnYwmc9DhE3fKx+VB5RNebmuALRcMEGA89frTI=;
        b=LZcFWpG/FDAdLcc0wvgu+sjAoS7qC7KJRl7DLv2iKPoK+wExM0+oYrmPZ9A2mMpw8t
         Ismqed/jxVNp7PUVzjGvf2CrbuR5QII1HZ9eBf9gbsSvrIyZxXI4ikCRNU2GBixSj6r+
         Nl849944vJt6lAPDusYUT/QW7K7B1IfgWmUr30oe3oZGBy68+VRJrDPSo6ZxvD7hRs7D
         +X+dA1ClJ/Eq9drT9yn6xyNRBZ66uZRBnZxZuDyTaW4sLsniGl4aeihWIs8QTkDla+AL
         UAwQks4UxFuEyNyAPInRmKu9O3Wo5oRTIX1Ip/5pGX6SfEsxDjQLVbJIw0rkfkB+ccvc
         Xu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755785006; x=1756389806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0FiNpjnYwmc9DhE3fKx+VB5RNebmuALRcMEGA89frTI=;
        b=Q/uNvMnv6IgQRP1jglqsxZ7bKlj+XVYMbueEYOgUaqpI+6OKQAQiTjj22w31AoeEwB
         0u6X2XHD9qM3uTOYBsZcU1VDwhYZ4jo48EdQb11shyWvr1VU5YqDSpsYo0OT8hFKLHPK
         8NZ8/Cw6HZwn10uiBIZoyrLp3hggeL5iCQ9Ph+nmZd7a2zeVLYBfgemrgj+WXzE9zebj
         +vmV2kHFiFkCcXQd5JbClGPQ+n1MePep8aI7bTuxL7znImYpoYMXIYvYGrsbfPvxaInx
         +iYE45psEGJT2UphbwaHuA6jkcnuNXXDSasZrxvH7vCt/sYB7GYiqREUpga2iSQ+lRw3
         Ee4w==
X-Gm-Message-State: AOJu0Yx83/kIZk1brwk2FilGZnW4yaJZjr0AeM9fQoNe/Zs7Efx0iasK
	RoREDDDxSl0M9TL5Eba1c42nnCVjcyPvHz3ZkFLTKiKZbtCnwanojM+G
X-Gm-Gg: ASbGncvO9+YyHyHH1SPWTygwI5ubVEGOVBkmVAz139Pk2X6UStdCl6vgnAFzjCyywkW
	QS384aQn5qklLfMXRDhYZ4Ui8Wb/auS78EU2AgTxXoKucjCLPWnIaCUCibqree7Gd59i2biWVIu
	knRF3nwlzM8CdIf3pJCBZLwNYp/JJtvU9jw+0XYfbxfTt33JstKWp7nG1hEY7WQNFOaFiyfb4ps
	ecUjeBee8knc/mbH0/bh9isRhFoj0h9IwFPjdPNVco32wOEIVHoM2gaEFVal4jomUolc8VVvBVO
	fCwqFakEeXvwQsKSB+PJ17EumRE2Rhl6yKqAnOqS0u/6YkZsGwUJ2AtsqhQ0SmfSTasn780Z/qi
	TA6RtKaM+hEH9EhgV7jagFp+P6cGtQ6AX5EJSnKTgZjleMCb39/BarbUaY0p00qFQ7k51hXWrgf
	69n/OqQM+gPzydfaXPTLB8zy4=
X-Google-Smtp-Source: AGHT+IF4VukE+7A6HEg0+U/7MOaqNBIkfhFweSJEaSyKXhKCkmA6oq8cBuIC10S3XTvhIzd7wT4Qyw==
X-Received: by 2002:a05:622a:c3:b0:4b2:9eec:b0b5 with SMTP id d75a77b69052e-4b29fa0c930mr22484211cf.3.1755785005610;
        Thu, 21 Aug 2025 07:03:25 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11ddd693asm100447711cf.37.2025.08.21.07.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 07:03:25 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto: introduce 6.16 reference kernels
Date: Thu, 21 Aug 2025 10:03:19 -0400
Message-Id: <2ad5687ad34f97c92f18ddb584ddf8c9d6e0ef8d.1755784780.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1755784780.git.bruce.ashfield@gmail.com>
References: <cover.1755784780.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 14:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222241

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Adding the 6.16 reference kernels as our latest reference for
the fall 2025 release.

This has been tested against:

  - x86, x86-64
  - ppc
  - mips, mips64
  - arm, arm64
  - riscv32, riscv64

The -standard, -rt and -tiny variantes have been validated.

For various iamges. All testing done under qemu, hardware
references will follow later.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.16.inc              |  0
 .../linux/linux-yocto-rt_6.16.bb              | 48 +++++++++++
 .../linux/linux-yocto-tiny_6.16.bb            | 33 ++++++++
 meta/recipes-kernel/linux/linux-yocto_6.16.bb | 79 +++++++++++++++++++
 4 files changed, 160 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/cve-exclusion_6.16.inc
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.16.bb

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.16.inc b/meta/recipes-kernel/linux/cve-exclusion_6.16.inc
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
new file mode 100644
index 0000000000..a5046cb38e
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -0,0 +1,48 @@
+KBRANCH ?= "v6.16/standard/preempt-rt/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion_6.16.inc
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
+SRCREV_machine ?= "0efe352ff92817ba56a91bfe983e96cd55c76940"
+SRCREV_meta ?= "1fedc277abf169c6032ea77d5d61be91dba9f0df"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
+
+LINUX_VERSION ?= "6.16.2"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
new file mode 100644
index 0000000000..df2b0a67b2
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -0,0 +1,33 @@
+KBRANCH ?= "v6.16/standard/tiny/base"
+
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion_6.16.inc
+
+LINUX_VERSION ?= "6.16.2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
+SRCREV_meta ?= "1fedc277abf169c6032ea77d5d61be91dba9f0df"
+
+PV = "${LINUX_VERSION}+git"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
+
+COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
+
+# Functionality flags
+KERNEL_FEATURES:append:qemuall = " cfg/virtio.scc cfg/fs/ext4.scc"
+
+KERNEL_DEVICETREE:qemuarmv5 = "arm/versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
new file mode 100644
index 0000000000..4c070b0b2c
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -0,0 +1,79 @@
+KBRANCH ?= "v6.16/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
+include recipes-kernel/linux/cve-exclusion_6.16.inc
+
+# board specific branches
+KBRANCH:qemuarm  ?= "v6.16/standard/arm-versatile-926ejs"
+KBRANCH:qemuarm64 ?= "v6.16/standard/base"
+KBRANCH:qemumips ?= "v6.16/standard/mti-malta32"
+KBRANCH:qemuppc  ?= "v6.16/standard/qemuppc"
+KBRANCH:qemuriscv64  ?= "v6.16/standard/base"
+KBRANCH:qemuriscv32  ?= "v6.16/standard/base"
+KBRANCH:qemux86  ?= "v6.16/standard/base"
+KBRANCH:qemux86-64 ?= "v6.16/standard/base"
+KBRANCH:qemuloongarch64  ?= "v6.16/standard/base"
+KBRANCH:qemumips64 ?= "v6.16/standard/mti-malta64"
+
+SRCREV_machine:qemuarm ?= "5b1e57ea06450da46fd00359cfbd11d26ffd1cd5"
+SRCREV_machine:qemuarm64 ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
+SRCREV_machine:qemuloongarch64 ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
+SRCREV_machine:qemumips ?= "19cfa2226631af5c18647b69eba294619e1b7323"
+SRCREV_machine:qemuppc ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
+SRCREV_machine:qemuriscv64 ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
+SRCREV_machine:qemuriscv32 ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
+SRCREV_machine:qemux86 ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
+SRCREV_machine:qemux86-64 ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
+SRCREV_machine:qemumips64 ?= "dea33382cd8394c214422ebead1a2e08a4832c90"
+SRCREV_machine ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
+SRCREV_meta ?= "1fedc277abf169c6032ea77d5d61be91dba9f0df"
+
+# set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
+# get the <version>/base branch, which is pure upstream -stable, and the same
+# meta SRCREV as the linux-yocto-standard builds. Select your version using the
+# normal PREFERRED_VERSION settings.
+BBCLASSEXTEND = "devupstream:target"
+SRCREV_machine:class-devupstream ?= "25bf10be219d37d2fb221c93816a913f5f735530"
+PN:class-devupstream = "linux-yocto-upstream"
+KBRANCH:class-devupstream = "v6.16/base"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+LINUX_VERSION ?= "6.16.2"
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


