Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 858C075A36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 06:26:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O6QZjK022586
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 23:26:35 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 23 Jun 2015 23:26:35 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jun 2015 23:26:28 -0700
Message-ID: <3ca09f7e9233edc90ee27a0373b4d65b205ba1e3.1435126503.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1435126503.git.liezhi.yang@windriver.com>
References: <cover.1435126503.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] perl: use perl.inc for target and native perl
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
X-List-Received-Date: Wed, 24 Jun 2015 06:26:34 -0000
Content-Type: text/plain

It can reduce the duplicated code.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/perl/perl-native_5.22.0.bb |   12 ++----------
 meta/recipes-devtools/perl/perl.inc              |    8 ++++++++
 meta/recipes-devtools/perl/perl_5.22.0.bb        |   19 +++++--------------
 3 files changed, 15 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/perl.inc

diff --git a/meta/recipes-devtools/perl/perl-native_5.22.0.bb b/meta/recipes-devtools/perl/perl-native_5.22.0.bb
index dbfd82d..488871a 100644
--- a/meta/recipes-devtools/perl/perl-native_5.22.0.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.22.0.bb
@@ -1,12 +1,6 @@
-SUMMARY = "Perl scripting language"
-HOMEPAGE = "http://www.perl.org/"
-SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+require perl.inc
 
-LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
-                    file://Artistic;md5=2e6fd2475335af892494fe1f7327baf3"
-
-SRC_URI = "http://www.cpan.org/src/5.0/${BP}.tar.xz \
+SRC_URI += "\
            file://Configure-multilib.patch \
            file://perl-configpm-switch.patch \
            file://native-nopacklist.patch \
@@ -19,8 +13,6 @@ SRC_URI = "http://www.cpan.org/src/5.0/${BP}.tar.xz \
 SRC_URI[md5sum] = "ff0f09b17de426eff323426cb140ee79"
 SRC_URI[sha256sum] = "be83ead0c5c26cbbe626fa4bac1a4beabe23a9eebc15d35ba49ccde11878e196"
 
-S = "${WORKDIR}/perl-${PV}"
-
 inherit native
 
 NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
diff --git a/meta/recipes-devtools/perl/perl.inc b/meta/recipes-devtools/perl/perl.inc
new file mode 100644
index 0000000..0d9716c
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl.inc
@@ -0,0 +1,8 @@
+SUMMARY = "Perl scripting language"
+HOMEPAGE = "http://www.perl.org/"
+SECTION = "devel"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
+		    file://Artistic;md5=2e6fd2475335af892494fe1f7327baf3"
+
+SRC_URI = "http://www.cpan.org/src/5.0/${BP}.tar.xz"
diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb b/meta/recipes-devtools/perl/perl_5.22.0.bb
index 8022f47..e749078 100644
--- a/meta/recipes-devtools/perl/perl_5.22.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
@@ -1,16 +1,9 @@
-SUMMARY = "Perl scripting language"
-HOMEPAGE = "http://www.perl.org/"
-SECTION = "devel"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
-		    file://Artistic;md5=2e6fd2475335af892494fe1f7327baf3"
+require perl.inc
+
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
 
-SRC_URI = "http://www.cpan.org/src/5.0/${BP}.tar.xz \
-"
-
 # Pick up patches from debian
 # http://ftp.de.debian.org/debian/pool/main/p/perl/perl_5.22.0-1.debian.tar.xz
 SRC_URI += " \
@@ -54,11 +47,9 @@ SRC_URI += " \
         file://native-perlinc.patch \
         file://perl-enable-gdbm.patch \
         file://cross-generate_uudmap.patch \
-	file://fix_bad_rpath.patch \
-	file://perl-archlib-exp.patch \
-	file://dynaloaderhack.patch \
-	\
-        \
+        file://fix_bad_rpath.patch \
+        file://perl-archlib-exp.patch \
+        file://dynaloaderhack.patch \
         file://config.sh \
         file://config.sh-32 \
         file://config.sh-32-le \
-- 
1.7.9.5


