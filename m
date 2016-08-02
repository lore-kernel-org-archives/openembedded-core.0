Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EA9786612C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 15:12:30 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 02 Aug 2016 08:11:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,460,1464678000"; d="scan'208";a="149405177"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga004.fm.intel.com with ESMTP; 02 Aug 2016 08:11:31 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Aug 2016 15:08:36 +0000
Message-Id: <1470150516-16760-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH v2] cronie: upgrade to 1.5.1
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
X-List-Received-Date: Tue, 02 Aug 2016 15:12:31 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../cronie/cronie/crond_pam_config.patch           | 15 ++--
 meta/recipes-extended/cronie/cronie_1.5.0.bb       | 81 ----------------------
 meta/recipes-extended/cronie/cronie_1.5.1.bb       | 81 ++++++++++++++++++++++
 3 files changed, 90 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-extended/cronie/cronie_1.5.0.bb
 create mode 100644 meta/recipes-extended/cronie/cronie_1.5.1.bb

diff --git a/meta/recipes-extended/cronie/cronie/crond_pam_config.patch b/meta/recipes-extended/cronie/cronie/crond_pam_config.patch
index 675872c..6c92816 100644
--- a/meta/recipes-extended/cronie/cronie/crond_pam_config.patch
+++ b/meta/recipes-extended/cronie/cronie/crond_pam_config.patch
@@ -4,16 +4,19 @@ configure files instead.
 Upstream-Status: Pending
 
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---- cronie-1.4.7/pam/crond.orig	2010-12-16 16:59:02.000000000 +0800
-+++ cronie-1.4.7/pam/crond	2011-07-20 09:47:16.080819203 +0800
-@@ -4,7 +4,7 @@
+Index: cronie-1.5.1/pam/crond
+===================================================================
+--- cronie-1.5.1.orig/pam/crond
++++ cronie-1.5.1/pam/crond
+@@ -4,8 +4,8 @@
  #
- # No PAM authentication called, auth modules not needed
+ # Although no PAM authentication is called, auth modules
+ # are used for credential setting
+-auth       include    password-auth
++auth       include    common-auth
  account    required   pam_access.so
 -account    include    password-auth
 +account    include    common-account
  session    required   pam_loginuid.so
 -session    include    password-auth
--auth       include    password-auth
 +session    include    common-session-noninteractive
-+auth       include    common-auth
diff --git a/meta/recipes-extended/cronie/cronie_1.5.0.bb b/meta/recipes-extended/cronie/cronie_1.5.0.bb
deleted file mode 100644
index 697501a..0000000
--- a/meta/recipes-extended/cronie/cronie_1.5.0.bb
+++ /dev/null
@@ -1,81 +0,0 @@
-SUMMARY = "Cron daemon for executing programs at set times"
-DESCRIPTION = "Cronie contains the standard UNIX daemon crond that runs \
-specified programs at scheduled times and related tools. It is based on the \
-original cron and has security and configuration enhancements like the \
-ability to use pam and SELinux."
-HOMEPAGE = "https://fedorahosted.org/cronie/"
-BUGTRACKER = "https://bugzilla.redhat.com"
-
-# Internet Systems Consortium License
-LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=dd2a592170760e1386c769e1043b3722 \
-                    file://src/cron.c;endline=20;md5=b425c334265026177128353a142633b4 \
-                    file://src/popen.c;beginline=3;endline=31;md5=edd50742d8def712e9472dba353668a9"
-
-SECTION = "utils"
-
-SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
-           file://crond.init \
-           file://crontab \
-           file://crond.service \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
-
-PAM_SRC_URI = "file://crond_pam_config.patch"
-PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
-
-SRC_URI[md5sum] = "9db75e1884d83a45e002d145c6c54d45"
-SRC_URI[sha256sum] = "9cf0e3f4f5042a9c09413d62c8e0c055e12401f70b112465f0f81f2c84ebfb3f"
-
-inherit autotools update-rc.d useradd systemd
-
-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
-
-PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
-PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,${PAM_DEPS}"
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
-CONFFILES_${PN} += "${sysconfdir}/crontab"
diff --git a/meta/recipes-extended/cronie/cronie_1.5.1.bb b/meta/recipes-extended/cronie/cronie_1.5.1.bb
new file mode 100644
index 0000000..99b2bb5
--- /dev/null
+++ b/meta/recipes-extended/cronie/cronie_1.5.1.bb
@@ -0,0 +1,81 @@
+SUMMARY = "Cron daemon for executing programs at set times"
+DESCRIPTION = "Cronie contains the standard UNIX daemon crond that runs \
+specified programs at scheduled times and related tools. It is based on the \
+original cron and has security and configuration enhancements like the \
+ability to use pam and SELinux."
+HOMEPAGE = "https://fedorahosted.org/cronie/"
+BUGTRACKER = "https://bugzilla.redhat.com"
+
+# Internet Systems Consortium License
+LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dd2a592170760e1386c769e1043b3722 \
+                    file://src/cron.c;endline=20;md5=b425c334265026177128353a142633b4 \
+                    file://src/popen.c;beginline=3;endline=31;md5=edd50742d8def712e9472dba353668a9"
+
+SECTION = "utils"
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
+SRC_URI[md5sum] = "910e6effcc032998b0a49fbd46322e18"
+SRC_URI[sha256sum] = "6c73666102a6b5d35e2eaf1bd06925f2d4b0cef8d3323c37286dda3089a85338"
+
+inherit autotools update-rc.d useradd systemd
+
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+
+PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
+PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,${PAM_DEPS}"
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
+CONFFILES_${PN} += "${sysconfdir}/crontab"
-- 
2.6.6


