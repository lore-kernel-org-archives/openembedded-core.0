Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AA5D565CBB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 23:46:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Feb 2017 15:46:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,169,1484035200"; d="scan'208";a="46607014"
Received: from swold-mobl2.amr.corp.intel.com ([10.252.195.61])
	by orsmga002.jf.intel.com with ESMTP; 16 Feb 2017 15:46:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu, 16 Feb 2017 15:46:01 -0800
Message-Id: <1487288761-22432-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] native.bbclass: populate native recipe with it's files
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
X-List-Received-Date: Thu, 16 Feb 2017 23:46:02 -0000

This allows a native package's recipe-sysroot-native to be populated with
that packages native image files.  This in turns allows it to be used by
scripts or other tools without creating un-necessary DEPENDS.

An example of this is systemtap-native and the crosstap script.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/native.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index ec91fc3..d9dfea7 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -174,6 +174,11 @@ python native_virtclass_handler () {
 addhandler native_virtclass_handler
 native_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
 
+python do_addto_recipe_sysroot () {
+    bb.build.exec_func("extend_recipe_sysroot", d)
+}
+addtask addto_recipe_sysroot after do_populate_sysroot before do_build
+
 inherit nopackages
 
 do_packagedata[stamp-extra-info] = ""
-- 
2.7.4


