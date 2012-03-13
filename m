Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7Mlp-0000I0-Cw
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 09:07:49 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Mar 2012 00:59:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128321814"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.137])
	by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2012 00:59:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:58:48 -0700
Message-Id: <53c38b9b030f3a2aa3f48baf84914596b46027c6.1331589797.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331589797.git.sgw@linux.intel.com>
References: <cover.1331589797.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331589797.git.sgw@linux.intel.com>
References: <cover.1331589797.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/23] image_types: ensure .rootfs.ext3 is created before vmdk is created.
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
X-List-Received-Date: Tue, 13 Mar 2012 08:07:49 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

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
1.7.7.6



