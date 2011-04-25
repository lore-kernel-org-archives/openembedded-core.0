Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEFjK-0003pM-9k
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 08:57:11 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Apr 2011 23:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,265,1301900400"; d="scan'208";a="683504286"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by fmsmga002.fm.intel.com with ESMTP; 24 Apr 2011 23:54:35 -0700
Message-Id: <cover.1303714279.git.sgw@linux.intel.com>
Old-Date: Sun, 24 Apr 2011 23:51:19 -0700
Date: Sun, 24 Apr 2011 23:54:35 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 0/3] Consolidated Pull (Fixes Build Issues)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Apr 2011 06:57:11 -0000

From: Saul Wold <sgw@linux.intel.com>

Richard,

We have a GCC 4.6.0 pull here for people to start testing with,
but we also have a couple of fixes to the get the Autobuilder 
working again.  This includes changes to gdb and perl.

GDB failed due to ust and a later ordering issue, while it seems
perl removed an older version of the tarball prompting an uprev.

Thanks
	Sau!


Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: sgw/stage
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Khem Raj (1):
  gcc: Add recipes for 4.6.0

Nitin A Kamble (1):
  perl: upgrade from 5.12.2 to 5.12.3

Saul Wold (1):
  gdb: set --without-ust for EXTRA_OEFLAGS

 meta/recipes-devtools/gcc/gcc-4.6.0.inc            |   82 +
 .../gcc/gcc-4.6.0/100-uclibc-conf.patch            |   37 +
 .../gcc/gcc-4.6.0/103-uclibc-conf-noupstream.patch |   15 +
 .../gcc/gcc-4.6.0/200-uclibc-locale.patch          | 2840 ++++++++++++++++++++
 .../gcc/gcc-4.6.0/203-uclibc-locale-no__x.patch    |  233 ++
 .../gcc-4.6.0/204-uclibc-locale-wchar_fix.patch    |   52 +
 .../gcc/gcc-4.6.0/205-uclibc-locale-update.patch   |  519 ++++
 .../gcc/gcc-4.6.0/301-missing-execinfo_h.patch     |   13 +
 .../gcc/gcc-4.6.0/302-c99-snprintf.patch           |   13 +
 .../gcc/gcc-4.6.0/303-c99-complex-ugly-hack.patch  |   14 +
 .../gcc/gcc-4.6.0/304-index_macro.patch            |   28 +
 .../gcc-4.6.0/305-libmudflap-susv3-legacy.patch    |   49 +
 .../gcc/gcc-4.6.0/306-libstdc++-namespace.patch    |   38 +
 .../gcc/gcc-4.6.0/307-locale_facets.patch          |   19 +
 .../gcc/gcc-4.6.0/602-sdk-libstdc++-includes.patch |   20 +
 .../recipes-devtools/gcc/gcc-4.6.0/64bithack.patch |   33 +
 .../gcc/gcc-4.6.0/740-sh-pr24836.patch             |   29 +
 .../gcc/gcc-4.6.0/800-arm-bigendian.patch          |   34 +
 .../gcc/gcc-4.6.0/904-flatten-switch-stmt-00.patch |   74 +
 .../gcc/gcc-4.6.0/COLLECT_GCC_OPTIONS.patch        |   23 +
 .../GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch       |   33 +
 .../gcc/gcc-4.6.0/arm-bswapsi2.patch               |   13 +
 .../gcc/gcc-4.6.0/arm-nolibfloat.patch             |   24 +
 .../gcc/gcc-4.6.0/arm-softfloat.patch              |   16 +
 .../gcc/gcc-4.6.0/arm-unbreak-eabi-armv4t.dpatch   |   36 +
 .../gcc/gcc-4.6.0/cache-amnesia.patch              |   31 +
 .../gcc-4.6.0/disable_relax_pic_calls_flag.patch   |   46 +
 .../gcc/gcc-4.6.0/fortran-cross-compile-hack.patch |   30 +
 .../gcc/gcc-4.6.0/gcc-4.0.2-e300c2c3.patch         |  319 +++
 .../gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch          |   31 +
 .../gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch      |  114 +
 .../gcc/gcc-4.6.0/gcc-arm-frename-registers.patch  |   25 +
 .../gcc/gcc-4.6.0/gcc-flags-for-build.patch        |  178 ++
 .../gcc/gcc-4.6.0/gcc-ice-hack.dpatch              |  331 +++
 .../gcc/gcc-4.6.0/gcc-poison-dir-extend.patch      |   25 +
 .../gcc/gcc-4.6.0/gcc-poison-parameters.patch      |   74 +
 .../gcc-4.6.0/gcc-poison-system-directories.patch  |  221 ++
 .../gcc-uclibc-locale-ctype_touplow_t.patch        |   70 +
 .../gcc/gcc-4.6.0/libstdc++-pic.dpatch             |   71 +
 .../gcc/gcc-4.6.0/optional_libstdc.patch           |   84 +
 meta/recipes-devtools/gcc/gcc-4.6.0/pr30961.dpatch |  179 ++
 meta/recipes-devtools/gcc/gcc-4.6.0/pr35942.patch  |   38 +
 .../gcc/gcc-4.6.0/zecke-xgcc-cpp.patch             |   28 +
 .../gcc/gcc-cross-initial_4.6.0.bb                 |    2 +
 .../gcc/gcc-cross-intermediate_4.6.0.bb            |    3 +
 meta/recipes-devtools/gcc/gcc-cross_4.6.0.bb       |    8 +
 .../gcc/gcc-crosssdk-initial_4.6.0.bb              |    4 +
 .../gcc/gcc-crosssdk-intermediate_4.6.0.bb         |    4 +
 meta/recipes-devtools/gcc/gcc-runtime_4.6.0.bb     |   10 +
 meta/recipes-devtools/gcc/gcc_4.6.0.bb             |    7 +
 meta/recipes-devtools/gcc/libgcc_4.6.0.bb          |   46 +
 meta/recipes-devtools/gdb/gdb-common.inc           |    4 +-
 .../09_fix_installperl.patch                       |    6 +-
 .../Configure-multilib.patch                       |    6 +-
 .../{perl-5.12.2 => perl-5.12.3}/Makefile.SH.patch |   44 +-
 .../{perl-5.12.2 => perl-5.12.3}/Makefile.patch    |    6 +-
 .../asm-pageh-fix.patch                            |    6 +-
 .../perl/{perl-5.12.2 => perl-5.12.3}/config.sh    |   46 +-
 .../perl/{perl-5.12.2 => perl-5.12.3}/config.sh-32 |    0
 .../{perl-5.12.2 => perl-5.12.3}/config.sh-32-be   |    0
 .../{perl-5.12.2 => perl-5.12.3}/config.sh-32-le   |    0
 .../perl/{perl-5.12.2 => perl-5.12.3}/config.sh-64 |    0
 .../{perl-5.12.2 => perl-5.12.3}/config.sh-64-be   |    0
 .../{perl-5.12.2 => perl-5.12.3}/config.sh-64-le   |    0
 .../cross-generate_uudmap.patch                    |    0
 .../debian/arm_optim.diff                          |    2 +-
 .../debian/arm_thread_stress_timeout.diff          |    2 +-
 .../debian/cpan_config_path.diff                   |    2 +-
 .../debian/cpan_definstalldirs.diff                |    2 +-
 .../debian/cpanplus_config_path.diff               |    2 +-
 .../debian/cpanplus_definstalldirs.diff            |    2 +-
 .../debian/db_file_ver.diff                        |    2 +-
 .../debian/deprecate-with-apt.diff                 |    2 +-
 .../debian/devel-ppport-ia64-optim.diff            |    2 +-
 .../debian/disable-zlib-bundling.diff              |    2 +-
 .../debian/doc_info.diff                           |    6 +-
 .../debian/enc2xs_inc.diff                         |    9 +-
 .../debian/errno_ver.diff                          |    2 +-
 .../debian/extutils_hacks.diff                     |    2 +-
 .../debian/fakeroot.diff                           |    4 +-
 .../debian/fixes/autodie-flock.diff                |    2 +-
 .../debian/fixes/concat-stack-corruption.diff      |    4 +-
 .../debian/fixes/cpanplus-without-home.diff        |    2 +-
 .../debian/fixes/h2ph-gcc-4.5.diff                 |    2 +-
 .../debian/fixes/hurd-ccflags.diff                 |    2 +-
 .../debian/fixes/lc-numeric-docs.diff              |    2 +-
 .../debian/fixes/lc-numeric-sprintf.diff           |    2 +-
 .../debian/fixes/net_smtp_docs.diff                |    2 +-
 .../debian/fixes/processPL.diff                    |    2 +-
 .../debian/instmodsh_doc.diff                      |    2 +-
 .../debian/ld_run_path.diff                        |    2 +-
 .../debian/libnet_config_path.diff                 |    2 +-
 .../debian/m68k_thread_stress.diff                 |    2 +-
 .../debian/mod_paths.diff                          |    2 +-
 .../debian/module_build_man_extensions.diff        |    2 +-
 .../perl/perl-5.12.3/debian/patchlevel             |   45 +
 .../debian/perlivp.diff                            |    2 +-
 .../debian/prune_libs.diff                         |    2 +-
 .../perl/perl-5.12.3/debian/series                 |   34 +
 .../debian/squelch-locale-warnings.diff            |    2 +-
 .../{perl-5.12.2 => perl-5.12.3}/generate-sh.patch |    0
 .../{perl-5.12.2 => perl-5.12.3}/installperl.patch |    6 +-
 .../letgcc-find-errno.patch                        |    6 +-
 .../native-nopacklist.patch                        |    6 +-
 .../native-perlinc.patch                           |    4 +-
 .../{perl-5.12.2 => perl-5.12.3}/native-ssp.patch  |    0
 .../parallel_build_fix_1.patch                     |    0
 .../parallel_build_fix_2.patch                     |    0
 .../parallel_build_fix_3.patch                     |    0
 .../parallel_build_fix_4.patch                     |    0
 .../parallel_build_fix_5.patch                     |   52 +-
 .../parallel_build_fix_6.patch                     |   36 +-
 .../perl-configpm-switch.patch                     |    0
 .../{perl-5.12.2 => perl-5.12.3}/perl-configure.sh |    2 +-
 .../perl-dynloader.patch                           |    4 +-
 .../perl-enable-gdbm.patch                         |    0
 .../perl-moreconfig.patch                          |    0
 ...perl-native_5.12.2.bb => perl-native_5.12.3.bb} |    8 +-
 ...depends_5.12.2.inc => perl-rdepends_5.12.3.inc} |    0
 ...ovides_5.12.2.inc => perl-rprovides_5.12.3.inc} |    0
 .../perl/{perl_5.12.2.bb => perl_5.12.3.bb}        |   79 +-
 121 files changed, 6549 insertions(+), 198 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0.inc
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/100-uclibc-conf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/103-uclibc-conf-noupstream.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/200-uclibc-locale.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/203-uclibc-locale-no__x.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/204-uclibc-locale-wchar_fix.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/205-uclibc-locale-update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/301-missing-execinfo_h.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/302-c99-snprintf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/303-c99-complex-ugly-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/304-index_macro.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/305-libmudflap-susv3-legacy.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/306-libstdc++-namespace.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/307-locale_facets.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/602-sdk-libstdc++-includes.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/64bithack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/740-sh-pr24836.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/800-arm-bigendian.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/904-flatten-switch-stmt-00.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/COLLECT_GCC_OPTIONS.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/arm-bswapsi2.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/arm-nolibfloat.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/arm-softfloat.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/arm-unbreak-eabi-armv4t.dpatch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/cache-amnesia.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/disable_relax_pic_calls_flag.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/fortran-cross-compile-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.0.2-e300c2c3.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-arm-frename-registers.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-flags-for-build.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-ice-hack.dpatch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-dir-extend.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-parameters.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-system-directories.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-uclibc-locale-ctype_touplow_t.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/libstdc++-pic.dpatch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/optional_libstdc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/pr30961.dpatch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/pr35942.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/zecke-xgcc-cpp.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-intermediate_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-runtime_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/libgcc_4.6.0.bb
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/09_fix_installperl.patch (87%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/Configure-multilib.patch (89%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/Makefile.SH.patch (89%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/Makefile.patch (95%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/asm-pageh-fix.patch (77%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/config.sh (95%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/config.sh-32 (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/config.sh-32-be (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/config.sh-32-le (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/config.sh-64 (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/config.sh-64-be (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/config.sh-64-le (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/cross-generate_uudmap.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/arm_optim.diff (92%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/arm_thread_stress_timeout.diff (90%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/cpan_config_path.diff (92%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/cpan_definstalldirs.diff (95%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/cpanplus_config_path.diff (96%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/cpanplus_definstalldirs.diff (95%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/db_file_ver.diff (95%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/deprecate-with-apt.diff (97%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/devel-ppport-ia64-optim.diff (93%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/disable-zlib-bundling.diff (92%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/doc_info.diff (88%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/enc2xs_inc.diff (82%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/errno_ver.diff (94%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/extutils_hacks.diff (99%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/fakeroot.diff (93%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/fixes/autodie-flock.diff (98%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/fixes/concat-stack-corruption.diff (91%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/fixes/cpanplus-without-home.diff (94%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/fixes/h2ph-gcc-4.5.diff (98%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/fixes/hurd-ccflags.diff (92%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/fixes/lc-numeric-docs.diff (98%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/fixes/lc-numeric-sprintf.diff (93%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/fixes/net_smtp_docs.diff (91%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/fixes/processPL.diff (95%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/instmodsh_doc.diff (93%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/ld_run_path.diff (93%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/libnet_config_path.diff (95%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/m68k_thread_stress.diff (95%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/mod_paths.diff (97%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/module_build_man_extensions.diff (96%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/patchlevel
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/perlivp.diff (96%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/prune_libs.diff (96%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/series
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/squelch-locale-warnings.diff (96%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/generate-sh.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/installperl.patch (81%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/letgcc-find-errno.patch (92%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/native-nopacklist.patch (94%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/native-perlinc.patch (88%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/native-ssp.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/parallel_build_fix_1.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/parallel_build_fix_2.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/parallel_build_fix_3.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/parallel_build_fix_4.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/parallel_build_fix_5.patch (95%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/parallel_build_fix_6.patch (89%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/perl-configpm-switch.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/perl-configure.sh (95%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/perl-dynloader.patch (90%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/perl-enable-gdbm.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/perl-moreconfig.patch (100%)
 rename meta/recipes-devtools/perl/{perl-native_5.12.2.bb => perl-native_5.12.3.bb} (94%)
 rename meta/recipes-devtools/perl/{perl-rdepends_5.12.2.inc => perl-rdepends_5.12.3.inc} (100%)
 rename meta/recipes-devtools/perl/{perl-rprovides_5.12.2.inc => perl-rprovides_5.12.3.inc} (100%)
 rename meta/recipes-devtools/perl/{perl_5.12.2.bb => perl_5.12.3.bb} (85%)



