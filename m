Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7204862131
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:38:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2015 18:38:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,335,1444719600"; d="scan'208";a="857558658"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2015 18:38:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:37:42 +1300
Message-Id: <b7004cf84d2c68e2da8a6c6c2be4926a7c102fd5.1448246218.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448246218.git.paul.eggleton@linux.intel.com>
References: <cover.1448246218.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448246218.git.paul.eggleton@linux.intel.com>
References: <cover.1448246218.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/7] classes/populate_sdk_ext: fail if SDK_ARCH != BUILD_ARCH
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
X-List-Received-Date: Mon, 23 Nov 2015 02:38:19 -0000

The extensible SDK relies upon uninative, and with the way that
uninative works, the build system architecture must be the same as the
SDK architecture or the extensible SDK won't be usable. At some point in
future hopefully we can remove this limitation, but until then it's
disingenuous to allow this to build, so add a check to ensure
SDK_ARCH == BUILD_ARCH and fail if it isn't.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 736f17f..dc05261 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -261,6 +261,11 @@ SDK_POST_INSTALL_COMMAND_task-populate-sdk-ext = "${sdk_ext_postinst}"
 SDK_POSTPROCESS_COMMAND_prepend_task-populate-sdk-ext = "copy_buildsystem; install_tools; "
 
 fakeroot python do_populate_sdk_ext() {
+    # FIXME hopefully we can remove this restriction at some point, but uninative
+    # currently forces this upon us
+    if d.getVar('SDK_ARCH', True) != d.getVar('BUILD_ARCH', True):
+        bb.fatal('The extensible SDK can currently only be built for the same architecture as the machine being built on - SDK_ARCH is set to %s (likely via setting SDKMACHINE) which is different from the architecture of the build machine (%s). Unable to continue.' % (d.getVar('SDK_ARCH', True), d.getVar('BUILD_ARCH', True)))
+
     bb.build.exec_func("do_populate_sdk", d)
 }
 
-- 
2.1.0


