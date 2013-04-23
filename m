Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1UUfiI-00080t-GP
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 18:05:06 +0200
Received: by mail-ea0-f170.google.com with SMTP id z7so340117eaf.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 08:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=3Smet+4PGAC9ceONdg2QD+iZic4y+8Iod/6DFEgV79U=;
	b=I99oKpC574MrHn7Q/FyEVv3sIHXTzbdXIdJCb6PmvrqWEh4wwdV5y4yycRy/9dp0BY
	s+7q/5QmMWdFkWjsjfNv/obHcBCrMsEl9gfxRAN3RSAhhAXhtVhyXhCMuxGe/X6zeckf
	0eqWqx9BtybVdGBihNXVq+wNFmhXLDeJqL2uyQvz511/8Db/6fYhKGBCJwNAngoiXPb+
	KvPGgP0m7RJFLbrr/xPHxC+HBxTHwvQIgOv/kyh/beD1blKTSSg/7wT1hOLpE8FYgsAG
	cNh1INVLDsrw7SURs6NvTlqvuiRfeMWqtktb4JdNjVsLinUKyDy+hew9Md2kJsodZOIm
	pMWw==
X-Received: by 10.15.35.200 with SMTP id g48mr38320905eev.33.1366732041840;
	Tue, 23 Apr 2013 08:47:21 -0700 (PDT)
Received: from ubuntu.datv.net ([213.174.0.226])
	by mx.google.com with ESMTPS id k43sm20497997een.2.2013.04.23.08.47.20
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 23 Apr 2013 08:47:21 -0700 (PDT)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2013 18:47:02 +0300
Message-Id: <1366732022-56964-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [PATCH v5] systemd: added python-systemd package generation.
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
X-List-Received-Date: Tue, 23 Apr 2013 16:05:12 -0000

---
 meta/recipes-core/systemd/systemd_199.bb |   22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index 5240443..993c0a5 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -16,7 +16,13 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
 
-inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives
+inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives pythonnative python-dir
+
+# need to export these variables for python-config to work
+export BUILD_SYS
+export HOST_SYS
+export STAGING_INCDIR
+export STAGING_LIBDIR
 
 SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://touchscreen.rules \
@@ -46,11 +52,13 @@ LDFLAGS_libc-uclibc_append = " -lrt"
 
 GTKDOC_DOCDIR = "${S}/docs/"
 
-PACKAGECONFIG ??= "xz"
+PACKAGECONFIG ??= "xz python"
 # Sign the journal for anti-tampering
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
 # Compress the journal
 PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
+# Use python-systemd
+PACKAGECONFIG[python] = "--with-python,--without-python,python"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 
@@ -65,7 +73,6 @@ EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
                  --disable-tcpwrap \
                  --enable-split-usr \
                  --disable-microhttpd \
-                 --without-python \
                  --with-sysvrcnd-path=${sysconfdir} \
                  --with-firmware-path=/lib/firmware \
                  ac_cv_path_KILL=${base_bindir}/kill \
@@ -89,6 +96,8 @@ do_install() {
 	# provided by a seperate recipe
 	rm ${D}${systemd_unitdir}/system/serial-getty* -f
 
+	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/systemd/*.la
+
 	# provide support for initramfs
 	ln -s ${base_sbindir}/systemd/systemd ${D}/init
 	ln -s ${base_sbindir}/systemd/systemd-udevd ${D}/${base_sbindir}/udev/udevd
@@ -119,7 +128,7 @@ python populate_packages_prepend (){
 }
 PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
 
-PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install"
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install python-${PN}"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
@@ -129,6 +138,9 @@ FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 FILES_${PN}-initramfs = "/init"
 RDEPENDS_${PN}-initramfs = "${PN}"
 
+FILES_python-${PN} = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.py* ${PYTHON_SITEPACKAGES_DIR}/systemd/*.so"
+RDEPENDS_python-${PN} = "python-core python-datetime python-logging python-syslog"
+
 FILES_${PN}-gui = "${bindir}/systemadm"
 
 FILES_${PN}-vconsole-setup = "${systemd_unitdir}/systemd-vconsole-setup \
@@ -189,7 +201,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 /lib/udev/rules.d/99-systemd.rules \
                "
 
-FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/ ${base_sbindir}/systemd/.debug ${base_sbindir}/systemd/system-generators/.debug ${base_sbindir}/udev/.debug"
+FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/ ${base_sbindir}/systemd/.debug ${base_sbindir}/systemd/system-generators/.debug ${base_sbindir}/udev/.debug ${PYTHON_SITEPACKAGES_DIR}/systemd/.debug"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
 RDEPENDS_${PN} += "dbus"
-- 
1.7.9.5



