Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C12CB6E6B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 08:14:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4A8E8BR022798
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 01:14:09 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 May 2016 01:14:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2016 01:13:59 -0700
Message-ID: <a3a4ecac5e2b86715220ca18e6fdffef9de2c151.1462867278.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1462867278.git.liezhi.yang@windriver.com>
References: <cover.1462867278.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 1/8] qemu-boot.bbclass: add it for runqemu
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
X-List-Received-Date: Tue, 10 May 2016 08:14:08 -0000
Content-Type: text/plain

It saves vars in ${DEPLOY_DIR_IMAGE}/qemu-boot, and scritps/runqemu will
invoke it, so that runqemu can work easier.

The class will be inherited when QEMU_BOOT_SUPPORTED = "1", default 0
which is set in bitbake.conf.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image.bbclass     |  3 +++
 meta/classes/qemu-boot.bbclass | 39 +++++++++++++++++++++++++++++++++++++++
 meta/conf/bitbake.conf         |  3 +++
 3 files changed, 45 insertions(+)
 create mode 100644 meta/classes/qemu-boot.bbclass

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 4542e95..2985d5e 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -22,6 +22,9 @@ INHIBIT_DEFAULT_DEPS = "1"
 TESTIMAGECLASS = "${@base_conditional('TEST_IMAGE', '1', 'testimage-auto', '', d)}"
 inherit ${TESTIMAGECLASS}
 
+QEMU_BOOT_CLASS = "${@base_conditional('QEMU_BOOT_SUPPORTED', '1', 'qemu-boot', '', d)}"
+inherit ${QEMU_BOOT_CLASS}
+
 # IMAGE_FEATURES may contain any available package group
 IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
diff --git a/meta/classes/qemu-boot.bbclass b/meta/classes/qemu-boot.bbclass
new file mode 100644
index 0000000..efee12c
--- /dev/null
+++ b/meta/classes/qemu-boot.bbclass
@@ -0,0 +1,39 @@
+QEMU_NAME ?= ""
+QEMU_MAHINE_SUBTYPE ?= ""
+QEMU_CPU_SUBTYPE ?= ""
+QEMU_CPU_SUBTYPE_KVM ?= ""
+QEMU_MEM ?= "-m 256"
+QEMU_SYSTEM_OPTIONS ?= ""
+QEMU_SECOND_SERIAL_OPT ?= "-serial mon:stdio -serial null"
+QEMU_KERNEL_OPTIONS ?= ""
+QEMU_DEFAULT_KERNEL ?= "${KERNEL_IMAGETYPE}-${MACHINE}.bin"
+QEMU_DEFAULT_FSTYPE ?= "ext4"
+QEMU_DTB ?= ""
+QEMU_UI_OPTIONS ?= "-show-cursor -usb -usbdevice tablet"
+
+QEMU_OPTIONS ?= "${QEMU_SYSTEM_OPTIONS} ${QEMU_MEM} ${QEMU_MAHINE_SUBTYPE}"
+
+do_qemu_vars[dirs] = "${DEPLOY_DIR_IMAGE}"
+do_qemu_vars() {
+cat > ${DEPLOY_DIR_IMAGE}/qemu-boot <<_EOF
+QEMU_NAME="${QEMU_NAME}"
+QEMU_OPTIONS="${QEMU_OPTIONS}"
+TUNE_ARCH="${TUNE_ARCH}"
+QEMU_DEFAULT_KERNEL="${QEMU_DEFAULT_KERNEL}"
+QEMU_DEFAULT_FSTYPE="${QEMU_DEFAULT_FSTYPE}"
+QEMU_MEM="${QEMU_MEM}"
+QEMU_CPU_SUBTYPE="${QEMU_CPU_SUBTYPE}"
+QEMU_CPU_SUBTYPE_KVM="${QEMU_CPU_SUBTYPE_KVM}"
+QEMU_SECOND_SERIAL_OPT="${QEMU_SECOND_SERIAL_OPT}"
+QEMU_KERNEL_OPTIONS="${QEMU_KERNEL_OPTIONS}"
+DEPLOY_DIR_IMAGE="${DEPLOY_DIR_IMAGE}"
+MACHINE="${MACHINE}"
+STAGING_DIR_NATIVE="${STAGING_DIR_NATIVE}"
+STAGING_BINDIR_NATIVE="${STAGING_BINDIR_NATIVE}"
+STAGING_DIR_HOST="${STAGING_DIR_HOST}"
+QEMU_DTB="${QEMU_DTB}"
+QEMU_UI_OPTIONS="${QEMU_UI_OPTIONS}"
+_EOF
+}
+
+addtask do_qemu_vars before do_build
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1c4175f..6e4865c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -818,3 +818,6 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
+
+# Supported run by qemu or not
+QEMU_BOOT_SUPPORTED ?= "0"
-- 
2.7.4


