Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1T2Puw-0003DZ-Pn
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 19:01:02 +0200
Received: by pbcwy7 with SMTP id wy7so4180590pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 09:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Cy0XCngji2CpZYUKzDeYmNDKuerZ/t8eOAwslUHLtBU=;
	b=ujpz0WVd30UrEXLfmHs8DLDxJpqt8ZRKl1JWT9etjdKlTqoagBS9v3mZobbjUZB4cX
	TKw/VsiWx17naOfppMC6qTNhe6HyG9WI9KtvC0l0INxlAtn/Ueay/WYeyDwWKUGHSTrF
	xgYgHKw63NG+54Ch3SRM12fNk5fMa5jo5J+BOBt41kDHcR74/DtY/g5FllxXkkjOcSPv
	v1ozh9U3UIYoKJybgbx6A+HEZ4/3teltLIM+3GhJbcHC6BNnGG/1NUhhyVSsDqzZdJh9
	Cq2vW1b81eGoXHSfFNiIZKu1xnMbxwqpKmjqjYh3/oAjPfYVTgw7585tFKUaebcINdKt
	Zt/Q==
Received: by 10.68.203.230 with SMTP id kt6mr6866995pbc.163.1345222143321;
	Fri, 17 Aug 2012 09:49:03 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id vh7sm5248664pbc.22.2012.08.17.09.49.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 09:49:02 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 09:48:55 -0700
Message-Id: <1345222136-24839-4-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345222136-24839-1-git-send-email-trini@ti.com>
References: <1345222136-24839-1-git-send-email-trini@ti.com>
Subject: [PATCH 4/5] u-boot-mkimage: Update to v2012.07
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
X-List-Received-Date: Fri, 17 Aug 2012 17:01:03 -0000

Signed-off-by: Tom Rini <trini@ti.com>
---
 .../u-boot/u-boot-mkimage_2012.04.01.bb            |   35 --------------------
 meta/recipes-bsp/u-boot/u-boot-mkimage_2012.07.bb  |   33 ++++++++++++++++++
 2 files changed, 33 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2012.07.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb
deleted file mode 100644
index 4d05202..0000000
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "U-boot bootloader mkimage tool"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-SECTION = "bootloader"
-
-PR = "r1"
-
-# This is needs to be validated among supported BSP's before we can
-# make it default
-DEFAULT_PREFERENCE = "-1"
-
-# This revision corresponds to the tag "v2012.04.01"
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV = "415d386877df49eb051b85ef74fa59a16dc17c7d"
-
-PV = "v2012.04.01+git${SRCPV}"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS} HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
-
-do_compile () {
-  oe_runmake tools
-}
-
-do_install () {
-  install -d ${D}${bindir}
-  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
-  ln -sf uboot-mkimage ${D}${bindir}/mkimage
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.07.bb
new file mode 100644
index 0000000..d30a648
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.07.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "U-boot bootloader mkimage tool"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+SECTION = "bootloader"
+
+# This is needs to be validated among supported BSP's before we can
+# make it default
+DEFAULT_PREFERENCE = "-1"
+
+# This revision corresponds to the tag "v2012.07"
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+SRCREV = "190649fb4309d1bc0fe7732fd0f951cb6440f935"
+
+PV = "v2012.07+git${SRCPV}"
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS} HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
+
+do_compile () {
+  oe_runmake tools
+}
+
+do_install () {
+  install -d ${D}${bindir}
+  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
+  ln -sf uboot-mkimage ${D}${bindir}/mkimage
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.9.5



