Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D27836C7E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 09:27:57 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Sep 2013 02:28:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,943,1371106800"; d="scan'208";a="363220956"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.234])
	by azsmga001.ch.intel.com with ESMTP; 20 Sep 2013 02:27:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2013 10:27:50 +0100
Message-Id: <ceb65c408a19ce7c1b5223b5a3029a0ebfb39a9b.1379669217.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1379669217.git.paul.eggleton@linux.intel.com>
References: <cover.1379669217.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1379669217.git.paul.eggleton@linux.intel.com>
References: <cover.1379669217.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/5] classes/testimage-auto: add class to allow automatically running image tests
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
X-List-Received-Date: Fri, 20 Sep 2013 09:27:58 -0000

Setting TEST_IMAGE = "1" alone will now automatically run tests on the
image immediately after the image is built instead of having to add
INHERIT += "testimage" and run bitbake -c testimage <image> manually
(but that will still work). This restores functionality that was
present in the older imagetest-qemu class with IMAGETEST.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image.bbclass          |  3 +++
 meta/classes/testimage-auto.bbclass | 24 ++++++++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta/classes/testimage-auto.bbclass

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 889547a..246a4db 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -16,6 +16,9 @@ RRECOMMENDS += "${PACKAGE_INSTALL_ATTEMPTONLY}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
+TESTIMAGECLASS = "${@base_conditional('TEST_IMAGE', '1', 'testimage-auto', '', d)}"
+inherit ${TESTIMAGECLASS}
+
 # IMAGE_FEATURES may contain any available package group
 IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
diff --git a/meta/classes/testimage-auto.bbclass b/meta/classes/testimage-auto.bbclass
new file mode 100644
index 0000000..1fc7593
--- /dev/null
+++ b/meta/classes/testimage-auto.bbclass
@@ -0,0 +1,24 @@
+# Copyright (C) 2013 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+
+# Run tests automatically on an image after the image is constructed
+# (as opposed to testimage.bbclass alone where tests must be called
+# manually using bitbake -c testimage <image>).
+#
+# NOTE: to use this class, simply set TEST_IMAGE = "1" - no need to
+# inherit it since that will be done in image.bbclass when this variable
+# has been set.
+#
+# See testimage.bbclass for the test implementation.
+
+inherit testimage
+
+python do_testimage_auto() {
+    testimage_main(d)
+}
+addtask testimage_auto before do_build after do_rootfs
+do_testimage_auto[nostamp] = "1"
+do_testimage_auto[depends] += "qemu-native:do_populate_sysroot"
+do_testimage_auto[depends] += "qemu-helper-native:do_populate_sysroot"
-- 
1.8.1.2


