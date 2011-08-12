Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QrmZx-0004dR-Ku
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 09:54:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Aug 2011 00:50:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37809697"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.248])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2011 00:50:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2011 00:49:49 -0700
Message-Id: <cover.1313134270.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [CONSOLIDATED PULL 00/25] Meta-RT reorg and other fixes
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
X-List-Received-Date: Fri, 12 Aug 2011 07:54:53 -0000

Richard,

This set of changes fixes some current master build failures for
RPM rootfs (from Mark) and has the Realtime update from Darren and
Bruce.

In addition there are some updates from Chris Larson and Kumar cleaning
up various tune and multi-lib issues.

They past my review and initial testing.

Sau!

The following changes since commit a92d56058b21913570bb17ae416c3b00afce055e:

  gnome-doc-utils: respect python-dir setting EXTRA_OECONF (2011-08-11 19:13:38 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (1):
  linux-yocto: update SRCREVs for preempt-rt support + build fixes

Chris Larson (7):
  busybox: don't strip the main binary
  insane: add linux-gnu to the platform data
  nativesdk: inherit relocatable
  sanity: shift the required utils into a variable
  package: include SECTION in the pkgdata
  package: allow setting a section for locale packages
  cross: also empty PACKAGES_DYNAMIC

Darren Hart (10):
  meta-rt: refresh linux-yocto-rt recipe
  meta-rt: rt-tests v0.73 instead of AUTOREV
  meta-rt: canonicalize directory structure
  meta-rt: add linux-yocto-rt_3.0 recipe
  meta-rt: remove atom-pc support from the main layer
  meta-rt: rename minimal-rt images to -rt, drop live image
  meta-rt: add an -rt-sdk image
  meta-rt: default KMACHINE and SRCREV_machine to avoid parsing errors
  Move meta-rt recipes to oe-core (meta)
  recipes-rt: add a README documenting the contents of recipes-rt

Kumar Gala (3):
  automake: Update for python.m4 to respect libdir
  xcb-proto: update based on changes to python.m4 in automake
  tune-ppce5500: Add a set of tune files for PowerPC e5500 core

Mark Hatle (3):
  rpm: Fix the canonical arch --target processing and cleanup
  package_rpm.bbclass: Update the platform config and --target
  package_rpm: Fix attemptonly and suggest packages

Mei Lei (1):
  init-install.sh: Fix make partition and make file system issues

 meta-rt/conf/layer.conf                            |   23 ----
 meta/classes/cross.bbclass                         |    2 +
 meta/classes/insane.bbclass                        |    3 +
 meta/classes/nativesdk.bbclass                     |    2 +
 meta/classes/package.bbclass                       |    6 +
 meta/classes/package_rpm.bbclass                   |   39 +++++--
 meta/classes/sanity.bbclass                        |    4 +-
 meta/conf/machine/include/tune-ppce5500-32b.inc    |   15 +++
 meta/conf/machine/include/tune-ppce5500-64b.inc    |   15 +++
 meta/recipes-core/busybox/busybox.inc              |    3 +-
 meta/recipes-core/busybox/busybox_1.18.4.bb        |    2 +-
 .../initrdscripts/files/init-install.sh            |    6 +-
 meta/recipes-devtools/automake/automake.inc        |    2 +-
 .../automake/automake/python-libdir.patch          |   60 +++++++++
 meta/recipes-devtools/automake/automake_1.11.1.bb  |    3 +-
 .../recipes-devtools/rpm/rpm/export-rpmbag-h.patch |   45 -------
 meta/recipes-devtools/rpm/rpm/hdraddorappend.patch |   22 ----
 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch  |  134 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm/rpm-no-loop.patch    |   38 ------
 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |   16 +++
 meta/recipes-devtools/rpm/rpm/rpm-nrescan.patch    |   17 ---
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    8 +-
 .../xcb/xcb-proto-1.6/aclocal.patch                |   22 ----
 .../xcb/xcb-proto-1.6/xcb-proto-libdir.patch       |   14 ++
 meta/recipes-graphics/xcb/xcb-proto.inc            |    2 +-
 meta/recipes-graphics/xcb/xcb-proto_1.6.bb         |    2 +-
 meta/recipes-graphics/xcb/xcb-proto_git.bb         |    2 +-
 .../recipes-kernel/linux/linux-yocto-rt_2.6.34.bb  |   14 ++-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |   46 +++++++
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   14 +-
 meta/recipes-rt/README                             |   13 ++
 meta/recipes-rt/images/core-image-rt-sdk.bb        |   15 +++
 .../recipes-rt/images/core-image-rt.bb             |    2 +-
 .../recipes-rt/rt-tests/rt-tests_0.73.bb           |    2 +-
 34 files changed, 409 insertions(+), 204 deletions(-)
 delete mode 100644 meta-rt/conf/layer.conf
 create mode 100644 meta/conf/machine/include/tune-ppce5500-32b.inc
 create mode 100644 meta/conf/machine/include/tune-ppce5500-64b.inc
 create mode 100644 meta/recipes-devtools/automake/automake/python-libdir.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/export-rpmbag-h.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/hdraddorappend.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-no-loop.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-nrescan.patch
 delete mode 100644 meta/recipes-graphics/xcb/xcb-proto-1.6/aclocal.patch
 create mode 100644 meta/recipes-graphics/xcb/xcb-proto-1.6/xcb-proto-libdir.patch
 rename meta-rt/recipes-kernel/linux-yocto-rt_stablegit.bb => meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb (64%)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
 create mode 100644 meta/recipes-rt/README
 create mode 100644 meta/recipes-rt/images/core-image-rt-sdk.bb
 rename meta-rt/images/core-image-minimal-rt.bb => meta/recipes-rt/images/core-image-rt.bb (78%)
 rename meta-rt/recipes-tests/rt-tests_git.bb => meta/recipes-rt/rt-tests/rt-tests_0.73.bb (97%)

-- 
1.7.3.4



