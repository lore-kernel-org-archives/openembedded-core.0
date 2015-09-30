Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4DF887706E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 15:31:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 30 Sep 2015 08:31:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,613,1437462000"; d="scan'208";a="781008171"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 30 Sep 2015 08:31:36 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org, joshua.lock@collabora.co.uk,
	akuster808@gmail.com
Date: Wed, 30 Sep 2015 18:33:54 +0300
Message-Id: <cover.1443624731.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3][fido][dizzy] D-Bus policy fixes
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
X-List-Received-Date: Wed, 30 Sep 2015 15:31:38 -0000

The major patch in the series is the bluez one: Bluez
D-Bus policy was incorrectly written so it actually allowed
access to system services _other than bluetoothd_ overriding
the default deny policy on the system bus. Fixing this may
naturally affect other system services too.

The patches I'm sending are for master but I believe both fido and
dizzy behave similarly. I can send a patch for those as well but
am not sure what to include there: I'm guessing people now have
services running that are expecting an open-by-default system bus --
closing it now will require good release notes at the very least.

So RFC on fido and dizzy: The best I can think of is taking the bluez
patch, patching in an xuser allow policy for bluez, and making the
(practical) policy change very clear in the release notes.

 - Jussi

The following changes since commit 4bc3f0994e68b3302a0523a3156dd0dca0cac7a0:

  bitbake: toaster: move clones into subdirectory (2015-09-29 14:11:39 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/dbus-policy
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/dbus-policy

Jussi Kukkonen (3):
  bluez5: Use upstream D-Bus policy
  dbus: Use the xuser policy file
  xuser-account: Take over xuser specific D-Bus policy

 meta/recipes-connectivity/bluez5/bluez5.inc        |  5 +--
 .../bluez5/bluez5/bluetooth.conf                   | 17 ---------
 meta/recipes-connectivity/connman/connman.inc      |  1 -
 .../connman/add_xuser_dbus_permission.patch        | 43 ----------------------
 meta/recipes-connectivity/connman/connman_1.30.bb  |  1 -
 meta/recipes-core/dbus/dbus.inc                    |  1 +
 ...-Apply-xuser-specific-policies-if-present.patch | 33 +++++++++++++++++
 .../user-creation/files/system-xuser.conf          | 15 ++++++++
 .../user-creation/xuser-account_0.1.bb             |  6 ++-
 9 files changed, 55 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf
 delete mode 100644 meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch
 create mode 100644 meta/recipes-core/dbus/dbus/0001-Apply-xuser-specific-policies-if-present.patch
 create mode 100644 meta/recipes-support/user-creation/files/system-xuser.conf

-- 
2.1.4


