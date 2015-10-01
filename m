Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7333D7700B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 08:02:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 01 Oct 2015 01:02:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,616,1437462000"; d="scan'208";a="781649934"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 01 Oct 2015 01:02:02 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Oct 2015 11:04:31 +0300
Message-Id: <cover.1443686344.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCHv2 0/2][fido][dizzy] D-Bus policy fixes
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
X-List-Received-Date: Thu, 01 Oct 2015 08:02:14 -0000

Changes since v1:
 - move the xuser policy file to {sysconfdir}/dbus-1/system.d/
   as it works just fine from there.


original cover letter follows:

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

Jussi Kukkonen (2):
  bluez5: Use upstream D-Bus policy
  xuser-account: Take over xuser specific D-Bus policy

 meta/recipes-connectivity/bluez5/bluez5.inc        |  5 +--
 .../bluez5/bluez5/bluetooth.conf                   | 17 ---------
 meta/recipes-connectivity/connman/connman.inc      |  1 -
 .../connman/add_xuser_dbus_permission.patch        | 43 ----------------------
 meta/recipes-connectivity/connman/connman_1.30.bb  |  1 -
 .../user-creation/files/system-xuser.conf          | 11 ++++++
 .../user-creation/xuser-account_0.1.bb             |  6 ++-
 7 files changed, 17 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf
 delete mode 100644 meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch
 create mode 100644 meta/recipes-support/user-creation/files/system-xuser.conf

-- 
2.1.4


