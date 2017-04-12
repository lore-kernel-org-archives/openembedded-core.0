Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4369C77D36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 20:53:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Apr 2017 13:53:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,191,1488873600"; d="scan'208";a="955387882"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 12 Apr 2017 13:53:52 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id EFE6E6A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 13:53:42 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 23:40:56 +0300
Message-Id: <7dcec134a8e59a1a250623eb0be6a320ad36c2ce.1492029084.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1492029084.git.ed.bartosh@linux.intel.com>
References: <cover.1492029084.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/5] qemu-helper-native: prepare native sysroot for runqemu
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
X-List-Received-Date: Wed, 12 Apr 2017 20:53:51 -0000

From: brian avery <brian.avery@intel.com>

Make sure that native sysroot contains qemu and tunctl binaries for
runqemu usage:
  - excluded native sysroot from rm_work
  - added qemu-native to DEPENDS to put qemu binaries into native sysroot
  - forced addto_recipe_sysroot task

[YOCTO #11266]
[YOCTO #11193]

Signed-off-by: brian avery <brian.avery@intel.com>
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
index 8d27c4d..27d5315 100644
--- a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
@@ -19,3 +19,7 @@ do_install() {
 	install -d ${D}${bindir}
 	install tunctl ${D}${bindir}/
 }
+
+RM_WORK_EXCLUDE_ITEMS += "recipe-sysroot-native"
+DEPENDS += "qemu-native"
+addtask addto_recipe_sysroot after do_populate_sysroot before do_build
-- 
2.1.4


