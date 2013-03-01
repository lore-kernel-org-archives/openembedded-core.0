Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UBMzT-000290-KL
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 11:15:00 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r219wZJv025213
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Mar 2013 01:58:36 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.328.9; Fri, 1 Mar 2013 01:58:35 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Mar 2013 17:58:30 +0800
Message-ID: <60a1b51824615082887b6a92dd85e1bad522a65a.1362131239.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362131239.git.hongxu.jia@windriver.com>
References: <cover.1362131239.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] perl-nativesdk:fix toolchain relocation issues
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
X-List-Received-Date: Fri, 01 Mar 2013 10:15:00 -0000
Content-Type: text/plain

1, Use create_wrapper to create perl wrapper in the SDK.
2, Add perl.real to perl-nativesdk package.

[YOCTO #3338]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.14.3.bb |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.14.3.bb b/meta/recipes-devtools/perl/perl_5.14.3.bb
index 6a3a170..1c3566b 100644
--- a/meta/recipes-devtools/perl/perl_5.14.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r0"
+PR = "r1"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -210,6 +210,11 @@ do_install() {
 
 }
 
+do_install_append_class-nativesdk () {
+        create_wrapper ${D}${bindir}/perl \
+            PERL5LIB='$PERL5LIB:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/${PV}'
+}
+
 PACKAGE_PREPROCESS_FUNCS += "perl_package_preprocess"
 
 perl_package_preprocess () {
@@ -247,6 +252,7 @@ FILES_${PN} = "${bindir}/perl ${bindir}/perl${PV} \
                ${libdir}/perl/${PV}/warnings \
                ${libdir}/perl/${PV}/vars.pm \
               "
+FILES_${PN}_append_class-nativesdk = " ${bindir}/perl.real"
 RPROVIDES_${PN} += "perl-module-strict perl-module-vars perl-module-config perl-module-warnings \
                     perl-module-warnings-register"
 FILES_${PN}-dev = "${libdir}/perl/${PV}/CORE"
-- 
1.7.10.4



