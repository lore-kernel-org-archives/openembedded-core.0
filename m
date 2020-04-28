Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.194.1588040163060476484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 19:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cZGgYab7;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id r4so9573831pgg.4
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 19:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=WSWqfjYKkZg0IYtzwlVOzQLklFgV5NAZKJOwi/B6D9I=;
        b=cZGgYab7DgD6uLBmDLwNqjJazgFMe8PlSDWkzGbfUFS85XF7cC32vfbExWXRymKsaa
         GcptqIZuh46sHyQ6k4zNSNX5dacCwNyDynkbsHlqTzNz1tS/AQNI4V6aNUjUUzT4Tk5h
         ncvZ+73awu9fANfuNqRY1S/t/1EbYjExkTQ+fCcJB++TRAmjr7EV2sHVWuZeDpugSoiW
         oTUXRSENXVEyuMo9bADvT+uGC1pfhqg7JhZjnF7KOkauanW4MTIYUvUlsxfBs5sZjl7o
         E8ktzSeFz590S8yso47EyLXU14luxh4XkiRjbUnKsXV9qJqJ+oIR2P5sobgrnZUzEme4
         SYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=WSWqfjYKkZg0IYtzwlVOzQLklFgV5NAZKJOwi/B6D9I=;
        b=ZaqHk9KWPwq6/fdFxoy/E2sZth+719om7R7/uSvBhA1All5e5x9KMQAQ6x11r9i7eN
         NBIfLxONYONJFVktm9+Kjvz8jLfNLnPKOUv010lbvG1thU8cAEO8PiOTL92SXtd1hahr
         MKtYrVbybxtIMnNq3MEdQXS2/P3tZZClsQ1/LwAom/LUlsb+n8famH+SqFxreB71QwGw
         BTHsOJqeVZJSSGpiVGs36WSRseuIB8Z47gSh6QKhe6SquQorqu4cABDgquxZeGe/mjac
         SxSBp1YawNXv7+pZ8ORGlmDi2065fRyoTcCqtjDV8/QrojSC/YjqC9MlQB+72LLfrN0v
         LkbQ==
X-Gm-Message-State: AGi0PubfBdXWEffUMX+Azq3zZXCWbh1nFNIkqp7VTxPnLdYT4y/EDgXT
	teZMHyP4PJMpd8yGEP1ZR0atVyV+
X-Google-Smtp-Source: APiQypLwpwemICU4l2kQsahwVW4FpxuaPDwIbIwyLTXu3pMsHaUFqUqO7Qr1+0Rv4XdwGeiJfjSEuw==
X-Received: by 2002:a62:6585:: with SMTP id z127mr27754634pfb.217.1588040162345;
        Mon, 27 Apr 2020 19:16:02 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:f1bf:759e:e8cd:49cd])
        by smtp.gmail.com with ESMTPSA id 6sm12328390pgz.0.2020.04.27.19.16.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 19:16:01 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus 3/7] wic: align layer plugin path
Date: Mon, 27 Apr 2020 19:15:52 -0700
Message-Id: <8351cb19e8a83157143b1df61cd9bbb71282e9fc.1587931177.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587931177.git.akuster808@gmail.com>
References: <cover.1587931177.git.akuster808@gmail.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

wic look for external layer source plugin under scripts/lib/
while other tools look for lib/.

allow wic to check for source plugin at both scripts/lib/ and
lib/ to align with other tools while avoid breaking any existing
source plugin in external layer.

[YOCTO #13056]

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 986baff26bd96a6265f5fe2d631818fff9f66374)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/wic/help.py       |  3 ++-
 scripts/lib/wic/pluginbase.py | 11 ++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 3a40fc0ea29..03d84bd1d72 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -523,7 +523,8 @@ DESCRIPTION
 
     Source plugins can also be implemented and added by external
     layers - any plugins found in a scripts/lib/wic/plugins/source/
-    directory in an external layer will also be made available.
+    or lib/wic/plugins/source/ directory in an external layer will
+    also be made available.
 
     When the wic implementation needs to invoke a partition-specific
     implementation, it looks for the plugin that has the same name as
diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index f74d6430fd7..d9b4e57747e 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -18,7 +18,7 @@ from wic.misc import get_bitbake_var
 
 PLUGIN_TYPES = ["imager", "source"]
 
-SCRIPTS_PLUGIN_DIR = "scripts/lib/wic/plugins"
+SCRIPTS_PLUGIN_DIR = ["scripts/lib/wic/plugins", "lib/wic/plugins"]
 
 logger = logging.getLogger('wic')
 
@@ -38,10 +38,11 @@ class PluginMgr:
             cls._plugin_dirs = [os.path.join(os.path.dirname(__file__), 'plugins')]
             layers = get_bitbake_var("BBLAYERS") or ''
             for layer_path in layers.split():
-                path = os.path.join(layer_path, SCRIPTS_PLUGIN_DIR)
-                path = os.path.abspath(os.path.expanduser(path))
-                if path not in cls._plugin_dirs and os.path.isdir(path):
-                    cls._plugin_dirs.insert(0, path)
+                for script_plugin_dir in SCRIPTS_PLUGIN_DIR:
+                    path = os.path.join(layer_path, script_plugin_dir)
+                    path = os.path.abspath(os.path.expanduser(path))
+                    if path not in cls._plugin_dirs and os.path.isdir(path):
+                        cls._plugin_dirs.insert(0, path)
 
         if ptype not in PLUGINS:
             # load all ptype plugins
-- 
2.17.1

