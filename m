Return-Path: <mfe@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9507D735
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 18:09:18 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
	helo=dude02.lab.pengutronix.de)
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hMG91-0006l5-Ef; Thu, 02 May 2019 20:09:19 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hMG91-0001hn-3d; Thu, 02 May 2019 20:09:19 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: fabio.berton@ossystems.com.br,
	openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2019 20:09:16 +0200
Message-Id: <20190502180916.32114-5-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502180916.32114-1-m.felsch@pengutronix.de>
References: <20190502180916.32114-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/4] mesa: make gallium virgl optional
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
X-List-Received-Date: Thu, 02 May 2019 18:09:19 -0000
Content-Transfer-Encoding: 8bit

Same as for the swrast target it isn't a good solution to enable the
target per default since we compiling for embedded targets most the
time. Make this target optional to save some memory.

Upstream-Status: Submitted [openembedded-core@lists.openembedded.org]

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Changelog:

v2:
- new patch

 meta/recipes-graphics/mesa/mesa.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b41d3054c3..6a55848c8a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -87,6 +87,8 @@ PACKAGECONFIG[egl] = "-Degl=true, -Degl=false"
 PACKAGECONFIG[etnaviv] = ""
 PACKAGECONFIG[kmsro] = ""
 PACKAGECONFIG[swrast] = ""
+PACKAGECONFIG[r600] = ""
+PACKAGECONFIG[virgl] = ""
 
 GALLIUMDRIVERS = ""
 GALLIUMDRIVERS +="${@bb.utils.contains('PACKAGECONFIG', 'swrast', 'swrast', '', d)}"
@@ -98,11 +100,9 @@ GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600', 'radeonsi
 GALLIUMDRIVERS_LLVM33_ENABLED = "${@oe.utils.version_less_or_equal('MESA_LLVM_RELEASE', '3.2', False, len('${GALLIUMDRIVERS_LLVM33}') > 0, d)}"
 GALLIUMDRIVERS_LLVM = "r300 svga nouveau ${@'${GALLIUMDRIVERS_LLVM33}' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 
-PACKAGECONFIG[r600] = ""
-
 GALLIUMDRIVERS += "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
 GALLIUMDRIVERS += "${@bb.utils.contains('PACKAGECONFIG', 'r600', 'r600', '', d)}"
-GALLIUMDRIVERS += "virgl"
+GALLIUMDRIVERS += "${@bb.utils.contains('PACKAGECONFIG', 'virgl', 'virgl', '', d)}"
 GALLIUMDRIVERS_MESON = "${@",".join("${GALLIUMDRIVERS}".split())}"
 
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
-- 
2.20.1


