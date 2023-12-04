Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C671AC46CA0
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:59:52 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.73101.1701705586623122380
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:59:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=JYbrwg0W;
 spf=pass (domain: baylibre.com, ip: 209.85.128.46, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40b538d5c4eso41746505e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701705584; x=1702310384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJhNSOkg8w/cEYhk7pYpbcVolYBKJavvLGDPT7R3tyM=;
        b=JYbrwg0WKVRh9ftGoanBwPqQor6X83vPhVINa29cFJ9DFlv/HBEcw/9U+zC22qra4N
         17EMxFiuwG2sR7kpBSNA4thydGtyIShwbA+9IL8h9JHShx7xoPm/2s8U7WQQYmd4jK5T
         VYk6jxJrMzl8bL7TjUSZuSf/5raxcox+Sw5Bg5bjDyPaJ8U03HQtz8u8CfaWKwyVRsXy
         Odm/v0vgp/9vZTqg9Z3nBrcHXBeaKor5iyQWRHZUIL45WeJQEKXjMb6oIqd//nZnlX8/
         HnjOWceU9jqCoFGj0ot3qQd4MFImFO6kyCJVpMY7Ia2dPNxzeG4sIo41XjBsaIJiL9/K
         q1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701705584; x=1702310384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJhNSOkg8w/cEYhk7pYpbcVolYBKJavvLGDPT7R3tyM=;
        b=u3bVSHh43Tbi87u6FJUP1iPL25xV7f7ZYJMq+KzaGRM7BrBDpySEIpho7sLD3Ojr4O
         ci48+SFVhfd8Wjo8LsPw1rfZ0X5eBlY6TrVv67N3XY0gfdzM90OucyFgnTMGOeGujFu2
         Q/5cRS6itmAMNHsbfNAOMYlroI3oky4ShW7701ugog/W8ii2GEmAyE+nFH4S4XprVt4G
         U4s3MVW5aIBXePytOqsAyi/4XtVQjwR3fXr9I6U9jCnoegWIk7aAI5sraCygmG2rBwB6
         PT6lZuWjLxhXNqLzFeLCMkZp4DqTr/+peeOU5ny0GKUg0/NHImlE3/8+h8jsDy3HYaiP
         BNqw==
X-Gm-Message-State: AOJu0Ywc8bRxHSMMHqQdRZLyr9X34lYQLUL6zaKs6aBCX9U4SbLS1qhA
	SngBMga5OzDfujodKh2kkjPk+C0nulZzW23AcdHlww==
X-Google-Smtp-Source: AGHT+IGPjAjVj5Zq1sRUzbgoj8yi1S434tjVZXe2AOM1piq1aXaRgDdxlyerGC2yXBF+Q6N1RNYJ5Q==
X-Received: by 2002:a05:600c:a2a2:b0:40b:5e59:b7d9 with SMTP id hu34-20020a05600ca2a200b0040b5e59b7d9mr2497911wmb.182.1701705584584;
        Mon, 04 Dec 2023 07:59:44 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id g16-20020a05600c4ed000b0040b47c53610sm15479595wmq.14.2023.12.04.07.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:59:43 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [RESEND][PATCH 4/7] recipetool: create: add new optional process_url callback for plugins
Date: Mon,  4 Dec 2023 16:59:31 +0100
Message-ID: <20231204155934.836992-5-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204155934.836992-1-jstephan@baylibre.com>
References: <20231204155934.836992-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 15:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191758

Add a new process_url callback that plugins can optionally implement if
they which to handle url.

Plugins can implement this callback for example, to:
* transform the url
* add special variables using extravalues
* add extra classes
* ...

If a plugin handles the url, it must append 'url' to the handled
list and must return the fetchuri

No functional changes expected for plugins non implementing this
optional callback

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/recipetool/create.py | 54 +++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index f5d541eb6c1..5c5ac7ae403 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -423,6 +423,36 @@ def create_recipe(args):
     storeTagName = ''
     pv_srcpv = False
 
+    handled = []
+    classes = []
+
+    # Find all plugins that want to register handlers
+    logger.debug('Loading recipe handlers')
+    raw_handlers = []
+    for plugin in plugins:
+        if hasattr(plugin, 'register_recipe_handlers'):
+            plugin.register_recipe_handlers(raw_handlers)
+    # Sort handlers by priority
+    handlers = []
+    for i, handler in enumerate(raw_handlers):
+        if isinstance(handler, tuple):
+            handlers.append((handler[0], handler[1], i))
+        else:
+            handlers.append((handler, 0, i))
+    handlers.sort(key=lambda item: (item[1], -item[2]), reverse=True)
+    for handler, priority, _ in handlers:
+        logger.debug('Handler: %s (priority %d)' % (handler.__class__.__name__, priority))
+        setattr(handler, '_devtool', args.devtool)
+    handlers = [item[0] for item in handlers]
+
+    fetchuri = None
+    for handler in handlers:
+        if hasattr(handler, 'process_url'):
+            ret = handler.process_url(args, classes, handled, extravalues)
+            if 'url' in handled and ret:
+                fetchuri = ret
+                break
+
     if os.path.isfile(source):
         source = 'file://%s' % os.path.abspath(source)
 
@@ -431,7 +461,8 @@ def create_recipe(args):
         if re.match(r'https?://github.com/[^/]+/[^/]+/archive/.+(\.tar\..*|\.zip)$', source):
             logger.warning('github archive files are not guaranteed to be stable and may be re-generated over time. If the latter occurs, the checksums will likely change and the recipe will fail at do_fetch. It is recommended that you point to an actual commit or tag in the repository instead (using the repository URL in conjunction with the -S/--srcrev option).')
         # Fetch a URL
-        fetchuri = reformat_git_uri(urldefrag(source)[0])
+        if not fetchuri:
+            fetchuri = reformat_git_uri(urldefrag(source)[0])
         if args.binary:
             # Assume the archive contains the directory structure verbatim
             # so we need to extract to a subdirectory
@@ -638,8 +669,6 @@ def create_recipe(args):
     # We'll come back and replace this later in handle_license_vars()
     lines_before.append('##LICENSE_PLACEHOLDER##')
 
-    handled = []
-    classes = []
 
     # FIXME This is kind of a hack, we probably ought to be using bitbake to do this
     pn = None
@@ -718,25 +747,6 @@ def create_recipe(args):
     if args.npm_dev:
         extravalues['NPM_INSTALL_DEV'] = 1
 
-    # Find all plugins that want to register handlers
-    logger.debug('Loading recipe handlers')
-    raw_handlers = []
-    for plugin in plugins:
-        if hasattr(plugin, 'register_recipe_handlers'):
-            plugin.register_recipe_handlers(raw_handlers)
-    # Sort handlers by priority
-    handlers = []
-    for i, handler in enumerate(raw_handlers):
-        if isinstance(handler, tuple):
-            handlers.append((handler[0], handler[1], i))
-        else:
-            handlers.append((handler, 0, i))
-    handlers.sort(key=lambda item: (item[1], -item[2]), reverse=True)
-    for handler, priority, _ in handlers:
-        logger.debug('Handler: %s (priority %d)' % (handler.__class__.__name__, priority))
-        setattr(handler, '_devtool', args.devtool)
-    handlers = [item[0] for item in handlers]
-
     # Apply the handlers
     if args.binary:
         classes.append('bin_package')
-- 
2.42.0


