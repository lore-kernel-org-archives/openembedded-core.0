Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RQ1m0-0005Ho-T4
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 20:00:53 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2011 10:54:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75377400"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.185])
	by orsmga001.jf.intel.com with ESMTP; 14 Nov 2011 10:54:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2011 18:54:16 +0000
Message-Id: <cover.1321296476.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/4] Remove dependency on X11 when building for qemu machines
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
X-List-Received-Date: Mon, 14 Nov 2011 19:00:53 -0000

Make some adjustments to qemu-config and items it depends upon to avoid
having a hard depencency on building X11. Note that there is still a
dependency chain that builds X11 for core-image-minimal by default
(udev->glib-2.0->dbus...) however, at least you can now remove x11 from
DISTRO_FEATURES and still be able to build an image for a qemu* machine.

As a side bonus because of the oprofileui-server split qemu-config should
not need to be blacklisted for non-GPLv3 builds anymore.


The following changes since commit f2316ff39670ed99382411e15ac035550360fbdd:

  opkg: Ensure we use the uname/gname fields when extracting tarballs (2011-11-14 11:15:36 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/qemu-x11
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qemu-x11

Paul Eggleton (4):
  oprofileui: split server to separate recipe to avoid X11 dependency
  qemu-config: split out anjuta-remote-run
  distcc: make distccmon-gnome optional and default to off
  qemu-config: update DESCRIPTION and LICENSE

 meta/recipes-bsp/qemu-config/qemu-config.bb        |   12 +-
 .../anjuta-remote-run/anjuta-remote-run.bb         |   21 ++
 .../anjuta-remote-run/COPYING.GPL                  |  339 ++++++++++++++++++++
 .../anjuta-remote-run}/anjuta-remote-run           |    0
 meta/recipes-devtools/distcc/distcc_2.18.3.bb      |   18 +-
 .../oprofile/oprofileui-server_git.bb              |   13 +
 meta/recipes-kernel/oprofile/oprofileui.inc        |   11 +-
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |   12 +-
 8 files changed, 398 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-devtools/anjuta-remote-run/anjuta-remote-run.bb
 create mode 100644 meta/recipes-devtools/anjuta-remote-run/anjuta-remote-run/COPYING.GPL
 rename meta/{recipes-bsp/qemu-config/qemu-config => recipes-devtools/anjuta-remote-run/anjuta-remote-run}/anjuta-remote-run (100%)
 create mode 100644 meta/recipes-kernel/oprofile/oprofileui-server_git.bb

-- 
1.7.5.4



