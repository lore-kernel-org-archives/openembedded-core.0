Return-Path: <kirgene@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id DA3B06077D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 23:33:21 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b47so1019759eek.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 16:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=QbHKpVlyF936IOlRWcUDXRE+bee7njWzv0jCgZU0Ros=;
	b=NSn2s6eph8w1JATOmcbhhQo1PbkenpAes04uM3DbgmpeNnDfl9RvYhhhvxO1swTLvG
	YDPFka3l98pvXxO50YAEx43kUPiXVU/RcAfLEgGL3r065MKC8vnbNR5Tnpca79dotOrm
	UCv4Jp+3FfUUVAVqEc3V/Ci6mvMI3pNAjc+kdQdUVv2si8bOpDHuHpmx87o0UNEUuy5I
	1FyN0o7TFjTZRlAzViB2OmP8TUdYOuU2utxwQ3z0Sz9vlyMdgdWboq1Yb3k2oOaEz2Oj
	BAjjM5lvflJ8e15bXtZZGvCoylplqz/AW7MtA8Mp9aBgLnNr4Hnv8kF80DHTM2650aum
	9V6A==
X-Received: by 10.14.211.67 with SMTP id v43mr9211352eeo.55.1372980801846;
	Thu, 04 Jul 2013 16:33:21 -0700 (PDT)
Received: from ubuntu.datv.net ([213.174.0.226])
	by mx.google.com with ESMTPSA id a4sm9202000eez.0.2013.07.04.16.33.20
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 16:33:21 -0700 (PDT)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 02:31:14 +0300
Message-Id: <1372980674-42981-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [PATCH v8] systemd: added python-systemd package generation.
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
X-List-Received-Date: Thu, 04 Jul 2013 23:33:22 -0000

---
 meta/recipes-core/systemd/systemd_204.bb |   24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_204.bb b/meta/recipes-core/systemd/systemd_204.bb
index b8b1290..2a6ed0c 100644
--- a/meta/recipes-core/systemd/systemd_204.bb
+++ b/meta/recipes-core/systemd/systemd_204.bb
@@ -13,9 +13,16 @@ PE = "1"
 DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
+# need to export these variables for python-config to work
+export BUILD_SYS
+export HOST_SYS
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
 SECTION = "base/shell"
 
-inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu
+inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu \
+        ${@base_contains('DISTRO_FEATURES', 'python', 'pythonnative python-dir', '', d)}
 
 SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://touchscreen.rules \
@@ -42,7 +49,8 @@ LDFLAGS_libc-uclibc_append = " -lrt"
 
 GTKDOC_DOCDIR = "${S}/docs/"
 
-PACKAGECONFIG ??= "xz tcp-wrappers"
+PACKAGECONFIG ??= "xz tcp-wrappers \
+                   ${@base_contains('DISTRO_FEATURES', 'python', 'python', '', d)}"
 # Sign the journal for anti-tampering
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
 # regardless of PACKAGECONFIG, libgcrypt is always required to expand
@@ -51,6 +59,8 @@ DEPENDS += "libgcrypt"
 # Compress the journal
 PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
 PACKAGECONFIG[tcp-wrappers] = "--enable-tcpwrap,--disable-tcpwrap,tcp-wrappers"
+# Use python-systemd
+PACKAGECONFIG[python] = "--with-python,--without-python,python"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 
@@ -71,7 +81,6 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --disable-tcpwrap \
                  --enable-split-usr \
                  --disable-microhttpd \
-                 --without-python \
                  --with-sysvrcnd-path=${sysconfdir} \
                  --with-firmware-path=/lib/firmware \
                  ac_cv_path_KILL=${base_bindir}/kill \
@@ -93,6 +102,8 @@ do_install() {
 	# Provided by a separate recipe
 	rm ${D}${systemd_unitdir}/system/serial-getty* -f
 
+	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/systemd/*.la
+
 	# Provide support for initramfs
 	ln -s ${rootlibexecdir}/systemd/systemd ${D}/init
 	ln -s ${rootlibexecdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd
@@ -121,7 +132,7 @@ python populate_packages_prepend (){
 }
 PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
 
-PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install"
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install python-${PN}"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
@@ -131,6 +142,9 @@ FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 FILES_${PN}-initramfs = "/init"
 RDEPENDS_${PN}-initramfs = "${PN}"
 
+FILES_python-${PN} = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.py* ${PYTHON_SITEPACKAGES_DIR}/systemd/*.so"
+RDEPENDS_python-${PN} = "python-core python-datetime python-logging python-syslog"
+
 FILES_${PN}-gui = "${bindir}/systemadm"
 
 FILES_${PN}-vconsole-setup = "${rootlibexecdir}/systemd/systemd-vconsole-setup \
@@ -187,7 +201,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 /lib/udev/rules.d/99-systemd.rules \
                "
 
-FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
+FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/ ${PYTHON_SITEPACKAGES_DIR}/systemd/.debug"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
 RDEPENDS_${PN} += "dbus util-linux-mount"
-- 
1.7.9.5


