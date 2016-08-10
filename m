Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BB382771F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 09:29:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 10 Aug 2016 02:29:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,499,1464678000"; d="scan'208";a="1022928616"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 10 Aug 2016 02:29:29 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id A98F56A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 02:29:14 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Aug 2016 12:30:19 +0300
Message-Id: <1470821429-6094-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v2 00/10] replace xtscal with xinput-calibrator
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
X-List-Received-Date: Wed, 10 Aug 2016 09:29:30 -0000

Remove xtscal in preference of xinput-calibrator

[YOCTO #9365]
[YOCTO #8380]

Changes in v2:
    1. Removed bash dependency from xinput-calibrator
    2. Moved tslib recipe from oe-core since modern systems tend to use
       kernel driver or libinput
    3. removed pointercal reference from packagegroup-core-x11-base
    4. removed tslib references from packagegroup-core-tools-testapps

The following changes since commit dfc016fbf13e62f7767edaf7abadf1d1b72680b2:

maintainers.inc: remove augeas (2016-08-02 14:05:58 +0100)

are available in the git repository at:

git://git.yoctoproject.org/poky-contrib maxin/xtscal
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=maxin/xtscal

Maxin B. John (10):
  xtscal: remove recipe
  x11-common: replace xtscal with xinput-calibrator
  pointercal-xinput: add a dummy calibration file for qemu
  packagegroup-core-x11-base.bb: remove pointercal
  xinput-calibrator: remove bash dependency
  pointercal: remove recipe
  tslib: remove recipe
  packagegroup-core-tools-testapps: remove tslib references
  distro_alias.inc: remove xtscal, pointercal and tslib references
  layer.conf: remove pointercal

 meta/conf/distro/include/distro_alias.inc          |   3 -
 meta/conf/layer.conf                               |   1 -
 meta/recipes-bsp/pointercal/pointercal/COPYING     |   2 -
 meta/recipes-bsp/pointercal/pointercal/pointercal  |   0
 .../pointercal/pointercal/qemuarm/pointercal       |   1 -
 .../pointercal/pointercal/qemuarmv6/pointercal     |   1 -
 .../pointercal/pointercal/qemuarmv7/pointercal     |   1 -
 .../pointercal/pointercal/qemumips/pointercal      |   1 -
 .../pointercal/pointercal/qemuppc/pointercal       | Bin 36 -> 0 bytes
 .../pointercal/pointercal/qemux86-64/pointercal    |   1 -
 .../pointercal/pointercal/qemux86/pointercal       |   1 -
 meta/recipes-bsp/pointercal/pointercal_0.0.bb      |  22 -
 .../packagegroup-core-tools-testapps.bb            |   2 -
 .../packagegroups/packagegroup-core-x11-base.bb    |   1 -
 meta/recipes-graphics/tslib/tslib/ts.conf          |  25 -
 meta/recipes-graphics/tslib/tslib/tslib.sh         |   8 -
 meta/recipes-graphics/tslib/tslib_1.1.bb           |  53 --
 meta/recipes-graphics/x11-common/x11-common_0.1.bb |   2 +-
 .../pointercal-xinput/qemuall/pointercal.xinput    |   2 +
 .../add-geometry-input-when-calibrating.patch      |  31 +-
 .../xinput-calibrator/xinput-calibrator_git.bb     |   2 +-
 .../xtscal/xtscal/30xTs_Calibrate.sh               |  13 -
 .../xtscal/xtscal/change-cross.patch               |  18 -
 meta/recipes-graphics/xtscal/xtscal/cleanup.patch  | 621 ---------------------
 .../xtscal/dso_linking_change_build_fix.patch      |  27 -
 meta/recipes-graphics/xtscal/xtscal_0.6.3.bb       |  33 --
 26 files changed, 20 insertions(+), 852 deletions(-)
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/COPYING
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemuarm/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemuarmv6/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemuarmv7/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemumips/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemuppc/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemux86-64/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemux86/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal_0.0.bb
 delete mode 100644 meta/recipes-graphics/tslib/tslib/ts.conf
 delete mode 100644 meta/recipes-graphics/tslib/tslib/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib_1.1.bb
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/qemuall/pointercal.xinput
 delete mode 100644 meta/recipes-graphics/xtscal/xtscal/30xTs_Calibrate.sh
 delete mode 100644 meta/recipes-graphics/xtscal/xtscal/change-cross.patch
 delete mode 100644 meta/recipes-graphics/xtscal/xtscal/cleanup.patch
 delete mode 100644 meta/recipes-graphics/xtscal/xtscal/dso_linking_change_build_fix.patch
 delete mode 100644 meta/recipes-graphics/xtscal/xtscal_0.6.3.bb

-- 
2.4.0


