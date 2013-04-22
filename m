Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UUBxv-0005e4-HE
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 10:19:12 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Apr 2013 00:59:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,525,1363158000"; d="scan'208";a="322150552"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2013 01:01:30 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2013 11:01:22 +0300
Message-Id: <cba51f6bd4486e894e639f876a2ba466c1d000c0.1366615922.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1366615922.git.laurentiu.palcu@intel.com>
References: <cover.1366615922.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1366615922.git.laurentiu.palcu@intel.com>
References: <cover.1366615922.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/4] fontcache.bbclass: do not exit with 1 after installing intercept hook
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
X-List-Received-Date: Mon, 22 Apr 2013 08:19:16 -0000

This will allow to register, in a single postinstall, multiple hooks.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/fontcache.bbclass |   10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index 0bc309a..9136c5a 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -8,19 +8,13 @@ inherit qemu
 
 FONT_PACKAGES ??= "${PN}"
 
-#
-# On host, the postinstall MUST return 1 because we do not know if the intercept
-# hook will succeed. If it does succeed, than the packages will be marked as
-# installed.
-#
 fontcache_common() {
 if [ "x$D" != "x" ] ; then
 	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} bindir=${bindir} \
 		libdir=${libdir} base_libdir=${base_libdir}
-	exit 1
+else
+	fc-cache
 fi
-
-fc-cache
 }
 
 python populate_packages_append() {
-- 
1.7.9.5



