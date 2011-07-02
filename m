Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcxIr-0003vb-7g
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Jul 2011 12:19:57 +0200
Received: by wyg30 with SMTP id 30so2969955wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jul 2011 03:16:11 -0700 (PDT)
Received: by 10.216.172.206 with SMTP id t56mr3556008wel.80.1309601770747;
	Sat, 02 Jul 2011 03:16:10 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w62sm1994964wec.18.2011.07.02.03.16.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jul 2011 03:16:09 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Jul 2011 12:16:06 +0200
Message-Id: <1309601766-30560-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] libxml-parser-perl: convert to BBCLASSEXTEND, merge in OE fixes:wq
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
X-List-Received-Date: Sat, 02 Jul 2011 10:19:57 -0000

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



