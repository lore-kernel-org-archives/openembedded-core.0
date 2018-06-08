Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 5663275382
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 14:04:26 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w58E4QSv024606
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jun 2018 16:04:26 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w58E4Pkf000480;
	Fri, 8 Jun 2018 16:04:25 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id A17EFC765B;
	Fri,  8 Jun 2018 16:04:25 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jun 2018 16:04:02 +0200
Message-Id: <20180608140403.27855-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <24e47452-9ff5-778c-5146-599589458a3f@linux.intel.com>
References: <24e47452-9ff5-778c-5146-599589458a3f@linux.intel.com>
Subject: [PATCH v3 1/2] openssl-1.1: rework packaging
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
X-List-Received-Date: Fri, 08 Jun 2018 14:04:27 -0000

The main idea is to have libssl and libcrypto in separate packages.
This saves space if only single library is needed and also some recipes
(in other layers) depend on these library packages.
Together with this other packages like in 1.0.x were created.
The only difference is that openssl 1.1 has additional package openssl-bin.

Patch original c_rehash instead of overriding it with our own.
After applying patch from Debian c_rehash is working.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Marko Peter <peter.marko@siemens.com>
---
 ...le.pl-only-quote-stuff-that-actually-need.patch | 29 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.1.0h.bb | 12 ++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/debian/Revert-util-dofile.pl-only-quote-stuff-that-actually-need.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/debian/Revert-util-dofile.pl-only-quote-stuff-that-actually-need.patch b/meta/recipes-connectivity/openssl/openssl/debian/Revert-util-dofile.pl-only-quote-stuff-that-actually-need.patch
new file mode 100644
index 0000000000..25d3093e40
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/debian/Revert-util-dofile.pl-only-quote-stuff-that-actually-need.patch
@@ -0,0 +1,29 @@
+From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+Date: Wed, 28 Mar 2018 14:05:53 +0200
+Subject: Revert "util/dofile.pl: only quote stuff that actually needs
+ quoting"
+
+This reverts commit 77ba00bc. We ended up without the quotes.
+
+BTS: #894282
+Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+---
+ util/dofile.pl | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/util/dofile.pl b/util/dofile.pl
+index fc72989b0fd9..a932941cd5ad 100644
+--- a/util/dofile.pl
++++ b/util/dofile.pl
+@@ -99,9 +99,9 @@ package main;
+ # This adds quotes (") around the given string, and escapes any $, @, \,
+ # " and ' by prepending a \ to them.
+ sub quotify1 {
+-    my $s = my $orig = shift @_;
++    my $s = shift @_;
+     $s =~ s/([\$\@\\"'])/\\$1/g;
+-    $s ne $orig || $s =~ /\s/ ? '"'.$s.'"' : $s;
++    '"'.$s.'"';
+ }
+ 
+ # quotify_l LIST
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index 94b75eb92a..c8e0255b33 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
            file://0001-Take-linking-flags-from-LDFLAGS-env-var.patch \
+           file://debian/Revert-util-dofile.pl-only-quote-stuff-that-actually-need.patch \
            "
 
 S = "${WORKDIR}/openssl-${PV}"
@@ -154,8 +155,13 @@ do_install_ptest() {
 
 RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
 
+PACKAGES =+ "libcrypto libssl ${PN}-misc ${PN}-engines openssl-conf"
+FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
+FILES_libssl = "${libdir}/libssl${SOLIBS}"
 FILES_${PN} =+ " ${libdir}/ssl-1.1/*"
-
-PACKAGES =+ "${PN}-engines"
+FILES_${PN}-misc = "${libdir}/ssl-1.1/misc"
+RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
 FILES_${PN}-engines = "${libdir}/engines-1.1"
-
+FILES_openssl-conf = "${libdir}/ssl-1.1/openssl.cnf"
+CONFFILES_openssl-conf = "${libdir}/ssl-1.1/openssl.cnf"
+RRECOMMENDS_libcrypto += "openssl-conf"
-- 
2.11.0


