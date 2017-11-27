Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A36BD77FF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 12:07:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2017 04:07:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,464,1505804400"; d="scan'208";a="12423529"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2017 04:07:11 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 14:06:53 +0200
Message-Id: <7ef07945195cc8228e059a7b831173f3617086b1.1511784130.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
References: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
References: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v8 09/16] oeqa/targetcontrol: re-introduce get_target_controller()
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
X-List-Received-Date: Mon, 27 Nov 2017 12:07:21 -0000

This function was dropped in f352ef37a27cb0871c87cf9991d8ad2e1d560fde as
unused, but, python-pgo-image needs it for running profile task on
target hw.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/targetcontrol.py | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index f63936c3ec..d147a44480 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -18,6 +18,31 @@ from oeqa.utils.dump import TargetDumper
 from oeqa.controllers.testtargetloader import TestTargetLoader
 from abc import ABCMeta, abstractmethod
 
+def get_target_controller(d, logger):
+    testtarget = d.getVar("TEST_TARGET")
+    # old, simple names
+    if testtarget == "qemu":
+        return QemuTarget(d, logger)
+    elif testtarget == "simpleremote":
+        return SimpleRemoteTarget(d, logger)
+    else:
+        # use the class name
+        try:
+            # is it a core class defined here?
+            controller = getattr(sys.modules[__name__], testtarget)
+        except AttributeError:
+            # nope, perhaps a layer defined one
+            try:
+                bbpath = d.getVar("BBPATH").split(':')
+                testtargetloader = TestTargetLoader()
+                controller = testtargetloader.get_controller_module(testtarget, bbpath)
+            except ImportError as e:
+                bb.fatal("Failed to import {0} from available controller modules:\n{1}".format(testtarget,traceback.format_exc()))
+            except AttributeError as e:
+                bb.fatal("Invalid TEST_TARGET - " + str(e))
+        return controller(d, logger)
+
+
 class BaseTarget(object, metaclass=ABCMeta):
 
     supported_image_fstypes = []
-- 
2.13.6


