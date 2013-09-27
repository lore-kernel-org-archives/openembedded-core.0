Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B80E76CBA2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 02:18:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Sep 2013 19:14:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,989,1371106800"; d="scan'208";a="384199295"
Received: from unknown (HELO localhost) ([10.255.15.160])
	by orsmga001.jf.intel.com with ESMTP; 26 Sep 2013 19:17:55 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2013 21:17:52 -0500
Message-Id: <734affa7ac65895aa9329a04cb31782c8495f810.1380234931.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <8dbedc35cbce3319722c012af0dad737773446f6.1380234931.git.tom.zanussi@linux.intel.com>
References: <8dbedc35cbce3319722c012af0dad737773446f6.1380234931.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1380234931.git.tom.zanussi@linux.intel.com>
References: <cover.1380234931.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 2/3] wic: Add mic w/pykickstart
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
X-List-Received-Date: Fri, 27 Sep 2013 02:18:08 -0000

This is the starting point for the implemention described in [YOCTO
3847] which came to the conclusion that it would make sense to use
kickstart syntax to implement image creation in OpenEmbedded.  I
subsequently realized that there was an existing tool that already
implemented image creation using kickstart syntax, the Tizen/Meego mic
tool.  As such, it made sense to use that as a starting point - this
commit essentially just copies the relevant Python code from the MIC
tool to the scripts/lib dir, where it can be accessed by the
previously created wic tool.

Most of this will be removed or renamed by later commits, since we're
initially focusing on partitioning only.  Care should be taken so that
we can easily add back any additional functionality should we decide
later to expand the tool, though (we may also want to contribute our
local changes to the mic tool to the Tizen project if it makes sense,
and therefore should avoid gratuitous changes to the original code if
possible).

Added the /mic subdir from Tizen mic repo as a starting point:

 git clone git://review.tizen.org/tools/mic.git

 For reference, the top commit:

 commit 20164175ddc234a17b8a12c33d04b012347b1530
 Author: Gui Chen <gui.chen@intel.com>
 Date:   Sun Jun 30 22:32:16 2013 -0400

    bump up to 0.19.2

Also added the /plugins subdir, moved to under the /mic subdir (to
match the default plugin_dir location in mic.conf.in, which was
renamed to yocto-image.conf (moved and renamed by later patches) and
put into /scripts.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/3rdparty/pykickstart/base.py       |  466 ++++++
 .../mic/3rdparty/pykickstart/commands/__init__.py  |   26 +
 .../3rdparty/pykickstart/commands/authconfig.py    |   40 +
 .../mic/3rdparty/pykickstart/commands/autopart.py  |  119 ++
 .../mic/3rdparty/pykickstart/commands/autostep.py  |   55 +
 .../3rdparty/pykickstart/commands/bootloader.py    |  265 ++++
 .../mic/3rdparty/pykickstart/commands/clearpart.py |   86 ++
 .../mic/3rdparty/pykickstart/commands/device.py    |  125 ++
 .../3rdparty/pykickstart/commands/deviceprobe.py   |   40 +
 .../3rdparty/pykickstart/commands/displaymode.py   |   68 +
 .../mic/3rdparty/pykickstart/commands/dmraid.py    |   91 ++
 .../3rdparty/pykickstart/commands/driverdisk.py    |  184 +++
 .../lib/mic/3rdparty/pykickstart/commands/fcoe.py  |  114 ++
 .../mic/3rdparty/pykickstart/commands/firewall.py  |  193 +++
 .../mic/3rdparty/pykickstart/commands/firstboot.py |   62 +
 .../lib/mic/3rdparty/pykickstart/commands/group.py |   88 ++
 .../3rdparty/pykickstart/commands/ignoredisk.py    |  139 ++
 .../3rdparty/pykickstart/commands/interactive.py   |   58 +
 .../lib/mic/3rdparty/pykickstart/commands/iscsi.py |  133 ++
 .../mic/3rdparty/pykickstart/commands/iscsiname.py |   54 +
 .../lib/mic/3rdparty/pykickstart/commands/key.py   |   64 +
 .../mic/3rdparty/pykickstart/commands/keyboard.py  |   55 +
 .../lib/mic/3rdparty/pykickstart/commands/lang.py  |   60 +
 .../3rdparty/pykickstart/commands/langsupport.py   |   58 +
 .../mic/3rdparty/pykickstart/commands/lilocheck.py |   54 +
 .../mic/3rdparty/pykickstart/commands/logging.py   |   66 +
 .../mic/3rdparty/pykickstart/commands/logvol.py    |  304 ++++
 .../3rdparty/pykickstart/commands/mediacheck.py    |   53 +
 .../mic/3rdparty/pykickstart/commands/method.py    |  186 +++
 .../mic/3rdparty/pykickstart/commands/monitor.py   |  106 ++
 .../lib/mic/3rdparty/pykickstart/commands/mouse.py |   70 +
 .../mic/3rdparty/pykickstart/commands/multipath.py |  111 ++
 .../mic/3rdparty/pykickstart/commands/network.py   |  363 +++++
 .../mic/3rdparty/pykickstart/commands/partition.py |  353 +++++
 .../lib/mic/3rdparty/pykickstart/commands/raid.py  |  365 +++++
 .../mic/3rdparty/pykickstart/commands/reboot.py    |   79 +
 .../lib/mic/3rdparty/pykickstart/commands/repo.py  |  249 +++
 .../mic/3rdparty/pykickstart/commands/rescue.py    |   68 +
 .../mic/3rdparty/pykickstart/commands/rootpw.py    |   93 ++
 .../mic/3rdparty/pykickstart/commands/selinux.py   |   64 +
 .../mic/3rdparty/pykickstart/commands/services.py  |   71 +
 .../lib/mic/3rdparty/pykickstart/commands/skipx.py |   54 +
 .../lib/mic/3rdparty/pykickstart/commands/sshpw.py |  105 ++
 .../mic/3rdparty/pykickstart/commands/timezone.py  |   86 ++
 .../mic/3rdparty/pykickstart/commands/updates.py   |   60 +
 .../mic/3rdparty/pykickstart/commands/upgrade.py   |  106 ++
 .../lib/mic/3rdparty/pykickstart/commands/user.py  |  173 +++
 .../lib/mic/3rdparty/pykickstart/commands/vnc.py   |  114 ++
 .../mic/3rdparty/pykickstart/commands/volgroup.py  |  102 ++
 .../mic/3rdparty/pykickstart/commands/xconfig.py   |  184 +++
 .../mic/3rdparty/pykickstart/commands/zerombr.py   |   69 +
 .../lib/mic/3rdparty/pykickstart/commands/zfcp.py  |  134 ++
 scripts/lib/mic/3rdparty/pykickstart/constants.py  |   57 +
 scripts/lib/mic/3rdparty/pykickstart/errors.py     |  103 ++
 .../mic/3rdparty/pykickstart/handlers/control.py   | 1307 ++++++++++++++++
 .../lib/mic/3rdparty/pykickstart/handlers/f10.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/f11.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/f12.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/f13.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/f14.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/f15.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/f16.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/f7.py    |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/f8.py    |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/f9.py    |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/fc3.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/fc4.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/fc5.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/fc6.py   |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/rhel3.py |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/rhel4.py |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/rhel5.py |   24 +
 .../lib/mic/3rdparty/pykickstart/handlers/rhel6.py |   24 +
 scripts/lib/mic/3rdparty/pykickstart/ko.py         |   37 +
 scripts/lib/mic/3rdparty/pykickstart/options.py    |  204 +++
 scripts/lib/mic/3rdparty/pykickstart/parser.py     |  702 +++++++++
 scripts/lib/mic/3rdparty/pykickstart/sections.py   |  244 +++
 .../3rdparty/pykickstart/urlgrabber/__init__.py    |   53 +
 .../3rdparty/pykickstart/urlgrabber/byterange.py   |  463 ++++++
 .../mic/3rdparty/pykickstart/urlgrabber/grabber.py | 1477 ++++++++++++++++++
 .../3rdparty/pykickstart/urlgrabber/keepalive.py   |  617 ++++++++
 .../mic/3rdparty/pykickstart/urlgrabber/mirror.py  |  458 ++++++
 .../3rdparty/pykickstart/urlgrabber/progress.py    |  530 +++++++
 .../3rdparty/pykickstart/urlgrabber/sslfactory.py  |   90 ++
 scripts/lib/mic/3rdparty/pykickstart/version.py    |  197 +++
 scripts/lib/mic/__init__.py                        |    4 +
 scripts/lib/mic/__version__.py                     |    1 +
 scripts/lib/mic/bootstrap.py                       |  279 ++++
 scripts/lib/mic/chroot.py                          |  343 +++++
 scripts/lib/mic/conf.py                            |  239 +++
 scripts/lib/mic/creator.py                         |  354 +++++
 scripts/lib/mic/imager/baseimager.py               | 1335 ++++++++++++++++
 scripts/lib/mic/imager/fs.py                       |   99 ++
 scripts/lib/mic/imager/livecd.py                   |  750 +++++++++
 scripts/lib/mic/imager/liveusb.py                  |  308 ++++
 scripts/lib/mic/imager/loop.py                     |  418 ++++++
 scripts/lib/mic/imager/raw.py                      |  501 +++++++
 scripts/lib/mic/kickstart/__init__.py              |  892 +++++++++++
 .../lib/mic/kickstart/custom_commands/__init__.py  |   12 +
 .../lib/mic/kickstart/custom_commands/desktop.py   |   95 ++
 .../mic/kickstart/custom_commands/installerfw.py   |   63 +
 .../lib/mic/kickstart/custom_commands/micboot.py   |   49 +
 .../lib/mic/kickstart/custom_commands/micrepo.py   |  127 ++
 .../lib/mic/kickstart/custom_commands/partition.py |   57 +
 scripts/lib/mic/msger.py                           |  309 ++++
 scripts/lib/mic/plugin.py                          |   98 ++
 scripts/lib/mic/pluginbase.py                      |  101 ++
 scripts/lib/mic/plugins/backend/yumpkgmgr.py       |  490 ++++++
 scripts/lib/mic/plugins/backend/zypppkgmgr.py      |  973 ++++++++++++
 scripts/lib/mic/plugins/hook/empty_hook.py         |    3 +
 scripts/lib/mic/plugins/imager/fs_plugin.py        |  143 ++
 scripts/lib/mic/plugins/imager/livecd_plugin.py    |  255 ++++
 scripts/lib/mic/plugins/imager/liveusb_plugin.py   |  260 ++++
 scripts/lib/mic/plugins/imager/loop_plugin.py      |  255 ++++
 scripts/lib/mic/plugins/imager/raw_plugin.py       |  275 ++++
 scripts/lib/mic/rt_util.py                         |  223 +++
 scripts/lib/mic/test                               |    1 +
 scripts/lib/mic/utils/BmapCreate.py                |  298 ++++
 scripts/lib/mic/utils/Fiemap.py                    |  252 ++++
 scripts/lib/mic/utils/cmdln.py                     | 1586 ++++++++++++++++++++
 scripts/lib/mic/utils/errors.py                    |   71 +
 scripts/lib/mic/utils/fs_related.py                | 1029 +++++++++++++
 scripts/lib/mic/utils/gpt_parser.py                |  331 ++++
 scripts/lib/mic/utils/grabber.py                   |   97 ++
 scripts/lib/mic/utils/misc.py                      | 1067 +++++++++++++
 scripts/lib/mic/utils/partitionedfs.py             |  790 ++++++++++
 scripts/lib/mic/utils/proxy.py                     |  183 +++
 scripts/lib/mic/utils/rpmmisc.py                   |  600 ++++++++
 scripts/lib/mic/utils/runner.py                    |  109 ++
 scripts/yocto-image.conf                           |   35 +
 130 files changed, 29216 insertions(+)
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/__init__.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/base.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/__init__.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/authconfig.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/autopart.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/autostep.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/bootloader.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/clearpart.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/device.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/deviceprobe.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/displaymode.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/dmraid.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/driverdisk.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/fcoe.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/firewall.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/firstboot.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/group.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/ignoredisk.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/interactive.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/iscsi.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/iscsiname.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/key.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/keyboard.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/lang.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/langsupport.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/lilocheck.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/logging.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/logvol.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/mediacheck.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/method.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/monitor.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/mouse.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/multipath.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/network.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/partition.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/raid.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/reboot.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/repo.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/rescue.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/rootpw.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/selinux.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/services.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/skipx.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/sshpw.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/timezone.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/updates.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/upgrade.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/user.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/vnc.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/volgroup.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/xconfig.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/zerombr.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/zfcp.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/constants.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/errors.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/__init__.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/control.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f10.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f11.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f12.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f13.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f14.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f15.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f16.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f7.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f8.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/f9.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc3.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc4.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc5.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/fc6.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rhel3.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rhel4.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rhel5.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/handlers/rhel6.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/ko.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/options.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/parser.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/sections.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/__init__.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/byterange.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/grabber.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/keepalive.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/mirror.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/progress.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/urlgrabber/sslfactory.py
 create mode 100644 scripts/lib/mic/3rdparty/pykickstart/version.py
 create mode 100644 scripts/lib/mic/__init__.py
 create mode 100644 scripts/lib/mic/__version__.py
 create mode 100644 scripts/lib/mic/bootstrap.py
 create mode 100644 scripts/lib/mic/chroot.py
 create mode 100644 scripts/lib/mic/conf.py
 create mode 100644 scripts/lib/mic/creator.py
 create mode 100644 scripts/lib/mic/imager/__init__.py
 create mode 100644 scripts/lib/mic/imager/baseimager.py
 create mode 100644 scripts/lib/mic/imager/fs.py
 create mode 100644 scripts/lib/mic/imager/livecd.py
 create mode 100644 scripts/lib/mic/imager/liveusb.py
 create mode 100644 scripts/lib/mic/imager/loop.py
 create mode 100644 scripts/lib/mic/imager/raw.py
 create mode 100644 scripts/lib/mic/kickstart/__init__.py
 create mode 100644 scripts/lib/mic/kickstart/custom_commands/__init__.py
 create mode 100644 scripts/lib/mic/kickstart/custom_commands/desktop.py
 create mode 100644 scripts/lib/mic/kickstart/custom_commands/installerfw.py
 create mode 100644 scripts/lib/mic/kickstart/custom_commands/micboot.py
 create mode 100644 scripts/lib/mic/kickstart/custom_commands/micrepo.py
 create mode 100644 scripts/lib/mic/kickstart/custom_commands/partition.py
 create mode 100644 scripts/lib/mic/msger.py
 create mode 100644 scripts/lib/mic/plugin.py
 create mode 100644 scripts/lib/mic/pluginbase.py
 create mode 100644 scripts/lib/mic/plugins/backend/yumpkgmgr.py
 create mode 100755 scripts/lib/mic/plugins/backend/zypppkgmgr.py
 create mode 100644 scripts/lib/mic/plugins/hook/.py
 create mode 100644 scripts/lib/mic/plugins/hook/empty_hook.py
 create mode 100644 scripts/lib/mic/plugins/imager/fs_plugin.py
 create mode 100644 scripts/lib/mic/plugins/imager/livecd_plugin.py
 create mode 100644 scripts/lib/mic/plugins/imager/liveusb_plugin.py
 create mode 100644 scripts/lib/mic/plugins/imager/loop_plugin.py
 create mode 100644 scripts/lib/mic/plugins/imager/raw_plugin.py
 create mode 100644 scripts/lib/mic/rt_util.py
 create mode 100644 scripts/lib/mic/test
 create mode 100644 scripts/lib/mic/utils/BmapCreate.py
 create mode 100644 scripts/lib/mic/utils/Fiemap.py
 create mode 100644 scripts/lib/mic/utils/__init__.py
 create mode 100644 scripts/lib/mic/utils/cmdln.py
 create mode 100644 scripts/lib/mic/utils/errors.py
 create mode 100644 scripts/lib/mic/utils/fs_related.py
 create mode 100644 scripts/lib/mic/utils/gpt_parser.py
 create mode 100644 scripts/lib/mic/utils/grabber.py
 create mode 100644 scripts/lib/mic/utils/misc.py
 create mode 100644 scripts/lib/mic/utils/partitionedfs.py
 create mode 100644 scripts/lib/mic/utils/proxy.py
 create mode 100644 scripts/lib/mic/utils/rpmmisc.py
 create mode 100644 scripts/lib/mic/utils/runner.py
 create mode 100644 scripts/yocto-image.conf

[
Patch contents have been removed - too large to post.  You can see
the patch contents here:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=tzanussi/wic-v1&id=734affa7ac65895aa9329a04cb31782c8495f810
]

-- 
1.7.11.4


