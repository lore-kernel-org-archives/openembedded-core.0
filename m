Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B546EC433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 14:51:20 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.12868.1642776670242435373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 06:51:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=eYBWgVDG;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642776680; x=1674312680;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=6+205rq7ZN0gsNdmpk2H0OyY92PggDXCZYSqVRzdoiE=;
  b=eYBWgVDG7rxwh36e8S/Z73fg7cvfbgACXyf2Q5CsWUP3C5NyrrIfA7FW
   hSBCNUHVsVzhhwA43SfUJ24HwLRansFqwa82VK+IrMQqvNJomYujPc90w
   IboHCG7B45e4geVPJVRVJkrkx/7+LqARgdXhaSi1Owyh/+DifFG9D16bl
   LLxUChrJaS6+R96nZlVjYVsBidyNm32Byq5yO4sAqzN7l3NbSKdEwAFlV
   G+3vOhi/v3IpQ+uCcvdNjCjUHWdAEz4zIFJrrCEINbQWiHkL+fJUnJWFF
   r0mvmUqwDbci3BJMYdhX02yf8plAN5RomEGTlbRFUq2acqjivRRi6TrIH
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245886057"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="245886057"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="623336716"
Received: from gordonyx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.131.118])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:18 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 06/15] scripts: Update to use exec_module() instead
 of load_module()
Date: Fri, 21 Jan 2022 22:50:54 +0800
Message-Id: 
 <85194f3264551adfffd168dd55e7f2a77f517a55.1642736951.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642736950.git.anuj.mittal@intel.com>
References: <cover.1642736950.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 14:51:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160837

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
2.34.1


