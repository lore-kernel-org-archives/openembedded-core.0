Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U5Ijf-0000zM-Px
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 17:29:51 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Feb 2013 08:11:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,650,1355126400"; d="scan'208";a="284742052"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2013 08:12:54 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2013 18:12:40 +0200
Message-Id: <7f6d4f25222429b4cb3d69ded28e68c38aa22fc4.1360684306.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360684306.git.laurentiu.palcu@intel.com>
References: <cover.1360684306.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360684306.git.laurentiu.palcu@intel.com>
References: <cover.1360684306.git.laurentiu.palcu@intel.com>
Subject: [PATCH 05/11] fontcache.bbclass: use the postinst_intercept script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 16:29:53 -0000

"Link" the package to the postinstall hook by running the
postinst_intercept script.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/fontcache.bbclass |   20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index 8381735..d3c1562 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -8,21 +8,15 @@ inherit qemu
 
 FONT_PACKAGES ??= "${PN}"
 
+#
+# On host, the postinstall MUST return 1 because we do not know if the intercept
+# hook will succeed. If it does succeed, than the packages will be marked as
+# installed.
+#
 fontcache_common() {
 if [ "x$D" != "x" ] ; then
-	if [ ! -f $INTERCEPT_DIR/update_font_cache ]; then
-		cat << "EOF" > $INTERCEPT_DIR/update_font_cache
-#!/bin/sh
-
-${@qemu_run_binary(d, '$D', '/usr/bin/fc-cache')} --sysroot=$D >/dev/null 2>&1
-
-if [ $? -ne 0 ]; then
-    exit 1
-fi
-
-EOF
-	fi
-	exit 0
+	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} bindir=${bindir}
+	exit 1
 fi
 
 fc-cache
-- 
1.7.9.5



