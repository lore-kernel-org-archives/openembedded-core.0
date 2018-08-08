Return-Path: <maciej.pijanowski@3mdeb.com>
X-Greylist: delayed 603 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 Aug 2018 20:46:40 UTC
Received: from 6.mo2.mail-out.ovh.net (6.mo2.mail-out.ovh.net [87.98.165.38])
	by mail.openembedded.org (Postfix) with ESMTP id 4E0E978BD5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 20:46:40 +0000 (UTC)
Received: from player798.ha.ovh.net (unknown [10.109.159.35])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id EA4F714831A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 22:28:16 +0200 (CEST)
Received: from localhost.localdomain (89-66-157-179.dynamic.chello.pl
	[89.66.157.179]) (Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player798.ha.ovh.net (Postfix) with ESMTPSA id C7DEE5400A3;
	Wed,  8 Aug 2018 22:28:14 +0200 (CEST)
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 22:27:54 +0200
Message-Id: <20180808202754.9853-1-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.17.1
X-Ovh-Tracer-Id: 5935744312154205889
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrtddvgddugeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenuc
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Subject: [PATCH] meta: replace deprecated "SERIAL_CONSOLE"
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
X-List-Received-Date: Wed, 08 Aug 2018 20:46:40 -0000

SERIAL_CONSOLE was already deprecated in 2013, yet still some
machine configuration files were using it. This patch replaces
it with SERIAL_CONSOLES, which is the successor.

The default value in systemd-serialgetty.bb can also be safely
transitioned from SERIAL_CONSOLE to SERIAL_CONSOLES, as this
recipe already uses SERIAL_CONSOLES within do_install().

The documentation seems to be already up do date.
beaglebone-yocto.conf in the bsp-guide already uses
SERIAL_CONSOLES. The ref-manual redirects from SERIAL_CONSOLE
to SERIAL_CONSOLES.

[YOCTO #12653]

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 meta/conf/machine/include/x86-base.inc           | 2 +-
 meta/recipes-core/systemd/systemd-serialgetty.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86-base.inc
index be037beb290f..06de778b5bf9 100644
--- a/meta/conf/machine/include/x86-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -12,7 +12,7 @@ IMAGE_FSTYPES ?= "hddimg"
 
 KERNEL_IMAGETYPE ?= "bzImage"
 
-SERIAL_CONSOLE ?= "115200 ttyS0"
+SERIAL_CONSOLES ?= "115200;ttyS0"
 
 #
 # kernel-related variables
diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index d67a3c91b4a6..65a931f418de 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=80
 
 PR = "r5"
 
-SERIAL_CONSOLE ?= "115200 ttyS0"
+SERIAL_CONSOLES ?= "115200;ttyS0"
 
 SRC_URI = "file://serial-getty@.service"
 
-- 
2.17.1


