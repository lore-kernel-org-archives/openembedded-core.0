Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by mail.openembedded.org (Postfix) with ESMTP id C642F6E92F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2014 16:30:43 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id C400281E; Fri,  7 Feb 2014 17:30:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.3.2
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 64CCD7FE;
	Fri,  7 Feb 2014 17:30:46 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2014 17:30:32 +0100
Message-Id: <1391790632-29801-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Cc: Darren Hart <dvhart@linux.intel.com>, darren.hart@intel.com
Subject: [PATCH v3] kernel: use oldnoconfig before yes '' | make oldconfig
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
X-List-Received-Date: Fri, 07 Feb 2014 16:30:44 -0000

When using a defconfig, using yes '' | make oldconfig may not result in
the correct configuration being set. For example:

 $ ARCH=mips make qi_lb60_defconfig
 #
 # configuration written to .config
 #
 $ grep USB_ETH .config
 CONFIG_USB_ETH=y
 # CONFIG_USB_ETH_RNDIS is not set
 # CONFIG_USB_ETH_EEM is not set

 $ cp arch/mips/configs/qi_lb60_defconfig .config
 $ yes '' | make ARCH=mips oldconfig
[...]
 $ grep USB_ETH .config
 CONFIG_USB_ETH=m
 # CONFIG_USB_ETH_RNDIS is not set
 # CONFIG_USB_ETH_EEM is not set

Using make olddefconfig solves that but we'll use the oldnoconfig alias
for backward compatibility with older kernels.

 $ cp arch/mips/configs/qi_lb60_defconfig .config
 $ make ARCH=mips oldnoconfig
 scripts/kconfig/conf --olddefconfig Kconfig
 #
 # configuration written to .config
 #
 $ grep USB_ETH .config
 CONFIG_USB_ETH=y
 # CONFIG_USB_ETH_RNDIS is not set
 # CONFIG_USB_ETH_EEM is not set

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 meta/classes/kernel.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 51626b03f824..9f1d669b3cf6 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -301,6 +301,8 @@ python sysroot_stage_all () {
     oe.path.copyhardlinktree(d.expand("${D}${KERNEL_SRC_PATH}"), d.expand("${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}"))
 }
 
+KERNEL_CONFIG_COMMAND ?= "oe_runmake oldnoconfig || yes '' | oe_runmake oldconfig"
+
 kernel_do_configure() {
 	# fixes extra + in /lib/modules/2.6.37+
 	# $ scripts/setlocalversion . => +
@@ -313,7 +315,7 @@ kernel_do_configure() {
 	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
 		cp "${WORKDIR}/defconfig" "${B}/.config"
 	fi
-	yes '' | oe_runmake oldconfig
+	eval ${KERNEL_CONFIG_COMMAND}
 }
 
 do_savedefconfig() {
-- 
1.8.3.2


