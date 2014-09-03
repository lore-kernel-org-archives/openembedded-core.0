Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8A00871347
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 16:26:54 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id x3so8930834qcv.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 09:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=UXjr5nBlusxfTY//5Yaw6jDrDpY5pLaw+xzgORewDd8=;
	b=M2zbL7G744gcrOzTFqp8DUTT5UMklWoHFx1ze4DdhfMohUb3RpjL8vlGFWKRubBWbf
	X2iYYmBy+nflHkz5RFzj5P4mVnyVroeADXIdzNSDLXJi+m+08CRNO5SwbmfxO2zqX4yL
	tvdvuhGGhN+ExFWklz1afrBiU4iHYRHttu5ifY8F/z2pDqofH/g3RewNCltuOm12B7B+
	bDSfoKK63ccb9mPL/fOwp3IPUkHTminwDHonIxVF1F7krrVDNdOKWoaGBaZkN2GniHKI
	jc4U9SXV/efOPA/jz+LrP5haQEkB25s0P8d2uVYsem5celIQFfG2Zhr9+gj61t0I4cd9
	iIeA==
MIME-Version: 1.0
X-Received: by 10.140.83.17 with SMTP id i17mr63504967qgd.16.1409761615909;
	Wed, 03 Sep 2014 09:26:55 -0700 (PDT)
Received: by 10.96.205.134 with HTTP; Wed, 3 Sep 2014 09:26:55 -0700 (PDT)
In-Reply-To: <CACS+7ZQPApooy-T6E9rTXRhSRFs6PZGP0YJTou7f+ckxPN-CjA@mail.gmail.com>
References: <CACS+7ZQPApooy-T6E9rTXRhSRFs6PZGP0YJTou7f+ckxPN-CjA@mail.gmail.com>
Date: Wed, 3 Sep 2014 10:26:55 -0600
Message-ID: <CACS+7ZRpSoftQT=G+bP=1j_iaHx_G=sSw3m3WfEj2Lkf3xreVQ@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH v3] gcc-runtime: enable sanitizers
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
X-List-Received-Date: Wed, 03 Sep 2014 16:26:57 -0000
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
 meta/recipes-devtools/gcc/gcc-runtime.inc | 32 ++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 7ce84f1..f1928b4 100644
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
@@ -171,6 +176,31 @@ FILES_libatomic-dev = "\
 "
 FILES_libatomic-staticdev = "${libdir}/libatomic.a"

+FILES_libsanitizer = "\
+  ${libdir}/libasan.so.* \
+  ${libdir}/liblsan.so.* \
+  ${libdir}/libtsan.so.* \
+  ${libdir}/libubsan.so.* \
+"
+FILES_libsanitizer-dev = "\
+  ${libdir}/libsanitizer.spec \
+  ${libdir}/libasan_preinit.o \
+  ${libdir}/libasan.so \
+  ${libdir}/liblsan.so \
+  ${libdir}/libtsan.so \
+  ${libdir}/libubsan.so \
+  ${libdir}/libasan.la \
+  ${libdir}/liblsan.la \
+  ${libdir}/libtsan.la \
+  ${libdir}/libubsan.la \
+"
+FILES_libsanitizer-staticdev = "\
+  ${libdir}/libasan.a \
+  ${libdir}/liblsan.a \
+  ${libdir}/libtsan.a \
+  ${libdir}/libubsan.a \
+"
+
 do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
-- 
1.9.3

