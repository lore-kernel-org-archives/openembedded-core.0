Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UXd5B-00055R-I8
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 21:52:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 May 2013 12:34:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,590,1363158000"; d="scan'208";a="296113917"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.170])
	by azsmga001.ch.intel.com with ESMTP; 01 May 2013 12:34:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 May 2013 12:34:58 -0700
Message-Id: <cover.1367435510.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/19] Misc Fixes
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
X-List-Received-Date: Wed, 01 May 2013 19:52:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

This is a set of fixes that I have put through the Autobuilder and tested
some locally.

I will supply another patch for the udev series to add udev-extraconf into
core-image-lsb (after I test it).

The patch from Robert to create links instead of copying looks correct, but 
could use your eyes please.

Thanks 
	Sau!




The following changes since commit e86538db13605953465aacc3f2fb7d719dad919e:

  neard: add systemd unit file (2013-04-29 15:31:39 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andreas Müller (3):
  systemd: do not recommend udev-extraconf for udev
  udev: do not recommend udev-extraconf
  core-image-sato: add udev-extraconf

Cristian Iorga (1):
  netbase: upgrade to 5.1

Darren Hart (1):
  mkefidisk: Unmount after partitioning

Jessica Zhang (1):
  Make toolchain output name using SDK_VERSION instead of DISTRO_VERSION
    to be consistent [yocto #2342]

Jonathan Liu (1):
  syslinux: Update to 4.06

Laurentiu Palcu (1):
  adt-installer: do not dereference symlinks when relocating

Martin Jansa (1):
  tune-thumb.inc: Remove, replaced by arm/feature-arm-thumb.inc

Paul Eggleton (5):
  sysvinit-inittab: ensure unique label for SERIAL_CONSOLES entries
  bitbake.conf: set SERIAL_CONSOLES from SERIAL_CONSOLE by default
  sysvinit-inittab: remove specific handling of SERIAL_CONSOLE
  shadow-securetty: change to handle SERIAL_CONSOLES
  systemd-serialgetty: change to handle SERIAL_CONSOLES

Phil Blundell (3):
  xkeyboard-config: Remove xkbcomp from RDEPENDS_${PN}
  image.bbclass: Don't mark do_rootfs and do_build as nostamp
  qt4: Fix sundry erroneous assumptions about ${prefix}

Richard Purdie (1):
  dpkg: Ensure target packages don't reference perlnative

Robert Yang (1):
  sstate.bbclass: make hard links for staging files

 meta/classes/boot-directdisk.bbclass               |   2 +-
 meta/classes/image.bbclass                         |   2 -
 meta/classes/populate_sdk_base.bbclass             |   2 +-
 meta/classes/sstate.bbclass                        |   2 +-
 meta/conf/bitbake.conf                             |   3 +
 meta/conf/machine/include/tune-thumb.inc           |  32 -
 meta/lib/oe/path.py                                |   9 +-
 .../netbase/{netbase-5.0 => netbase}/hosts         |   0
 .../netbase/{netbase_5.0.bb => netbase_5.1.bb}     |   5 +-
 meta/recipes-core/systemd/systemd-serialgetty.bb   |  45 +-
 meta/recipes-core/systemd/systemd_199.bb           |   4 +-
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |  11 +-
 meta/recipes-core/udev/udev.inc                    |   2 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |   1 +
 .../adt-installer/scripts/adt_installer_internal   |   2 +-
 .../syslinux/files/cross-build.patch               |  71 --
 .../libinstaller-Avoid-using-linux-ext2_fs.h.patch | 975 ---------------------
 .../recipes-devtools/syslinux/files/no-strip.patch |  31 -
 .../{syslinux_4.03.bb => syslinux_4.06.bb}         |  25 +-
 .../shadow/shadow-securetty_4.1.4.3.bb             |  20 +-
 .../xorg-lib/xkeyboard-config_2.8.bb               |   1 -
 meta/recipes-qt/qt4/qt4-4.8.4.inc                  |   4 +-
 meta/recipes-qt/qt4/qt4.inc                        |   2 +-
 meta/recipes-sato/images/core-image-sato.bb        |   2 +-
 scripts/contrib/mkefidisk.sh                       |  32 +-
 25 files changed, 95 insertions(+), 1190 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-thumb.inc
 rename meta/recipes-core/netbase/{netbase-5.0 => netbase}/hosts (100%)
 rename meta/recipes-core/netbase/{netbase_5.0.bb => netbase_5.1.bb} (83%)
 delete mode 100644 meta/recipes-devtools/syslinux/files/cross-build.patch
 delete mode 100644 meta/recipes-devtools/syslinux/files/libinstaller-Avoid-using-linux-ext2_fs.h.patch
 delete mode 100644 meta/recipes-devtools/syslinux/files/no-strip.patch
 rename meta/recipes-devtools/syslinux/{syslinux_4.03.bb => syslinux_4.06.bb} (70%)

-- 
1.8.0.2



