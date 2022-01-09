Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4FBC433EF
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:04:55 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.23601.1641765895413369424
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=kt0ceJDo;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id i8so9566683pgt.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/pMMuvEIxqYW3KIHpo8lVa/BPpMSpvsIZgJEWPjPMzk=;
        b=kt0ceJDo88pbLRrGI4s7vRYvh2qL+omL3MKUcCx8fHKSTrn9gFZNNZor7gm4pnvD+c
         zz67Wvte92y/ZbJxLmwp/T4bEB8u1ecR9Zs1SVt+MC6k0TvGgVI0Y/4VyMlT6y4WGJZb
         jZ0VCZC4urr52DGCdlS9JOcBohjeU5qNvPavnpJm8D9dTk8rgBrS97548h2uEIb/ZGSt
         kLH3b3k7VO3wDAlB8g9IanskRUc549LqELoPuj3zuQR6j/ZUXdQxZFYmDZ5AhUU4p6hq
         cLOFc/8LCzNVQYqlCFIv1C3yaQeskaWCp7VnGXZ6dlB+OTeHKtF76iGXcgo/5pzEU8He
         Rclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/pMMuvEIxqYW3KIHpo8lVa/BPpMSpvsIZgJEWPjPMzk=;
        b=5N7Ahn5PiTic2U0xKyX97yGet0bECFv225JWIj40I2yx1ZXtD9np93Xe/ImZvmYaeV
         MW1uYtVXUVtf1eWiSjmtsuKrgsOUomqTs3KarpBap1LZX8szhaqrZg/TtXSdW/uKuWjU
         w+E66S3aZ4rJAPYMsyYwToSI3Bj8+JjwHQJLpTxvbASjUncNa5i9555wrtUGPmefAy7h
         sxs6Lo8a9pEXqUeBzl87DMmCjAqJc1XSI2Dwa/636MNIcN/a6uUtFuwr0EAOBWfZ6UB+
         4vA22LAhhJ3bBad36OHBMyQR2PlSX/H7yqiPmnKS07b3N/yvc5DzGlQmu/4/xD95b4qF
         zsJg==
X-Gm-Message-State: AOAM530IVTwV1GEbOSawCB77mZblkeJ3jvZlPAo3sNsbQVQDE/WvuEks
	I1wTu0lePKBsRkyEJmLd6T7DJCFo17OYr0uQgMk=
X-Google-Smtp-Source: 
 ABdhPJzt4H+Jdy3w4jjJueEzFOe9y2YqBvAf1E0WxkQdnNM6NGKn/3i8yZHRF+Vo/7LVKu3wcEgGxg==
X-Received: by 2002:a63:7a10:: with SMTP id v16mr4743541pgc.453.1641765894531;
        Sun, 09 Jan 2022 14:04:54 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 k10sm4426150pfi.52.2022.01.09.14.04.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:04:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/12] scripts: Update to use exec_module() instead
 of load_module()
Date: Sun,  9 Jan 2022 12:04:14 -1000
Message-Id: 
 <c0710d4ffb6c11083daf77fe24129d879f270591.1641765639.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1641765639.git.steve@sakoman.com>
References: <cover.1641765639.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:04:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160301

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This is deprecated in python 3.12 and Fedora 35 is throwing warnings so
move to the new functions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 655cd3f614d736416eab0d708b7c49674bf5c977)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


