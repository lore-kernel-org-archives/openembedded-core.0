Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F357660169
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:06:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Aug 2014 15:00:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="555927834"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by orsmga001.jf.intel.com with ESMTP; 08 Aug 2014 15:05:59 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:54 -0500
Message-Id: <cover.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 00/35] wic: diet and refactor
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
X-List-Received-Date: Fri, 08 Aug 2014 22:06:06 -0000

This patchset refactors wic to have the code better reflect what it
actually does, rather than look like something shoehorned into the
existing mic codebase, which is essentially what it was.

It also removes most of code inherited from mic but sitting
essentially unused; there's no reason to be carrying it around other
than some vague intention of reusing it, but that can still be done -
anything needed can always be added back.  As it stands, it's only
taking up space and obscuring a clear view of what's actually used.

Removing the bsp subdir from scripts/lib, and taking a size
measurement using 'du -bh lib', we get:

before:
  1.2M  lib

after:
  385K  lib

About half the code remaining after this exercise belongs to the
parser and related infrastructure, which could be drop-in replaced by
something lighter:

116K	    lib/wic/3rdparty
7.9K	    lib/wic/msger.py
3.2K	    lib/wic/conf.py
3.1K	    lib/wic/utils/runner.py
57K	    lib/wic/utils/cmdln.py
1.6K	    lib/wic/utils/errors.py

And about 50k of it is wic command boilerplate and help text patterned
after other tools in yocto such as yocto-bsp:

52K	    lib/image

That leaves about 150k related to the actual image creation
infrastructure, which should be much more easily digestible than the
previous code.

[NOTE: this patchset supersedes the 'phase1' patchset ('[PATCH 00/24]
wic: Remove unused code') from Aug 5.]

The following changes since commit 4a226369b7bb37a971c77d4abc88df81033f56c5:

  dev-manual: Updates for checksums and wic (2014-08-02 10:00:26 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-diet-v1
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/wic-diet-v1

Tom Zanussi (35):
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
  wic: Remove unused conf support
  wic: Remove Mount object
  wic: Update/rename/delete mount-related code
  wic: Update cleanup/unmount-related code
  wic: Update/rename install-related code
  wic: Update/rename configure-related code
  wic: Rename PartitionedMount
  wic: Rename MountError
  wic: Update Disk description
  wic: Rename /mic to /wic
  wic: Bump the version to 2.0

 scripts/lib/image/config/wic.conf                  |    1 -
 scripts/lib/image/engine.py                        |   12 +-
 scripts/lib/image/help.py                          |   22 +-
 .../mic/3rdparty/pykickstart/commands/__init__.py  |   26 -
 .../3rdparty/pykickstart/commands/authconfig.py    |   40 -
 .../mic/3rdparty/pykickstart/commands/autopart.py  |  119 --
 .../mic/3rdparty/pykickstart/commands/autostep.py  |   55 -
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
 .../mic/3rdparty/pykickstart/handlers/control.py   | 1307 -----------------
 .../lib/mic/3rdparty/pykickstart/handlers/f10.py   |   24 -
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
 scripts/lib/mic/__version__.py                     |    1 -
 scripts/lib/mic/bootstrap.py                       |  279 ----
 scripts/lib/mic/chroot.py                          |  343 -----
 scripts/lib/mic/imager/baseimager.py               | 1263 -----------------
 scripts/lib/mic/imager/fs.py                       |   99 --
 scripts/lib/mic/imager/livecd.py                   |  750 ----------
 scripts/lib/mic/imager/liveusb.py                  |  308 ----
 scripts/lib/mic/imager/loop.py                     |  418 ------
 scripts/lib/mic/imager/raw.py                      |  501 -------
 scripts/lib/mic/kickstart/__init__.py              |  892 ------------
 .../lib/mic/kickstart/custom_commands/desktop.py   |   95 --
 .../mic/kickstart/custom_commands/installerfw.py   |   63 -
 .../lib/mic/kickstart/custom_commands/micrepo.py   |  127 --
 scripts/lib/mic/plugins/backend/yumpkgmgr.py       |  490 -------
 scripts/lib/mic/plugins/backend/zypppkgmgr.py      |  973 -------------
 scripts/lib/mic/plugins/hook/.py                   |    0
 scripts/lib/mic/plugins/hook/empty_hook.py         |    3 -
 scripts/lib/mic/plugins/imager/fs_plugin.py        |  143 --
 scripts/lib/mic/plugins/imager/livecd_plugin.py    |  255 ----
 scripts/lib/mic/plugins/imager/liveusb_plugin.py   |  260 ----
 scripts/lib/mic/plugins/imager/loop_plugin.py      |  255 ----
 scripts/lib/mic/plugins/imager/raw_plugin.py       |  275 ----
 scripts/lib/mic/rt_util.py                         |  223 ---
 scripts/lib/mic/utils/BmapCreate.py                |  298 ----
 scripts/lib/mic/utils/Fiemap.py                    |  252 ----
 scripts/lib/mic/utils/fs_related.py                | 1060 --------------
 scripts/lib/mic/utils/gpt_parser.py                |  331 -----
 scripts/lib/mic/utils/grabber.py                   |   97 --
 scripts/lib/mic/utils/misc.py                      | 1065 --------------
 scripts/lib/mic/utils/partitionedfs.py             |  782 -----------
 scripts/lib/mic/utils/proxy.py                     |  183 ---
 scripts/lib/mic/utils/rpmmisc.py                   |  600 --------
 .../{mic => wic}/3rdparty/pykickstart/__init__.py  |    0
 .../lib/{mic => wic}/3rdparty/pykickstart/base.py  |    0
 .../3rdparty/pykickstart/commands/__init__.py}     |    6 +-
 .../3rdparty/pykickstart/commands/bootloader.py    |   49 -
 .../3rdparty/pykickstart/commands/partition.py     |   39 -
 .../{mic => wic}/3rdparty/pykickstart/constants.py |    0
 .../{mic => wic}/3rdparty/pykickstart/errors.py    |    0
 .../3rdparty/pykickstart/handlers/__init__.py      |    0
 .../3rdparty/pykickstart/handlers/control.py}      |   30 +-
 .../3rdparty/pykickstart/handlers/f16.py           |    0
 .../lib/{mic => wic}/3rdparty/pykickstart/ko.py    |    0
 .../{mic => wic}/3rdparty/pykickstart/options.py   |    0
 .../{mic => wic}/3rdparty/pykickstart/parser.py    |    0
 .../{mic => wic}/3rdparty/pykickstart/sections.py  |    0
 .../{mic => wic}/3rdparty/pykickstart/version.py   |    0
 scripts/lib/{mic => wic}/__init__.py               |    0
 scripts/lib/wic/__version__.py                     |    1 +
 scripts/lib/{mic => wic}/conf.py                   |  107 +-
 scripts/lib/{mic => wic}/creator.py                |  188 +--
 scripts/lib/{mic => wic}/imager/__init__.py        |    0
 scripts/lib/wic/imager/baseimager.py               |  193 +++
 scripts/lib/{mic => wic}/imager/direct.py          |  133 +-
 scripts/lib/wic/kickstart/__init__.py              |  125 ++
 .../kickstart/custom_commands/__init__.py          |    7 -
 .../kickstart/custom_commands/micboot.py           |    0
 .../kickstart/custom_commands/micpartition.py      |    0
 .../kickstart/custom_commands/partition.py         |   50 +-
 .../kickstart/custom_commands/wicboot.py           |    2 +-
 scripts/lib/{mic => wic}/msger.py                  |    0
 scripts/lib/{mic => wic}/plugin.py                 |   18 +-
 scripts/lib/{mic => wic}/pluginbase.py             |   65 +-
 .../{mic => wic}/plugins/imager/direct_plugin.py   |   27 +-
 .../lib/{mic => wic}/plugins/source/bootimg-efi.py |   29 +-
 .../{mic => wic}/plugins/source/bootimg-pcbios.py  |   37 +-
 scripts/lib/{mic => wic}/plugins/source/rootfs.py  |   17 +-
 scripts/lib/{mic => wic}/test                      |    0
 scripts/lib/{mic => wic}/utils/__init__.py         |    0
 scripts/lib/{mic => wic}/utils/cmdln.py            |    0
 scripts/lib/{mic => wic}/utils/errors.py           |   26 +-
 scripts/lib/wic/utils/fs_related.py                |  111 ++
 scripts/lib/wic/utils/misc.py                      |   59 +
 scripts/lib/{mic => wic}/utils/oe/__init__.py      |    2 +-
 scripts/lib/{mic => wic}/utils/oe/misc.py          |   39 +-
 scripts/lib/wic/utils/partitionedfs.py             |  360 +++++
 scripts/lib/{mic => wic}/utils/runner.py           |    2 +-
 152 files changed, 1078 insertions(+), 24119 deletions(-)
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/__init__.py
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
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/control.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f10.py
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
 delete mode 100644 scripts/lib/mic/__version__.py
 delete mode 100644 scripts/lib/mic/bootstrap.py
 delete mode 100644 scripts/lib/mic/chroot.py
 delete mode 100644 scripts/lib/mic/imager/baseimager.py
 delete mode 100644 scripts/lib/mic/imager/fs.py
 delete mode 100644 scripts/lib/mic/imager/livecd.py
 delete mode 100644 scripts/lib/mic/imager/liveusb.py
 delete mode 100644 scripts/lib/mic/imager/loop.py
 delete mode 100644 scripts/lib/mic/imager/raw.py
 delete mode 100644 scripts/lib/mic/kickstart/__init__.py
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
 delete mode 100644 scripts/lib/mic/utils/fs_related.py
 delete mode 100644 scripts/lib/mic/utils/gpt_parser.py
 delete mode 100644 scripts/lib/mic/utils/grabber.py
 delete mode 100644 scripts/lib/mic/utils/misc.py
 delete mode 100644 scripts/lib/mic/utils/partitionedfs.py
 delete mode 100644 scripts/lib/mic/utils/proxy.py
 delete mode 100644 scripts/lib/mic/utils/rpmmisc.py
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/__init__.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/base.py (100%)
 rename scripts/lib/{mic/3rdparty/pykickstart/handlers/f12.py => wic/3rdparty/pykickstart/commands/__init__.py} (89%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/commands/bootloader.py (83%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/commands/partition.py (89%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/constants.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/errors.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/handlers/__init__.py (100%)
 rename scripts/lib/{mic/3rdparty/pykickstart/handlers/f11.py => wic/3rdparty/pykickstart/handlers/control.py} (47%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/handlers/f16.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/ko.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/options.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/parser.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/sections.py (100%)
 rename scripts/lib/{mic => wic}/3rdparty/pykickstart/version.py (100%)
 rename scripts/lib/{mic => wic}/__init__.py (100%)
 create mode 100644 scripts/lib/wic/__version__.py
 rename scripts/lib/{mic => wic}/conf.py (44%)
 rename scripts/lib/{mic => wic}/creator.py (41%)
 rename scripts/lib/{mic => wic}/imager/__init__.py (100%)
 create mode 100644 scripts/lib/wic/imager/baseimager.py
 rename scripts/lib/{mic => wic}/imager/direct.py (72%)
 create mode 100644 scripts/lib/wic/kickstart/__init__.py
 rename scripts/lib/{mic => wic}/kickstart/custom_commands/__init__.py (52%)
 rename scripts/lib/{mic => wic}/kickstart/custom_commands/micboot.py (100%)
 rename scripts/lib/{mic => wic}/kickstart/custom_commands/micpartition.py (100%)
 rename scripts/lib/{mic => wic}/kickstart/custom_commands/partition.py (93%)
 rename scripts/lib/{mic => wic}/kickstart/custom_commands/wicboot.py (97%)
 rename scripts/lib/{mic => wic}/msger.py (100%)
 rename scripts/lib/{mic => wic}/plugin.py (93%)
 rename scripts/lib/{mic => wic}/pluginbase.py (66%)
 rename scripts/lib/{mic => wic}/plugins/imager/direct_plugin.py (77%)
 rename scripts/lib/{mic => wic}/plugins/source/bootimg-efi.py (88%)
 rename scripts/lib/{mic => wic}/plugins/source/bootimg-pcbios.py (87%)
 rename scripts/lib/{mic => wic}/plugins/source/rootfs.py (88%)
 rename scripts/lib/{mic => wic}/test (100%)
 rename scripts/lib/{mic => wic}/utils/__init__.py (100%)
 rename scripts/lib/{mic => wic}/utils/cmdln.py (100%)
 rename scripts/lib/{mic => wic}/utils/errors.py (75%)
 create mode 100644 scripts/lib/wic/utils/fs_related.py
 create mode 100644 scripts/lib/wic/utils/misc.py
 rename scripts/lib/{mic => wic}/utils/oe/__init__.py (95%)
 rename scripts/lib/{mic => wic}/utils/oe/misc.py (85%)
 create mode 100644 scripts/lib/wic/utils/partitionedfs.py
 rename scripts/lib/{mic => wic}/utils/runner.py (99%)

-- 
1.8.3.1


