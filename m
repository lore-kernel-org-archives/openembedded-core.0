Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1R0vTB-0004ea-RZ
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 15:13:42 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Sep 2011 06:08:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,338,1312182000"; d="scan'208";a="49453116"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2011 06:08:39 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2011 21:08:39 +0800
Message-Id: <9bbc11b2a451bedd7ad79567ce3d58c1b6a9a5de.1315313790.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315313790.git.dexuan.cui@intel.com>
References: <cover.1315313790.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1315313790.git.dexuan.cui@intel.com>
References: <cover.1315313790.git.dexuan.cui@intel.com>
Subject: [PATCH 5/5] default-providers.inc: define update-alternatives and -native properly
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
X-List-Received-Date: Tue, 06 Sep 2011 13:13:42 -0000

For DEB packaging, we should use the -dpkg versions;
For IPK packaging, we should use the -cworth and opkg versions.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/conf/distro/include/default-providers.inc |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index d51ac64..f818f37 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -6,15 +6,14 @@ PREFERRED_PROVIDER_virtual/db-native ?= "db-native"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xf86"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xf86-dri-lite"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa-xlib"
-PREFERRED_PROVIDER_virtual/update-alternatives ?= "update-alternatives-cworth"
-PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
+PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "${@base_conditional('IMAGE_PKGTYPE', 'deb', 'update-alternatives-dpkg-native', 'opkg-native', d)}"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
 PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
 
 #
 # Default virtual runtime providers
 #
-VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-cworth"
+VIRTUAL-RUNTIME_update-alternatives ?= "${@base_conditional('IMAGE_PKGTYPE', 'deb', 'update-alternatives-dpkg', 'update-alternatives-cworth', d)}"
 
 #
 # Default recipe providers
-- 
1.7.6



