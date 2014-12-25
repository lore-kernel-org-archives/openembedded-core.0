Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 55B2A7264A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Dec 2014 01:49:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBP1n7mW001778
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 24 Dec 2014 17:49:07 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 24 Dec 2014 17:49:07 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 25 Dec 2014 09:48:57 +0800
Message-ID: <f4864e1f2d036c5ad8639638619c02739c8e40cb.1419471695.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419471695.git.hongxu.jia@windriver.com>
References: <cover.1419471695.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] perl_5.20.0: fix QA package-missing warnings
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
X-List-Received-Date: Thu, 25 Dec 2014 01:49:09 -0000
Content-Type: text/plain

While building perl with QA package-missing checking enabled, there was warning:
...
WARNING: QA Issue: package perl-module-cpanplus not generated, but listed in PACKAGES
WARNING: QA Issue: package perl-module-config not generated, but listed in PACKAGES
WARNING: QA Issue: package perl-module-config-heavy not generated, but listed in PACKAGES
WARNING: QA Issue: package perl-module-strict not generated, but listed in PACKAGES
WARNING: QA Issue: package perl-module-vars not generated, but listed in PACKAGES
WARNING: QA Issue: package perl-module-warnings not generated, but listed in PACKAGES
WARNING: QA Issue: package perl-module-warnings-register not generated, but listed in PACKAGES
...

Drop perl-module-cpanplus, from git://perl5.git.perl.org/perl.git:
...
commit fb598ba5e55920eb59105c932df653f4fea6966c
Author: Chris 'BinGOs' Williams <chris@bingosnet.co.uk>
Date:   Sat May 18 01:01:42 2013 +0100

    Remove cpan/CPANPLUS and associated utilities
...

Drop perl-module-config from PACKAGES_DYNAMIC:
Config.pm was listed in "FILES_${PN}", we should filter it out from
do_split_packages.

Drop perl-module-config-heavy from PACKAGES_DYNAMIC:
Config_heavy.pl was listed in "FILES_${PN}-lib", we should filter it out from
do_split_packages.

Drop perl-module-strict from PACKAGES_DYNAMIC:
strict.pm was listed in "FILES_${PN}", we should filter it out from
do_split_packages.

Drop perl-module-vars from PACKAGES_DYNAMIC:
vars.pm was listed in "FILES_${PN}", we should filter it out from
do_split_packages.

Drop perl-module-warnings from PACKAGES_DYNAMIC:
warnings.pm was listed in "FILES_${PN}", we should filter it out from
do_split_packages.

Drop perl-module-warnings-register from PACKAGES_DYNAMIC:
Dir warnings was listed in "FILES_${PN}", we should filter it out from
do_split_packages.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.20.0.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.20.0.bb b/meta/recipes-devtools/perl/perl_5.20.0.bb
index 3ca0f53..b63cb46 100644
--- a/meta/recipes-devtools/perl/perl_5.20.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.20.0.bb
@@ -272,7 +272,7 @@ perl_package_preprocess () {
 }
 
 PACKAGES = "perl-dbg perl perl-misc perl-dev perl-pod perl-doc perl-lib \
-            perl-module-cpan perl-module-cpanplus perl-module-unicore"
+            perl-module-cpan perl-module-unicore"
 FILES_${PN} = "${bindir}/perl ${bindir}/perl${PV} \
                ${libdir}/perl/${PV}/Config.pm \
                ${libdir}/perl/${PV}/strict.pm \
@@ -326,8 +326,6 @@ FILES_${PN}-doc = "${libdir}/perl/${PV}/*/*.txt \
 
 FILES_perl-module-cpan += "${libdir}/perl/${PV}/CPAN \
                            ${libdir}/perl/${PV}/CPAN.pm"
-FILES_perl-module-cpanplus += "${libdir}/perl/${PV}/CPANPLUS \
-                               ${libdir}/perl/${PV}/CPANPLUS.pm"
 FILES_perl-module-unicore += "${libdir}/perl/${PV}/unicore"
 
 # Create a perl-modules package recommending all the other perl
@@ -340,7 +338,11 @@ python populate_packages_prepend () {
     do_split_packages(d, libdir, 'auto/([^.]*)/[^/]*\.(so|ld|ix|al)', 'perl-module-%s', 'perl module %s', recursive=True, match_path=True, prepend=False)
     do_split_packages(d, libdir, 'Module/([^\/]*)\.pm', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, 'Module/([^\/]*)/.*', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
-    do_split_packages(d, libdir, '(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/|auto\/)[^\/]).*)\.(pm|pl|e2x)', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
+
+    unmatch_dirs = '(CPAN\/|Module\/|unicore\/|auto\/|warnings\/)[^\/]'
+    unmatch_files = 'vars.pm$|Config.pm$|strict.pm$|Config_heavy.pl$|warnings.pm$'
+    file_regex = '(^(?!(%s|%s)).*)\.(pm|pl|e2x)' % (unmatch_dirs, unmatch_files)
+    do_split_packages(d, libdir, file_regex, 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
 
     # perl-modules should recommend every perl module, and only the
     # modules. Don't attempt to use the result of do_split_packages() as some
-- 
1.9.1


