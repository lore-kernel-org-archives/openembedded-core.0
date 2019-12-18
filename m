Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 25DB07FEC9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 03:21:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2019 19:21:11 -0800
X-IronPort-AV: E=Sophos;i="5.69,327,1571727600"; d="scan'208";a="205701763"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.17.193])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2019 19:21:10 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 11:20:55 +0800
Message-Id: <3202d1aed01e7bb620a0a862eac3ac4e7151ee54.1576638856.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1576638856.git.anuj.mittal@intel.com>
References: <cover.1576638856.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 7/9] qemu-helper-native/systemtap-native: Ensure sysroots are populated with dependencies
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
X-List-Received-Date: Wed, 18 Dec 2019 03:21:10 -0000
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

As Alex Kanavin found, dependencies aren't always populated, particularly
with the hash equivalence server enabled locally:

'bitbake core-image-minimal' with gtk+ disabled.
can confirm with: $ tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-x86_64 -display gtk
qemu-system-x86_64: Display 'gtk' is not available.
Enable gtk in local.conf with: PACKAGECONFIG_append_pn-qemu-system-native = " gtk+"
'bitbake core-image-minimal', without deleting tmp/
$ tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-x86_64 -display gtk
qemu-system-x86_64: Display 'gtk' is not available.

This change ensures the dependencies are correctly handled as the full
sysroot is always depended upon even if things come from sstate.

(From OE-Core rev: d40853b10dd9f01d6a8dd4edcb941cfa8a544922)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/cross.bbclass  | 1 +
 meta/classes/native.bbclass | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index f832561daf..6dcddd6f2e 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -97,3 +97,4 @@ python do_addto_recipe_sysroot () {
     bb.build.exec_func("extend_recipe_sysroot", d)
 }
 addtask addto_recipe_sysroot after do_populate_sysroot
+do_addto_recipe_sysroot[deptask] = "do_populate_sysroot"
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index d5b6f6af8b..3a4f572552 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -186,6 +186,7 @@ python do_addto_recipe_sysroot () {
     bb.build.exec_func("extend_recipe_sysroot", d)
 }
 addtask addto_recipe_sysroot after do_populate_sysroot
+do_addto_recipe_sysroot[deptask] = "do_populate_sysroot"
 
 inherit nopackages
 
-- 
2.21.0


