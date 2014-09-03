Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 28B40713DB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 15:11:44 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id c9so8705053qcz.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 08:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=QO3+LfZYksR6haI8QO2lQmm3MYU1nZGyFSmgYyQy4KY=;
	b=LNqIKiuMAxOxDmTHl3wLw6M81tgkoPff/moZg3ZwIA2gJzNsflokLfxmPr6ezh7BfP
	FqosT6mNTRnfiZlfBfD8opyfp0tHgVeuZXYQbQ4ACJAWSBgdYny25JtPlXQO20gvx6Dp
	/6Y6tan0meVB9lWVz7pfQzETPlLLb5x6lFLbuvsviYVkc1jljzi53bn9OOCPlJXCqwQO
	askKLgh8RRgiPJ7yUIemvdiLtu9nMYB3CI/JX1XWyY98A6zGhgAWGh9XADEOB2V9FXNh
	JODGtyuYlOFjF48X+Fgxbu+oltwg/xKrzcTfSiLKom2h6RmtkHY2kclDmnLjmEDv7PLl
	g72g==
MIME-Version: 1.0
X-Received: by 10.224.15.201 with SMTP id l9mr28649225qaa.27.1409757105377;
	Wed, 03 Sep 2014 08:11:45 -0700 (PDT)
Received: by 10.96.205.134 with HTTP; Wed, 3 Sep 2014 08:11:45 -0700 (PDT)
Date: Wed, 3 Sep 2014 09:11:45 -0600
Message-ID: <CACS+7ZQPApooy-T6E9rTXRhSRFs6PZGP0YJTou7f+ckxPN-CjA@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] gcc-runtime: enable sanitizers
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
X-List-Received-Date: Wed, 03 Sep 2014 15:11:46 -0000
Content-Type: text/plain; charset=UTF-8

From: Dan McGregor <dan.mcgregor@usask.ca>

AddressSanitizer is a fast memory error detector.
ThreadSanitizer detects data races.
UBSanitizer detectes undefined behaviour.

All consist of compiler instrumentation and a run-time library.
The compiler instrumentation was already enabled, this enables
the run-time library component.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 7ce84f1..e1663d1 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -10,7 +10,9 @@ EXTRA_OECONF_PATHS = "\

 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"

-RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic"
+SANITIZER_ARCHS = "arm i586 i686 x86-64"
+SANITIZER_TARGET = '${@bb.utils.contains("SANITIZER_ARCHS",
"${TRANSLATED_TARGET_ARCH}", "libsanitizer", "",d)}'
+RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${SANITIZER_TARGET}"
 #  ?
 # libiberty
 # libmudflap
@@ -88,6 +90,9 @@ PACKAGES = "\
     libatomic \
     libatomic-dev \
     libatomic-staticdev \
+    libsanitizer \
+    libsanitizer-dev \
+    libsanitizer-staticdev \
 "
 # The base package doesn't exist, so we clear the recommends.
 RRECOMMENDS_${PN}-dbg = ""
@@ -171,6 +176,28 @@ FILES_libatomic-dev = "\
 "
 FILES_libatomic-staticdev = "${libdir}/libatomic.a"

+FILES_libsanitizer = " \
+  ${libdir}/libasan.so.* \
+  ${libdir}/liblsan.so.* \
+  ${libdir}/libtsan.so.* \
+  ${libdir}/libubsan.so.*"
+FILES_libsanitizer-dev = " \
+  ${libdir}/libsanitizer.spec \
+  ${libdir}/libasan_preinit.o \
+  ${libdir}/libasan.so \
+  ${libdir}/liblsan.so \
+  ${libdir}/libtsan.so \
+  ${libdir}/libubsan.so \
+  ${libdir}/libasan.la \
+  ${libdir}/liblsan.la \
+  ${libdir}/libtsan.la \
+  ${libdir}/libubsan.la"
+FILES_libsanitizer-staticdev = " \
+  ${libdir}/libasan.a \
+  ${libdir}/liblsan.a \
+  ${libdir}/libtsan.a \
+  ${libdir}/libubsan.a"
+
 do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
-- 
1.9.3

