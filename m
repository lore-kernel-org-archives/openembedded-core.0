Return-Path: <yin.thong.choong@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 27C21719A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 02:17:33 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jun 2017 19:17:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,371,1493708400"; d="scan'208";a="117350397"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga005.fm.intel.com with ESMTP; 21 Jun 2017 19:17:34 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Jun 2017 12:06:12 -0700
Message-Id: <1498071972-142545-1-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: paul.eggleton@intel.com, saul.wold@intel.com
Subject: [PATCH v5] image_types.bbclass: Prompt error message on missing setting in UBI and UBIFS
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
X-List-Received-Date: Thu, 22 Jun 2017 02:17:35 -0000

From: Choong YinThong <yin.thong.choong@intel.com>

Prompt error message to guide user add argument
MKUBIFS_ARGS and UBINIZE_ARGS on
every UBI and UBIFS image creation.

[YOCTO #11589]

Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
---
 meta/classes/image_types.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 7749b00..0779247 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -145,6 +145,14 @@ UBI_VOLNAME ?= "${MACHINE}-rootfs"
 multiubi_mkfs() {
 	local mkubifs_args="$1"
 	local ubinize_args="$2"
+    
+        # Added prompt error message for ubi and ubifs image creation.
+        if [ -z "$mkubifs_args"] || [ -z "$ubinize_args" ]; then
+            bberror "MKUBIFS_ARGS and UBINIZE_ARGS argument have to set for UBI and UBIFS image creation."
+            bberror "Detail please visit this link http://www.linux-mtd.infradead.org/faq/ubifs.html"
+            return
+        fi
+    
 	if [ -z "$3" ]; then
 		local vname=""
 	else
-- 
2.7.4


