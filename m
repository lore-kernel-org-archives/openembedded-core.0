Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA7D61485
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 14:34:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Jul 2013 07:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,988,1363158000"; d="scan'208";a="364215839"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2013 07:34:30 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2013 17:34:24 +0300
Message-Id: <6e25853547047169deceef0d58123e70d4b54839.1372861799.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372861799.git.laurentiu.palcu@intel.com>
References: <cover.1372861799.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1372861799.git.laurentiu.palcu@intel.com>
References: <cover.1372861799.git.laurentiu.palcu@intel.com>
Subject: [PATCH 4/4] shutdown-desktop: give entire path in Exec field
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
X-List-Received-Date: Wed, 03 Jul 2013 14:34:30 -0000

A normal user does not have /sbin in its PATH, by default, so having the
entire path here allows the correct execution when run as regular user.

[YOCTO #4345]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../shutdown-desktop/shutdown-desktop.bb           |    2 +-
 .../shutdown-desktop/shutdown.desktop              |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb b/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
index c5096c1..8287813 100644
--- a/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
+++ b/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
@@ -16,7 +16,7 @@ do_install() {
 
 pkg_postinst_${PN} () {
     grep -q qemuarm $D${sysconfdir}/hostname && \
-        sed -i $D${datadir}/applications/shutdown.desktop -e 's/^Exec=halt/Exec=reboot/' \
+        sed -i $D${datadir}/applications/shutdown.desktop -e 's#^Exec=/sbin/halt#Exec=/sbin/reboot#' \
         || true
 }
 
diff --git a/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop b/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop
index 2726889..23bd0f7 100644
--- a/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop
+++ b/meta/recipes-sato/shutdown-desktop/shutdown-desktop/shutdown.desktop
@@ -3,8 +3,8 @@ Encoding=UTF-8
 Type=Application
 Name=Shutdown
 Comment=Close down the machine safely
-Exec=halt
+Exec=/sbin/halt
 Icon=system-shutdown
 Terminal=false
 Categories=Utility;
-StartupNotify=true
\ No newline at end of file
+StartupNotify=true
-- 
1.7.9.5


