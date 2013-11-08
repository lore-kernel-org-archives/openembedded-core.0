Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 382736D2F5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 16:06:42 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id hm2so1145439wib.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2013 08:06:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rU8unsI2u9YYGXizGNwEBa8tcqyUsATtwBXzGVhSrTM=;
	b=ktd+BHjGRREifv2pFW2isCe46M/rPDq4hwESLmkXwQZVRysaaTA0J5sZAPl1PrWZ0E
	GRLmk3C8RSKFweImJ+7wttcaVaST8CclyosbbH461AJKEiryb6mgqo4wURhEfFZgwYTW
	5ZNs4PhC1iHWVJI8OOc011iNCB4tEBz6Z5v1faCg3aBkDbcCQvPDJOKuGkDuW9WRnu2e
	gkcT+CfIZMsrquGtLVSn9bIC7kVKDxWhR02SAPzvbUfcP7qPa54QLHG2bsF/SgT/9f9o
	+PAMLp2WfHeqyYonEJWEsOnHC0Ve7XKuTvbQg1447U8cor0KZgQOlma2JcZ/cSI8u69/
	tWLg==
X-Gm-Message-State: ALoCoQntSYnG8txPIKfYn/cSKTNCZk2uKgMiu321zSSchvlXlDrSLIVoO2Pe6+aDNNLE3Jpi2PVl
X-Received: by 10.180.97.5 with SMTP id dw5mr2955639wib.42.1383926803602;
	Fri, 08 Nov 2013 08:06:43 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ll10sm6781034wic.9.2013.11.08.08.06.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Nov 2013 08:06:42 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Nov 2013 16:06:38 +0000
Message-Id: <1383926799-23212-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] glib-2.0: move more logic to the .inc
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
X-List-Received-Date: Fri, 08 Nov 2013 16:06:43 -0000

The .bb was getting larger with configuration being arbitarily split between .bb
and .inc.  To help adding a glib_git recipe, strip the .bb down to SRC_URI.

Also don't remove $libdir/gio as it should be owned by glib.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.38.1.bb |   47 -------------------------
 meta/recipes-core/glib-2.0/glib.inc           |   47 ++++++++++++++++++++++---
 2 files changed, 43 insertions(+), 51 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.38.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.38.1.bb
index 3e874d7..a5db302 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.38.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.38.1.bb
@@ -2,10 +2,6 @@ require glib.inc
 
 PE = "1"
 
-DEPENDS += "libffi zlib"
-DEPENDS_class-native += "libffi-native"
-DEPENDS_class-nativesdk += "nativesdk-libffi nativesdk-zlib ${BPN}-native"
-
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
@@ -21,46 +17,3 @@ SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
 
 SRC_URI[md5sum] = "f3f6789151c1810f2fe23fe9ebb8b828"
 SRC_URI[sha256sum] = "01906c62ac666d2ab3183cc07261b2536fab7b211c6129ab66b119c2af56d159"
-
-BBCLASSEXTEND = "native nativesdk"
-
-RDEPENDS_${PN}-ptest += "\
-            gnome-desktop-testing \
-            tzdata \
-            tzdata-americas \
-            tzdata-asia \
-            tzdata-europe \
-            tzdata-posix \
-            python-pygobject \
-            python-dbus \
-           "
-
-RDEPENDS_${PN}-ptest_append_libc-glibc = "\
-            eglibc-gconv-utf-16 \
-            eglibc-charmap-utf-8 \
-            eglibc-gconv-cp1255 \
-            eglibc-charmap-cp1255 \
-            eglibc-gconv-utf-32 \
-            eglibc-gconv-utf-7 \
-            eglibc-charmap-invariant \
-            eglibc-localedata-translit-cjk-variants \
-           "
-EXTRA_OECONF_append_class-target_libc-uclibc = " --with-libiconv=gnu"
-
-do_configure_prepend() {
-	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
-}
-
-do_install_append() {
-  # remove some unpackaged files
-  rm -f ${D}${datadir}/glib-2.0/codegen/*.pyc
-  rm -f ${D}${datadir}/glib-2.0/codegen/*.pyo
-  # and empty dirs
-  rm -rf ${D}${libdir}/gio
-
-  # Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
-  # for target as /usr/bin/perl, so fix it to /usr/bin/perl.
-  if [ -f ${D}${bindir}/glib-mkenums ]; then
-    sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/glib-mkenums
-  fi
-}
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index ad0671a..0698c29 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -13,9 +13,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 BUGTRACKER = "http://bugzilla.gnome.org"
 SECTION = "libs"
 
-DEPENDS = "glib-2.0-native virtual/libiconv"
-DEPENDS_class-native = "pkgconfig-native gettext-native"
-DEPENDS_class-nativesdk = "nativesdk-libtool"
+BBCLASSEXTEND = "native nativesdk"
+
+DEPENDS = "glib-2.0-native virtual/libiconv libffi zlib"
+DEPENDS_class-native = "pkgconfig-native gettext-native libffi-native"
+DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-libffi nativesdk-zlib ${BPN}-native"
 PACKAGES =+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
 
 LEAD_SONAME = "libglib-2.0.*"
@@ -30,8 +32,13 @@ CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap
 PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-installed-tests', '--disable-installed-tests', d)}"
 EXTRA_OECONF = "--enable-included-printf=no ${CORECONF} ${PTEST_CONF}"
 EXTRA_OECONF_class-native = "${CORECONF} --disable-selinux"
+EXTRA_OECONF_append_class-target_libc-uclibc = " --with-libiconv=gnu"
+
+do_configure_prepend() {
+	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
+}
 
-FILES_${PN} = "${libdir}/lib*${SOLIBS} ${datadir}/glib-2.0/schemas \
+FILES_${PN} = "${libdir}/lib*${SOLIBS} ${libdir}/gio ${datadir}/glib-2.0/schemas \
                ${datadir}/glib-2.0/gettext/mkinstalldirs ${datadir}/glib-2.0/gettext/po/Makefile.in.in"
 FILES_${PN}-dev += "${libdir}/glib-2.0/include \
                     ${libdir}/gio/modules/lib*${SOLIBSDEV} \
@@ -50,4 +57,36 @@ USE_NLS = "yes"
 
 do_install_append () {
 	sed ${D}${bindir}/gtester-report -i -e '1s|^#!.*|#!/usr/bin/env python|'
+
+	# Remove some unpackaged files
+	rm -f ${D}${datadir}/glib-2.0/codegen/*.pyc
+	rm -f ${D}${datadir}/glib-2.0/codegen/*.pyo
+
+	# Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
+	# for target as /usr/bin/perl, so fix it to /usr/bin/perl.
+	if [ -f ${D}${bindir}/glib-mkenums ]; then
+		sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/glib-mkenums
+	fi
 }
+
+RDEPENDS_${PN}-ptest += "\
+            gnome-desktop-testing \
+            tzdata \
+            tzdata-americas \
+            tzdata-asia \
+            tzdata-europe \
+            tzdata-posix \
+            python-pygobject \
+            python-dbus \
+           "
+
+RDEPENDS_${PN}-ptest_append_libc-glibc = "\
+            eglibc-gconv-utf-16 \
+            eglibc-charmap-utf-8 \
+            eglibc-gconv-cp1255 \
+            eglibc-charmap-cp1255 \
+            eglibc-gconv-utf-32 \
+            eglibc-gconv-utf-7 \
+            eglibc-charmap-invariant \
+            eglibc-localedata-translit-cjk-variants \
+           "
-- 
1.7.10.4


