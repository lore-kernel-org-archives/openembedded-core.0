Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A513460107;
	Tue, 30 Aug 2016 08:31:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 30 Aug 2016 01:32:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,255,1470726000"; d="scan'208";a="754969490"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Aug 2016 01:31:59 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 11:31:55 +0300
Message-Id: <cover.1472467394.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/3] Clean up X init (oe-core vs meta-oe)
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
X-List-Received-Date: Tue, 30 Aug 2016 08:32:00 -0000

Goals:
* Less confusing duplication between oe-core and meta-oe
  (currently just adding meta-oe to BBLAYERS completely
  changes X init because meta-oe provides another version of
  xserver-nodm-init)
* Make it easier to keep X init in sync between systemd and sysvinit

The xserver-nodm-init patch merges in functionality from
xserver-nodm-init-2.0 from meta-oe: The combined "Xserver" script
deprecates the ones in x11-common (oe-core) and xserver-common
(meta-oe), and should work with other parts of either x11-common
or xserver-common. In particular these differences still exist:
 * Xsession files are different
 * xserver-common generates X binary name and arguments at runtime

I believe the xserver-nodm-init-2.0 recipe can be removed after this
patch with one caveat: The people who assume they will get
xserver-common (meta-oe) without explicitly asking for it will be
surprised. The x11 packagegroup has "VIRTUAL-RUNTIME_xserver_common"
selection which will work but it does not seem to be commonly used.

I'd be happy to take advice on how to minimize problems from the above as
well as on how to handle the version problems: should I bump the recipe
version above 2.0?

Sorry about the timing wrt M3 freeze: This consumed much more time
than planned. We can postpone if it looks too scary at this point.

Jussi



The following changes since commit 2fedd226c3385f1ac160b3aa0bfadbded85e288c:

  ref-manual: Fixed small wording in PKGR in the glossary (2016-08-25 23:09:29 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/xserver-nodm
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/xserver-nodm

Jussi Kukkonen (3):
  base-files: Add shell test quoting
  xserver-nodm-init: Deprecate /etc/X11/Xserver
  x11-common: Remove Xserver script

 meta/recipes-core/base-files/base-files/profile    |  2 +-
 .../x11-common/x11-common/Xserver.in               | 12 ------
 meta/recipes-graphics/x11-common/x11-common_0.1.bb | 10 +----
 .../x11-common/xserver-nodm-init.bb                | 47 +++++++++++++---------
 .../x11-common/xserver-nodm-init/Xserver           | 25 ++++++++++++
 .../x11-common/xserver-nodm-init/Xusername         |  1 -
 .../x11-common/xserver-nodm-init/xserver-nodm      | 10 +++--
 .../x11-common/xserver-nodm-init/xserver-nodm.conf |  1 -
 .../xserver-nodm-init/xserver-nodm.conf.in         |  7 ++++
 ...server-nodm.service => xserver-nodm.service.in} |  4 +-
 10 files changed, 69 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-graphics/x11-common/x11-common/Xserver.in
 create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/Xserver
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/Xusername
 delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf
 create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf.in
 rename meta/recipes-graphics/x11-common/xserver-nodm-init/{xserver-nodm.service => xserver-nodm.service.in} (76%)

-- 
2.1.4


