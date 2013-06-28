Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 282AC6AF4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:04:38 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id tj12so2913983pac.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=MMNhtSvtkS4qcFhSYK+If4ONNCxbxbvvzxhU0iRoEAA=;
	b=v4m+azL8kCFBav74HLjl+z2cOKFMVHjOxIf1oXzbbwV4TMTIA98FeiNv2pQSPII6sC
	TMsLboLTxaxFa8xvQXkm+FVyFOh7vF9hVwXAlSBFoYxRA9T55+1DslfDyN4a0hIAw6MC
	4HOFmlCTUg33VYWWmjf8V8HV1dKdrKLGWTBEzPMFjZNkIGpv381qxEPBt1vhI0mOYYv0
	x5UEQUa/DNPvID3LIpp59UQVG4O73D+OmuUeq60byYxqYkQdFj9XjHqf/FFAlbFZAuW0
	9JLYc22OOsz+6VF/R19IisL+hvqSiUSXClblUYfx9EZ4AgQv0carPy+ekxeYFQ9CQVP9
	pd4w==
X-Received: by 10.68.241.135 with SMTP id wi7mr13475128pbc.88.1372457079558;
	Fri, 28 Jun 2013 15:04:39 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	re16sm10723745pac.16.2013.06.28.15.04.38 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:04:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 15:03:58 -0700
Message-Id: <21b6c5c412ad8df8c0194e8b2b6d96c0569982cc.1372456294.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
References: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
In-Reply-To: <cover.1372456294.git.raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
Subject: [PATCH 13/24] python3: Add native recipe
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
X-List-Received-Date: Fri, 28 Jun 2013 22:04:38 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-native_3.3.0.bb                 |   68 ++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-native_3.3.0.bb

diff --git a/meta/recipes-devtools/python/python3-native_3.3.0.bb b/meta/recipes-devtools/python/python3-native_3.3.0.bb
new file mode 100644
index 0000000..3486ca0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-native_3.3.0.bb
@@ -0,0 +1,68 @@
+require recipes-devtools/python/python.inc
+
+PR = "${INC_PR}.0"
+PYTHON_MAJMIN = "3.3"
+DISTRO_SRC_URI ?= "file://sitecustomize.py"
+DISTRO_SRC_URI_linuxstdbase = ""
+SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
+file://000-cross-compile.patch \
+file://020-dont-compile-python-files.patch \
+file://030-fixup-include-dirs.patch \
+file://070-dont-clean-ipkg-install.patch \
+file://080-distutils-dont_adjust_files.patch \
+file://110-enable-zlib.patch \
+file://130-readline-setup.patch \
+file://140-verbose-sharedmods.patch \
+file://150-fix-setupterm.patch \
+file://h2py-pr13032.patch \
+file://python-3.3-multilib.patch \
+file://03-fix-tkinter-detection.patch \
+file://avoid_warning_about_tkinter.patch \
+file://06-ctypes-libffi-fix-configure.patch \
+file://shutil-follow-symlink-fix.patch \
+${DISTRO_SRC_URI} \
+"
+SRC_URI[md5sum] = "b3b2524f72409d919a4137826a870a8f"
+SRC_URI[sha256sum] = "15c113fd6c058712f05d31b4eff149d4d823b8e39ef5e37228dc5dc4f8716df9"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d214581529e343354f8e23025bdf582d"
+
+S = "${WORKDIR}/Python-${PV}"
+
+EXTRANATIVEPATH += "bzip2-native"
+DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native sqlite3-native"
+
+inherit native
+
+RPROVIDES += "python3-distutils-native python3-compression-native python3-textutils-native python3-core-native"
+
+EXTRA_OECONF_append = " --bindir=${bindir}/${PN}"
+
+EXTRA_OEMAKE = '\
+  BUILD_SYS="" \
+  HOST_SYS="" \
+  LIBC="" \
+  STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE} \
+  STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
+  LIB=${baselib} \
+  ARCH=${TARGET_ARCH} \
+'
+
+do_configure_prepend() {
+	autoreconf --verbose --install --force --exclude=autopoint Modules/_ctypes/libffi || bbnote "_ctypes failed to autoreconf"
+}
+
+do_install() {
+	install -d ${D}${libdir}/pkgconfig
+	oe_runmake 'DESTDIR=${D}' install
+	if [ -e ${WORKDIR}/sitecustomize.py ]; then
+		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
+	fi
+	install -d ${D}${bindir}/${PN}
+	install -m 0755 Parser/pgen ${D}${bindir}/${PN}
+
+	# Make sure we use /usr/bin/env python
+	for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
+		sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
+	done
+}
-- 
1.7.9.5


