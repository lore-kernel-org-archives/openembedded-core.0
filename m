Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 0559C60144
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 21:53:23 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Aug 2014 14:53:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,807,1400050800"; d="scan'208";a="465336854"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by azsmga001.ch.intel.com with ESMTP; 05 Aug 2014 14:53:17 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Aug 2014 16:53:08 -0500
Message-Id: <cover.1407273755.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 00/24] wic: Remove unused code
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
X-List-Received-Date: Tue, 05 Aug 2014 21:53:27 -0000

This patchset removes most of code inherited from mic but sitting
essentially unused.

There's no reason to be carrying it around other than some vague
intention of reusing it, but that can still be done - anything needed
can alwayse be added back.

As it stands, it's only taking up space and obscuring a clear view of
what's actually used.

Removing the bsp subdir from scripts/lib, and taking a size
measurement using 'du -bh lib', we get:

before:
  1.2M  lib

after:
  393K  lib

More than half the code remaining after this exercise belongs to the parser
and related code, which could presumably be simplified by future patches.

[NOTE: the patches in this patchset are too large to post, see URLs
below for the actual patches]

The following changes since commit 4a226369b7bb37a971c77d4abc88df81033f56c5:

  dev-manual: Updates for checksums and wic (2014-08-02 10:00:26 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-diet-phase1-v0
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/wic-diet-phase1-v0

Tom Zanussi (24):
  wic: Make exec_cmd() error out instead of warn
  wic: Remove unused custom commands
  wic: Remove packaging, config commands
  wic: Remove mic bootstrap
  wic: Remove mic chroot
  wic: Remove rt_util
  wic: Remove mic package managers
  wic: Remove bmap support
  wic: Remove fiemap support
  wic: Remove grabber implementation
  wic: Remove proxy support
  wic: Remove rpmmisc
  wic: Remove unused fs_related code
  wic: Remove unused misc code
  wic: Remove 3rdparty/urlgrabber
  wic: Remove unused 3rdparty/commands
  wic: Remove gpt_parser
  wic: Remove unused plugin and error code
  wic: Clean up BaseImageCreator
  wic: Clean up DirectImageCreator
  wic: Clean up PartitionedMount
  wic: Clean up Creator
  wic: Remove unused command versioning support
  wic: Update 'Background and Motivation' help section

 scripts/lib/image/help.py                          |   14 +-
 .../mic/3rdparty/pykickstart/commands/__init__.py  |    8 +-
 .../3rdparty/pykickstart/commands/authconfig.py    |   40 -
 .../mic/3rdparty/pykickstart/commands/autopart.py  |  119 --
 .../mic/3rdparty/pykickstart/commands/autostep.py  |   55 -
 .../3rdparty/pykickstart/commands/bootloader.py    |   49 -
 .../mic/3rdparty/pykickstart/commands/clearpart.py |   86 --
 .../mic/3rdparty/pykickstart/commands/device.py    |  125 --
 .../3rdparty/pykickstart/commands/deviceprobe.py   |   40 -
 .../3rdparty/pykickstart/commands/displaymode.py   |   68 -
 .../mic/3rdparty/pykickstart/commands/dmraid.py    |   91 --
 .../3rdparty/pykickstart/commands/driverdisk.py    |  184 ---
 .../lib/mic/3rdparty/pykickstart/commands/fcoe.py  |  114 --
 .../mic/3rdparty/pykickstart/commands/firewall.py  |  193 ---
 .../mic/3rdparty/pykickstart/commands/firstboot.py |   62 -
 .../lib/mic/3rdparty/pykickstart/commands/group.py |   88 --
 .../3rdparty/pykickstart/commands/ignoredisk.py    |  139 --
 .../3rdparty/pykickstart/commands/interactive.py   |   58 -
 .../lib/mic/3rdparty/pykickstart/commands/iscsi.py |  133 --
 .../mic/3rdparty/pykickstart/commands/iscsiname.py |   54 -
 .../lib/mic/3rdparty/pykickstart/commands/key.py   |   64 -
 .../mic/3rdparty/pykickstart/commands/keyboard.py  |   55 -
 .../lib/mic/3rdparty/pykickstart/commands/lang.py  |   60 -
 .../3rdparty/pykickstart/commands/langsupport.py   |   58 -
 .../mic/3rdparty/pykickstart/commands/lilocheck.py |   54 -
 .../mic/3rdparty/pykickstart/commands/logging.py   |   66 -
 .../mic/3rdparty/pykickstart/commands/logvol.py    |  304 ----
 .../3rdparty/pykickstart/commands/mediacheck.py    |   53 -
 .../mic/3rdparty/pykickstart/commands/method.py    |  186 ---
 .../mic/3rdparty/pykickstart/commands/monitor.py   |  106 --
 .../lib/mic/3rdparty/pykickstart/commands/mouse.py |   70 -
 .../mic/3rdparty/pykickstart/commands/multipath.py |  111 --
 .../mic/3rdparty/pykickstart/commands/network.py   |  363 -----
 .../mic/3rdparty/pykickstart/commands/partition.py |   39 -
 .../lib/mic/3rdparty/pykickstart/commands/raid.py  |  365 -----
 .../mic/3rdparty/pykickstart/commands/reboot.py    |   79 --
 .../lib/mic/3rdparty/pykickstart/commands/repo.py  |  249 ----
 .../mic/3rdparty/pykickstart/commands/rescue.py    |   68 -
 .../mic/3rdparty/pykickstart/commands/rootpw.py    |   93 --
 .../mic/3rdparty/pykickstart/commands/selinux.py   |   64 -
 .../mic/3rdparty/pykickstart/commands/services.py  |   71 -
 .../lib/mic/3rdparty/pykickstart/commands/skipx.py |   54 -
 .../lib/mic/3rdparty/pykickstart/commands/sshpw.py |  105 --
 .../mic/3rdparty/pykickstart/commands/timezone.py  |   86 --
 .../mic/3rdparty/pykickstart/commands/updates.py   |   60 -
 .../mic/3rdparty/pykickstart/commands/upgrade.py   |  106 --
 .../lib/mic/3rdparty/pykickstart/commands/user.py  |  173 ---
 .../lib/mic/3rdparty/pykickstart/commands/vnc.py   |  114 --
 .../mic/3rdparty/pykickstart/commands/volgroup.py  |  102 --
 .../mic/3rdparty/pykickstart/commands/xconfig.py   |  184 ---
 .../mic/3rdparty/pykickstart/commands/zerombr.py   |   69 -
 .../lib/mic/3rdparty/pykickstart/commands/zfcp.py  |  134 --
 .../mic/3rdparty/pykickstart/handlers/control.py   | 1261 -----------------
 .../lib/mic/3rdparty/pykickstart/handlers/f10.py   |   24 -
 .../lib/mic/3rdparty/pykickstart/handlers/f11.py   |   24 -
 .../lib/mic/3rdparty/pykickstart/handlers/f12.py   |   24 -
 .../lib/mic/3rdparty/pykickstart/handlers/f13.py   |   24 -
 .../lib/mic/3rdparty/pykickstart/handlers/f14.py   |   24 -
 .../lib/mic/3rdparty/pykickstart/handlers/f15.py   |   24 -
 .../lib/mic/3rdparty/pykickstart/handlers/f7.py    |   24 -
 .../lib/mic/3rdparty/pykickstart/handlers/f8.py    |   24 -
 .../lib/mic/3rdparty/pykickstart/handlers/f9.py    |   24 -
 .../lib/mic/3rdparty/pykickstart/handlers/fc3.py   |   24 -
 .../lib/mic/3rdparty/pykickstart/handlers/fc4.py   |   24 -
 .../lib/mic/3rdparty/pykickstart/handlers/fc5.py   |   24 -
 .../lib/mic/3rdparty/pykickstart/handlers/fc6.py   |   24 -
 .../lib/mic/3rdparty/pykickstart/handlers/rhel3.py |   24 -
 .../lib/mic/3rdparty/pykickstart/handlers/rhel4.py |   24 -
 .../lib/mic/3rdparty/pykickstart/handlers/rhel5.py |   24 -
 .../lib/mic/3rdparty/pykickstart/handlers/rhel6.py |   24 -
 .../3rdparty/pykickstart/urlgrabber/__init__.py    |   53 -
 .../3rdparty/pykickstart/urlgrabber/byterange.py   |  463 ------
 .../mic/3rdparty/pykickstart/urlgrabber/grabber.py | 1477 --------------------
 .../3rdparty/pykickstart/urlgrabber/keepalive.py   |  617 --------
 .../mic/3rdparty/pykickstart/urlgrabber/mirror.py  |  458 ------
 .../3rdparty/pykickstart/urlgrabber/progress.py    |  530 -------
 .../3rdparty/pykickstart/urlgrabber/sslfactory.py  |   90 --
 scripts/lib/mic/bootstrap.py                       |  279 ----
 scripts/lib/mic/chroot.py                          |  343 -----
 scripts/lib/mic/conf.py                            |   58 +-
 scripts/lib/mic/creator.py                         |  176 +--
 scripts/lib/mic/imager/baseimager.py               | 1030 +-------------
 scripts/lib/mic/imager/direct.py                   |   10 +-
 scripts/lib/mic/imager/fs.py                       |   99 --
 scripts/lib/mic/imager/livecd.py                   |  750 ----------
 scripts/lib/mic/imager/liveusb.py                  |  308 ----
 scripts/lib/mic/imager/loop.py                     |  418 ------
 scripts/lib/mic/imager/raw.py                      |  501 -------
 scripts/lib/mic/kickstart/__init__.py              |  769 +---------
 .../lib/mic/kickstart/custom_commands/__init__.py  |    7 -
 .../lib/mic/kickstart/custom_commands/desktop.py   |   95 --
 .../mic/kickstart/custom_commands/installerfw.py   |   63 -
 .../lib/mic/kickstart/custom_commands/micrepo.py   |  127 --
 .../lib/mic/kickstart/custom_commands/partition.py |   44 +-
 scripts/lib/mic/plugin.py                          |    2 +-
 scripts/lib/mic/pluginbase.py                      |   45 +-
 scripts/lib/mic/plugins/backend/yumpkgmgr.py       |  490 -------
 scripts/lib/mic/plugins/backend/zypppkgmgr.py      |  973 -------------
 scripts/lib/mic/plugins/hook/.py                   |    0
 scripts/lib/mic/plugins/hook/empty_hook.py         |    3 -
 scripts/lib/mic/plugins/imager/direct_plugin.py    |    7 +-
 scripts/lib/mic/plugins/imager/fs_plugin.py        |  143 --
 scripts/lib/mic/plugins/imager/livecd_plugin.py    |  255 ----
 scripts/lib/mic/plugins/imager/liveusb_plugin.py   |  260 ----
 scripts/lib/mic/plugins/imager/loop_plugin.py      |  255 ----
 scripts/lib/mic/plugins/imager/raw_plugin.py       |  275 ----
 scripts/lib/mic/plugins/source/bootimg-efi.py      |   14 +-
 scripts/lib/mic/plugins/source/bootimg-pcbios.py   |   20 +-
 scripts/lib/mic/plugins/source/rootfs.py           |    2 +-
 scripts/lib/mic/rt_util.py                         |  223 ---
 scripts/lib/mic/utils/BmapCreate.py                |  298 ----
 scripts/lib/mic/utils/Fiemap.py                    |  252 ----
 scripts/lib/mic/utils/errors.py                    |   21 -
 scripts/lib/mic/utils/fs_related.py                |  932 +-----------
 scripts/lib/mic/utils/gpt_parser.py                |  331 -----
 scripts/lib/mic/utils/grabber.py                   |   97 --
 scripts/lib/mic/utils/misc.py                      |  962 +------------
 scripts/lib/mic/utils/oe/misc.py                   |   33 +-
 scripts/lib/mic/utils/partitionedfs.py             |  415 +-----
 scripts/lib/mic/utils/proxy.py                     |  183 ---
 scripts/lib/mic/utils/rpmmisc.py                   |  600 --------
 121 files changed, 94 insertions(+), 22916 deletions(-)
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/authconfig.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/autopart.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/autostep.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/clearpart.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/device.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/deviceprobe.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/displaymode.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/dmraid.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/driverdisk.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/fcoe.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/firewall.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/firstboot.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/group.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/ignoredisk.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/interactive.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/iscsi.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/iscsiname.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/key.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/keyboard.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/lang.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/langsupport.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/lilocheck.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/logging.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/logvol.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/mediacheck.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/method.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/monitor.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/mouse.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/multipath.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/network.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/raid.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/reboot.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/repo.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/rescue.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/rootpw.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/selinux.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/services.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/skipx.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/sshpw.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/timezone.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/updates.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/upgrade.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/user.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/vnc.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/volgroup.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/xconfig.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/zerombr.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/zfcp.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f10.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f11.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f12.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f13.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f14.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f15.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f7.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f8.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f9.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc3.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc4.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc5.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc6.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rhel3.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rhel4.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rhel5.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rhel6.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/__init__.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/byterange.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/grabber.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/keepalive.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/mirror.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/progress.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/sslfactory.py
 delete mode 100644 scripts/lib/mic/bootstrap.py
 delete mode 100644 scripts/lib/mic/chroot.py
 delete mode 100644 scripts/lib/mic/imager/fs.py
 delete mode 100644 scripts/lib/mic/imager/livecd.py
 delete mode 100644 scripts/lib/mic/imager/liveusb.py
 delete mode 100644 scripts/lib/mic/imager/loop.py
 delete mode 100644 scripts/lib/mic/imager/raw.py
 delete mode 100644 scripts/lib/mic/kickstart/custom_commands/desktop.py
 delete mode 100644 scripts/lib/mic/kickstart/custom_commands/installerfw.py
 delete mode 100644 scripts/lib/mic/kickstart/custom_commands/micrepo.py
 delete mode 100644 scripts/lib/mic/plugins/backend/yumpkgmgr.py
 delete mode 100755 scripts/lib/mic/plugins/backend/zypppkgmgr.py
 delete mode 100644 scripts/lib/mic/plugins/hook/.py
 delete mode 100644 scripts/lib/mic/plugins/hook/empty_hook.py
 delete mode 100644 scripts/lib/mic/plugins/imager/fs_plugin.py
 delete mode 100644 scripts/lib/mic/plugins/imager/livecd_plugin.py
 delete mode 100644 scripts/lib/mic/plugins/imager/liveusb_plugin.py
 delete mode 100644 scripts/lib/mic/plugins/imager/loop_plugin.py
 delete mode 100644 scripts/lib/mic/plugins/imager/raw_plugin.py
 delete mode 100644 scripts/lib/mic/rt_util.py
 delete mode 100644 scripts/lib/mic/utils/BmapCreate.py
 delete mode 100644 scripts/lib/mic/utils/Fiemap.py
 delete mode 100644 scripts/lib/mic/utils/gpt_parser.py
 delete mode 100644 scripts/lib/mic/utils/grabber.py
 delete mode 100644 scripts/lib/mic/utils/proxy.py
 delete mode 100644 scripts/lib/mic/utils/rpmmisc.py

-- 
1.8.3.1


