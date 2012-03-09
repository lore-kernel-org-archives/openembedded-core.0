Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1S5uGJ-0005rY-K3
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 08:29:17 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Mar 2012 23:20:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="116135614"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by orsmga001.jf.intel.com with ESMTP; 08 Mar 2012 23:19:33 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2012 15:19:57 +0800
Message-Id: <6d24f6bd75d4c9da78368d3cae9dbbc8a470b2b6.1331277565.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1331277565.git.dexuan.cui@intel.com>
References: <cover.1331277565.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1331277565.git.dexuan.cui@intel.com>
References: <cover.1331277565.git.dexuan.cui@intel.com>
Subject: [PATCH 1/1] image_types: ensure .rootfs.ext3 is created before vmdk is created.
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
X-List-Received-Date: Fri, 09 Mar 2012 07:29:18 -0000

In the case of self-hosted-image.bb, IMAGE_FSTYPES = "vmdk", so the
variables alltypes and subimages don't contain ext3, and  .rootfs.ext3
won't be created, and finally the generated .hddimg and .vmdk don't have
an actual rootfs -- the size of the .vmdk file is only about 9MB.

[YOCTO #2067]

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/classes/image_types.bbclass |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 8b82018..e92f519 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -26,13 +26,19 @@ def get_imagecmds(d):
     # Live and VMDK images will be processed via inheriting
     # bbclass and does not get processed here.
     # vmdk depend on live images also depend on ext3 so ensure its present
+    # Note: we need to ensure ext3 is in alltypes, otherwise, subimages may
+    # not contain ext3 and the .rootfs.ext3 file won't be created.
     if "vmdk" in types:
         if "ext3" not in types:
             types.append("ext3")
+        if "ext3" not in alltypes:
+            alltypes.append("ext3")
         types.remove("vmdk")
     if "live" in types:
         if "ext3" not in types:
             types.append("ext3")
+        if "ext3" not in alltypes:
+            alltypes.append("ext3")
         types.remove("live")
 
     if d.getVar('IMAGE_LINK_NAME', True):
-- 
1.7.6



