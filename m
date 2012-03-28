Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SCqDC-0003sv-8U
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 12:34:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Mar 2012 03:25:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="122592905"
Received: from gzhai-xps.sh.intel.com ([10.239.36.76])
	by orsmga001.jf.intel.com with ESMTP; 28 Mar 2012 03:25:38 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Mar 2012 18:10:26 +0800
Message-Id: <af00d9bd88e6322d5080f985a36ac38afdf67ea5.1332929227.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332929227.git.edwin.zhai@intel.com>
References: <cover.1332929227.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1332929227.git.edwin.zhai@intel.com>
References: <cover.1332929227.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] virtual/libgl: switch back to mesa-xlib for qemuarm/qemumips
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
X-List-Received-Date: Wed, 28 Mar 2012 10:34:42 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Still need mesa-xlib for emulation of GLX interface on qemuarm/qemumips, where
mesa-dri doesn't work for pure qemu emulator.

[YOCTO #2066] fixed.
---
 meta/conf/distro/include/default-providers.inc |    2 +-
 meta/recipes-graphics/mesa/mesa-xlib.inc       |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 54c90d3..3850a2f 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -5,7 +5,7 @@ PREFERRED_PROVIDER_virtual/db ?= "db"
 PREFERRED_PROVIDER_virtual/db-native ?= "db-native"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgl ?= "mesa-xlib"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "update-alternatives-cworth"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
diff --git a/meta/recipes-graphics/mesa/mesa-xlib.inc b/meta/recipes-graphics/mesa/mesa-xlib.inc
index b720e14..c431eab 100644
--- a/meta/recipes-graphics/mesa/mesa-xlib.inc
+++ b/meta/recipes-graphics/mesa/mesa-xlib.inc
@@ -1 +1,3 @@
 EXTRA_OECONF += " --with-driver=xlib --without-gallium-drivers"
+
+COMPATIBLE_MACHINE = "(qemuarm|qemumips|qemuppc)"
-- 
1.7.5.4



