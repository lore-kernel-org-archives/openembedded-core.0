Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TMcyB-0003l7-PT
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 12:59:55 +0200
Received: by mail-wi0-f169.google.com with SMTP id hq4so259359wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2012 03:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=CqchjSlz3RZL+q3cUDTyGk9By63BXTHCevwCgZlytx8=;
	b=tcIxmY3ztr4BNLZafZTVYXtIqrUWiGS7WJsfgCW39h0MianjGIlWYPs4/kLRK1tdjI
	JFc6gnj7z9Knyw9NSPyeaD+1JKkPnYDzZoAby+G6WOlzCGwsgtfiP4MF176iKKTkmbKI
	9ydfe5mEHPxw+OY6aXMKIdYSEhPWgT1NF1aF82EAM1WS+D7lbdL2sWEOmiAX7xU7lAR4
	paXXEza0Ms0iRInRpAtWbJIIq/xkt/5qb6U4RxL7/mGtKGgkwMJm/A7YTvUqPAhZshz9
	JXs83oysZeJOrB69S1ANjy3rPEVE0W5jnU+XaOUWNYHOrT6fEUSItoXP4qPV4VPyJJM6
	pU4g==
Received: by 10.180.76.11 with SMTP id g11mr5111321wiw.13.1350038804387;
	Fri, 12 Oct 2012 03:46:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v3sm3013430wiy.5.2012.10.12.03.46.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Oct 2012 03:46:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Oct 2012 12:46:38 +0200
Message-Id: <1350038799-22567-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [PATCH 1/2] PACKAGES_DYNAMIC: use regexp not glob
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
X-List-Received-Date: Fri, 12 Oct 2012 10:59:56 -0000

* bitbake uses PACKAGES_DYNAMIC as regexp
  ^ could make matching faster (and it will be more clear that we're expecting regexp not glob)
  * made all those last '-' optional, use .* (or nothing)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass                              | 6 +++---
 meta/conf/bitbake.conf                                   | 2 +-
 meta/recipes-connectivity/connman/connman.inc            | 2 +-
 meta/recipes-core/eglibc/eglibc-locale.inc               | 6 +++---
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 2 +-
 meta/recipes-devtools/perl/perl_5.14.2.bb                | 4 ++--
 meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb        | 2 +-
 meta/recipes-extended/pam/libpam_1.1.6.bb                | 2 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb       | 2 +-
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb                   | 2 +-
 meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb     | 2 +-
 meta/recipes-graphics/directfb/directfb.inc              | 2 +-
 meta/recipes-graphics/mesa/mesa-dri.inc                  | 2 +-
 meta/recipes-graphics/pango/pango.inc                    | 2 +-
 meta/recipes-kernel/linux/linux-dummy.bb                 | 4 ++--
 meta/recipes-multimedia/gstreamer/gst-plugins.inc        | 2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc        | 2 +-
 meta/recipes-qt/qt-apps/qmmp_0.6.1.bb                    | 2 +-
 meta/recipes-qt/qt4/qt4-embedded.inc                     | 2 +-
 meta/recipes-qt/qt4/qt4.inc                              | 2 +-
 20 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 36bc3c7..b17b0f5 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -24,9 +24,9 @@ python __anonymous () {
 
 inherit kernel-arch deploy
 
-PACKAGES_DYNAMIC += "kernel-module-*"
-PACKAGES_DYNAMIC += "kernel-image-*"
-PACKAGES_DYNAMIC += "kernel-firmware-*"
+PACKAGES_DYNAMIC += "^kernel-module-.*"
+PACKAGES_DYNAMIC += "^kernel-image-.*"
+PACKAGES_DYNAMIC += "^kernel-firmware-.*"
 
 export OS = "${TARGET_OS}"
 export CROSS_COMPILE = "${TARGET_PREFIX}"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d375895..b3ebfd5 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -267,7 +267,7 @@ SOLIBSDEV_darwin9 = ".dylib"
 
 PACKAGE_BEFORE_PN ?= ""
 PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
-PACKAGES_DYNAMIC = "${PN}-locale-*"
+PACKAGES_DYNAMIC = "^${PN}-locale-.*"
 FILES = ""
 
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 5b94a1e..1460ba9 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -93,7 +93,7 @@ RDEPENDS_${PN} = "\
 	${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
 	"
 
-PACKAGES_DYNAMIC = "${PN}-plugin-*"
+PACKAGES_DYNAMIC = "^${PN}-plugin-.*"
 
 python populate_packages_prepend() {
     depmap = dict(pppd="ppp")
diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index 105cf2e..16ace66 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -33,9 +33,9 @@ PROVIDES = "virtual/libc-locale"
 
 PACKAGES = "localedef ${PN}-dbg"
 
-PACKAGES_DYNAMIC = "locale-base-* \
-                    eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* \
-                    glibc-gconv-*  glibc-charmap-*  glibc-localedata-*  glibc-binary-localedata-*"
+PACKAGES_DYNAMIC = "^locale-base-.* \
+                    ^eglibc-gconv-.* ^eglibc-charmap-.* ^eglibc-localedata-.* ^eglibc-binary-localedata-.* \
+                    ^glibc-gconv-.*  ^glibc-charmap-.*  ^glibc-localedata-.*  ^glibc-binary-localedata-.*"
 
 # Create a eglibc-binaries package
 ALLOW_EMPTY_${BPN}-binaries = "1"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index b00bf07..25eaf73 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -89,4 +89,4 @@ RRECOMMENDS_packagegroup-core-sdk = "\
 #    d.setVar('PACKAGES', ' '.join(pkgs))
 #}
 #
-#PACKAGES_DYNAMIC = "packagegroup-core-sdk-*"
+#PACKAGES_DYNAMIC = "^packagegroup-core-sdk-.*"
diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index d9206d8..18a453a 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -304,8 +304,8 @@ python populate_packages_prepend () {
     do_split_packages(d, libdir, '(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/|auto\/)[^\/]).*)\.(pm|pl|e2x)', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
 }
 
-PACKAGES_DYNAMIC = "perl-module-*"
-PACKAGES_DYNAMIC_virtclass-nativesdk = "nativesdk-perl-module-*"
+PACKAGES_DYNAMIC = "^perl-module-.*"
+PACKAGES_DYNAMIC_virtclass-nativesdk = "^nativesdk-perl-module-.*"
 
 RPROVIDES_perl-lib = "perl-lib"
 
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb
index 85ea708..47f7538 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb
@@ -56,7 +56,7 @@ FILES_${PN} += "${sysconfdir} /www"
 
 CONFFILES_${PN} = "${sysconfdir}/lighttpd.conf"
 
-PACKAGES_DYNAMIC = "lighttpd-module-*"
+PACKAGES_DYNAMIC = "^lighttpd-module-.*"
 
 python populate_packages_prepend () {
     lighttpd_libdir = d.expand('${libdir}')
diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index c32cb14..fae0467 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -46,7 +46,7 @@ FILES_${PN}-dev += "${base_libdir}/security/*.la ${base_libdir}/*.la ${base_libd
 FILES_${PN}-runtime = "${sysconfdir}"
 FILES_${PN}-xtests = "${datadir}/Linux-PAM/xtests"
 
-PACKAGES_DYNAMIC += " pam-plugin-*"
+PACKAGES_DYNAMIC += "^pam-plugin-.*"
 
 RDEPENDS_${PN}-runtime = "libpam pam-plugin-deny pam-plugin-permit pam-plugin-warn pam-plugin-unix"
 RDEPENDS_${PN}-xtests = "libpam pam-plugin-access pam-plugin-debug pam-plugin-cracklib pam-plugin-pwhistory pam-plugin-succeed-if pam-plugin-time coreutils"
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
index 8d18b87..a77eee1 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
@@ -72,7 +72,7 @@ if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons ]; then
 fi
 }
 
-PACKAGES_DYNAMIC += "gdk-pixbuf-loader-*"
+PACKAGES_DYNAMIC += "^gdk-pixbuf-loader-.*"
 PACKAGES_DYNAMIC_virtclass-native = ""
 
 python populate_packages_prepend () {
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
index 2d08dc2..5481f82 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
@@ -36,7 +36,7 @@ EXTRA_OECONF = "--without-libtiff --without-libjasper --enable-xkb --disable-gli
 
 LIBV = "2.10.0"
 
-PACKAGES_DYNAMIC += "gtk-immodule-* gtk-printbackend-*"
+PACKAGES_DYNAMIC += "^gtk-immodule-.* ^gtk-printbackend-.*"
 BBCLASSEXTEND = "native"
 RRECOMMENDS_${PN}_virtclass-native = ""
 DEPENDS_virtclass-native = "glib-2.0-native atk-native pango-native cairo-native gdk-pixbuf-native"
diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index 259517e..d09c2b6 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -10,7 +10,7 @@ DEPENDS = "gtk+"
 
 PR = "r3"
 
-PACKAGES_DYNAMIC = "gtk-engine-* gtk-theme-*"
+PACKAGES_DYNAMIC = "^gtk-engine-.* ^gtk-theme-.*"
 
 RDEPENDS_gtk-theme-redmond = "gtk-engine-redmond95"
 RDEPENDS_gtk-theme-metal = "gtk-engine-metal"
diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index 6655217..41921dc 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -32,7 +32,7 @@ EXTRA_OECONF = "\
   --disable-x11 \
 "
 
-#PACKAGES_DYNAMIC = "directfb-inputdrivers-*"
+#PACKAGES_DYNAMIC = "^directfb-inputdrivers-.*"
 #
 #python populate_packages_prepend () {
 #    inputdrivers_libdir = d.expand('${libdir}/directfb-${RV}/inputdrivers')
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index 2d5aa44..bae06dd 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -21,7 +21,7 @@ python populate_packages_prepend() {
     do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-dri-driver-%s', 'Mesa %s DRI driver', extra_depends='')
 }
 
-PACKAGES_DYNAMIC = "mesa-dri-driver-*"
+PACKAGES_DYNAMIC = "^mesa-dri-driver-.*"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
 
diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index c9e92f0..318403d 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -18,7 +18,7 @@ PACKAGECONFIG[x11] = "--with-x,--without-x,${X11DEPENDS}"
 BBCLASSEXTEND = "native"
 DEPENDS_virtclass-native = "glib-2.0-native cairo-native"
 
-PACKAGES_DYNAMIC = "pango-module-*"
+PACKAGES_DYNAMIC = "^pango-module-.*"
 
 RRECOMMENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'x11', 'pango-module-basic-x', '', d)} pango-module-basic-fc" 
 
diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index 518c74b..a98a0f1 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa
 
 PROVIDES += "virtual/kernel"
 
-PACKAGES_DYNAMIC += "kernel-module-*"
-PACKAGES_DYNAMIC += "kernel-image-*"
+PACKAGES_DYNAMIC += "^kernel-module-.*"
+PACKAGES_DYNAMIC += "^kernel-image-.*"
 
 #COMPATIBLE_MACHINE = "your_machine"
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
index ccb81b3..b8db0f0 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
@@ -17,5 +17,5 @@ acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
 require gst-plugins-package.inc
 
-PACKAGES_DYNAMIC = "${PN}-*"
+PACKAGES_DYNAMIC = "^${PN}-.*"
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 3003eaa..a890c25 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -70,7 +70,7 @@ PACKAGES =+ "libpulsecore libpulsecommon libpulsedsp libpulse libpulse-simple li
 #upgrade path:
 RREPLACES_pulseaudio-server = "libpulse-bin libpulse-conf"
 
-PACKAGES_DYNAMIC = "pulseaudio-lib* pulseaudio-module* libpulse-lib* libpulse-module* "
+PACKAGES_DYNAMIC = "^pulseaudio-lib.* ^pulseaudio-module.* ^libpulse-lib.* ^libpulse-module.* "
 
 FILES_libpulsecore = "${libdir}/libpulsecore*.so"
 FILES_libpulsecommon = "${libdir}/libpulsecommon*.so"
diff --git a/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb b/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb
index 9522d88..15273f7 100644
--- a/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb
+++ b/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb
@@ -26,7 +26,7 @@ export EXTRA_OECMAKE = "-DQT_QMAKE_EXECUTABLE=${OE_QMAKE_QMAKE} \
                         -DQT_HEADERS_DIR=${OE_QMAKE_INCDIR_QT} \
                         -DQT_QTCORE_INCLUDE_DIR=${OE_QMAKE_INCDIR_QT}/QtCore \
                         "
-PACKAGES_DYNAMIC = "qmmp-plugin-* "
+PACKAGES_DYNAMIC = "^qmmp-plugin-.* "
 
 
 python populate_packages_prepend () {
diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 905e277..4a146f7 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -53,7 +53,7 @@ RRECOMMENDS_${QT_BASE_NAME}-demos += " \
             ${QT_BASE_NAME}-fonts"
 
 ALLOW_EMPTY_${QT_BASE_NAME}-fonts = "1"
-PACKAGES_DYNAMIC += "${QT_BASE_NAME}-fonts-*"
+PACKAGES_DYNAMIC += "^${QT_BASE_NAME}-fonts-.*"
 
 FILES_${QT_BASE_NAME}-fonts-ttf-vera       = "${libdir}/fonts/Vera*.ttf"
 FILES_${QT_BASE_NAME}-fonts-ttf-dejavu     = "${libdir}/fonts/DejaVu*.ttf"
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 35748f8..5bc7956 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -124,7 +124,7 @@ PACKAGES += " \
              ${STATICDEV_PACKAGES} \
              ${OTHER_PACKAGES}"
 
-PACKAGES_DYNAMIC = "${QT_BASE_NAME}-plugin-* ${QT_BASE_NAME}-translation-* ${QT_BASE_NAME}-phrasebook-*"
+PACKAGES_DYNAMIC = "^${QT_BASE_NAME}-plugin-.* ^${QT_BASE_NAME}-translation-.* ^${QT_BASE_NAME}-phrasebook-.*"
 
 ALLOW_EMPTY_${PN} = "1"
 FILES_${PN}     = ""
-- 
1.7.12



