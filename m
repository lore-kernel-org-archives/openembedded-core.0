Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEA9C624DB
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:23:18 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12762.1788355390086577558
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 06:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z0CH2S6m;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-90e7d9c747eso13017956d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 06:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788355389; x=1788960189; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kwnfUrt0J3rfGGu2uPye5LQe/ptQvmWlZXFGYd1ZnSw=;
        b=Z0CH2S6mx6qXcGLvWiYEzohjFPHaUOdgikIurNHTOvwg5X3oYipZaj7wPayY20LxTn
         MkF1qNyTWqesAuBByZzqKwFzjbK8l2u6Xy7kwjQ1PN4hS0TedZ/q+gqwcjkxRE8tZWSn
         0BLHusPIPSDYnmK1I4tNP7U9O7hArrCeIHGEFcjOjXTE1KjQp0bCdUAlrGvGg81PIhtV
         /iCuTmIEiSV4KNaO/+Jomhf5wHzVYrp2cNYzgQ0LL4BMTwPRHEwbZShWZO48C7pWsw6C
         UjXw3B59EyGDvbDCpzcH252BFg1F7exwxeNtP58coOWb7kOBBZIXCVzzBwzgx7/Pl5UV
         NXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355389; x=1788960189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kwnfUrt0J3rfGGu2uPye5LQe/ptQvmWlZXFGYd1ZnSw=;
        b=nQY1ml919AemDLD/ai0BB0K8Z2FAf1SiPJv0sZifwrrCd9DQMPsQ/qm3twDc0Ui4qG
         eCanp/LtkjS6JVws77on8t4PJBa7T6s77rYlukqR7Lz13gB7zi22ObMgBks54JP/Aa1m
         tp6Q/+oelP9sp95XlE5QlgrInxTqrHrF4V+42rbLJdym++HdSOQ4sQ2o3XA8PmILZb+1
         Sao4JysgXjd/oljSFTTAo+fBvbONdB01k89fss0qeAxBVdXRIZFnNVz3sceOsMdhfssF
         0vgxOifp80MOYZL3syRecuclL9ImASWQ0RFGYxrVlO9OAn8AFCfJD9dGPaWdFbUM/QsU
         EiQg==
X-Gm-Message-State: AFuF++nXi2qH7eICRlg81YJI0+FPcyOr1Q0JpRovfWEyxkN1axn1Hr2l
	oGDM8AAjlmVBOK2Qywt8t8m233usrq4jUajGKV05e+FJmLb5K4Jye5+ucur+0+73
X-Gm-Gg: AYBFou0kWDu9iQ30uta9Zm0MP+BbYjWDP7jRbLYuvvSjz4wN4vijyWCaTtdJAEJKTIN
	ZE4UarS6e9FrTTNRqY5u5kytSsR4QWS+fSKGx5xoI+r4i/1e67PsB6bXMRjPHE6obQZKy5lvyV2
	84nV92U7cMrMaKw2c/YJ1iUzHlcVmGwpJAfe1SeuPVJHYZ1BoYc7eqgkaWFV4KczGkXLsUgc4Rr
	aIG2bbo50wUSrR+NvVTdd0/9rAMzPP19hi7sGe0uLXRj+Izqj1DHPrxInoMp3B5Idyr6rRvmy9m
	sPhY3Dn04TjkNWDBF3AlPiyK3HtcYMBWylf2sTb1HqPWZNQ+hXPs8uxDWWbtJrf6XWYe+UryMOf
	pMp7NvyVFCdDkGTN1Xb4vwpJoLaJxNJ9HDA8bhn76QjsJ0Z7oZNwqux1VzgX6BsuXk2wa9/9s5/
	PpL+Uh1EILUumoZNSZvnKEROL6oI5TBX7PF+EvJdYwi7XIkWjshE8rx1WgqhejDD+QON0DN/gGR
	k7t9cw9i/BpxPJCh7H14R5xdlb/ve3F+s6+e8NVYXQVXDHNJjCTpfseFv5/jaPo0kbXN+Xp1Ov9
	t7ptW8fvaka15Ae3oDyifm28fiMVKHGro/oPlEBgPKjROsYm6+UjKMaJFKdLzV7Z3Y9ykY3Ke0O
	cn1rHDPHChFfQrUY=
X-Received: by 2002:a05:6214:85c5:20b0:910:2faf:8ed3 with SMTP id 6a1803df08f44-9102faf8efbmr24269726d6.20.1788355388696;
        Wed, 02 Sep 2026 06:23:08 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee43763sm18059076d6.22.2026.09.02.06.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:23:08 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 01/07] linux-yocto/7.2: introduce reference kernel recipes
Date: Wed,  2 Sep 2026 09:22:58 -0400
Message-ID: <20260902132305.3685228-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902132305.3685228-1-bruce.ashfield@gmail.com>
References: <20260902132305.3685228-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 13:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244949

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


