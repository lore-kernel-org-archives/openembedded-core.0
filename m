Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T7rAm-0008Mh-T2
	for openembedded-core@lists.openembedded.org;
	Sat, 01 Sep 2012 19:07:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Sep 2012 09:55:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,353,1344236400"; d="scan'208";a="187948441"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.251])
	by orsmga001.jf.intel.com with ESMTP; 01 Sep 2012 09:55:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Sep 2012 09:55:32 -0700
Message-Id: <cover.1346518017.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED REQUEST 00/24] Accumlated Fixes
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
X-List-Received-Date: Sat, 01 Sep 2012 17:07:53 -0000

Cover Letter ONLY

Richard,

Here is a set of patches that I have tested on AB
and reviewed. 

** If you pull the kdrive removal you need to pull the 
** assocated changes for meta-yocto (see that email)

I am not sure if it's the sstate changes or something
latent in the system, but there has been a SSTATE issue
with gcc-cross-initial and eglibc-initial getting the wrong
limits.h somehow, Khem and I discussed it yesterday, doing
a cleansstate on gcc-cross-initial cleaned it but it seems
to have come back again (see MUT on the AB).

Sau!


The following changes since commit c2109b765b24a7ffe4781257ad3fe4641a3b2a49:

  sstate: Ensure master.list exists if it doesn't already (2012-08-30 22:44:52 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Constantin Musca (1):
  dpkg: upgrade to 1.16.8

Khem Raj (5):
  uclibc-git: Move to tip of master and sync mount.h
  eglibc: Bring in the fix for glibc bug #14459, #14195
  elfutils: Fix build on uclibc
  pulseaudio: Always enable NLS
  ofono: Fix build on uclibc

Paul Eggleton (1):
  gettext: bump PR to avoid RPATH QA failure

Richard Purdie (5):
  nativesdk: Convert to use classextend.py
  nativesdk: Switch to using nativesdk as a prefix, not a suffix
  perl: Fix various nativesdk build issues
  image.bbclass: Convert runtime_mapping_rename to event handler
  sstate.bbclass: Remove hardcoded task mappings

Ross Burton (6):
  tzdata: install /etc/localtime alongside /etc/timezone
  xserver-xorg: ship the exa module in a separate package
  task-core-x11: default to xserver-xorg instead of kdrive
  x11-common: just support Xorg now that kdrive has been removed
  x11-common: don't prune .svn directories on install, we're in git now
  xserver-kdrive: remove.

Sander van Grieken (1):
  avahi: systemd postinst and postrm removed in favor of using
    systemd.bbclass

Saul Wold (3):
  kernelshark: remove duplicate trace-cmd plugins
  connman: Don't start connmand when booting using nfsroot
  eglibc: remove duplicate rquota files

Tom Zanussi (1):
  crosstap: new script

Tomas Frydrych (1):
  package.bbclass: fix stripping for kernel modules

 meta/classes/base.bbclass                          |   17 +-
 meta/classes/cross-canadian.bbclass                |    2 +-
 meta/classes/distrodata.bbclass                    |    6 +-
 meta/classes/image.bbclass                         |   13 +-
 meta/classes/insane.bbclass                        |    4 +-
 meta/classes/nativesdk.bbclass                     |   51 +--
 meta/classes/package.bbclass                       |    2 +-
 meta/classes/package_rpm.bbclass                   |    2 +-
 meta/classes/pkgconfig.bbclass                     |    2 +-
 meta/classes/populate_sdk.bbclass                  |    1 +
 meta/classes/populate_sdk_base.bbclass             |    2 +-
 meta/classes/sstate.bbclass                        |   18 +-
 meta/conf/bitbake.conf                             |    4 +-
 meta/conf/distro/include/default-providers.inc     |    6 +-
 meta/conf/distro/include/tclibc-eglibc.inc         |    4 +-
 meta/conf/distro/include/tcmode-default.inc        |   14 +-
 meta/lib/oe/classextend.py                         |    4 +
 meta/lib/oe/sstatesig.py                           |    2 +-
 meta/recipes-connectivity/avahi/avahi.inc          |   19 -
 meta/recipes-connectivity/connman/connman.inc      |    2 +-
 meta/recipes-connectivity/connman/connman/connman  |    5 +-
 meta/recipes-connectivity/ofono/ofono_1.10.bb      |    4 +-
 meta/recipes-core/dbus/dbus.inc                    |    2 +-
 .../eglibc/eglibc-2.16/rpc-bootstrap.patch         |   63 ---
 meta/recipes-core/eglibc/eglibc-locale.inc         |   15 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |   54 +-
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    5 +-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb      |    2 +-
 meta/recipes-core/glib-2.0/glib.inc                |    2 +-
 meta/recipes-core/meta/external-python-tarball.bb  |   38 +-
 ...ost-nativesdk.bb => nativesdk-task-sdk-host.bb} |   24 +-
 meta/recipes-core/uclibc/uclibc-git.inc            |    5 +-
 .../uclibc/uclibc-git/mount.h-update.patch         |   83 ++++
 meta/recipes-core/uclibc/uclibc_git.bb             |    2 -
 meta/recipes-devtools/autoconf/autoconf.inc        |    4 +-
 meta/recipes-devtools/automake/automake_1.12.1.bb  |    2 +-
 .../binutils/binutils-cross-canadian.inc           |    2 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |    4 +-
 meta/recipes-devtools/dpkg/dpkg/autofoo.patch      |   50 --
 .../recipes-devtools/dpkg/dpkg/check_version.patch |   23 +-
 .../dpkg/dpkg/dpkg-deb-avoid-fflush.patch          |  198 --------
 .../dpkg/dpkg/fix-timestamps.patch                 |   21 +
 .../dpkg/dpkg/ignore_extra_fields.patch            |   35 +-
 meta/recipes-devtools/dpkg/dpkg/nochroot.patch     |   20 -
 meta/recipes-devtools/dpkg/dpkg/noman.patch        |    1 -
 meta/recipes-devtools/dpkg/dpkg/noupdalt.patch     |   18 -
 meta/recipes-devtools/dpkg/dpkg/perllibdir.patch   |   22 -
 meta/recipes-devtools/dpkg/dpkg/preinst.patch      |   75 ++--
 .../dpkg/dpkg/remove-tar-no-timestamp.patch        |   16 +
 .../dpkg/{dpkg_1.15.8.7.bb => dpkg_1.16.8.bb}      |   10 +-
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    8 +-
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc   |    2 +-
 .../recipes-devtools/gcc/gcc-cross-canadian_4.7.bb |    4 +-
 meta/recipes-devtools/gcc/gcc-crosssdk.inc         |    2 +-
 meta/recipes-devtools/gcc/libgcc_4.7.bb            |    9 +-
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |    7 +-
 .../gnu-config/gnu-config_20111111.bb              |    2 +-
 meta/recipes-devtools/gnu-config/gnu-config_git.bb |    2 +-
 .../adt-installer/scripts/adt_installer_internal   |    8 +-
 meta/recipes-devtools/opkg/opkg.inc                |   15 +-
 meta/recipes-devtools/perl/perl_5.14.2.bb          |   12 +-
 meta/recipes-devtools/python/python_2.7.3.bb       |    9 +-
 ...tivesdk_1.0.bb => nativesdk-qemu-helper_1.0.bb} |    2 +-
 meta/recipes-devtools/qemu/qemu.inc                |    6 +-
 .../unfs-server/unfs-server_2.1+2.2beta47.bb       |    4 +-
 meta/recipes-extended/bash/bash_4.2.bb             |    1 +
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |    3 +-
 meta/recipes-extended/tzdata/tzdata_2012d.bb       |    3 +-
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    2 +-
 meta/recipes-graphics/mesa/qemugl_git.bb           |    2 +-
 .../x11-common/x11-common/etc/X11/Xserver          |   43 +--
 meta/recipes-graphics/x11-common/x11-common_0.1.bb |    3 +-
 .../xserver-kdrive-1.7.99.2/crosscompile.patch     |   23 -
 .../xserver-kdrive-1.7.99.2/disable-apm.patch      |   24 -
 .../enable-builtin-fonts.patch                     |   16 -
 .../enable-xcalibrate.patch                        |  152 ------
 .../error-address-work-around.patch                |  364 --------------
 .../xserver-kdrive-1.7.99.2/extra-kmodes.patch     |   87 ----
 .../fbdev_xrandr_ioctl.patch                       |   65 ---
 .../fix-bogus-stack-variables.patch                |  233 ---------
 .../fix-newer-xorg-headers.patch                   |   22 -
 .../hide-cursor-and-ppm-root.patch                 |  312 ------------
 .../xserver-kdrive-1.7.99.2/kdrive-evdev.patch     |  520 --------------------
 .../xserver-kdrive-1.7.99.2/kdrive-use-evdev.patch |   58 ---
 .../keyboard-resume-workaround.patch               |   29 --
 .../no-serial-probing.patch                        |   17 -
 .../xserver-kdrive-1.7.99.2/nodolt.patch           |   16 -
 .../xserver-kdrive-1.7.99.2/optional-xkb.patch     |   62 ---
 .../xorg-xserver/xserver-kdrive.inc                |  113 -----
 .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |   34 --
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    2 +-
 .../xorg-xserver/xserver-xorg-common.inc           |    3 +
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    2 +-
 meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |    6 +-
 meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb    |   17 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    4 +
 .../pulseaudio/pulseaudio_2.1.bb                   |    2 +-
 meta/recipes-qt/meta/meta-toolchain-qte.bb         |    2 +-
 meta/recipes-qt/qt4/files/qt-dbus-const.patch      |    2 +-
 ...vesdk_4.8.1.bb => nativesdk-qt4-tools_4.8.1.bb} |    0
 ...sdk.bb => nativesdk-task-qte-toolchain-host.bb} |    4 +-
 meta/recipes-sato/tasks/task-core-x11-mini.bb      |    4 +-
 meta/recipes-sato/tasks/task-core-x11.bb           |    4 +-
 meta/recipes-support/curl/curl_7.26.0.bb           |    2 +-
 meta/recipes-support/sqlite/sqlite3.inc            |   15 +-
 scripts/crosstap                                   |  148 ++++++
 107 files changed, 586 insertions(+), 2909 deletions(-)
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/rpc-bootstrap.patch
 rename meta/recipes-core/tasks/{task-sdk-host-nativesdk.bb => nativesdk-task-sdk-host.bb} (63%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/mount.h-update.patch
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/autofoo.patch
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-deb-avoid-fflush.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/fix-timestamps.patch
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/nochroot.patch
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/noupdalt.patch
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/perllibdir.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
 rename meta/recipes-devtools/dpkg/{dpkg_1.15.8.7.bb => dpkg_1.16.8.bb} (49%)
 rename meta/recipes-devtools/qemu/{qemu-helper-nativesdk_1.0.bb => nativesdk-qemu-helper_1.0.bb} (98%)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/disable-apm.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/enable-builtin-fonts.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/enable-xcalibrate.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/error-address-work-around.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/extra-kmodes.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fbdev_xrandr_ioctl.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogus-stack-variables.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-newer-xorg-headers.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/hide-cursor-and-ppm-root.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/kdrive-evdev.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/kdrive-use-evdev.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/keyboard-resume-workaround.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/no-serial-probing.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/nodolt.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/optional-xkb.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
 rename meta/recipes-qt/qt4/{qt4-tools-nativesdk_4.8.1.bb => nativesdk-qt4-tools_4.8.1.bb} (100%)
 rename meta/recipes-qt/tasks/{task-qte-toolchain-host-nativesdk.bb => nativesdk-task-qte-toolchain-host.bb} (47%)
 create mode 100755 scripts/crosstap

-- 
1.7.7.6



