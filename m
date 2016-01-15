Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9C4C765CC2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 02:29:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0F2TGnc018919
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 18:29:16 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Jan 2016 18:29:15 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jan 2016 18:29:09 -0800
Message-ID: <f5a967027e053c87c2acb4c089a77a7c14805316.1452824908.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452824908.git.liezhi.yang@windriver.com>
References: <cover.1452824908.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] recipes-core: cleanup CONFFILES
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
X-List-Received-Date: Fri, 15 Jan 2016 02:29:15 -0000
Content-Type: text/plain

The ${sysconfdir}/* are CONFFILES by default.

[YOCTO #8436]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    4 ----
 meta/recipes-core/busybox/busybox.inc              |    3 ---
 meta/recipes-core/dbus/dbus_1.8.20.bb              |    2 --
 meta/recipes-core/glibc/glibc-package.inc          |    1 -
 .../init-ifupdown/init-ifupdown_1.0.bb             |    1 -
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 --
 meta/recipes-core/netbase/netbase_5.3.bb           |    2 --
 meta/recipes-core/readline/readline.inc            |    2 --
 meta/recipes-core/systemd/systemd_228.bb           |    7 -------
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    1 -
 meta/recipes-core/udev/udev-extraconf_1.1.bb       |    1 -
 11 files changed, 26 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index d391707..d61b58b 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -174,7 +174,3 @@ FILES_${PN} = "/"
 FILES_${PN}-doc = "${docdir} ${datadir}/common-licenses"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-CONFFILES_${PN} = "${sysconfdir}/fstab ${@['', '${sysconfdir}/hostname'][(d.getVar('hostname', True) != '')]} ${sysconfdir}/shells"
-CONFFILES_${PN} += "${sysconfdir}/motd ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile"
-
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 9541123..858468a 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -42,9 +42,6 @@ INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
 SYSTEMD_PACKAGES = "${PN}-syslog"
 SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
 
-CONFFILES_${PN}-syslog = "${sysconfdir}/syslog-startup.conf.${BPN}"
-CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
-
 RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
 
 inherit cml1 systemd update-rc.d ptest
diff --git a/meta/recipes-core/dbus/dbus_1.8.20.bb b/meta/recipes-core/dbus/dbus_1.8.20.bb
index 0c7f6b1..9063273 100644
--- a/meta/recipes-core/dbus/dbus_1.8.20.bb
+++ b/meta/recipes-core/dbus/dbus_1.8.20.bb
@@ -39,8 +39,6 @@ USERADD_PARAM_${PN} = "--system --home ${localstatedir}/lib/dbus \
                        --no-create-home --shell /bin/false \
                        --user-group messagebus"
 
-CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session.conf"
-
 DEBIANNAME_${PN} = "dbus-1"
 
 PACKAGES =+ "${PN}-lib"
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index bad6424..c7d44af 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -208,7 +208,6 @@ pkg_postinst_nscd () {
 		fi
 	fi
 }
-CONFFILES_nscd="${sysconfdir}/nscd.conf"
 
 SYSTEMD_PACKAGES = "nscd"
 SYSTEMD_SERVICE_nscd = "nscd.service"
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
index 733ae41..e8d87be 100644
--- a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
@@ -38,4 +38,3 @@ PACKAGE_ARCH_qemuall = "${MACHINE_ARCH}"
 RDEPENDS_${PN} = "netbase"
 RCONFLICTS_${PN} = "netbase (< 1:5.0)"
 
-CONFFILES_${PN} = "${sysconfdir}/network/interfaces"
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index f90de6e..bd3795f 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -178,5 +178,3 @@ pkg_postinst_${PN} () {
         rm -f "/etc/volatile.cache"
     fi
 }
-
-CONFFILES_${PN} += "${sysconfdir}/init.d/checkroot.sh"
diff --git a/meta/recipes-core/netbase/netbase_5.3.bb b/meta/recipes-core/netbase/netbase_5.3.bb
index ccd89ff..7cff754 100644
--- a/meta/recipes-core/netbase/netbase_5.3.bb
+++ b/meta/recipes-core/netbase/netbase_5.3.bb
@@ -20,5 +20,3 @@ do_install () {
 	install -m 0644 etc-protocols ${D}${sysconfdir}/protocols
 	install -m 0644 etc-services ${D}${sysconfdir}/services
 }
-
-CONFFILES_${PN} = "${sysconfdir}/hosts"
diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index 35df8b4..f4fd077 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -38,5 +38,3 @@ do_install_append () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
-
-CONFFILES_${PN} += "${sysconfdir}/inputrc"
diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_228.bb
index aa2e846..cbad8b8 100644
--- a/meta/recipes-core/systemd/systemd_228.bb
+++ b/meta/recipes-core/systemd/systemd_228.bb
@@ -280,13 +280,6 @@ RRECOMMENDS_${PN}-binfmt = "kernel-module-binfmt-misc"
 
 RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts kbd-keymaps"
 
-CONFFILES_${PN} = "${sysconfdir}/machine-id \
-                ${sysconfdir}/systemd/coredump.conf \
-                ${sysconfdir}/systemd/journald.conf \
-                ${sysconfdir}/systemd/logind.conf \
-                ${sysconfdir}/systemd/system.conf \
-                ${sysconfdir}/systemd/user.conf"
-
 FILES_${PN} = " ${base_bindir}/* \
                 ${datadir}/bash-completion \
                 ${datadir}/dbus-1/services \
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index f539da8d..7a8b2ea 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -77,7 +77,6 @@ fi
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 FILES_${PN} = "${sysconfdir}/inittab ${sysconfdir}/init.d/start_getty"
-CONFFILES_${PN} = "${sysconfdir}/inittab"
 
 USE_VT ?= "1"
 SYSVINIT_ENABLED_GETTYS ?= "1"
diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
index ecd4a8a..36aeafa 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -34,7 +34,6 @@ do_install() {
 
 FILES_${PN} = "${sysconfdir}/udev"
 RDEPENDS_${PN} = "udev"
-CONFFILES_${PN} = "${sysconfdir}/udev/mount.blacklist"
 
 # to replace udev-extra-rules from meta-oe
 RPROVIDES_${PN} = "udev-extra-rules"
-- 
1.7.9.5


