Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RfdrD-0002Yd-V9
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Dec 2011 21:42:48 +0100
Received: by eeit10 with SMTP id t10so7196909eei.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Dec 2011 12:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=9D7JLx1o+QWb9YUdP7fwcPetd927vu9vUyAm18OTtno=;
	b=ggz6daLinwyyypIrDL69yri/4X7Xr5nBioBsr9zzBxKD9hFBkSXDI+gQu2+mAzPPfF
	pNG3bhdljcUgl8Puqf8emo9raZHsv2tun/thkAuNi8tZzkzjA9dIwkOE3Ts6uDaHlFQR
	6SJxV+i7u1U/xkGmkSYhlavLiSz9URrPCu9Ug=
Received: by 10.14.124.148 with SMTP id x20mr12254324eeh.57.1325018130987;
	Tue, 27 Dec 2011 12:35:30 -0800 (PST)
Received: from localhost.localdomain (a2038.upc-a.chello.nl. [62.163.2.38])
	by mx.google.com with ESMTPS id 76sm111237229eeh.0.2011.12.27.12.35.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Dec 2011 12:35:30 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Dec 2011 21:35:18 +0100
Message-Id: <1325018118-30223-2-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.8.1
In-Reply-To: <1325018118-30223-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1325018118-30223-1-git-send-email-fransmeulenbroeks@gmail.com>
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Subject: [PATCH 2/2] u-boot: added generating the env utils (fixes bug 1800)
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
X-List-Received-Date: Tue, 27 Dec 2011 20:42:48 -0000

This adds building the u-boot tools for target.
(fw_printenv, fw_setenv).
They are put into a separate package
With these files it becomes possible to modify
the u-boot environment when linux is booted

The #ifdef's in fw_env.h were needed to avoid compilation issues
The constants have been changed to more meaningful defaults
(as 128k flash pages are much more common than 4k pages)
but can be overridden using a configuration file.

This resolves bug 1800

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

---
Note: development and testing was done under openembedded classic.
I've tested it there quite heavily (for mpc8313 if that matters).
I was requested to provide a patch for oe-core too (to resolve bug 1800)
so here it is, although at the moment I am unable to test the patch for oe-core.
I suggest that this is carefully reviewed and tested before being merged.

Frans.
---
 meta/recipes-bsp/u-boot/files/tools_fwenv.patch |   48 +++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot.inc              |   21 ++++++++-
 meta/recipes-bsp/u-boot/u-boot_2011.03.bb       |    3 +-
 meta/recipes-bsp/u-boot/u-boot_2011.06.bb       |    3 +-
 4 files changed, 70 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/tools_fwenv.patch

diff --git a/meta/recipes-bsp/u-boot/files/tools_fwenv.patch b/meta/recipes-bsp/u-boot/files/tools_fwenv.patch
new file mode 100644
index 0000000..8e87800
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/tools_fwenv.patch
@@ -0,0 +1,48 @@
+Index: u-boot-2011.03/tools/env/fw_env.h
+===================================================================
+--- u-boot-2011.03.orig/tools/env/fw_env.h	2011-03-31 23:45:36.000000000 +0200
++++ u-boot-2011.03/tools/env/fw_env.h	2011-12-02 13:55:24.667278362 +0100
+@@ -27,25 +27,35 @@
+  * See included "fw_env.config" sample file (TRAB board)
+  * for notes on configuration.
+  */
+-#define CONFIG_FILE     "/etc/fw_env.config"
++//#define CONFIG_FILE     "/etc/fw_env.config"
++
++#include "config.h"
+ 
+ #define HAVE_REDUND /* For systems with 2 env sectors */
+-#define DEVICE1_NAME      "/dev/mtd1"
+-#define DEVICE2_NAME      "/dev/mtd2"
++#define DEVICE1_NAME      "/dev/mtd0"
++#define DEVICE2_NAME      "/dev/mtd0"
+ #define DEVICE1_OFFSET    0x0000
+-#define ENV1_SIZE         0x4000
+-#define DEVICE1_ESIZE     0x4000
+-#define DEVICE2_OFFSET    0x0000
+-#define ENV2_SIZE         0x4000
+-#define DEVICE2_ESIZE     0x4000
++#define ENV1_SIZE         0x2000
++#define DEVICE1_ESIZE     0x20000
++#define DEVICE1_ENVSECTORS     1
++#define DEVICE2_OFFSET    0x20000
++#define ENV2_SIZE         0x2000
++#define DEVICE2_ESIZE     0x20000
++#define DEVICE2_ENVSECTORS     1
+ 
++#ifndef CONFIG_BAUDRATE
+ #define CONFIG_BAUDRATE		115200
++#endif
++#ifndef CONFIG_BOOTDELAY
+ #define CONFIG_BOOTDELAY	5	/* autoboot after 5 seconds	*/
++#endif
++#ifndef CONFIG_BOOTCOMMAND
+ #define CONFIG_BOOTCOMMAND							\
+ 	"bootp; "								\
+ 	"setenv bootargs root=/dev/nfs nfsroot=${serverip}:${rootpath} "	\
+ 	"ip=${ipaddr}:${serverip}:${gatewayip}:${netmask}:${hostname}::off; "	\
+ 	"bootm"
++#endif
+ 
+ extern int   fw_printenv(int argc, char *argv[]);
+ extern char *fw_getenv  (char *name);
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index a3f50bc..bbfc6d6 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -32,16 +32,31 @@ do_compile () {
 	unset CPPFLAGS
 	oe_runmake ${UBOOT_MACHINE}
 	oe_runmake ${UBOOT_MAKE_TARGET}
+	oe_runmake tools env HOSTCC="${CC}"
 }
 
 do_install () {
-    install -d ${D}/boot
-    install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-    ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+	install -d ${D}/boot
+	install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+
+	if [ -e ${WORKDIR}/fw_env.config ] ; then
+		install -d ${D}${base_sbindir}
+		install -d ${D}${sysconfdir}
+		install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
+		install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
+		install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
+	fi
+
 }
 
 FILES_${PN} = "/boot"
 
+PACKAGES += "${PN}-fw-utils"
+FILES_${PN}-fw-utils = "${sysconfdir} ${base_sbindir}"
+# u-boot doesn't use LDFLAGS for fw files, needs to get fixed, but until then:
+INSANE_SKIP_${PN}-fw-utils = True
+
 do_deploy () {
 	install ${S}/u-boot.bin ${DEPLOYDIR}/${UBOOT_IMAGE}
 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
index 1ebdbea..fe10f58 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
@@ -19,7 +19,8 @@ SRCREV = "19b54a701811220221fc4d5089a2bb18892018ca"
 PV = "v2011.03+git${SRCPV}"
 PR = "r5"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git \
+           file://tools_fwenv.patch"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
index 8ebdbff..bfe5db7 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
@@ -19,7 +19,8 @@ SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
 PV = "v2011.06+git${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git \
+           file://tools_fwenv.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.8.1



