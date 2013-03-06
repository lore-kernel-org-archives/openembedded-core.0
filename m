Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UD6hP-0007h7-6e
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 06:15:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r264x0Fe000490
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Mar 2013 20:59:00 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 5 Mar 2013 20:59:00 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Mar 2013 12:58:46 +0800
Message-ID: <f1bf441360d2a0b01c298872ebaf1441b8fc2bc2.1362545190.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362545190.git.hongxu.jia@windriver.com>
References: <cover.1362545190.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [danny][PATCH 1/2] perl-nativesdk:fix toolchain relocation issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Mar 2013 05:15:36 -0000
Content-Type: text/plain

1, Use create_wrapper to create perl wrapper in the SDK.
2, Add perl.real to perl-nativesdk package.

[YOCTO #3984]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.14.2.bb |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index d3f6ffd..e456f31 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r12"
+PR = "r13"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -214,6 +214,11 @@ do_install() {
 
 }
 
+do_install_append_class-nativesdk () {
+        create_wrapper ${D}${bindir}/perl \
+		            PERL5LIB='$PERL5LIB:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/${PV}'
+}
+
 PACKAGE_PREPROCESS_FUNCS += "perl_package_preprocess"
 
 perl_package_preprocess () {
@@ -245,6 +250,7 @@ perl_package_preprocess () {
 PACKAGES = "perl-dbg perl perl-misc perl-dev perl-pod perl-doc perl-lib \
             perl-module-cpan perl-module-cpanplus perl-module-unicore"
 FILES_${PN} = "${bindir}/perl ${bindir}/perl${PV}"
+FILES_${PN}_append_class-nativesdk = " ${bindir}/perl.real"
 FILES_${PN}-dev = "${libdir}/perl/${PV}/CORE"
 FILES_${PN}-lib = "${libdir}/libperl.so* \
                    ${libdir}/perl5 \
-- 
1.7.10.4



