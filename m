Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UZcsu-000704-BG
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 10:04:32 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 May 2013 00:46:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,627,1363158000"; d="scan'208";a="298715871"
Received: from sorvi.fi.intel.com ([10.237.72.154])
	by azsmga001.ch.intel.com with ESMTP; 07 May 2013 00:46:25 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 10:46:23 +0300
Message-Id: <1367912783-32676-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH v3] neard: Split recipe to two parts
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
X-List-Received-Date: Tue, 07 May 2013 08:04:42 -0000

This way it is easier to override settings if needed.

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
Hi,

this 3rd try just contains the split without the SRCREV->SRCPV mess
in earlier version. Sorry about the noise.

Cheers,
Jukka

 meta/recipes-connectivity/neard/neard.inc     | 59 ++++++++++++++++++++++++++
 meta/recipes-connectivity/neard/neard_0.10.bb | 60 +--------------------------
 2 files changed, 60 insertions(+), 59 deletions(-)
 create mode 100644 meta/recipes-connectivity/neard/neard.inc

diff --git a/meta/recipes-connectivity/neard/neard.inc b/meta/recipes-connectivity/neard/neard.inc
new file mode 100644
index 0000000..7cccbdc
--- /dev/null
+++ b/meta/recipes-connectivity/neard/neard.inc
@@ -0,0 +1,59 @@
+SUMMARY = "Linux NFC daemon"
+DESCRIPTION = "A daemon for the Linux Near Field Communication stack"
+HOMEPAGE = "http://01.org/linux-nfc"
+LICENSE = "GPLv2"
+
+DEPENDS = "dbus glib-2.0 libnl"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
+ file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
+ "
+
+inherit autotools pkgconfig systemd update-rc.d
+
+EXTRA_OECONF += "--enable-tools"
+
+do_install() {
+	oe_runmake DESTDIR=${D} libexecdir=${libexecdir} install
+}
+
+# This would copy neard start-stop shell and test scripts
+do_install_append() {
+	if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/init.d/
+		sed "s:@installpath@:${libexecdir}:" ${WORKDIR}/neard.in \
+		  > ${D}${sysconfdir}/init.d/neard
+		chmod 0755 ${D}${sysconfdir}/init.d/neard
+	fi
+
+	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${systemd_unitdir}/system
+		sed "s:@installpath@:${libexecdir}:" ${WORKDIR}/neard.service.in \
+		  > ${D}${systemd_unitdir}/system/neard.service
+	fi
+
+	# Install the tests for neard-tests
+	install -d ${D}${libdir}/neard
+	install -m 0755 ${S}/test/* ${D}${libdir}/${BPN}/
+	install -m 0755 ${S}/tools/nfctool/nfctool ${D}${libdir}/${BPN}/
+}
+
+PACKAGES =+ "${PN}-tests"
+
+FILES_${PN}-tests = "${libdir}/${BPN}/*-test"
+FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
+
+RDEPENDS_${PN} = "dbus python python-dbus python-pygobject"
+
+# Bluez & Wifi are not mandatory except for handover
+RRECOMMENDS_${PN} = "\
+                     ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
+                     ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
+                    "
+
+RDEPENDS_${PN}-tests = "python python-dbus python-pygobject"
+
+INITSCRIPT_NAME = "neard"
+INITSCRIPT_PARAMS = "defaults 64"
+
+SYSTEMD_SERVICE_${PN} = "neard.service"
diff --git a/meta/recipes-connectivity/neard/neard_0.10.bb b/meta/recipes-connectivity/neard/neard_0.10.bb
index dc43f7e..0e590b1 100644
--- a/meta/recipes-connectivity/neard/neard_0.10.bb
+++ b/meta/recipes-connectivity/neard/neard_0.10.bb
@@ -1,69 +1,11 @@
-SUMMARY = "Linux NFC daemon"
-DESCRIPTION = "A daemon for the Linux Near Field Communication stack"
-HOMEPAGE = "http://01.org/linux-nfc"
-LICENSE = "GPLv2"
-
-DEPENDS = "dbus glib-2.0 libnl"
+require neard.inc
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=git \
            file://neard.in \
            file://neard.service.in \
           "
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
- file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
- "
-
 S = "${WORKDIR}/git"
 SRCREV = "eb486bf35e24d7d1db61350f5ab393a0c880523d"
 PV = "0.10+git${SRCPV}"
 PR = "r0"
-
-inherit autotools pkgconfig systemd update-rc.d
-
-EXTRA_OECONF += "--enable-tools"
-
-do_install() {
-	oe_runmake DESTDIR=${D} libexecdir=${libexecdir} install
-}
-
-# This would copy neard start-stop shell and test scripts
-do_install_append() {
-	if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-		install -d ${D}${sysconfdir}/init.d/
-		sed "s:@installpath@:${libexecdir}:" ${WORKDIR}/neard.in \
-		  > ${D}${sysconfdir}/init.d/neard
-		chmod 0755 ${D}${sysconfdir}/init.d/neard
-	fi
-
-	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-		install -d ${D}${systemd_unitdir}/system
-		sed "s:@installpath@:${libexecdir}:" ${WORKDIR}/neard.service.in \
-		  > ${D}${systemd_unitdir}/system/neard.service
-	fi
-
-	# Install the tests for neard-tests
-	install -d ${D}${libdir}/neard
-	install -m 0755 ${S}/test/* ${D}${libdir}/${BPN}/
-	install -m 0755 ${S}/tools/nfctool/nfctool ${D}${libdir}/${BPN}/
-}
-
-PACKAGES =+ "${PN}-tests"
-
-FILES_${PN}-tests = "${libdir}/${BPN}/*-test"
-FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
-
-RDEPENDS_${PN} = "dbus python python-dbus python-pygobject"
-
-# Bluez & Wifi are not mandatory except for handover
-RRECOMMENDS_${PN} = "\
-                     ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
-                     ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
-                    "
-
-RDEPENDS_${PN}-tests = "python python-dbus python-pygobject"
-
-INITSCRIPT_NAME = "neard"
-INITSCRIPT_PARAMS = "defaults 64"
-
-SYSTEMD_SERVICE_${PN} = "neard.service"
-- 
1.7.11.7



