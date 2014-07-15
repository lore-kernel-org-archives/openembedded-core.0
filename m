Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D9ED770295
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 12:36:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6FCa8oF011844
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Jul 2014 05:36:08 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 15 Jul 2014 05:36:05 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 20:35:48 +0800
Message-ID: <4443f2befafe9f4511284c8485715457542ee0e8.1405427541.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1405427541.git.hongxu.jia@windriver.com>
References: <cover.1405427541.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 4/8] xmlto: add version 0.0.25
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
X-List-Received-Date: Tue, 15 Jul 2014 12:36:09 -0000
Content-Type: text/plain

It moved from meta-oe and fixed the defect that xmlto/xsltproc
stylesheets cannot be found even when they are installed in
sysroot.

About the config files (catalog.xml), we refered what Ubuntu
13.04 did, so it could correctly search the xsl stylesheets
and xml dtds.

Assigned the environment variable XML_CATALOG_FILES, so the
xmlto will use oe-core's config as priority to avoid the
the search from build system.

[YOCTO #2416]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/xmlto/files/catalog.xml      | 19 +++++++++++
 ....in-drop-the-test-of-xmllint-and-xsltproc.patch | 30 ++++++++++++++++++
 .../xmlto-0.0.25/obsolete_automake_macros.patch    | 12 +++++++
 meta/recipes-devtools/xmlto/xmlto_0.0.25.bb        | 37 ++++++++++++++++++++++
 4 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-devtools/xmlto/files/catalog.xml
 create mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.25/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch
 create mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-devtools/xmlto/xmlto_0.0.25.bb

diff --git a/meta/recipes-devtools/xmlto/files/catalog.xml b/meta/recipes-devtools/xmlto/files/catalog.xml
new file mode 100644
index 0000000..6b8833d
--- /dev/null
+++ b/meta/recipes-devtools/xmlto/files/catalog.xml
@@ -0,0 +1,19 @@
+<?xml version="1.0"?>
+<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN" "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
+<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
+<delegateSystem systemIdStartString="http://docbook.org/xml/" catalog="./docbook-xml.xml"/>
+<delegatePublic publicIdStartString="-//OASIS//ELEMENTS DocBook" catalog="./docbook-xml.xml"/>
+<delegatePublic publicIdStartString="-//OASIS//DTD DocBook XML" catalog="./docbook-xml.xml"/>
+<delegatePublic publicIdStartString="-//OASIS//DTD XML Exchange Table Model 19990315" catalog="./docbook-xml.xml"/>
+<delegatePublic publicIdStartString="-//Norman Walsh//DTD CALS Table Model XML" catalog="./docbook-xml.xml"/>
+<delegatePublic publicIdStartString="-//Norman Walsh//ELEMENTS DocBk XML" catalog="./docbook-xml.xml"/>
+<delegatePublic publicIdStartString="-//Norman Walsh//DTD DocBook XML" catalog="./docbook-xml.xml"/>
+<delegatePublic publicIdStartString="-//OASIS//ENTITIES DocBook" catalog="./docbook-xml.xml"/>
+<delegatePublic publicIdStartString="-//Norman Walsh//ENTITIES DocBk XML" catalog="./docbook-xml.xml"/>
+<delegatePublic publicIdStartString="-//Norman Walsh//DTD DocBk XML" catalog="./docbook-xml.xml"/>
+<delegatePublic publicIdStartString="-//Normal Walsh//Exchange Table Model 19960430" catalog="./docbook-xml.xml"/>
+<delegateSystem systemIdStartString="http://www.oasis-open.org/docbook/xml/" catalog="./docbook-xml.xml"/>
+<delegatePublic publicIdStartString="-//OASIS//DTD DocBook CALS Table Model" catalog="./docbook-xml.xml"/>
+<delegateURI uriStartString="http://docbook.sourceforge.net/release/xsl/" catalog="./docbook-xsl.xml"/>
+<delegateSystem systemIdStartString="http://docbook.sourceforge.net/release/xsl/" catalog="./docbook-xsl.xml"/>
+</catalog>
diff --git a/meta/recipes-devtools/xmlto/xmlto-0.0.25/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch b/meta/recipes-devtools/xmlto/xmlto-0.0.25/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch
new file mode 100644
index 0000000..69ca432
--- /dev/null
+++ b/meta/recipes-devtools/xmlto/xmlto-0.0.25/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch
@@ -0,0 +1,30 @@
+configure.in: drop the test of xmllint and xsltproc
+
+The test is unnecessary, the xmllint and xsltproc were explicitly
+added to RDEPENDS.
+
+Upstream-Status: oe-specific
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+--- a/configure.in
++++ b/configure.in
+@@ -42,10 +42,10 @@ AC_ARG_VAR([LOCALE], [Name and path of the `locale' program.])
+ AC_PATH_PROG([LOCALE], [locale], [locale])
+ 
+ AC_ARG_VAR([XMLLINT], [Name and path of the `xmllint' program.])
+-AC_PATH_PROG([XMLLINT], [xmllint], [xmllint])
++dnl AC_PATH_PROG([XMLLINT], [xmllint], [xmllint])
+ 
+ AC_ARG_VAR([XSLTPROC], [Name and path of the `xsltproc' program.])
+-AC_PATH_PROG([XSLTPROC], [xsltproc], [xsltproc])
++dnl AC_PATH_PROG([XSLTPROC], [xsltproc], [xsltproc])
+ 
+ dnl
+ dnl toolchains
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-devtools/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch b/meta/recipes-devtools/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
new file mode 100644
index 0000000..faa8acc
--- /dev/null
+++ b/meta/recipes-devtools/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
@@ -0,0 +1,12 @@
+diff -Nurd xmlto-0.0.25/configure.in xmlto-0.0.25/configure.in
+--- xmlto-0.0.25/configure.in	2011-12-01 17:49:00.000000000 +0200
++++ xmlto-0.0.25/configure.in	2013-01-07 05:24:16.169953519 +0200
+@@ -1,7 +1,7 @@
+ AC_INIT(xmlto, 0.0.25)
+ AC_CONFIG_SRCDIR(xmlto.spec.in)
+ AM_INIT_AUTOMAKE([dist-bzip2 subdir-objects 1.6])
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS(config.h)
+
+ AC_PROG_CC
+ AM_PROG_CC_C_O
diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.25.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.25.bb
new file mode 100644
index 0000000..2747d6d
--- /dev/null
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.25.bb
@@ -0,0 +1,37 @@
+SUMMARY = "A shell-script tool for converting XML files to various formats"
+HOMEPAGE = "https://fedorahosted.org/xmlto/"
+SECTION = "docs/xmlto"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+SRC_URI = "https://fedorahosted.org/releases/x/m/xmlto/xmlto-${PV}.tar.gz \
+           file://obsolete_automake_macros.patch \
+           file://configure.in-drop-the-test-of-xmllint-and-xsltproc.patch \
+           file://catalog.xml \
+"
+SRC_URI[md5sum] = "a88cd3f08789b4825d1ac89fa065170d"
+SRC_URI[sha256sum] = "c52b56d929e8d20fc19cd3b7ec238f8d039730c56ee311cc352e843147e3e31a"
+
+inherit autotools
+
+# xmlto needs getopt/xmllint/xsltproc at runtime
+RDEPENDS_${PN} = "docbook-xml-dtd4 \
+                  docbook-xsl-stylesheets \
+                  util-linux \
+                  libxml2 \
+"
+RDEPENDS_${PN}_append_class-target = " \
+                  libxslt-bin \
+"
+
+BBCLASSEXTEND = "native"
+
+EXTRA_OECONF_append = " XMLLINT=xmllint XSLTPROC=xsltproc"
+
+do_install_append() {
+    install -d ${D}${sysconfdir}/xml/
+    install -m 755  ${WORKDIR}/catalog.xml ${D}${sysconfdir}/xml/catalog.xml
+    create_wrapper ${D}/${bindir}/xmlto XML_CATALOG_FILES=${sysconfdir}/xml/catalog.xml
+}
+
-- 
1.8.1.2


