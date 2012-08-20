Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3PTN-0000IX-1y
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 12:44:41 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Aug 2012 03:32:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,796,1336374000"; d="scan'208";a="206305433"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.92])
	by fmsmga001.fm.intel.com with ESMTP; 20 Aug 2012 03:32:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 11:32:27 +0100
Message-Id: <cover.1345458715.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [RFC PATCH 0/7] Split apart qemu-config
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
X-List-Received-Date: Mon, 20 Aug 2012 10:44:41 -0000

*** Note: this is an RFC series, please do not merge yet! ***

Split apart qemu-config, replacing it with a task (task-core-device-devel)
that is not specific to usage together with QEMU. oprofileui is now split
into client and server parts, and together with the prevous work to merge
dbus-launch back into the main dbus package, this makes things work much
more smoothly when this task is installed with x11  removed from
DISTRO_FEATURES. Additionally it was found that oprofileui was not
correctly depending on oprofile itself, and this has also been fixed.
(This is a reworking of a patch series I sent out some time ago.)

There is a remaining question however - is this task actually useful?
For reference, it enables the following:

1) Use of distcc to accelerate compiling applications within the
   emulated environment using direct compilation on the host
2) Accessing the root filesystem via NFS
3) Remote profiling via oprofileui
4) Running applications in the target from the Anjuta IDE
5) bash shell

Whilst these might have minor utility on an individual basis, I can't
honestly say that that the overall set seems particularly useful to me
as a whole; and some of the parts are less useful than they used to be -
is oprofile commonly used these days now that tools like perf are
available? Is anyone actually using Anjuta for embedded development? For
that matter, does anyone regularly build applications within QEMU
emulated targets?




Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit c39e823138cbf4210e17bdb95ca322ec0a6c8f78:

  libpam: Fix missing DESTDIR for a mkdir causing build failures (2012-08-19 13:31:59 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/qemu-config
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qemu-config

Paul Eggleton (7):
  qemu-config: relicense as MIT
  oprofileui: split server to separate recipe to avoid X11 dependency
  qemu-config: split out anjuta-remote-run
  oprofileui-server: move initscript from qemu-config
  qemu-config: split out shutdown icon to its own recipe
  qemu-config: split out export of root via NFS to its own recipe
  qemu-config: turn into distcc-config and a task

 meta/recipes-bsp/qemu-config/qemu-config.bb        |   45 ---
 .../qemu-config/qemu-config/COPYING.GPL            |  339 --------------------
 .../devel-config/anjuta-remote-run.bb              |   19 ++
 .../anjuta-remote-run}/anjuta-remote-run           |    0
 .../recipes-devtools/devel-config/distcc-config.bb |   25 ++
 .../devel-config/distcc-config}/distcc.sh          |    2 +-
 .../devel-config/nfs-export-root.bb                |   17 +
 .../devel-config/nfs-export-root}/exports          |    0
 .../tasks/task-core-device-devel.bb                |   18 ++
 .../oprofile/oprofileui-server/init}               |    8 +-
 .../oprofile/oprofileui-server_git.bb              |   24 ++
 meta/recipes-kernel/oprofile/oprofileui.inc        |   11 +-
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |   10 +-
 .../shutdown-desktop/shutdown-desktop.bb           |   20 ++
 .../shutdown-desktop}/shutdown.desktop             |    0
 meta/recipes-sato/tasks/task-core-x11-sato.bb      |    3 +-
 16 files changed, 141 insertions(+), 400 deletions(-)
 delete mode 100644 meta/recipes-bsp/qemu-config/qemu-config.bb
 delete mode 100644 meta/recipes-bsp/qemu-config/qemu-config/COPYING.GPL
 create mode 100644 meta/recipes-devtools/devel-config/anjuta-remote-run.bb
 rename meta/{recipes-bsp/qemu-config/qemu-config => recipes-devtools/devel-config/anjuta-remote-run}/anjuta-remote-run (100%)
 create mode 100644 meta/recipes-devtools/devel-config/distcc-config.bb
 rename meta/{recipes-bsp/qemu-config/qemu-config => recipes-devtools/devel-config/distcc-config}/distcc.sh (57%)
 create mode 100644 meta/recipes-devtools/devel-config/nfs-export-root.bb
 rename meta/{recipes-bsp/qemu-config/qemu-config => recipes-devtools/devel-config/nfs-export-root}/exports (100%)
 create mode 100644 meta/recipes-devtools/tasks/task-core-device-devel.bb
 rename meta/{recipes-bsp/qemu-config/qemu-config/qemu-autostart => recipes-kernel/oprofile/oprofileui-server/init} (74%)
 create mode 100644 meta/recipes-kernel/oprofile/oprofileui-server_git.bb
 create mode 100644 meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
 rename meta/{recipes-bsp/qemu-config/qemu-config => recipes-sato/shutdown-desktop/shutdown-desktop}/shutdown.desktop (100%)

-- 
1.7.9.5



