Return-Path: <yin.thong.choong@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5795177E91
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 01:20:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 22 Jun 2017 18:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,375,1493708400"; d="scan'208";a="1144017453"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga001.jf.intel.com with ESMTP; 22 Jun 2017 18:20:25 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jun 2017 11:09:43 -0700
Message-Id: <1498154983-6605-1-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: paul.eggleton@intel.com, saul.wold@intel.com
Subject: [PATCH v6] image_types.bbclass: Prompt error message on missing setting in UBI and UBIFS
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
X-List-Received-Date: Fri, 23 Jun 2017 01:20:24 -0000

From: Choong YinThong <yin.thong.choong@intel.com>

Prompt error message to guide user add argument
MKUBIFS_ARGS and UBINIZE_ARGS on
every UBI and UBIFS image creation.

[YOCTO #11589]

Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
---
 meta/classes/image_types.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 7749b00..f8692dc 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -145,6 +145,12 @@ UBI_VOLNAME ?= "${MACHINE}-rootfs"
 multiubi_mkfs() {
 	local mkubifs_args="$1"
 	local ubinize_args="$2"
+    
+        # Added prompt error message for ubi and ubifs image creation.
+        if [ -z "$mkubifs_args"] || [ -z "$ubinize_args" ]; then
+            bbfatal "MKUBIFS_ARGS and UBINIZE_ARGS have to be set, see http://www.linux-mtd.infradead.org/faq/ubifs.html for details"
+        fi
+    
 	if [ -z "$3" ]; then
 		local vname=""
 	else
-- 
2.7.4


