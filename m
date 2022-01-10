Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C9DC433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 04:09:41 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.27324.1641787762773038697
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 20:09:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=NgqtHU47;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641787774; x=1673323774;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=UQKjQ1e1dmOLjGRMwFF1e1sRcCChSNfPoo4Z2O6eEjc=;
  b=NgqtHU47lCUqjR9lZStlqTxLYk/u147nrVeM7qj10K0bXorP6WSwYqaV
   faVSwIwDhmcaCKIDDypQ8+BRzC927bJ1tRqd9+gRkiot954EGMhNwul9/
   DeMdylNqQvuxgknrKL/ZSrDH88iD4UeLXunGq7cXRbT1fuYCXm61HDVdx
   m+Uf/4HmGgRS/tvWdb3Y78faPzpT2tIOAAnC2rmg+o9msb3WnQ2NxpcN1
   V2EzVF1sp39pfNQSLWMDiasiui19bdbLH1P774XCNcNOrbFUjb/hyJI4f
   RJJREIcQfOFfRnNzyWTnBU4ydj+e9LK9zZe3rMpvShKdZ1vAkAlqKLARV
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="243347387"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="243347387"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="764402263"
Received: from bboox-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.135.82])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:33 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 09/10] scripts: Update to use exec_module() instead
 of load_module()
Date: Mon, 10 Jan 2022 12:09:13 +0800
Message-Id: 
 <803498916df3f4a34e2da948313cbd09022e3a86.1641787452.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641787452.git.anuj.mittal@intel.com>
References: <cover.1641787452.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 04:09:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160330

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This is deprecated in python 3.12 and Fedora 35 is throwing warnings so
move to the new functions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 655cd3f614d736416eab0d708b7c49674bf5c977)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/scriptutils.py    | 7 +++++--
 scripts/lib/wic/pluginbase.py | 8 ++++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 3164171eb2..47a08194d0 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -18,7 +18,8 @@ import sys
 import tempfile
 import threading
 import importlib
-from importlib import machinery
+import importlib.machinery
+import importlib.util
 
 class KeepAliveStreamHandler(logging.StreamHandler):
     def __init__(self, keepalive=True, **kwargs):
@@ -82,7 +83,9 @@ def load_plugins(logger, plugins, pluginpath):
         logger.debug('Loading plugin %s' % name)
         spec = importlib.machinery.PathFinder.find_spec(name, path=[pluginpath] )
         if spec:
-            return spec.loader.load_module()
+            mod = importlib.util.module_from_spec(spec)
+            spec.loader.exec_module(mod)
+            return mod
 
     def plugin_name(filename):
         return os.path.splitext(os.path.basename(filename))[0]
diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index d9b4e57747..b64568339b 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -9,9 +9,11 @@ __all__ = ['ImagerPlugin', 'SourcePlugin']
 
 import os
 import logging
+import types
 
 from collections import defaultdict
-from importlib.machinery import SourceFileLoader
+import importlib
+import importlib.util
 
 from wic import WicError
 from wic.misc import get_bitbake_var
@@ -54,7 +56,9 @@ class PluginMgr:
                             mname = fname[:-3]
                             mpath = os.path.join(ppath, fname)
                             logger.debug("loading plugin module %s", mpath)
-                            SourceFileLoader(mname, mpath).load_module()
+                            spec = importlib.util.spec_from_file_location(mname, mpath)
+                            module = importlib.util.module_from_spec(spec)
+                            spec.loader.exec_module(module)
 
         return PLUGINS.get(ptype)
 
-- 
2.33.1


