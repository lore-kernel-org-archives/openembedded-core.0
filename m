Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1886B60144
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 07:52:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s617q5AD019306
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Jul 2014 00:52:06 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 1 Jul 2014 00:52:05 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Jul 2014 15:51:52 +0800
Message-ID: <cover.1404200247.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/2] perl, perl-native, perl-ptest: upgrade from 5.14.3 to 5.20.0
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
X-List-Received-Date: Tue, 01 Jul 2014 07:52:07 -0000
Content-Type: text/plain

Test Step:

1. Vim local.conf
...
MACHINE ?= "qemux86" or MACHINE ?= "qemuarm"
...
PTEST_ENABLED = "1" 
IMAGE_INSTALL_append = " perl perl-ptest"
...

2. bitbake core-image-sato && bitbake core-image-minimal

3. On target
cd /usr/lib/perl/ptest
./run-ptest 2>&1 | tee perl.log

4. Test Result
-----------------------------------------------
qemux86 + core-image-sato:
Failed  1 test out of 2285, 99.96% okay.
	../cpan/ExtUtils-Constant/t/Constant.t
Skepped 113 
Ok      2361

-----------------------------------------------
qemux86 + core-image-minimal:
Failed  1 test out of 2285, 99.96% okay.
	../cpan/ExtUtils-Constant/t/Constant.t
Skepped 115 
Ok      2282

-----------------------------------------------
qemuarm + core-image-sato:
Failed 3 tests out of 2284, 99.87% okay.
	../cpan/ExtUtils-Constant/t/Constant.t
	op/threads.t
	re/pat_thr.t
Skepped 114 
Ok      2358

//Hongxu


The following changes since commit 0ed5a13f5f9478e2c22f517fb3504b738422f85c:

  python3: fix builtins imports (2014-06-30 16:36:44 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/upgrade-perl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/upgrade-perl

Hongxu Jia (2):
  perl, perl-native, perl-ptest: upgrade from 5.14.3 to 5.20.0
  libxml-parser-perl: fix do_compile failed with unrecognized option
    '-Wl,-O1'

 .../perl/libxml-parser-perl_2.41.bb                |    2 +-
 .../0001-Fix-misparsing-of-maketext-strings.patch  |   86 --
 ...mature-hsplit-calls-and-only-trigger-REHA.patch |  178 ---
 .../perl/perl-5.14.3/09_fix_installperl.patch      |   21 -
 .../debian/arm_thread_stress_timeout.diff          |   27 -
 .../perl-5.14.3/debian/cpanplus_config_path.diff   |   45 -
 .../debian/cpanplus_definstalldirs.diff            |   56 -
 .../perl-5.14.3/debian/deprecate-with-apt.diff     |  407 ------
 .../perl-5.14.3/debian/disable-zlib-bundling.diff  |   31 -
 .../perl/perl-5.14.3/debian/fakeroot.diff          |   45 -
 .../debian/fixes/extutils-cbuilder-cflags.diff     |   87 --
 .../perl-5.14.3/debian/fixes/h2ph-multiarch.diff   |   70 -
 .../perl-5.14.3/debian/fixes/index-tainting.diff   |   74 --
 .../debian/fixes/module-build-home-directory.diff  |   38 -
 .../perl/perl-5.14.3/debian/fixes/pod_fixes.diff   |  146 ---
 .../fixes/sys-syslog-socket-timeout-kfreebsd.patch |   37 -
 .../perl-5.14.3/debian/m68k_thread_stress.diff     |   47 -
 .../perl/perl-5.14.3/debian/patchlevel.diff        |   31 -
 .../perl/perl-5.14.3/debian/series                 |   40 -
 .../debian/skip-upstream-git-tests.diff            |   60 -
 .../perl/perl-5.14.3/perl-build-in-t-dir.patch     |   42 -
 .../0001-Makefile.SH-fix-do_install-failed.patch   |   47 +
 .../Configure-multilib.patch                       |    0
 .../{perl-5.14.3 => perl-5.20.0}/MM_Unix.pm.patch  |    0
 .../{perl-5.14.3 => perl-5.20.0}/Makefile.SH.patch |  282 ++--
 .../{perl-5.14.3 => perl-5.20.0}/Makefile.patch    |    0
 .../perl/{perl-5.14.3 => perl-5.20.0}/config.sh    |  106 +-
 .../perl/{perl-5.14.3 => perl-5.20.0}/config.sh-32 |    0
 .../{perl-5.14.3 => perl-5.20.0}/config.sh-32-be   |    0
 .../{perl-5.14.3 => perl-5.20.0}/config.sh-32-le   |    0
 .../perl/{perl-5.14.3 => perl-5.20.0}/config.sh-64 |    0
 .../{perl-5.14.3 => perl-5.20.0}/config.sh-64-be   |    0
 .../{perl-5.14.3 => perl-5.20.0}/config.sh-64-le   |    0
 .../cross-generate_uudmap.patch                    |    0
 .../perl-5.20.0/debian/cpan-missing-site-dirs.diff |   62 +
 .../debian/cpan_definstalldirs.diff                |   15 +-
 .../debian/db_file_ver.diff                        |    7 +-
 .../debian/doc_info.diff                           |   20 +-
 .../debian/enc2xs_inc.diff                         |   32 +-
 .../debian/errno_ver.diff                          |   15 +-
 .../debian/extutils_set_libperl_path.diff          |   33 +-
 .../debian/find_html2text.diff                     |   11 +-
 .../debian/fixes/document_makemaker_ccflags.diff   |   11 +-
 .../debian/fixes/memoize_storable_nstore.diff      |  110 ++
 .../debian/fixes/net_smtp_docs.diff                |   11 +-
 .../debian/fixes/respect_umask.diff                |   57 +-
 .../perl-5.20.0/debian/hurd_test_skip_stack.diff   |   32 +
 .../debian/instmodsh_doc.diff                      |    9 +-
 .../debian/ld_run_path.diff                        |   19 +-
 .../debian/libnet_config_path.diff                 |    9 +-
 .../debian/libperl_embed_doc.diff                  |   15 +-
 .../debian/mod_paths.diff                          |   13 +-
 .../debian/module_build_man_extensions.diff        |   25 +-
 .../debian/no_packlist_perllocal.diff              |   44 +-
 .../debian/perl5db-x-terminal-emulator.patch       |   29 +
 .../debian/perlivp.diff                            |   13 +-
 .../debian/prefix_changes.diff                     |   43 +-
 .../debian/prune_libs.diff                         |   19 +-
 .../perl/perl-5.20.0/debian/regen-skip.diff        |   27 +
 .../debian/skip-kfreebsd-crash.diff                |   20 +-
 .../debian/skip-upstream-git-tests.diff            |   28 +
 .../debian/squelch-locale-warnings.diff            |   33 +-
 .../debian/writable_site_dirs.diff                 |   19 +-
 .../dynaloaderhack.patch                           |    0
 .../fix_bad_rpath.patch                            |    0
 .../{perl-5.14.3 => perl-5.20.0}/generate-sh.patch |    0
 .../{perl-5.14.3 => perl-5.20.0}/installperl.patch |    0
 .../letgcc-find-errno.patch                        |    0
 .../native-nopacklist.patch                        |   50 +-
 .../native-perlinc.patch                           |    0
 .../perl-5.14.3-fix-CVE-2010-4777.patch            |    0
 .../perl-archlib-exp.patch                         |    0
 .../perl-configpm-switch.patch                     |    0
 .../{perl-5.14.3 => perl-5.20.0}/perl-configure.sh |    0
 .../perl-dynloader.patch                           |    0
 .../perl-enable-gdbm.patch                         |    0
 .../perl-moreconfig.patch                          |    0
 .../perl/{perl-5.14.3 => perl-5.20.0}/run-ptest    |    0
 .../dist-threads-t-join.t-adjust-ps-option.patch   |   38 +
 ...der-t-DynaLoader.t-fix-calling-dl_findfil.patch |   26 +
 ...perl-native_5.14.3.bb => perl-native_5.20.0.bb} |   32 +-
 meta/recipes-devtools/perl/perl-ptest.inc          |   47 +-
 ...depends_5.14.3.inc => perl-rdepends_5.20.0.inc} | 1354 +++++++++++---------
 ...ovides_5.14.3.inc => perl-rprovides_5.20.0.inc} |    0
 .../perl/{perl_5.14.3.bb => perl_5.20.0.bb}        |   50 +-
 85 files changed, 1690 insertions(+), 2693 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/0001-Fix-misparsing-of-maketext-strings.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/0001-Prevent-premature-hsplit-calls-and-only-trigger-REHA.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/09_fix_installperl.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/arm_thread_stress_timeout.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/cpanplus_config_path.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/cpanplus_definstalldirs.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/deprecate-with-apt.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/disable-zlib-bundling.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/fakeroot.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/extutils-cbuilder-cflags.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/h2ph-multiarch.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/index-tainting.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/module-build-home-directory.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/pod_fixes.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/sys-syslog-socket-timeout-kfreebsd.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/m68k_thread_stress.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/patchlevel.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/series
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/debian/skip-upstream-git-tests.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.3/perl-build-in-t-dir.patch
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/0001-Makefile.SH-fix-do_install-failed.patch
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/Configure-multilib.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/MM_Unix.pm.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/Makefile.SH.patch (43%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/Makefile.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/config.sh (77%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/config.sh-32 (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/config.sh-32-be (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/config.sh-32-le (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/config.sh-64 (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/config.sh-64-be (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/config.sh-64-le (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/cross-generate_uudmap.patch (100%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/debian/cpan-missing-site-dirs.diff
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/cpan_definstalldirs.diff (78%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/db_file_ver.diff (85%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/doc_info.diff (62%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/enc2xs_inc.diff (64%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/errno_ver.diff (62%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/extutils_set_libperl_path.diff (40%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/find_html2text.diff (80%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/fixes/document_makemaker_ccflags.diff (75%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/debian/fixes/memoize_storable_nstore.diff
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/fixes/net_smtp_docs.diff (65%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/fixes/respect_umask.diff (75%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/debian/hurd_test_skip_stack.diff
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/instmodsh_doc.diff (77%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/ld_run_path.diff (54%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/libnet_config_path.diff (84%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/libperl_embed_doc.diff (57%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/mod_paths.diff (87%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/module_build_man_extensions.diff (59%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/no_packlist_perllocal.diff (74%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/debian/perl5db-x-terminal-emulator.patch
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/perlivp.diff (78%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/prefix_changes.diff (75%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/prune_libs.diff (74%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/debian/regen-skip.diff
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/skip-kfreebsd-crash.diff (71%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/debian/skip-upstream-git-tests.diff
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/squelch-locale-warnings.diff (63%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/debian/writable_site_dirs.diff (63%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/dynaloaderhack.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/fix_bad_rpath.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/generate-sh.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/installperl.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/letgcc-find-errno.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/native-nopacklist.patch (68%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/native-perlinc.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/perl-5.14.3-fix-CVE-2010-4777.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/perl-archlib-exp.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/perl-configpm-switch.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/perl-configure.sh (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/perl-dynloader.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/perl-enable-gdbm.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/perl-moreconfig.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.3 => perl-5.20.0}/run-ptest (100%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/test/dist-threads-t-join.t-adjust-ps-option.patch
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findfil.patch
 rename meta/recipes-devtools/perl/{perl-native_5.14.3.bb => perl-native_5.20.0.bb} (71%)
 rename meta/recipes-devtools/perl/{perl-rdepends_5.14.3.inc => perl-rdepends_5.20.0.inc} (84%)
 rename meta/recipes-devtools/perl/{perl-rprovides_5.14.3.inc => perl-rprovides_5.20.0.inc} (100%)
 rename meta/recipes-devtools/perl/{perl_5.14.3.bb => perl_5.20.0.bb} (92%)

-- 
1.8.1.2


