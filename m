Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UF0nK-00015d-GT
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 12:21:35 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2BB4q5S018154
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 04:04:52 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 11 Mar 2013 04:04:52 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Mar 2013 19:04:31 +0800
Message-ID: <32cd9a6d068bae27dc7825d460d261bc2fd2bcaf.1362985569.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362985569.git.hongxu.jia@windriver.com>
References: <cover.1362985569.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/17] perl_5.14.2.bb: fix dependecies
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
X-List-Received-Date: Mon, 11 Mar 2013 11:21:51 -0000
X-List-Received-Date: Mon, 11 Mar 2013 11:21:51 -0000
Content-Type: text/plain

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

But the:RRECOMMENDS_perl-modules = "${@d.getVar('PACKAGES', True)...}"
doesn't work correctly for nativesdk, the
d.getVar('RRECOMMENDS_perl-modules', True)
doesn't get the new value of the PACKAGES, it gets the value of PACKAGES
before the do_split_packages.

Cherry-pick commit 51cbb5ae76a22d465e2f6c5ef923ec2682624e3b

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.14.2.bb |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index d3f6ffd..860080c 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -244,7 +244,13 @@ perl_package_preprocess () {
 
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
@@ -295,7 +301,6 @@ FILES_perl-module-unicore += "${libdir}/perl/${PV}/unicore"
 # packages (actually the non modules packages and not created too)
 ALLOW_EMPTY_perl-modules = "1"
 PACKAGES_append = " perl-modules "
-RRECOMMENDS_perl-modules = "${@d.getVar('PACKAGES', True).replace('${PN}-modules ', '').replace('${PN}-dbg ', '').replace('${PN}-misc ', '').replace('${PN}-dev ', '').replace('${PN}-pod ', '').replace('${PN}-doc ', '')}"
 
 python populate_packages_prepend () {
     libdir = d.expand('${libdir}/perl/${PV}')
@@ -303,6 +308,7 @@ python populate_packages_prepend () {
     do_split_packages(d, libdir, 'auto/([^/]*)/.*', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, 'Module/([^\/]*).*', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, '(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/|auto\/)[^\/]).*)\.(pm|pl|e2x)', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
+    d.setVar("RRECOMMENDS_${PN}-modules", d.getVar('PACKAGES', True).replace('${PN}-modules ', '').replace('${PN}-dbg ', '').replace('${PN}-misc ', '').replace('${PN}-dev ', '').replace('${PN}-pod ', '').replace('${PN}-doc ', ''))
 }
 
 PACKAGES_DYNAMIC = "perl-module-*"
-- 
1.7.10.4



