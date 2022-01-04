Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7362DC433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 23:11:41 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.1126.1641337900239322195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 15:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y+f7NhXF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 b186-20020a1c1bc3000000b00345734afe78so2283921wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 15:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tz8ODB6BI5x/enwvNPwvzYuL28pJUQqeG0KBLhXuTiA=;
        b=Y+f7NhXFPGfKkIc8hT00XiJbDB8Bz7XWcKbIcXOuHmiJHXluyw3ephhVryDE0C8gZq
         pJOFtJ9/QuyXpSt0ANcSGGHGD+b00+yxnjxUECX/3QEuJjw7Cz/vNnvtq62vYbEv7lKI
         FE5/KZuTHqe/tCCXsMyqcWPGk9tfsqXgqX8EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tz8ODB6BI5x/enwvNPwvzYuL28pJUQqeG0KBLhXuTiA=;
        b=KMWr3MtXtl3Lt62WBuQSjvsE1IayegSIddHx7oElO/PuCVnkpcpHADhAjgq6X3qXms
         wPzng7BADKn0biiJrcgvvGo3CLkdWMa7jF5z9yL7xcO6MwpsX2gD1QIuKVPgCrOQhnXY
         9+z7H0HEBJ9n1sQ1RNUwxHOaP62cVaM+UMqRYN849FOe8vnM4XMoMv1Vmkmh0gRrO/tz
         zJE2aG3MC/f6VTAN4r4f+YeHq1OHVqUU/GsEclUVKb476qZB+CilSTmQPWSJj4dWa6+2
         g0Z/c1WCx6hjNj7FDlKs6b/q57wE6BnP1PdDk1pmyY6eXapyw/g2yrsxjcdDlSEO0RNM
         m2JQ==
X-Gm-Message-State: AOAM530uoqYfiod2zo2X8reFFhAle+G2jCBYP3+XmI8KZv4XaaztX3rx
	QQo6lMOs791mIxbbQb2kgDHLgIX3HFa9HQ==
X-Google-Smtp-Source: 
 ABdhPJy2X1FAcWLYITZ+8H+Uvnrv8v9DXJlozJqqfrxe/pmcbHJp1G10BAHZdhUpjhRrM8a00/AccA==
X-Received: by 2002:a1c:7903:: with SMTP id l3mr457207wme.103.1641337898730;
        Tue, 04 Jan 2022 15:11:38 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:4930:6fc6:9dcd:7b1c])
        by smtp.gmail.com with ESMTPSA id
 z5sm38255054wru.87.2022.01.04.15.11.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 15:11:38 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scripts: Update to use exec_module() instead of load_module()
Date: Tue,  4 Jan 2022 23:11:38 +0000
Message-Id: <20220104231138.1383788-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jan 2022 23:11:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160173

This is deprecated in python 3.12 and Fedora 35 is throwing warnings so
move to the new functions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/scriptutils.py    | 4 +++-
 scripts/lib/wic/pluginbase.py | 5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 3164171eb28..da778ea25ec 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -82,7 +82,9 @@ def load_plugins(logger, plugins, pluginpath):
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
index d9b4e57747e..d0651da4b71 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -9,6 +9,7 @@ __all__ = ['ImagerPlugin', 'SourcePlugin']
 
 import os
 import logging
+import types
 
 from collections import defaultdict
 from importlib.machinery import SourceFileLoader
@@ -54,7 +55,9 @@ class PluginMgr:
                             mname = fname[:-3]
                             mpath = os.path.join(ppath, fname)
                             logger.debug("loading plugin module %s", mpath)
-                            SourceFileLoader(mname, mpath).load_module()
+                            loader = SourceFileLoader(mname, mpath)
+                            mod = types.ModuleType(loader.name)
+                            loader.exec_module(mod)
 
         return PLUGINS.get(ptype)
 
-- 
2.32.0


