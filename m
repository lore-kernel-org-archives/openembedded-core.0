Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B10A07F304
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 02:18:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x762IoQ3027427
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Aug 2019 19:18:50 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 5 Aug 2019 19:18:50 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Aug 2019 10:18:48 +0800
Message-ID: <1565057928-327397-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] qemuboot-x86: move QB_SYSTEM_NAME to corresponding conf
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
X-List-Received-Date: Tue, 06 Aug 2019 02:18:49 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Configrations:
MACHINE: qemux86-64
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

Reproduce steps:
bitbake lib32-core-image-minimal
runqemu qemux86-64 nographic lib32-core-image-minimal

Errors:
qemu cannot bootup since:
Booting from ROM...
This kernel requires an x86-64 CPU, but only detected an i686 CPU.
Unable to boot - please use a kernel appropriate for your CPU.
QEMU: Terminated

For lib32 image, override has x86, so the qemubin set to qemu-system-i386,
fix by move QB_SYSTEM_NAME to corresponding conf, don't use the override

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/machine/include/qemuboot-x86.inc | 2 --
 meta/conf/machine/qemux86-64.conf          | 3 +++
 meta/conf/machine/qemux86.conf             | 3 +++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
index 82ce46d..3931b0f 100644
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -1,10 +1,8 @@
 # For runqemu
 IMAGE_CLASSES += "qemuboot"
-QB_SYSTEM_NAME_x86 = "qemu-system-i386"
 QB_CPU_x86 = "-cpu core2duo"
 QB_CPU_KVM_x86 = "-cpu core2duo"
 
-QB_SYSTEM_NAME_x86-64 = "qemu-system-x86_64"
 QB_CPU_x86-64 = "-cpu core2duo"
 QB_CPU_KVM_x86-64 = "-cpu core2duo"
 
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 383e3bd..4b50e66 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -39,3 +39,6 @@ module_conf_uvesafb = "options uvesafb mode_option=${UVESA_MODE}"
 
 WKS_FILE ?= "qemux86-directdisk.wks"
 do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
+
+#For runqemu
+QB_SYSTEM_NAME = "qemu-system-x86_64"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 272ad1e..3832302 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -39,3 +39,6 @@ module_conf_uvesafb = "options uvesafb mode_option=${UVESA_MODE}"
 
 WKS_FILE ?= "qemux86-directdisk.wks"
 do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
+
+#For runqemu
+QB_SYSTEM_NAME = "qemu-system-i386"
-- 
2.7.4


