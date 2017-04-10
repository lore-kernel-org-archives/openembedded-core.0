Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC5177BE8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 20:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491857982; x=1523393982;
	h=from:to:cc:subject:date:message-id;
	bh=+F6JmhwOX34fmCC1JNaSPSWtbTOfLHhObevKmk1IjkE=;
	b=Aayf9C+vxg7ZEkGhaJGREBVrsdTIHoSDtRHPOQA+5ex6VSijaQEubdbs
	+3AZ0eOS2jXicmJgDruEMscIu1yY8A==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Apr 2017 13:59:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,183,1488873600"; d="scan'208";a="72231707"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 10 Apr 2017 13:59:42 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 5D0626A4080;
	Mon, 10 Apr 2017 13:59:32 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Apr 2017 23:46:13 +0300
Message-Id: <1491857173-7167-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] image.bbclass: prevent rm_work to remove native RSS
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
X-List-Received-Date: Mon, 10 Apr 2017 20:59:40 -0000

Added recipe-sysroot-native directory to RM_WORK_EXCLUDE_ITEMS
for image recipes.

This should keep qemu and other useful tools in the native sysroot of
the image recipe even if rm_work is enabled.

[YOCTO #11266]
[YOCTO #11193]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 405fd73..7165bb4 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -17,6 +17,8 @@ RRECOMMENDS += "${PACKAGE_INSTALL_ATTEMPTONLY}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
+RM_WORK_EXCLUDE_ITEMS += " recipe-sysroot-native"
+
 TESTIMAGECLASS = "${@base_conditional('TEST_IMAGE', '1', 'testimage-auto', '', d)}"
 inherit ${TESTIMAGECLASS}
 
-- 
2.1.4


