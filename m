Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 058C07821C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 01:58:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2017 18:58:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,409,1496127600"; d="scan'208";a="1154959040"
Received: from swold-mobl2.amr.corp.intel.com ([10.255.81.238])
	by orsmga001.jf.intel.com with ESMTP; 24 Jul 2017 18:58:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 24 Jul 2017 18:58:25 -0700
Message-Id: <1500947905-3837-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.5
Subject: [PATCH] systemtap: ensure systemtap-native is available
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
X-List-Received-Date: Tue, 25 Jul 2017 01:58:27 -0000

Since we are adding the addto_sysroot that that is specific to the
native recipe, we must split this into a seperate -native .bb recipe.

When systemtap-native is built, the intention is that it's usable
from the native sysroot when done, ensure it's there with a forced
addto_recipe_sysroot task, we also don't want to clean the sysroot
when RM_WORK is enabled otherwise we loose the binaries.

[YOCTO #11403]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
(cherry picked from commit 2fdb59741b4fdeaa4aee10812c4a409cdc11a02d)
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/systemtap/systemtap-native_git.bb | 7 +++++++
 meta/recipes-kernel/systemtap/systemtap_git.bb        | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap-native_git.bb

diff --git a/meta/recipes-kernel/systemtap/systemtap-native_git.bb b/meta/recipes-kernel/systemtap/systemtap-native_git.bb
new file mode 100644
index 0000000000..c3da77c831
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap-native_git.bb
@@ -0,0 +1,7 @@
+
+require systemtap_git.bb
+
+inherit native
+
+RM_WORK_EXCLUDE_ITEMS += "recipe-sysroot-native"
+addtask addto_recipe_sysroot after do_populate_sysroot before do_build
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index fed368a38b..b3fd9730da 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -25,4 +25,4 @@ PACKAGECONFIG[python3-probes] = "--with-python3-probes,--without-python3-probes,
 
 inherit autotools gettext pkgconfig distutils3-base
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "nativesdk"
-- 
2.11.0


