Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web11.87994.1597843488269093891
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 06:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V6tsiT54;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id cs12so11220939qvb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2020 06:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1epMJSOTgY5Bd7qax1Kt/57URhisd5N5FEV2II/3m5Q=;
        b=V6tsiT54+wBAEZa1I4xXs+8z1rUPE4W130cqTDaFF+VHgNDC8UcEetW5aAsbZVA8Rs
         JiyhcjpuyMT3+2uF6v7FhqbWBwCrp6GojhMvoLyvkz0/brB3wE4qI+6Oy9ThMhKak52y
         OCikoTK6TDHSQzZdQZvp0Qlv48h1CK7yLOLcYdpZq0WU5fMR74JEXP3oYvoAJupl9Rr6
         UaLypyntGoG9EEH9JTlonoRkMy7JzOcZ+sI73vpW4h/MIDnSXNaPRXTcuRKF5/snt9jZ
         B7dR2yU45WjXO4wmj6VhD4DdGX8YdbYifk90Hs+TqiBUE8KQPctVUmIKYTN/NjS/Ez6v
         WoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1epMJSOTgY5Bd7qax1Kt/57URhisd5N5FEV2II/3m5Q=;
        b=fDq4mYKXmsrdQp6esl4DbEUtJPnqYJAQ63UkUhEDn7fSLeSJ5zc0uUhRF4mx3qKJ6T
         Odulv3iI9mUbKiDG9RfSEzDrKod8kaMOhuuhK+A2QGuldovJhOimYmfo87Czc3tUOMXV
         mFuk3r0DZmoJhunMuvqjkr1OCYDZ7siJK2JG9wjdgZlzL5gChU+Vs2ZeY6w65FobjBFD
         JT48c/tT/Czk/Kgc61zQelB9NOuQ1oOnmXj7jD7SBZX045rus7SzvTUvNH/84o1wIVbh
         OKaOu6wqRm4CLQ2N/iD5l8Jo7rtitZWVXQWEh7QrL7Bzakcp6DcUuBIp08R4nQj6obCO
         C2Pg==
X-Gm-Message-State: AOAM532E89SvEs8JE0y7LRuXkCSKmrljxy/ffG3FZDCxtJ5Q+DEhwL8c
	V0OnEGil30Ag5LSIdH4fVHE=
X-Google-Smtp-Source: ABdhPJwJ4ztF8N0b1ORAxwe4p0ificHKzErBcgo34xBM+vgHq+WYUMnr224H3Iil2VmcmilTdZiwBA==
X-Received: by 2002:a0c:9b96:: with SMTP id o22mr23920461qve.213.1597843487345;
        Wed, 19 Aug 2020 06:24:47 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id t93sm26873088qtd.97.2020.08.19.06.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 06:24:46 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto: introduce 5.8 reference kernel
Date: Wed, 19 Aug 2020 09:24:40 -0400
Message-Id: <3d23f85cdead73f26d1cd0da046ca6aa45674816.1597843173.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1597843173.git.bruce.ashfield@gmail.com>
References: <cover.1597843173.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Add the next set of "versioned" linux-yocto recipes that can be
used to build v5.8 upstream (v5.8/base) or 5.8 with some emedded
specific features (v5.8/standard/*).

Note: along with the new 5.8 content, the recipes have a tweaked
licence checksum, which The needs to be updated to account for kernel
commit 74835c7db0322b [COPYING: state that all contributions really
are covered by this file].

These have been built and booted for all supported qemu architectures.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.8.bb               | 44 +++++++++++++++
 .../linux/linux-yocto-tiny_5.8.bb             | 32 +++++++++++
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 54 +++++++++++++++++++
 3 files changed, 130 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.8.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
new file mode 100644
index 0000000000..11bd4579f8
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -0,0 +1,44 @@
+KBRANCH ?= "v5.8/standard/preempt-rt/base"
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
+SRCREV_machine ?= "581a55ca5571041bc5885febe8415c5751c489d9"
+SRCREV_meta ?= "4c62a6f4fa227abacf87f1593faa1ac6e6616156"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
+
+LINUX_VERSION ?= "5.8"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
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
+KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
new file mode 100644
index 0000000000..1d52bfeeba
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -0,0 +1,32 @@
+KBRANCH ?= "v5.8/standard/tiny/base"
+KBRANCH_qemuarm  ?= "v5.8/standard/tiny/arm-versatile-926ejs"
+
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+LINUX_VERSION ?= "5.8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+SRCREV_machine_qemuarm ?= "8c6b76ac37ee5c0f09ffff816a6519f3f8ea6582"
+SRCREV_machine ?= "581a55ca5571041bc5885febe8415c5751c489d9"
+SRCREV_meta ?= "4c62a6f4fa227abacf87f1593faa1ac6e6616156"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
+
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
+
+# Functionality flags
+KERNEL_FEATURES = ""
+
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
new file mode 100644
index 0000000000..f9d23072fd
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -0,0 +1,54 @@
+KBRANCH ?= "v5.8/standard/base"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+# board specific branches
+KBRANCH_qemuarm  ?= "v5.8/standard/arm-versatile-926ejs"
+KBRANCH_qemuarm64 ?= "v5.8/standard/qemuarm64"
+KBRANCH_qemumips ?= "v5.8/standard/mti-malta32"
+KBRANCH_qemuppc  ?= "v5.8/standard/qemuppc"
+KBRANCH_qemuriscv64  ?= "v5.8/standard/base"
+KBRANCH_qemux86  ?= "v5.8/standard/base"
+KBRANCH_qemux86-64 ?= "v5.8/standard/base"
+KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
+
+SRCREV_machine_qemuarm ?= "e6215284f772360ed2110b2f9b5ab5cfbeb60550"
+SRCREV_machine_qemuarm64 ?= "581a55ca5571041bc5885febe8415c5751c489d9"
+SRCREV_machine_qemumips ?= "421057004e4e9847219dc966ecebe3174bf9c670"
+SRCREV_machine_qemuppc ?= "581a55ca5571041bc5885febe8415c5751c489d9"
+SRCREV_machine_qemuriscv64 ?= "581a55ca5571041bc5885febe8415c5751c489d9"
+SRCREV_machine_qemux86 ?= "581a55ca5571041bc5885febe8415c5751c489d9"
+SRCREV_machine_qemux86-64 ?= "581a55ca5571041bc5885febe8415c5751c489d9"
+SRCREV_machine_qemumips64 ?= "b3f4fce505798c95cdce90a9551cbf68de7bd811"
+SRCREV_machine ?= "581a55ca5571041bc5885febe8415c5751c489d9"
+SRCREV_meta ?= "4c62a6f4fa227abacf87f1593faa1ac6e6616156"
+
+# remap qemuarm to qemuarma15 for the 5.8 kernel
+# KMACHINE_qemuarm ?= "qemuarma15"
+
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
+LINUX_VERSION ?= "5.8"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+KMETA = "kernel-meta"
+KCONF_BSP_AUDIT_LEVEL = "1"
+
+KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
+
+COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
+KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
+KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
-- 
2.19.1

