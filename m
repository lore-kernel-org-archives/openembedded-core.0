Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4F63D7F2C0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 06:56:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xAD6uKCq009510
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 22:56:20 -0800 (PST)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 12 Nov 2019 22:56:19 -0800
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2019 14:48:55 +0800
Message-ID: <20191113064855.39964-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [PATCH] ltp: Add "udevadm trigger" before swap verification in mkswap01.sh
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
X-List-Received-Date: Wed, 13 Nov 2019 06:56:19 -0000
Content-Type: text/plain

Swap verification sometimes fails due to race condition with udev.
This is a known issue: https://github.com/linux-test-project/ltp/issues/458.
"udevadm trigger" forces udev to sync up device events with kernel.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 ...-Add-udevadm-trigger-before-swap-verifica.patch | 35 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190517.bb          |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-mkswap01.sh-Add-udevadm-trigger-before-swap-verifica.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-mkswap01.sh-Add-udevadm-trigger-before-swap-verifica.patch b/meta/recipes-extended/ltp/ltp/0001-mkswap01.sh-Add-udevadm-trigger-before-swap-verifica.patch
new file mode 100644
index 0000000000..1b433d3ad3
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-mkswap01.sh-Add-udevadm-trigger-before-swap-verifica.patch
@@ -0,0 +1,35 @@
+From fae8852a63d9fa6e56fb8b24eaf10560bd13757f Mon Sep 17 00:00:00 2001
+From: Yongxin Liu <yongxin.liu@windriver.com>
+Date: Tue, 12 Nov 2019 11:33:50 +0800
+Subject: [PATCH] mkswap01.sh: Add "udevadm trigger" before swap verification
+
+Fix: https://github.com/linux-test-project/ltp/issues/458
+
+Sometimes the swap device cannot show up in /dev/disk/by-uuid/
+or /dev/disk/by-lable/ due to the issue #458. When this issue
+happens, "blkid -c /dev/null" and "ls /dev/disk/by-uuid/" show
+different UUID of the device.
+
+Upstream-Status: Submitted [https://patchwork.ozlabs.org/patch/1193414]
+
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ testcases/commands/mkswap/mkswap01.sh | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/testcases/commands/mkswap/mkswap01.sh b/testcases/commands/mkswap/mkswap01.sh
+index 3a348c6e6..9437c4a4e 100755
+--- a/testcases/commands/mkswap/mkswap01.sh
++++ b/testcases/commands/mkswap/mkswap01.sh
+@@ -129,6 +129,8 @@ mkswap_test()
+ 		return
+ 	fi
+ 
++	udevadm trigger --name-match=$TST_DEVICE
++
+ 	if [ -n "$device" ]; then
+ 		mkswap_verify "$mkswap_op" "$op_arg" "$device" "$size" "$dev_file"
+ 		if [ $? -ne 0 ]; then
+-- 
+2.14.4
+
diff --git a/meta/recipes-extended/ltp/ltp_20190517.bb b/meta/recipes-extended/ltp/ltp_20190517.bb
index 5915b1c72a..47aa9675d8 100644
--- a/meta/recipes-extended/ltp/ltp_20190517.bb
+++ b/meta/recipes-extended/ltp/ltp_20190517.bb
@@ -50,6 +50,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-syscall-rt_sigtimedwait01-Fix-wrong-sigset-length-fo.patch \
            file://0001-cve-2017-17052-Avoid-unsafe-exits-in-threads.patch \
            file://0001-overcommit_memory-update-for-mm-fix-false-positive-O.patch \
+           file://0001-mkswap01.sh-Add-udevadm-trigger-before-swap-verifica.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.14.4


