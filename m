Return-Path: <mfe@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id DE1177E7D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 17:55:33 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
	helo=dude02.lab.pengutronix.de)
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1hbTe2-00040q-27; Thu, 13 Jun 2019 19:36:14 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hbTe1-0005qN-Ou; Thu, 13 Jun 2019 19:36:13 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2019 19:36:08 +0200
Message-Id: <20190613173608.22392-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: kernel@pengutronix.de
Subject: [PATCH] kernel: install modules.builtin.modinfo file
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
X-List-Received-Date: Thu, 13 Jun 2019 17:55:34 -0000
Content-Transfer-Encoding: 8bit

With kernel 5.2 a file is created which stores informations about the
builtin modules, for more information see [1]. Without this patch a Q/A
issue will be thrown.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/ \
    linux.git/commit/Documentation/kbuild/ \
    kbuild.txt?h=v5.2-rc4&id=898490c010b5d2e499e03b7e815fc214209ac583

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 9da9818962..037a0c6896 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -556,7 +556,7 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
 # kernel-image becomes kernel-image-${KERNEL_VERSION}
 PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules"
 FILES_${PN} = ""
-FILES_${KERNEL_PACKAGE_NAME}-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
+FILES_${KERNEL_PACKAGE_NAME}-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
 FILES_${KERNEL_PACKAGE_NAME}-image = ""
 FILES_${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
 FILES_${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
-- 
2.20.1


