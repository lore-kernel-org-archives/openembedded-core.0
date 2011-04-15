Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QAmPx-0005iL-34
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Apr 2011 19:02:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Apr 2011 10:00:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,220,1301900400"; d="scan'208";a="679601307"
Received: from unknown (HELO helios) ([10.255.12.218])
	by fmsmga002.fm.intel.com with SMTP; 15 Apr 2011 10:00:25 -0700
Received: by helios (sSMTP sendmail emulation); Fri, 15 Apr 2011 18:00:18 +0100
Message-Id: <72ccbf03bcbec48a34d830c356e591a9139e3794.1302886579.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1302886579.git.paul.eggleton@linux.intel.com>
References: <cover.1302886579.git.paul.eggleton@linux.intel.com>
Old-Date: Fri, 15 Apr 2011 17:14:05 +0100
Date: Fri, 15 Apr 2011 18:00:18 +0100
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] netbase: automatically bring up usb0 on beagleboard
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
X-List-Received-Date: Fri, 15 Apr 2011 17:02:49 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Avoids manual configuration of the BeagleBoard xM's ethernet port (which
shows up as usb0).

Fixes [YOCTO #930]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../netbase/netbase-4.45/beagleboard/interfaces    |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/netbase/netbase-4.45/beagleboard/interfaces

diff --git a/meta/recipes-core/netbase/netbase-4.45/beagleboard/interfaces b/meta/recipes-core/netbase/netbase-4.45/beagleboard/interfaces
new file mode 100644
index 0000000..b6935c1
--- /dev/null
+++ b/meta/recipes-core/netbase/netbase-4.45/beagleboard/interfaces
@@ -0,0 +1,27 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+# Wireless interfaces
+iface wlan0 inet dhcp
+	wireless_mode managed
+	wireless_essid any
+	wpa-driver wext
+	wpa-conf /etc/wpa_supplicant.conf
+
+iface atml0 inet dhcp
+
+# Wired or wireless interfaces
+auto eth0
+iface eth0 inet dhcp
+iface eth1 inet dhcp
+
+# Ethernet/RNDIS gadget (g_ether) or LAN9514 on BeagleBoard xM
+auto usb0
+iface usb0 inet dhcp
+
+# Bluetooth networking
+iface bnep0 inet dhcp
+
-- 
1.7.1



