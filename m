Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RI2r4-0005rb-Qb
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 20:33:07 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Oct 2011 11:27:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="66250194"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.219])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2011 11:27:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2011 11:26:38 -0700
Message-Id: <cover.1319394187.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [CONSOLIDATED PULL 00/27] Various Updates and fixes
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
X-List-Received-Date: Sun, 23 Oct 2011 18:33:07 -0000

Richard,

This pull requests adds some new recipes for supporting building
oe-core with oe-core, also various patches and updates. 

I also included the MACHINE_KERNEL_PR change from Dmitry per my 
reading of the TSC Notes.

Please review and commit

Thanks
	Sau!


The following changes since commit 53f37ed45fe7286eae76fa237ee2b86061b6a021:

  Merge branch 'master-next' of git://git.openembedded.org/openembedded-core into oe-core (2011-10-23 11:15:07 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Cliff Brake (1):
  squashfs-tools: add recipe

Dmitry Eremin-Solenikov (1):
  kernel.bbclass: respect MACHINE_KERNEL_PR

Khem Raj (7):
  tcmode-default.inc: Add TRANSLATED_TARGET_ARCH suffix to
    binutils-cross-canadian
  binutils-cross-canadian: Point sysroot to correct location
  gcc-configure-sdk: Point sysroot to correct location
  xserver-xorg: Add mesa-dri to depends instead of virtual/libgl
  gcc-4.6: Backport fix for PR32219
  coreutils: Upgrade recipe 8.12 -> 8.14
  libtool: Upgrade from 2.4 -> 2.4.2

Martin Jansa (7):
  pulseaudio-0.9.23: inherit perlnative to work around build on host
    without XML/Parser.pm
  apr: add native support
  neon: add native support
  apr-util: add native support
  subversion: add 1.7.0 with native support and negative D_P for now
  subversion-1.6.15: add native support too
  default-providers: switch virtual/libgl from mesa-xlib to mesa-dri

Nitin A Kamble (2):
  tcl: upgrade from 8.5.9 to 8.5.10
  perl: upgrade from 5.12.3 to 5.14.2

Otavio Salvador (4):
  bootimg.bbclass: add support to disable HDD image building
  useradd.bbclass: check if a group already exists manually
  base-passwd: move initial criation of group and passwd to preinst
  dbus: use useradd class to allow use in read-only filesystems

Saul Wold (5):
  wget: Add recipe from OE
  texi2html: Added recipe from OE
  oprofile: Update to 0.9.7 and convert cvs->git
  abiword: convert to svn
  perl: remove debug set -x; pwd

 meta-demoapps/recipes-gnome/abiword/abiword.inc    |    4 +-
 meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb |   10 -
 meta-demoapps/recipes-gnome/abiword/abiword_svn.bb |   10 +
 meta/classes/bootimg.bbclass                       |   44 +-
 meta/classes/kernel.bbclass                        |    5 +
 meta/classes/useradd.bbclass                       |    8 +-
 meta/conf/distro/include/default-providers.inc     |    2 +-
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |   19 +-
 .../remove-usr-local-lib-from-m4.patch             |   18 +-
 .../{coreutils_8.12.bb => coreutils_8.14.bb}       |   11 +-
 meta/recipes-core/dbus/dbus.inc                    |   48 +-
 .../binutils/binutils-cross-canadian.inc           |    2 +-
 .../binutils/binutils-cross-canadian_2.21.1a.bb    |    2 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    3 +-
 meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch    |   71 +
 meta/recipes-devtools/gcc/gcc-configure-sdk.inc    |    4 +-
 .../libtool/{libtool.inc => libtool-2.4.2.inc}     |   26 +-
 meta/recipes-devtools/libtool/libtool-2.4.inc      |   13 -
 ...libtool-cross_2.4.bb => libtool-cross_2.4.2.bb} |    2 +-
 ...btool-native_2.4.bb => libtool-native_2.4.2.bb} |    2 +-
 ...nativesdk_2.4.bb => libtool-nativesdk_2.4.2.bb} |    2 +-
 meta/recipes-devtools/libtool/libtool/prefix.patch |   46 +-
 .../libtool/libtool/resolve-sysroot.patch          |   42 -
 .../libtool/{libtool_2.4.bb => libtool_2.4.2.bb}   |    2 +-
 .../perl/files/Configure-multilib.patch            |   17 -
 .../perl/perl-5.12.3/cross-generate_uudmap.patch   |   15 -
 .../perl/perl-5.12.3/debian/arm_optim.diff         |   34 -
 .../perl/perl-5.12.3/debian/cpan_config_path.diff  |   24 -
 .../perl-5.12.3/debian/deprecate-with-apt.diff     |   61 -
 .../debian/devel-ppport-ia64-optim.diff            |   34 -
 .../perl/perl-5.12.3/debian/extutils_hacks.diff    |  315 -
 .../perl-5.12.3/debian/fixes/autodie-flock.diff    |  100 -
 .../debian/fixes/concat-stack-corruption.diff      |   39 -
 .../debian/fixes/cpanplus-without-home.diff        |   32 -
 .../perl-5.12.3/debian/fixes/h2ph-gcc-4.5.diff     |  108 -
 .../perl-5.12.3/debian/fixes/lc-numeric-docs.diff  |   97 -
 .../debian/fixes/lc-numeric-sprintf.diff           |   31 -
 .../perl/perl-5.12.3/debian/fixes/processPL.diff   |   45 -
 .../perl/perl-5.12.3/debian/patchlevel             |   45 -
 .../perl/perl-5.12.3/debian/series                 |   34 -
 .../perl/perl-5.12.3/parallel_build_fix_1.patch    |   27 -
 .../perl/perl-5.12.3/parallel_build_fix_2.patch    |   24 -
 .../perl/perl-5.12.3/parallel_build_fix_3.patch    | 6585 --------------------
 .../perl/perl-5.12.3/parallel_build_fix_4.patch    |   57 -
 .../perl/perl-5.12.3/parallel_build_fix_5.patch    |  430 --
 .../perl/perl-5.12.3/parallel_build_fix_6.patch    |  158 -
 .../09_fix_installperl.patch                       |    0
 .../Configure-multilib.patch                       |    0
 .../{perl-5.12.3 => perl-5.14.2}/MM_Unix.pm.patch  |    0
 .../{perl-5.12.3 => perl-5.14.2}/Makefile.SH.patch |  122 +-
 .../{perl-5.12.3 => perl-5.14.2}/Makefile.patch    |   17 +-
 .../asm-pageh-fix.patch                            |    0
 .../perl/{perl-5.12.3 => perl-5.14.2}/config.sh    |   65 +-
 .../perl/{perl-5.12.3 => perl-5.14.2}/config.sh-32 |    0
 .../{perl-5.12.3 => perl-5.14.2}/config.sh-32-be   |    0
 .../{perl-5.12.3 => perl-5.14.2}/config.sh-32-le   |    0
 .../perl/{perl-5.12.3 => perl-5.14.2}/config.sh-64 |    0
 .../{perl-5.12.3 => perl-5.14.2}/config.sh-64-be   |    0
 .../{perl-5.12.3 => perl-5.14.2}/config.sh-64-le   |    0
 .../perl/perl-5.14.2/cross-generate_uudmap.patch   |   15 +
 .../debian/arm_thread_stress_timeout.diff          |   13 +-
 .../debian/cpan_definstalldirs.diff                |   18 +-
 .../debian/cpanplus_config_path.diff               |   19 +-
 .../debian/cpanplus_definstalldirs.diff            |   13 +-
 .../debian/db_file_ver.diff                        |   12 +-
 .../perl-5.14.2/debian/deprecate-with-apt.diff     |  406 ++
 .../debian/disable-zlib-bundling.diff              |    7 +-
 .../debian/doc_info.diff                           |   16 +-
 .../debian/enc2xs_inc.diff                         |    9 +-
 .../debian/errno_ver.diff                          |   23 +-
 .../debian/extutils_set_libperl_path.diff          |   23 +
 .../debian/fakeroot.diff                           |   15 +-
 .../perl/perl-5.14.2/debian/find_html2text.diff    |   35 +
 .../debian/fixes/document_makemaker_ccflags.diff   |   31 +
 .../debian/fixes/extutils-cbuilder-cflags.diff     |   86 +
 .../perl-5.14.2/debian/fixes/h2ph-multiarch.diff   |   69 +
 .../debian/fixes/hurd-ccflags.diff                 |   12 +-
 .../perl/perl-5.14.2/debian/fixes/hurd-hints.diff  |   48 +
 .../perl-5.14.2/debian/fixes/index-tainting.diff   |   73 +
 .../debian/fixes/module-build-home-directory.diff  |   37 +
 .../debian/fixes/net_smtp_docs.diff                |   10 +-
 .../perl/perl-5.14.2/debian/fixes/pod_fixes.diff   |  145 +
 .../perl-5.14.2/debian/fixes/respect_umask.diff    |  153 +
 .../fixes/sys-syslog-socket-timeout-kfreebsd.patch |   36 +
 .../debian/instmodsh_doc.diff                      |    9 +-
 .../debian/ld_run_path.diff                        |   15 +-
 .../debian/libnet_config_path.diff                 |   12 +-
 .../perl/perl-5.14.2/debian/libperl_embed_doc.diff |   26 +
 .../debian/m68k_thread_stress.diff                 |   15 +-
 .../debian/mod_paths.diff                          |   15 +-
 .../debian/module_build_man_extensions.diff        |   16 +-
 .../perl-5.14.2/debian/no_packlist_perllocal.diff  |   88 +
 .../perl/perl-5.14.2/debian/patchlevel.diff        |   30 +
 .../debian/perlivp.diff                            |   19 +-
 .../perl/perl-5.14.2/debian/prefix_changes.diff    |  118 +
 .../debian/prune_libs.diff                         |   16 +-
 .../perl/perl-5.14.2/debian/series                 |   40 +
 .../perl-5.14.2/debian/skip-kfreebsd-crash.diff    |   39 +
 .../debian/skip-upstream-git-tests.diff            |   59 +
 .../debian/squelch-locale-warnings.diff            |   14 +-
 .../perl-5.14.2/debian/writable_site_dirs.diff     |   36 +
 .../fix_bad_rpath.patch                            |   13 +-
 .../{perl-5.12.3 => perl-5.14.2}/generate-sh.patch |    0
 .../{perl-5.12.3 => perl-5.14.2}/installperl.patch |    0
 .../letgcc-find-errno.patch                        |    0
 .../native-nopacklist.patch                        |    0
 .../native-perlinc.patch                           |    0
 .../perl-configpm-switch.patch                     |   18 +-
 .../{perl-5.12.3 => perl-5.14.2}/perl-configure.sh |    0
 .../perl-dynloader.patch                           |   21 +-
 .../perl-enable-gdbm.patch                         |    0
 .../perl-moreconfig.patch                          |    0
 ...perl-native_5.12.3.bb => perl-native_5.14.2.bb} |   32 +-
 ...depends_5.12.3.inc => perl-rdepends_5.14.2.inc} |   54 +-
 ...ovides_5.12.3.inc => perl-rprovides_5.14.2.inc} |    0
 .../perl/{perl_5.12.3.bb => perl_5.14.2.bb}        |   47 +-
 .../squashfs-tools/squashfs-tools_4.2.bb           |   40 +
 .../subversion/subversion-1.7.0/libtool2.patch     |   15 +
 .../subversion/subversion_1.6.15.bb                |    2 +
 .../subversion/subversion_1.7.0.bb                 |   37 +
 .../tcltk/tcl/fix_non_native_build_issue.patch     |   16 +-
 .../tcltk/tcl/tcl-add-soname.patch                 |   26 +-
 .../tcltk/{tcl_8.5.9.bb => tcl_8.5.10.bb}          |    6 +-
 meta/recipes-extended/texi2html/texi2html_1.82.bb  |   14 +
 .../wget/wget-1.12/fix_makefile.patch              |   59 +
 .../wget/wget-1.12/gnutls.bzr.patch                |  266 +
 meta/recipes-extended/wget/wget.inc                |   40 +
 meta/recipes-extended/wget/wget_1.12.bb            |   11 +
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    2 +-
 .../oprofile/{oprofile_0.9.6.bb => oprofile.inc}   |   13 +-
 meta/recipes-kernel/oprofile/oprofile_0.9.7.bb     |   11 +
 meta/recipes-kernel/oprofile/oprofile_cvs.bb       |   28 -
 meta/recipes-kernel/oprofile/oprofile_git.bb       |   11 +
 .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
 meta/recipes-support/apr/apr-util_1.3.12.bb        |    8 +
 meta/recipes-support/apr/apr_1.4.5.bb              |    2 +
 meta/recipes-support/neon/neon_0.29.5.bb           |    3 +
 meta/site/common-linux                             |    3 +
 139 files changed, 2724 insertions(+), 8881 deletions(-)
 delete mode 100644 meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb
 create mode 100644 meta-demoapps/recipes-gnome/abiword/abiword_svn.bb
 rename meta/recipes-core/coreutils/{coreutils-8.12 => coreutils-8.14}/remove-usr-local-lib-from-m4.patch (65%)
 rename meta/recipes-core/coreutils/{coreutils_8.12.bb => coreutils_8.14.bb} (90%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch
 rename meta/recipes-devtools/libtool/{libtool.inc => libtool-2.4.2.inc} (57%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool-2.4.inc
 rename meta/recipes-devtools/libtool/{libtool-cross_2.4.bb => libtool-cross_2.4.2.bb} (98%)
 rename meta/recipes-devtools/libtool/{libtool-native_2.4.bb => libtool-native_2.4.2.bb} (96%)
 rename meta/recipes-devtools/libtool/{libtool-nativesdk_2.4.bb => libtool-nativesdk_2.4.2.bb} (97%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch
 rename meta/recipes-devtools/libtool/{libtool_2.4.bb => libtool_2.4.2.bb} (94%)
 delete mode 100644 meta/recipes-devtools/perl/files/Configure-multilib.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/cross-generate_uudmap.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/arm_optim.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/cpan_config_path.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/deprecate-with-apt.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/devel-ppport-ia64-optim.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/extutils_hacks.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/autodie-flock.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/concat-stack-corruption.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/cpanplus-without-home.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/h2ph-gcc-4.5.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/lc-numeric-docs.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/lc-numeric-sprintf.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/processPL.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/patchlevel
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/series
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_1.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_2.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_3.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_4.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_5.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_6.patch
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/09_fix_installperl.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/Configure-multilib.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/MM_Unix.pm.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/Makefile.SH.patch (75%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/Makefile.patch (87%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/asm-pageh-fix.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/config.sh (94%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/config.sh-32 (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/config.sh-32-be (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/config.sh-32-le (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/config.sh-64 (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/config.sh-64-be (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/config.sh-64-le (100%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/cross-generate_uudmap.patch
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/arm_thread_stress_timeout.diff (66%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/cpan_definstalldirs.diff (80%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/cpanplus_config_path.diff (83%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/cpanplus_definstalldirs.diff (84%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/db_file_ver.diff (83%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/deprecate-with-apt.diff
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/disable-zlib-bundling.diff (83%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/doc_info.diff (78%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/enc2xs_inc.diff (90%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/errno_ver.diff (70%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/extutils_set_libperl_path.diff
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/fakeroot.diff (79%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/find_html2text.diff
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/document_makemaker_ccflags.diff
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/extutils-cbuilder-cflags.diff
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/h2ph-multiarch.diff
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/fixes/hurd-ccflags.diff (67%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/hurd-hints.diff
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/index-tainting.diff
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/module-build-home-directory.diff
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/fixes/net_smtp_docs.diff (76%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/pod_fixes.diff
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/respect_umask.diff
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/sys-syslog-socket-timeout-kfreebsd.patch
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/instmodsh_doc.diff (81%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/ld_run_path.diff (68%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/libnet_config_path.diff (85%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/libperl_embed_doc.diff
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/m68k_thread_stress.diff (78%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/mod_paths.diff (89%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/module_build_man_extensions.diff (81%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/no_packlist_perllocal.diff
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/patchlevel.diff
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/perlivp.diff (77%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/prefix_changes.diff
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/prune_libs.diff (81%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/series
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/skip-kfreebsd-crash.diff
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/skip-upstream-git-tests.diff
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/squelch-locale-warnings.diff (86%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/writable_site_dirs.diff
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/fix_bad_rpath.patch (70%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/generate-sh.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/installperl.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/letgcc-find-errno.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/native-nopacklist.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/native-perlinc.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/perl-configpm-switch.patch (76%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/perl-configure.sh (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/perl-dynloader.patch (69%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/perl-enable-gdbm.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/perl-moreconfig.patch (100%)
 rename meta/recipes-devtools/perl/{perl-native_5.12.3.bb => perl-native_5.14.2.bb} (74%)
 rename meta/recipes-devtools/perl/{perl-rdepends_5.12.3.inc => perl-rdepends_5.14.2.inc} (90%)
 rename meta/recipes-devtools/perl/{perl-rprovides_5.12.3.inc => perl-rprovides_5.14.2.inc} (100%)
 rename meta/recipes-devtools/perl/{perl_5.12.3.bb => perl_5.14.2.bb} (92%)
 create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.0/libtool2.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion_1.7.0.bb
 rename meta/recipes-devtools/tcltk/{tcl_8.5.9.bb => tcl_8.5.10.bb} (91%)
 create mode 100644 meta/recipes-extended/texi2html/texi2html_1.82.bb
 create mode 100644 meta/recipes-extended/wget/wget-1.12/fix_makefile.patch
 create mode 100644 meta/recipes-extended/wget/wget-1.12/gnutls.bzr.patch
 create mode 100644 meta/recipes-extended/wget/wget.inc
 create mode 100644 meta/recipes-extended/wget/wget_1.12.bb
 rename meta/recipes-kernel/oprofile/{oprofile_0.9.6.bb => oprofile.inc} (70%)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile_0.9.7.bb
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile_cvs.bb
 create mode 100644 meta/recipes-kernel/oprofile/oprofile_git.bb

-- 
1.7.6.4



