Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QWkRr-0005vy-DV
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 09:23:35 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jun 2011 00:20:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,369,1304319600"; d="scan'208";a="18377175"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga001.fm.intel.com with ESMTP; 15 Jun 2011 00:20:07 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jun 2011 15:19:56 +0800
Message-Id: <2f097aecfdf6c47abe8208da37f35f3f5a447148.1308122189.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <cover.1308122189.git.dexuan.cui@intel.com>
References: <cover.1308122189.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1308122189.git.dexuan.cui@intel.com>
References: <cover.1308122189.git.dexuan.cui@intel.com>
Subject: [PATCH 1/2] glproto: Revert "glxproto: make GLX swap event struct match spec"
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
X-List-Received-Date: Wed, 15 Jun 2011 07:23:35 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../restore_the_old_xGLXBufferSwapComplete.patch   |   53 ++++++++++++++++++++
 meta/recipes-graphics/xorg-proto/glproto_1.4.13.bb |    3 +-
 2 files changed, 55 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-proto/glproto/restore_the_old_xGLXBufferSwapComplete.patch

diff --git a/meta/recipes-graphics/xorg-proto/glproto/restore_the_old_xGLXBufferSwapComplete.patch b/meta/recipes-graphics/xorg-proto/glproto/restore_the_old_xGLXBufferSwapComplete.patch
new file mode 100644
index 0000000..19f41c9
--- /dev/null
+++ b/meta/recipes-graphics/xorg-proto/glproto/restore_the_old_xGLXBufferSwapComplete.patch
@@ -0,0 +1,53 @@
+Upstream-Status: Inappropriate [backport from upstream]
+
+In May, people already reported the mesa-dri build issue when upgrading to
+glproto-1.4.13 and dri2proto-2.4:
+http://lists.freedesktop.org/archives/mesa-dev/2011-May/007331.html
+
+The story is: Jesse tried to change the definitions of some structs in
+glproto, dri2proto and mesa-dri, but the change in mesa-dri side was accepted
+and then reverted, see
+http://cgit.freedesktop.org/mesa/mesa/commit/?id=dc4a3edcf9d414d5098618d5d3b79d8dd90adcc3
+
+so in glproto and dri2proto's sides, we have to revert the change, too:
+http://cgit.freedesktop.org/xorg/proto/glproto/commit/?id=7196c9441af941be74180f8e8d4e10a08659b80f
+
+We could remove this patch when upgrading to newer glproto, dri2proto and
+mesa-dri in future.
+
+Wed Jun 15 14:33:14 CST 2011
+Dexuan Cui <dexuan.cui@intel.com>
+
+-------------------------------------------------------
+
+commit 7196c9441af941be74180f8e8d4e10a08659b80f
+Author: Jesse Barnes <jbarnes@virtuousgeek.org>
+Date:   Thu May 5 09:21:19 2011 -0700
+
+    Revert "glxproto: make GLX swap event struct match spec"
+    
+    This reverts commit f5403828c68af0f12c79c0504df0a4781ca84b2b.
+    
+    This broke compatibility with existing code, so revert in favor of a new
+    struct definition instead.
+
+diff --git a/glxproto.h b/glxproto.h
+index dfa0647..0ff44e3 100644
+--- a/glxproto.h
++++ b/glxproto.h
+@@ -1375,13 +1375,13 @@ typedef struct {
+     BYTE pad;
+     CARD16 sequenceNumber B16;
+     CARD16 event_type B16;
+-    CARD16 pad2;
+     CARD32 drawable;
+     CARD32 ust_hi B32;
+     CARD32 ust_lo B32;
+     CARD32 msc_hi B32;
+     CARD32 msc_lo B32;
+-    CARD32 sbc B32;
++    CARD32 sbc_hi B32;
++    CARD32 sbc_lo B32;
+ } xGLXBufferSwapComplete;
+ 
+ /************************************************************************/
diff --git a/meta/recipes-graphics/xorg-proto/glproto_1.4.13.bb b/meta/recipes-graphics/xorg-proto/glproto_1.4.13.bb
index 38b17b6..7ba9831 100644
--- a/meta/recipes-graphics/xorg-proto/glproto_1.4.13.bb
+++ b/meta/recipes-graphics/xorg-proto/glproto_1.4.13.bb
@@ -1,4 +1,5 @@
 require xorg-proto-common.inc
+SRC_URI += "file://restore_the_old_xGLXBufferSwapComplete.patch"
 
 SUMMARY = "OpenGL: X OpenGL extension headers"
 
@@ -10,7 +11,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d44ed0146997856304dfbb512a59a8de \
                     file://glxproto.h;beginline=4;endline=32;md5=6b79c570f644363b356456e7d44471d9"
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 BBCLASSEXTEND = "nativesdk"
-- 
1.7.1



