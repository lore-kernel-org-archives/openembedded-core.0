Return-Path: <dvhart@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id C2EE36D19F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 21:47:04 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Oct 2013 14:46:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,502,1378882800"; d="scan'208";a="375213325"
Received: from unknown (HELO localhost) ([10.255.15.226])
	by azsmga001.ch.intel.com with ESMTP; 15 Oct 2013 14:46:27 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Tom Zanussi <tom.zanussi@intel.com>
Date: Tue, 15 Oct 2013 14:46:24 -0700
Message-Id: <2752ed00149228af88202212aacdc0d209e3bb39.1381869082.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1381869082.git.dvhart@linux.intel.com>
References: <cover.1381869082.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1381869082.git.dvhart@linux.intel.com>
References: <cover.1381869082.git.dvhart@linux.intel.com>
Subject: [PATCH 2/2] wic: Check for external modules
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
X-List-Received-Date: Tue, 15 Oct 2013 21:47:05 -0000

Since eight unique files import rpm, perform a check at the top level
for the existence of the rpm module print a sensible error message if it
is not. This may be able to be removed if some of the core rpm
dependencies are removed from the mic libs.

Also check for urlgrabber.

This avoids a bracktrace in the event the modules are not installed
which can be very off-putting to would-be users.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>
---
 scripts/wic |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/wic b/scripts/wic
index 06e72bb..f665823 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -31,11 +31,23 @@
 
 __version__ = "0.1.0"
 
+# Python Standard Library modules
 import os
 import sys
 import optparse
 import logging
 
+# External modules
+try:
+    import rpm
+    import urlgrabber
+except ImportError:
+    print("ERROR: failed to import necessary modules.")
+    print("Please ensure the following modules are installed:")
+    print("\trpm");
+    print("\turlgrabber");
+    sys.exit(1)
+
 scripts_path = os.path.abspath(os.path.dirname(os.path.abspath(sys.argv[0])))
 lib_path = scripts_path + '/lib'
 sys.path = sys.path + [lib_path]
-- 
1.7.9.5


