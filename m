Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1T3yEb-0008EF-UB
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 01:51:46 +0200
Received: by obc16 with SMTP id 16so482133obc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 16:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Ms2M88sqBXezCg72NMyQNEgJmF7lBwp7gHyt2tgM7yA=;
	b=lmyYqlAZHdCU+3x7EL8KHquhoLUhTYJD4U6CuMIA+oLB5cFPhH7hZ/vy4eatgiL3Ws
	1tb0Jfuug84AdEb9BiA6sUr/WRV5nlSkJC6sU4eYLw/4NBxt3vJJnlF6fNkjNBp/h7bF
	1k7DJBxcxMga+Odkjxs9puaSUS5crtcJXRySRn92r26YM1NrI2fM2cvmBOixpG1W1tkf
	ToRKu6RbTdxYsOm3G9fT1UvqPsy0G7XQE7ribTlxGR9RZe6KXYy3VMrzaP1i5eezbrIM
	kxs5aLTW/kIc/J9UAf5k7ikWIXnSrgYBadahwfreAKEGEeXO1hX4u88fRAcs99tTAhYJ
	QaUg==
Received: by 10.60.171.109 with SMTP id at13mr14606502oec.79.1345592381000;
	Tue, 21 Aug 2012 16:39:41 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id k3sm2490932obw.4.2012.08.21.16.39.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Aug 2012 16:39:40 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2012 16:39:38 -0700
Message-Id: <1345592379-8704-4-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345592379-8704-1-git-send-email-trini@ti.com>
References: <1345592379-8704-1-git-send-email-trini@ti.com>
Subject: [PATCH v2 4/5] u-boot-mkimage: Update to v2012.07
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 23:51:46 -0000

Signed-off-by: Tom Rini <trini@ti.com>
---
 .../u-boot/u-boot-mkimage_2012.04.01.bb            |   35 --------------------
 meta/recipes-bsp/u-boot/u-boot-mkimage_2012.07.bb  |   33 ++++++++++++++++++
 2 files changed, 33 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2012.07.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb
deleted file mode 100644
index c41a2f1..0000000
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
-EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
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
index 0000000..0ba4c03
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
+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
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



