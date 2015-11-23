Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id E52BE601A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 21:58:10 +0000 (UTC)
Received: by lfaz4 with SMTP id z4so121328510lfa.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 13:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9kBTvFLCNLsIES4j7C/0mpcj4A3vQpdxrEdVsCMK3rg=;
	b=PNkf2W8WptJTpyA0fM+xg7dqGxidX2/yCuaEXLOpc6Qs3BtcQTsNUYmZxsbZNfsc7A
	XC3ZakeYs7I569FpVKdLOwjW7fIzOWbXuDNByiS59IlESDG3uZ1FLVFW/fI0RDX3SP0R
	mKj60wNe0GOFVu/5L9fPMaXWTNrJ0gTy8Ah/sxkpoHhfR5ihQkDkA+PMzk+uwQUB4bDf
	tZ1CENgLWZ58ERTFInIpbbr+63fZJ+KQjFjzsFuTZI54O0FAuNFe/7n+soadLeXXdnGw
	h7gKQYngs3QOpMw9ZYb5gnZd7d4b7V8Jy82F+sEgaDuLw6p1dwUEV8c62hwzNzBD87zB
	k/WA==
X-Received: by 10.25.146.10 with SMTP id u10mr12156305lfd.50.1448315890769;
	Mon, 23 Nov 2015 13:58:10 -0800 (PST)
Received: from localhost.localdomain (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231])
	by smtp.gmail.com with ESMTPSA id 88sm2203785lfq.3.2015.11.23.13.58.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Nov 2015 13:58:10 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 22:58:04 +0100
Message-Id: <1448315884-3893-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: bruce.ashfield@windriver.com, darren@dvhart.com,
	Ming Liu <peter.x.liu@external.atlascopco.com>, yue.tao@windriver.com
Subject: [PATCH V1] kernel-devsrc: add 'make scripts' postinstall
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
X-List-Received-Date: Mon, 23 Nov 2015 21:58:11 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Run 'make scripts' inside qemu in order to create script binaries that
needed by external modules build on the target.

Add RDEPENDS on gcc, make, which are needed by the compilation.

[YOCTO #6630]

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 196c8c7..87826ad 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425
 inherit linux-kernel-base
 
 # Whilst not a module, this ensures we don't get multilib extended (which would make no sense)
-inherit module-base
+inherit module-base qemu
 
 # We need the kernel to be staged (unpacked, patched and configured) before
 # we can grab the source and make the source package. We also need the bits from
@@ -71,6 +71,16 @@ do_install() {
 # Ensure we don't race against "make scripts" during cpio
 do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 
+pkg_postinst_${PN} () {
+	if [ -n "$D" ]; then
+		${@qemu_run_binary(d, '$D', '${bindir}/make')} \
+			-C $D${KERNEL_SRC_PATH} O=$D${KERNEL_SRC_PATH} scripts
+	else
+		make -C ${KERNEL_SRC_PATH} O=${KERNEL_SRC_PATH} scripts
+	fi
+}
+
 PACKAGES = "kernel-devsrc"
 FILES_${PN} = "${KERNEL_SRC_PATH}"
-RDEPENDS_${PN} = "bc"
+DEPENDS = "qemu-native"
+RDEPENDS_${PN} = "bc gcc make"
-- 
1.9.1


