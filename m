Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1PzUMi-0006iQ-NN
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 14:32:48 +0100
Received: by gwb11 with SMTP id 11so224821gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 06:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=UqcpwK1cyTaZcXS6fufd4U0uRdIgbe9Co2cTHZZLnTA=;
	b=do3iGja/VahJ8RMzn6g0u1Y0pgUjXLLMzH9EAdFnIYwLH0ScVVGi+tmDaYq4KMjBi6
	5xzqsQxZgOsKD42T1Zw/CHz62sudKpkY1IXr8hB6js0FBLv+BeHxAHOiqIXk/8yPn98R
	td/QTZ/j0uCgdchc2bn2zZF9hpWTv26aMF6zY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=o6nGEGfM2EmSk2LeEbyZxKNWDGkU/K74OT8xHoXFC1V+HSGFCCcFX+XXcEwDS7R2EY
	d2ogS8f3B4q4Sj2oi/CRCBAP1uXlO+aLIFiTC3qrMKYSHxjns6XCPzUB6TByeahIyRVg
	kS07/Q9LUsU+bk/kyDGBcJfiuZ57v6pUIN4EA=
Received: by 10.150.189.4 with SMTP id m4mr783980ybf.344.1300195865778;
	Tue, 15 Mar 2011 06:31:05 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r18sm6232063yba.11.2011.03.15.06.31.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 06:31:04 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2011 08:31:01 -0500
Message-Id: <1300195862-23448-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH] u-boot.inc: allow variable make targets
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Mar 2011 13:32:48 -0000

* Later versions of u-boot sometimes have top level make targets
  such as u-boot.imx, u-boot.kwb, and for upcoming TI devices
  u-boot.ti.
* These targets define different calls to the mkimage tool to
  change the images created, such as changing the load address.
* This change allows recipes to change the default make target
  of "all" to something like u-boot.ti or u-boot.imx by setting
  the UBOOT_MAKE_TARGET variable.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta/recipes-bsp/uboot/u-boot.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-bsp/uboot/u-boot.inc b/meta/recipes-bsp/uboot/u-boot.inc
index d1cebee..058e3ba 100644
--- a/meta/recipes-bsp/uboot/u-boot.inc
+++ b/meta/recipes-bsp/uboot/u-boot.inc
@@ -14,13 +14,14 @@ EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} OPTFLAGS='-O2'"
 UBOOT_MACHINE ?= "${MACHINE}_config"
 UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.bin"
 UBOOT_SYMLINK ?= "u-boot-${MACHINE}.bin"
+UBOOT_MAKE_TARGET ?= "all"
 
 do_compile () {
 	unset LDFLAGS
 	unset CFLAGS
 	unset CPPFLAGS
 	oe_runmake ${UBOOT_MACHINE}
-	oe_runmake all
+	oe_runmake ${UBOOT_MAKE_TARGET}
 }
 
 do_deploy () {
-- 
1.7.0.4



