Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 99637719AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 11:41:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 15 Nov 2016 03:41:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,494,1473145200"; d="scan'208";a="1085432900"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 15 Nov 2016 03:41:49 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 1F5FD6A4006;
	Tue, 15 Nov 2016 03:41:08 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 13:41:34 +0200
Message-Id: <cover.1479130124.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] X initialization refactoring
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
X-List-Received-Date: Tue, 15 Nov 2016 11:41:48 -0000

This set has a companion set on meta-oe, neither set makes much sense
without the other. Cover letters are identical. Please CC both lists
if needed.


Current state:
 * meta-oe and oe-core both provide xserver-nodm-init: the oe-core
   version should already do everything the meta-oe version does, but
   the meta-oe version gets selected by default because of layer
   priority.
 * meta-oe and oe-core provide xserver-common and x11-common:
   x11-common files are essentially a subset of xserver-common files.


Goals:
 * Adding meta-oe to bblayers alone should not modify X initialization
 * meta-oe and oe-core should not duplicate content without reason
 * xserver startup should still be modifiable from other layers
   (just not implicitly)


What was done to achieve those goals:
 * (oe-core) Removed old cruft from x11-common. What was left is
   Xsession and a few Xsession scripts.
 * (oe-core) Merged what's left of x11-common into xserver-nodm-init
 * (meta-oe) Removed xserver-nodm-init-2.0 as unneeded
 * (meta-oe) No longer install files in xserver-common that oe-core
   xserver-nodm-init installs


xserver-common now has to be explicitly installed if it is wanted.

There are multiple ways to solve these issues: I'm prepared to try
alternative approaches if needed. Testing results are appreciated
as well. 


Cheers,
 Jussi

The following changes since commit 43e652f3d1fee5ce7fad67e6400315eab1b34270:

  devtool: add "rename" subcommand (2016-11-07 11:04:22 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/x-init-refactor
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/x-init-refactor

Jussi Kukkonen (2):
  xserver-nodm-init: Bump PV to ensure upgrade from 2.0
  x11-common: Merge into xserver-nodm-init

 meta/conf/distro/include/distro_alias.inc          |   1 -
 .../packagegroups/packagegroup-core-x11.bb         |   9 +-
 .../x11-common/x11-common/etc/X11/Xdefaults        |   3 -
 .../x11-common/etc/X11/Xsession.d/12keymap.sh      |   4 -
 .../x11-common/x11-common/etc/X11/default.xmodmap  | 260 ---------------
 .../x11-common/x11-common/gplv2-license.patch      | 355 ---------------------
 meta/recipes-graphics/x11-common/x11-common_0.1.bb |  22 --
 .../etc => xserver-nodm-init}/X11/Xsession         |   0
 .../X11/Xsession.d/13xdgbasedirs.sh                |   0
 .../X11/Xsession.d/89xdgautostart.sh               |   0
 .../X11/Xsession.d/90XWindowManager.sh             |   0
 ...erver-nodm-init.bb => xserver-nodm-init_3.0.bb} |   5 +
 12 files changed, 11 insertions(+), 648 deletions(-)
 delete mode 100644 meta/recipes-graphics/x11-common/x11-common/etc/X11/Xdefaults
 delete mode 100644 meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/12keymap.sh
 delete mode 100644 meta/recipes-graphics/x11-common/x11-common/etc/X11/default.xmodmap
 delete mode 100644 meta/recipes-graphics/x11-common/x11-common/gplv2-license.patch
 delete mode 100644 meta/recipes-graphics/x11-common/x11-common_0.1.bb
 rename meta/recipes-graphics/x11-common/{x11-common/etc => xserver-nodm-init}/X11/Xsession (100%)
 rename meta/recipes-graphics/x11-common/{x11-common/etc => xserver-nodm-init}/X11/Xsession.d/13xdgbasedirs.sh (100%)
 rename meta/recipes-graphics/x11-common/{x11-common/etc => xserver-nodm-init}/X11/Xsession.d/89xdgautostart.sh (100%)
 rename meta/recipes-graphics/x11-common/{x11-common/etc => xserver-nodm-init}/X11/Xsession.d/90XWindowManager.sh (100%)
 rename meta/recipes-graphics/x11-common/{xserver-nodm-init.bb => xserver-nodm-init_3.0.bb} (89%)

-- 
2.1.4


