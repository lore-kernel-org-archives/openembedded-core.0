Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6536C02E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 14:19:01 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 96E47821; Tue,  7 Jan 2014 15:19:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.3.2
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 3E6B07FA;
	Tue,  7 Jan 2014 15:18:56 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jan 2014 15:18:37 +0100
Message-Id: <1389104317-11042-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Cc: Darren Hart <dvhart@linux.intel.com>, darren.hart@intel.com
Subject: [PATCH] kernel: use oldnoconfig instead of yes '' | make oldconfig
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
X-List-Received-Date: Tue, 07 Jan 2014 14:19:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When using a defconfig, using yes '' | make oldconfig may not result in
the correct configuration being set. For example:

 $ grep USB_ETH .config
 CONFIG_USB_ETH=y
 CONFIG_USB_ETH_RNDIS=y
 CONFIG_USB_ETH_EEM=y
 $ make savedefconfig
 scripts/kconfig/conf --savedefconfig=defconfig Kconfig
 $ cp defconfig .config
 ‘defconfig’ -> ‘.config’
 $ yes '' | make oldconfig
 [...]
 #
 # configuration written to .config
 #
 $ grep USB_ETH .config
 CONFIG_USB_ETH=m
 CONFIG_USB_ETH_RNDIS=y
 CONFIG_USB_ETH_EEM=y

Using make olddefconfig solves that but we'll use oldnoconfig for
backward compatibility with older kernels.

 $ cp defconfig .config
 ‘defconfig’ -> ‘.config’
 $ make oldnoconfig
 scripts/kconfig/conf --olddefconfig Kconfig
 #
 # configuration written to .config
 #
 $ grep USB_ETH .config
 CONFIG_USB_ETH=y
 CONFIG_USB_ETH_RNDIS=y
 CONFIG_USB_ETH_EEM=y

For more information, please refer to:
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=fbe98bb9ed3dae23e320c6b113e35f129538d14a

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 61a6d102d7a8..644d7937923d 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -313,7 +313,7 @@ kernel_do_configure() {
 	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
 		cp "${WORKDIR}/defconfig" "${B}/.config"
 	fi
-	yes '' | oe_runmake oldconfig
+	oe_runmake oldnoconfig
 }
 
 do_savedefconfig() {
-- 
1.8.3.2


