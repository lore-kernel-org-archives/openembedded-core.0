Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6CBF46158B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 20:48:59 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id j7so3993075qaq.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 13:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=ajBGUkzDZB7YD1rVKc9YOaYoeKOsg02OVkV90JZgakk=;
	b=TV+COh4GislZpW1bMgT6/Q6QGIkD9xxU4TOQv2AGPHFfLkUZpoACj35aoheMd8KRni
	98povrkft+DF7brWKTPQdLqy0GcqHjGbKZU7fLZm5eryQpHfUWR0T9NX0ZwPEvSFVjPl
	TolWSCavqldGi+RMnE9r3ETER+0yMGZOcH1y6sRGkmbHzaKVWpyaapMe3iulPUxUmr8k
	wOWsWwe3BuTyhZfsYsMAhZnT+ASDxsr/DxNSfplKcdBVIQKVxbtWwAC2nwzw3+6Z9fL/
	18/g+Uv44n7AAP0aRsjv23Xa+KnB5VbYBoXkiCm5VZFosxasqZMWORmfkiT7hJUfVfYn
	vmGg==
X-Received: by 10.224.151.82 with SMTP id b18mr999956qaw.125.1379623741167;
	Thu, 19 Sep 2013 13:49:01 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.209.11])
	by mx.google.com with ESMTPSA id h20sm13258086qen.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 13:49:00 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Sep 2013 17:48:38 -0300
Message-Id: <1379623718-29690-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1379623718-29690-1-git-send-email-otavio@ossystems.com.br>
References: <1379623718-29690-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 3/3] u-boot, u-boot-fw-utils, u-boot-fw-utils-cross: Use uboot-config class
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
X-List-Received-Date: Thu, 19 Sep 2013 20:48:59 -0000

The U-Boot configuration has been consolidates into a single class to
avoid code duplication. This is now done by uboot-config class, so we
now use it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v2: None

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


