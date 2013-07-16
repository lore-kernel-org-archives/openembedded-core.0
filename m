Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB156B216
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 14:27:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 16 Jul 2013 07:27:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,677,1367996400"; d="scan'208";a="366079976"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jul 2013 07:28:25 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2013 17:28:45 +0300
Message-Id: <1373984927-21039-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH V3 0/2] BlueZ 5 experimental recipes
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
X-List-Received-Date: Tue, 16 Jul 2013 14:27:16 -0000

This sets of patches adds bluez5 recipes as experimental packages.
BlueZ 5.X is not an upgrade for Bluez 4.x, as such, no upgrade is
provided/possible.
The two versions of the BT stack also conflicts each other.

Observe my investigation below in order to decide if RREPLACES is needed.
Conclusion: BlueZ 5.x will be eventually an upgrade path for an already installed
embedded device. As such, RREPLACES is needed for a system-wide upgrade.

Case 1: bluez4 and bluez5: reciprocal RREPLACES and RCONFLICTS
root@qemux86:~# opkg update
Downloading http://192.168.7.1/upg-ipk/all/Packages.gz.
Inflating http://192.168.7.1/upg-ipk/all/Packages.gz.
Updated list of available packages in /var/lib/opkg/local_repo_all.
Downloading http://192.168.7.1/upg-ipk/i586/Packages.gz.
Inflating http://192.168.7.1/upg-ipk/i586/Packages.gz.
Updated list of available packages in /var/lib/opkg/local_repo_i586.
Downloading http://192.168.7.1/upg-ipk/qemux86/Packages.gz.
Inflating http://192.168.7.1/upg-ipk/qemux86/Packages.gz.
Updated list of available packages in /var/lib/opkg/local_repo_qemux86.
root@qemux86:~# opkg list-installed | grep bluez
bluez4 - 4.101-r6.0
libasound-module-bluez - 4.101-r6.0
root@qemux86:~# opkg list-upgradable | grep bluez
libasound-module-bluez - 4.101-r6.0 - 5.3-r0.0
bluez4 - 4.101-r6.0 - 5.3-r0.0
root@qemux86:~# opkg install bluez5
Multiple replacers for bluez5, using first one (bluez4).
Package bluez4 is already installed on root.
root@qemux86:~# opkg list-installed | grep bluez
bluez4 - 4.101-r6.0
libasound-module-bluez - 4.101-r6.0
root@qemux86:~# opkg upgrade
Upgrading libasound-module-bluez on root from 4.101-r6.0 to 5.3-r0.0...
Downloading http://192.168.7.1/upg-ipk/i586/libasound-module-bluez_5.3-r0.0_i586.ipk.
Removing obsolete file /usr/share/alsa/bluetooth.conf.
Removing obsolete file /usr/lib/alsa-lib/libasound_module_ctl_bluetooth.so.
Removing obsolete file /usr/lib/alsa-lib/libasound_module_pcm_bluetooth.so.
Upgrading bluez5 (5.3-r0.0) to root...
Downloading http://192.168.7.1/upg-ipk/i586/bluez5_5.3-r0.0_i586.ipk.
Installing libical (0.48-r0.0) to root...
Downloading http://192.168.7.1/upg-ipk/i586/libical_0.48-r0.0_i586.ipk.
Removing package bluez4 from root...
Configuring libical.
Configuring libasound-module-bluez.
Configuring bluez5.
root@qemux86:~# opkg list-installed | grep bluez
bluez5 - 5.3-r0.0
libasound-module-bluez - 5.3-r0.0
root@qemux86:~# 

Case 2: bluez4 and bluez5: reciprocal RCONFLICTS
root@qemux86:~# opkg list-upgradable
libasound-module-bluez - 4.101-r6.0 - 5.3-r0.0
root@qemux86:~# opkg install bluez5
Installing bluez5 (5.3-r0.0) to root...
Collected errors:
 * check_conflicts_for: The following packages conflict with bluez5:
 * check_conflicts_for: 	bluez4 * 
 * opkg_install_cmd: Cannot install package bluez5.
root@qemux86:~# opkg upgrade bluez5
Installing bluez5 (5.3-r0.0) to root...
Collected errors:
 * check_conflicts_for: The following packages conflict with bluez5:
 * check_conflicts_for: 	bluez4 * 
root@qemux86:~# opkg list-installed | grep bluez
bluez4 - 4.101-r6.0
libasound-module-bluez - 4.101-r6.0
root@qemux86:~# opkg remove bluez4
No packages removed.
Collected errors:
 * print_dependents_warning: Package bluez4 is depended upon by packages:
 * print_dependents_warning: 	ofono
 * print_dependents_warning: 	packagegroup-base-bluetooth
 * print_dependents_warning: 	connman
 * print_dependents_warning: These might cease to work if package bluez4 is removed.

 * print_dependents_warning: Force removal of this package with --force-depends.
 * print_dependents_warning: Force removal of this package and its dependents
 * print_dependents_warning: with --force-removal-of-dependent-packages.
root@qemux86:~# opkg remove --force-depends bluez4
Removing package bluez4 from root...
root@qemux86:~# opkg list-installed | grep bluez
libasound-module-bluez - 4.101-r6.0
root@qemux86:~# opkg install bluez5
Installing bluez5 (5.3-r0.0) to root...
Downloading http://192.168.7.1/upg-ipk/i586/bluez5_5.3-r0.0_i586.ipk.
Installing libical (0.48-r0.0) to root...
Downloading http://192.168.7.1/upg-ipk/i586/libical_0.48-r0.0_i586.ipk.
Configuring libical.
Configuring bluez5.
root@qemux86:~# opkg list-installed | grep bluez
bluez5 - 5.3-r0.0
libasound-module-bluez - 4.101-r6.0
root@qemux86:~# 

Cristian Iorga (2):
  bluez5: new package for v5.7
  bluez4: conflicts with/replaces bluez5

 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    3 +
 .../bluez5/bluez5-5.7/bluetooth.conf               |   16 +++++
 meta/recipes-connectivity/bluez5/bluez5.inc        |   69 ++++++++++++++++++++
 meta/recipes-connectivity/bluez5/bluez5_5.7.bb     |    5 ++
 4 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5-5.7/bluetooth.conf
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5.inc
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.7.bb

-- 
1.7.10.4


