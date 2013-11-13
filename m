Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 42C896D868
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 19:06:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2013 11:02:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="408304566"
Received: from mcmahond-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.174])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2013 11:06:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2013 19:05:58 +0000
Message-Id: <1384369558-20194-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] classes/image-empty: remove
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
X-List-Received-Date: Wed, 13 Nov 2013 19:06:05 -0000

We don't actually need this dummy class; "inherit" can be used with an
expression that evaluates to nothing with current BitBake.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image-empty.bbclass |  0
 meta/classes/image.bbclass       | 12 ++++++------
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/classes/image-empty.bbclass

diff --git a/meta/classes/image-empty.bbclass b/meta/classes/image-empty.bbclass
deleted file mode 100644
index e69de29..0000000
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 422a826..bc60f0d 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -95,15 +95,15 @@ def build_live(d):
         d.setVar('NOISO', base_contains('IMAGE_FSTYPES', "iso", "0", "1", d))
         d.setVar('NOHDD', base_contains('IMAGE_FSTYPES', "hddimg", "0", "1", d))
         if d.getVar('NOISO', True) == "0" or d.getVar('NOHDD', True) == "0":
-            return "live"
-        return "empty"
-    return "live"
+            return "image-live"
+        return ""
+    return "image-live"
 
 IMAGE_TYPE_live = "${@build_live(d)}"
 
-inherit image-${IMAGE_TYPE_live}
-IMAGE_TYPE_vmdk = '${@base_contains("IMAGE_FSTYPES", "vmdk", "vmdk", "empty", d)}'
-inherit image-${IMAGE_TYPE_vmdk}
+inherit ${IMAGE_TYPE_live}
+IMAGE_TYPE_vmdk = '${@base_contains("IMAGE_FSTYPES", "vmdk", "image-vmdk", "", d)}'
+inherit ${IMAGE_TYPE_vmdk}
 
 python () {
     deps = " " + imagetypes_getdepends(d)
-- 
1.8.1.2


