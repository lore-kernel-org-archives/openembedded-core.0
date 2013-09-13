Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB02.domain01.net (STOEXHUB02.domain01.net
	[83.145.59.143])
	by mail.openembedded.org (Postfix) with ESMTP id AB4266B6BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 19:21:36 +0000 (UTC)
Received: from localhost (83.252.255.124) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.279.1; Fri, 13 Sep 2013
	21:21:36 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 21:21:35 +0200
Message-ID: <a8748357e163efb38b354d4142293393c2a2cc9a.1379100075.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <cover.1379100075.git.anders@chargestorm.se>
References: <cover.1379100075.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 1/1] u-boot-fw-utils: reinstate target recipe for fw_printenv
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
X-List-Received-Date: Fri, 13 Sep 2013 19:21:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The latest upgrade changed u-boot-fw-utils to u-boot-fw-utils-cross, which
removed the on-target fw_printenv (and fw_setenv).

Re-create the updated version of the u-boot-fw-utils recipe.

U-Boot does try to strip the fw_printenv binary by default now. To avoid
this, without patching the Makefile, we add HOSTSTRIP=true to EXTRA_OEMAKE.

The new U-Boot do also require us to configure the build for a specific
machine, thus we change the package arch.§

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
new file mode 100644
index 0000000..f97df71
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+SECTION = "bootloader"
+DEPENDS = "mtd-utils"
+
+# This revision corresponds to the tag "v2013.07"
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
+
+PV = "v2013.07+git${SRCPV}"
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTSTRIP="true"'
+
+do_compile () {
+  oe_runmake ${UBOOT_MACHINE}
+  oe_runmake env
+}
+
+do_install () {
+  install -d ${D}${base_sbindir}
+  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
+  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.8.4.rc3


