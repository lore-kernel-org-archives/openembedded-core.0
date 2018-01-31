Return-Path: <ejo@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 23EE378766
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 11:48:58 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <ejo@pengutronix.de>)
	id 1egqst-0002Qd-Fk; Wed, 31 Jan 2018 12:48:59 +0100
Received: from ejo by dude.hi.pengutronix.de with local (Exim 4.90)
	(envelope-from <ejo@pengutronix.de>)
	id 1egqst-0008Aq-6W; Wed, 31 Jan 2018 12:48:59 +0100
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jan 2018 12:48:46 +0100
Message-Id: <20180131114846.31306-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.15.1
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: Enrico Jorns <ejo@pengutronix.de>
Subject: [PATCH] module-base: use modules_prepare build target in do_make_scripts()
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
X-List-Received-Date: Wed, 31 Jan 2018 11:48:59 -0000

The kernel Makefile's 'modules_prepare' target must be called for fully
setting up a module build environment. Unlike calling 'scripts' target,
this also calls 'prepare' target which compiles 'objtool' for example.

Otherwise, when having CONFIG_STACK_VALIDATION in kernel config enabled,
module build will fail with

| make[5]: *** No rule to make target 'tools/objtool/objtool', needed by '[...]'

The 'modules_prepare' target also requires bc-native to be present in sysroot.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/classes/module-base.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index 6fe77c01b7..bee6cac916 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -18,10 +18,13 @@ KERNEL_OBJECT_SUFFIX = ".ko"
 # kernel modules are generally machine specific
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-# Function to ensure the kernel scripts are created. Expected to
-# be called before do_compile. See module.bbclass for an example.
+DEPENDS += "bc-native"
+
+# Function to ensure the kernel scripts and utilities required for building
+# modules are created.
+# Expected to be called before do_compile. See module.bbclass for an example.
 do_make_scripts() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
 	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
-	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts
+	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} modules_prepare
 }
-- 
2.15.1


