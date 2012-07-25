Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Stw3a-0004Xl-7y
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 09:30:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2012 00:19:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172897542"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.97])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2012 00:19:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 00:18:54 -0700
Message-Id: <cover.1343200454.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL 00/28] Fixes & eglibc 2.16
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
X-List-Received-Date: Wed, 25 Jul 2012 07:30:54 -0000

Richard,

This is a batch of changes that have seen various level of
build testing.  It is currently building on the AB, so you 
can monitor and decide.

We have had a new of parallel build related issues in
telepathy and tonght in bash (this may be related to 
Otavio's re-enablement)

I think that the eglibc update is ready, we have to deal with
Paul's changes, but Khem may have a patch that I need to test
tomorrow.

I like the idea of including remake in as a debugging tool, not ready 
to convert to it yet, as I think we need to test that more.

Thanks
	Sau!


The following changes since commit 4148bc80c008d25c8a536c7c7dfdeac1669a6662:

  libgcc: Add missing dependency on libc:do_package (2012-07-24 10:12:08 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrei Gherzan (1):
  package.bbclass: Create symlinks for packages with different packaged
    name

Bruce Ashfield (1):
  linux-yocto/3.4: 3.4.6 and 3.4.x-rt14

Christopher Larson (2):
  initscripts: don't bg mk_dirs in populate-volatile
  libpcap: fix pcap-config to not return -Wl,-rpath

Denis Carikli (1):
  kernel.bbclass: fix external module building

Khem Raj (6):
  qemu.bbclass: Map the qemu binary name for powerpc64
  cups_1.4.6.bb: Fix build on ppc64
  libcgroup_0.37.1.bb: Add recipe
  eglibc-initial: Fix build failure due to missing limits.h
  gcc-cross-initial: Stage self sufficient fixed limits.h
  eglibc: Fix build when OPTION_POSIX_WIDE_CHAR_DEVICE_IO is not set

Koen Kooi (1):
  kernel bbclass: Recreate uImage only when KEEPUIMAGE != "yes"

Mark Hatle (1):
  Add missing Upstream-Status to various patches.

Otavio Salvador (4):
  bash: enable parallel build
  bash: fix warning about bashbug reference /usr/bin when installed in
    /bin
  shadow-native: use 'users' group by default
  shadow: use 'users' group by default

Paul Eggleton (2):
  dhcp: remove dependency of dev/staticdev packages on main package
  classes/package_deb: add PackageArch field

Robert P. J. Day (3):
  libxp: Change superfluous "+=" to simple "=" when using _append
  webkit-gtk: Replace superfluous "+=" with "=", and add leading space
  xinit_1.3.2: Remove broken, superfluous 'FILES_${PN} +=
    "${libdir}X11/xinit"'

Robert Yang (1):
  package-index: inherit pythonnative

Ross Burton (1):
  core-image: remove x11-netbook package group, it's unused

Roy.Li (1):
  busybox:udhcpc: fix the root_is_nfs() function

Saul Wold (1):
  tcmode-default: Bump EGLIBC Version to 2.16

Wenzong Fan (1):
  remake: Add remake-native and remake

Yao Zhao (1):
  busybox: fix the problem that mkfs.minix.tests fails on big endian
    platform

 meta/classes/core-image.bbclass                    |    2 -
 meta/classes/kernel.bbclass                        |    5 ++-
 meta/classes/license.bbclass                       |    2 +-
 meta/classes/package.bbclass                       |    6 ++-
 meta/classes/package_deb.bbclass                   |    1 +
 meta/classes/qemu.bbclass                          |    2 +
 meta/conf/distro/include/default-distrovars.inc    |    1 +
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 meta/recipes-connectivity/dhcp/dhcp.inc            |    2 +
 meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb    |    2 +-
 meta/recipes-connectivity/libpcap/libpcap.inc      |    3 +-
 .../busybox-mkfs-minix-tests_bigendian.patch       |   34 ++++++++++++++
 meta/recipes-core/busybox/busybox_1.19.4.bb        |    5 +-
 meta/recipes-core/busybox/files/simple.script      |    3 +-
 .../eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch    |   48 ++++++++++++++-----
 .../eglibc-2.16/fileops-without-wchar-io.patch     |   22 +++++++++
 meta/recipes-core/eglibc/eglibc-initial.inc        |    1 +
 meta/recipes-core/eglibc/eglibc-initial_2.16.bb    |    9 +++-
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    3 +-
 .../initscripts-1.0/populate-volatile.sh           |    4 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 meta/recipes-core/libcgroup/libcgroup_0.37.1.bb    |   27 +++++++++++
 meta/recipes-core/meta/package-index.bb            |    2 +
 .../binutils/binutils/binutils-armv5e.patch        |    4 ++
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |   10 ++++
 .../ossp-uuid/0001-Change-library-name.patch       |    7 +++
 ...erve-m-option-status-in-v-option-handling.patch |    7 +++
 .../ossp-uuid/0003-Fix-whatis-entries.patch        |    7 +++
 .../ossp-uuid/0004-fix-data-uuid-from-string.patch |    7 +++
 .../ossp-uuid/ossp-uuid/uuid-libtool.patch         |    3 +
 .../ossp-uuid/ossp-uuid/uuid-nostrip.patch         |    3 +
 meta/recipes-devtools/remake/remake.inc            |   16 +++++++
 .../remake/remake/version-remake.texi.patch        |   16 +++++++
 meta/recipes-devtools/remake/remake_git.bb         |   25 ++++++++++
 meta/recipes-devtools/rpm/rpm/rpm-lua.patch        |    2 +
 meta/recipes-devtools/rpm/rpm/rpm-macros.patch     |    2 +
 .../rpm/rpm/rpm-no-perl-urpm.patch                 |    2 +
 meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch  |    2 +
 .../rpm/rpm/rpm-packageorigin.patch                |    2 +
 .../rpm/rpm/rpm-pkgconfigdeps.patch                |    2 +
 meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch |    2 +
 meta/recipes-extended/bash/bash.inc                |   13 +++--
 meta/recipes-extended/bash/bash_4.2.bb             |    2 +-
 .../cups/cups-1.4.6/cups_serverbin.patch           |   32 +++++++++++++
 meta/recipes-extended/cups/cups14.inc              |   26 +++++-----
 meta/recipes-extended/cups/cups_1.4.6.bb           |    7 ++-
 .../libzypp/libzypp/libzypp-rpm549.patch           |    4 ++
 .../shadow/shadow-native_4.1.4.3.bb                |    5 ++-
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    5 ++-
 meta/recipes-graphics/xorg-app/xinit_1.3.2.bb      |    2 -
 meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb      |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    8 ++--
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   16 +++---
 meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb       |    4 +-
 .../createrepo/createrepo/createrepo-rpm549.patch  |    3 +
 56 files changed, 365 insertions(+), 73 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.19.4/busybox-mkfs-minix-tests_bigendian.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/fileops-without-wchar-io.patch
 create mode 100644 meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
 create mode 100644 meta/recipes-devtools/remake/remake.inc
 create mode 100644 meta/recipes-devtools/remake/remake/version-remake.texi.patch
 create mode 100644 meta/recipes-devtools/remake/remake_git.bb
 create mode 100644 meta/recipes-extended/cups/cups-1.4.6/cups_serverbin.patch

-- 
1.7.7.6



