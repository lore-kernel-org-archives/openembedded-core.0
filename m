Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84F0C67871
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 00:39:14 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.59788.1673224751678344916
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 16:39:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GI38JdBT;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id c7so6700191qtw.8
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 16:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUYmyzZ8ohRYfyUvkiau6R9lqceWq5OwoC7290f1ghQ=;
        b=GI38JdBT7MD3SiLdzd8R9R0toqNqoQeUzz3pP3r1MNZ26Mb8sJGoVJ+Tn+QSfBBdVM
         yL5xWjn6yV17S5osZ3oRoLFjunhVKqXAd0oSmfpHnH6is6fCmfEogcmQGx+gjftlWpwE
         Y7gt3luWBXnZ8Atsby70OtUREXhMPwLbYItAx6e0pkdnSzwciwTtgoKEBoCxfAy7/Pf8
         GXFbRvT6tGC/ze2uBrvRPWciAu+GDGxL53y2SR6ab1uXNH186caaQp7zL1FS8ZbpJLfD
         7QX8m/er8KYAxppYGeSll/T3hXeCl1u2ppvh7P7VtJQoqvNjfL2GFkP6Ud86EqOZkUrM
         wTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UUYmyzZ8ohRYfyUvkiau6R9lqceWq5OwoC7290f1ghQ=;
        b=vlF5JWpWkMdoEvi0K5GE9NpMW0xVfbEnACILckzW0G7lQUzQREKPDAR8zM54+9MsrZ
         PkJRusHHvS5gjW0lnvehymJizOaDKZE/PdCBeS9eYumh1nANS8CrR9+CL2uu/shJ9YDs
         7Ix7FRvio2ebKE6BX2pXWNizMZq+1cB6duSf8CHqF1MerwiioGgGX0Lx4GVRcEOVM5SV
         KmvPNRPDNKIZnFiz2q7jOJ8+5NxvX5Osk6RrSVro40gL15sxLCNfPNVFSeA50UQK5OMo
         toa08tpeFvvQlVQHomWG5klx/N+xbTAp2qCDZ3bcMPSRs6aWES3ifXaMEoU7N5SV4UOj
         oxfQ==
X-Gm-Message-State: AFqh2krkaB6itcw4a+nccCnHBOWlci7f2OH44PJ8NKXIREWcBGrMZIFI
	Xg/Reiywvrr7JACEzivp09NAm5hP4tj4Pg==
X-Google-Smtp-Source: AMrXdXsP7mjUEP3B9Sk4x98edXLjk9aaVNMzRi0xU8R0vl70WL5nbCrgyMHcfvkxjJ1LYzjZd1TAXQ==
X-Received: by 2002:a05:622a:228e:b0:3a8:325:47e with SMTP id ay14-20020a05622a228e00b003a80325047emr93955939qtb.54.1673224750624;
        Sun, 08 Jan 2023 16:39:10 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id i1-20020a05620a248100b006fc9fe67e34sm4529980qkn.81.2023.01.08.16.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:39:09 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/14] linux-yocto: introduce v6.1 reference kernel recipes
Date: Sun,  8 Jan 2023 19:38:53 -0500
Message-Id: <08d4032eef45580b046fa8327d50036306eb3d7e.1673224444.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673224444.git.bruce.ashfield@gmail.com>
References: <cover.1673224444.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 00:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175647

From: Bruce Ashfield <bruce.ashfield@gmail.com>

6.1 is a LTS kernel, and our next reference kernel. Some new
features like rust support are not directly used, but will
be available to start testing.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               | 45 ++++++++++++
 .../linux/linux-yocto-tiny_6.1.bb             | 30 ++++++++
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 70 +++++++++++++++++++
 3 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.1.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
new file mode 100644
index 0000000000..3bcd2e516b
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -0,0 +1,45 @@
+KBRANCH ?= "v6.1/standard/preempt-rt/base"
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
+SRCREV_machine ?= "3c497011beb11a43a38acc273366ce0997bc10db"
+SRCREV_meta ?= "d2ea5dce4e8398b85b226c9b0f303584de8d9f30"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "6.1"
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
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
new file mode 100644
index 0000000000..32ec91dac8
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -0,0 +1,30 @@
+KBRANCH ?= "v6.1/standard/tiny/base"
+
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+LINUX_VERSION ?= "6.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine ?= "6b919643ad199903450791493de5791556c032b7"
+SRCREV_meta ?= "d2ea5dce4e8398b85b226c9b0f303584de8d9f30"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
+
+COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
+
+# Functionality flags
+KERNEL_FEATURES = ""
+
+KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
new file mode 100644
index 0000000000..6aab5982b5
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -0,0 +1,70 @@
+KBRANCH ?= "v6.1/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# board specific branches
+KBRANCH:qemuarm  ?= "v6.1/standard/arm-versatile-926ejs"
+KBRANCH:qemuarm64 ?= "v6.1/standard/qemuarm64"
+KBRANCH:qemumips ?= "v6.1/standard/mti-malta32"
+KBRANCH:qemuppc  ?= "v6.1/standard/qemuppc"
+KBRANCH:qemuriscv64  ?= "v6.1/standard/base"
+KBRANCH:qemuriscv32  ?= "v6.1/standard/base"
+KBRANCH:qemux86  ?= "v6.1/standard/base"
+KBRANCH:qemux86-64 ?= "v6.1/standard/base"
+KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
+
+SRCREV_machine:qemuarm ?= "09521916385d581a8ee0517f8279d28303f22d32"
+SRCREV_machine:qemuarm64 ?= "6b919643ad199903450791493de5791556c032b7"
+SRCREV_machine:qemumips ?= "0a86f820b067832e72b291c2310b0808618f66a6"
+SRCREV_machine:qemuppc ?= "6b919643ad199903450791493de5791556c032b7"
+SRCREV_machine:qemuriscv64 ?= "6b919643ad199903450791493de5791556c032b7"
+SRCREV_machine:qemuriscv32 ?= "6b919643ad199903450791493de5791556c032b7"
+SRCREV_machine:qemux86 ?= "6b919643ad199903450791493de5791556c032b7"
+SRCREV_machine:qemux86-64 ?= "6b919643ad199903450791493de5791556c032b7"
+SRCREV_machine:qemumips64 ?= "99437d8498c3e175f7e0f666e8a42fc942c65262"
+SRCREV_machine ?= "6b919643ad199903450791493de5791556c032b7"
+SRCREV_meta ?= "d2ea5dce4e8398b85b226c9b0f303584de8d9f30"
+
+# set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
+# get the <version>/base branch, which is pure upstream -stable, and the same
+# meta SRCREV as the linux-yocto-standard builds. Select your version using the
+# normal PREFERRED_VERSION settings.
+BBCLASSEXTEND = "devupstream:target"
+SRCREV_machine:class-devupstream ?= "094226ad94f471a9f19e8f8e7140a09c2625abaa"
+PN:class-devupstream = "linux-yocto-upstream"
+KBRANCH:class-devupstream = "v6.1/base"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+LINUX_VERSION ?= "6.1"
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
+COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32)$"
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


