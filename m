Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9043AC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 04:31:14 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.22781.1704169874104559172
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 20:31:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RCGsPCoe;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-781753f52afso362729185a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 20:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704169873; x=1704774673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYMun9z4I7qgPoq4tZR7wEKJQAc5ohAsJi8eUSXizis=;
        b=RCGsPCoe/ZCwtdOQ4Ftf403kJHgXPXL4/3v9m9agFWh7pnMPCC8uCEfE68is9BOx40
         xRJeahm1sCBwER9SUW6A/zGSKu9qrLg7LHPwTU46ZWEDHSS+tD96n2Le6ZcmBaN7RjyI
         nSqV09TEjy6eHfQ3WZQxStm6puQ6cS/tY3XIRf+Us7bG6bCV8CWND86FwR5Jqq5q7hdZ
         aHqwP32GrMWzn9j8oerW649PEnGRCTyu4wfhJMF9K2AxJn+2fW0uimqSDpc9xpTClCno
         JcB8HmOXVtxT+KovilX/XJ0y9I/5OnSj8UK+JR4wea/3SgyFRc6uFo2IBsuMLqwwaDHU
         vHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704169873; x=1704774673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYMun9z4I7qgPoq4tZR7wEKJQAc5ohAsJi8eUSXizis=;
        b=L9u3Br3+074JQnlTyXkLG9xJCybwLRbeNLrGbAil/NwC1PffzLGKd6hj+eY/SjF4V2
         lfJQP97zMJLN2enaNfSiI70lE+5BL9e8FE4f/AAOED+IZQ5U8bl06m/bLpZaf1kRgE4g
         1FvWeWduaXTJgotD4oceqtl1NnDLSyheinzMyRcWLhB2sfr1Ev3NS3w8qPhoK+De8axA
         eXgV/tUJ9vy3wa75muJEVMBljYKSjQ1qhy0QH6GqL4aXdwia9Tz6l+DJOsOLhSE1Nnmw
         8iXP49/0i/IQkkx3xyEVMZnapq9Xobx7W8ODv4URoz2sBmNHP7FoXNb1edV5FlTJC+1K
         MAMw==
X-Gm-Message-State: AOJu0YyEbzhbAqrR8jh60RqvpsU/0txbysD9lhlbK1baY47n4xCu25XD
	W6en9sY+B1O6SxI3sE33dX2lrkqmUCCMy579TMs=
X-Google-Smtp-Source: AGHT+IEXaPkbndbU8RgGV87QEgD0ENcDZq/rSFtGrGx1OAopBn+D82kExYHaWwRqfr5gjzsjX2mx8A==
X-Received: by 2002:a05:620a:9c4:b0:781:6e32:a894 with SMTP id y4-20020a05620a09c400b007816e32a894mr10079872qky.39.1704169872970;
        Mon, 01 Jan 2024 20:31:12 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t1-20020a05620a004100b00781df3924f3sm39045qkt.129.2024.01.01.20.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 20:31:12 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yocto: introduce 6.6 reference kernel
Date: Mon,  1 Jan 2024 23:31:04 -0500
Message-Id: <f9768e191cfbb8d50f5145dafa584bb94abcbb26.1704169585.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704169585.git.bruce.ashfield@gmail.com>
References: <cover.1704169585.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 04:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193198

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Adding the linux-yocto recipes for the 6.6 reference kernel. This
is a -lts upstream release and will be supported for the same
duration as upstream.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               | 48 +++++++++++++
 .../linux/linux-yocto-tiny_6.6.bb             | 33 +++++++++
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 72 +++++++++++++++++++
 3 files changed, 153 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.6.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
new file mode 100644
index 0000000000..0c0ce6afea
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -0,0 +1,48 @@
+KBRANCH ?= "v6.6/standard/preempt-rt/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion_6.5.inc
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
+SRCREV_machine ?= "bce0cb6bbe24682d839c3e212270e3744e32aabe"
+SRCREV_meta ?= "8ab17895c185426442d80a60829619270f9ac51d"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
+
+LINUX_VERSION ?= "6.6.6"
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
+KERNEL_FEATURES:append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
new file mode 100644
index 0000000000..edb8001069
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -0,0 +1,33 @@
+KBRANCH ?= "v6.6/standard/tiny/base"
+
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion_6.6.inc
+
+LINUX_VERSION ?= "6.6.6"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine ?= "09118b4441395fadf233eec03e2b68e7d6d63cdd"
+SRCREV_meta ?= "8ab17895c185426442d80a60829619270f9ac51d"
+
+PV = "${LINUX_VERSION}+git"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
+
+COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
+
+# Functionality flags
+KERNEL_FEATURES = ""
+
+KERNEL_DEVICETREE:qemuarmv5 = "arm/versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
new file mode 100644
index 0000000000..4fa6c505f5
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -0,0 +1,72 @@
+KBRANCH ?= "v6.6/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
+include recipes-kernel/linux/cve-exclusion_6.6.inc
+
+# board specific branches
+KBRANCH:qemuarm  ?= "v6.6/standard/arm-versatile-926ejs"
+KBRANCH:qemuarm64 ?= "v6.6/standard/qemuarm64"
+KBRANCH:qemumips ?= "v6.6/standard/mti-malta32"
+KBRANCH:qemuppc  ?= "v6.6/standard/qemuppc"
+KBRANCH:qemuriscv64  ?= "v6.6/standard/base"
+KBRANCH:qemuriscv32  ?= "v6.6/standard/base"
+KBRANCH:qemux86  ?= "v6.6/standard/base"
+KBRANCH:qemux86-64 ?= "v6.6/standard/base"
+KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
+KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
+
+SRCREV_machine:qemuarm ?= "8a23d09163eedc42ed63f2741ae2fa7d8aa926aa"
+SRCREV_machine:qemuarm64 ?= "09118b4441395fadf233eec03e2b68e7d6d63cdd"
+SRCREV_machine:qemuloongarch64 ?= "09118b4441395fadf233eec03e2b68e7d6d63cdd"
+SRCREV_machine:qemumips ?= "a0a00df5c1cd3cdd346f410f71998a120e284f78"
+SRCREV_machine:qemuppc ?= "09118b4441395fadf233eec03e2b68e7d6d63cdd"
+SRCREV_machine:qemuriscv64 ?= "09118b4441395fadf233eec03e2b68e7d6d63cdd"
+SRCREV_machine:qemuriscv32 ?= "09118b4441395fadf233eec03e2b68e7d6d63cdd"
+SRCREV_machine:qemux86 ?= "09118b4441395fadf233eec03e2b68e7d6d63cdd"
+SRCREV_machine:qemux86-64 ?= "09118b4441395fadf233eec03e2b68e7d6d63cdd"
+SRCREV_machine:qemumips64 ?= "971214747a173452ae3ab4c6dcf1d91451b6e9be"
+SRCREV_machine ?= "09118b4441395fadf233eec03e2b68e7d6d63cdd"
+SRCREV_meta ?= "8ab17895c185426442d80a60829619270f9ac51d"
+
+# set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
+# get the <version>/base branch, which is pure upstream -stable, and the same
+# meta SRCREV as the linux-yocto-standard builds. Select your version using the
+# normal PREFERRED_VERSION settings.
+BBCLASSEXTEND = "devupstream:target"
+SRCREV_machine:class-devupstream ?= "a06ca85b22f6c7f4e6dd1447ca50ded6f54ebb5e"
+PN:class-devupstream = "linux-yocto-upstream"
+KBRANCH:class-devupstream = "v6.6/base"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+LINUX_VERSION ?= "6.6.6"
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
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
+KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
+
+INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+
-- 
2.39.2


