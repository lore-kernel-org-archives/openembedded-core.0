Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4129D75A20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 06:26:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O6QXlL004237
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 23:26:33 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 23 Jun 2015 23:26:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jun 2015 23:26:25 -0700
Message-ID: <cover.1435126503.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/8] perl 5.20.0 -> 5.22.0 and fix test cases
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
X-List-Received-Date: Wed, 24 Jun 2015 06:26:33 -0000
Content-Type: text/plain

* Upgrade perl 5.20.0 -> 5.22.0
* Tested on qemux86, qemuarm, qemuarm64, qemuppc, qemumips, qemux86-64.
* Fix for test cases, the test result:
  Failed 9 tests out of 2269, 99.60% okay.                                        

* Failed cases:
  ../cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t                             
  ../cpan/ExtUtils-MakeMaker/t/PL_FILES.t                                 
  ../cpan/ExtUtils-MakeMaker/t/basic.t                             
  ../cpan/ExtUtils-MakeMaker/t/min_perl_version.t       
  ../cpan/ExtUtils-MakeMaker/t/pm_to_blib.t                               
  ../cpan/ExtUtils-MakeMaker/t/recurs.t                                   
  ../cpan/ExtUtils-MakeMaker/t/several_authors.t                          
  ../lib/warnings.t                                                       
  porting/customized.t

 - For the ExtUtils-MakeMaker, it is because we don't install Makefiles
   on the target.
 - For lib/warnings.t:
my $utf8_locale = find_utf8_ctype_locale();
unless ($utf8_locale) {
    print("SKIPPED\n# No UTF-8 locale available\n"),exit;
}
use warnings 'locale';
use locale;
setlocale(&POSIX::LC_CTYPE, "C");
 "abc def" =~ /\b{wb}.*?/;
 "abc def" =~ /\B{wb}.*?/;
setlocale(&POSIX::LC_CTYPE, $utf8_locale);
 "abc def" =~ /\b{wb}.*?/;
 "abc def" =~ /\B{wb}.*?/;
EXPECTED:
Use of \b{} or \B{} for non-UTF-8 locale is wrong.  Assuming a UTF-8 locale at - line 16.
Use of \b{} or \B{} for non-UTF-8 locale is wrong.  Assuming a UTF-8 locale at - line 16.
Use of \b{} or \B{} for non-UTF-8 locale is wrong.  Assuming a UTF-8 locale at - line 17.
Use of \b{} or \B{} for non-UTF-8 locale is wrong.  Assuming a UTF-8 locale at - line 17.
GOT:
Use of \b{} or \B{} for non-UTF-8 locale is wrong.  Assuming a UTF-8 locale at - line 16, <DATA> line 47.
Use of \b{} or \B{} for non-UTF-8 locale is wrong.  Assuming a UTF-8 locale at - line 16, <DATA> line 47.
Use of \b{} or \B{} for non-UTF-8 locale is wrong.  Assuming a UTF-8 locale at - line 17, <DATA> line 47.
Use of \b{} or \B{} for non-UTF-8 locale is wrong.  Assuming a UTF-8 locale at - line 17, <DATA> line 47.
# Failed test 698 - \b{} in UTF-8 locale at lib/warnings/regexec line 189

I don't know how to fix them.

  -  For porting/customized.t
# Failed test 3 - SHA for cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm matches stashed SHA at porting/customized.t line 107
#      got "f50abf77f42f67008eedcf3cc78d886f445b0a66"
# expected "8168e18f0e3ce3ece4bb7e7c72d57ec07c67c402"
# Failed test 4 - SHA for cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm matches stashed SHA at porting/customized.t line 107
#      got "3d7abd674b15ed323f743594ef0bd09db76b1aee"
# expected "7115e97a53559cb3ec061dd6f7f344e522724c4a"
# Failed test 16 - SHA for cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm matches stashed SHA at porting/customized.t line 107
#      got "21bde53290bf1a4da4457290b65bd1b0ca6f1d16"
# expected "6f90d94ad3e7aa0045a3b1a10a1bb18391f89f57"
# Failed test 25 - SHA for cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm matches stashed SHA at porting/customized.t line 107
#      got "860d520234d7c9036d91f0b143a1dddf2a5e8cb7"
# expected "8cef99a9bd370ecfd07ddb0efbdcbb4101255e45"

It is because we have updated the files when in PACKAGE_PREPROCESS_FUNCS,
so the shasum changes, I think that we don't have to fix them.

// Robert

The following changes since commit a9eededcb33b2ee41a061298610126436dfc2c11:

  ptest: add recommends to ptest-runner (2015-04-27 15:26:15 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/perl
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/perl

Robert Yang (8):
  perl: 5.20.0 -> 5.22.0
  cpan_build.bbclass: remove libmodule-build-perl
  perl: use perl.inc for target and native perl
  perl: fix test case switches.t
  perl: fix for ODBM_File.so
  perl: odbm.t: fix the path of dbmt_common.pl
  perl: remove default byteorder from config.sh
  perl-ptest: fix RDEPENDS

 meta/classes/cpan_build.bbclass                    |   16 -
 .../0001-Makefile.SH-fix-do_install-failed.patch   |   47 ---
 .../perl-5.20.0/debian/hurd_test_skip_stack.diff   |   32 --
 .../debian/module_build_man_extensions.diff        |   35 --
 .../perl-5.20.0/debian/no_packlist_perllocal.diff  |   93 ------
 .../perl/perl-5.20.0/fix-FF_MORE-crash.patch       |   21 --
 .../perl/perl-5.20.0/native-nopacklist.patch       |   94 ------
 .../perl-5.14.3-fix-CVE-2010-4777.patch            |   45 ---
 ...perl-native_5.20.0.bb => perl-native_5.22.0.bb} |   21 +-
 meta/recipes-devtools/perl/perl-ptest.inc          |    3 +-
 ...depends_5.20.0.inc => perl-rdepends_5.22.0.inc} |  266 +++++++--------
 meta/recipes-devtools/perl/perl-rprovides.inc      |   49 ---
 .../perl/perl-rprovides_5.20.0.inc                 |    1 -
 meta/recipes-devtools/perl/perl.inc                |    8 +
 .../{perl-5.20.0 => perl}/Configure-multilib.patch |    0
 .../perl/{perl-5.20.0 => perl}/MM_Unix.pm.patch    |    0
 .../perl/{perl-5.20.0 => perl}/Makefile.SH.patch   |  142 ++++----
 .../perl/{perl-5.20.0 => perl}/Makefile.patch      |    0
 .../perl/{perl-5.20.0 => perl}/config.sh           |  338 +++++++++++++-------
 .../perl/{perl-5.20.0 => perl}/config.sh-32        |    0
 .../perl/{perl-5.20.0 => perl}/config.sh-32-be     |    0
 .../perl/{perl-5.20.0 => perl}/config.sh-32-le     |    0
 .../perl/{perl-5.20.0 => perl}/config.sh-64        |    0
 .../perl/{perl-5.20.0 => perl}/config.sh-64-be     |    0
 .../perl/{perl-5.20.0 => perl}/config.sh-64-le     |    0
 .../cross-generate_uudmap.patch                    |    0
 .../debian/cpan-missing-site-dirs.diff             |    6 +-
 .../debian/cpan_definstalldirs.diff                |    8 +-
 .../{perl-5.20.0 => perl}/debian/db_file_ver.diff  |    2 +-
 .../perl/perl/debian/deprecate-with-apt.diff       |   56 ++++
 .../{perl-5.20.0 => perl}/debian/doc_info.diff     |    6 +-
 .../{perl-5.20.0 => perl}/debian/enc2xs_inc.diff   |   14 +-
 .../{perl-5.20.0 => perl}/debian/errno_ver.diff    |    6 +-
 .../debian/extutils_set_libperl_path.diff          |    8 +-
 .../perl/perl/debian/fakeroot.diff                 |   42 +++
 .../debian/find_html2text.diff                     |    6 +-
 .../debian/fixes/document_makemaker_ccflags.diff   |    6 +-
 .../debian/fixes/memoize_storable_nstore.diff      |    2 +-
 .../debian/fixes/net_smtp_docs.diff                |   14 +-
 .../perl/perl/debian/fixes/perl-Cnn.diff           |   73 +++++
 .../debian/fixes/pod_man_reproducible_date.diff    |  170 ++++++++++
 .../perl/perl/debian/fixes/podman-empty-date.diff  |   51 +++
 .../perl/perl/debian/fixes/podman-pipe.diff        |  109 +++++++
 .../perl/perl/debian/fixes/podman-utc-docs.diff    |   86 +++++
 .../perl/perl/debian/fixes/podman-utc.diff         |   33 ++
 .../debian/fixes/respect_umask.diff                |  156 ++++-----
 .../debian/instmodsh_doc.diff                      |    2 +-
 .../{perl-5.20.0 => perl}/debian/ld_run_path.diff  |    6 +-
 .../debian/libnet_config_path.diff                 |   18 +-
 .../debian/libperl_embed_doc.diff                  |    2 +-
 .../perl/perl/debian/locale-robustness.diff        |   52 +++
 .../perl/perl/debian/makemaker-pasthru.diff        |   30 ++
 .../perl/perl/debian/makemaker_customized.diff     |   42 +++
 .../{perl-5.20.0 => perl}/debian/mod_paths.diff    |    8 +-
 .../perl/perl/debian/no_packlist_perllocal.diff    |   92 ++++++
 .../perl/perl/debian/patchlevel.diff               |   30 ++
 .../debian/perl5db-x-terminal-emulator.patch       |    6 +-
 .../perl/{perl-5.20.0 => perl}/debian/perlivp.diff |    2 +-
 .../perl/perl/debian/pod2man-customized.diff       |   23 ++
 .../debian/prefix_changes.diff                     |   22 +-
 .../{perl-5.20.0 => perl}/debian/prune_libs.diff   |   12 +-
 .../{perl-5.20.0 => perl}/debian/regen-skip.diff   |    2 +-
 .../debian/skip-kfreebsd-crash.diff                |    4 +-
 .../debian/skip-upstream-git-tests.diff            |    6 +-
 .../debian/squelch-locale-warnings.diff            |   35 +-
 .../debian/writable_site_dirs.diff                 |   18 +-
 .../{perl-5.20.0 => perl}/dynaloaderhack.patch     |    0
 ...M_File-hints-linux.pl-link-libgdbm_compat.patch |   35 ++
 ...le-t-odbm.t-fix-the-path-of-dbmt_common.p.patch |   31 ++
 .../perl/{perl-5.20.0 => perl}/fix_bad_rpath.patch |    0
 .../perl/{perl-5.20.0 => perl}/generate-sh.patch   |    0
 .../perl/{perl-5.20.0 => perl}/installperl.patch   |    0
 .../{perl-5.20.0 => perl}/letgcc-find-errno.patch  |    0
 ...-fix-regenerate-makefile-failed-while-cc-.patch |    0
 .../perl/perl/native-nopacklist.patch              |   91 ++++++
 .../{perl-5.20.0 => perl}/native-perlinc.patch     |    0
 .../{perl-5.20.0 => perl}/perl-archlib-exp.patch   |    0
 .../perl-configpm-switch.patch                     |    0
 .../perl/{perl-5.20.0 => perl}/perl-configure.sh   |    0
 .../{perl-5.20.0 => perl}/perl-dynloader.patch     |    0
 .../{perl-5.20.0 => perl}/perl-enable-gdbm.patch   |    0
 .../{perl-5.20.0 => perl}/perl-moreconfig.patch    |    0
 .../perl/{perl-5.20.0 => perl}/run-ptest           |    0
 .../perl/perl/t-run-switches.t-perl5-perl.patch    |   30 ++
 .../dist-threads-t-join.t-adjust-ps-option.patch   |    0
 ...der-t-DynaLoader.t-fix-calling-dl_findfil.patch |    0
 .../perl/{perl_5.20.0.bb => perl_5.22.0.bb}        |   39 +--
 87 files changed, 1709 insertions(+), 994 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/perl-5.20.0/0001-Makefile.SH-fix-do_install-failed.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.20.0/debian/hurd_test_skip_stack.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.20.0/debian/module_build_man_extensions.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.20.0/debian/no_packlist_perllocal.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.20.0/fix-FF_MORE-crash.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.20.0/native-nopacklist.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.20.0/perl-5.14.3-fix-CVE-2010-4777.patch
 rename meta/recipes-devtools/perl/{perl-native_5.20.0.bb => perl-native_5.22.0.bb} (85%)
 rename meta/recipes-devtools/perl/{perl-rdepends_5.20.0.inc => perl-rdepends_5.22.0.inc} (94%)
 delete mode 100644 meta/recipes-devtools/perl/perl-rprovides.inc
 delete mode 100644 meta/recipes-devtools/perl/perl-rprovides_5.20.0.inc
 create mode 100644 meta/recipes-devtools/perl/perl.inc
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/Configure-multilib.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/MM_Unix.pm.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/Makefile.SH.patch (77%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/Makefile.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/config.sh (68%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/config.sh-32 (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/config.sh-32-be (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/config.sh-32-le (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/config.sh-64 (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/config.sh-64-be (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/config.sh-64-le (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/cross-generate_uudmap.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/cpan-missing-site-dirs.diff (93%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/cpan_definstalldirs.diff (89%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/db_file_ver.diff (94%)
 create mode 100644 meta/recipes-devtools/perl/perl/debian/deprecate-with-apt.diff
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/doc_info.diff (85%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/enc2xs_inc.diff (87%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/errno_ver.diff (87%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/extutils_set_libperl_path.diff (87%)
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fakeroot.diff
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/find_html2text.diff (89%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/fixes/document_makemaker_ccflags.diff (87%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/fixes/memoize_storable_nstore.diff (98%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/fixes/net_smtp_docs.diff (58%)
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/perl-Cnn.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/pod_man_reproducible_date.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-empty-date.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-pipe.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-utc-docs.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-utc.diff
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/fixes/respect_umask.diff (64%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/instmodsh_doc.diff (93%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/ld_run_path.diff (84%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/libnet_config_path.diff (74%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/libperl_embed_doc.diff (92%)
 create mode 100644 meta/recipes-devtools/perl/perl/debian/locale-robustness.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/makemaker-pasthru.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/makemaker_customized.diff
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/mod_paths.diff (93%)
 create mode 100644 meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/patchlevel.diff
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/perl5db-x-terminal-emulator.patch (87%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/perlivp.diff (95%)
 create mode 100644 meta/recipes-devtools/perl/perl/debian/pod2man-customized.diff
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/prefix_changes.diff (89%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/prune_libs.diff (78%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/regen-skip.diff (93%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/skip-kfreebsd-crash.diff (91%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/skip-upstream-git-tests.diff (80%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/squelch-locale-warnings.diff (59%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/debian/writable_site_dirs.diff (61%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/dynaloaderhack.patch (100%)
 create mode 100644 meta/recipes-devtools/perl/perl/ext-ODBM_File-hints-linux.pl-link-libgdbm_compat.patch
 create mode 100644 meta/recipes-devtools/perl/perl/ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/fix_bad_rpath.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/generate-sh.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/installperl.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/letgcc-find-errno.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/make_ext.pl-fix-regenerate-makefile-failed-while-cc-.patch (100%)
 create mode 100644 meta/recipes-devtools/perl/perl/native-nopacklist.patch
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/native-perlinc.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/perl-archlib-exp.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/perl-configpm-switch.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/perl-configure.sh (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/perl-dynloader.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/perl-enable-gdbm.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/perl-moreconfig.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/run-ptest (100%)
 create mode 100644 meta/recipes-devtools/perl/perl/t-run-switches.t-perl5-perl.patch
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/test/dist-threads-t-join.t-adjust-ps-option.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.20.0 => perl}/test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findfil.patch (100%)
 rename meta/recipes-devtools/perl/{perl_5.20.0.bb => perl_5.22.0.bb} (94%)

-- 
1.7.9.5


