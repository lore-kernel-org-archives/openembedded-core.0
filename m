Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TPAqy-0002uH-Nq
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 13:35:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9JBLcHX024631
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 19 Oct 2012 04:21:38 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Fri, 19 Oct 2012 04:21:38 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <richard.purdie@intel.com>
Date: Fri, 19 Oct 2012 19:22:04 +0800
Message-ID: <5a4103871afa309dd05109ca6cb91c5f61334665.1350645464.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1350645464.git.kai.kang@windriver.com>
References: <cover.1350645464.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] perl: fix dependecies
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
X-List-Received-Date: Fri, 19 Oct 2012 11:35:01 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

This patch fixes 2 problems.

The first one is that when run "perl -V" on target, it fails with lack
of some .pm files. So add these perl module files to package perl itself
to fix this failure.

The second problem is that package nativesdk-perl-modules doesn't depends
on the single perl modules.

In the .bb file, dependencies of perl-modules are set by:

RRECOMMENDS_perl-modules = "${@d.getVar('PACKAGES', True)...}"

The PACKAGES would be reset by do_split_packages since:

PACKAGES_DYNAMIC = "perl-module-*"
PACKAGES_DYNAMIC_virtclass-nativesdk = "nativesdk-perl-module-*"

Then:
1) The target perl-modules RRECOMMENDS on perl-module-*, this is what
   we expect.

2) But the nativesdk-perl-modules doesn't RRECOMMENDS on
   nativesdk-perl-module-*, this is not what we expect.

The value of PACKAGES after do_split_packages has been set correctly (it
contains the nativesdk-perl-module-* packages)

But the:

RRECOMMENDS_perl-modules = "${@d.getVar('PACKAGES', True)...}"

doesn't work correctly for nativesdk, the

d.getVar('RRECOMMENDS_perl-modules', True)

doesn't get the new value of the PACKAGES, it gets the value of PACKAGES
before the do_split_packages.

This patch will fix the problem.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.14.2.bb |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index d9206d8..d566a79 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r11"
+PR = "r12"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -243,7 +243,13 @@ perl_package_preprocess () {
 
 PACKAGES = "perl-dbg perl perl-misc perl-dev perl-pod perl-doc perl-lib \
             perl-module-cpan perl-module-cpanplus perl-module-unicore"
-FILES_${PN} = "${bindir}/perl ${bindir}/perl${PV}"
+FILES_${PN} = "${bindir}/perl ${bindir}/perl${PV} \
+               ${libdir}/perl/${PV}/Config.pm \
+               ${libdir}/perl/${PV}/strict.pm \
+               ${libdir}/perl/${PV}/warnings.pm \
+               ${libdir}/perl/${PV}/warnings \
+               ${libdir}/perl/${PV}/vars.pm \
+              "
 FILES_${PN}-dev = "${libdir}/perl/${PV}/CORE"
 FILES_${PN}-lib = "${libdir}/libperl.so* \
                    ${libdir}/perl5 \
@@ -294,7 +300,6 @@ FILES_perl-module-unicore += "${libdir}/perl/${PV}/unicore"
 # packages (actually the non modules packages and not created too)
 ALLOW_EMPTY_perl-modules = "1"
 PACKAGES_append = " perl-modules "
-RRECOMMENDS_perl-modules = "${@d.getVar('PACKAGES', True).replace('${PN}-modules ', '').replace('${PN}-dbg ', '').replace('${PN}-misc ', '').replace('${PN}-dev ', '').replace('${PN}-pod ', '').replace('${PN}-doc ', '')}"
 
 python populate_packages_prepend () {
     libdir = d.expand('${libdir}/perl/${PV}')
@@ -302,6 +307,7 @@ python populate_packages_prepend () {
     do_split_packages(d, libdir, 'auto/([^/]*)/.*', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, 'Module/([^\/]*).*', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, '(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/|auto\/)[^\/]).*)\.(pm|pl|e2x)', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
+    d.setVar("RRECOMMENDS_${PN}-modules", d.getVar('PACKAGES', True).replace('${PN}-modules ', '').replace('${PN}-dbg ', '').replace('${PN}-misc ', '').replace('${PN}-dev ', '').replace('${PN}-pod ', '').replace('${PN}-doc ', ''))
 }
 
 PACKAGES_DYNAMIC = "perl-module-*"
-- 
1.7.5.4



