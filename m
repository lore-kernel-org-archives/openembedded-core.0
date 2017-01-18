Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0394771A21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 18:31:56 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 18 Jan 2017 10:31:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,250,1477983600"; d="scan'208";a="54537365"
Received: from bitbang.jf.intel.com ([10.7.199.68])
	by orsmga005.jf.intel.com with ESMTP; 18 Jan 2017 10:31:56 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jan 2017 10:31:51 -0800
Message-Id: <400a0c358ad9a38c2210858098aa414bf5976274.1484764234.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1484764234.git.randy.e.witt@linux.intel.com>
References: <cover.1484764234.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 2/3] image-container.bbclass: Error if not using linux-dummy
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
X-List-Received-Date: Wed, 18 Jan 2017 18:31:57 -0000

In the typical case of a container, the user doesn't particularly care
about the kernel version used. Since using linux-dummy prevents building
a kernel in the most common case, alert the user if they choose a
container image, but don't also specify linux-dummy.

In the cases the user actually does want to build against particular
kernel headers, etc, they can override by setting
IMAGE_CONTAINER_NO_DUMMY = "1".

[YOCTO #9502]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/image-container.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes/image-container.bbclass b/meta/classes/image-container.bbclass
index a10ee32..f002858 100644
--- a/meta/classes/image-container.bbclass
+++ b/meta/classes/image-container.bbclass
@@ -1,3 +1,21 @@
 ROOTFS_BOOTSTRAP_INSTALL = ""
 IMAGE_TYPES_MASKED += "container"
 IMAGE_TYPEDEP_container = "tar.bz2"
+
+python __anonymous() {
+    if "container" in d.getVar("IMAGE_FSTYPES") and \
+       d.getVar("IMAGE_CONTAINER_NO_DUMMY") != "1" and \
+       "linux-dummy" not in d.getVar("PREFERRED_PROVIDER_virtual/kernel"):
+        msg = '"container" is in IMAGE_FSTYPES, but ' \
+              'PREFERRED_PROVIDER_virtual/kernel is not "linux-dummy". ' \
+              'Unless a particular kernel is needed, using linux-dummy will ' \
+              'prevent a kernel from being built, which can reduce ' \
+              'build times. If you don\'t want to use "linux-dummy", set ' \
+              '"IMAGE_CONTAINER_NO_DUMMY" to "1".'
+
+        # Raising skip recipe was Paul's clever idea. It causes the error to
+        # only be shown for the recipes actually requested to build, rather
+        # than bb.fatal which would appear for all recipes inheriting the
+        # class.
+        raise bb.parse.SkipRecipe(msg)
+}
-- 
2.9.3


