Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE4CA7F7B4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Dec 2019 06:19:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xBL6JbI6013360
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 20 Dec 2019 22:19:37 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Fri, 20 Dec 2019 22:19:36 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>
Date: Sat, 21 Dec 2019 14:19:35 +0800
Message-ID: <1576909175-6910-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] perl/tcl: fix /usr/share/man/man3/Thread.3 conflicts
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
X-List-Received-Date: Sat, 21 Dec 2019 06:19:43 -0000
Content-Type: text/plain

While installing perl-doc and tcl-doc to image, there is a file conflicts
at do_rootfs
...
|file /usr/share/man/man3/Thread.3 conflicts between attempted installs of
perl-doc-5.30.1-r0.core2_64 and tcl-doc-8.6.10-r0.core2_64
...

Use update-alternatives to fix

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.30.1.bb | 6 +++++-
 meta/recipes-devtools/tcltk/tcl_8.6.10.bb | 5 ++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index 9b1f1af..6e0b200 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -32,7 +32,7 @@ SRC_URI[perl-cross.sha256sum] = "edce0b0c2f725e2db3f203d6d8e9f3f7161256f5d159055
 
 S = "${WORKDIR}/perl-${PV}"
 
-inherit upstream-version-is-even
+inherit upstream-version-is-even update-alternatives
 
 DEPENDS += "zlib virtual/crypt"
 
@@ -240,6 +240,10 @@ FILES_${PN}-module-cpan += "${libdir}/perl5/${PV}/CPAN \
                           "
 FILES_${PN}-module-unicore += "${libdir}/perl5/${PV}/unicore"
 
+ALTERNATIVE_PRIORITY = "40"
+ALTERNATIVE_${PN}-doc = "Thread.3"
+ALTERNATIVE_LINK_NAME[Thread.3] = "${mandir}/man3/Thread.3"
+
 # Create a perl-modules package recommending all the other perl
 # packages (actually the non modules packages and not created too)
 ALLOW_EMPTY_${PN}-modules = "1"
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.10.bb b/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
index 284f20e..aedd96b 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
@@ -34,7 +34,7 @@ S = "${WORKDIR}/${BPN}${PV}/unix"
 
 VER = "${PV}"
 
-inherit autotools ptest binconfig
+inherit autotools ptest binconfig update-alternatives
 
 EXTRA_OECONF = "--enable-threads --disable-rpath --libdir=${libdir}"
 
@@ -65,6 +65,9 @@ FILES_tcl-lib = "${libdir}/libtcl8.6.so.*"
 FILES_${PN} += "${libdir}/tcl${VER} ${libdir}/tcl8.6 ${libdir}/tcl8"
 FILES_${PN}-dev += "${libdir}/tclConfig.sh ${libdir}/tclooConfig.sh"
 
+ALTERNATIVE_${PN}-doc = "Thread.3"
+ALTERNATIVE_LINK_NAME[Thread.3] = "${mandir}/man3/Thread.3"
+
 # isn't getting picked up by shlibs code
 RDEPENDS_${PN} += "tcl-lib"
 RDEPENDS_${PN}_class-native = ""
-- 
2.7.4


