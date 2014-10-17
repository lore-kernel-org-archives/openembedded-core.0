Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id D653B60DD7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Oct 2014 14:08:24 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Xf8Ce-0000qd-Dw from drew_moseley@mentor.com ;
	Fri, 17 Oct 2014 07:08:24 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	svr-orw-fem-02.mgc.mentorg.com (147.34.96.168) with Microsoft SMTP
	Server id 14.3.181.6; Fri, 17 Oct 2014 07:08:11 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Oct 2014 10:08:08 -0400
Message-ID: <1413554888-31319-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: arindam.nath@amd.com, Ravikiran_Polepalli@mentor.com
Subject: [PATCH] poky: daisy: grub: add cmdpath to grub configuration file
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
X-List-Received-Date: Fri, 17 Oct 2014 14:08:25 -0000
Content-Type: text/plain

From: Arindam Nath <arindam.nath@amd.com>

An issue was found where when yocto is installed to a hard disk
from a live USB key, no matter what boot order was selected in
the BIOS menu, the grub menu of the USB key would always show
up. The issue was narrowed down to the way grub configuration
file gets embedded into the standalone bootx64.efi image.

The commit prepends ($cmdpath) to the search path for grub.cfg,
thus making sure the UEFI environment itself sets this to the
correct device path. This in-turn lets the grub.cfg of the boot
device to be loaded.

Signed-off-by: Arindam Nath <arindam.nath@amd.com>
Reviewed-by: Drew Moseley <drew_moseley@mentor.com>
Tested-by: Ravikiran Polepalli <Ravikiran_Polepalli@mentor.com>
---
 meta/recipes-bsp/grub/files/cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/files/cfg b/meta/recipes-bsp/grub/files/cfg
index ffffe47..8ca53d2 100644
--- a/meta/recipes-bsp/grub/files/cfg
+++ b/meta/recipes-bsp/grub/files/cfg
@@ -1,2 +1,2 @@
-search.file /EFI/BOOT/grub.cfg root
+search.file ($cmdpath)/EFI/BOOT/grub.cfg root
 set prefix=($root)/EFI/BOOT
-- 
1.9.1


