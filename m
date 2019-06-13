Return-Path: <mfe@pengutronix.de>
X-Greylist: delayed 1111 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 13 Jun 2019 17:54:44 UTC
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 5F36E7E6CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 17:54:44 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
	helo=dude02.lab.pengutronix.de)
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1hbTvw-0005bq-SX; Thu, 13 Jun 2019 19:54:44 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hbTvv-0006q3-QM; Thu, 13 Jun 2019 19:54:43 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2019 19:54:41 +0200
Message-Id: <20190613175442.26121-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: kernel@pengutronix.de
Subject: [PATCH 1/2] mesa: make gallium swrast target optional
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
X-List-Received-Date: Thu, 13 Jun 2019 17:54:44 -0000
Content-Transfer-Encoding: 8bit

Most of the time we are compiling for embedded targets which have
dedicated hardware combinations. Enabling swrast by default isn't a good
solution for such devices because if the hardware render node has an
issue or doesn't support a special format/request Mesa will fallback to
the software renderer. This will make it harder to debug performance
issues.

A better way is to let the user decide if a software renderer is
needed e.g. if the system has no hardware renderer or to have such a
fallback device. This way the user knows that the software renderer is
enabled.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
v3
- rebased on current master-next branch

 meta/recipes-graphics/mesa/mesa.inc | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 3ecfb8506c..a6d36cf21c 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -90,23 +90,27 @@ PACKAGECONFIG[egl] = "-Degl=true, -Degl=false"
 
 PACKAGECONFIG[etnaviv] = ""
 PACKAGECONFIG[kmsro] = ""
+PACKAGECONFIG[swrast] = ""
 
-GALLIUMDRIVERS = "swrast"
-GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
-GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
+GALLIUMDRIVERS = ""
+GALLIUMDRIVERS +="${@bb.utils.contains('PACKAGECONFIG', 'swrast', 'swrast', '', d)}"
+GALLIUMDRIVERS +="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', 'etnaviv', '', d)}"
+GALLIUMDRIVERS +="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', 'kmsro', '', d)}"
 
 # radeonsi requires LLVM
-GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
+GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600', 'radeonsi', '', d)}"
 GALLIUMDRIVERS_LLVM33_ENABLED = "${@oe.utils.version_less_or_equal('MESA_LLVM_RELEASE', '3.2', False, len('${GALLIUMDRIVERS_LLVM33}') > 0, d)}"
-GALLIUMDRIVERS_LLVM = "r300,svga,nouveau${@',${GALLIUMDRIVERS_LLVM33}' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
+GALLIUMDRIVERS_LLVM = "r300 svga nouveau ${@'${GALLIUMDRIVERS_LLVM33}' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 
 PACKAGECONFIG[r600] = ""
 
-GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
-GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600', '', d)}"
-GALLIUMDRIVERS_append = ",virgl"
+GALLIUMDRIVERS += "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
+GALLIUMDRIVERS += "${@bb.utils.contains('PACKAGECONFIG', 'r600', 'r600', '', d)}"
+GALLIUMDRIVERS += "virgl"
+GALLIUMDRIVERS_MESON = "${@",".join("${GALLIUMDRIVERS}".split())}"
+
+PACKAGECONFIG[gallium] = "-Dgallium-drivers=${GALLIUMDRIVERS_MESON}, -Dgallium-drivers=''"
 
-PACKAGECONFIG[gallium] = "-Dgallium-drivers=${GALLIUMDRIVERS}, -Dgallium-drivers=''"
 MESA_LLVM_RELEASE ?= "8.0.0"
 PACKAGECONFIG[gallium-llvm] = "-Dllvm=true -Dshared-llvm=true, -Dllvm=false, llvm${MESA_LLVM_RELEASE} llvm-native \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
-- 
2.20.1


