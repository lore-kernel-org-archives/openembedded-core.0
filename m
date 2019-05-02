Return-Path: <mfe@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 199006D7C1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 18:09:18 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
	helo=dude02.lab.pengutronix.de)
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hMG91-0006l4-Eg; Thu, 02 May 2019 20:09:19 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hMG91-0001hk-3I; Thu, 02 May 2019 20:09:19 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: fabio.berton@ossystems.com.br,
	openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2019 20:09:15 +0200
Message-Id: <20190502180916.32114-4-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502180916.32114-1-m.felsch@pengutronix.de>
References: <20190502180916.32114-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/4] mesa: make gallium swrast target optional
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

Most the time we are compiling for embedded targets which have dedicated
hardware combinations. Setting swrast default on isn't a good solution
for such devices because if the hardware render node have an issue or
don't support a special format/request mesa will fallback to the
software renderer. This will make it harder to debug performace issues.

A better way is to let the user deciced if a software renderer is
needed e.g. if the system has no hardware renderer or to have such a
fallback device. This way the user knows that the software renderer is
enabled.

Upstream-Status: Submitted [openembedded-core@lists.openembedded.org]

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Changelog:

v2:
- added Upstream-Status line
- fix leading comma

 meta/recipes-graphics/mesa/mesa.inc | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 7516a06639..b41d3054c3 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -86,24 +86,27 @@ PACKAGECONFIG[egl] = "-Degl=true, -Degl=false"
 
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
 
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
-PACKAGECONFIG[gallium] = "-Dgallium-drivers=${GALLIUMDRIVERS}, -Dgallium-drivers=''"
+PACKAGECONFIG[gallium] = "-Dgallium-drivers=${GALLIUMDRIVERS_MESON}, -Dgallium-drivers=''"
 MESA_LLVM_RELEASE ?= "8.0.0"
 PACKAGECONFIG[gallium-llvm] = "-Dllvm=true -Dshared-llvm=true, -Dllvm=false, llvm${MESA_LLVM_RELEASE} llvm-native \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
-- 
2.20.1


