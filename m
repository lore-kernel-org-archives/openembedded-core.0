Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 226A66B8B9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 16:04:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Aug 2013 09:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,921,1367996400"; d="scan'208";a="389202987"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2013 09:03:56 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2013 19:05:36 +0300
Message-Id: <7e1d9bb3b42c08f4337e717e959326014f0144c5.1377014441.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377014441.git.cristian.iorga@intel.com>
References: <cover.1377014441.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1377014441.git.cristian.iorga@intel.com>
References: <cover.1377014441.git.cristian.iorga@intel.com>
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
X-List-Received-Date: Tue, 20 Aug 2013 16:04:34 -0000

Register directories to be opened with PCManFM
filemanager using xdg-open in Build Appliance.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-graphics/builder/builder_0.1.bb             | 2 +-
 meta/recipes-graphics/builder/files/builder_hob_start.sh | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 78d41e5..1e8c977 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "New user to do specific job"
 DESCRIPTION = "This recipe create a new user named ${PN}, who is used for specific jobs like building. The task can be auto started via mini X"
 SECTION = "x11"
-PR = "r6"
+PR = "r7"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://builder_hob_start.sh;endline=5;md5=84796c3c41785d86100fdabcbdade00e"
 
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


