Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815EBC001DF
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 03:20:37 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.32110.1688959234303748243
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jul 2023 20:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=naxpl2xh;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-635e0e6b829so32107796d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 20:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688959233; x=1691551233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMu8ecCxF5TBvCuVdX0UNgQn/+3wB5QYF8NKAu77INc=;
        b=naxpl2xh4kjfVLoFGOhFEZp2moBdwdq+s1psA27Ji8UQxSTO0/SaDwP/sKfo/LMlPd
         4nSM9sG0+k31alK4VKvDXHEH8ix7wXFX9ANp8/ab0WFk5jUdTgAHDs9zHp+C6KvtsqIf
         JFEpy60nkXHctG7FZNs+5Oickc6Ojxtnk80pgHzLfLs/9Xtp1VTyRtGXvynSfyEocjMP
         khXhOJLYnPKf66QLCx7zAX9frG3vmLsjQqIzjbyTb2sKJPyXHE7K0Y+vLZPTkIXUPgd5
         mQJO0I/94igFOcwc7fVf0Bz/+iPX460f6u6OZvWlCWw6wBhC9BZ4LVcUo2I1sHQLDT64
         lcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688959233; x=1691551233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMu8ecCxF5TBvCuVdX0UNgQn/+3wB5QYF8NKAu77INc=;
        b=Kyzwsr+RFh6lQNZyo7g//oJkeNaKOPr2N21IkyLTwA/a3/q6aOSwQRvYqHuF+bbvRi
         ygCvVyRdg7H2F3k7us0ITc/iQDXhLeZk/jpdYzXeQgjzL5UMtcStZfZISI2Naxt9uZBP
         3eD+Fo0DMkCgjjTyBoriY4HdBeTmwsNYoohlfYHpwseLSx+G28AZD2hVOUDmYtqNYa3I
         teVNiYYj9YXCMWZ+HJCVqK3SxLQ1oWW+1WAIGiuafvi5NMvK6Spv0rtPf2lpqvPZ7nVP
         JJjZbUgMaBoOKGt20BubMnYChEyXUXTb7wqi+mMtX8v2lQTsZTDmHX23P+dk66Iy/jDw
         huMw==
X-Gm-Message-State: ABy/qLaUT4D6zqePaVPtMKagOk4WEpgIZICSjlvfr9ddLa41ehXnCIQw
	76P4kWpyssesqwpnMebsJmhiEQPn4jg=
X-Google-Smtp-Source: APBJJlEgrQBhD9497yBnhK2j6XciIDvOY+ANI56FuVoTbdetEffW9L713RUVtbPGOpx3K5B3HGaXdQ==
X-Received: by 2002:a0c:e481:0:b0:631:eb39:b7a6 with SMTP id n1-20020a0ce481000000b00631eb39b7a6mr10709995qvl.33.1688959233323;
        Sun, 09 Jul 2023 20:20:33 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d15-20020a0cf0cf000000b00630228acc45sm5039863qvl.145.2023.07.09.20.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 20:20:32 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/15] linux-yocto: introduce 6.4 reference kernel recipes
Date: Sun,  9 Jul 2023 23:20:17 -0400
Message-Id: <51aabb4e55bdcd973c10acdc9606415825a126f6.1688958789.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688958788.git.bruce.ashfield@gmail.com>
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 03:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184048

From: Bruce Ashfield <bruce.ashfield@gmail.com>

kernel v6.4.x will be the next yocto project reference kernel.

This is largely the same as the 6.1 recipes, with only SRCREV and
minor differences.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.4.bb               | 48 +++++++++++++
 .../linux/linux-yocto-tiny_6.4.bb             | 33 +++++++++
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 71 +++++++++++++++++++
 3 files changed, 152 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.4.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
new file mode 100644
index 0000000000..2558c03a7f
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -0,0 +1,48 @@
+KBRANCH ?= "v6.4/standard/preempt-rt/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion_6.4.inc
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
+SRCREV_machine ?= "48cdae83316b7055b4e63f3434ea26b0c04d7c71"
+SRCREV_meta ?= "f15c15c0755e36ec185927dd83a8a569186836eb"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
+
+LINUX_VERSION ?= "6.4"
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
+COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)$"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
new file mode 100644
index 0000000000..5c8008232b
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -0,0 +1,33 @@
+KBRANCH ?= "v6.4/standard/tiny/base"
+
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion_6.4.inc
+
+LINUX_VERSION ?= "6.4"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
+SRCREV_meta ?= "f15c15c0755e36ec185927dd83a8a569186836eb"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
+
+COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
+
+# Functionality flags
+KERNEL_FEATURES = ""
+
+KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
new file mode 100644
index 0000000000..e3e6e54d64
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -0,0 +1,71 @@
+KBRANCH ?= "v6.4/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion_6.4.inc
+
+# board specific branches
+KBRANCH:qemuarm  ?= "v6.4/standard/arm-versatile-926ejs"
+KBRANCH:qemuarm64 ?= "v6.4/standard/qemuarm64"
+KBRANCH:qemumips ?= "v6.4/standard/mti-malta32"
+KBRANCH:qemuppc  ?= "v6.4/standard/qemuppc"
+KBRANCH:qemuriscv64  ?= "v6.4/standard/base"
+KBRANCH:qemuriscv32  ?= "v6.4/standard/base"
+KBRANCH:qemux86  ?= "v6.4/standard/base"
+KBRANCH:qemux86-64 ?= "v6.4/standard/base"
+KBRANCH:qemuloongarch64  ?= "v6.4/standard/base"
+KBRANCH:qemumips64 ?= "v6.4/standard/mti-malta64"
+
+SRCREV_machine:qemuarm ?= "fccbb53f81908991a69214e09ae0eea360410617"
+SRCREV_machine:qemuarm64 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
+SRCREV_machine:qemuloongarch64 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
+SRCREV_machine:qemumips ?= "8370d3d4823bcff9532dd6bb163359f75a5416cd"
+SRCREV_machine:qemuppc ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
+SRCREV_machine:qemuriscv64 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
+SRCREV_machine:qemuriscv32 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
+SRCREV_machine:qemux86 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
+SRCREV_machine:qemux86-64 ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
+SRCREV_machine:qemumips64 ?= "efe0a0701a1a8c5b6113d6a06b65857f8c84ac9f"
+SRCREV_machine ?= "154c43de4e13946ccecf0ff13772db6c2adba355"
+SRCREV_meta ?= "f15c15c0755e36ec185927dd83a8a569186836eb"
+
+# set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
+# get the <version>/base branch, which is pure upstream -stable, and the same
+# meta SRCREV as the linux-yocto-standard builds. Select your version using the
+# normal PREFERRED_VERSION settings.
+BBCLASSEXTEND = "devupstream:target"
+SRCREV_machine:class-devupstream ?= "0f4ac6b4c5f00f45b7a429c8a5b028a598c6400c"
+PN:class-devupstream = "linux-yocto-upstream"
+KBRANCH:class-devupstream = "v6.4/base"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+LINUX_VERSION ?= "6.4"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "1"
+
+KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
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
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
+KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
+
+INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+
-- 
2.34.1


