Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9554F616F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 15:10:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Sep 2013 08:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,878,1371106800"; d="scan'208";a="401243716"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 10 Sep 2013 08:10:52 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Sep 2013 18:10:45 +0300
Message-Id: <cover.1378824959.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/5] Some ADT related refactoring
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
X-List-Received-Date: Tue, 10 Sep 2013 15:10:52 -0000

Hi,

Currently, if one wants to create an ADT repo for a certain architecture, but
for different machines (for example for arm: qemuarm and beagleboard), it will
fail. That's because the meta-environment file created is the same:
meta-environment-arm

The problem here is that the environment file will contain compiler options
specific to the MACHINE used for the last compilation. For example, if one compiles
the toolchain for qemuarm followed by a beagleboard compilation, the meta-environment
package will contain the latter settings.

This patchset will add the possibility to specify, in adt-installer.conf, the
machine for which the toolchain is to be installed which will select the
correct meta-environment file and target sysroot.

Thanks,
Laurentiu

The following changes since commit 0ca5d1fb38157564a2b9452ade32391d18a41b09:

  yocto-bsp: remove apm as a default MACHINE_FEATURE (2013-09-09 16:28:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b4783_target_arch_change
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b4783_target_arch_change

Laurentiu Palcu (5):
  meta-environment: change package name to include MACHINE
  packagegroup-cross-canadian: change package name to include MACHINE
  populate_sdk_base.bbclass: select the proper cross-canadian package
  meta-toolchain-qt: include the proper cross-canadian package
  adt-installer: allow installation of other machines

 meta/classes/populate_sdk_base.bbclass             |    2 +-
 meta/recipes-core/meta/meta-environment.bb         |    2 +-
 .../packagegroups/packagegroup-cross-canadian.bb   |   13 +++-----
 .../installer/adt-installer/adt_installer          |   33 ++++++++++----------
 .../installer/adt-installer/adt_installer.conf     |   20 +++++++++---
 .../adt-installer/opkg/conf/opkg-sdk-i686.conf     |    1 +
 .../adt-installer/opkg/conf/opkg-sdk-x86_64.conf   |    1 +
 .../adt-installer/scripts/adt_installer_internal   |   27 +++++-----------
 meta/recipes-qt/meta/meta-toolchain-qt.inc         |    2 +-
 9 files changed, 50 insertions(+), 51 deletions(-)

-- 
1.7.9.5


