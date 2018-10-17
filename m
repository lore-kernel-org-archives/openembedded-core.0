Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EABE079B65
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 16:44:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9HGhgpY005162
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 09:43:58 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 17 Oct 2018 09:43:57 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Oct 2018 12:43:23 -0400
Message-ID: <20181017164326.67111-2-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.16.0.rc2
In-Reply-To: <20181017164326.67111-1-mark.hatle@windriver.com>
References: <20181017164326.67111-1-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] systemd: Remove items that made this machine (qemu) specific
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
X-List-Received-Date: Wed, 17 Oct 2018 16:44:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Create a new systemd-conf recipe to contain the specific system/machine
configuration items.  This new package is now machine specific.

Without doing this trying to create a single system with multiple BSPs,
one of which was qemu based, would result in the systemd -and- everything that
dependend upon systemd to have their hash changed.  The hash changing means
lots of rebuilds, but worse if it's a package based system each different
machine ends with a new PR value and a newly generated package.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/systemd/systemd-conf.bb     | 51 +++++++++++++++++++
 ...ange-the-default-device-timeout-to-2.patch | 35 -------------
 meta/recipes-core/systemd/systemd_239.bb      | 28 ++++------
 3 files changed, 60 insertions(+), 54 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd-conf.bb
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch

diff --git a/meta/recipes-core/systemd/systemd-conf.bb b/meta/recipes-core/systemd/systemd-conf.bb
new file mode 100644
index 0000000000..d39742b3a8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-conf.bb
@@ -0,0 +1,51 @@
+require systemd.inc
+
+SUMMARY = "Systemd system configuration"
+DESCRIPTION = "Systemd may require slightly different configuration for \
+different machines.  For example, qemu machines require a longer \
+DefaultTimeoutStartSec setting."
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+CONFFILES_${PN} = "${sysconfdir}/machine-id \
+${sysconfdir}/systemd/coredump.conf \
+${sysconfdir}/systemd/journald.conf \
+${sysconfdir}/systemd/logind.conf \
+${sysconfdir}/systemd/system.conf \
+${sysconfdir}/systemd/user.conf"
+
+FILES_${PN} = "${sysconfdir}/machine-id ${sysconfdir}/systemd"
+
+do_compile[noexec] = '1'
+
+do_install() {
+	install -d ${D}/${sysconfdir}/systemd
+
+	# Create machine-id
+	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
+	touch ${D}${sysconfdir}/machine-id
+
+	install -m 0644 ${S}/src/coredump/coredump.conf ${D}${sysconfdir}/systemd/coredump.conf
+
+	install -m 0644 ${S}/src/journal/journald.conf ${D}${sysconfdir}/systemd/journald.conf
+	# Enable journal to forward message to syslog daemon
+	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=yes/' ${D}${sysconfdir}/systemd/journald.conf
+	# Set the maximium size of runtime journal to 64M as default
+	sed -i -e 's/.*RuntimeMaxUse.*/RuntimeMaxUse=64M/' ${D}${sysconfdir}/systemd/journald.conf
+
+	install -m 0644 ${S}/src/login/logind.conf.in ${D}${sysconfdir}/systemd/logind.conf
+	# Set KILL_USER_PROCESSES to yes
+	sed -i -e 's/@KILL_USER_PROCESSES@/yes/' ${D}${sysconfdir}/systemd/logind.conf
+
+	install -m 0644 ${S}/src/core/system.conf.in ${D}${sysconfdir}/systemd/system.conf
+	# Set MEMORY_ACCOUNTING_DEFAULT to yes
+	sed -i -e 's/@MEMORY_ACCOUNTING_DEFAULT@/yes/' ${D}${sysconfdir}/systemd/system.conf
+
+	install -m 0644 ${S}/src/core/user.conf ${D}${sysconfdir}/systemd/user.conf
+}
+
+# Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa2867be31759c1b52
+do_install_append_qemuall() {
+	# Change DefaultTimeoutStartSec from 90s to 240s
+        echo "DefaultTimeoutStartSec = 240s"
+}
diff --git a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
deleted file mode 100644
index fd7bf3fcf6..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 2925c0c3b6ce4056622b86c1c61ee14add430790 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Thu, 28 Jun 2018 10:56:29 +0800
-Subject: [PATCH] core/device.c: Change the default device timeout to 240 sec.
- MIME-Version: 1.0 Content-Type: text/plain; charset=UTF-8
- Content-Transfer-Encoding: 8bit
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [Specific case QEMU/AB]
-
-Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/core/device.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/core/device.c b/src/core/device.c
-index a2d00a0fb..f26e55ebb 100644
---- a/src/core/device.c
-+++ b/src/core/device.c
-@@ -95,7 +95,7 @@ static void device_init(Unit *u) {
-          * indefinitely for plugged in devices, something which cannot
-          * happen for the other units since their operations time out
-          * anyway. */
--        u->job_running_timeout = u->manager->default_timeout_start_usec;
-+        u->job_running_timeout = (240 * USEC_PER_SEC);
- 
-         u->ignore_on_isolate = true;
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 7ed932141d..bc16407e09 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -31,7 +31,6 @@ SRC_URI += "file://touchscreen.rules \
            file://0022-build-sys-Detect-whether-struct-statx-is-defined-in-.patch \
            file://0023-resolvconf-fixes-for-the-compatibility-interface.patch \
            "
-SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
 # patches made for musl are only applied on TCLIBC is musl
 SRC_URI += "${SRC_URI_MUSL}"
@@ -218,10 +217,6 @@ do_install() {
 	[ ! -e ${D}/init ] && ln -s ${rootlibexecdir}/systemd/systemd ${D}/init
 	[ ! -e ${D}/${base_sbindir}/udevd ] && ln -s ${rootlibexecdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd
 
-	# Create machine-id
-	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
-	touch ${D}${sysconfdir}/machine-id
-
 	install -d ${D}${sysconfdir}/udev/rules.d/
 	install -d ${D}${sysconfdir}/tmpfiles.d
 	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
@@ -256,11 +251,6 @@ do_install() {
 		ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/rescue.target.wants/systemd-update-utmp-runlevel.service
 	fi
 
-	# Enable journal to forward message to syslog daemon
-	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=yes/' ${D}${sysconfdir}/systemd/journald.conf
-	# Set the maximium size of runtime journal to 64M as default
-	sed -i -e 's/.*RuntimeMaxUse.*/RuntimeMaxUse=64M/' ${D}${sysconfdir}/systemd/journald.conf
-
 	# this file is needed to exist if networkd is disabled but timesyncd is still in use since timesyncd checks it
 	# for existence else it fails
 	if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ]; then
@@ -284,6 +274,14 @@ do_install() {
 			chown polkitd:root ${D}${datadir}/polkit-1/rules.d
 		fi
 	fi
+
+	# conf files are handled by systemd-conf
+	rm -f ${D}${sysconfdir}/machine-id
+	rm -f ${D}${sysconfdir}/systemd/coredump.conf
+	rm -f ${D}${sysconfdir}/systemd/journald.conf
+	rm -f ${D}${sysconfdir}/systemd/logind.conf
+	rm -f ${D}${sysconfdir}/systemd/system.conf
+	rm -f ${D}${sysconfdir}/systemd/user.conf
 }
 
 
@@ -433,13 +431,6 @@ FILES_${PN}-extra-utils = "\
                         ${rootlibexecdir}/systemd/systemd-cgroups-agent \
 "
 
-CONFFILES_${PN} = "${sysconfdir}/machine-id \
-                ${sysconfdir}/systemd/coredump.conf \
-                ${sysconfdir}/systemd/journald.conf \
-                ${sysconfdir}/systemd/logind.conf \
-                ${sysconfdir}/systemd/system.conf \
-                ${sysconfdir}/systemd/user.conf"
-
 FILES_${PN} = " ${base_bindir}/* \
                 ${base_sbindir}/shutdown \
                 ${base_sbindir}/halt \
@@ -455,7 +446,6 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${datadir}/${BPN} \
                 ${datadir}/factory \
                 ${sysconfdir}/dbus-1/ \
-                ${sysconfdir}/machine-id \
                 ${sysconfdir}/modules-load.d/ \
                 ${sysconfdir}/pam.d/ \
                 ${sysconfdir}/sysctl.d/ \
@@ -504,7 +494,7 @@ FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ $
 
 RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV}) util-linux-agetty util-linux-fsck"
 RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
-RDEPENDS_${PN} += "volatile-binds update-rc.d"
+RDEPENDS_${PN} += "volatile-binds update-rc.d systemd-conf"
 
 RRECOMMENDS_${PN} += "systemd-extra-utils \
                       systemd-compat-units udev-hwdb \
-- 
2.18.0


