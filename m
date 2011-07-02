Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QczJ9-0006B5-PP
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Jul 2011 14:28:23 +0200
Received: by wwi14 with SMTP id 14so522201wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jul 2011 05:24:38 -0700 (PDT)
Received: by 10.216.60.203 with SMTP id u53mr1925586wec.96.1309609477742;
	Sat, 02 Jul 2011 05:24:37 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ei4sm2978569wbb.60.2011.07.02.05.24.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jul 2011 05:24:37 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Jul 2011 14:24:33 +0200
Message-Id: <1309609473-2411-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH v2] libxml-parser-perl: convert to BBCLASSEXTEND, merge in OE fixes
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
X-List-Received-Date: Sat, 02 Jul 2011 12:28:24 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../perl/libxml-parser-perl-native_2.40.bb         |    7 -------
 .../perl/libxml-parser-perl_2.40.bb                |   15 +++++++++++----
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/libxml-parser-perl-native_2.40.bb

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl-native_2.40.bb b/meta/recipes-devtools/perl/libxml-parser-perl-native_2.40.bb
deleted file mode 100644
index 8c20455..0000000
--- a/meta/recipes-devtools/perl/libxml-parser-perl-native_2.40.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-SECTION = "libs"
-
-require libxml-parser-perl_${PV}.bb
-
-inherit native
-
-DEPENDS += "expat-native"
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.40.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.40.bb
index 3c8f1c9..3f1a0ad 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.40.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.40.bb
@@ -1,12 +1,13 @@
+DESCRIPTION = "XML::Parser - A perl module for parsing XML documents"
 SECTION = "libs"
 LICENSE = "Artistic"
 LIC_FILES_CHKSUM = "file://README;beginline=2;endline=6;md5=c8767d7516229f07b26e42d1cf8b51f1"
+
 DEPENDS += "expat expat-native"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "c66e9adba003d0667cc40115ccd837a5"
 SRC_URI[sha256sum] = "e5e433684e799ef7b6b852c0ca31b71054717628555444d3dc9fceac0df71512"
 
@@ -16,10 +17,16 @@ EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}
 
 inherit cpan
 
-FILES_${PN}-dbg += "${libdir}/perl/vendor_perl/*/auto/XML/Parser/Expat/.debug/"
-
 do_compile() {
 	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
 	cpan_do_compile
 }
 
+do_compile_virtclass-native() {
+	cpan_do_compile
+}
+
+FILES_${PN}-dbg += "${libdir}/perl/vendor_perl/*/auto/XML/Parser/Expat/.debug/"
+
+BBCLASSEXTEND="native"
+
-- 
1.6.6.1



