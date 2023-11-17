Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB721C5AE4A
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 11:12:43 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.9059.1700219561980575118
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 03:12:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=iOaGnXq1;
 spf=pass (domain: baylibre.com, ip: 209.85.128.51, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso15600795e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 03:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700219559; x=1700824359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJhNSOkg8w/cEYhk7pYpbcVolYBKJavvLGDPT7R3tyM=;
        b=iOaGnXq1+M14o0HUBuT/4aB5DjUlIPCLElVIQaqf4h7eegIL6Pcd2c4mhU5KK4RwOj
         Dfe3pZZabpSz27QlhhCqH87dMi1yGBQ6obIl7x5wr2lChTEpj/G+luYu4dC2e6fyu9Wo
         LtqZ5NSSCiWoZPuVzm6/ds1YWZyhGJ5VOmFVEy7IZ3Mmwd9F++3n1FqP3Cq6Fkukg7S5
         74hVp963SsfpwB/Y42PP1iVsLhCn0c0eZ3sEaq42+ebWHJgs/DKKpUcN6YpSb+Bj1gGU
         sWOnjHUsW0DuiNbns1MUKDn0jwPdpFWjMMXujIMShEoK8mJvXV/uUpz0bV0KiyejGlkY
         0lfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700219559; x=1700824359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJhNSOkg8w/cEYhk7pYpbcVolYBKJavvLGDPT7R3tyM=;
        b=iHHj+QiOiuDYFDhgOKA0OaN846qF5CKLjsGHQRc9xg0/p1QTdUW/dwNi8YgRSjYXcw
         3Df2ZPNXZ41RQybOUeZHAvejLgTRBg2jZKP0mBsWD8DDDX81p6mT5H2bRF6hU01cnbhA
         hiQcGucZPfufNOLNCl57dtNB3bSlz7Miwemb5aVhJ+41tNNq6eMsGgGdSnMO5sRdoJWd
         7cr6mLf/XhDHEhn9C2kvm/CZxErwGb9qFqmPnevoIlQ9k8RWyat7hFWtnaxJBQjYZwPz
         WWr/a3RvRd7VI6aWWt0XsyPkdTsGu6pCtfYel5gJyuSgaC9Qgaktzi47HWuznx0NqVj6
         nNkg==
X-Gm-Message-State: AOJu0YxRBSQwOCSs1WW/d15fVK5UCVHbZCwAUhyfao3o1okwUx+0BfIj
	GMpisvmsR5+Z7zQPoyeA/kkFnIxR6Hr8nk9cDgYYNw==
X-Google-Smtp-Source: AGHT+IGGRT44QzMQkKDgxTTMoTsZl1/DuGe3dB1XRVSwjsTD/kdzfL8HlQQ3QTzT8LNxg1J4Lakm3g==
X-Received: by 2002:a5d:47a2:0:b0:32d:a476:527a with SMTP id 2-20020a5d47a2000000b0032da476527amr17170557wrb.50.1700219559591;
        Fri, 17 Nov 2023 03:12:39 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id z5-20020adff745000000b0032d829e10c0sm1982440wrp.28.2023.11.17.03.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 03:12:39 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 4/7] recipetool: create: add new optional process_url callback for plugins
Date: Fri, 17 Nov 2023 12:12:15 +0100
Message-ID: <20231117111218.3344066-5-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117111218.3344066-1-jstephan@baylibre.com>
References: <20231117111218.3344066-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 11:12:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190840

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


