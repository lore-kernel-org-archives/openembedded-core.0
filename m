Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U4w6C-0004fI-8b
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 17:19:20 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Feb 2013 08:02:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,643,1355126400"; d="scan'208";a="261103263"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 11 Feb 2013 08:03:21 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2013 18:04:11 +0200
Message-Id: <1360598651-13765-2-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1360598651-13765-1-git-send-email-constantinx.musca@intel.com>
References: <1360598651-13765-1-git-send-email-constantinx.musca@intel.com>
Subject: [PATCH 2/2] gcc-cross-canadian: enable multilib support
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
X-List-Received-Date: Mon, 11 Feb 2013 16:19:20 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc             | 2 +-
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc  | 1 +
 meta/recipes-devtools/gcc/gcc-multilib-config.inc | 3 ++-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 991f37c..8735e48 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r17"
+PR = "r18"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index f1824fa..10ddacf 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -6,3 +6,4 @@ BPN = "gcc"
 
 DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-${HOST_PREFIX}libc-for-gcc nativesdk-gettext"
 
+GCCMULTILIB = "--enable-multilib"
diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index 9403aab..f89aa8e 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -41,7 +41,8 @@ python gcc_multilib_setup() {
         return
 
     mlprefix = d.getVar('MLPREFIX', True)
-    if ('%sgcc' % mlprefix) != d.getVar('PN', True):
+    pn = d.getVar('PN', True)
+    if ('%sgcc' % mlprefix) != pn and (not pn.startswith('gcc-cross-canadian')):
         return
 
 
-- 
1.7.11.7



