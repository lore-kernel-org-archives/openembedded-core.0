Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 10148772D1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567507"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:56 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:16 -0600
Message-Id: <ed6e36c93d6b4f79f580fc40d1ab5a352ca6ab79.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
Subject: [PATCH 45/55] oeqa/runtime/context.py: Add logger to getTarget
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:56 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Current targets (ssh and qemu) require a logger in their
constructors, so in order to get a new target we need
to provide the logger.

[YOCTO #10686]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/runtime/context.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index f0f6e62..bc8abd0 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -76,13 +76,13 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
                 help="Qemu boot configuration, only needed when target_type is QEMU.")
 
     @staticmethod
-    def getTarget(target_type, target_ip, server_ip, **kwargs):
+    def getTarget(target_type, logger, target_ip, server_ip, **kwargs):
         target = None
 
         if target_type == 'simpleremote':
-            target = OESSHTarget(target_ip, server_ip, kwargs)
+            target = OESSHTarget(logger, target_ip, server_ip, **kwargs)
         elif target_type == 'qemu':
-            target = OEQemuTarget(target_ip, server_ip, kwargs)
+            target = OEQemuTarget(logger, target_ip, server_ip, **kwargs)
         else:
             # TODO: Implement custom target module loading
             raise TypeError("target_type %s isn't supported" % target_type)
-- 
2.1.4


