Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 43DA06AC43
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 09:01:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5491BCm006053
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Jun 2015 02:01:12 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 4 Jun 2015 02:01:12 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Jun 2015 02:01:10 -0700
Message-ID: <b588a78f250592665e0ecf75349313827caea182.1433408433.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433408433.git.liezhi.yang@windriver.com>
References: <cover.1433408433.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rpm: remove extra dev and dbg packages
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
X-List-Received-Date: Thu, 04 Jun 2015 09:01:13 -0000
Content-Type: text/plain

There should be only one dev and dbg package.

[YOCTO #7481]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.14.bb |   14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 03a24f0..75b1ae2 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -34,10 +34,6 @@ DESCRIPTION_perl-modules-rpm = "The perl-modules-rpm package contains a module t
 written in the Perl programming language to use the interface \
 supplied by the RPM Package Manager libraries."
 
-SUMMARY_perl-module-rpm-dev = "Development components for perl bindings"
-DESCRIPTION_perl-modules-rpm-dev = "Development items such as man pages for use with the Perl \
-language bindings."
-
 HOMEPAGE = "http://rpm5.org/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
@@ -211,7 +207,7 @@ CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -DRPM_VENDOR_OE"
 
 LDFLAGS_append_libc-uclibc = "-lrt -lpthread"
 
-PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm-dev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
+PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm perl-module-rpm ${PN}-locale"
 
 SOLIBS = "5.4.so"
 
@@ -248,6 +244,7 @@ FILES_${PN} =  "${bindir}/rpm \
 
 FILES_${PN}-dbg += "${libdir}/rpm/.debug \
 		${libdir}/rpm/bin/.debug \
+		${libdir}/python*/site-packages/rpm/.debug/_* \
 		"
 
 FILES_${PN}-common = "${bindir}/rpm2cpio \
@@ -341,18 +338,12 @@ RDEPENDS_${PN}-build = "file bash perl"
 
 RDEPENDS_python-rpm = "${PN}"
 
-FILES_python-rpm-dbg = "${libdir}/python*/site-packages/rpm/.debug/_*"
-FILES_python-rpm-dev = "${libdir}/python*/site-packages/rpm/*.la"
-FILES_python-rpm-staticdev = "${libdir}/python*/site-packages/rpm/*.a"
 FILES_python-rpm = "${libdir}/python*/site-packages/rpm"
 PROVIDES += "python-rpm"
 
 FILES_perl-module-rpm = "${libdir}/perl/*/* \
 		"
 
-FILES_perl-module-rpm-dev = "${prefix}/share/man/man3/RPM* \
-		"
-
 RDEPENDS_${PN}-dev += "bash"
 
 FILES_${PN}-dev = "${includedir}/rpm \
@@ -381,6 +372,7 @@ FILES_${PN}-staticdev = " \
 		${libdir}/librpmmisc.a \
 		${libdir}/librpmbuild.a \
 		${libdir}/rpm/lib/liblua.a \
+		${libdir}/python*/site-packages/rpm/*.a \
 		"
 
 do_configure() {
-- 
1.7.9.5


