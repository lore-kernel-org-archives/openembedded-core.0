Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 86BA9720C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 17:40:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Nov 2014 09:26:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,370,1413270000"; d="scan'208";a="621320196"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.47])
	by fmsmga001.fm.intel.com with ESMTP; 12 Nov 2014 09:18:29 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Nov 2014 11:18:55 -0600
Message-Id: <1415812735-6272-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] cronie: Upgrade to 1.4.12
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
X-List-Received-Date: Wed, 12 Nov 2014 17:40:41 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-extended/cronie/cronie_1.4.11.bb | 85 ---------------------------
 meta/recipes-extended/cronie/cronie_1.4.12.bb | 84 ++++++++++++++++++++++++++
 2 files changed, 84 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-extended/cronie/cronie_1.4.11.bb
 create mode 100644 meta/recipes-extended/cronie/cronie_1.4.12.bb

diff --git a/meta/recipes-extended/cronie/cronie_1.4.11.bb b/meta/recipes-extended/cronie/cronie_1.4.11.bb
deleted file mode 100644
index 02234f6..0000000
--- a/meta/recipes-extended/cronie/cronie_1.4.11.bb
+++ /dev/null
@@ -1,85 +0,0 @@
-SUMMARY = "Cron daemon for executing programs at set times"
-DESCRIPTION = "Cronie contains the standard UNIX daemon crond that runs \
-specified programs at scheduled times and related tools. It is based on the \
-original cron and has security and configuration enhancements like the \
-ability to use pam and SELinux."
-HOMEPAGE = "https://fedorahosted.org/cronie/"
-BUGTRACKER = "mmaslano@redhat.com"
-
-# Internet Systems Consortium License
-LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=963ea0772a2adbdcd607a9b2ec320c11 \
-                    file://src/cron.c;endline=20;md5=b425c334265026177128353a142633b4 \
-                    file://src/popen.c;beginline=3;endline=31;md5=edd50742d8def712e9472dba353668a9"
-
-SECTION = "utils"
-
-
-SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
-           file://fix-out-of-tree-build.patch \
-           file://crond.init \
-           file://crontab \
-           file://crond.service \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
-
-PAM_SRC_URI = "file://crond_pam_config.patch"
-PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
-
-SRC_URI[md5sum] = "2ba645cf54de17f138ef70312843862f"
-SRC_URI[sha256sum] = "fd08084cedddbb42499f80ddb7f2158195c3555c2ff40ee11d4ece2f9864d7be"
-
-inherit autotools update-rc.d useradd systemd
-
-
-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
-
-PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
-PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,${PAM_DEPS}"
-
-
-INITSCRIPT_NAME = "crond"
-INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."
-
-USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN} = "--system crontab"
-
-SYSTEMD_SERVICE_${PN} = "crond.service"
-
-do_install_append () {
-	install -d ${D}${sysconfdir}/sysconfig/
-	install -d ${D}${sysconfdir}/init.d/
-	install -m 0644 ${S}/crond.sysconfig ${D}${sysconfdir}/sysconfig/crond
-	install -m 0755 ${WORKDIR}/crond.init ${D}${sysconfdir}/init.d/crond
-
-	# install systemd unit files
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/crond.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
-	       -e 's,@SBINDIR@,${sbindir},g' \
-	       ${D}${systemd_unitdir}/system/crond.service
-
-	# below are necessary for a complete cron environment
-	install -d ${D}${localstatedir}/spool/cron
-	install -m 0755 ${WORKDIR}/crontab ${D}${sysconfdir}/
-	mkdir -p ${D}${sysconfdir}/cron.d
-	mkdir -p ${D}${sysconfdir}/cron.hourly
-	mkdir -p ${D}${sysconfdir}/cron.daily
-	mkdir -p ${D}${sysconfdir}/cron.weekly
-	mkdir -p ${D}${sysconfdir}/cron.monthly
-	touch ${D}${sysconfdir}/cron.deny
-	
-	# below setting is necessary to allow normal user using crontab
-
-	# setgid for crontab binary
-	chown root:crontab ${D}${bindir}/crontab
-	chmod 2755 ${D}${bindir}/crontab
-
-	# allow 'crontab' group write to /var/spool/cron
-	chown root:crontab ${D}${localstatedir}/spool/cron
-	chmod 770 ${D}${localstatedir}/spool/cron
-
-	chmod 600 ${D}${sysconfdir}/crontab
-}
-
-FILES_${PN} += "${sysconfdir}/cron*"
-
diff --git a/meta/recipes-extended/cronie/cronie_1.4.12.bb b/meta/recipes-extended/cronie/cronie_1.4.12.bb
new file mode 100644
index 0000000..3f06fac
--- /dev/null
+++ b/meta/recipes-extended/cronie/cronie_1.4.12.bb
@@ -0,0 +1,84 @@
+SUMMARY = "Cron daemon for executing programs at set times"
+DESCRIPTION = "Cronie contains the standard UNIX daemon crond that runs \
+specified programs at scheduled times and related tools. It is based on the \
+original cron and has security and configuration enhancements like the \
+ability to use pam and SELinux."
+HOMEPAGE = "https://fedorahosted.org/cronie/"
+BUGTRACKER = "mmaslano@redhat.com"
+
+# Internet Systems Consortium License
+LICENSE = "ISC & BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dd2a592170760e1386c769e1043b3722 \
+                    file://src/cron.c;endline=20;md5=b425c334265026177128353a142633b4 \
+                    file://src/popen.c;beginline=3;endline=31;md5=edd50742d8def712e9472dba353668a9"
+
+SECTION = "utils"
+
+
+SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
+           file://crond.init \
+           file://crontab \
+           file://crond.service \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+
+PAM_SRC_URI = "file://crond_pam_config.patch"
+PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
+
+SRC_URI[md5sum] = "199db91e514a4d75e3222d69874b132f"
+SRC_URI[sha256sum] = "0f5c9bf32f352599451c4ca0d6bc076d19e73ecfa5a90b34ecfe47c918c8bafd"
+
+inherit autotools update-rc.d useradd systemd
+
+
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+
+PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
+PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,${PAM_DEPS}"
+
+
+INITSCRIPT_NAME = "crond"
+INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system crontab"
+
+SYSTEMD_SERVICE_${PN} = "crond.service"
+
+do_install_append () {
+	install -d ${D}${sysconfdir}/sysconfig/
+	install -d ${D}${sysconfdir}/init.d/
+	install -m 0644 ${S}/crond.sysconfig ${D}${sysconfdir}/sysconfig/crond
+	install -m 0755 ${WORKDIR}/crond.init ${D}${sysconfdir}/init.d/crond
+
+	# install systemd unit files
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/crond.service ${D}${systemd_unitdir}/system
+	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+	       -e 's,@SBINDIR@,${sbindir},g' \
+	       ${D}${systemd_unitdir}/system/crond.service
+
+	# below are necessary for a complete cron environment
+	install -d ${D}${localstatedir}/spool/cron
+	install -m 0755 ${WORKDIR}/crontab ${D}${sysconfdir}/
+	mkdir -p ${D}${sysconfdir}/cron.d
+	mkdir -p ${D}${sysconfdir}/cron.hourly
+	mkdir -p ${D}${sysconfdir}/cron.daily
+	mkdir -p ${D}${sysconfdir}/cron.weekly
+	mkdir -p ${D}${sysconfdir}/cron.monthly
+	touch ${D}${sysconfdir}/cron.deny
+	
+	# below setting is necessary to allow normal user using crontab
+
+	# setgid for crontab binary
+	chown root:crontab ${D}${bindir}/crontab
+	chmod 2755 ${D}${bindir}/crontab
+
+	# allow 'crontab' group write to /var/spool/cron
+	chown root:crontab ${D}${localstatedir}/spool/cron
+	chmod 770 ${D}${localstatedir}/spool/cron
+
+	chmod 600 ${D}${sysconfdir}/crontab
+}
+
+FILES_${PN} += "${sysconfdir}/cron*"
+
-- 
1.9.1


