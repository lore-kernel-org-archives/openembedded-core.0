Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DEF7560842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 17:21:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2013 10:21:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,935,1367996400"; d="scan'208";a="385034942"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2013 10:21:29 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 20:23:09 +0300
Message-Id: <dc06de4ba9c628e37786d559929c12d65788790c.1377191890.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377191890.git.cristian.iorga@intel.com>
References: <cover.1377191890.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1377191890.git.cristian.iorga@intel.com>
References: <cover.1377191890.git.cristian.iorga@intel.com>
Subject: [PATCH v2 4/4] builder: register directories with pcmanfm
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
X-List-Received-Date: Thu, 22 Aug 2013 17:21:29 -0000

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


