Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym01.jp.fujitsu.com (mgwym01.jp.fujitsu.com [211.128.242.40])
	by mail.openembedded.org (Postfix) with ESMTP id D410365CC2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 11:01:51 +0000 (UTC)
Received: from yt-mxq.gw.nic.fujitsu.com (unknown [192.168.229.66]) by
	mgwym01.jp.fujitsu.com with smtp
	id 7ac9_d4bd_945d3791_6e41_46ee_aefe_43daac432ecf;
	Mon, 01 Aug 2016 20:01:49 +0900
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
	(g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by yt-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B96DAC00ED
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 20:01:48 +0900 (JST)
Received: from g01jpexchkw36.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	53B62BD6813 for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 20:01:47 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchkw36.g01.fujitsu.local (10.0.193.54) with Microsoft SMTP
	Server id 14.3.266.1; Mon, 1 Aug 2016 20:01:47 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Aug 2016 20:01:01 +0900
Message-ID: <1470049297-6520-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH v2] Replace foomatic-filters with cups-filters
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
X-List-Received-Date: Mon, 01 Aug 2016 11:01:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The foomatic-filters community is inactive and foomatic-filter package is unmaintained.
(http://www.gossamer-threads.com/lists/gentoo/user/288184)

The foomatic-rips is moved from foomatic-filters to cups-filters and
maintained by cups-filters according to the cups-filter's NEWS.
(http://bzr.linuxfoundation.org/loggerhead/openprinting/cups-filters/annotate/head:/NEWS)

Signed-off-by: Fan Xin <fan.xin at jp.fujitsu.com>
---
 .../cups-filters-1.8.2-disable-ijs.patch           | 65 ++++++++++++++++++++++
 .../foomatic/cups-filters_1.8.3.bb                 | 34 +++++++++++
 .../packagegroups/packagegroup-core-lsb.bb         |  2 +-
 3 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/foomatic/cups-filters/cups-filters-1.8.2-disable-ijs.patch
 create mode 100644 meta/recipes-extended/foomatic/cups-filters_1.8.3.bb

diff --git a/meta/recipes-extended/foomatic/cups-filters/cups-filters-1.8.2-disable-ijs.patch b/meta/recipes-extended/foomatic/cups-filters/cups-filters-1.8.2-disable-ijs.patch
new file mode 100644
index 0000000..0a0a6ad
--- /dev/null
+++ b/meta/recipes-extended/foomatic/cups-filters/cups-filters-1.8.2-disable-ijs.patch
@@ -0,0 +1,65 @@
+=== modified file 'Makefile.am'
+--- Makefile.am	2016-02-10 15:16:33 +0000
++++ Makefile.am	2016-03-02 20:46:26 +0000
+@@ -490,7 +490,6 @@
+ 	bannertopdf \
+ 	commandtoescpx \
+ 	commandtopclx \
+-	pdftoijs \
+ 	sys5ippprinter \
+ 	pdftops \
+ 	pdftoraster \
+@@ -499,6 +498,10 @@
+ 	texttopdf \
+ 	urftopdf \
+ 	rastertopdf
++if ENABLE_IJS
++pkgfilter_PROGRAMS += \
++	pdftoijs
++endif
+ if ENABLE_GHOSTSCRIPT
+ pkgfilter_PROGRAMS += \
+ 	gstoraster
+@@ -846,9 +849,12 @@
+ 	ppd/Fuji_Xerox-DocuPrint_CM305_df-PDF.ppd \
+ 	ppd/Generic-PDF_Printer-PDF.ppd \
+ 	ppd/HP-Color_LaserJet_CM3530_MFP-PDF.ppd \
+-	ppd/HP-PhotoSmart_Pro_B8300-hpijs-pdftoijs.ppd \
+ 	ppd/Ricoh-PDF_Printer-PDF.ppd \
+ 	ppd/textonly.ppd
++if ENABLE_IJS
++ppd_DATA += \
++	ppd/HP-PhotoSmart_Pro_B8300-hpijs-pdftoijs.ppd
++endif
+ if ENABLE_GHOSTSCRIPT
+ ppd_DATA += \
+ 	ppd/pxlcolor.ppd \
+=== modified file 'configure.ac'
+--- configure.ac	2016-02-11 13:59:52 +0000
++++ configure.ac	2016-03-02 21:18:05 +0000
+@@ -443,7 +443,7 @@
+ ])
+ PKG_CHECK_MODULES([FREETYPE], [freetype2], [AC_DEFINE([HAVE_FREETYPE_H], [1], [Have FreeType2 include files])])
+ PKG_CHECK_MODULES([FONTCONFIG], [fontconfig >= 2.0.0])
+-PKG_CHECK_MODULES([IJS], [ijs])
++PKG_CHECK_MODULES([IJS], [ijs], [have_ijs=yes], [have_ijs=no])
+ PKG_CHECK_MODULES([POPPLER], [poppler >= 0.18])
+ PKG_CHECK_MODULES([ZLIB], [zlib])
+ AC_DEFINE([HAVE_LIBZ], [], [Define that we use zlib])
+@@ -489,6 +489,15 @@
+ 	[enable_ghostscript="$enableval"],
+ 	[enable_ghostscript=yes]
+ )
++AC_ARG_ENABLE([ijs],
++	[AS_HELP_STRING([--disable-ijs], [Disable filters using IJS.])],
++	[enable_ijs="$enableval"],
++	[enable_ijs=yes]
++)
++AS_IF([test "x$enable_ijs" = "xyes" -a "x$have_ijs" != "xyes"], [
++       AC_MSG_ERROR([IJS not found, but requested.])
++])
++AM_CONDITIONAL(ENABLE_IJS, test "x$enable_ijs" = "xyes")
+ AC_ARG_WITH([pdftops],
+ 	[AS_HELP_STRING([--with-pdftops=value], [Set which pdftops to use (gs,pdftops,pdftocairo,acroread,hybrid).])],
+ 	[with_pdftops="$withval"],
+
diff --git a/meta/recipes-extended/foomatic/cups-filters_1.8.3.bb b/meta/recipes-extended/foomatic/cups-filters_1.8.3.bb
new file mode 100644
index 0000000..4eef7ef
--- /dev/null
+++ b/meta/recipes-extended/foomatic/cups-filters_1.8.3.bb
@@ -0,0 +1,34 @@
+SUMMARY = "OpenPrinting printer support - filters"
+DESCRIPTION = "CUPS is a standards-based, open source printing system \
+developed by Apple Inc. for Mac OS® X and other UNIX®-like operating systems. \
+CUPS uses the Internet Printing Protocol ("IPP") and provides System V and \
+Berkeley command-line interfaces, a web interface, and a C API to manage printers \
+and print jobs. \
+ \
+This package consists of filters used by the printer spoolers \
+to convert the incoming PostScript data into the printer's native \
+format using a printer-specific, but spooler-independent PPD file. \
+"
+
+DEPENDS += "cups tiff lcms freetype fontconfig poppler qpdf"
+PR = "r0"
+
+LICENSE = "GPLv2 & LGPLv2 & MIT & GPLv2+ & GPLv3"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/cups-filters-${PV}/COPYING;md5=d420e185486344da6176553848350932"
+
+SRC_URI = "http://www.openprinting.org/download/cups-filters/cups-filters-${PV}.tar.gz \
+          "
+
+SRC_URI[md5sum] = "9ecda355e1f4c781784f902737df6321"
+SRC_URI[sha256sum] = "0ad46d15737b309fe648fe39023a4eb6a3528faadbeb97d6ecf523df40950033"
+
+UPSTREAM_CHECK_REGEX = "cups-filters-(?P<pver>((\d|\d\d)\.*)+)\.tar\.gz"
+
+inherit autotools-brokensep pkgconfig
+
+EXTRA_OECONF += "--disable-ijs"
+
+FILES_${PN} += "${datadir}"
+FILES_${PN} += "${libdir}/cups"
+
+RDEPENDS_${PN} += "bash"
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 29564e0..f9d356a 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -143,7 +143,7 @@ RDEPENDS_packagegroup-core-lsb-core = "\
     file \
     findutils \
     fontconfig-utils \
-    foomatic-filters \
+    cups-filters \
     gawk \
     ghostscript \
     grep \
-- 
2.7.4


