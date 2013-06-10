Return-Path: <kergoth@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id 12C266A9C9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:47:43 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id k18so2018820oag.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=WA4VFzU55mCNzQq7y2qPe4XkaeepYX30pjrtux4OWmM=;
	b=kHPEppBEwV4dFOnmM2KnKUSeJGPBNahY+FOudCX0APikU7psJ67q3TLfj28r5x0Dx3
	HO7Z1eQQd0HjWOKsmzXsH8EXjEjeApLHB2uRJMZbc3J3ezAlo+iwFpPsz2qDHVcGjRT2
	w4Y3j2kNlv0xKel63U9NhUBOCs9vaaEyUqlf33M5Vy17sxD3ooOtYb2T/a+dK78sibHR
	mAV9tUq0hkMiaoU6hoyfSBMSbcYKf5FaulEyGrY8RsX4G4kOjrgfsk2sLRq2JnIQsMqm
	ZoJ4AxnHavzIHh0lz8Nmb28D4OupcIZC25e4WBjamaSsY+XQwTrDTOzapEOf4utdSGUi
	rB4w==
X-Received: by 10.60.134.200 with SMTP id pm8mr8913018oeb.136.1370897264150;
	Mon, 10 Jun 2013 13:47:44 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id kz3sm24258712obb.6.2013.06.10.13.47.42
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 13:47:43 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 13:47:05 -0700
Message-Id: <0face86bf815082f2080f84c0214a7835d0380dd.1370896990.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1370896990.git.chris_larson@mentor.com>
References: <cover.1370896990.git.chris_larson@mentor.com>
In-Reply-To: <cover.1370896990.git.chris_larson@mentor.com>
References: <cover.1370896990.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/4] libnewt: split python module into libnewt-python
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
X-List-Received-Date: Mon, 10 Jun 2013 20:47:43 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is useful as it avoids pulling python into a build just to build
chkconfig. The python recipe uses the libnewt installed in the sysroot by the
main package, so there's little loss of build time, other than the additional
unpack/patch.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../newt/libnewt-python_0.52.14.bb                 | 26 ++++++++++++++++++++++
 meta/recipes-extended/newt/libnewt_0.52.14.bb      | 15 +++++--------
 2 files changed, 31 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-extended/newt/libnewt-python_0.52.14.bb

diff --git a/meta/recipes-extended/newt/libnewt-python_0.52.14.bb b/meta/recipes-extended/newt/libnewt-python_0.52.14.bb
new file mode 100644
index 0000000..9af2d5d
--- /dev/null
+++ b/meta/recipes-extended/newt/libnewt-python_0.52.14.bb
@@ -0,0 +1,26 @@
+require recipes-extended/newt/libnewt_${PV}.bb
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
index 54da15d..ee8206e 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.14.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.14.bb
@@ -15,7 +15,7 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 # slang needs to be >= 2.2
-DEPENDS = "slang popt python"
+DEPENDS = "slang popt"
 
 PR = "r2"
 
@@ -30,11 +30,9 @@ SRC_URI[sha256sum] = "f70f4f58baa60388ddf2e39249ffb00898fb40f2b2767e42e2ab51fe4b
 
 S = "${WORKDIR}/newt-${PV}"
 
-EXTRA_OECONF = "--without-tcl"
+EXTRA_OECONF = "--without-tcl --without-python"
 
-inherit autotools pythonnative python-dir
-
-EXTRA_OEMAKE = "PYTHONVERS=${PYTHON_DIR}"
+inherit autotools
 
 export STAGING_INCDIR
 export STAGING_LIBDIR
@@ -42,13 +40,10 @@ export STAGING_LIBDIR
 export BUILD_SYS
 export HOST_SYS
 
-PACKAGES_prepend = "whiptail ${PN}-python "
+PACKAGES_prepend = "whiptail "
 
 do_configure_prepend() {
-    ( cd ${S}; sh autogen.sh )
+    sh autogen.sh
 }
 
 FILES_whiptail = "${bindir}/whiptail"
-FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/"
-FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*"
-FILES_${PN}-staticdev = "${libdir}/*.a"
-- 
1.8.3


