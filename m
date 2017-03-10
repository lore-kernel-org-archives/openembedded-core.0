Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A4D8177657
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 11:25:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 10 Mar 2017 03:25:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="1106988117"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2017 03:25:25 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 13:23:39 +0200
Message-Id: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 00/44] Replace Smart package manager with DNF package manager
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
X-List-Received-Date: Fri, 10 Mar 2017 11:25:27 -0000

This patchset replaces the outdated, unsupported Smart package manager with
DNF package manager (Fedora's successor to yum). This is not a trivial change
and there are many consequences:

- DNF is API incompatible with rpm5; therefore rpm5 is replaced with rpm4.

- There are various non-default features that aren't yet supported or tested:
such as signing packages and repositories, RPM_PREFER_ELF_ARCH and possibly others

- db 6.x is removed from oe-core; db 5.x is replacing it

- Although I did my very best to test this patchset locally, 
the whole thing may break down in surprising ways. I would appreaciate all the help
you can provide here. The patchset touches many things in many places and has
more than the usual share of side effects.

Please see specific commits for further information and explanations. There is also
a longer email explaining user-visible changes and rationale behind them in
http://lists.openembedded.org/pipermail/openembedded-architecture/2017-February/000419.html
(note that section 6 in that email is no longer valid.

Changes in version 2 of the patchset:

- addressed review comments received for the first version of the pachset;
in particular the controversial pkg_postinst changes are removed (but they'll
be back as a separate change). Please check that I didn't forget anything.

- rpm package signing with gpg is now fixed, and should be working

Changes in version 3 of the patchset:

- a massive amount of fixes for issues that were found by Yocto autobuilder testing.
Particularly multilib support is now working properly. I believe that from the AB
perspective the patchset is ready for merging :)

The following changes since commit d454dc2fc17711d3efe6dbe5aca3c734f0ed158b:

  gcc-runtime: Fix QA issue (2017-03-08 11:52:57 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/dnf-rpm4
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/dnf-rpm4

Alexander Kanavin (44):
  package.bbclass: fix locations of debugedit and rpmdeps utilities
  libsolv: enable rpm support
  rpmresolve: remove the recipe
  createrepo-c: add a recipe
  createrepo: remove the recipe
  rpm: add a 4.x recipe
  rpm: remove 5.x recipe
  python-pygpgme: add a recipe
  python-iniparse: add a recipe
  python-backports-lzma: add a recipe
  librepo: add a recipe
  libcomps: add a recipe
  libdnf: add a recipe
  dnf: add a recipe
  python-smartpm: remove the recipe
  db: remove the 6.x recipe
  package_rpm.bbclass: make architecture-independent .rpm packages
    "noarch" instead of "all"
  package_manager.py: improve the API for insert_feed_uris()
  package_rpm.bbclass: correctly map RRECOMMENDS and RSUGGESTS to rpm
    tags
  nativesdk-packagegroup-sdk-host: replace smartpm with dnf
  rootfs_rpm.bbclass: migrate image creation to dnf
  scripts/rpm2cpio.sh: replace 5.x version with 4.x version
  scripts/oe-setup-rpmrepo: replace createrepo with createrepo_c
  package_rpm.bbclass: replace createrepo reference with createrepo_c
  package_rpm.bbclass: no need to specify the magic file location
  testimage.bbclass: fix runtime test for rpm, port smart tests to dnf
  package_rpm.bbclass: instruct rpm to not remove the buildroot
    directory
  selftest: do not perform a full build in test_continue
  selftest: update output checks in incremental image test to match what
    dnf prints
  byacc: remove the recipe
  gpg_sign.py: fix signing of rpm files using gpg
  oe-selftest: no need to parse gpg output to determine the name of the
    signing key
  run-postinsts: simplify the logic of whether to install it to images
  package_rpm.bbclass: add a /bin/sh Provides for nativesdk- packages
  security_flags.inc: update to reflect smart->dnf transition
  package_rpm.bbclass: do not set the OS dynamically when building rpms
  nspr: do not use shared library symbol resolution with musl
  package_rpm.bbclass: do not strip multilib prefixes from package
    names, do not add multilib prefix to package arch
  package.bbclass: don't exclude package groups from runtime mapping
  glibc: do the multilib_header magic also for bits/long-double.h
  bash: package bashbug separately
  db: do the multilib_header processing for db.h
  base-files: do not write the current date into /etc/issue and
    /etc/issue.net
  gpgme: fix python module build and installation

 .../recipes-test/images/oe-selftest-image.bb       |    2 +-
 .../recipes-test/images/wic-image-minimal.bb       |    2 +-
 meta/classes/image.bbclass                         |    2 +-
 meta/classes/package.bbclass                       |    7 +-
 meta/classes/package_rpm.bbclass                   |   86 +-
 meta/classes/rootfs_deb.bbclass                    |    1 -
 meta/classes/rootfs_ipk.bbclass                    |    1 -
 meta/classes/rootfs_rpm.bbclass                    |   22 +-
 meta/classes/sstate.bbclass                        |    2 +-
 meta/classes/testimage.bbclass                     |   25 +-
 meta/conf/distro/include/default-versions.inc      |    3 -
 meta/conf/distro/include/security_flags.inc        |    5 +-
 meta/lib/oe/gpg_sign.py                            |    7 +-
 meta/lib/oe/manifest.py                            |    2 +-
 meta/lib/oe/package_manager.py                     | 1223 ++++----------------
 meta/lib/oe/rootfs.py                              |   23 +-
 meta/lib/oe/sdk.py                                 |    7 +-
 meta/lib/oeqa/oetest.py                            |    7 -
 meta/lib/oeqa/runtime/cases/dnf.py                 |  111 ++
 meta/lib/oeqa/runtime/cases/parselogs.py           |    1 +
 meta/lib/oeqa/runtime/cases/rpm.py                 |   21 +-
 meta/lib/oeqa/runtime/cases/smart.py               |  196 ----
 meta/lib/oeqa/selftest/bbtests.py                  |    2 +-
 meta/lib/oeqa/selftest/buildoptions.py             |    4 +-
 meta/lib/oeqa/selftest/signing.py                  |   16 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    5 +-
 meta/recipes-core/glibc/glibc-package.inc          |    2 +-
 meta/recipes-core/images/core-image-minimal.bb     |    2 +-
 .../nativesdk-packagegroup-sdk-host.bb             |    2 +-
 ...0001-Correctly-install-the-shared-library.patch |   28 +
 ...-set-PYTHON_INSTALL_DIR-by-running-python.patch |   27 +
 .../createrepo-c/createrepo-c_git.bb               |   31 +
 ...Corretly-install-tmpfiles.d-configuration.patch |   21 +
 ...hardcode-etc-and-systemd-unit-directories.patch |   29 +
 ...0001-Do-not-prepend-installroot-to-logdir.patch |   31 +
 .../dnf/dnf/0028-Use-backports.lzma-not-lzma.patch |   30 +
 ...-set-PYTHON_INSTALL_DIR-by-running-python.patch |   27 +
 .../dnf/0030-Run-python-scripts-using-env.patch    |   48 +
 meta/recipes-devtools/dnf/dnf_git.bb               |   44 +
 meta/recipes-devtools/dpkg/dpkg.inc                |    2 +-
 ...-set-PYTHON_INSTALL_DIR-by-running-python.patch |   41 +
 ...2-Set-library-installation-path-correctly.patch |   27 +
 meta/recipes-devtools/libcomps/libcomps_git.bb     |   23 +
 ...cmake-drop-the-requirement-for-GTKDOC_SCA.patch |   31 +
 ...ers-for-both-libsolv-and-libsolvext-libdn.patch |   28 +
 ...-sysroot-path-to-introspection-tools-path.patch |   36 +
 ...-library-installation-directory-correctly.patch |   29 +
 ...-variables-with-pkg-config-cmake-s-own-mo.patch |   29 +
 meta/recipes-devtools/libdnf/libdnf_git.bb         |   40 +
 ...ly-set-the-library-installation-directory.patch |   28 +
 ...to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch |   41 +
 ...-race-when-deleting-temporary-directories.patch |   41 +
 ...ariables-with-pkg-config-not-with-cmake-m.patch |   29 +
 meta/recipes-devtools/librepo/librepo_git.bb       |   24 +
 meta/recipes-devtools/opkg/opkg_0.3.4.bb           |    2 +-
 ...-not-add-include-and-library-directories-.patch |   32 +
 .../python-backports-lzma_git.bb                   |   21 +
 .../recipes-devtools/python/python-iniparse_0.4.bb |   17 +
 meta/recipes-devtools/python/python-pygpgme_0.3.bb |   18 +
 ...m_sys-use-md5sum-instead-of-mtime-as-the-.patch |   38 -
 ...art-add-deugging-when-targetpath-is-empty.patch |   47 -
 .../smart-add-for-rpm-ignoresize-check.patch       |   35 -
 .../smart-already-installed-message.patch          |   54 -
 .../python/python-smartpm/smart-attempt-fix.patch  |  158 ---
 .../python/python-smartpm/smart-attempt.patch      |  185 ---
 ...cache.py-getPackages-matches-name-version.patch |   43 -
 .../python-smartpm/smart-channel-remove-all.patch  |   33 -
 .../python/python-smartpm/smart-channelsdir.patch  |   24 -
 .../python/python-smartpm/smart-locale.patch       |   27 -
 .../python/python-smartpm/smart-recommends.patch   |  381 ------
 .../smart-rpm-transaction-failure-check.patch      |   57 -
 .../smart-set-noprogress-for-pycurl.patch          |   20 -
 .../smartpm-rpm5-support-check-signatures.patch    |  112 --
 meta/recipes-devtools/python/python-smartpm_git.bb |  141 ---
 ...d-a-color-setting-for-mips64_n32-binaries.patch |   40 +
 ...an-unsatisfiable-dependency-when-building.patch |   33 +
 ...code-lib-rpm-as-the-installation-path-for.patch |   61 +
 .../0001-Do-not-read-config-files-from-HOME.patch  |   38 +
 ...t-the-PATH-environment-variable-before-ru.patch |   30 +
 .../files/0001-Fix-build-with-musl-C-library.patch |   74 ++
 ...installing-execute-package-scriptlets-wit.patch |   37 +
 ...alue-cannot-be-reset-issue-a-notice-inste.patch |   31 +
 ...-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch |   72 ++
 ...1-Disable-__sync_add_and_fetch_8-on-nios2.patch |   30 -
 .../rpm/rpm/0001-define-EM_AARCH64.patch           |   35 -
 .../0001-macros-add-_gpg_sign_cmd_extra_args.patch |   43 -
 .../rpm/rpm/0001-rpm-Fix-build-on-musl.patch       |  294 -----
 ...0001-system.h-query.c-support-nosignature.patch |   63 -
 ...arseArgvString-to-parse-the-_gpg_check_pa.patch |   49 -
 .../configure.ac-check-for-both-gpg2-and-gpg.patch |   29 -
 meta/recipes-devtools/rpm/rpm/dbconvert.patch      |   27 -
 meta/recipes-devtools/rpm/rpm/debugedit-segv.patch |  100 --
 ...debugedit-valid-file-to-fix-segment-fault.patch |   65 --
 meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch    |   54 -
 .../rpm/rpm/header-include-fix.patch               |   36 -
 .../rpm/rpm/makefile-am-exec-hook.patch            |   33 -
 .../rpm/rpm/no-ldflags-in-pkgconfig.patch          |   14 -
 meta/recipes-devtools/rpm/rpm/perfile_rpmdeps.sh   |   50 -
 .../rpm/popt-disable-auto-stack-protector.patch    |   27 -
 .../rpm/rpm/python-rpm-rpmsense.patch              |   31 -
 meta/recipes-devtools/rpm/rpm/pythondeps.sh        |   16 -
 meta/recipes-devtools/rpm/rpm/rpm-atomic-ops.patch |   73 --
 .../rpm/rpm/rpm-autogen-force.patch                |   78 --
 meta/recipes-devtools/rpm/rpm/rpm-autogen.patch    |   25 -
 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch  |  136 ---
 .../rpm/rpm-check-rootpath-reasonableness.patch    |   96 --
 meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch  |   19 -
 meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch |  174 ---
 meta/recipes-devtools/rpm/rpm/rpm-db60.patch       |   56 -
 .../rpm/rpm/rpm-db_buffer_small.patch              |   77 --
 .../rpm/rpm/rpm-debug-platform.patch               |   65 --
 .../rpm/rpm/rpm-disable-auto-stack-protector.patch |   24 -
 .../rpm/rpm/rpm-disable-blaketest.patch            |   28 -
 ...-ensure-rpm2cpio-call-rpm-relocation-code.patch |   25 -
 meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch  |   36 -
 .../rpm/rpm/rpm-fix-logio-cp.patch                 |   30 -
 .../rpm-fix-lua-tests-compilation-failure.patch    |   43 -
 .../rpm/rpm/rpm-fix-parseEmbedded.patch            |   27 -
 meta/recipes-devtools/rpm/rpm/rpm-gnu-atomic.patch |   64 -
 .../rpm/rpm/rpm-hardlink-segfault-fix.patch        |   43 -
 .../rpm/rpm/rpm-keccak-sse-intrin.patch            |   27 -
 ...ction.c-fix-file-conflicts-for-mips64-N32.patch |   52 -
 meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch |   22 -
 .../recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch |   15 -
 .../rpm/rpm/rpm-lsb-compatibility.patch            |   24 -
 meta/recipes-devtools/rpm/rpm/rpm-lua.patch        |   33 -
 ...rpm-macros.in-disable-external-key-server.patch |   31 -
 meta/recipes-devtools/rpm/rpm/rpm-macros.patch     |   64 -
 .../rpm/rpm/rpm-mongodb-sasl.patch                 |   69 --
 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |   19 -
 .../rpm/rpm/rpm-no-perl-urpm.patch                 |   47 -
 ...b-before-verifyscript-to-avoid-null-point.patch |   24 -
 meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch  |   23 -
 .../rpm/rpm/rpm-packageorigin.patch                |   25 -
 .../rpm/rpm/rpm-payload-use-hashed-inode.patch     |  126 --
 .../rpm/rpm/rpm-pkgconfigdeps.patch                |   37 -
 .../rpm/rpm/rpm-platform-file-fix.patch            |   28 -
 meta/recipes-devtools/rpm/rpm/rpm-platform.patch   |  137 ---
 meta/recipes-devtools/rpm/rpm/rpm-platform2.patch  |  105 --
 meta/recipes-devtools/rpm/rpm/rpm-py-init.patch    |   29 -
 .../rpm/rpm/rpm-python-AddErase.patch              |   35 -
 .../rpm/rpm/rpm-python-restore-origin.patch        |   49 -
 .../rpm/rpm/rpm-python-tagname.patch               |   24 -
 meta/recipes-devtools/rpm/rpm/rpm-realpath.patch   |   24 -
 .../rpm/rpm/rpm-reloc-macros.patch                 |   31 -
 meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch |   40 -
 .../rpm/rpm/rpm-rpmdb-grammar.patch                |  124 --
 .../rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch   |   34 -
 .../rpm/rpm/rpm-rpmio-headers.patch                |   19 -
 .../recipes-devtools/rpm/rpm/rpm-rpmpgp-popt.patch |   26 -
 .../rpm/rpm/rpm-scriptletexechelper.patch          |  159 ---
 meta/recipes-devtools/rpm/rpm/rpm-showrc.patch     |   26 -
 .../rpm/rpm/rpm-syck-fix-gram.patch                | 1081 -----------------
 .../rpm-tag-generate-endian-conversion-fix.patch   |   50 -
 .../rpm/rpm/rpm-tagname-type.patch                 |   25 -
 .../rpm/rpm/rpm-tools-mtree-LDFLAGS.patch          |   24 -
 .../rpm/rpm/rpm-uuid-include.patch                 |   40 -
 meta/recipes-devtools/rpm/rpm/rpm2cpio             |   39 -
 meta/recipes-devtools/rpm/rpm/rpmatch.patch        |   34 -
 ...more-verbose-error-logging-in-rpmTempFile.patch |   31 -
 .../rpmdb-prevent-race-in-tmpdir-creation.patch    |   41 -
 meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch |  194 ----
 ...heck-_gpg_passphrase-before-ask-for-input.patch |   70 --
 .../recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch |   50 -
 meta/recipes-devtools/rpm/rpm/uclibc-support.patch |   63 -
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |  712 ------------
 meta/recipes-devtools/rpm/rpm_git.bb               |  108 ++
 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c  |  426 -------
 meta/recipes-devtools/rpm/rpmresolve_1.0.bb        |   29 -
 meta/recipes-extended/bash/bash.inc                |    4 +
 meta/recipes-extended/byacc/byacc.inc              |   22 -
 .../0001-byacc-do-not-reorder-CC-and-CFLAGS.patch  |  161 ---
 meta/recipes-extended/byacc/byacc/byacc-open.patch |   25 -
 meta/recipes-extended/byacc/byacc_20161202.bb      |   12 -
 meta/recipes-extended/libsolv/libsolv_0.6.24.bb    |    4 +-
 .../packagegroup-core-full-cmdline.bb              |    1 -
 meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb         |    2 +-
 .../createrepo/createrepo/createrepo-dbpath.patch  |   61 -
 .../createrepo/createrepo/createrepo-rpm549.patch  |   22 -
 ...dumpMetadata-disable-signature-validation.patch |   31 -
 .../createrepo/createrepo/fix-native-install.patch |  163 ---
 .../createrepo/createrepo/fixstat.patch            |   19 -
 ...n-scripts-should-use-interpreter-from-env.patch |   47 -
 .../createrepo/createrepo/recommends.patch         |   71 --
 .../createrepo/createrepo/rpm-createsolvedb.py     |   64 -
 .../createrepo/createrepo_0.4.11.bb                |   51 -
 ...Makefile-let-libdb-6.0.la-depend-os_map.l.patch |   29 -
 ...akefile-let-libso_target-depend-on-bt_rec.patch |   30 -
 meta/recipes-support/db/db_5.3.28.bb               |    5 +-
 meta/recipes-support/db/db_6.0.35.bb               |  111 --
 ...-Avoid-host-contamination-from-gpg-config.patch |   30 +
 .../0001-Correctly-install-python-modules.patch    |   26 +
 meta/recipes-support/gpgme/gpgme_1.8.0.bb          |    4 +-
 meta/recipes-support/libassuan/libassuan_2.4.3.bb  |    2 +-
 meta/recipes-support/libcheck/libcheck_0.10.0.bb   |    1 +
 meta/recipes-support/nspr/nspr_4.13.1.bb           |    2 +-
 scripts/oe-setup-rpmrepo                           |    2 +-
 scripts/rpm2cpio.sh                                |  108 +-
 198 files changed, 1952 insertions(+), 10233 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/cases/dnf.py
 delete mode 100644 meta/lib/oeqa/runtime/cases/smart.py
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-Correctly-install-the-shared-library.patch
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
 create mode 100644 meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0001-Do-not-prepend-installroot-to-logdir.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0028-Use-backports.lzma-not-lzma.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
 create mode 100644 meta/recipes-devtools/dnf/dnf_git.bb
 create mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
 create mode 100644 meta/recipes-devtools/libcomps/libcomps/0002-Set-library-installation-path-correctly.patch
 create mode 100644 meta/recipes-devtools/libcomps/libcomps_git.bb
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0002-Prefix-sysroot-path-to-introspection-tools-path.patch
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0003-Set-the-library-installation-directory-correctly.patch
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
 create mode 100644 meta/recipes-devtools/libdnf/libdnf_git.bb
 create mode 100644 meta/recipes-devtools/librepo/librepo/0001-Correctly-set-the-library-installation-directory.patch
 create mode 100644 meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
 create mode 100644 meta/recipes-devtools/librepo/librepo/0003-tests-fix-a-race-when-deleting-temporary-directories.patch
 create mode 100644 meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
 create mode 100644 meta/recipes-devtools/librepo/librepo_git.bb
 create mode 100644 meta/recipes-devtools/python-backports-lzma/python-backports-lzma/0001-setup.py-do-not-add-include-and-library-directories-.patch
 create mode 100644 meta/recipes-devtools/python-backports-lzma/python-backports-lzma_git.bb
 create mode 100644 meta/recipes-devtools/python/python-iniparse_0.4.bb
 create mode 100644 meta/recipes-devtools/python/python-pygpgme_0.3.bb
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/channels-rpm_sys-use-md5sum-instead-of-mtime-as-the-.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-add-deugging-when-targetpath-is-empty.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-add-for-rpm-ignoresize-check.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-already-installed-message.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-attempt-fix.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-cache.py-getPackages-matches-name-version.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-channel-remove-all.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-channelsdir.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-locale.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-recommends.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm-transaction-failure-check.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-set-noprogress-for-pycurl.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smartpm-rpm5-support-check-signatures.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm_git.bb
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-When-nice-value-cannot-be-reset-issue-a-notice-inste.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/0001-Disable-__sync_add_and_fetch_8-on-nios2.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/0001-define-EM_AARCH64.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/0001-macros-add-_gpg_sign_cmd_extra_args.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/0001-rpm-Fix-build-on-musl.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/0001-system.h-query.c-support-nosignature.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/0001-using-poptParseArgvString-to-parse-the-_gpg_check_pa.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/configure.ac-check-for-both-gpg2-and-gpg.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/dbconvert.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/debugedit-segv.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/gcc6-stdlib.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/header-include-fix.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/makefile-am-exec-hook.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/no-ldflags-in-pkgconfig.patch
 delete mode 100755 meta/recipes-devtools/rpm/rpm/perfile_rpmdeps.sh
 delete mode 100644 meta/recipes-devtools/rpm/rpm/popt-disable-auto-stack-protector.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
 delete mode 100755 meta/recipes-devtools/rpm/rpm/pythondeps.sh
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-atomic-ops.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-autogen-force.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-autogen.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-check-rootpath-reasonableness.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-db60.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-db_buffer_small.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-debug-platform.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-disable-auto-stack-protector.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-disable-blaketest.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-ensure-rpm2cpio-call-rpm-relocation-code.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-fix-logio-cp.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-fix-lua-tests-compilation-failure.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-gnu-atomic.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-hardlink-segfault-fix.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-keccak-sse-intrin.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lsb-compatibility.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lua.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-macros.in-disable-external-key-server.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-macros.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-no-perl-urpm.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-opendb-before-verifyscript-to-avoid-null-point.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-payload-use-hashed-inode.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-pkgconfigdeps.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-platform.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-platform2.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-py-init.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-python-AddErase.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-python-tagname.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-realpath.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmdb-grammar.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-popt.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-showrc.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-syck-fix-gram.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-tag-generate-endian-conversion-fix.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-tagname-type.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-tools-mtree-LDFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-uuid-include.patch
 delete mode 100755 meta/recipes-devtools/rpm/rpm/rpm2cpio
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpmatch.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpmdb-more-verbose-error-logging-in-rpmTempFile.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpmdb-prevent-race-in-tmpdir-creation.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpmqv.c-check-_gpg_passphrase-before-ask-for-input.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/uclibc-support.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm_5.4.16.bb
 create mode 100644 meta/recipes-devtools/rpm/rpm_git.bb
 delete mode 100644 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
 delete mode 100644 meta/recipes-devtools/rpm/rpmresolve_1.0.bb
 delete mode 100644 meta/recipes-extended/byacc/byacc.inc
 delete mode 100644 meta/recipes-extended/byacc/byacc/0001-byacc-do-not-reorder-CC-and-CFLAGS.patch
 delete mode 100644 meta/recipes-extended/byacc/byacc/byacc-open.patch
 delete mode 100644 meta/recipes-extended/byacc/byacc_20161202.bb
 delete mode 100644 meta/recipes-support/createrepo/createrepo/createrepo-dbpath.patch
 delete mode 100644 meta/recipes-support/createrepo/createrepo/createrepo-rpm549.patch
 delete mode 100644 meta/recipes-support/createrepo/createrepo/dumpMetadata-disable-signature-validation.patch
 delete mode 100644 meta/recipes-support/createrepo/createrepo/fix-native-install.patch
 delete mode 100644 meta/recipes-support/createrepo/createrepo/fixstat.patch
 delete mode 100644 meta/recipes-support/createrepo/createrepo/python-scripts-should-use-interpreter-from-env.patch
 delete mode 100644 meta/recipes-support/createrepo/createrepo/recommends.patch
 delete mode 100755 meta/recipes-support/createrepo/createrepo/rpm-createsolvedb.py
 delete mode 100644 meta/recipes-support/createrepo/createrepo_0.4.11.bb
 delete mode 100644 meta/recipes-support/db/db/Makefile-let-libdb-6.0.la-depend-os_map.l.patch
 delete mode 100644 meta/recipes-support/db/db/Makefile-let-libso_target-depend-on-bt_rec.patch
 delete mode 100644 meta/recipes-support/db/db_6.0.35.bb
 create mode 100644 meta/recipes-support/gpgme/gpgme/0001-Avoid-host-contamination-from-gpg-config.patch
 create mode 100644 meta/recipes-support/gpgme/gpgme/0001-Correctly-install-python-modules.patch

-- 
2.11.0


