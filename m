Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B377C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 11:25:19 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5279.1787311517617546226
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 04:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=D/41atAL;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7f3faf2b081so835630a34.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 04:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787311517; x=1787916317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kwnfUrt0J3rfGGu2uPye5LQe/ptQvmWlZXFGYd1ZnSw=;
        b=D/41atALPfV2S+W4ydcyIJuAf09HxKDOt3w+5ySMt/Pn8yV4f/wz7JB9BRiaXXVtoE
         QJ939HR50k4g0pB6vlUWUDwGpzjuZccbR7CKzxqtFP35P5/3rxbdVUhxC8my5n8e5gnr
         n7m0W6k66MMx2kKcfmqLFyKhhRGmJne+VaEh1AVTUFWT//czvvLW3V8LpmCObWWEFLEX
         C/z14iez17PMcLBmaHAdSepAl3B7yOp8103V2uvG2vb4YzXWH2A41AQGq4Qs4rcTuVzU
         FTspHhDqjJUTha91xkx7umE3ML+GnBQsr3Vjh3PGAB37MAnW7S3iG60y+iAS+2WrwhQq
         FwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787311517; x=1787916317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kwnfUrt0J3rfGGu2uPye5LQe/ptQvmWlZXFGYd1ZnSw=;
        b=igzd1epPJ24FC27dr1JzFM3cRkOaZh0JbRbzkQCnw/95KGeMuHnHiQM0BGubKexsq5
         9PlJ5Um/Uz91eXXhPdIAnLySs4+I5Si8ySxzU6xmJDvZ1WELHZQfUsq9kqURQzN9knfu
         UPSUdksO2q9PILwsmzDyiPWTKa57WzK/yzm6o4fAU4mPKgk/4HFZzhOMmNfsryIn5PFm
         tiIaMIC/+ewzcMblImbxGOH6DpwwKBDQAUac5p9uTTZ6vwWcV2p01qgy/XbJhDFe1rSq
         ijpxtsgynDJil+o14BGvHg+bI+HzHYrsN8X9IIsVEsm2tG6qKuR34jRQW8lZz1mQ6UVD
         ecEg==
X-Gm-Message-State: AOJu0YzjH694puyA+ObPvZVgVe2iF/7Kj8nr5iDO4u4uHRKOEAHlOR/V
	pg5YYMimJsb9v7Q1F3PIPOe80qEwmMnRg9JjeOPf+KAXBGKiezuDZEBnJwf3pwi5
X-Gm-Gg: AR+sD11cNJBGo3x2ZNbT7BrrOPvGmHHrAA8bkXAeYx8aQ2Cp2uLugtT5+I2KaXokvfj
	880E0XZ9A7EsEqoLQjpaf9ugCYo09A0vVoI9LiREFJ7niPJYGoqO2SD7quxDLDeqNUw2QrsIMQN
	WXqeOkPClDUxur8Zntii1LB8HR7XphUgnlM10M3KUJzLFPLVyTs7Q3bqxlVT33iw6DHLlhbX9Wt
	Z6lGcacdpKxKBg0Uvstllx4/eOtfC9DMtgvbT1u1vwEV9c5whG2ReAsoEHPX0GRWmbJUJIJMmDM
	Wy6TaxCSbiziirBMRxr4CycNwcXNS0r+whDXJmFIkg493r6zEP7nk+Sx5E9y4/Irztuetsb4kx9
	BHw1iWvIQyWCoGt5pB3yBdHxM9iki/Af+0TqZNd/amxsme3ZBrC/WY1DqmyM8jOWsVuFZDuaL2E
	2MUysdQbrna/OXP9lYQh2hRvBdXtNOg/bBiao80y8J9vxI8xjNoYMWKre/PJBzwXWzWWJo8LNpw
	pKIg264d4Syem6wscrewuSPXsoSXoBB3yXB8otCyf1yoJsvA2nf2bgEvodSeQal72+y1oJrEGOc
	VqzpOibKJl/tdnVh3OHw6C9icW9ua+ZtuMtDwqCjZv0rmWEmHBwaKfapj9fDCSipzC7+rwwiMAg
	Rl0aV
X-Received: by 2002:a05:6830:8383:b0:7e9:e85d:2f7f with SMTP id 46e09a7af769-7f4619202c3mr6048112a34.14.1787311516630;
        Fri, 21 Aug 2026 04:25:16 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f43fe70792sm7398018a34.5.2026.08.21.04.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:25:15 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 03/06] linux-yocto/7.2: introduce reference kernel recipes
Date: Fri, 21 Aug 2026 07:25:05 -0400
Message-ID: <20260821112509.861559-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821112509.861559-1-bruce.ashfield@gmail.com>
References: <20260821112509.861559-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 11:25:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243927

From: Bruce Ashfield <bruce.ashfield@gmail.com>

7.2 is our next versioned reference kernel. The standard, preempt-rt
(v7.2-rc4-rt3) and tiny variants are all generated and available.

Signed SRCREVs point at the freshly generated v7.2 branches; the kmeta
tracks the yocto-7.2 branch.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_7.2.bb               | 49 ++++++++++++
 .../linux/linux-yocto-tiny_7.2.bb             | 34 ++++++++
 meta/recipes-kernel/linux/linux-yocto_7.2.bb  | 78 +++++++++++++++++++
 3 files changed, 161 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_7.2.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
new file mode 100644
index 0000000000..64b1c0affe
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb
@@ -0,0 +1,49 @@
+KBRANCH ?= "v7.2/standard/preempt-rt/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
+include recipes-kernel/linux/cve-exclusion_7.2.inc
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
+SRCREV_machine ?= "1177250341f415eb484ad60cbef9107d4fca08c8"
+SRCREV_meta ?= "a594a8179dfd8d677083ab6389616f3d1223c396"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-7.2;destsuffix=${KMETA};protocol=https"
+
+LINUX_VERSION ?= "7.2"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
new file mode 100644
index 0000000000..e494b22e4f
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb
@@ -0,0 +1,34 @@
+KBRANCH ?= "v7.2/standard/tiny/base"
+
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
+include recipes-kernel/linux/cve-exclusion_7.2.inc
+
+LINUX_VERSION ?= "7.2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
+SRCREV_meta ?= "a594a8179dfd8d677083ab6389616f3d1223c396"
+
+PV = "${LINUX_VERSION}+git"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-7.2;destsuffix=${KMETA};protocol=https"
+
+COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
+
+# Functionality flags
+KERNEL_FEATURES:append:qemuall = " cfg/virtio.scc cfg/fs/ext4.scc"
+
+KERNEL_DEVICETREE:qemuarmv5 = "arm/versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_7.2.bb b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
new file mode 100644
index 0000000000..b684c0590e
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_7.2.bb
@@ -0,0 +1,78 @@
+KBRANCH ?= "v7.2/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
+
+# board specific branches
+KBRANCH:qemuarm  ?= "v7.2/standard/arm-versatile-926ejs"
+KBRANCH:qemuarm64 ?= "v7.2/standard/base"
+KBRANCH:qemumips ?= "v7.2/standard/mti-malta"
+KBRANCH:qemuppc  ?= "v7.2/standard/qemuppc"
+KBRANCH:qemuriscv64  ?= "v7.2/standard/base"
+KBRANCH:qemuriscv32  ?= "v7.2/standard/base"
+KBRANCH:qemux86  ?= "v7.2/standard/base"
+KBRANCH:qemux86-64 ?= "v7.2/standard/base"
+KBRANCH:qemuloongarch64  ?= "v7.2/standard/base"
+KBRANCH:qemumips64 ?= "v7.2/standard/mti-malta"
+
+SRCREV_machine:qemuarm ?= "6d22d24315883bd227182ee7af003f563820821c"
+SRCREV_machine:qemuarm64 ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
+SRCREV_machine:qemuloongarch64 ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
+SRCREV_machine:qemumips ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
+SRCREV_machine:qemuppc ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
+SRCREV_machine:qemuriscv64 ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
+SRCREV_machine:qemuriscv32 ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
+SRCREV_machine:qemux86 ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
+SRCREV_machine:qemux86-64 ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
+SRCREV_machine:qemumips64 ?= "ab0e33fefa2a3d0366b2b8deb7cfb3be2d8dc436"
+SRCREV_machine ?= "d8eb6bd48aa600ae8ceb8e3a37c2bde59c581e3d"
+SRCREV_meta ?= "a594a8179dfd8d677083ab6389616f3d1223c396"
+
+# set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
+# get the <version>/base branch, which is pure upstream -stable, and the same
+# meta SRCREV as the linux-yocto-standard builds. Select your version using the
+# normal PREFERRED_VERSION settings.
+BBCLASSEXTEND = "devupstream:target"
+SRCREV_machine:class-devupstream ?= "8d3ae59288f1e7d58d76558a6ee96d533bc5019f"
+PN:class-devupstream = "linux-yocto-upstream"
+KBRANCH:class-devupstream = "v7.2/base"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-7.2;destsuffix=${KMETA};protocol=https"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+LINUX_VERSION ?= "7.2"
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
2.43.0


