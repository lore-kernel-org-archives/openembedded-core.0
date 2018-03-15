Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id F1DE0788BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 17:01:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2018 10:01:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,311,1517904000"; d="scan'208";a="183077331"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 15 Mar 2018 10:01:44 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 18:54:58 +0200
Message-Id: <20180315165458.42134-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH] python3-native: fix build races in 'make regen-all'
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
X-List-Received-Date: Thu, 15 Mar 2018 17:01:45 -0000

Python 2.x and target Python 3.x do not have this issue.

[YOCTO #12596]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/python/python3-native_3.5.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.4.bb b/meta/recipes-devtools/python/python3-native_3.5.4.bb
index c8252539a99..a5dedb7aa75 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.4.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.4.bb
@@ -64,6 +64,8 @@ do_configure_append() {
 # Regenerate all of the generated files
 # This ensures that pgen and friends get created during the compile phase
 do_compile_prepend() {
+    # Has to be done ahead of other regen- targets due to https://bugs.python.org/issue33080
+    oe_runmake regen-importlib
     oe_runmake regen-all
 }
 
-- 
2.16.1


