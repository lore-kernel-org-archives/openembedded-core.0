Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CBC9F771AE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 14:50:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2015 06:50:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,266,1444719600"; d="scan'208";a="596917702"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 06:50:20 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 16:50:47 +0200
Message-Id: <ebccb0eb264380bbbef21b530d133536d2af3a4e.1447080392.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 25/29] gcr: disable gobject introspection on x86-64 for now
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
X-List-Received-Date: Mon, 09 Nov 2015 14:50:21 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gcr/gcr_3.16.0.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-gnome/gcr/gcr_3.16.0.bb b/meta/recipes-gnome/gcr/gcr_3.16.0.bb
index 40c0fe8..ebe2873 100644
--- a/meta/recipes-gnome/gcr/gcr_3.16.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.16.0.bb
@@ -19,3 +19,16 @@ FILES_${PN} += " \
 
 # http://errors.yoctoproject.org/Errors/Details/20229/
 ARM_INSTRUCTION_SET = "arm"
+
+# on x86-64 the introspection binary goes into 
+# an infinite loop under qemu during compilation, 
+# printing the following:
+# 
+# gcrypt-Message: select() error: Bad address
+#
+# gcrypt-Message: select() error: Bad address
+#
+# gcrypt-Message: select() error: Bad address
+#
+# This will be investigated later.
+EXTRA_OECONF_append_x86-64 = " --disable-introspection"
-- 
2.1.4


