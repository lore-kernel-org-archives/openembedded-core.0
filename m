Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 52E166147D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 13:29:00 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id t7so5383478qcv.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 06:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=h0nnGaIp1Z8imVpiLFMFihgiFKO4kx1fhdqKqJOvTX0=;
	b=N2hm7N+aCCcG0pdM+R4fyJGSTSFAoO7GJbOBT0ySz/r8j/hTb9KW8s4feyMGFeBDwp
	wzaJW6seCLzrn6SgXaLCgU1JnuHiQAkQG+lyfeOguTQae8EBpKE7qJjO9msWwwFWTIPI
	3mGW2RU3azSuMegCO0zHC7yEjsRq1+JLkzX13hgiadf//XCJWwbOXYCo/wfKVLo+msH0
	UnQAXeEmr0AXPa9ZaJiOuGK3TeXn3zAzkqO4F9xwpVqvVjf4e1z3zqdeKD34MnycInWd
	BjTA0HBwWr9HB90prL/7GDF5q7hGXA7CaG4bhak1EDHDQyinDS5gPZMfdagxSToxf8OJ
	3nTQ==
X-Received: by 10.49.27.226 with SMTP id w2mr3600714qeg.32.1379597342143;
	Thu, 19 Sep 2013 06:29:02 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.209.11])
	by mx.google.com with ESMTPSA id fy7sm10866448qeb.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 06:29:01 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Sep 2013 10:28:41 -0300
Message-Id: <1379597321-5447-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1379597321-5447-1-git-send-email-otavio@ossystems.com.br>
References: <1379597321-5447-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/3] u-boot, u-boot-fw-utils, u-boot-fw-utils-cross: Use uboot-config class
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
X-List-Received-Date: Thu, 19 Sep 2013 13:29:00 -0000

The U-Boot configuration has been consolidates into a single class to
avoid code duplication. This is now done by uboot-config class, so we
now use it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb |  2 +-
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb       |  9 +--------
 meta/recipes-bsp/u-boot/u-boot.inc                       | 11 +----------
 3 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
index 7f649ca..4b7fd24 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
 S = "${WORKDIR}/git"
 
-inherit cross
+inherit uboot-config cross
 
 EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
index e711951..be54343 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
@@ -17,14 +17,7 @@ S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTSTRIP="true"'
 
-python () {
-	if not d.getVar("UBOOT_MACHINE", True):
-		PN = d.getVar("PN", True)
-		FILE = os.path.basename(d.getVar("FILE", True))
-		bb.debug(1, "To build %s, see %s for instructions on \
-			     setting up your machine config" % (PN, FILE))
-		raise bb.parse.SkipPackage("UBOOT_MACHINE is not set in the %s machine configuration." % d.getVar("MACHINE", True))
-}
+inherit uboot-config
 
 do_compile () {
   oe_runmake ${UBOOT_MACHINE}
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 6ec63df..10a3cf8 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -3,19 +3,10 @@ HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
 SECTION = "bootloaders"
 PROVIDES = "virtual/bootloader"
 
-inherit deploy
+inherit uboot-config deploy
 
 EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
 
-python () {
-	if not d.getVar("UBOOT_MACHINE", True):
-		PN = d.getVar("PN", True)
-		FILE = os.path.basename(d.getVar("FILE", True))
-		bb.debug(1, "To build %s, see %s for instructions on \
-			     setting up your machine config" % (PN, FILE))
-		raise bb.parse.SkipPackage("UBOOT_MACHINE is not set in the %s machine configuration." % d.getVar("MACHINE", True))
-}
-
 # Allow setting an additional version string that will be picked up by the
 # u-boot build system and appended to the u-boot version.  If the .scmversion
 # file already exists it will not be overwritten.
-- 
1.8.4.rc3


