Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 874046C44A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 15:32:26 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id p77so2676384wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 08:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fOoytzUOZOfmB4DVK06XIGxNc44TzgpmaRZFGj5/WFM=;
	b=DA78wBa8nsw76QdMWj7YFyrusyQlj7aabj9Cz9RosyXVwrit/Lf37dvRmGee9kY6RD
	9rEYFX6hWaITmfT3LiUv9SFZyRrls9DMazhMuL9aJb/gR5gnSLV216azKW2Qa71LB3O0
	FwN6+LOjtCLWwFf8re40+vhXp4qr2v69I1XK0VSmyuYbjPx//MYHH3LxjzkGkDms8nHF
	2Yp1umm31wuZRQ+8wqcMXtM3Xql0v5vIWNOqJalm+I8y9RwVtNLpuKEChKoQOmyMxuj1
	lY1OboMbgWtLBNEBHjOJGDKEQ8YjWA7bhR30CZOrd6p7OG1KlydgC6gceizInzs4SaEn
	rK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fOoytzUOZOfmB4DVK06XIGxNc44TzgpmaRZFGj5/WFM=;
	b=bF8+7lE748i9hthyr64wIsEm2Utq8DK27yHBs4EKjHTch8dtfO9Lfiy8QZ/HBjPPo9
	9DyQPahxmDiGscEgkFohGgfa/VmY+9n4HhtkINrM1hqrrnn7ycJkDQc+1VyR8PZkwBBJ
	v7bt2g9Bxs+2N9VaP67aCqgYEhkkrs87/ZHFYldzhQ4Tx/nQtQBPfGi0FaCUV06vO8Lo
	mu13/uiD6/gy1Qg6jnoYD3YYh9o90nsjtI55UtrBZpVEGi+B5Ex8f7s+OHAt7TY2Easd
	OItd//kK1/Jd5B30LSm9+dU8ba1ooy7C7QLtPJdZ3JWfba25GvyKlyzqtFfsD9PzT3up
	T8Rg==
X-Gm-Message-State: APjAAAXEef9erigSVJMURDssP1Dup1qfXeSWRlGD9oGQfzQOLLbOhwEK
	6tAlNA1j9pJexj7o/VnHelMrQ4hIook=
X-Google-Smtp-Source: APXvYqyzXqwat32J/OH8XTHp8ysex7fTaD7bdjcWcw/wetMY7NseVgeHH29KhsjGo4tQxs6yh7ijcQ==
X-Received: by 2002:a05:600c:228e:: with SMTP id
	14mr618420wmf.101.1566315146951; 
	Tue, 20 Aug 2019 08:32:26 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 6sm466700wmf.23.2019.08.20.08.32.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 20 Aug 2019 08:32:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2019 17:32:08 +0200
Message-Id: <20190820153219.62435-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/12] linux-yocto: add drm-bochs support
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
X-List-Received-Date: Tue, 20 Aug 2019 15:32:27 -0000

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


