Return-Path: <sbabic@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 8E5A965C63
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 13:16:06 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3mBRjd6hYJz3hhTp;
	Wed, 17 Jun 2015 15:16:05 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	by mail.mnet-online.de (Postfix) with ESMTP id 3mBRjd4dZfzvjDx;
	Wed, 17 Jun 2015 15:16:05 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 46AC5454091E;
	Wed, 17 Jun 2015 15:16:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mfeu5DYYvHI3; Wed, 17 Jun 2015 15:15:58 +0200 (CEST)
Received: from papero.fritz.box (papero.fritz.box [192.168.178.20])
	by babic.homelinux.org (Postfix) with ESMTP id 8076745408DA;
	Wed, 17 Jun 2015 15:15:57 +0200 (CEST)
From: Stefano Babic <sbabic@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 15:15:40 +0200
Message-Id: <1434546940-21914-1-git-send-email-sbabic@denx.de>
X-Mailer: git-send-email 1.9.1
Cc: marex@denx.de, paul.eggleton@linux.intel.com, koen@dominion.thruhere.net
Subject: [PATCH] ICU: libicudata corrupt on big endian systems
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
X-List-Received-Date: Wed, 17 Jun 2015 13:16:10 -0000

Tools to generate libicudata are not able
to write the library according to the endianess.

Signed-off-by: Stefano Babic <sbabic@denx.de>
---

Issue was described in a previous:

https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg65155.html

 meta/recipes-support/icu/icu/0001-target.patch     | 35 +++++++++++++
 .../icu/icu/native_big_endian.patch                | 60 ++++++++++++++++++++++
 meta/recipes-support/icu/icu_54.1.bb               |  4 ++
 3 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/0001-target.patch
 create mode 100644 meta/recipes-support/icu/icu/native_big_endian.patch

diff --git a/meta/recipes-support/icu/icu/0001-target.patch b/meta/recipes-support/icu/icu/0001-target.patch
new file mode 100644
index 0000000..f13ab69
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0001-target.patch
@@ -0,0 +1,35 @@
+From 1878e1bfcd116dd3ed9519dd891bf18f860072b7 Mon Sep 17 00:00:00 2001
+From: Stefano Babic <sbabic@denx.de>
+Date: Thu, 4 Jun 2015 17:53:30 +0200
+Subject: [PATCH] target
+
+Signed-off-by: Stefano Babic <sbabic@denx.de>
+---
+ source/data/Makefile.in | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/source/data/Makefile.in b/source/data/Makefile.in
+index e600a84..67fedab 100644
+--- a/data/Makefile.in
++++ b/data/Makefile.in
+@@ -45,6 +45,7 @@ ifeq ($(CURDIR),)
+ CURDIR=.
+ endif
+ PKGDATA = $(TOOLBINDIR)/pkgdata $(PKGDATA_OPTS) -q -c -s $(CURDIR)/out/build/$(ICUDATA_PLATFORM_NAME) -d $(ICUPKGDATA_OUTDIR)
++GENCCODE = $(TOOLBINDIR)/genccode
+ OS390_PDS_NAME = -z -L $(BATCH_STUB_TARGET)
+
+ ifeq ($(OS390_STUBDATA),1)
+@@ -180,6 +181,10 @@ endif
+ endif
+ ifneq ($(ICUDATA_SOURCE_IS_NATIVE_TARGET),YES)
+	$(PKGDATA_INVOKE) $(PKGDATA) -e $(ICUDATA_ENTRY_POINT) -T $(OUTTMPDIR) -p $(ICUDATA_NAME) -m $(PKGDATA_MODE) $(PKGDATA_VERSIONING) $(PKGDATA_LIBNAME) $(PKGDATA_LIST)
++	cp $(OUTDIR)/$(ICUDATA_NAME).dat $(OUTDIR)/$(ICUDATA_BASENAME_VERSION).dat
++	$(INVOKE) $(GENCCODE) $(OUTDIR)/$(ICUDATA_BASENAME_VERSION).dat
++	$(INVOKE) $(COMPILE.c) -I$(top_srcdir)/common -I$(top_builddir)/common -o $(OUTDIR)/$(ICUDATA_BASENAME_VERSION)_dat.o -c $(ICUDATA_BASENAME_VERSION)_dat.c
++	$(INVOKE) $(SHLIB.c) -o ../lib/$(LIB_ICUDATA_NAME).so.$(VERSION) $(OUTDIR)/$(ICUDATA_BASENAME_VERSION)_dat.o -Wl,-soname -Wl,$(LIB_ICUDATA_NAME).so.$(VERSION)
+ ifeq ($(OS390BATCH),1)
+	$(PKGDATA_INVOKE) $(PKGDATA) -e $(ICUDATA_ENTRY_POINT) -T $(OUTTMPDIR) -p $(ICUDATA_NAME) -m $(PKGDATA_MODE) $(PKGDATA_VERSIONING) $(OS390_PDS_NAME) $(PKGDATA_LIST)
+ endif
+--
+1.9.3
diff --git a/meta/recipes-support/icu/icu/native_big_endian.patch b/meta/recipes-support/icu/icu/native_big_endian.patch
new file mode 100644
index 0000000..b0270c9
--- /dev/null
+++ b/meta/recipes-support/icu/icu/native_big_endian.patch
@@ -0,0 +1,60 @@
+diff --git a/tools/icupkg/icupkg.cpp b/tools/icupkg/icupkg.cpp
+index 4ae7ac4..0d9c261 100644
+--- a/tools/icupkg/icupkg.cpp
++++ b/tools/icupkg/icupkg.cpp
+@@ -27,6 +27,8 @@
+ *   Will not work with data DLLs (shared libraries).
+ */
+
++#define U_IS_BIG_ENDIAN 1
++
+ #include "unicode/utypes.h"
+ #include "unicode/putil.h"
+ #include "cstring.h"
+diff --git a/tools/toolutil/pkg_genc.c b/tools/toolutil/pkg_genc.c
+index 5c041e9..a3ef4de 100644
+--- a/tools/toolutil/pkg_genc.c
++++ b/tools/toolutil/pkg_genc.c
+@@ -3,6 +3,7 @@
+  *   Corporation and others.  All Rights Reserved.
+  *******************************************************************************
+  */
++#define U_IS_BIG_ENDIAN 1
+ #include "unicode/utypes.h"
+
+ #if U_PLATFORM_HAS_WIN32_API
+@@ -411,9 +412,8 @@ writeCCode(const char *filename, const char *destdir, const char *optName, const
+         "#endif\n"
+         "U_CDECL_BEGIN\n"
+         "const struct {\n"
+-        "    double bogus;\n"
+         "    uint8_t bytes[%ld]; \n"
+-        "} %s={ 0.0, {\n",
++        "} %s={ {\n",
+         (long)T_FileStream_size(in), entry);
+     T_FileStream_writeLine(out, buffer);
+
+diff --git a/tools/toolutil/pkg_icu.cpp b/tools/toolutil/pkg_icu.cpp
+index 87ed091..79ba616 100644
+--- a/tools/toolutil/pkg_icu.cpp
++++ b/tools/toolutil/pkg_icu.cpp
+@@ -3,6 +3,7 @@
+  *   Corporation and others.  All Rights Reserved.
+  *******************************************************************************
+  */
++#define U_IS_BIG_ENDIAN 1
+ #include "unicode/utypes.h"
+ #include "unicode/putil.h"
+ #include "cstring.h"
+diff --git a/tools/toolutil/pkg_icu.h b/tools/toolutil/pkg_icu.h
+index 8451f8d..cb2f48b 100644
+--- a/tools/toolutil/pkg_icu.h
++++ b/tools/toolutil/pkg_icu.h
+@@ -7,6 +7,7 @@
+ #ifndef __PKG_ICU_H__
+ #define __PKG_ICU_H__
+
++#define U_IS_BIG_ENDIAN 1
+ #include "unicode/utypes.h"
+
+ #define U_PKG_RESERVED_CHARS "\"%&'()*+,-./:;<=>?_"
diff --git a/meta/recipes-support/icu/icu_54.1.bb b/meta/recipes-support/icu/icu_54.1.bb
index 45b5cb6..875b39b 100644
--- a/meta/recipes-support/icu/icu_54.1.bb
+++ b/meta/recipes-support/icu/icu_54.1.bb
@@ -11,11 +11,15 @@ ICU_PV = "${@icu_download_version(d)}"
 BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV}-src.tgz"
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
+	   ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '', 'file://0001-target.patch ', d)} \
           "
 
+
+SRC_URI_append_class-native = "${@base_conditional('TUNE_ARCH', 'powerpc', 'file://native_big_endian.patch', '', d)}"
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
 SRC_URI[md5sum] = "e844caed8f2ca24c088505b0d6271bc0"
 SRC_URI[sha256sum] = "d42bc9a8ca6a91c55eb0925c279f49e5b508d51ef26ac9850d9be55de5bb8ab3"
 
+EXTRA_OECONF_append_class-native = "${@base_conditional('TUNE_ARCH', 'powerpc', '--with-data-packaging=files', '', d)}"
-- 
1.9.1


