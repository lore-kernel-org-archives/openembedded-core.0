Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F16706B8C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 18:04:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Aug 2013 11:03:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,921,1367996400"; d="scan'208";a="389269422"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2013 11:03:50 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2013 21:05:29 +0300
Message-Id: <4ebf834a2a35217d96f4d7e4a43efd141ddad752.1377021737.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377021737.git.cristian.iorga@intel.com>
References: <cover.1377021737.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1377021737.git.cristian.iorga@intel.com>
References: <cover.1377021737.git.cristian.iorga@intel.com>
Subject: [PATCH 3/3] builder: register directories with pcmanfm
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
X-List-Received-Date: Tue, 20 Aug 2013 18:04:09 -0000

Register directories to be opened with PCManFM
filemanager using xdg-open in Build Appliance.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-graphics/builder/files/builder_hob_start.sh | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-graphics/builder/files/builder_hob_start.sh b/meta/recipes-graphics/builder/files/builder_hob_start.sh
index 40616f5..b3a0540 100644
--- a/meta/recipes-graphics/builder/files/builder_hob_start.sh
+++ b/meta/recipes-graphics/builder/files/builder_hob_start.sh
@@ -9,6 +9,15 @@ export PSEUDO_LOCALSTATEDIR=/home/builder/pseudo
 export PSEUDO_LIBDIR=/usr/lib/pseudo/lib64
 export GIT_PROXY_COMMAND=/home/builder/poky/scripts/oe-git-proxy
 
+#start pcmanfm in daemon mode to allow asynchronous launch
+pcmanfm -d&
+
+#register folders to open with PCManFM filemanager
+if [ ! -d /home/ubik/tmp/.local/share/applications ]; then
+    mkdir -p /home/builder/.local/share/applications/
+    xdg-mime default pcmanfm.desktop inode/directory
+fi
+
 cd /home/builder/poky
 . ./oe-init-build-env
 
-- 
1.8.1.2


