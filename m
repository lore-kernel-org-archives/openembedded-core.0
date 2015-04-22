Return-Path: <bruno.bottazzini@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DF75A73D59
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 17:01:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 22 Apr 2015 10:01:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,624,1422950400"; d="scan'208";a="717574025"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2015 10:01:44 -0700
Received: from orsmsx156.amr.corp.intel.com (10.22.240.22) by
	ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 22 Apr 2015 10:01:43 -0700
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX156.amr.corp.intel.com (10.22.240.22) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 22 Apr 2015 10:01:42 -0700
Received: from bottazzini-ThinkPad-T430.bz.intel.com (10.218.98.147) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 22 Apr 2015 10:01:41 -0700
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Apr 2015 14:01:12 -0300
Message-ID: <1429722072-13369-4-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1429722072-13369-1-git-send-email-bruno.bottazzini@intel.com>
References: <1429722072-13369-1-git-send-email-bruno.bottazzini@intel.com>
MIME-Version: 1.0
X-Originating-IP: [10.218.98.147]
Subject: [PATCH 3/3] systemd: split modules into packages
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
X-List-Received-Date: Wed, 22 Apr 2015 17:01:57 -0000
Content-Type: text/plain

if one wants to launch a simple deamon, most modules are not
required.
He will be able to save space and exclude unwanted packages
from the final image.
---
 meta/recipes-core/systemd/systemd_219.bb | 1075 ++++++++++++++++++++++++++----
 1 file changed, 943 insertions(+), 132 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index d1303f7..d86068c 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -19,7 +19,7 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
+DEPENDS = "util-linux intltool-native gperf-native readline libcap libcgroup qemu-native"
 
 SECTION = "base/shell"
 
@@ -58,23 +58,45 @@ LDFLAGS_append_libc-uclibc = " -lrt"
 
 GTKDOC_DOCDIR = "${S}/docs/"
 
-PACKAGECONFIG ??= "xz ldconfig \
+PACKAGECONFIG ??= " \
+                   gcrypt \
+                   kmod \
+                   ldconfig \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'blkid', 'blkid', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'efi', 'efi', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'lz4', 'lz4', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'xz', 'xz', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'libidn', 'libidn', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)}"
 
+PACKAGECONFIG[glib] = "--enable-gudev,--disable-gudev,glib-2.0"
+PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
+PACKAGECONFIG[blkid] = "--enable-blkid,--disable-blkid,util-linux"
+PACKAGECONFIG[efi] = "--enable-efi,--disable-efi"
+PACKAGECONFIG[kmod] = "--enable-kmod,--disable-kmod,kmod"
+PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,,polkit"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
+PACKAGECONFIG[smack] = "--enable-smack,--disable-smack"
+PACKAGECONFIG[ima] = "--enable-ima,--disable-ima"
+PACKAGECONFIG[apparmor] = "--enable-apparmor,--disable-apparmor,libapparmor"
+PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
+PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
 PACKAGECONFIG[journal-upload] = "--enable-libcurl,--disable-libcurl,curl"
 # Sign the journal for anti-tampering
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
 # regardless of PACKAGECONFIG, libgcrypt is always required to expand
 # the AM_PATH_LIBGCRYPT autoconf macro
-DEPENDS += "libgcrypt"
 # Compress the journal
+PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
 PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
+PACKAGECONFIG[qrencode] = "--enable-qrencode,--disable-qrencode,libqrencode"
+PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
 PACKAGECONFIG[cryptsetup] = "--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"
 PACKAGECONFIG[microhttpd] = "--enable-microhttpd,--disable-microhttpd,libmicrohttpd"
 PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,elfutils"
 PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
-PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
 PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
 PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit"
 PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
@@ -97,17 +119,33 @@ rootprefix ?= "${base_prefix}"
 rootlibdir ?= "${base_libdir}"
 rootlibexecdir = "${rootprefix}/lib"
 
-# The gtk+ tools should get built as a separate recipe e.g. systemd-tools
 EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --with-rootlibdir=${rootlibdir} \
-                 --with-roothomedir=${ROOT_HOME} \
-                 --disable-coredump \
+                 --enable-coredump \
                  --disable-introspection \
-                 --disable-kdbus \
+                 --enable-kdbus \
+                 --disable-manpages \
                  --enable-split-usr \
                  --without-python \
                  --with-sysvrcnd-path=${sysconfdir} \
                  --with-firmware-path=/lib/firmware \
+                 --enable-libcurl \
+                 --enable-ldconfig \
+                 --enable-backlight \
+                 --enable-binfmt \
+                 --enable-bootchart \
+                 --enable-firstboot \
+                 --enable-hostnamed \
+                 --enable-localed \
+                 --enable-logind \
+                 --enable-machined \
+                 --enable-networkd \
+                 --enable-quotacheck \
+                 --enable-randomseed \
+                 --enable-resolved \
+                 --enable-rfkill \
+                 --enable-sysusers \
+                 --enable-vconsole \
                "
 # uclibc does not have NSS
 EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
@@ -202,158 +240,748 @@ do_install_ptest () {
 
 python populate_packages_prepend (){
     systemdlibdir = d.getVar("rootlibdir", True)
-    do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
+    do_split_packages(d, systemdlibdir, '^lib(udev|gudev|systemd|nss)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
 }
-PACKAGES_DYNAMIC += "^lib(udev|systemd).*"
+PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd|nss).*"
+
+########################################################################
+# Base Packages
+########################################################################
+
+PACKAGES =+ "${PN}-generators-filesystems"
+SUMMARY_${PN}-generators-filesystems = "systemd's generator for filesystem services based on fstab and GPT"
+RDEPENDS_${PN}-generators-filesystems = "${PN}-services-fsck"
+FILES_${PN}-generators-filesystems = "\
+        ${rootlibexecdir}/systemd/system-generators/systemd-fstab-generator \
+        ${rootlibexecdir}/systemd/system-generators/systemd-gpt-auto-generator \
+        ${rootlibexecdir}/systemd/systemd-remount-fs \
+        ${systemd_unitdir}/system/local-fs.target.wants/systemd-remount-fs.service \
+        ${systemd_unitdir}/system/systemd-remount-fs.service \
+"
 
-PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install \
-             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh libgudev"
+PACKAGES =+ "${PN}-generators-getty"
+SUMMARY_${PN}-generators-getty = "systemd's generator TTY services"
+RDEPENDS_${PN}-generators-getty = "${PN}-services-getty"
+FILES_${PN}-generators-getty = "\
+        ${rootlibexecdir}/systemd/system-generators/systemd-getty-generator \
+"
 
-SYSTEMD_PACKAGES = "${PN}-binfmt"
-SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
+PACKAGES =+ "${PN}-tools"
+SUMMARY_${PN}-tools = "systemd command line tools (cgls, delta, run, analyze...)"
+RRECOMMENDS_${PN}-tools = "${PN}-services-base"
+FILES_${PN}-tools = "\
+        ${base_bindir}/systemd-machine-id-setup \
+        ${bindir}/busctl \
+        ${bindir}/coredumpctl \
+        ${bindir}/systemd-analyze \
+        ${bindir}/systemd-cat \
+        ${bindir}/systemd-cgls \
+        ${bindir}/systemd-cgtop \
+        ${bindir}/systemd-delta \
+        ${bindir}/systemd-detect-virt \
+        ${bindir}/systemd-path \
+        ${bindir}/systemd-run \
+        ${rootlibexecdir}/systemd/systemd-ac-power \
+        ${rootlibexecdir}/systemd/systemd-activate \
+        ${rootlibexecdir}/systemd/systemd-reply-password \
+        ${rootprefix}/bin/systemd-escape \
+        ${rootprefix}/bin/systemd-notify \
+"
 
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} += "--system systemd-journal-gateway; --system systemd-timesync"
-GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
+########################################################################
+# Services Packages
+########################################################################
+
+PACKAGES =+ "${PN}-services-ask-password"
+SUMMARY_${PN}-services-ask-password = "systemd's service and tool to query the user for a system password"
+RRECOMMENDS_${PN}-services-ask-password = "${PN}-services-base"
+FILES_${PN}-services-ask-password = "\
+        ${rootprefix}/bin/systemd-ask-password \
+        ${rootprefix}/bin/systemd-tty-ask-password-agent \
+        ${systemd_unitdir}/system/multi-user.target.wants/systemd-ask-password-wall.path \
+        ${systemd_unitdir}/system/sysinit.target.wants/systemd-ask-password-console.path \
+        ${systemd_unitdir}/system/systemd-ask-password-console.path \
+        ${systemd_unitdir}/system/systemd-ask-password-console.service \
+        ${systemd_unitdir}/system/systemd-ask-password-wall.path \
+        ${systemd_unitdir}/system/systemd-ask-password-wall.service \
+"
 
-FILES_${PN}-analyze = "${bindir}/systemd-analyze"
+PACKAGES =+ "${PN}-services-backlight"
+SUMMARY_${PN}-services-backlight = "systemd's backlight state save/restore service"
+FILES_${PN}-services-backlight = "\
+        ${systemd_unitdir}/system/systemd-backlight@.service \
+        ${rootlibexecdir}/systemd/systemd-backlight \
+"
 
-FILES_${PN}-initramfs = "/init"
-RDEPENDS_${PN}-initramfs = "${PN}"
+PACKAGES =+ "${PN}-services-binfmt"
+SUMMARY_${PN}-services-binfmt = "systemd's service to configure additional binary formats for executables"
+RRECOMMENDS_${PN}-services-binfmt = "kernel-module-binfmt-misc"
+FILES_${PN}-services-binfmt = "\
+        ${sysconfdir}/binfmt.d/ \
+        ${exec_prefix}/lib/binfmt.d/ \
+        ${systemd_unitdir}/system/proc-sys-fs-binfmt_misc.automount \
+        ${systemd_unitdir}/system/proc-sys-fs-binfmt_misc.mount \
+        ${systemd_unitdir}/system/sysinit.target.wants/proc-sys-fs-binfmt_misc.automount \
+        ${systemd_unitdir}/system/proc-sys-fs-binfmt_misc.* \
+        ${systemd_unitdir}/system/sysinit.target.wants/systemd-binfmt.service \
+        ${systemd_unitdir}/system/systemd-binfmt.service \
+        ${rootlibexecdir}/systemd/systemd-binfmt \
+"
 
-FILES_libgudev = "${libdir}/libgudev*${SOLIBS}"
+PACKAGES =+ "${PN}-services-bootchart"
+SUMMARY_${PN}-services-bootchart = "systemd's boot performance service and graphing tool"
+CONFFILES_${PN}-services-bootchart = "${sysconfdir}/systemd/bootchart.conf"
+FILES_${PN}-services-bootchart = "\
+        ${sysconfdir}/systemd/bootchart.conf \
+        ${rootlibexecdir}/systemd/systemd-bootchart \
+"
 
-RDEPENDS_${PN}-ptest += "perl python bash"
-FILES_${PN}-ptest += "${libdir}/udev/rules.d"
+PACKAGES =+ "${PN}-services-coredump"
+SUMMARY_${PN}-services-coredump = "systemd's coredump log hook and service"
+RDEPENDS_${PN}-services-coredump = "${PN}-services-sysctl"
+CONFFILES_${PN}-services-coredump = "${sysconfdir}/systemd/coredump.conf"
+FILES_${PN}-services-coredump = "\
+        ${exec_prefix}/lib/sysctl.d/50-coredump.conf \
+        ${sysconfdir}/systemd/coredump.conf \
+        ${rootlibexecdir}/systemd/systemd-coredump \
+"
+
+PACKAGES =+ "${PN}-services-cryptsetup"
+SUMMARY_${PN}-services-cryptsetup = "systemd's disk decryption service"
+ALLOW_EMPTY_${PN}-services-cryptsetup = "1"
+FILES_${PN}-services-cryptsetup = "\
+        ${rootlibexecdir}/systemd/system-generators/systemd-cryptsetup-generator \
+        ${systemd_unitdir}/system/cryptsetup-pre.target \
+        ${systemd_unitdir}/system/cryptsetup.target \
+        ${systemd_unitdir}/system/sysinit.target.wants/cryptsetup.target \
+        ${rootlibexecdir}/systemd/systemd-cryptsetup \
+"
+
+PACKAGES =+ "${PN}-services-dbus"
+SUMMARY_${PN}-services-dbus = "systemd's DBus daemon system service"
+# NOTE: dbus dependency will go away when kdbus is in use
+RDEPENDS_${PN}-services-dbus = "dbus"
+FILES_${PN}-services-dbus = "\
+        ${datadir}/dbus-1/services/org.freedesktop.systemd1.service \
+        ${datadir}/dbus-1/system-services/org.freedesktop.systemd1.service \
+        ${datadir}/dbus-1/system-services/org.freedesktop.import1.service \
+        ${sysconfdir}/dbus-1/system.d/org.freedesktop.systemd1.conf \
+        ${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.conf \
+        ${systemd_unitdir}/system/sockets.target.wants/dbus.socket \
+        ${systemd_unitdir}/system/dbus.target.wants/dbus.socket \
+        ${systemd_unitdir}/system/multi-user.target.wants/dbus.service \
+        ${systemd_unitdir}/system/dbus.socket \
+        ${systemd_unitdir}/system/dbus.service \
+"
+
+PACKAGES =+ "${PN}-services-debug"
+SUMMARY_${PN}-services-debug = "systemd's debug service"
+RRECOMMENDS_${PN}-services-debug = "${PN}-services-base ${PN}-tools"
+FILES_${PN}-services-debug = "\
+        ${rootlibexecdir}/systemd/system-generators/systemd-debug-generator \
+        ${systemd_unitdir}/system/debug-shell.service \
+        ${systemd_unitdir}/system/sys-kernel-config.mount \
+        ${systemd_unitdir}/system/sys-kernel-debug.mount \
+        ${systemd_unitdir}/system/sysinit.target.wants/sys-kernel-config.mount \
+        ${systemd_unitdir}/system/sysinit.target.wants/sys-kernel-debug.mount \
+"
 
-FILES_${PN}-dbg += "${libdir}/systemd/ptest/.debug"
+PACKAGES =+ "${PN}-services-firstboot"
+SUMMARY_${PN}-services-firstboot = "systemd's service to initialize basic system settings"
+FILES_${PN}-services-firstboot = "\
+        ${base_bindir}/systemd-firstboot \
+        ${systemd_unitdir}/system/sysinit.target.wants/systemd-firstboot.service \
+        ${systemd_unitdir}/system/systemd-firstboot.service \
+"
+
+PACKAGES =+ "${PN}-services-fsck"
+SUMMARY_${PN}-services-fsck = "systemd's filesystem check service"
+RRECOMMENDS_${PN}-services-fsck = "util-linux-fsck e2fsprogs-e2fsck"
+FILES_${PN}-services-fsck = "\
+        ${systemd_unitdir}/system/systemd-fsck-root.service \
+        ${systemd_unitdir}/system/systemd-fsck@.service \
+        ${rootlibexecdir}/systemd/systemd-fsck \
+"
+
+PACKAGES =+ "${PN}-services-fuse"
+SUMMARY_${PN}-services-fuse = "systemd's FUSE (filesystem in userspace) service"
+FILES_${PN}-services-fuse = "\
+        ${systemd_unitdir}/system/sysinit.target.wants/sys-fs-fuse-connections.mount \
+        ${systemd_unitdir}/system/sys-fs-fuse-connections.mount \
+"
+
+PACKAGES =+ "${PN}-services-getty"
+SUMMARY_${PN}-services-getty = "systemd's getty service"
+RRECOMMENDS_${PN}-services-getty = "util-linux-agetty ${PN}-generators-getty"
+FILES_${PN}-services-getty = "\
+        ${systemd_unitdir}/system/autovt@.service \
+        ${systemd_unitdir}/system/console-getty.service \
+        ${systemd_unitdir}/system/container-getty@.service \
+        ${systemd_unitdir}/system/getty@.service \
+        ${systemd_unitdir}/system/serial-getty@.service \
+        ${sysconfdir}/systemd/system/getty.target.wants/ \
+"
+
+PACKAGES =+ "${PN}-services-hostnamed"
+SUMMARY_${PN}-services-hostnamed = "systemd's hostname management service"
+RDEPENDS_${PN}-services-hostnamed = "${PN}-services-dbus"
+CONFFILES_${PN}-services-hostnamed = "${sysconfdir}/dbus-1/system.d/org.freedesktop.hostname1.conf"
+FILES_${PN}-services-hostnamed = "\
+        ${sysconfdir}/dbus-1/system.d/org.freedesktop.hostname1.conf \
+        ${bindir}/hostnamectl \
+        ${systemd_unitdir}/system/busnames.target.wants/org.freedesktop.hostname1.busname \
+        ${systemd_unitdir}/system/dbus-org.freedesktop.hostname1.service \
+        ${systemd_unitdir}/system/org.freedesktop.hostname1.busname \
+        ${systemd_unitdir}/system/systemd-hostnamed.service \
+        ${rootlibexecdir}/systemd/systemd-hostnamed \
+        ${datadir}/dbus-1/system-services/org.freedesktop.hostname1.service \
+        ${datadir}/polkit-1/actions/org.freedesktop.hostname1.policy \
+"
+
+PACKAGES =+ "${PN}-services-journal"
+SUMMARY_${PN}-services-journal = "systemd's journal (logging) service"
+CONFFILES_${PN}-services-journal = "${sysconfdir}/systemd/journald.conf"
+FILES_${PN}-services-journal = "\
+        ${base_bindir}/journalctl \
+        ${rootlibexecdir}/systemd/systemd-journald \
+        ${sysconfdir}/systemd/journald.conf \
+        ${systemd_unitdir}/system/sockets.target.wants/systemd-journald-dev-log.socket \
+        ${systemd_unitdir}/system/sockets.target.wants/systemd-journald.socket \
+        ${systemd_unitdir}/system/sysinit.target.wants/systemd-journal-catalog-update.service \
+        ${systemd_unitdir}/system/sysinit.target.wants/systemd-journal-flush.service \
+        ${systemd_unitdir}/system/sysinit.target.wants/systemd-journald.service \
+        ${systemd_unitdir}/system/systemd-journal-catalog-update.service \
+        ${systemd_unitdir}/system/systemd-journal-flush.service \
+        ${systemd_unitdir}/system/systemd-journald-dev-log.socket \
+        ${systemd_unitdir}/system/systemd-journald.service \
+        ${systemd_unitdir}/system/systemd-journald.socket \
+        ${exec_prefix}/lib/systemd/catalog/ \
+"
+
+PACKAGES =+ "${PN}-services-ldconfig"
+SUMMARY_${PN}-services-ldconfig = "systemd's service to run ldconfig after updates"
+FILES_${PN}-services-ldconfig = "\
+        ${systemd_unitdir}/system/sysinit.target.wants/ldconfig.service \
+        ${systemd_unitdir}/system/ldconfig.service \
+"
+
+PACKAGES =+ "${PN}-services-localed"
+SUMMARY_${PN}-services-localed = "systemd's locale management service"
+RDEPENDS_${PN}-services-localed = "${PN}-services-dbus"
+CONFFILES_${PN}-services-localed = "${sysconfdir}/dbus-1/system.d/org.freedesktop.locale1.conf"
+FILES_${PN}-services-localed = "\
+        ${sysconfdir}/dbus-1/system.d/org.freedesktop.locale1.conf \
+        ${bindir}/localectl \
+        ${systemd_unitdir}/system/busnames.target.wants/org.freedesktop.locale1.busname \
+        ${systemd_unitdir}/system/dbus-org.freedesktop.locale1.service \
+        ${systemd_unitdir}/system/org.freedesktop.locale1.busname \
+        ${systemd_unitdir}/system/systemd-localed.service \
+        ${rootlibexecdir}/systemd/systemd-localed \
+        ${datadir}/dbus-1/system-services/org.freedesktop.locale1.service \
+        ${datadir}/polkit-1/actions/org.freedesktop.locale1.policy \
+        ${datadir}/systemd/kbd-model-map \
+"
+
+PACKAGES =+ "${PN}-services-logind"
+SUMMARY_${PN}-services-logind = "systemd's login management service"
+RDEPENDS_${PN}-services-logind = "${PN}-services-dbus ${PN}-services-tmpfiles"
+RRECOMMENDS_${PN}-services-logind = "udev"
+CONFFILES_${PN}-services-logind = "\
+        ${sysconfdir}/dbus-1/system.d/org.freedesktop.login1.conf \
+        ${sysconfdir}/systemd/logind.conf \
+"
+FILES_${PN}-services-logind = "\
+        ${sysconfdir}/dbus-1/system.d/org.freedesktop.login1.conf \
+        ${sysconfdir}/systemd/logind.conf \
+        ${base_bindir}/loginctl \
+        ${base_bindir}/systemd-inhibit \
+        ${systemd_unitdir}/system/busnames.target.wants/org.freedesktop.login1.busname \
+        ${systemd_unitdir}/system/dbus-org.freedesktop.login1.service \
+        ${systemd_unitdir}/system/multi-user.target.wants/systemd-logind.service \
+        ${systemd_unitdir}/system/multi-user.target.wants/systemd-user-sessions.service \
+        ${systemd_unitdir}/system/org.freedesktop.login1.busname \
+        ${systemd_unitdir}/system/systemd-logind.service \
+        ${systemd_unitdir}/system/systemd-user-sessions.service \
+        ${systemd_unitdir}/system/user@.service \
+        ${rootlibexecdir}/systemd/systemd-logind \
+        ${rootlibexecdir}/systemd/systemd-user-sessions \
+        ${datadir}/dbus-1/system-services/org.freedesktop.login1.service \
+        ${datadir}/polkit-1/actions/org.freedesktop.login1.policy \
+        ${rootlibexecdir}/udev/rules.d/70-uaccess.rules \
+        ${rootlibexecdir}/udev/rules.d/70-power-switch.rules \
+        ${rootlibexecdir}/udev/rules.d/71-seat.rules \
+        ${rootlibexecdir}/udev/rules.d/73-seat-late.rules \
+"
+
+PACKAGES =+ "${PN}-services-machined"
+SUMMARY_${PN}-services-machined = "systemd's virtual machine and container management service"
+RDEPENDS_${PN}-services-machined = "${PN}-services-dbus"
+CONFFILES_${PN}-services-machined = "${sysconfdir}/dbus-1/system.d/org.freedesktop.machine1.conf"
+FILES_${PN}-services-machined = "\
+        ${sysconfdir}/dbus-1/system.d/org.freedesktop.machine1.conf \
+        ${base_bindir}/machinectl \
+        ${systemd_unitdir}/system/busnames.target.wants/org.freedesktop.machine1.busname \
+        ${systemd_unitdir}/system/dbus-org.freedesktop.machine1.service \
+        ${systemd_unitdir}/system/machine.slice \
+        ${systemd_unitdir}/system/org.freedesktop.machine1.busname \
+        ${systemd_unitdir}/system/systemd-machined.service \
+        ${rootlibexecdir}/systemd/systemd-machined \
+        ${datadir}/dbus-1/system-services/org.freedesktop.machine1.service \
+"
+
+PACKAGES =+ "${PN}-services-modules-load"
+SUMMARY_${PN}-services-modules-load = "systemd's kernel module loading service"
+FILES_${PN}-services-modules-load = "\
+        ${sysconfdir}/modules-load.d/ \
+        ${systemd_unitdir}/system/sysinit.target.wants/systemd-modules-load.service \
+        ${systemd_unitdir}/system/systemd-modules-load.service \
+        ${rootlibexecdir}/systemd/systemd-modules-load \
+        ${exec_prefix}/lib/modules-load.d \
+"
+
+PACKAGES =+ "${PN}-services-modules-static-nodes"
+SUMMARY_${PN}-services-modules-static-nodes = "systemd's kernel module static nodes creation service"
+RDEPENDS_${PN}-services-modules-static-nodes = "kmod ${PN}-services-tmpfiles"
+FILES_${PN}-services-modules-static-nodes = "\
+        ${systemd_unitdir}/system/sysinit.target.wants/kmod-static-nodes.service \
+        ${systemd_unitdir}/system/kmod-static-nodes.service \
+"
+
+
+PACKAGES =+ "${PN}-services-multi-seat-x"
+SUMMARY_${PN}-services-multi-seat-x = "systemd's X11 multi-seat support service"
+RDEPENDS_${PN}-services-multi-seat-x = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/xserver', '', d)}"
+FILES_${PN}-services-multi-seat-x = "\
+        ${rootlibexecdir}/systemd/systemd-multi-seat-x \
+"
+
+PACKAGES =+ "${PN}-services-networkd"
+SUMMARY_${PN}-services-networkd = "systemd's network management (static, DHCP, bridge...) service"
+# NOTE: if no sysusers, then users/groups must be setup
+RRECOMMENDS_${PN}-services-networkd = "${PN}-services-sysusers"
+FILES_${PN}-services-networkd = "\
+        ${sysconfdir}/systemd/network/ \
+        ${sysconfdir}/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service \
+        ${sysconfdir}/systemd/system/multi-user.target.wants/systemd-networkd.service \
+        ${base_bindir}/networkctl \
+        ${rootlibexecdir}/systemd/network/80-container-host0.network \
+        ${rootlibexecdir}/systemd/network/80-container-ve.network \
+        ${rootlibexecdir}/systemd/network/99-default.link \
+        ${systemd_unitdir}/system/systemd-networkd-wait-online.service \
+        ${systemd_unitdir}/system/systemd-networkd.service \
+        ${rootlibexecdir}/systemd/systemd-networkd \
+        ${rootlibexecdir}/systemd/systemd-networkd-wait-online \
+        ${exec_prefix}/lib/systemd/network \
+        ${sysconfdir}/dbus-1/system.d/org.freedesktop.network1.conf \
+        ${datadir}/dbus-1/system-services/org.freedesktop.network1.service \
+"
+
+PACKAGES =+ "${PN}-services-nspawn"
+SUMMARY_${PN}-services-nspawn = "systemd's namespace spawing service and tool"
+FILES_${PN}-services-nspawn = "\
+        ${systemd_unitdir}/system/systemd-nspawn@.service \
+        ${bindir}/systemd-nspawn \
+"
+
+PACKAGES =+ "${PN}-services-quota"
+SUMMARY_${PN}-services-quota = "systemd's file system quota enable and check service"
+RDEPENDS_${PN}-services-quota = "quota"
+FILES_${PN}-services-quota = "\
+        ${systemd_unitdir}/system/quotaon.service \
+        ${systemd_unitdir}/system/systemd-quotacheck.service \
+        ${rootlibexecdir}/systemd/systemd-quotacheck \
+"
+
+PACKAGES =+ "${PN}-services-randomseed"
+SUMMARY_${PN}-services-randomseed = "systemd's random seed save/restore service"
+FILES_${PN}-services-randomseed = "\
+        ${systemd_unitdir}/system/sysinit.target.wants/systemd-random-seed.service \
+        ${systemd_unitdir}/system/systemd-random-seed.service \
+        ${rootlibexecdir}/systemd/systemd-random-seed \
+"
+
+PACKAGES =+ "${PN}-services-readahead"
+SUMMARY_${PN}-services-readahead = "systemd's disk read ahead service"
+FILES_${PN}-services-readahead = "\
+        ${systemd_unitdir}/system/systemd-readahead-collect.service \
+        ${systemd_unitdir}/system/systemd-readahead-done.service \
+        ${systemd_unitdir}/system/systemd-readahead-done.timer \
+        ${systemd_unitdir}/system/systemd-readahead-drop.service \
+        ${systemd_unitdir}/system/systemd-readahead-replay.service \
+        ${rootlibexecdir}/systemd/systemd-readahead \
+"
+
+PACKAGES =+ "${PN}-services-rfkill"
+SUMMARY_${PN}-services-rfkill = "systemd's rfkill state save/restore service"
+FILES_${PN}-services-rfkill = "\
+        ${systemd_unitdir}/system/systemd-rfkill@.service \
+        ${rootlibexecdir}/systemd/systemd-rfkill \
+"
+
+PACKAGES =+ "${PN}-services-sleep"
+SUMMARY_${PN}-services-sleep = "systemd's sleep, suspend and hiberate services"
+FILES_${PN}-services-sleep = "\
+        ${systemd_unitdir}/system/systemd-hybrid-sleep.service \
+        ${systemd_unitdir}/system/systemd-suspend.service \
+        ${systemd_unitdir}/system/systemd-hibernate.service \
+        ${systemd_unitdir}/system-sleep/ \
+        ${rootlibexecdir}/systemd/systemd-sleep \
+"
+
+PACKAGES =+ "${PN}-services-sysctl"
+SUMMARY_${PN}-services-sysctl = "systemd's kernel parameters configuration service"
+FILES_${PN}-services-sysctl = "\
+        ${sysconfdir}/sysctl.d/ \
+        ${exec_prefix}/lib/sysctl.d/ \
+        ${exec_prefix}/lib/sysctl.d/50-default.conf \
+        ${systemd_unitdir}/system/sysinit.target.wants/systemd-sysctl.service \
+        ${systemd_unitdir}/system/systemd-sysctl.service \
+        ${rootlibexecdir}/systemd/systemd-sysctl \
+"
+
+PACKAGES =+ "${PN}-services-sysusers"
+SUMMARY_${PN}-services-sysusers = "systemd's service and tool to allocate system users and groups"
+FILES_${PN}-services-sysusers = "\
+        ${base_bindir}/systemd-sysusers \
+        ${systemd_unitdir}/system/sysinit.target.wants/systemd-sysusers.service \
+        ${systemd_unitdir}/system/systemd-sysusers.service \
+        ${exec_prefix}/lib/sysusers.d/basic.conf \
+        ${exec_prefix}/lib/sysusers.d/systemd.conf \
+"
+
+PACKAGES =+ "${PN}-services-sysvcompat"
+SUMMARY_${PN}-services-sysvcompat = "systemd's SYSV legacy and compatibility service"
+# NOTE: if no sysusers or tmpfiles, then users/groups and FS structure must be setup
+RRECOMMENDS_${PN}-services-sysvcompat = "${PN}-services-sysusers ${PN}-services-tmpfiles"
+FILES_${PN}-services-sysvcompat = "\
+        ${rootlibexecdir}/systemd/systemd-bus-proxyd \
+        ${rootlibexecdir}/systemd/systemd-socket-proxyd \
+        ${bindir}/systemd-stdio-bridge \
+        ${rootlibexecdir}/systemd/system-generators/systemd-rc-local-generator \
+        ${rootlibexecdir}/systemd/system-generators/systemd-sysv-generator \
+        ${rootlibexecdir}/systemd/systemd-initctl \
+        ${rootlibexecdir}/systemd/systemd-update-utmp \
+        ${systemd_unitdir}/system/halt-local.service \
+        ${systemd_unitdir}/system/rc-local.service \
+        ${systemd_unitdir}/system/runlevel1.target.wants/systemd-update-utmp-runlevel.service \
+        ${systemd_unitdir}/system/runlevel2.target.wants/systemd-update-utmp-runlevel.service \
+        ${systemd_unitdir}/system/runlevel3.target.wants/systemd-update-utmp-runlevel.service \
+        ${systemd_unitdir}/system/runlevel4.target.wants/systemd-update-utmp-runlevel.service \
+        ${systemd_unitdir}/system/runlevel5.target.wants/systemd-update-utmp-runlevel.service \
+        ${systemd_unitdir}/system/sockets.target.wants/systemd-initctl.socket \
+        ${systemd_unitdir}/system/sysinit.target.wants/systemd-update-utmp.service \
+        ${systemd_unitdir}/system/systemd-initctl.service \
+        ${systemd_unitdir}/system/systemd-initctl.socket \
+        ${systemd_unitdir}/system/systemd-update-utmp-runlevel.service \
+        ${systemd_unitdir}/system/systemd-update-utmp.service \
+        ${exec_prefix}/lib/tmpfiles.d/legacy.conf \
+"
+
+PACKAGES =+ "${PN}-services-timedated"
+SUMMARY_${PN}-services-timedated = "systemd's time and date management service"
+RDEPENDS_${PN}-services-timedated = "${PN}-services-dbus"
+CONFFILES_${PN}-services-timedated = "${sysconfdir}/dbus-1/system.d/org.freedesktop.timedate1.conf"
+FILES_${PN}-services-timedated = "\
+        ${sysconfdir}/dbus-1/system.d/org.freedesktop.timedate1.conf \
+        ${bindir}/timedatectl \
+        ${systemd_unitdir}/system/busnames.target.wants/org.freedesktop.timedate1.busname \
+        ${systemd_unitdir}/system/dbus-org.freedesktop.timedate1.service \
+        ${systemd_unitdir}/system/org.freedesktop.timedate1.busname \
+        ${systemd_unitdir}/system/systemd-timedated.service \
+        ${rootlibexecdir}/systemd/systemd-timedated \
+        ${datadir}/dbus-1/system-services/org.freedesktop.timedate1.service \
+        ${datadir}/polkit-1/actions/org.freedesktop.timedate1.policy \
+"
+
+PACKAGES =+ "${PN}-services-timesyncd"
+SUMMARY_${PN}-services-timesyncd = "systemd's NTP sync service"
+# NOTE: if no sysusers, then users/groups must be setup
+RRECOMMENDS_${PN}-services-timesyncd = "${PN}-services-sysusers"
+CONFFILES_${PN}-services-timesyncd = "${sysconfdir}/systemd/timesyncd.conf"
+FILES_${PN}-services-timesyncd = "\
+        ${sysconfdir}/systemd/system/sysinit.target.wants/systemd-timesyncd.service \
+        ${sysconfdir}/systemd/timesyncd.conf \
+        ${systemd_unitdir}/system/systemd-timesyncd.service \
+        ${rootlibexecdir}/systemd/systemd-timesyncd \
+"
+
+PACKAGES =+ "${PN}-services-tmpfiles"
+SUMMARY_${PN}-services-tmpfiles = "systemd's service to create, delete and clean up volatile/tmp files/dirs"
+FILES_${PN}-services-tmpfiles = "\
+        ${sysconfdir}/tmpfiles.d/ \
+        ${base_bindir}/systemd-tmpfiles \
+        ${systemd_unitdir}/system/sysinit.target.wants/systemd-tmpfiles-setup-dev.service \
+        ${systemd_unitdir}/system/sysinit.target.wants/systemd-tmpfiles-setup.service \
+        ${systemd_unitdir}/system/systemd-tmpfiles-clean.service \
+        ${systemd_unitdir}/system/systemd-tmpfiles-clean.timer \
+        ${systemd_unitdir}/system/systemd-tmpfiles-setup-dev.service \
+        ${systemd_unitdir}/system/systemd-tmpfiles-setup.service \
+        ${systemd_unitdir}/system/timers.target.wants/systemd-tmpfiles-clean.timer \
+        ${exec_prefix}/lib/tmpfiles.d/etc.conf \
+        ${exec_prefix}/lib/tmpfiles.d/systemd-nologin.conf \
+        ${exec_prefix}/lib/tmpfiles.d/systemd.conf \
+        ${exec_prefix}/lib/tmpfiles.d/tmp.conf \
+        ${exec_prefix}/lib/tmpfiles.d/var.conf \
+        ${exec_prefix}/lib/tmpfiles.d/00-create-volatile.conf \
+        ${exec_prefix}/lib/tmpfiles.d/x11.conf \
+"
+
+PACKAGES =+ "${PN}-services-udev"
+SUMMARY_${PN}-services-udev = "systemd's udev services"
+RDEPENDS_${PN}-services-udev = "udev"
+FILES_${PN}-services-udev = "\
+        ${systemd_unitdir}/system/initrd-udevadm-cleanup-db.service \
+        ${systemd_unitdir}/system/systemd-udev-hwdb-update.service \
+        ${systemd_unitdir}/system/systemd-udev-settle.service \
+        ${systemd_unitdir}/system/systemd-udev-trigger.service \
+        ${systemd_unitdir}/system/systemd-udevd-control.socket \
+        ${systemd_unitdir}/system/systemd-udevd-kernel.socket \
+        ${systemd_unitdir}/system/systemd-udevd.service \
+        ${systemd_unitdir}/system/sysinit.target.wants/systemd-udevd.service \
+        ${systemd_unitdir}/system/sysinit.target.wants/systemd-udev-trigger.service \
+        ${systemd_unitdir}/system/sysinit.target.wants/systemd-udev-hwdb-update.service \
+        ${systemd_unitdir}/system/sockets.target.wants/systemd-udevd-kernel.socket \
+        ${systemd_unitdir}/system/sockets.target.wants/systemd-udevd-control.socket \
+"
+
+PACKAGES =+ "${PN}-services-update"
+SUMMARY_${PN}-services-update = "systemd's post update service"
+FILES_${PN}-services-update = "\
+        ${rootlibexecdir}/systemd/system-generators/systemd-system-update-generator \
+        ${rootlibexecdir}/systemd/systemd-update-done \
+        ${systemd_unitdir}/system/sysinit.target.wants/systemd-update-done.service \
+        ${systemd_unitdir}/system/systemd-update-done.service \
+"
+
+PACKAGES =+ "${PN}-services-vconsole"
+SUMMARY_${PN}-services-vconsole = "systemd's service to configure the virtual console (keyboard/font)"
+RECOMMENDS_${PN}-services-vconsole = "kbd kbd-consolefonts kbd-keymaps"
+FILES_${PN}-services-vconsole = "\
+        ${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.service \
+        ${systemd_unitdir}/system/systemd-vconsole-setup.service \
+        ${rootlibexecdir}/systemd/systemd-vconsole-setup \
+"
+
+########################################################################
+# Standard BitBake Packages
+########################################################################
+
+FILES_${PN}-dbg += "\
+        ${base_libdir}/security/.debug/ \
+        ${libdir}/systemd/ptest/.debug \
+        ${rootlibdir}/.debug \
+        ${systemd_unitdir}/*/.debug \
+        ${systemd_unitdir}/.debug \
+"
 
 FILES_${PN}-gui = "${bindir}/systemadm"
 
-FILES_${PN}-vconsole-setup = "${rootlibexecdir}/systemd/systemd-vconsole-setup \
-                              ${systemd_unitdir}/system/systemd-vconsole-setup.service \
-                              ${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.service"
+FILES_${PN}-dev += "\
+        ${base_libdir}/security/*.la \
+        ${datadir}/dbus-1/interfaces/ \
+        ${sysconfdir}/rpm/macros.systemd \
+"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} += "--system systemd-journal-gateway; --system systemd-timesync"
+GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
+
+# The test cases need perl and bash to run correctly.
+RDEPENDS_${PN}-ptest += "perl python bash"
+FILES_${PN}-ptest += "\
+        ${libdir}/udev/rules.d \
+"
+
+########################################################################
+# Misc Packages
+########################################################################
+
+PACKAGES =+ "${PN}-bash"
+SUMMARY_${PN}-bash = "systemd bash shell commands completion"
+FILES_${PN}-bash = "\
+        ${datadir}/bash-completion/completions/bootctl \
+        ${datadir}/bash-completion/completions/busctl \
+        ${datadir}/bash-completion/completions/coredumpctl \
+        ${datadir}/bash-completion/completions/hostnamectl \
+        ${datadir}/bash-completion/completions/journalctl \
+        ${datadir}/bash-completion/completions/kernel-install \
+        ${datadir}/bash-completion/completions/localectl \
+        ${datadir}/bash-completion/completions/loginctl \
+        ${datadir}/bash-completion/completions/machinectl \
+        ${datadir}/bash-completion/completions/systemctl \
+        ${datadir}/bash-completion/completions/systemd-* \
+        ${datadir}/bash-completion/completions/timedatectl \
+"
+
+PACKAGES =+ "${PN}-initramfs"
+SUMMARY_${PN}-initramfs = "systemd's initramfs support"
+FILES_${PN}-initramfs = "/init"
+RDEPENDS_${PN}-initramfs = "${PN}"
 
+PACKAGES =+ "${PN}-kernel-install"
+SUMMARY_${PN}-kernel-install = "systemd tool to add/remove kernel and initramfs images to/from /boot"
 RDEPENDS_${PN}-kernel-install += "bash"
-FILES_${PN}-kernel-install = "${bindir}/kernel-install \
-                              ${sysconfdir}/kernel/ \
-                              ${exec_prefix}/lib/kernel \
-                             "
-FILES_${PN}-rpm-macros = "${exec_prefix}/lib/rpm \
-                         "
-
-FILES_${PN}-zsh = "${datadir}/zsh/site-functions"
-
-FILES_${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
-                      ${exec_prefix}/lib/binfmt.d \
-                      ${rootlibexecdir}/systemd/systemd-binfmt \
-                      ${systemd_unitdir}/system/proc-sys-fs-binfmt_misc.* \
-                      ${systemd_unitdir}/system/systemd-binfmt.service"
-RRECOMMENDS_${PN}-binfmt = "kernel-module-binfmt-misc"
-
-RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts kbd-keymaps"
-
-CONFFILES_${PN} = "${sysconfdir}/systemd/journald.conf \
-                ${sysconfdir}/systemd/logind.conf \
-                ${sysconfdir}/systemd/system.conf \
-                ${sysconfdir}/systemd/user.conf"
-
-FILES_${PN} = " ${base_bindir}/* \
-                ${datadir}/bash-completion \
-                ${datadir}/dbus-1/services \
-                ${datadir}/dbus-1/system-services \
-                ${datadir}/polkit-1 \
-                ${datadir}/${BPN} \
-                ${datadir}/factory \
-                ${sysconfdir}/bash_completion.d/ \
-                ${sysconfdir}/dbus-1/ \
-                ${sysconfdir}/machine-id \
-                ${sysconfdir}/modules-load.d/ \
-                ${sysconfdir}/pam.d/ \
-                ${sysconfdir}/sysctl.d/ \
-                ${sysconfdir}/systemd/ \
-                ${sysconfdir}/tmpfiles.d/ \
-                ${sysconfdir}/xdg/ \
-                ${sysconfdir}/init.d/README \
-                ${rootlibexecdir}/systemd/* \
-                ${systemd_unitdir}/* \
-                ${base_libdir}/security/*.so \
-                ${libdir}/libnss_* \
-                /cgroup \
-                ${bindir}/systemd* \
-                ${bindir}/busctl \
-                ${bindir}/localectl \
-                ${bindir}/hostnamectl \
-                ${bindir}/timedatectl \
-                ${bindir}/bootctl \
-                ${bindir}/kernel-install \
-                ${exec_prefix}/lib/tmpfiles.d/*.conf \
-                ${exec_prefix}/lib/systemd \
-                ${exec_prefix}/lib/modules-load.d \
-                ${exec_prefix}/lib/sysctl.d \
-                ${exec_prefix}/lib/sysusers.d \
-                ${localstatedir} \
-                /lib/udev/rules.d/70-uaccess.rules \
-                /lib/udev/rules.d/71-seat.rules \
-                /lib/udev/rules.d/73-seat-late.rules \
-                /lib/udev/rules.d/99-systemd.rules \
-               "
+FILES_${PN}-kernel-install = "\
+        ${bindir}/kernel-install \
+        ${sysconfdir}/kernel/ \
+        ${exec_prefix}/lib/kernel \
+"
 
-FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
-FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
+PACKAGES =+ "${PN}-pam"
+SUMMARY_${PN}-pam = "systemd PAM modules and configuration"
+FILES_${PN}-pam = "\
+        ${sysconfdir}/pam.d \
+        ${base_libdir}/security/pam_systemd.so \
+"
 
-RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
-RDEPENDS_${PN} += "volatile-binds"
+PACKAGES =+ "${PN}-preset"
+SUMMARY_${PN}-preset = "systemd's service enablement presets"
+FILES_${PN}-preset = "${systemd_unitdir}/system-preset/90-systemd.preset"
 
-RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units udev-hwdb\
-                      util-linux-agetty \
-                      util-linux-fsck e2fsprogs-e2fsck \
-                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 os-release \
+PACKAGES =+ "${PN}-rpm-macros"
+SUMMARY_${PN}-rpm-macros = "systemd RPM macros"
+FILES_${PN}-rpm-macros = "${exec_prefix}/lib/rpm \
+			 "
+
+PACKAGES =+ "${PN}-zsh"
+SUMMARY_${PN}-zsh = "systemd zsh shell commands completion"
+FILES_${PN}-zsh = "\
+        ${datadir}/zsh/site-functions \
 "
 
-PACKAGES =+ "udev-dbg udev udev-hwdb"
 
-FILES_udev-dbg += "/lib/udev/.debug"
+########################################################################
+# Aggregation of Split Packages
+########################################################################
+
+PACKAGES =+ "${PN}-services-essential"
+SUMMARY_${PN}-services-essential = "systemd's essential services aggregation"
+ALLOW_EMPTY_${PN}-services-essential = "1"
+RDEPENDS_${PN}-services-essential = "\
+        ${PN}-generators-filesystems \
+        ${PN}-preset \
+        ${PN}-services-fsck \
+        ${PN}-services-journal \
+        ${PN}-services-modules-load \
+        ${PN}-services-randomseed \
+        ${PN}-services-sleep \
+        ${PN}-services-sysctl \
+        ${PN}-services-sysusers \
+        ${PN}-services-tmpfiles \
+        ${PN}-services-udev \
+        udev-rules-systemd \
+"
 
-RPROVIDES_udev = "hotplug"
+PACKAGES =+ "${PN}-services-base"
+SUMMARY_${PN}-services-base = "systemd's base services aggregation"
+ALLOW_EMPTY_${PN}-services-base = "1"
+RDEPENDS_${PN}-services-base = "${PN}-services-essential \
+        ${PN}-services-ask-password \
+        ${PN}-services-backlight \
+        ${PN}-services-binfmt \
+        ${PN}-services-coredump \
+        ${PN}-services-dbus \
+        ${PN}-services-firstboot \
+        ${PN}-services-fuse \
+        ${PN}-services-hostnamed \
+        ${PN}-services-ldconfig \
+        ${PN}-services-localed \
+        ${PN}-services-logind \
+        ${PN}-services-networkd \
+        ${PN}-services-quota \
+        ${PN}-services-rfkill \
+        ${PN}-services-timedated \
+        ${PN}-services-timesyncd \
+        ${PN}-services-update \
+        ${PN}-services-vconsole \
+        ${PN}-services-modules-static-nodes \
+        ${PN}-bash \
+        ${PN}-initramfs \
+        ${PN}-kernel-install \
+        ${PN}-rpm-macros \
+        ${PN}-zsh \
+"
 
-RDEPENDS_udev-hwdb += "udev"
+PACKAGES =+ "${PN}-services-all"
+SUMMARY_${PN}-services-all = "systemd's all services and tools aggregation"
+ALLOW_EMPTY_${PN}-services-all = "1"
+RDEPENDS_${PN}-services-all = "${PN}-services-base \
+        ${PN}-services-bootchart \
+        ${PN}-services-cryptsetup \
+        ${PN}-services-debug \
+        ${PN}-services-machined \
+        ${PN}-services-nspawn \
+        ${PN}-services-sysvcompat \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${PN}-services-multi-seat-x', '', d)} \
+"
 
-FILES_udev += "${base_sbindir}/udevd \
-               ${rootlibexecdir}/systemd/systemd-udevd \
-               ${rootlibexecdir}/udev/accelerometer \
-               ${rootlibexecdir}/udev/ata_id \
-               ${rootlibexecdir}/udev/cdrom_id \
-               ${rootlibexecdir}/udev/collect \
-               ${rootlibexecdir}/udev/findkeyboards \
-               ${rootlibexecdir}/udev/keyboard-force-release.sh \
-               ${rootlibexecdir}/udev/keymap \
-               ${rootlibexecdir}/udev/mtd_probe \
-               ${rootlibexecdir}/udev/scsi_id \
-               ${rootlibexecdir}/udev/v4l_id \
-               ${rootlibexecdir}/udev/keymaps \
-               ${rootlibexecdir}/udev/rules.d/*.rules \
-               ${sysconfdir}/udev \
-               ${sysconfdir}/init.d/systemd-udevd \
-               ${systemd_unitdir}/system/*udev* \
-               ${systemd_unitdir}/system/*.wants/*udev* \
-               ${base_bindir}/udevadm \
-               ${datadir}/bash-completion/completions/udevadm \
-              "
-
-FILES_udev-hwdb = "${rootlibexecdir}/udev/hwdb.d"
 
-INITSCRIPT_PACKAGES = "udev"
-INITSCRIPT_NAME_udev = "systemd-udevd"
-INITSCRIPT_PARAMS_udev = "start 03 S ."
+########################################################################
+# Core Package
+########################################################################
 
-python __anonymous() {
-    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
-}
+CONFFILES_${PN} = "\
+        ${sysconfdir}/systemd/system.conf \
+        ${sysconfdir}/systemd/user.conf \
+"
 
+FILES_${PN} = "\
+        ${base_bindir}/systemctl \
+        ${base_bindir}/systemd-hwdb \
+        ${bindir}/bootctl \
+        ${datadir}/${BPN} \
+        ${datadir}/factory \
+        ${exec_prefix}/lib/libnss_myhostname* \
+        ${exec_prefix}/lib/libnss_mymachines.so.2 \
+        ${libdir}/systemd/user-generators/ \
+        ${libdir}/systemd/user/ \
+        ${localstatedir} \
+        ${rootlibexecdir}/systemd/systemd \
+        ${rootlibexecdir}/systemd/systemd-cgroups-agent \
+        ${rootlibexecdir}/systemd/systemd-shutdown \
+        ${rootlibexecdir}/systemd/systemd-shutdownd \
+        ${rootlibexecdir}/systemd/systemd-machine-id-commit \
+        ${rootlibexecdir}/systemd/systemd-hibernate-resume \
+        ${rootlibexecdir}/systemd/systemd-importd \
+        ${rootlibexecdir}/systemd/import-pubring.gpg \
+        ${rootlibexecdir}/systemd/systemd-pull \
+        ${sysconfdir}/init.d/README \
+        ${sysconfdir}/machine-id \
+        ${sysconfdir}/systemd/system.conf \
+        ${sysconfdir}/systemd/system/ \
+        ${sysconfdir}/systemd/user.conf \
+        ${sysconfdir}/systemd/user/ \
+        ${sysconfdir}/xdg/systemd/ \
+        ${sysconfdir}/X11/xinit/xinitrc.d/50-systemd-user.sh \
+        ${systemd_unitdir}/system-generators/ \
+        ${systemd_unitdir}/system-preset/ \
+        ${systemd_unitdir}/system-shutdown/ \
+        ${systemd_unitdir}/system/ \
+"
 # TODO:
 # u-a for runlevel and telinit
+RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
+RDEPENDS_${PN} += "volatile-binds"
+
+RRECOMMENDS_${PN} += "\
+        ${PN}-services-base \
+        ${PN}-services-essential \
+        ${PN}-services-all \
+        ${PN}-tools \
+        ${PN}-generators-getty \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PN}-pam', '', d)} \
+        ${PN}-services-getty \
+        kernel-module-autofs4 \
+        kernel-module-ipv6 \
+        kernel-module-unix \
+        util-linux-agetty \
+        util-linux-fsck \
+        e2fsprogs-e2fsck \
+        os-release \
+        udev-hwdb \
+        systemd-serialgetty \
+        systemd-compat-units \
+"
 
 ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel"
 
@@ -381,6 +1009,41 @@ ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
 ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
+
+########################################################################
+# UDEV Section
+########################################################################
+
+PACKAGES =+ "udev-dbg"
+SUMMARY_udev-dbg = "Dynamic device management - Debugging files"
+RRECOMMENDS_udev-dbg += "${PN}-dbg"
+FILES_udev-dbg = "\
+        ${rootlibexecdir}/udev/.debug \
+        ${base_sbindir}/.debug/udevd \
+        ${base_bindir}/.debug/udevadm \
+        ${rootlibexecdir}/systemd/.debug/systemd-udevd \
+        ${base_libdir}/.debug/libudev* \
+        ${base_libdir}/.debug/libgudev* \
+        ${exec_prefix}/lib/.debug/libgudev* \
+"
+
+PACKAGES =+ "udev-dev"
+SUMMARY_udev-dev = "Dynamic device management - Development files"
+RRECOMMENDS_udev-dev += "${PN}-dev"
+FILES_udev-dev = "\
+        ${datadir}/pkgconfig/*udev* \
+        ${libdir}/pkgconfig/*udev* \
+        ${libdir}/lib*udev*.la \
+        ${includedir}/*udev* \
+"
+
+PACKAGES =+ "udev-hwdb"
+SUMMARY_udev-hwdb = "Dynamic device management - Hardware database"
+RDEPENDS_udev-hwdb += "udev"
+FILES_udev-hwdb = "\
+        ${rootlibexecdir}/udev/hwdb.d/ \
+"
+
 pkg_postinst_udev-hwdb () {
 	if test -n "$D"; then
 		${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
@@ -398,6 +1061,154 @@ pkg_prerm_udev-hwdb () {
 	rm -f ${sysconfdir}/udev/hwdb.bin
 }
 
+PACKAGES =+ "udev-bash"
+SUMMARY_udev-bash = "Dynamic device management - Bash shell commands completion"
+FILES_udev-bash = "${datadir}/bash-completion/completions/udevadm"
+
+PACKAGES =+ "udev-zsh"
+SUMMARY_udev-zsh = "Dynamic device management - zsh shell commands completion"
+FILES_udev-zsh = "${datadir}/zsh/site-functions/_udevadm"
+
+
+########################################################################
+# UDEV Rules Packages
+# split rules that require external programs or dependencies.
+# those that use only builtins are not split
+########################################################################
+
+PACKAGES =+ "udev-rules-accelerometer"
+SUMMARY_udev-rules-accelerometer = "Dynamic device management - accelerometer rules"
+FILES_udev-rules-accelerometer = "\
+        ${rootlibexecdir}/udev/accelerometer \
+        ${rootlibexecdir}/udev/rules.d/61-accelerometer.rules \
+        ${rootlibexecdir}/udev/rules.d/70-touchpad.rules \
+"
+
+PACKAGES =+ "udev-rules-cdrom"
+SUMMARY_udev-rules-cdrom = "Dynamic device management - cdrom rules"
+FILES_udev-rules-cdrom = "\
+        ${rootlibexecdir}/udev/cdrom_id \
+        ${rootlibexecdir}/udev/rules.d/60-cdrom_id.rules \
+"
+
+PACKAGES =+ "udev-rules-mtd"
+SUMMARY_udev-rules-mtd = "Dynamic device management - mtd rules"
+FILES_udev-rules-mtd = "\
+        ${rootlibexecdir}/udev/mtd_probe \
+        ${rootlibexecdir}/udev/rules.d/75-probe_mtd.rules \
+"
+
+PACKAGES =+ "udev-rules-persistent-storage"
+SUMMARY_udev-rules-persistent-storage = "Dynamic device management - persistent storage rules"
+FILES_udev-rules-persistent-storage = "\
+        ${rootlibexecdir}/udev/ata_id \
+        ${rootlibexecdir}/udev/scsi_id \
+        ${rootlibexecdir}/udev/rules.d/60-persistent-storage.rules \
+        ${rootlibexecdir}/udev/rules.d/60-persistent-storage-tape.rules \
+"
+
+PACKAGES =+ "udev-rules-systemd"
+SUMMARY_udev-rules-systemd = "Dynamic device management - systemd rules"
+RDEPENDS_udev-rules-systemd = "${PN} ${PN}-services-sysctl"
+FILES_udev-rules-systemd = "\
+        ${rootlibexecdir}/udev/rules.d/99-systemd.rules \
+"
+
+PACKAGES =+ "udev-rules-v4l"
+SUMMARY_udev-rules-v4l = "Dynamic device management - v4l rules"
+FILES_udev-rules-v4l = "\
+        ${rootlibexecdir}/udev/v4l_id \
+        ${rootlibexecdir}/udev/rules.d/*-persistent-v4l.rules \
+"
+
+PACKAGES =+ "udev-rules-all"
+SUMMARY_udev-rules-all = "Dynamic device management - all rules aggregation"
+ALLOW_EMPTY_udev-rules-all = "1"
+RDEPENDS_udev-rules-all = "\
+        udev-rules-accelerometer \
+        udev-rules-cdrom \
+        udev-rules-mtd \
+        udev-rules-persistent-storage \
+        udev-rules-systemd \
+        udev-rules-v4l \
+"
+
+PACKAGES =+ "udev"
+SUMMARY_udev = "Dynamic device management"
+RPROVIDES_udev = "hotplug"
+PROVIDES = "udev"
+CONFFILES_udev = "${sysconfdir}/udev/udev.conf"
+RDEPENDS_udev += "${PN}-services-vconsole"
+FILES_udev = "\
+        ${base_bindir}/udevadm \
+        ${base_sbindir}/udevd \
+        ${rootlibexecdir}/systemd/systemd-udevd \
+        ${rootlibexecdir}/udev/collect \
+        ${rootlibexecdir}/udev/rules.d/42-usb-hid-pm.rules \
+        ${rootlibexecdir}/udev/rules.d/50-firmware.rules \
+        ${rootlibexecdir}/udev/rules.d/50-udev-default.rules \
+        ${rootlibexecdir}/udev/rules.d/60-drm.rules \
+        ${rootlibexecdir}/udev/rules.d/60-keyboard.rules \
+        ${rootlibexecdir}/udev/rules.d/60-persistent-alsa.rules \
+        ${rootlibexecdir}/udev/rules.d/60-persistent-input.rules \
+        ${rootlibexecdir}/udev/rules.d/60-persistent-serial.rules \
+        ${rootlibexecdir}/udev/rules.d/64-btrfs.rules \
+        ${rootlibexecdir}/udev/rules.d/75-net-description.rules \
+        ${rootlibexecdir}/udev/rules.d/75-tty-description.rules \
+        ${rootlibexecdir}/udev/rules.d/78-sound-card.rules \
+        ${rootlibexecdir}/udev/rules.d/80-drivers.rules \
+        ${rootlibexecdir}/udev/rules.d/80-net-setup-link.rules \
+        ${rootlibexecdir}/udev/rules.d/95-udev-late.rules \
+        ${rootlibexecdir}/udev/rules.d/70-mouse.rules \
+        ${rootlibexecdir}/udev/rules.d/90-vconsole.rules \
+        ${rootlibexecdir}/udev/rules.d/touchscreen.rules \
+        ${sysconfdir}/init.d/systemd-udevd \
+        ${sysconfdir}/udev \
+"
+
+RRECOMMENDS_udev = "\
+        udev-hwdb \
+        udev-rules-all \
+"
+
+INITSCRIPT_PACKAGES = "udev"
+INITSCRIPT_NAME_udev = "systemd-udevd"
+INITSCRIPT_PARAMS_udev = "start 03 S ."
+
+python __anonymous() {
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+}
+
+# TODO:
+# u-a for runlevel and telinit
+
+ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel"
+
+ALTERNATIVE_TARGET[init] = "${rootlibexecdir}/systemd/systemd"
+ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
+ALTERNATIVE_PRIORITY[init] ?= "300"
+
+ALTERNATIVE_TARGET[halt] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[halt] = "${base_sbindir}/halt"
+ALTERNATIVE_PRIORITY[halt] ?= "300"
+
+ALTERNATIVE_TARGET[reboot] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[reboot] = "${base_sbindir}/reboot"
+ALTERNATIVE_PRIORITY[reboot] ?= "300"
+
+ALTERNATIVE_TARGET[shutdown] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[shutdown] = "${base_sbindir}/shutdown"
+ALTERNATIVE_PRIORITY[shutdown] ?= "300"
+
+ALTERNATIVE_TARGET[poweroff] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[poweroff] = "${base_sbindir}/poweroff"
+ALTERNATIVE_PRIORITY[poweroff] ?= "300"
+
+ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
+ALTERNATIVE_PRIORITY[runlevel] ?= "300"
+
 # As this recipe builds udev, respect systemd being in DISTRO_FEATURES so
 # that we don't build both udev and systemd in world builds.
 python () {
-- 
2.3.5


