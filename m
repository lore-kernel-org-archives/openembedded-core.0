Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QtKSs-0002er-8W
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 16:17:58 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Aug 2011 07:13:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="38250604"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by orsmga002.jf.intel.com with ESMTP; 16 Aug 2011 07:13:22 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 22:13:18 +0800
Message-Id: <e53f2287f25d19c07f7a2f8918f388a6c74c4f10.1313503779.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313503778.git.dexuan.cui@intel.com>
References: <cover.1313503778.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1313503778.git.dexuan.cui@intel.com>
References: <cover.1313503778.git.dexuan.cui@intel.com>
Subject: [PATCH 08/10] glproto: upgrade from 1.4.13 to 1.4.14
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
X-List-Received-Date: Tue, 16 Aug 2011 14:17:59 -0000

The patch has been integrated into 1.4.14 so let's remove it.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../restore_the_old_xGLXBufferSwapComplete.patch   |   53 --------------------
 .../{glproto_1.4.13.bb => glproto_1.4.14.bb}       |    7 +--
 2 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-proto/glproto/restore_the_old_xGLXBufferSwapComplete.patch
 rename meta/recipes-graphics/xorg-proto/{glproto_1.4.13.bb => glproto_1.4.14.bb} (68%)

diff --git a/meta/recipes-graphics/xorg-proto/glproto/restore_the_old_xGLXBufferSwapComplete.patch b/meta/recipes-graphics/xorg-proto/glproto/restore_the_old_xGLXBufferSwapComplete.patch
deleted file mode 100644
index 19f41c9..0000000
--- a/meta/recipes-graphics/xorg-proto/glproto/restore_the_old_xGLXBufferSwapComplete.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Upstream-Status: Inappropriate [backport from upstream]
-
-In May, people already reported the mesa-dri build issue when upgrading to
-glproto-1.4.13 and dri2proto-2.4:
-http://lists.freedesktop.org/archives/mesa-dev/2011-May/007331.html
-
-The story is: Jesse tried to change the definitions of some structs in
-glproto, dri2proto and mesa-dri, but the change in mesa-dri side was accepted
-and then reverted, see
-http://cgit.freedesktop.org/mesa/mesa/commit/?id=dc4a3edcf9d414d5098618d5d3b79d8dd90adcc3
-
-so in glproto and dri2proto's sides, we have to revert the change, too:
-http://cgit.freedesktop.org/xorg/proto/glproto/commit/?id=7196c9441af941be74180f8e8d4e10a08659b80f
-
-We could remove this patch when upgrading to newer glproto, dri2proto and
-mesa-dri in future.
-
-Wed Jun 15 14:33:14 CST 2011
-Dexuan Cui <dexuan.cui@intel.com>
-
--------------------------------------------------------
-
-commit 7196c9441af941be74180f8e8d4e10a08659b80f
-Author: Jesse Barnes <jbarnes@virtuousgeek.org>
-Date:   Thu May 5 09:21:19 2011 -0700
-
-    Revert "glxproto: make GLX swap event struct match spec"
-    
-    This reverts commit f5403828c68af0f12c79c0504df0a4781ca84b2b.
-    
-    This broke compatibility with existing code, so revert in favor of a new
-    struct definition instead.
-
-diff --git a/glxproto.h b/glxproto.h
-index dfa0647..0ff44e3 100644
---- a/glxproto.h
-+++ b/glxproto.h
-@@ -1375,13 +1375,13 @@ typedef struct {
-     BYTE pad;
-     CARD16 sequenceNumber B16;
-     CARD16 event_type B16;
--    CARD16 pad2;
-     CARD32 drawable;
-     CARD32 ust_hi B32;
-     CARD32 ust_lo B32;
-     CARD32 msc_hi B32;
-     CARD32 msc_lo B32;
--    CARD32 sbc B32;
-+    CARD32 sbc_hi B32;
-+    CARD32 sbc_lo B32;
- } xGLXBufferSwapComplete;
- 
- /************************************************************************/
diff --git a/meta/recipes-graphics/xorg-proto/glproto_1.4.13.bb b/meta/recipes-graphics/xorg-proto/glproto_1.4.14.bb
similarity index 68%
rename from meta/recipes-graphics/xorg-proto/glproto_1.4.13.bb
rename to meta/recipes-graphics/xorg-proto/glproto_1.4.14.bb
index 7ba9831..76d9502 100644
--- a/meta/recipes-graphics/xorg-proto/glproto_1.4.13.bb
+++ b/meta/recipes-graphics/xorg-proto/glproto_1.4.14.bb
@@ -1,5 +1,4 @@
 require xorg-proto-common.inc
-SRC_URI += "file://restore_the_old_xGLXBufferSwapComplete.patch"
 
 SUMMARY = "OpenGL: X OpenGL extension headers"
 
@@ -11,10 +10,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d44ed0146997856304dfbb512a59a8de \
                     file://glxproto.h;beginline=4;endline=32;md5=6b79c570f644363b356456e7d44471d9"
 
-PR = "r1"
+PR = "r0"
 PE = "1"
 
 BBCLASSEXTEND = "nativesdk"
 
-SRC_URI[md5sum] = "9542f2d36751a8ad7eae9d8e176f70d4"
-SRC_URI[sha256sum] = "fc0a94d4df003cb6b6953173e6498d9c4c3268ee24bcc46a1172a1e1dbd3d742"
+SRC_URI[md5sum] = "f48257daf0017f7a7667e5bf48ca3578"
+SRC_URI[sha256sum] = "7aaf555a100a63c67dbffc63153dcaaa3de1a36e605a2e98fce63f64089ff999"
-- 
1.7.6



