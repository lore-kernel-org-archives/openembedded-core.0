Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id BD1DE60290
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Nov 2015 22:40:37 +0000 (UTC)
Received: by lfdl133 with SMTP id l133so16223655lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Nov 2015 14:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+kIV+Z2AsHk1NNEDsYcjbFATrJwv7OvHZS4W35uvduY=;
	b=yv82XKIP0XWBvKwQifYfpkE4mWKHcFMOz8/KVAPHk0Hyxfi4FGIJ0CJHR5Gc5Rsjfb
	THNTuAxitDyGxfC00eyRazWRnE3ohswOLjaFOVfkOGxcGwiMVjHq0D9SLHyYLzFpdRUu
	yj9scNfNXs3xSIk+3gdqFFLVU+FubnbwdPILsPpSbhBsT+6gONcriiNmrM97qWZft7Kg
	zcbd1BCxHb5V9OAtAuxOUryIsqNNT4GzUh5WHh7Gz6NF+gIx8q9hF2d3Q/TW/F1molhc
	sWi9AHr4dahzPfQ75Yfc8+ZwVM2w86CiodEt4KIwLwUM/gSgEoRnkjGkwyd6AfKzClyL
	nj7A==
X-Received: by 10.25.165.141 with SMTP id o135mr9544670lfe.139.1448232037689; 
	Sun, 22 Nov 2015 14:40:37 -0800 (PST)
Received: from localhost.localdomain (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231]) by smtp.gmail.com with ESMTPSA id
	a75sm1467117lfe.34.2015.11.22.14.40.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 22 Nov 2015 14:40:36 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 Nov 2015 23:40:11 +0100
Message-Id: <1448232011-30195-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: bruce.ashfield@windriver.com, darren@dvhart.com,
	Ming Liu <peter.x.liu@external.atlascopco.com>, yue.tao@windriver.com
Subject: [PATCH] kernel-devsrc: add 'make scripts' postinstall
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
X-List-Received-Date: Sun, 22 Nov 2015 22:40:38 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Run 'make scripts' inside qemu in order to create script binaries that
needed by external modules build on the target.

This 'make scripts' might fail in some cases, for instance, if toolchain or
make command is not installed on the target, but the postinstall should
always succeed, it will not break the package installation so the behaviour
is consistent.

[YOCTO #6630]

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 196c8c7..8b366c3 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425
 inherit linux-kernel-base
 
 # Whilst not a module, this ensures we don't get multilib extended (which would make no sense)
-inherit module-base
+inherit module-base qemu
 
 # We need the kernel to be staged (unpacked, patched and configured) before
 # we can grab the source and make the source package. We also need the bits from
@@ -71,6 +71,17 @@ do_install() {
 # Ensure we don't race against "make scripts" during cpio
 do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 
+pkg_postinst_${PN} () {
+	if [ -n "$D" ]; then
+		${@qemu_run_binary(d, '$D', '${bindir}/make')} \
+			-C $D${KERNEL_SRC_PATH} O=$D${KERNEL_SRC_PATH} scripts
+	else
+		make -C ${KERNEL_SRC_PATH} O=${KERNEL_SRC_PATH} scripts \
+			>/dev/null 2>&1 || true
+	fi
+}
+
 PACKAGES = "kernel-devsrc"
 FILES_${PN} = "${KERNEL_SRC_PATH}"
+DEPENDS = "qemu-native"
 RDEPENDS_${PN} = "bc"
-- 
1.9.1


