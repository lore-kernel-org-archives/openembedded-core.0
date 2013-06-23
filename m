Return-Path: <kirgene@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 93B276AD20
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2013 01:38:10 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id d10so5415905eaj.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jun 2013 18:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=V7Tt0hmHBPxhUIQoY0okupL4QLviaKKUVqT41xH8bdo=;
	b=ajnim29XwUOe+wewpQ7T1WJaq7wXaShY4E+dVDVNGs1K8P7GC2dwKvXIImvIKKeDuk
	OnrEJLG60G3z1P49gCP5F6qIFZfGRsf9L61nINX2BUN+gMcwytBdeuvvoDgCBDbGTlAp
	/HvFy0VRgNFh2T9m8ZXpd41GKRWOsMC0aCaQ+JFfu9+lYr3rilwnN/De+KcXE4cQsIPB
	gLAyqkhYiLv/dl8cI5kCeTEUnNQttclyy+wWuq3lZrhV1dn3z26O93am8lRi55pbyZBc
	YyBAoAsMkY3/VhEtFfuXpXqXSjVwpZnq8Vuo2BhNQyh1Gog7tskeBFpA/ikU48KBl9j6
	Yi2Q==
X-Received: by 10.15.32.67 with SMTP id z43mr18911292eeu.24.1371951490711;
	Sat, 22 Jun 2013 18:38:10 -0700 (PDT)
Received: from ubuntu.datv.net ([213.174.0.226])
	by mx.google.com with ESMTPSA id o5sm18044235eef.5.2013.06.22.18.38.09
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 22 Jun 2013 18:38:09 -0700 (PDT)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2013 04:36:55 +0300
Message-Id: <1371951415-52721-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [PATCH v6] systemd: added python-systemd package generation.
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
X-List-Received-Date: Sun, 23 Jun 2013 01:38:11 -0000

---
 meta/recipes-core/systemd/systemd_204.bb |   20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_204.bb b/meta/recipes-core/systemd/systemd_204.bb
index b8b1290..ea0cdd2 100644
--- a/meta/recipes-core/systemd/systemd_204.bb
+++ b/meta/recipes-core/systemd/systemd_204.bb
@@ -10,9 +10,15 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux pythonnative python-dir"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
+# need to export these variables for python-config to work
+export BUILD_SYS
+export HOST_SYS
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
 SECTION = "base/shell"
 
 inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu
@@ -51,6 +57,8 @@ DEPENDS += "libgcrypt"
 # Compress the journal
 PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
 PACKAGECONFIG[tcp-wrappers] = "--enable-tcpwrap,--disable-tcpwrap,tcp-wrappers"
+# Use python-systemd
+PACKAGECONFIG[python] = "--with-python,--without-python,python"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 
@@ -71,7 +79,6 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --disable-tcpwrap \
                  --enable-split-usr \
                  --disable-microhttpd \
-                 --without-python \
                  --with-sysvrcnd-path=${sysconfdir} \
                  --with-firmware-path=/lib/firmware \
                  ac_cv_path_KILL=${base_bindir}/kill \
@@ -93,6 +100,8 @@ do_install() {
 	# Provided by a separate recipe
 	rm ${D}${systemd_unitdir}/system/serial-getty* -f
 
+	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/systemd/*.la
+
 	# Provide support for initramfs
 	ln -s ${rootlibexecdir}/systemd/systemd ${D}/init
 	ln -s ${rootlibexecdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd
@@ -121,7 +130,7 @@ python populate_packages_prepend (){
 }
 PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
 
-PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install"
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install python-${PN}"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
@@ -131,6 +140,9 @@ FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 FILES_${PN}-initramfs = "/init"
 RDEPENDS_${PN}-initramfs = "${PN}"
 
+FILES_python-${PN} = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.py* ${PYTHON_SITEPACKAGES_DIR}/systemd/*.so"
+RDEPENDS_python-${PN} = "python-core python-datetime python-logging python-syslog"
+
 FILES_${PN}-gui = "${bindir}/systemadm"
 
 FILES_${PN}-vconsole-setup = "${rootlibexecdir}/systemd/systemd-vconsole-setup \
@@ -187,7 +199,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 /lib/udev/rules.d/99-systemd.rules \
                "
 
-FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
+FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/ ${PYTHON_SITEPACKAGES_DIR}/systemd/.debug"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
 RDEPENDS_${PN} += "dbus util-linux-mount"
-- 
1.7.9.5


