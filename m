Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1Qjd8p-00006y-Qw
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 22:13:12 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6KK91Mj020211
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:09:02 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 13:08:59 -0700
Message-Id: <a5afc96a6f9537213d690d2edbc7d084e0e5e638.1311192464.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311192464.git.tom_rini@mentor.com>
References: <cover.1311192464.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311192464.git.tom_rini@mentor.com>
References: <cover.1311192464.git.tom_rini@mentor.com>
Subject: [PATCH 4/5] cpan.bbclass: Perform more mangling for perl path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jul 2011 20:13:12 -0000

On hosts where we may already be past the #! limit this is required
and this is safe on the target as well.  This is be7fe31 in oe.dev.
Related to this we now bump all PRs for recipes that inherit cpan.
Note that in oe.dev we mangle for perl but here we use the new
nativeperl script.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/classes/cpan.bbclass                          |    3 +++
 meta/recipes-devtools/perl/liburi-perl_1.58.bb     |    2 +-
 .../perl/libxml-parser-perl_2.40.bb                |    2 +-
 meta/recipes-devtools/perl/libxml-perl_0.08.bb     |    2 +-
 .../perl/libxml-simple-perl_2.18.bb                |    2 +-
 .../sgmlspl/sgmlspl-native_1.03ii.bb               |    2 +-
 .../perl/libconvert-asn1-perl_0.22.bb              |    2 +-
 .../recipes-extended/perl/libtimedate-perl_1.20.bb |    2 +-
 .../perl/libxml-namespacesupport-perl_1.11.bb      |    2 +-
 meta/recipes-extended/perl/libxml-sax-perl_0.96.bb |    2 +-
 10 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
index cbf428d..cb1c2f4 100644
--- a/meta/classes/cpan.bbclass
+++ b/meta/classes/cpan.bbclass
@@ -35,6 +35,9 @@ cpan_do_compile () {
 
 cpan_do_install () {
 	oe_runmake DESTDIR="${D}" install_vendor
+	for PERLSCRIPT in `grep -rIEl '#!${bindir}/perl-native.*/perl' ${D}`; do
+		sed -i -e 's|^#!${bindir}/perl-native.*/perl|#!/usr/bin/env nativeperl|' $PERLSCRIPT
+	done
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install
diff --git a/meta/recipes-devtools/perl/liburi-perl_1.58.bb b/meta/recipes-devtools/perl/liburi-perl_1.58.bb
index 76a1231..ebb4911 100644
--- a/meta/recipes-devtools/perl/liburi-perl_1.58.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_1.58.bb
@@ -4,7 +4,7 @@ and manipulate the various components that make up these strings."
 
 SECTION = "libs"
 LICENSE = "Artistic | GPLv1+"
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://README;beginline=26;endline=30;md5=6c33ae5c87fd1c4897714e122dd9c23d"
 
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.40.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.40.bb
index 3f1a0ad..1d1593b 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.40.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.40.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=2;endline=6;md5=c8767d7516229f07b26e
 
 DEPENDS += "expat expat-native"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz"
 SRC_URI[md5sum] = "c66e9adba003d0667cc40115ccd837a5"
diff --git a/meta/recipes-devtools/perl/libxml-perl_0.08.bb b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
index 9c74cdb..fb637a8 100644
--- a/meta/recipes-devtools/perl/libxml-perl_0.08.bb
+++ b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
@@ -5,7 +5,7 @@ XML::Grove and others."
 SUMMARY = "Collection of Perl modules for working with XML."
 SECTION = "libs"
 LICENSE = "Artistic | GPLv1+"
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://README;beginline=33;endline=35;md5=1705549eef7577a3d6ba71123a1f0ce8"
 
diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
index 89b65b2..3a50d7f 100644
--- a/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
+++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
@@ -2,7 +2,7 @@ SECTION = "libs"
 LICENSE = "Artistic"
 LIC_FILES_CHKSUM = "file://README;beginline=70;md5=94aa5d46682b411a53a5494cfb22640e"
 DEPENDS += "libxml-parser-perl"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Simple-${PV}.tar.gz"
 
diff --git a/meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb b/meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb
index 4e01f17..28e0e9f 100644
--- a/meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb
+++ b/meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://search.cpan.org/src/DMEGG/SGMLSpm-1.03ii/DOC/HTML/SGMLSpm/sgm
 SECTION = "libs"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.cpan.org/authors/id/D/DM/DMEGG/SGMLSpm-${PV}.tar.gz \
            file://combined.patch"
diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb
index fc77b75..48e107c 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Convert::ASN1 - ASN.1 Encode/Decode library"
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 LIC_FILES_CHKSUM = "file://README;beginline=10;endline=12;md5=a64b291b13ffddeef33b14f047ee8b26"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Convert-ASN1-${PV}.tar.gz"
 
diff --git a/meta/recipes-extended/perl/libtimedate-perl_1.20.bb b/meta/recipes-extended/perl/libtimedate-perl_1.20.bb
index 7298f37..c925980 100644
--- a/meta/recipes-extended/perl/libtimedate-perl_1.20.bb
+++ b/meta/recipes-extended/perl/libtimedate-perl_1.20.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 # You can redistribute it and/or modify it under the same terms as Perl itself.
 LICENSE = "Artistic|GPLv1+"
 LIC_FILES_CHKSUM = "file://README;beginline=21;md5=576b7cb41e5e821501a01ed66f0f9d9e"
-PR = "r2"
+PR = "r3"
 
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/TimeDate-${PV}.tar.gz"
diff --git a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb
index d96430e..f306ff1 100644
--- a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb
+++ b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "XML::NamespaceSupport offers a simple way to process namespace-ba
 
 SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://META.yml;beginline=22;endline=22;md5=3b2b564dae8b9af9e8896e85c07dcbe5"
 
diff --git a/meta/recipes-extended/perl/libxml-sax-perl_0.96.bb b/meta/recipes-extended/perl/libxml-sax-perl_0.96.bb
index 13956cb..97d2025 100644
--- a/meta/recipes-extended/perl/libxml-sax-perl_0.96.bb
+++ b/meta/recipes-extended/perl/libxml-sax-perl_0.96.bb
@@ -11,7 +11,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS += "libxml-namespacesupport-perl-native"
 RDEPENDS_${PN} += "libxml-namespacesupport-perl perl-module-file-temp"
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=65c4cd8f39c24c7135ed70dacbcb09e3"
 
-- 
1.7.0.4



