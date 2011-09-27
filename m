Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R8MFA-0003aT-De
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 03:13:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Sep 2011 18:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="56151558"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 26 Sep 2011 18:08:30 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2011 09:04:00 +0800
Message-Id: <0353223ac45e2a44a70cccfde18387b21aacfe28.1317084972.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <4f9d7fab604a93ebdc478178c82746e0e10f8cde.1317084972.git.edwin.zhai@intel.com>
References: <4f9d7fab604a93ebdc478178c82746e0e10f8cde.1317084972.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1317084972.git.edwin.zhai@intel.com>
References: <cover.1317084972.git.edwin.zhai@intel.com>
Subject: [PATCH 2/3] Config xorg.conf with eGalax touchscreen input driver
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
X-List-Received-Date: Tue, 27 Sep 2011 01:13:56 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../xserver-xf86-config/pegasus/xorg.conf          |   10 ++++++++++
 .../xorg-xserver/xserver-xf86-config_0.1.bbappend  |    2 ++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/meta-pegasus/recipes-graphics/xorg-xserver/xserver-xf86-config/pegasus/xorg.conf b/meta-pegasus/recipes-graphics/xorg-xserver/xserver-xf86-config/pegasus/xorg.conf
index e18b911..634d9ad 100644
--- a/meta-pegasus/recipes-graphics/xorg-xserver/xserver-xf86-config/pegasus/xorg.conf
+++ b/meta-pegasus/recipes-graphics/xorg-xserver/xserver-xf86-config/pegasus/xorg.conf
@@ -18,9 +18,19 @@ EndSection
 Section "ServerLayout"
     Identifier    "Default Layout"
     Screen        "Default Screen"
+    InputDevice   "EETI" "SendCoreEvents"
 EndSection
 
 Section "ServerFlags"
     Option        "DontZap"  "0"
     Option	  "AutoAddDevices" "False"
 EndSection
+
+### eGalax Touch Configuration ###
+Section "InputDevice"
+        Identifier "EETI"
+        Driver "egalax"
+        Option "Device" "hidraws"
+        Option "Parameters" "/var/lib/eeti.param"
+        Option "ScreenNo" "0"
+EndSection
diff --git a/meta-pegasus/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend b/meta-pegasus/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
index 4b8d0e6..fb6e1e2 100644
--- a/meta-pegasus/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
+++ b/meta-pegasus/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
@@ -1,3 +1,5 @@
 THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
 FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
 
+RDEPENDS += "xf86-input-egalax"
+
-- 
1.7.1



