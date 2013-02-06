Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U3017-0005hM-JZ
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 09:06:06 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Feb 2013 23:50:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,614,1355126400"; d="scan'208";a="258410234"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 05 Feb 2013 23:50:13 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 23:50:12 -0800
Message-Id: <cover.1360136847.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [CONSOLIDATED PULL 00/31] Read-Only Rootfs & Rootfs Postinstalls
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
X-List-Received-Date: Wed, 06 Feb 2013 08:06:06 -0000

Richard,

This set includes the kernel updates from Bruce, with the PPC fixes
from Matthew, along with other patches.

I tested the Read-only Rootfs on core-image-sato with Larurentiu's
Postinstall patches, I was able to boot sato and use it in a ReadOnly 
rootfs on QEMU.

Please consider this patch set.

Thanks
	Sau!


The following changes since commit 98cae0544884cb5700d42409ec4a9584a17dc9a4:

  crosstap: handle hyphenated x86_64 target arch (2013-02-05 15:22:19 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bogdan Marinescu (1):
  intltool: updated to 0.50.2

Bruce Ashfield (3):
  linux-yocto/dev: linux-yocto development tree tracking recipe
  linux-yocto/3.4: update to v3.4.28, 3.4.28-rt40
  linux-yocto: KERNEL_FEATURES should reference full scc files

Chen Qi (6):
  sysvinit: add ROOTFS_READ_ONLY variable to rcS-default
  image.bbclass: add a hook funtion to support readonly rootfs
  core-image.bbclass: support read-only rootfs
  populate-volatile.sh: improve this script
  initscripts: let populate-volatile.sh create the /tmp link
  initscripts: add read-only-rootfs-hook.sh script

Constantin Musca (1):
  classextend.py: use explode_dep_versions2 in order to preserve
    versions too

Cristian Iorga (1):
  net-tools: upgrade to v1.60-24.2

Laurentiu Palcu (8):
  add fontcache.bbclass
  add qemuwrapper-cross recipe
  qemu.bbclass: return qemuwrapper instead of qemu-allarch
  image.bbclass: add a proper error message if hook script fails
  fontconfig: add sysroot option to fc-cache and fc-cat
  liberation-fonts: use the new fontcache.bbclass
  package_ipk, rootfs_ipk: remove the "set -x"
  pulseaudio: do not postpone postinstall

Marko Lindqvist (3):
  opkg: replace obsolete automake macros with working ones
  matchbox-wm: update to git master head
  rpcbind: replace obsolete automake macros with working ones

Martin Jansa (2):
  ipk: use OPKGLIBDIR in all places
  send-pull-request: add extra CC argument

Matthew McClintock (4):
  glib: disable selinux for native builds
  quota_4.01.bb: add e2fsprogs in DEPENDS
  libpfm4_4.3.0.bb: add libpfm4 recipe needed by oprofile for ppc
  oprofile: fix cross compile on powerpc and add libpfm4 dep

Paul Eggleton (1):
  qmmp: update to 0.6.6 and fix

Roy.Li (1):
  tcp-wrappers: remove size_t.patch

 meta/classes/core-image.bbclass                    |   4 +
 meta/classes/fontcache.bbclass                     |  47 ++
 meta/classes/image.bbclass                         |  22 +
 meta/classes/package_ipk.bbclass                   |   6 +-
 meta/classes/qemu.bbclass                          |   6 +-
 meta/classes/rootfs_ipk.bbclass                    |  18 +-
 meta/lib/oe/classextend.py                         |   9 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb      |   2 +-
 meta/recipes-core/glib-2.0/glib.inc                |   2 +-
 .../initscripts/initscripts-1.0/bootmisc.sh        |   9 +-
 .../initscripts-1.0/populate-volatile.sh           | 287 ++++----
 .../initscripts-1.0/read-only-rootfs-hook.sh       |  19 +
 .../initscripts/initscripts-1.0/volatiles          |   1 +
 meta/recipes-core/initscripts/initscripts_1.0.bb   |   3 +
 meta/recipes-core/sysvinit/sysvinit/rcS-default    |   4 +
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   2 +-
 .../intltool-nowarn.patch}                         |   0
 .../noperlcheck.patch                              |  14 +-
 .../remove-xml-check.patch                         |   0
 .../use-nativeperl.patch                           |   0
 .../{intltool_0.50.0.bb => intltool_0.50.2.bb}     |   8 +-
 meta/recipes-devtools/opkg/opkg-collateral.bb      |   6 +-
 meta/recipes-devtools/opkg/opkg-collateral/lists   |   2 -
 meta/recipes-devtools/opkg/opkg.inc                |  25 +-
 .../opkg/opkg/obsolete_automake_macros.patch       |  15 +
 meta/recipes-devtools/opkg/opkg_svn.bb             |   1 +
 .../recipes-devtools/qemu/qemuwrapper-cross_1.0.bb |  14 +
 .../net-tools-config.h                             |   0
 .../net-tools-config.make                          |   0
 ...net-tools_1.60-23.bb => net-tools_1.60-24.2.bb} |   6 +-
 meta/recipes-extended/quota/quota_4.01.bb          |   4 +-
 .../rpcbind/rpcbind/obsolete_automake_macros.patch |  14 +
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb     |   3 +-
 .../tcp-wrappers/tcp-wrappers-7.6/size_t.patch     |  44 --
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |   3 +-
 .../fontconfig/fontconfig-2.10.2/97_fontconfig     |   1 -
 ...Add-sysroot-option-to-fc-cache-and-fc-cat.patch | 731 +++++++++++++++++++++
 .../fontconfig/fontconfig_2.10.2.bb                |  13 +-
 .../matchbox-wm/matchbox-wm_git.bb                 |   4 +-
 .../ttf-fonts/liberation-fonts_1.04.bb             |  14 +-
 meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb        |  26 +
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |  48 ++
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |   8 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |  18 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |   6 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb       |   8 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |  28 +-
 .../0001-fix-powerpc-cross-compiling.patch         |  35 +
 meta/recipes-kernel/oprofile/oprofile_0.9.8.bb     |   7 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   7 +-
 meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch   |  25 +
 .../qt-apps/qmmp/no-sessionmanager.patch           |  21 +
 .../qt-apps/{qmmp_0.6.1.bb => qmmp_0.6.6.bb}       |  39 +-
 scripts/send-pull-request                          |  13 +-
 54 files changed, 1325 insertions(+), 327 deletions(-)
 create mode 100644 meta/classes/fontcache.bbclass
 create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
 rename meta/recipes-devtools/intltool/{intltool-0.50.0/intltool-nowarn-0.50.0.patch => intltool-0.50.2/intltool-nowarn.patch} (100%)
 rename meta/recipes-devtools/intltool/{intltool-0.50.0 => intltool-0.50.2}/noperlcheck.patch (77%)
 rename meta/recipes-devtools/intltool/{intltool-0.50.0 => intltool-0.50.2}/remove-xml-check.patch (100%)
 rename meta/recipes-devtools/intltool/{intltool-0.50.0 => intltool-0.50.2}/use-nativeperl.patch (100%)
 rename meta/recipes-devtools/intltool/{intltool_0.50.0.bb => intltool_0.50.2.bb} (71%)
 delete mode 100644 meta/recipes-devtools/opkg/opkg-collateral/lists
 create mode 100644 meta/recipes-devtools/opkg/opkg/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
 rename meta/recipes-extended/net-tools/{net-tools-1.60-23 => net-tools-1.60-24.2}/net-tools-config.h (100%)
 rename meta/recipes-extended/net-tools/{net-tools-1.60-23 => net-tools-1.60-24.2}/net-tools-config.make (100%)
 rename meta/recipes-extended/net-tools/{net-tools_1.60-23.bb => net-tools_1.60-24.2.bb} (94%)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/size_t.patch
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig-2.10.2/97_fontconfig
 create mode 100644 meta/recipes-graphics/fontconfig/fontconfig-2.10.2/Add-sysroot-option-to-fc-cache-and-fc-cat.patch
 create mode 100644 meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-dev.bb
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-fix-powerpc-cross-compiling.patch
 create mode 100644 meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch
 create mode 100644 meta/recipes-qt/qt-apps/qmmp/no-sessionmanager.patch
 rename meta/recipes-qt/qt-apps/{qmmp_0.6.1.bb => qmmp_0.6.6.bb} (56%)

-- 
1.8.0.2



