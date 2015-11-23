Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 41CBE601A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 17:29:50 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so172115159wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 09:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=e611q7T+916MGawgdYmRHqgNaeqjnWxCSao/jnViC4w=;
	b=KC5i+1OWcQ/DdtvHxq6EEZa77NHWSlAc7/NXUSw+uyctK7+5slav+u3lmUvK+4O7k/
	dpdPLORtHgGr8SfmdLvdBCfZV0WSMM2GkY6e6imIeCsaJTSNi05huEamO6pdIm4HJjgl
	rMD9WK9A0peXgprc05y5hVteBg9oCuQ/+vv7GCOPGiVeq8hHjfuf2ZcygEFmMyxfS0rH
	YbzpqbyFVgAKjKYZ3WNYhFOqXOFg8+oRkjtx+/p+0TRY+v0z4aGke5/I/8jPw/1KD7Uk
	zWqlGJG4ofJfnsKhKreaHqdRdm0EVT0cTVY2LIUNDTUJNptwFecaaZAu1E8IKHhcI4vu
	7E3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=e611q7T+916MGawgdYmRHqgNaeqjnWxCSao/jnViC4w=;
	b=bYasKxg/wd1m/+day7cGZs6qZG/YzxIIywNu/S1CJ/WOF3X13yFBP1UG8oyL5tD7Hm
	8+IQknk0he55Gv8jO91aMJ9AAKV9Ru7TtQLwVNQGRvDU0Qn+9S/UEhu97o20kpKzvoNj
	2zcSXsgZWCXm4MkGIq66r8dgV+SI/w4nesVHKaMVIe1wWzSeNp0w9h/GA0vNCafs28o7
	mZIAVS+nFFxZyH5IXM71Zq/hHccMsadj2C8Om3HwG9l7fxgb0T8fc4PkeuuC2DLLx3mK
	3KFx+GSo+hKXa0PtDkaPwkAeYCbeGwAex+edm9vYSleCmtl1g35Y+A+Q1yUv2sJsmKFI
	EIjQ==
X-Gm-Message-State: ALoCoQkkqOv2c9zN02A8gNYwGAcFrTua59w+Q5QZsTN/EwZTuL9KsxIYNFVYwyof0MMlUH19cJY/
X-Received: by 10.28.13.138 with SMTP id 132mr21339048wmn.62.1448299790722;
	Mon, 23 Nov 2015 09:29:50 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q1sm14259835wjy.31.2015.11.23.09.29.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Nov 2015 09:29:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 17:21:10 +0000
Message-Id: <1448299270-2191-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] pkgconfig: merge .bb and .inc
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
X-List-Received-Date: Mon, 23 Nov 2015 17:29:53 -0000

The .inc file included version information and wasn't used anywhere as the same
.bb handles all variations, so merge them to reduce complexity.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig.inc    | 49 ---------------------
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb | 55 ++++++++++++++++++++++--
 2 files changed, 51 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig.inc

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig.inc b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
deleted file mode 100644
index c2a1523..0000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig.inc
+++ /dev/null
@@ -1,49 +0,0 @@
-SUMMARY = "Helper tool used when compiling"
-DESCRIPTION = "pkg-config is a helper tool used when compiling applications and libraries. It helps determined \
-the correct compiler/link options.  It is also language-agnostic."
-HOMEPAGE = "http://pkg-config.freedesktop.org/wiki/"
-BUGTRACKER = "http://bugs.freedesktop.org/buglist.cgi?product=pkg-config"
-SECTION = "console/utils"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-DEPENDS = "glib-2.0"
-DEPENDS_class-native = ""
-DEPENDS_class-nativesdk = ""
-
-SRCREV = "5914edfe9604abfedd220103cbac382fc4d268bb"
-PV = "0.29+git${SRCPV}"
-SRC_URI = "git://anongit.freedesktop.org/pkg-config"
-
-S = "${WORKDIR}/git"
-
-inherit autotools
-
-EXTRA_OECONF = "--without-internal-glib"
-EXTRA_OECONF_class-native = "--with-internal-glib"
-EXTRA_OECONF_class-nativesdk = "--with-internal-glib"
-
-acpaths = "-I ."
-
-BBCLASSEXTEND = "native nativesdk"
-
-# Set an empty dev package to ensure the base PN package gets
-# the pkg.m4 macros, pkgconfig does not deliver any other -dev
-# files.
-FILES_${PN}-dev = ""
-FILES_${PN} += "${datadir}/aclocal/pkg.m4"
-
-# When using the RPM generated automatic package dependencies, some packages
-# will end up requiring 'pkgconfig(pkg-config)'.  Allow this behavior by
-# specifying an appropriate provide.
-RPROVIDES_${PN} += "pkgconfig(pkg-config)"
-
-# Install a pkg-config-native wrapper that will use the native sysroot instead
-# of the MACHINE sysroot, for using pkg-config when building native tools.
-do_install_append_class-native () {
-    sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
-        -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
-        < ${WORKDIR}/pkg-config-native.in > ${B}/pkg-config-native
-    install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
-}
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index eaa511a..d34f608 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -1,6 +1,53 @@
-require pkgconfig.inc
+SUMMARY = "Helper tool used when compiling"
+DESCRIPTION = "pkg-config is a helper tool used when compiling applications and libraries. It helps determined \
+the correct compiler/link options.  It is also language-agnostic."
+HOMEPAGE = "http://pkg-config.freedesktop.org/wiki/"
+BUGTRACKER = "http://bugs.freedesktop.org/buglist.cgi?product=pkg-config"
+SECTION = "console/utils"
 
-SRC_URI += " \
-            file://pkg-config-native.in \
-            file://fix-glib-configure-libtool-usage.patch \
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "glib-2.0"
+DEPENDS_class-native = ""
+DEPENDS_class-nativesdk = ""
+
+SRCREV = "5914edfe9604abfedd220103cbac382fc4d268bb"
+PV = "0.29+git${SRCPV}"
+
+SRC_URI = "git://anongit.freedesktop.org/pkg-config \
+           file://pkg-config-native.in \
+           file://fix-glib-configure-libtool-usage.patch \
            "
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+EXTRA_OECONF = "--without-internal-glib"
+EXTRA_OECONF_class-native = "--with-internal-glib"
+EXTRA_OECONF_class-nativesdk = "--with-internal-glib"
+
+acpaths = "-I ."
+
+BBCLASSEXTEND = "native nativesdk"
+
+# Set an empty dev package to ensure the base PN package gets
+# the pkg.m4 macros, pkgconfig does not deliver any other -dev
+# files.
+FILES_${PN}-dev = ""
+FILES_${PN} += "${datadir}/aclocal/pkg.m4"
+
+# When using the RPM generated automatic package dependencies, some packages
+# will end up requiring 'pkgconfig(pkg-config)'.  Allow this behavior by
+# specifying an appropriate provide.
+RPROVIDES_${PN} += "pkgconfig(pkg-config)"
+
+# Install a pkg-config-native wrapper that will use the native sysroot instead
+# of the MACHINE sysroot, for using pkg-config when building native tools.
+do_install_append_class-native () {
+    sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
+        -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
+        < ${WORKDIR}/pkg-config-native.in > ${B}/pkg-config-native
+    install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
+}
-- 
2.1.4


