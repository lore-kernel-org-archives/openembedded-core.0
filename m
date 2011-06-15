Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QWkRs-0005w0-QJ
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 09:23:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Jun 2011 00:20:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,369,1304319600"; d="scan'208";a="13705005"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga002.jf.intel.com with ESMTP; 15 Jun 2011 00:20:08 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jun 2011 15:19:57 +0800
Message-Id: <08f912202efd72b46bae7439a778806c55b45e3c.1308122189.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <cover.1308122189.git.dexuan.cui@intel.com>
References: <cover.1308122189.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1308122189.git.dexuan.cui@intel.com>
References: <cover.1308122189.git.dexuan.cui@intel.com>
Subject: [PATCH 2/2] dri2proto: Revert "dri2proto: make DRI2 swap event match GLX spec"
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
X-List-Received-Date: Wed, 15 Jun 2011 07:23:37 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../restore_to_old_xDRI2BufferSwapComplete.patch   |   53 ++++++++++++++++++++
 meta/recipes-graphics/xorg-proto/dri2proto_2.4.bb  |    3 +-
 2 files changed, 55 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-proto/dri2proto/restore_to_old_xDRI2BufferSwapComplete.patch

diff --git a/meta/recipes-graphics/xorg-proto/dri2proto/restore_to_old_xDRI2BufferSwapComplete.patch b/meta/recipes-graphics/xorg-proto/dri2proto/restore_to_old_xDRI2BufferSwapComplete.patch
new file mode 100644
index 0000000..e628f6d
--- /dev/null
+++ b/meta/recipes-graphics/xorg-proto/dri2proto/restore_to_old_xDRI2BufferSwapComplete.patch
@@ -0,0 +1,53 @@
+Upstream-Status: Inappropriate [backport from upstream]
+
+In May, people already reported the mesa-dri build issue when upgrading to
+glproto-1.4.13 and dri2proto-2.4:
+http://lists.freedesktop.org/archives/mesa-dev/2011-May/007331.html
+
+The story is: Jesse tried to change the definitions of some structs
+in glproto, dri2proto and mesa-dri, but the change in mesa-dri side was accepted
+and then reverted, see
+http://cgit.freedesktop.org/mesa/mesa/commit/?id=dc4a3edcf9d414d5098618d5d3b79d8dd90adcc3
+
+so in glproto and driproto's sides, we have to revert the change, too:
+http://cgit.freedesktop.org/xorg/proto/dri2proto/commit/?id=f3c211e1ae183dab5c7529814c9f42af2c29fc6c
+
+We could remove this patch when upgrading to newer glproto, dri2proto and
+mesa-dri in future.
+
+Wed Jun 15 14:33:14 CST 2011
+Dexuan Cui <dexuan.cui@intel.com>
+
+-------------------------------------------------------
+
+commit f3c211e1ae183dab5c7529814c9f42af2c29fc6c
+Author: Jesse Barnes <jbarnes@virtuousgeek.org>
+Date:   Thu May 5 09:22:39 2011 -0700
+
+    Revert "dri2proto: make DRI2 swap event match GLX spec"
+    
+    This reverts commit 0ca3778de195a82087d0f07415a1cf8fc94f5b0a.
+    
+    This broke compatibility by renaming existing struct fields.  So revert
+    in favor of a new struct.
+
+diff --git a/dri2proto.h b/dri2proto.h
+index ff76355..9708a4a 100644
+--- a/dri2proto.h
++++ b/dri2proto.h
+@@ -290,13 +290,13 @@ typedef struct {
+     CARD8 pad;
+     CARD16 sequenceNumber B16;
+     CARD16 event_type B16;
+-    CARD16 pad2;
+     CARD32 drawable B32;
+     CARD32 ust_hi B32;
+     CARD32 ust_lo B32;
+     CARD32 msc_hi B32;
+     CARD32 msc_lo B32;
+-    CARD32 sbc B32;
++    CARD32 sbc_hi B32;
++    CARD32 sbc_lo B32;
+ } xDRI2BufferSwapComplete;
+ #define sz_xDRI2BufferSwapComplete 32
+ 
diff --git a/meta/recipes-graphics/xorg-proto/dri2proto_2.4.bb b/meta/recipes-graphics/xorg-proto/dri2proto_2.4.bb
index 9d30e94..4861f7d 100644
--- a/meta/recipes-graphics/xorg-proto/dri2proto_2.4.bb
+++ b/meta/recipes-graphics/xorg-proto/dri2proto_2.4.bb
@@ -1,4 +1,5 @@
 require xorg-proto-common.inc
+SRC_URI += "file://restore_to_old_xDRI2BufferSwapComplete.patch"
 
 SUMMARY = "DRI2: Direct Rendering Infrastructure 2 headers"
 
@@ -10,7 +11,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e396fa91834f8786032cad2da5638f3 \
                     file://dri2proto.h;endline=31;md5=22f28bf68d01b533f26195e94b3ed8ca"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "0cdeb1e95901813385dc9576be272bd3"
 SRC_URI[sha256sum] = "ff156f178d48ab31beeb4be5eb39d5df7540791ba489a8d94c443bb99a2376f1"
-- 
1.7.1



