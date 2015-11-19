Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0C1A06080F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 17:11:08 +0000 (UTC)
Received: by qkas77 with SMTP id s77so27965612qka.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 09:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=75qXn8ODa+Fl6taPKi8fbnytDjNIJ3C2n2Et1aUsE+s=;
	b=v5fd3OgHGQqbHGGm7jTyNBwIVQt+3dIGYvmhCeTB56wpNop1mqwjSaMOw+Hg3FJhhk
	XKG1rmc8xNNOnepcQPb6BwIiSjDg6ULLHjKqQK7Gx0dohEp6zgyxepW8i/ZlaUuah0Jx
	r6ztaBXc0BeBmCchoderhLPbbZwDjXyaPTIQUkFWEIYYOBNdsQm24EDyhLfAL23cLyO6
	GrhHF7GfvL2ipN9e26GtHFoFmwwncC911fl0Zp8w1bTPeozoa61yHUny+KpbKx8fjc74
	bhCRtd2Jtg7eCRKrx776xCEW2cwHaE5BqjJIDANpV4B9tU1gV7CSMaUAkm1RERVX4PjP
	zAoA==
X-Received: by 10.55.76.16 with SMTP id z16mr6030295qka.83.1447953068946;
	Thu, 19 Nov 2015 09:11:08 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v138sm2586127qka.6.2015.11.19.09.11.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 09:11:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 17:10:54 +0000
Message-Id: <a39061d1254039ecf9ec37129d1a44aa1ed4f358.1447952784.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
References: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
In-Reply-To: <cover.1447952784.git.raj.khem@gmail.com>
References: <cover.1447952784.git.raj.khem@gmail.com>
Subject: [PATCH 07/13] musl: Add recipe
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
X-List-Received-Date: Thu, 19 Nov 2015 17:11:10 -0000

musl is posix compliant C library for linux

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl.inc    | 26 +++++++++++++++++
 meta/recipes-core/musl/musl_git.bb | 58 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl.inc
 create mode 100644 meta/recipes-core/musl/musl_git.bb

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
new file mode 100644
index 0000000..c3fd5c8
--- /dev/null
+++ b/meta/recipes-core/musl/musl.inc
@@ -0,0 +1,26 @@
+# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "An implementation of the standard library for Linux-based systems"
+DESCRIPTION = "A new standard library to power a new generation of Linux-based devices. \
+musl is lightweight, fast, simple, free, and strives to be correct in the sense of \
+standards-conformance and safety."
+
+HOMEPAGE = "http://www.musl-libc.org/"
+LICENSE = "MIT"
+SECTION = "libs"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bccdfe36b123d1b0757d8025278d86ba"
+
+PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
+TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
+STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${TARGET_ARCH}"
+
+
+FILES_SOLIBSDEV = ""
+FILES_${PN} += "${libdir}/lib*${SOLIBSDEV}"
+INSANE_SKIP_${PN} = "dev-so"
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
new file mode 100644
index 0000000..1feb436
--- /dev/null
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -0,0 +1,58 @@
+# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require musl.inc
+
+SRCREV = "6c5cad2aa56745302c1d42d2c8baf6424d29c0f3"
+
+PV = "1.1.11+git${SRCPV}"
+
+# mirror is at git://github.com/bminor/musl.git
+
+SRC_URI = "git://git.musl-libc.org/musl \
+          "
+
+S = "${WORKDIR}/git"
+
+PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc virtual/libiconv virtual/libintl"
+
+DEPENDS = "virtual/${TARGET_PREFIX}binutils \
+           virtual/${TARGET_PREFIX}gcc-initial \
+           libgcc-initial \
+          "
+
+export CROSS_COMPILE="${TARGET_PREFIX}"
+
+EXTRA_OEMAKE = ""
+
+LDFLAGS += "-Wl,-soname,libc.so"
+
+CONFIGUREOPTS = " \
+    --prefix=${prefix} \
+    --exec-prefix=${exec_prefix} \
+    --bindir=${bindir} \
+    --libdir=${libdir} \
+    --includedir=${includedir} \
+    --syslibdir=${base_libdir} \
+"
+
+do_configure() {
+	${S}/configure ${CONFIGUREOPTS}
+}
+
+do_compile() {
+	oe_runmake
+}
+
+do_install() {
+	oe_runmake install DESTDIR='${D}'
+
+	install -d ${D}${bindir}
+	ln -s ${libdir}/libc.so ${D}${bindir}/ldd
+}
+
+RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
+RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
+RPROVIDES_${PN} += "ldd libsegfault rtld(GNU_HASH)"
+
+LEAD_SONAME = "libc.so"
-- 
2.6.3


