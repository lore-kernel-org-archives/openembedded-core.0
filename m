Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E21B73172
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 02:29:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0F2TFFA009078
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 18:29:15 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Jan 2016 18:29:15 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jan 2016 18:29:08 -0800
Message-ID: <48d1141e32643dbd80d90b49fd6fa4dacd5473d8.1452824908.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452824908.git.liezhi.yang@windriver.com>
References: <cover.1452824908.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] recipes-extended: cleanup CONFFILES
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
X-List-Received-Date: Fri, 15 Jan 2016 02:29:14 -0000
Content-Type: text/plain

The ${sysconfdir}/* are CONFFILES by default.

[YOCTO #8436]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/cronie/cronie_1.5.0.bb       |    1 -
 meta/recipes-extended/cups/cups.inc                |    1 -
 meta/recipes-extended/lighttpd/lighttpd_1.4.38.bb  |    2 --
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb |    3 +--
 meta/recipes-extended/pam/libpam_1.2.1.bb          |    5 -----
 meta/recipes-extended/procps/procps_3.3.11.bb      |    2 --
 meta/recipes-extended/sudo/sudo.inc                |    2 --
 meta/recipes-extended/sysklogd/sysklogd.inc        |    1 -
 meta/recipes-extended/tzdata/tzdata_2015g.bb       |    3 ---
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |    2 --
 10 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/meta/recipes-extended/cronie/cronie_1.5.0.bb b/meta/recipes-extended/cronie/cronie_1.5.0.bb
index 697501a..922ba00 100644
--- a/meta/recipes-extended/cronie/cronie_1.5.0.bb
+++ b/meta/recipes-extended/cronie/cronie_1.5.0.bb
@@ -78,4 +78,3 @@ do_install_append () {
 }
 
 FILES_${PN} += "${sysconfdir}/cron*"
-CONFFILES_${PN} += "${sysconfdir}/crontab"
diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 5aa365d..bc8f19a 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -116,7 +116,6 @@ FILES_${PN} += "${datadir}/doc/cups/images \
                 ${datadir}/doc/cups/*.css \
                 ${datadir}/icons/ \
                "
-CONFFILES_${PN} += "${sysconfdir}/cups/cupsd.conf"
 
 SYSROOT_PREPROCESS_FUNCS += "cups_sysroot_preprocess"
 cups_sysroot_preprocess () {
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.38.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.38.bb
index 7cfc141..6f6a14e 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.38.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.38.bb
@@ -67,8 +67,6 @@ do_install_append() {
 
 FILES_${PN} += "${sysconfdir} /www"
 
-CONFFILES_${PN} = "${sysconfdir}/lighttpd.conf"
-
 PACKAGES_DYNAMIC += "^lighttpd-module-.*"
 
 python populate_packages_prepend () {
diff --git a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
index 5f1a601..6688d8e 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
@@ -27,8 +27,7 @@ PACKAGECONFIG ?= "\
 PACKAGECONFIG[acl] = ",,acl"
 PACKAGECONFIG[selinux] = ",,libselinux"
 
-CONFFILES_${PN} += "${localstatedir}/lib/logrotate.status \
-		    ${sysconfdir}/logrotate.conf"
+CONFFILES_${PN} += "${localstatedir}/lib/logrotate.status"
 
 # If RPM_OPT_FLAGS is unset, it adds -g itself rather than obeying our
 # optimization variables, so use it rather than EXTRA_CFLAGS.
diff --git a/meta/recipes-extended/pam/libpam_1.2.1.bb b/meta/recipes-extended/pam/libpam_1.2.1.bb
index 3e69f11..cc5cb0f 100644
--- a/meta/recipes-extended/pam/libpam_1.2.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.2.1.bb
@@ -163,8 +163,3 @@ addtask pam_sanity before do_configure
 
 BBCLASSEXTEND = "nativesdk native"
 
-CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-session"
-CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-auth"
-CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-password"
-CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-session-noninteractive"
-CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-account"
diff --git a/meta/recipes-extended/procps/procps_3.3.11.bb b/meta/recipes-extended/procps/procps_3.3.11.bb
index c6dccc6..e842e47 100644
--- a/meta/recipes-extended/procps/procps_3.3.11.bb
+++ b/meta/recipes-extended/procps/procps_3.3.11.bb
@@ -42,8 +42,6 @@ do_install_append () {
         fi
 }
 
-CONFFILES_${PN} = "${sysconfdir}/sysctl.conf"
-
 bindir_progs = "free pkill pmap pgrep pwdx skill snice top uptime"
 base_bindir_progs += "kill pidof ps watch"
 base_sbindir_progs += "sysctl"
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index a25876b..2862450 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -19,8 +19,6 @@ inherit autotools
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
 
-CONFFILES_${PN} = "${sysconfdir}/sudoers"
-
 EXTRA_OECONF = "--with-editor=/bin/vi --with-env-editor"
 
 EXTRA_OECONF_append_libc-musl = " --disable-hardening "
diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 85b3cdc..aed4412 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -22,7 +22,6 @@ SRC_URI = "http://www.infodrom.org/projects/sysklogd/download/sysklogd-${PV}.tar
 SRC_URI_append_e500v2 = " file://no-vectorization.patch"
 
 INITSCRIPT_NAME = "syslog"
-CONFFILES_${PN} = "${sysconfdir}/syslog.conf.${BPN}"
 
 CFLAGS_append = " -DSYSV"
 
diff --git a/meta/recipes-extended/tzdata/tzdata_2015g.bb b/meta/recipes-extended/tzdata/tzdata_2015g.bb
index a6faa1d..4a573d1 100644
--- a/meta/recipes-extended/tzdata/tzdata_2015g.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2015g.bb
@@ -207,6 +207,3 @@ FILES_${PN} += "${datadir}/zoneinfo/Pacific/Honolulu     \
                 ${datadir}/zoneinfo/zone.tab             \
                 ${datadir}/zoneinfo/iso3166.tab          \
                 ${datadir}/zoneinfo/Etc/*"
-
-CONFFILES_${PN} += "${@ "${sysconfdir}/timezone" if bb.utils.to_boolean(d.getVar('INSTALL_TIMEZONE_FILE', True)) else "" }"
-CONFFILES_${PN} += "${sysconfdir}/localtime"
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 652fe91..3996bfa 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -68,5 +68,3 @@ do_install() {
 	       -e 's,@SBINDIR@,${sbindir},g' \
 	       ${D}${systemd_unitdir}/system/xinetd.service
 }
-
-CONFFILES_${PN} = "${sysconfdir}/xinetd.conf"
-- 
1.7.9.5


