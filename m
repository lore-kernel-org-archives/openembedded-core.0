Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1UUfyV-0001G7-Mu
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 18:21:49 +0200
Received: by mail-ea0-f176.google.com with SMTP id h14so344187eak.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 09:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=dxZn8wMc7KUjkKUgQQ9GIvgMDVq+Xv2P4LonpHgH3ao=;
	b=Z9zjiZiEqhmTK32sG/r5eUxASKpmYOP3LQ+1xCWR70mbQmYDUYFocszlPpjyWzBHZn
	QvSLHc0iaqA+hxBE0dppkcSWblYdb5Br6tNJ+eiCUhUlt1okGgDz+ipR0nw7H3bP3IZC
	AKTfwMoAfnyxZ3zUrF8JtIixiC95dz4+bk/k71l0GgvxeZMeSPfKaBKDhxaag/ugFdDz
	bydytnmmUbQoeT/3ikXwYulGFB6bStrnzvFv4JHu48zVhdZXIncqPGlrU4PBu2a6GMDA
	JPv24hX+RghAPdVRF0DsdLLNQoa3QyY1C4+zSo+zp6/h65dV2ZkAMnQkiyjupBkL936n
	wIlQ==
X-Received: by 10.14.221.67 with SMTP id q43mr8181738eep.20.1366733047330;
	Tue, 23 Apr 2013 09:04:07 -0700 (PDT)
Received: from ubuntu.datv.net ([213.174.0.226])
	by mx.google.com with ESMTPS id i53sm47831189eeu.5.2013.04.23.09.04.05
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 23 Apr 2013 09:04:06 -0700 (PDT)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2013 19:03:49 +0300
Message-Id: <1366733029-57125-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [PATCH v6] systemd: added python-systemd package generation.
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
X-List-Received-Date: Tue, 23 Apr 2013 16:21:53 -0000

---
 meta/recipes-core/systemd/systemd_199.bb |   20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index 5240443..6a4e1a9 100644
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
@@ -51,6 +57,8 @@ PACKAGECONFIG ??= "xz"
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



