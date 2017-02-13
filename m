Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 03CCD71CAA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:05:38 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 13 Feb 2017 07:05:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="64546493"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2017 07:05:38 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 17:05:30 +0200
Message-Id: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 00/36] Replace Smart package manager with DNF package manager
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
X-List-Received-Date: Mon, 13 Feb 2017 15:05:39 -0000

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

Please see specific commits for further information and explanations.

The following changes since commit e758547db9048d4aa1c1415d6af8072f519fae24:

  nss: Fix nss-native so the checksum doesn't change with BUILD_ARCH (2017-02-09 10:52:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/dnf-rpm4
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/dnf-rpm4

Alexander Kanavin (35):
  gpgme: allow building -native variant
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
  package.bbclass: add support for pkg_postinst_ontarget()
  rootfs_rpm.bbclass: migrate image creation to dnf
  scripts/rpm2cpio.sh: replace 5.x version with 4.x version
  scripts/oe-setup-rpmrepo: replace createrepo with createrepo_c
  package_rpm.bbclass: replace createrepo reference with createrepo_c
  package_rpm.bbclass: prevent rpm from using sysroot paths that it was
    originally compiled with
  testimage.bbclass: fix runtime test for rpm, port smart tests to dnf
  package_rpm.bbclass: instruct rpm to not remove the buildroot
    directory
  selftest: do not perform a full build in test_continue
  image.bbclass: do not uninstall update-alternatives from readonly
    rootfs
  selftest: allow bitbake to fail in test_options_warnqa_errorqa_switch
  ossp-uuid: remove the recipe
  byacc: remove the recipe
  nativesdk.bbclass: add a /bin/sh RPROVIDES

Amarnath Valluri (1):
  package_deb.bbclass: Ignore file paths in RPROVIDES

 .../recipes-test/postinst/postinst_1.0.bb          |   99 +-
 meta/classes/image.bbclass                         |    2 +-
 meta/classes/nativesdk.bbclass                     |    4 +
 meta/classes/package.bbclass                       |   24 +-
 meta/classes/package_deb.bbclass                   |    4 +
 meta/classes/package_rpm.bbclass                   |   36 +-
 meta/classes/rootfs_rpm.bbclass                    |   21 +-
 meta/classes/testimage.bbclass                     |   62 +-
 meta/conf/distro/include/default-versions.inc      |    3 -
 meta/lib/oe/package_manager.py                     | 1215 ++++----------------
 meta/lib/oe/rootfs.py                              |   62 +-
 meta/lib/oe/sdk.py                                 |    7 +-
 meta/lib/oeqa/oetest.py                            |    7 -
 meta/lib/oeqa/runtime/cases/dnf.py                 |  109 ++
 meta/lib/oeqa/runtime/cases/parselogs.py           |    1 +
 meta/lib/oeqa/runtime/cases/rpm.py                 |   19 +-
 meta/lib/oeqa/runtime/cases/smart.py               |  196 ----
 meta/lib/oeqa/selftest/bbtests.py                  |    2 +-
 meta/lib/oeqa/selftest/buildoptions.py             |    6 +-
 .../nativesdk-packagegroup-sdk-host.bb             |    2 +-
 ...0001-Correctly-install-the-shared-library.patch |   28 +
 ...-set-PYTHON_INSTALL_DIR-by-running-python.patch |   27 +
 .../createrepo-c/createrepo-c_git.bb               |   24 +
 ...Corretly-install-tmpfiles.d-configuration.patch |   21 +
 ...hardcode-etc-and-systemd-unit-directories.patch |   29 +
 ...0001-Do-not-prepend-installroot-to-logdir.patch |   31 +
 .../dnf/dnf/0028-Use-backports.lzma-not-lzma.patch |   30 +
 ...-set-PYTHON_INSTALL_DIR-by-running-python.patch |   27 +
 .../dnf/0030-Run-python-scripts-using-env.patch    |   48 +
 meta/recipes-devtools/dnf/dnf_git.bb               |   31 +
 ...-set-PYTHON_INSTALL_DIR-by-running-python.patch |   41 +
 ...2-Set-library-installation-path-correctly.patch |   27 +
 meta/recipes-devtools/libcomps/libcomps_git.bb     |   23 +
 ...cmake-drop-the-requirement-for-GTKDOC_SCA.patch |   31 +
 ...ers-for-both-libsolv-and-libsolvext-libdn.patch |   28 +
 ...-sysroot-path-to-introspection-tools-path.patch |   36 +
 ...-library-installation-directory-correctly.patch |   29 +
 ...-variables-with-pkg-config-cmake-s-own-mo.patch |   29 +
 meta/recipes-devtools/libdnf/libdnf_git.bb         |   25 +
 ...ly-set-the-library-installation-directory.patch |   28 +
 ...to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch |   41 +
 ...-race-when-deleting-temporary-directories.patch |   41 +
 ...ariables-with-pkg-config-not-with-cmake-m.patch |   29 +
 meta/recipes-devtools/librepo/librepo_git.bb       |   24 +
 .../ossp-uuid/0001-Change-library-name.patch       |  119 --
 ...erve-m-option-status-in-v-option-handling.patch |   62 -
 .../ossp-uuid/0003-Fix-whatis-entries.patch        |   58 -
 .../ossp-uuid/0004-fix-data-uuid-from-string.patch |   43 -
 .../ossp-uuid/ossp-uuid/install-pc.patch           |   19 -
 .../ossp-uuid/ossp-uuid/ldflags.patch              |   26 -
 .../ossp-uuid/ossp-uuid/uuid-libtool.patch         |   27 -
 .../ossp-uuid/ossp-uuid/uuid-nostrip.patch         |   19 -
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb |   64 --
 ...-not-add-include-and-library-directories-.patch |   32 +
 .../python-backports-lzma_git.bb                   |   21 +
 .../recipes-devtools/python/python-iniparse_0.4.bb |   17 +
 meta/recipes-devtools/python/python-pygpgme_0.3.bb |   18 +
 ...m_sys-use-md5sum-instead-of-mtime-as-the-.patch |   38 -
 ...art-add-deugging-when-targetpath-is-empty.patch |   47 -
 .../smart-add-for-rpm-ignoresize-check.patch       |   35 -
 .../smart-already-installed-message.patch          |   54 -
 .../python/python-smartpm/smart-attempt-fix.patch  |  158 ---
 .../python/python-smartpm/smart-attempt.patch      |  177 ---
 ...cache.py-getPackages-matches-name-version.patch |   43 -
 .../python-smartpm/smart-channel-remove-all.patch  |   33 -
 .../python/python-smartpm/smart-channelsdir.patch  |   24 -
 .../python/python-smartpm/smart-locale.patch       |   27 -
 .../python/python-smartpm/smart-recommends.patch   |  381 ------
 .../smart-rpm-transaction-failure-check.patch      |   57 -
 .../smart-set-noprogress-for-pycurl.patch          |   20 -
 .../smartpm-rpm5-support-check-signatures.patch    |  112 --
 meta/recipes-devtools/python/python-smartpm_git.bb |  141 ---
 ...an-unsatisfiable-dependency-when-building.patch |   33 +
 .../0001-Do-not-read-config-files-from-HOME.patch  |   38 +
 ...t-the-PATH-environment-variable-before-ru.patch |   30 +
 ...installing-execute-package-scriptlets-wit.patch |   37 +
 ...-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch |   72 ++
 ...1-Disable-__sync_add_and_fetch_8-on-nios2.patch |   30 -
 .../rpm/rpm/0001-define-EM_AARCH64.patch           |   35 -
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
 meta/recipes-devtools/rpm/rpm/rpm-gnu-atomic.patch |   64 --
 .../rpm/rpm/rpm-hardlink-segfault-fix.patch        |   43 -
 .../rpm/rpm/rpm-keccak-sse-intrin.patch            |   27 -
 ...ction.c-fix-file-conflicts-for-mips64-N32.patch |   52 -
 meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch |   22 -
 .../recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch |   15 -
 .../rpm/rpm/rpm-lsb-compatibility.patch            |   24 -
 meta/recipes-devtools/rpm/rpm/rpm-lua.patch        |   33 -
 ...rpm-macros.in-disable-external-key-server.patch |   31 -
 meta/recipes-devtools/rpm/rpm/rpm-macros.patch     |   64 --
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
 meta/recipes-devtools/rpm/rpm_git.bb               |   73 ++
 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c  |  426 -------
 meta/recipes-devtools/rpm/rpmresolve_1.0.bb        |   29 -
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
 .../createrepo/createrepo/rpm-createsolvedb.py     |   64 --
 .../createrepo/createrepo_0.4.11.bb                |   51 -
 ...Makefile-let-libdb-6.0.la-depend-os_map.l.patch |   29 -
 ...akefile-let-libso_target-depend-on-bt_rec.patch |   30 -
 meta/recipes-support/db/db_5.3.28.bb               |    1 +
 meta/recipes-support/db/db_6.0.35.bb               |  111 --
 meta/recipes-support/gpgme/gpgme_1.6.0.bb          |    2 +
 meta/recipes-support/libassuan/libassuan_2.4.3.bb  |    2 +-
 meta/recipes-support/libcheck/libcheck_0.10.0.bb   |    3 +-
 scripts/oe-setup-rpmrepo                           |    2 +-
 scripts/postinst-intercepts/delay_to_first_boot    |    2 +
 scripts/rpm2cpio.sh                                |  108 +-
 188 files changed, 1656 insertions(+), 10663 deletions(-)
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
 delete mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0001-Change-library-name.patch
 delete mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0002-uuid-preserve-m-option-status-in-v-option-handling.patch
 delete mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0003-Fix-whatis-entries.patch
 delete mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0004-fix-data-uuid-from-string.patch
 delete mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/install-pc.patch
 delete mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch
 delete mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-libtool.patch
 delete mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-nostrip.patch
 delete mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
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
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/0001-Disable-__sync_add_and_fetch_8-on-nios2.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/0001-define-EM_AARCH64.patch
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
 create mode 100644 scripts/postinst-intercepts/delay_to_first_boot

-- 
2.11.0


