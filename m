Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TEhxE-0001m0-Ki
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 16:42:13 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 20 Sep 2012 07:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,453,1344236400"; d="scan'208";a="147173818"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.229])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Sep 2012 07:29:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2012 07:29:28 -0700
Message-Id: <cover.1348150993.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED REQUEST 00/15] Fixes for 1.3 RC2 (no cover letter)
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
X-List-Received-Date: Thu, 20 Sep 2012 14:42:13 -0000

Richard,

This contains a set of fixes that have been tested against the
build.

I have included the GDB update, which I know is late in the game,
but I think it important tool to be updated.

I also included Wenzong's TMPDIR fix, if you read the chain of emails
this seems to be the only way to fix this give the number of m4 macro
files included and the fact that we really can't patch the host aclocal.

Sau!

The following changes since commit 9db6ea4981fe22dd430c13d9f5a838ad92d1afe6:


  gtk+: enable gtk+-native (2012-09-20 13:21:59 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Constantin Musca (1):
  intltool: include intltool.m4 and add missing rdepends

Cristian Iorga (2):
  qemux86: Support for KVM, paravirt and virtio added
  qemux86-64: Support for KVM, paravirt and virtio added

Darren Hart (1):
  mkefidisk.sh: Add script to do an EFI install on the host

Khem Raj (1):
  gdb: Upgrade 7.4 -> 7.5

Martin Jansa (3):
  opkg: replace local patches with git patches submitted upstream
  opkg: add patch to fix SIGSEGV when printing status file
  opkg-nogpg: drop SRCREV

Radu Moisan (1):
  insane.bbclass: add library dir sanity check

Robert Yang (3):
  rpm 5.4.9: DEPENDS on bison-native
  opkg 0.1.8: remove it since it doesn't work
  opkg svn: respect to the arch priority

Ross Burton (1):
  librsvg: make the libcroco dependency a PACKAGECONFIG option

Scott Garman (1):
  runqemu: show bitbake errors to user

Wenzong Fan (1):
  coreutils: fix do_configure error with long TMPDIR

 meta/classes/insane.bbclass                        |   39 ++-
 meta/recipes-core/coreutils/coreutils_8.14.bb      |    4 +-
intltool meta/recipes-devtools/gdb/gdb-common.inc           |   11 +-
 ...canadian_7.4.1.bb => gdb-cross-canadian_7.5.bb} |    0
 .../gdb/{gdb-cross_7.4.1.bb => gdb-cross_7.5.bb}   |    0
 meta/recipes-devtools/gdb/gdb.inc                  |    1 -
 meta/recipes-devtools/gdb/gdb/no-werror.patch      |   80 ----
 .../gdb/gdb/renesas-sh-native-support.patch        |  194 +++++-----
 meta/recipes-devtools/gdb/gdb/siginfo_t.patch      |  403 --------------------
 .../gdb/{gdb_7.4.1.bb => gdb_7.5.bb}               |    0
 meta/recipes-devtools/intltool/intltool.inc        |    9 +-
 meta/recipes-devtools/intltool/intltool_0.50.0.bb  |    2 +-
 .../opkg/opkg-0.1.8/headerfix.patch                |   19 -
 meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb     |   10 -
 meta/recipes-devtools/opkg/opkg-nogpg_svn.bb       |    2 -
 .../0001-add-opkg_compare_versions-function.patch  |   54 +++
 ...e-the-uname-gname-fields-when-extracting.patch} |   31 +-
 ...ix-dependency-issues-for-preinst-scripts.patch} |   66 ++--
 ...nst-script-is-not-fatal-with-conf-offlin.patch} |   76 +++--
 ...ot-read-etc-opkg-.conf-if-f-is-specified.patch} |   12 +-
 ...tch => 0006-detect-circular-dependencies.patch} |   82 +++--
 ...g-provides-even-when-oldpkg-provides-exis.patch |   49 +++
 .../opkg/opkg/0008-select_higher_version.patch     |  102 +++++
 meta/recipes-devtools/opkg/opkg/add_vercmp.patch   |   36 --
 meta/recipes-devtools/opkg/opkg_0.1.8.bb           |   11 -
 meta/recipes-devtools/opkg/opkg_svn.bb             |   16 +-
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    4 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |   10 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |    4 +-
 scripts/contrib/mkefidisk.sh                       |  255 +++++++++++++
 scripts/runqemu                                    |   28 ++-
 scripts/runqemu-internal                           |   18 +-
 32 files changed, 831 insertions(+), 797 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.4.1.bb => gdb-cross-canadian_7.5.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.4.1.bb => gdb-cross_7.5.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/no-werror.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/siginfo_t.patch
 rename meta/recipes-devtools/gdb/{gdb_7.4.1.bb => gdb_7.5.bb} (100%)
 delete mode 100644 meta/recipes-devtools/opkg/opkg-0.1.8/headerfix.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-add-opkg_compare_versions-function.patch
 rename meta/recipes-devtools/opkg/opkg/{add_uname_support.patch => 0002-Ensure-we-use-the-uname-gname-fields-when-extracting.patch} (69%)
 rename meta/recipes-devtools/opkg/opkg/{fix_installorder.patch => 0003-Fix-dependency-issues-for-preinst-scripts.patch} (81%)
 rename meta/recipes-devtools/opkg/opkg/{offline_postinstall.patch => 0004-Failed-postinst-script-is-not-fatal-with-conf-offlin.patch} (50%)
 rename meta/recipes-devtools/opkg/opkg/{conf_override.patch => 0005-Do-not-read-etc-opkg-.conf-if-f-is-specified.patch} (88%)
 rename meta/recipes-devtools/opkg/opkg/{track_parents.patch => 0006-detect-circular-dependencies.patch} (58%)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0008-select_higher_version.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/add_vercmp.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg_0.1.8.bb
 create mode 100755 scripts/contrib/mkefidisk.sh

-- 
1.7.7.6



