Return-Path: <mfe@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 602827E720
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 17:54:44 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
	helo=dude02.lab.pengutronix.de)
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1hbTvw-0005br-SW; Thu, 13 Jun 2019 19:54:44 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hbTvv-0006q5-R5; Thu, 13 Jun 2019 19:54:43 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2019 19:54:42 +0200
Message-Id: <20190613175442.26121-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613175442.26121-1-m.felsch@pengutronix.de>
References: <20190613175442.26121-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: kernel@pengutronix.de
Subject: [PATCH 2/2] mesa: make gallium virgl target optional
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

Just as for the swrast target it isn't a good solution to enable the
target per default since we are compiling for embedded targets most of
the time. Make this target optional for all hardware targets except
qemu to save resources.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
v3:
- rebased on current master-next branch
- add PACKAGECONFIG_append_qemuall to avoid breaking changes

 meta/recipes-graphics/mesa/mesa.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a6d36cf21c..6ffcfb7ea5 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -91,6 +91,9 @@ PACKAGECONFIG[egl] = "-Degl=true, -Degl=false"
 PACKAGECONFIG[etnaviv] = ""
 PACKAGECONFIG[kmsro] = ""
 PACKAGECONFIG[swrast] = ""
+PACKAGECONFIG[r600] = ""
+PACKAGECONFIG[virgl] = ""
+PACKAGECONFIG_append_qemuall = " virgl"
 
 GALLIUMDRIVERS = ""
 GALLIUMDRIVERS +="${@bb.utils.contains('PACKAGECONFIG', 'swrast', 'swrast', '', d)}"
@@ -102,11 +105,9 @@ GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600', 'radeonsi
 GALLIUMDRIVERS_LLVM33_ENABLED = "${@oe.utils.version_less_or_equal('MESA_LLVM_RELEASE', '3.2', False, len('${GALLIUMDRIVERS_LLVM33}') > 0, d)}"
 GALLIUMDRIVERS_LLVM = "r300 svga nouveau ${@'${GALLIUMDRIVERS_LLVM33}' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 
-PACKAGECONFIG[r600] = ""
-
 GALLIUMDRIVERS += "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
 GALLIUMDRIVERS += "${@bb.utils.contains('PACKAGECONFIG', 'r600', 'r600', '', d)}"
-GALLIUMDRIVERS += "virgl"
+GALLIUMDRIVERS += "${@bb.utils.contains('PACKAGECONFIG', 'virgl', 'virgl', '', d)}"
 GALLIUMDRIVERS_MESON = "${@",".join("${GALLIUMDRIVERS}".split())}"
 
 PACKAGECONFIG[gallium] = "-Dgallium-drivers=${GALLIUMDRIVERS_MESON}, -Dgallium-drivers=''"
-- 
2.20.1


