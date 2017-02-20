Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6AABA6FF76
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 05:40:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2017 21:40:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,184,1484035200"; d="scan'208";a="1100059718"
Received: from swold-mobl2.amr.corp.intel.com ([10.255.229.175])
	by orsmga001.jf.intel.com with ESMTP; 19 Feb 2017 21:40:46 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Sun, 19 Feb 2017 21:40:43 -0800
Message-Id: <1487569243-28767-1-git-send-email-sgw@linux.intel.com>
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
X-List-Received-Date: Mon, 20 Feb 2017 05:40:47 -0000

This allows a native package's recipe-sysroot-native to be populated with
that packages native image files.  This in turns allows it to be used by
scripts or other tools without creating un-necessary DEPENDS.

An example of this is systemtap-native and the crosstap script.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
V2 - Removes "before do_build" so not force the change

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
+addtask addto_recipe_sysroot after do_populate_sysroot
+
 inherit nopackages
 
 do_packagedata[stamp-extra-info] = ""
-- 
2.7.4


