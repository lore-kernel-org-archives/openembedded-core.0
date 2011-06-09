Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QUZJ5-0008C3-Dy
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 09:05:31 +0200
Received: by wye20 with SMTP id 20so989676wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 00:02:12 -0700 (PDT)
Received: by 10.216.236.28 with SMTP id v28mr1731248weq.12.1307602932069;
	Thu, 09 Jun 2011 00:02:12 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h22sm657954wes.32.2011.06.09.00.02.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Jun 2011 00:02:11 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2011 09:02:04 +0200
Message-Id: <1307602924-7063-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH v2] sysvinit: split inittab into it's own recipe
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
X-List-Received-Date: Thu, 09 Jun 2011 07:05:31 -0000

A proper fix for

[YOCTO ##1131]

Signed-off-by: <koen@dominion.thruhere.net>
---
 .../recipes-core/sysvinit/sysvinit-inittab/inittab |   30 ++++++++++
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   59 ++++++++++++++++++++
 meta/recipes-core/sysvinit/sysvinit/inittab        |   30 ----------
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   41 +-------------
 4 files changed, 90 insertions(+), 70 deletions(-)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit-inittab/inittab
 create mode 100644 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
 delete mode 100644 meta/recipes-core/sysvinit/sysvinit/inittab

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/inittab b/meta/recipes-core/sysvinit/sysvinit-inittab/inittab
new file mode 100644
index 0000000..6abbdf4
--- /dev/null
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab/inittab
@@ -0,0 +1,30 @@
+# /etc/inittab: init(8) configuration.
+# $Id: inittab,v 1.91 2002/01/25 13:35:21 miquels Exp $
+
+# The default runlevel.
+id:5:initdefault:
+
+# Boot-time system configuration/initialization script.
+# This is run first except when booting in emergency (-b) mode.
+si::sysinit:/etc/init.d/rcS
+
+# What to do in single-user mode.
+~~:S:wait:/sbin/sulogin
+
+# /etc/init.d executes the S and K scripts upon change
+# of runlevel.
+#
+# Runlevel 0 is halt.
+# Runlevel 1 is single-user.
+# Runlevels 2-5 are multi-user.
+# Runlevel 6 is reboot.
+
+l0:0:wait:/etc/init.d/rc 0
+l1:1:wait:/etc/init.d/rc 1
+l2:2:wait:/etc/init.d/rc 2
+l3:3:wait:/etc/init.d/rc 3
+l4:4:wait:/etc/init.d/rc 4
+l5:5:wait:/etc/init.d/rc 5
+l6:6:wait:/etc/init.d/rc 6
+# Normally not reached, but fallthrough in case of emergency.
+z6:6:respawn:/sbin/sulogin
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
new file mode 100644
index 0000000..07d703b
--- /dev/null
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -0,0 +1,59 @@
+DESCRIPTION = "Inittab for sysvinit"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+                    file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
+
+PR = "r5"
+
+# Need the whole source for the license checks
+SRC_URI = "http://download.savannah.gnu.org/releases-noredirect/sysvinit/sysvinit-${PV}.tar.bz2 \
+           file://inittab"
+
+SRC_URI[md5sum] = "6eda8a97b86e0a6f59dabbf25202aa6f"
+SRC_URI[sha256sum] = "60bbc8c1e1792056e23761d22960b30bb13eccc2cabff8c7310a01f4d5df1519"
+
+S = "${WORKDIR}/sysvinit-${PV}"
+
+do_compile() {
+	:
+}
+
+do_install() {
+	install -d ${D}${sysconfdir}
+    install -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
+    if [ ! -z "${SERIAL_CONSOLE}" ]; then
+        echo "S:2345:respawn:${base_sbindir}/getty ${SERIAL_CONSOLE}" >> ${D}${sysconfdir}/inittab
+    fi
+    if [ "${USE_VT}" = "1" ]; then
+        cat <<EOF >>${D}${sysconfdir}/inittab
+# ${base_sbindir}/getty invocations for the runlevels.
+#
+# The "id" field MUST be the same as the last
+# characters of the device (after "tty").
+#
+# Format:
+#  <id>:<runlevels>:<action>:<process>
+#
+
+EOF
+
+        for n in ${SYSVINIT_ENABLED_GETTYS}
+        do
+            echo "$n:2345:respawn:${base_sbindir}/getty 38400 tty$n" >> ${D}${sysconfdir}/inittab
+        done
+        echo "" >> ${D}${sysconfdir}/inittab
+    fi
+}
+
+# USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE .conf.
+# Set PACKAGE_ARCH appropriately.
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+FILES_${PN} = "${sysconfdir}/inittab"
+CONFFILES_${PN} = "${sysconfdir}/inittab"
+
+USE_VT ?= "1"
+SYSVINIT_ENABLED_GETTYS ?= "1"
+
+
+
diff --git a/meta/recipes-core/sysvinit/sysvinit/inittab b/meta/recipes-core/sysvinit/sysvinit/inittab
deleted file mode 100644
index 6abbdf4..0000000
--- a/meta/recipes-core/sysvinit/sysvinit/inittab
+++ /dev/null
@@ -1,30 +0,0 @@
-# /etc/inittab: init(8) configuration.
-# $Id: inittab,v 1.91 2002/01/25 13:35:21 miquels Exp $
-
-# The default runlevel.
-id:5:initdefault:
-
-# Boot-time system configuration/initialization script.
-# This is run first except when booting in emergency (-b) mode.
-si::sysinit:/etc/init.d/rcS
-
-# What to do in single-user mode.
-~~:S:wait:/sbin/sulogin
-
-# /etc/init.d executes the S and K scripts upon change
-# of runlevel.
-#
-# Runlevel 0 is halt.
-# Runlevel 1 is single-user.
-# Runlevels 2-5 are multi-user.
-# Runlevel 6 is reboot.
-
-l0:0:wait:/etc/init.d/rc 0
-l1:1:wait:/etc/init.d/rc 1
-l2:2:wait:/etc/init.d/rc 2
-l3:3:wait:/etc/init.d/rc 3
-l4:4:wait:/etc/init.d/rc 4
-l5:5:wait:/etc/init.d/rc 5
-l6:6:wait:/etc/init.d/rc 6
-# Normally not reached, but fallthrough in case of emergency.
-z6:6:respawn:/sbin/sulogin
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index e683cc7..bda8a51 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -5,31 +5,15 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
-PR = "r3"
-
-# Need to set this since it has machine specific components
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-# USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE .conf.
-# Set PACKAGE_ARCH appropriately.
-PACKAGE_ARCH_${PN}-inittab = "${MACHINE_ARCH}"
+PR = "r4"
 
 RDEPENDS_${PN} = "${PN}-inittab"
 
-PACKAGES =+ "bootlogd ${PN}-inittab"
-FILES_bootlogd = "/etc/init.d/bootlogd /etc/init.d/stop-bootlogd /etc/rc?.d/S*bootlogd /sbin/bootlogd"
-FILES_${PN}-inittab = "${sysconfdir}/inittab"
-CONFFILES_${PN}-inittab = "${sysconfdir}/inittab"
-
-USE_VT ?= "1"
-SYSVINIT_ENABLED_GETTYS ?= "1"
-
 SRC_URI = "http://download.savannah.gnu.org/releases-noredirect/sysvinit/sysvinit-${PV}.tar.bz2 \
 	   file://install.patch \
 	   file://crypt-lib.patch \
            file://need \
            file://provide \
-           file://inittab \
            file://rcS-default \
            file://rc \
            file://rcS \
@@ -70,29 +54,6 @@ do_install () {
 	install -d ${D}${sysconfdir} \
 		   ${D}${sysconfdir}/default \
 		   ${D}${sysconfdir}/init.d
-	install -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
-	if [ ! -z "${SERIAL_CONSOLE}" ]; then
-		echo "S:2345:respawn:${base_sbindir}/getty ${SERIAL_CONSOLE}" >> ${D}${sysconfdir}/inittab
-	fi
-	if [ "${USE_VT}" = "1" ]; then
-		cat <<EOF >>${D}${sysconfdir}/inittab
-# ${base_sbindir}/getty invocations for the runlevels.
-#
-# The "id" field MUST be the same as the last
-# characters of the device (after "tty").
-#
-# Format:
-#  <id>:<runlevels>:<action>:<process>
-#
-
-EOF
-
-		for n in ${SYSVINIT_ENABLED_GETTYS}
-		do
-			echo "$n:2345:respawn:${base_sbindir}/getty 38400 tty$n" >> ${D}${sysconfdir}/inittab
-		done
-		echo "" >> ${D}${sysconfdir}/inittab
-	fi
 	install -m 0644    ${WORKDIR}/rcS-default	${D}${sysconfdir}/default/rcS
 	install -m 0755    ${WORKDIR}/rc		${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/rcS		${D}${sysconfdir}/init.d
-- 
1.6.6.1



