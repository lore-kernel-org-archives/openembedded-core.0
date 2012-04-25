Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SN82H-00078T-8w
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 21:37:57 +0200
Received: by vbbfr13 with SMTP id fr13so385329vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2012 12:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=dzRH9e7+Df2tx7ekC5Q+DS9tYsrokT9KhpJOYMg7uBQ=;
	b=YMJ/0u828g5fIPvwyRcZf6ZDoE0ExwHlfwlcvUO8p8+LMOs8TH0gjalMxY+TKSNCaO
	zhM/S4yQ5VoxssB0GbvIM59pP4DQrLqvvXRSO2AtBiuscYzosK01d2FNzSMyRE0VSQou
	kkr2f7kHQAd39rCdtuC5iFxaCHq2zcB4gej6hhlWD20bM39XetwwjPGPIj1sG7mNVVKt
	iFCGWUsVxe7kPMT3Lhyn6dpRbcKkJiLri9pRE5rLfn71xltQzqxBY4j8KQy6inIIkbcC
	7kL2yVIa25HZTGWJmHxCWoIu/oYz/m4+2qpKBJm7TIodc0j3vZLqigsRgNSIcwRrAige
	+lLA==
Received: by 10.220.57.205 with SMTP id d13mr3717880vch.53.1335382100616;
	Wed, 25 Apr 2012 12:28:20 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id c17sm886075vdj.12.2012.04.25.12.28.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Apr 2012 12:28:19 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2012 16:28:07 -0300
Message-Id: <1335382089-18056-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 1/3] u-boot-fw-utils: update 2012.04 to 2012.04.01 release
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
X-List-Received-Date: Wed, 25 Apr 2012 19:37:57 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../u-boot/u-boot-fw-utils_2012.04.01.bb           |   33 ++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb |   33 --------------------
 2 files changed, 33 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
new file mode 100644
index 0000000..fe3422a
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+SECTION = "bootloader"
+
+DEPENDS = "mtd-utils"
+
+# This is needs to be validated among supported BSP's before we can
+# make it default
+DEFAULT_PREFERENCE = "-1"
+
+# This revision corresponds to the tag "v2012.04.01"
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+SRCREV = "415d386877df49eb051b85ef74fa59a16dc17c7d"
+
+PV = "v2012.04.01+git${SRCPV}"
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = 'HOSTCC="${CC}"'
+
+do_compile () {
+  oe_runmake env
+}
+
+do_install () {
+  install -d ${D}${base_sbindir}
+  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
+  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
+}
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb
deleted file mode 100644
index 5ddb9f9..0000000
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-SECTION = "bootloader"
-
-DEPENDS = "mtd-utils"
-
-# This is needs to be validated among supported BSP's before we can
-# make it default
-DEFAULT_PREFERENCE = "-1"
-
-# This revision corresponds to the tag "v2012.04"
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV = "2790bf69dc12fb9aeb9836904e5f57c7f83d5552"
-
-PV = "v2012.04+git${SRCPV}"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OEMAKE = 'HOSTCC="${CC}"'
-
-do_compile () {
-  oe_runmake env
-}
-
-do_install () {
-  install -d ${D}${base_sbindir}
-  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
-  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
-}
-- 
1.7.2.5



