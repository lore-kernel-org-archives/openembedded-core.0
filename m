Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UAZTw-0000TM-9W
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 06:23:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1R56kVU025909
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 21:06:46 -0800 (PST)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.145.220) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.328.9; Tue, 26 Feb 2013 21:06:46 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Feb 2013 00:06:38 -0500
Message-ID: <d5ea01f261190880dde906403060fe2691505199.1361940628.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361940628.git.bruce.ashfield@windriver.com>
References: <cover.1361940628.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: linux-yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] linux-yocto: remove 3.0 linux-yocto recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 05:23:26 -0000
X-List-Received-Date: Wed, 27 Feb 2013 05:23:26 -0000
X-List-Received-Date: Wed, 27 Feb 2013 05:23:26 -0000
Content-Type: text/plain

With the introduction of the 3.8 linux-yocto recipes, we remove
the 3.0 variant.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |   28 -------------------
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |   33 -----------------------
 2 files changed, 61 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_3.0.bb

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
deleted file mode 100644
index 0cdc7c0..0000000
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-require recipes-kernel/linux/linux-yocto.inc
-
-KBRANCH = "yocto/standard/preempt-rt/base"
-KBRANCH_qemuppc = "yocto/standard/preempt-rt/qemu-ppc32"
-
-LINUX_VERSION ?= "3.0.32"
-LINUX_KERNEL_TYPE = "preempt-rt"
-KMETA = "meta"
-
-SRCREV_machine ?= "bbd5bfe49403fdcca294ca4b163d5f7195ea3a8e"
-SRCREV_machine_qemuppc ?= "c3575ad0016173b6e0b953404eb6a770e75a1f11"
-SRCREV_meta ?= "bf5ee4945ee6d748e6abe16356f2357f76b5e2f0"
-
-PR = "${INC_PR}.0"
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
-
-# Omit broken machines from COMPATIBLE_MACHINE
-#   qemuppc hangs at boot
-#   qemumips panics at boot
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
-
-# Functionality flags
-KERNEL_FEATURES_append = " features/netfilter"
-KERNEL_FEATURES_append = " features/taskstats"
-KERNEL_FEATURES_append_qemux86 = " cfg/sound"
-KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
deleted file mode 100644
index b7fbf23..0000000
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-require recipes-kernel/linux/linux-yocto.inc
-
-KBRANCH = "yocto/standard/base"
-KBRANCH_qemux86  = "yocto/standard/common-pc/base"
-KBRANCH_qemux86-64  = "yocto/standard/common-pc-64/base"
-KBRANCH_qemuppc  = "yocto/standard/qemu-ppc32"
-KBRANCH_qemumips = "yocto/standard/mti-malta32-be"
-KBRANCH_qemuarm  = "yocto/standard/arm-versatile-926ejs"
-
-KMETA = "meta"
-
-LINUX_VERSION ?= "3.0.32"
-
-SRCREV_machine_qemuarm ?= "f2d606dfbc61d10847783f1e7c1dcb0ecabf3220"
-SRCREV_machine_qemumips  ?= "57f4bbfb4c65e4c8e349401b877f1661fb026ed6"
-SRCREV_machine_qemuppc ?= "d8779a6245d13c3b56eabac36a14c8896f448566"
-SRCREV_machine_qemux86 ?= "33d5d1ea371dad280e5bcfadd12c3a360c6bc5b8"
-SRCREV_machine_qemux86-64 ?= "fe23c7dd94eb94dd5887028683093615ac921086"
-SRCREV_machine ?= "cef17a18d72eae749dc78de3c83772f52815d842"
-SRCREV_meta ?= "fa9b8c24e84bb9d75d08d197c84c50ce4f99c424"
-
-PR = "${INC_PR}.1"
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
-
-COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
-
-# Functionality flags
-KERNEL_FEATURES_append = " features/netfilter"
-KERNEL_FEATURES_append = " features/taskstats"
-KERNEL_FEATURES_append_qemux86 = " cfg/sound"
-KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
-- 
1.7.10.4



