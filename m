Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.17084.1627890833514922652
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002137"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002137"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:34 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478655246"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:33 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 31/37] checklayer: new function get_layer_dependencies()
Date: Mon,  2 Aug 2021 15:52:18 +0800
Message-Id: <a3d5e108b6982771c99a75abf09a8210788c5be1.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicolas Dechesne <nicolas.dechesne@linaro.org>

Split add_layer_dependencies() into 2 parts. First search for layer
dependencies, and then add them to the config. That allows us to
call get_layer_dependencies() independently.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 08edf928aac3f2daaa0c256d4c21e56e2db72bff)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/checklayer/__init__.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index fe545607bb..72d9df0a62 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -156,7 +156,7 @@ def _find_layer_depends(depend, layers):
                 return layer
     return None
 
-def add_layer_dependencies(bblayersconf, layer, layers, logger):
+def get_layer_dependencies(layer, layers, logger):
     def recurse_dependencies(depends, layer, layers, logger, ret = []):
         logger.debug('Processing dependencies %s for layer %s.' % \
                     (depends, layer['name']))
@@ -203,6 +203,11 @@ def add_layer_dependencies(bblayersconf, layer, layers, logger):
         layer_depends = recurse_dependencies(depends, layer, layers, logger, layer_depends)
 
     # Note: [] (empty) is allowed, None is not!
+    return layer_depends
+
+def add_layer_dependencies(bblayersconf, layer, layers, logger):
+
+    layer_depends = get_layer_dependencies(layer, layers, logger)
     if layer_depends is None:
         return False
     else:
-- 
2.31.1

