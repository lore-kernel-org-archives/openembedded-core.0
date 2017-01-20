Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id E2EAC7716A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567395"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:42 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:09:47 -0600
Message-Id: <64e749b674d37d3e2d0f989438c4f22d1b12826a.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 16/55] oeqa/utils/__init__.py: Adds compatibility with bitbake logger
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The bitbake logger changes the way debug is logged and adds
different levels within debug, this is passed as argument
to the function and breaks compatibility with vanilla loggers.

This implements a way to handle this adding a new function for
debug, that will dispatch the correct logging method signature.

Also overrides info method to use logging.INFO + 1 in order to
see plain data.

Also this commit fix the issue of not showing the test summary
and results when running from bitbake.

[YOCTO #10686]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/utils/__init__.py | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/lib/oeqa/utils/__init__.py b/meta/lib/oeqa/utils/__init__.py
index 8f706f3..485de03 100644
--- a/meta/lib/oeqa/utils/__init__.py
+++ b/meta/lib/oeqa/utils/__init__.py
@@ -36,3 +36,33 @@ def avoid_paths_in_environ(paths):
 
     new_path = new_path[:-1]
     return new_path
+
+def make_logger_bitbake_compatible(logger):
+    import logging
+
+    """ 
+        Bitbake logger redifines debug() in order to
+        set a level within debug, this breaks compatibility
+        with vainilla logging, so we neeed to redifine debug()
+        method again also add info() method with INFO + 1 level.
+    """
+    def _bitbake_log_debug(*args, **kwargs):
+        lvl = logging.DEBUG
+
+        if isinstance(args[0], int):
+            lvl = args[0]
+            msg = args[1]
+            args = args[2:]
+        else:
+            msg = args[0]
+            args = args[1:]
+
+        logger.log(lvl, msg, *args, **kwargs)
+    
+    def _bitbake_log_info(msg, *args, **kwargs):
+        logger.log(logging.INFO + 1, msg, *args, **kwargs)
+
+    logger.debug = _bitbake_log_debug
+    logger.info = _bitbake_log_info
+
+    return logger
-- 
2.1.4


