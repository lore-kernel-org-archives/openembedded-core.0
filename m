Return-Path: <kergoth@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9D0E46A9A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 01:49:37 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so2867723pbb.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 18:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=2VWx4YnaC+vm2Kb4LSPUEnrjXNA3ZKNwnoVX4J0W/Tg=;
	b=K3P//6Z21tByTNMgqUJxcrlBCixArZGoMZodZRhPc3PE3uD58sAPuO0NfqlDkf6Hik
	rTmDfOAyrysqHdGLYI5Pb+oSeETWaG+KbLkROfRy5sIxTABE9K2k7nBLx5eXBgqMoUe3
	VfEGaru/S0BG+erGb4bYCs2wDNmSaxAU5nI4i2v0zzc238LjYJr0au8Vw8529t4Chhoq
	2QaZdWaiJaAygNO7iCC3axMht/7bcuig4+BHP8+9m4s1n7GF2BIC6tK6Yx+slSs1q1La
	4Z71nX+iy+P45G5OMwiE5js1C9wkwpTXjJAw3Cyd6CsdvLgtFzHvjBHnkaFDDr463zWe
	0p2Q==
X-Received: by 10.68.75.49 with SMTP id z17mr8330748pbv.169.1370915379020;
	Mon, 10 Jun 2013 18:49:39 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id z19sm3388361paf.12.2013.06.10.18.49.36
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 18:49:38 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 18:49:34 -0700
Message-Id: <c0ba5fcaba4666698c7ba9469b77554e07c1248f.1370915304.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1370915304.git.chris_larson@mentor.com>
References: <cover.1370915304.git.chris_larson@mentor.com>
In-Reply-To: <cover.1370915304.git.chris_larson@mentor.com>
References: <cover.1370915304.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH v2 4/4] libnewt: split python module into libnewt-python
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
X-List-Received-Date: Tue, 11 Jun 2013 01:49:37 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is useful as it avoids pulling python into a build just to build
chkconfig. The python recipe uses the libnewt installed in the sysroot by the
main package, so there's little loss of build time, other than the additional
unpack/patch.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-extended/newt/libnewt-0.52.14.inc     | 45 ++++++++++++++++++
 .../newt/libnewt-python_0.52.14.bb                 | 26 +++++++++++
 meta/recipes-extended/newt/libnewt_0.52.14.bb      | 54 +---------------------
 3 files changed, 73 insertions(+), 52 deletions(-)
 create mode 100644 meta/recipes-extended/newt/libnewt-0.52.14.inc
 create mode 100644 meta/recipes-extended/newt/libnewt-python_0.52.14.bb

diff --git a/meta/recipes-extended/newt/libnewt-0.52.14.inc b/meta/recipes-extended/newt/libnewt-0.52.14.inc
new file mode 100644
index 0000000..262610c
--- /dev/null
+++ b/meta/recipes-extended/newt/libnewt-0.52.14.inc
@@ -0,0 +1,45 @@
+SUMMARY = "A library for text mode user interfaces"
+
+DESCRIPTION = "Newt is a programming library for color text mode, widget based user \
+interfaces.  Newt can be used to add stacked windows, entry widgets, \
+checkboxes, radio buttons, labels, plain text fields, scrollbars, \
+etc., to text mode user interfaces.  This package also contains the \
+shared library needed by programs built with newt, as well as a \
+/usr/bin/dialog replacement called whiptail.  Newt is based on the \
+slang library."
+
+HOMEPAGE = "https://fedorahosted.org/newt/"
+SECTION = "libs"
+
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+# slang needs to be >= 2.2
+DEPENDS = "slang popt"
+
+PR = "r2"
+
+SRC_URI = "https://fedorahosted.org/releases/n/e/newt/newt-${PV}.tar.gz \
+           file://remove_slang_include.patch \
+           file://fix_SHAREDDIR.patch \
+           file://cross_ar.patch \
+           file://fix_python_fpic.patch"
+
+SRC_URI[md5sum] = "eb78c6bb658b92ec7198908b5b8d0e37"
+SRC_URI[sha256sum] = "f70f4f58baa60388ddf2e39249ffb00898fb40f2b2767e42e2ab51fe4b40978e"
+
+S = "${WORKDIR}/newt-${PV}"
+
+EXTRA_OECONF = "--without-tcl --without-python"
+
+inherit autotools
+
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+export BUILD_SYS
+export HOST_SYS
+
+do_configure_prepend() {
+    sh autogen.sh
+}
diff --git a/meta/recipes-extended/newt/libnewt-python_0.52.14.bb b/meta/recipes-extended/newt/libnewt-python_0.52.14.bb
new file mode 100644
index 0000000..dd3ac63
--- /dev/null
+++ b/meta/recipes-extended/newt/libnewt-python_0.52.14.bb
@@ -0,0 +1,26 @@
+require recipes-extended/newt/libnewt-${PV}.inc
+
+SUMMARY .= " - python"
+DEPENDS = "libnewt python"
+RDEPENDS_${PN} += "python-core"
+
+inherit pythonnative python-dir
+
+EXTRA_OECONF += "--with-python"
+EXTRA_OEMAKE += "PYTHONVERS=${PYTHON_DIR}"
+
+
+do_compile () {
+	VERSION="$(sed -n 's/^VERSION = //p' Makefile)"
+	oe_runmake "LIBNEWTSH=${STAGING_LIBDIR}/libnewt.so.$VERSION" _snackmodule.so
+}
+
+do_install () {
+	install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+	install -m 0755 ${PYTHON_DIR}/_snackmodule.so ${D}${PYTHON_SITEPACKAGES_DIR}/
+	install -m 0644 snack.py ${D}${PYTHON_SITEPACKAGES_DIR}/
+}
+
+
+FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/*"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/"
diff --git a/meta/recipes-extended/newt/libnewt_0.52.14.bb b/meta/recipes-extended/newt/libnewt_0.52.14.bb
index 54da15d..155114e 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.14.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.14.bb
@@ -1,54 +1,4 @@
-SUMMARY = "A library for text mode user interfaces"
-
-DESCRIPTION = "Newt is a programming library for color text mode, widget based user \
-interfaces.  Newt can be used to add stacked windows, entry widgets, \
-checkboxes, radio buttons, labels, plain text fields, scrollbars, \
-etc., to text mode user interfaces.  This package also contains the \
-shared library needed by programs built with newt, as well as a \
-/usr/bin/dialog replacement called whiptail.  Newt is based on the \
-slang library."
-
-HOMEPAGE = "https://fedorahosted.org/newt/"
-SECTION = "libs"
-
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
-
-# slang needs to be >= 2.2
-DEPENDS = "slang popt python"
-
-PR = "r2"
-
-SRC_URI = "https://fedorahosted.org/releases/n/e/newt/newt-${PV}.tar.gz \
-           file://remove_slang_include.patch \
-           file://fix_SHAREDDIR.patch \
-           file://cross_ar.patch \
-           file://fix_python_fpic.patch"
-
-SRC_URI[md5sum] = "eb78c6bb658b92ec7198908b5b8d0e37"
-SRC_URI[sha256sum] = "f70f4f58baa60388ddf2e39249ffb00898fb40f2b2767e42e2ab51fe4b40978e"
-
-S = "${WORKDIR}/newt-${PV}"
-
-EXTRA_OECONF = "--without-tcl"
-
-inherit autotools pythonnative python-dir
-
-EXTRA_OEMAKE = "PYTHONVERS=${PYTHON_DIR}"
-
-export STAGING_INCDIR
-export STAGING_LIBDIR
-
-export BUILD_SYS
-export HOST_SYS
-
-PACKAGES_prepend = "whiptail ${PN}-python "
-
-do_configure_prepend() {
-    ( cd ${S}; sh autogen.sh )
-}
+require recipes-extended/newt/${BPN}-${PV}.inc
 
+PACKAGES =+ "whiptail"
 FILES_whiptail = "${bindir}/whiptail"
-FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/"
-FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*"
-FILES_${PN}-staticdev = "${libdir}/*.a"
-- 
1.8.3


