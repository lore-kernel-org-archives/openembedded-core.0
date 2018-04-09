Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE1CA74B2A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 15:16:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w39FGC8M004384
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Apr 2018 08:16:12 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 9 Apr 2018 08:16:12 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 9 Apr 2018 11:16:06 -0400
Message-ID: <0347c63aa8ba1087fe13db7f6d91431072e41f11.1523286757.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1523286757.git.bruce.ashfield@windriver.com>
References: <cover.1523286757.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto-tiny/4.14: fix recipe name
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
X-List-Received-Date: Mon, 09 Apr 2018 15:16:12 -0000
Content-Type: text/plain

I guess not many people are building linux-yocto-tiny for
v4.15, given that I managed to mangle the name of the recipe
when I introduced it.

[YOCTO #12640]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b  | 25 -----------
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb | 50 ++++++----------------
 2 files changed, 14 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b
deleted file mode 100644
index 7a6696c71a68..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b
+++ /dev/null
@@ -1,25 +0,0 @@
-KBRANCH ?= "v4.15/standard/tiny/common-pc"
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "4.15"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-SRCREV_machine ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
-SRCREV_meta ?= "ef2f5d9a0ac1c5ac60e76b18b0bb3393be450336"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
-
-COMPATIBLE_MACHINE = "qemux86|qemux86-64"
-
-# Functionality flags
-KERNEL_FEATURES = ""
-
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
index 6cddb7ecfcf8..9054f1862191 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
@@ -1,47 +1,25 @@
-KBRANCH ?= "v4.15/standard/base"
+KBRANCH ?= "v4.15/standard/tiny/common-pc"
+LINUX_KERNEL_TYPE = "tiny"
+KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-# board specific branches
-KBRANCH_qemuarm  ?= "v4.15/standard/arm-versatile-926ejs"
-KBRANCH_qemuarm64 ?= "v4.15/standard/qemuarm64"
-KBRANCH_qemumips ?= "v4.15/standard/mti-malta32"
-KBRANCH_qemuppc  ?= "v4.15/standard/qemuppc"
-KBRANCH_qemux86  ?= "v4.15/standard/base"
-KBRANCH_qemux86-64 ?= "v4.15/standard/base"
-KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
-
-SRCREV_machine_qemuarm ?= "5fdc3d579c5f50fbaaa5faecae79e20b73810346"
-SRCREV_machine_qemuarm64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
-SRCREV_machine_qemumips ?= "5afbe5a7e271f1c115a7c77bea4a71356c6f2792"
-SRCREV_machine_qemuppc ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
-SRCREV_machine_qemux86 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
-SRCREV_machine_qemux86-64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
-SRCREV_machine_qemumips64 ?= "f9a3a72209bde080e4ecb4fbe7a0f99954643131"
-SRCREV_machine ?= "f73fd8783a3e7529902366ba75aafb81c19ec3c9"
-SRCREV_meta ?= "6918258c9e46ad8471210354159eb42f127c7374"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
-
 LINUX_VERSION ?= "4.15.13"
 
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
+SRCREV_machine ?= "f73fd8783a3e7529902366ba75aafb81c19ec3c9"
+SRCREV_meta ?= "939d935b0c992c6f1e51a7a1c9e4fbe6ef3c3174"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
 
-COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
+
+COMPATIBLE_MACHINE = "qemux86|qemux86-64"
 
 # Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
+KERNEL_FEATURES = ""
+
+KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
-- 
2.5.0


