Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id A7ACE7EC5D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 15:26:18 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id 31so111529548wrm.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 08:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fOoytzUOZOfmB4DVK06XIGxNc44TzgpmaRZFGj5/WFM=;
	b=fQgwaI9AtwJHwfuDLZWcLonnjuR4sfvKeYbKefFX6KSNdhGYWRlNoz4TzGSDZu5FtF
	fRHdn65760UAB3nr9eAM3i2oQvIw5ueh39cv+OzBKEXcSZq+qeiZMUen4RfIvA4gZ8Wm
	JH7mgvIcnj7+VextR6xnN4l/LEG+GJRg9+s/zwD7vy3UeQUqOK2+4PzVd/ICur0yA2Vk
	Q5XBqGEUcVox8F8vSOxbglu+5TqxUwwCwp6G6kwgdtAV4bHcMZ+PxMNEcNmTlJMjzweV
	d7DmxIBqwoLaXJDHreG0XoejABBIrb1pzJ9HgSaiyJWDl/VlKuXd/lPcDiVQJeQWBHky
	pcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fOoytzUOZOfmB4DVK06XIGxNc44TzgpmaRZFGj5/WFM=;
	b=oH+nk1o559c7avVaBDwFAgOpQ7wzAVSc8AmZOAvfLK2Gg3RWITlbPn1NrMj8BhpXti
	A3jyOYR5diUmlqVhUPsd1HImaclxXywHnsaqMSrpqT+o8UTXZiZcorodyBHQyfbzV0Pb
	A+N+dpE4tkbVf7V/7/QlsJCd1rVji0g88PxXF3q8wj79NpdMDgBNMTfB2y4AJyt8H1za
	oj9CS6b7SQ42gwY6AuIVdkdOuhRimpc0lF4xdj+wmm6h4cHuJjseKsnYixvXn/fHZoBZ
	18n5Exp+svdzKnsY3RMgJuY8DPK/ExJ3+dvbaELLQDhyMEN3vyDhYV/I0dwGJOzYzstP
	rTmA==
X-Gm-Message-State: APjAAAX35EHAqeuolK9zXHm77tKCr2J7vaunil/WGMoz6seJ7hsgUXbu
	k0Gdm9vXVbh2JdkG6V3AMv8j5QEnZXc=
X-Google-Smtp-Source: APXvYqxZ6VvBfMJQIZHMeE/Gpj56vBu0JxmuXsarA5lMxQajEVw+jw9ry7DiuYQy6a8k0vFJ0+wVDg==
X-Received: by 2002:adf:dd0f:: with SMTP id a15mr212219wrm.265.1565796378881; 
	Wed, 14 Aug 2019 08:26:18 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id v12sm66620wrr.87.2019.08.14.08.26.18
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 14 Aug 2019 08:26:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2019 17:26:11 +0200
Message-Id: <20190814152613.46996-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] linux-yocto: add drm-bochs support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Aug 2019 15:26:18 -0000

This allows better modesetting support for the '-vga std'
emulated hardware provided by Qemu, which we want to
standardize on.

See here for background:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13466

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb     | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 96117ccf3f7..2268faf512c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -46,7 +46,7 @@ KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
 KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 4013a0c2d0b..e2108a6e2bd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -38,7 +38,7 @@ KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
 KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 9e822f2e7f3..71fd5734ada 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -38,7 +38,7 @@ KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
 KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index cee8af7c995..5a45e7502c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -43,7 +43,7 @@ COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemum
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
 KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 0e4a372d2dd..87fe42ea2ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -47,7 +47,7 @@ COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemum
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
 KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
2.17.1


