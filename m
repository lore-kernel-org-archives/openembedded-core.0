Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8A54573687
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 18:38:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1KIc7JL015758
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 20 Feb 2015 10:38:07 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 20 Feb 2015 10:38:06 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 20 Feb 2015 13:38:01 -0500
Message-ID: <8dd9a7b54fb081de922bb402ed182b9ff14937ff.1424456540.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1424456540.git.bruce.ashfield@windriver.com>
References: <cover.1424456540.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto: remove 3.10 and 3.17 recipes
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
X-List-Received-Date: Fri, 20 Feb 2015 18:38:12 -0000
Content-Type: text/plain

In accordance with the kernel release criteria we support the latest
mainline kernel + the last LSTI kernel + a development kernel.

3.19 will be introduced as the latest mainline, and 3.14 is the released
LTSI kernel, which means that we remove the 3.10 and 3.17 variants.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 27 ---------------
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb | 22 ------------
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb | 21 ------------
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 37 --------------------
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      | 39 ----------------------
 5 files changed, 146 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_3.10.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_3.17.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
deleted file mode 100644
index 36a00cf03b1a..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-KBRANCH ?= "standard/preempt-rt/base"
-KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-SRCREV_machine ?= "c75818e2932c3c0444ebebfcc0608fecf2440b92"
-SRCREV_machine_qemuppc ?= "fc7abf900967db5dea8a8f8648b8a0de7032f8d7"
-SRCREV_meta ?= "d5456dd830cad14bd844753b751b83744ced3793"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
-
-LINUX_VERSION ?= "3.10.65"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "meta"
-
-LINUX_KERNEL_TYPE = "preempt-rt"
-
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
deleted file mode 100644
index 3248c4414b42..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-KBRANCH ?= "standard/tiny/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-LINUX_VERSION ?= "3.10.65"
-
-KMETA = "meta"
-
-SRCREV_machine ?= "a2f2be49cd60b8d022fa47daae0a8293c3066b78"
-SRCREV_meta ?= "d5456dd830cad14bd844753b751b83744ced3793"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
-
-COMPATIBLE_MACHINE = "(qemux86)"
-
-# Functionality flags
-KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
deleted file mode 100644
index 853f8d0289f4..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-KBRANCH ?= "standard/tiny/base"
-LINUX_KERNEL_TYPE = "tiny"
-KCONFIG_MODE = "--allnoconfig"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-LINUX_VERSION ?= "3.17.8"
-
-KMETA = "meta"
-
-SRCREV_machine ?= "0409b1fbed221e61212e17b7637fa54f908d83f6"
-SRCREV_meta ?= "f24c2bf9c298595d00a9d8600841f2b0206e1fba"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.17.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
-
-COMPATIBLE_MACHINE = "(qemux86)"
-
-# Functionality flags
-KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
deleted file mode 100644
index d3cb81662e98..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-KBRANCH ?= "standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# board specific branches
-KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
-KBRANCH_qemumips ?= "standard/mti-malta32"
-KBRANCH_qemuppc  ?= "standard/qemuppc"
-KBRANCH_qemux86  ?= "standard/common-pc/base"
-KBRANCH_qemux86-64  ?= "standard/common-pc-64/base"
-KBRANCH_qemumips64 ?= "standard/mti-malta64"
-
-SRCREV_machine_qemuarm ?= "7a8c197b86281f9a445e23378fdfeeb4da0c48e9"
-SRCREV_machine_qemumips ?= "926e71942842a9d1a9f64aae0458b2d777d3bca9"
-SRCREV_machine_qemuppc ?= "65648fce58a5e095cfe2bf394bc0f6200efb281c"
-SRCREV_machine_qemux86 ?= "a2f2be49cd60b8d022fa47daae0a8293c3066b78"
-SRCREV_machine_qemux86-64 ?= "a2f2be49cd60b8d022fa47daae0a8293c3066b78"
-SRCREV_machine_qemumips64 ?= "06d173388a171e7371816d74567fdec994925aa4"
-SRCREV_machine ?= "a2f2be49cd60b8d022fa47daae0a8293c3066b78"
-SRCREV_meta ?= "d5456dd830cad14bd844753b751b83744ced3793"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-
-LINUX_VERSION ?= "3.10.65"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "meta"
-
-COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.17.bb b/meta/recipes-kernel/linux/linux-yocto_3.17.bb
deleted file mode 100644
index f57d9c200256..000000000000
--- a/meta/recipes-kernel/linux/linux-yocto_3.17.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-KBRANCH ?= "standard/base"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-# board specific branches
-KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
-KBRANCH_qemuarm64 ?= "standard/qemuarm64"
-KBRANCH_qemumips ?= "standard/mti-malta32"
-KBRANCH_qemuppc  ?= "standard/qemuppc"
-KBRANCH_qemux86  ?= "standard/common-pc"
-KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
-KBRANCH_qemumips64 ?= "standard/mti-malta64"
-
-SRCREV_machine_qemuarm ?= "12991e8ac40c51ef3e337f17f12aa59c6500fc7f"
-SRCREV_machine_qemuarm64 ?= "0409b1fbed221e61212e17b7637fa54f908d83f6"
-SRCREV_machine_qemumips ?= "1f4735ed314defc95ab9929258ad12844cc2c676"
-SRCREV_machine_qemuppc ?= "3231dececf867215ecab7c7f9ec3a7a7640a3f32"
-SRCREV_machine_qemux86 ?= "0409b1fbed221e61212e17b7637fa54f908d83f6"
-SRCREV_machine_qemux86-64 ?= "0409b1fbed221e61212e17b7637fa54f908d83f6"
-SRCREV_machine_qemumips64 ?= "7005c584078109dae03567e9c597a847a2bc5136"
-SRCREV_machine ?= "0409b1fbed221e61212e17b7637fa54f908d83f6"
-SRCREV_meta ?= "f24c2bf9c298595d00a9d8600841f2b0206e1fba"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.17.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-
-LINUX_VERSION ?= "3.17.8"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "meta"
-
-COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
2.1.0


