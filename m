Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBhUj-0003ac-1b
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 09:36:21 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Sep 2012 00:23:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,408,1344236400"; d="scan'208";a="191923991"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.93])
	by orsmga001.jf.intel.com with ESMTP; 12 Sep 2012 00:23:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2012 00:23:47 -0700
Message-Id: <cover.1347434214.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
Subject: [CONSOLIDATED REQUEST v2 00/35] Misc Fixes (CV Only)
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
X-List-Received-Date: Wed, 12 Sep 2012 07:36:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

This contains various fixes from teh community along with a few 
updates.  The Kernel update seems to have trigged a mpc8315 failure, but 
I am sure Bruce will deal with it quickly.

This also include Bruce and my change that now allows us to elimate the 
x32 layer and by setting the DEFAULTTUNE enable x32 build for any BSP.

Phil B. has confirmed his change with BUILD_HISTORY.

This is a good change set and should be merged.

There are a couple of meta-yocto changes that I need to pull
together also, but they are minor.

Thanks	
	Sau!


The following changes since commit 48169c6bc44c546cecaa06207b6c36da558b81f7:

  classes/packageinfo: use better method to check if package exists (2012-09-10 21:52:37 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (3):
  linux-yocto/3.4: v3.4.10 and uprobes/kprobes configuration updates
  linux-yocto*: append to KERNEL_FEATURES 
instead of assigning
  linux-yocto/3.4: add x32 configuration fragment

Constantin Musca (4):
  boost: upgrade to 1.51.0
  glew: upgrade to 1.9.0
  libexif: upgrade to 0.6.21
  sysstat: upgrade to 10.1.1

Jackie Huang (1):
  libgnome-keyring: add missing DEPENDS on intltool-native


Khem Raj (2):
  gcc-4.7: Fix build for armv4/EABI and ppc/Os
  gcc-4.7: Backport libgcc fixes to appease the new build sequence

Laurentiu Palcu (1):
  nativesdk-qemu: fix SDK relocation issue

Mark Asselstine (1):
  base-files: provide a mechanism to skip creation of the hostname file

Mark Hatle (3):
  image.bbclass: Enable the complementary install to be called w/
    globbing params
  package_rpm.bbclass: Avoid unnecessary installs in complementary pass
  qt4: Update qt4.inc to remove staticdev deps in -dbg packages

Martin Ertsaas (1):
  gettext: Make gettext 0.16.1 extend native and nativesdk.

Matthew McClintock (1):
  sysvinit-inittab_2.88dsf.bb: only run serial checks at boot if we
    have items to check

Paul Eggleton (2):

  classes/sanity: skip tune checks if machine is invalid
  classes/sanity: remove obsolete code

Phil Blundell (4):
  perl-native: PROVIDE libmodule-build-perl-native for consistency with
    non-native perl
  shadow: Fix various invalid assumptions about directory layout
  shadow-native: Ensure that ${sbindir} and ${base_sbindir} are
    respected
  eglibc: Restore ${PN} to before ${PN}-dev in PACKAGES

Richard Purdie (2):
  autotools.bbclass: Add functionality to force a clean of ${B} when
    reconfiguring (and ${S} != ${B})
  libgpg-error: Use the source file for the licence checksum


Ross Burton (2):
  webkit-gtk: work around Make bug by re-running make
  telepathy-idle: fix parallel build

Saul Wold (2):
  quota: add inherit gettext
  arch-ia32: Enable x32 KERNEL_FEATURE if tune is x32


Vladimir Zapolskiy (6):
  classes/license: define LICENSE_MANIFEST variable
  classes/license: check license manifest for double records
  classes/license: remove redundant nested if statements
  classes/license: account LICENSE_${pkg} values in manifest
  classes/license: correct license info in lisense.manifest
  classes/license: place all found licenses on one line


 meta/classes/autotools.bbclass                     |   21 +++++
 meta/classes/image.bbclass                         |    4 +-
 meta/classes/license.bbclass                       |   55 +++++++-----

 meta/classes/package_rpm.bbclass                   |    9 ++-
 meta/classes/sanity.bbclass                        |   19 ++--
 meta/conf/machine/include/ia32/arch-ia32.inc       |    1 +
 .../build-fix-for-make-j-safety.patch              |   39 ++++++++
 .../fix-svc-gtk-doc.h-target.patch                 |   24 +-----
 .../telepathy/telepathy-idle_0.1.12.bb             |    5 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb  |   14 ++--
 meta/recipes-core/eglibc/eglibc-package.inc        |    2 +-
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    2 +-
 meta/recipes-core/gettext/gettext_0.16.1.bb        |    2 +
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   10 ++-
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    6 +-
 ...-vis_hide-gen-hide-list-Do-not-make-defin.patch |   93 ++++++++++++++++++++
 ...USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch |   49 ++++++++++
 .../gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch    |   31 +++++++
 .../gcc/gcc-4.7/ppc_no_crtsavres.patch             |   72 +++++++++++++++
 meta/recipes-devtools/perl/perl-native_5.14.2.bb   |    3 +
 .../qemu/qemu-1.2.0/relocatable_sdk.patch          |   34 +++++++
 meta/recipes-devtools/qemu/qemu_1.2.0.bb           |    6 ++
 meta/recipes-extended/quota/quota_4.00.bb          |    4 +-
 .../shadow/shadow-native_4.1.4.3.bb                |   11 ++-
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |   17 +++-
 meta/recipes-extended/sysstat/sysstat_10.0.5.bb    |    8 --
 meta/recipes-extended/sysstat/sysstat_10.1.1.bb    |    8 ++
 .../recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |    4 +-
 .../glew/{glew_1.7.0.bb => glew_1.9.0.bb}          |    6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |   10 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb       |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   19 ++--
 meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
 meta/recipes-qt/qt4/qt4.inc                        |    2 +-
 meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb       |   22 +++++
 .../boost/{boost_1.50.0.bb => boost_1.51.0.bb}     |    4 +-
 .../{libexif_0.6.20.bb => libexif_0.6.21.bb}       |    4 +-
 .../libgpg-error/libgpg-error_1.10.bb              |    2 +-
 42 files changed, 518 insertions(+), 116 deletions(-)
 create mode 100644 meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/build-fix-for-make-j-safety.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-1.2.0/relocatable_sdk.patch
 delete mode 100644 meta/recipes-extended/sysstat/sysstat_10.0.5.bb
 create mode 100644 meta/recipes-extended/sysstat/sysstat_10.1.1.bb
 rename meta/recipes-graphics/glew/{glew_1.7.0.bb => glew_1.9.0.bb} (80%)
 rename meta/recipes-support/boost/{boost_1.50.0.bb => boost_1.51.0.bb} (53%)
 rename meta/recipes-support/libexif/{libexif_0.6.20.bb => libexif_0.6.21.bb} (74%)

-- 
1.7.7.6



