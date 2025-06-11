Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119B4C71133
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 15:33:31 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.1417.1749656009992259952
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 08:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=vhOup7iK;
 spf=pass (domain: limonsoftware.com, ip: 209.85.219.181, mailfrom: anibal@limonsoftware.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e7db6aaef22so5104037276.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 08:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1749656009; x=1750260809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yTmL3SXw/APnGXbvYfk8+4zC0XkzT5ak+uUEFwdogWk=;
        b=vhOup7iKiS/leFt5OBj5SMAGE3EkuRcmEsq4yP7rqy1MPL9H3M1t8fbQtHBUS/NJ1V
         oN/PCT8T3uFplehWCbSLWVhBeKx+su95iQse7Ij6a6ihbBNOepjZBHaWUplcHpIep/9n
         ZZY6yto0CmwEY1ItUxg176FpCw92YaEXB5vP5GItMneCb5PLn5y/f/x9AudFCSSY7Tun
         zXgXVkEEPlxhdQmOm+DK7bzg9Fhq2vjkRrGM/CsupJaVyqwJqQFnBJO0DAcgN5hdyjXn
         KbIJhZu9BGtlIl2q2rqleT787Jsj0JDbG/gKzTjjqzx6MLmnAn+cIIKSmHXEg4YTsTII
         1pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749656009; x=1750260809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTmL3SXw/APnGXbvYfk8+4zC0XkzT5ak+uUEFwdogWk=;
        b=keSBBdhalk6TNutm8l2W5QE5IV+DeiarTroshvDjhyAJUmo0O6aqrLKLHJv+9mImcg
         levstmtdp/UR9Aq/c8F0Abfp7kLcx//rs//DRANcMVDjvxiQW4CvrdD496CEYnMN1/OF
         InyKW+Oi0rJdF9xmAbIKFIZso5dsxa3mNHkmmXj2Gli9rs/9ly+Np6gsGbpSmRfvhl4Z
         F5RlyVguQqx1+rLTnhPkKlgO8z3/6zuO/bWblLV/f1bnTW1DXBPcjk8teuxHumeECQjB
         ab0Ma3eXvGnNRq/6GNMXfVfALrnKLxbqaoLidKiLP+/7WbgVz+FLLsGgUeKzskK2iRNL
         xziA==
X-Gm-Message-State: AOJu0YzUf5d2IlDz7usjiR42bESUSw8fuJAM10y6720//wH9+Y7aG9KS
	o/8PkP9SCj52bZ+pRasaY5E9gQmrcXggEStywTIPQ8QQAEjSbVCg/PENq09PpiLCNqHWQJA+pmx
	S9EgmdMI=
X-Gm-Gg: ASbGncsMkpITR8IyHx9cCHOZht8Lv5TuX9+KqkjUKTZi8CNsm3F76Te4erA8/On1Bxr
	nfzMtMT06Trd9x+ZRYLv24bukmaszHjiMIoYfp2RetXd1hXOqoEdKhYU8/fkrJ8YWjZrb8ATE2F
	fR7futmBsn6pd7WQco06iLpoBMieWTjtIZilYOuhatIHdkVIX+SwTbyTUaEzDD4NCpH6krN8E/1
	45AaD0VUG16XT1hp8xA/OBoHaKraEZqnG9gnhDKX3qGuEQK/KNYKdhQ6G+0STRGB3X7ru81K7a6
	A74WxHGuCb2TzkIsjoelJtyBJV4HbEv2Kcd3yAA0mIibhR4eHQ3jcbMhfzHsl20X5G0=
X-Google-Smtp-Source: AGHT+IFdTu3KDhj6Eh+/Uj53X/U8KEC5qVFoT12hcZFRpzFLc0DwCJAshniKanMfQm7S1mdm7YfNQg==
X-Received: by 2002:a05:6902:128f:b0:e7d:a785:c790 with SMTP id 3f1490d57ef6-e81ff69bc07mr4899665276.43.1749656008922;
        Wed, 11 Jun 2025 08:33:28 -0700 (PDT)
Received: from ls.ts.net ([189.172.229.129])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e81a402c9aasm3589608276.18.2025.06.11.08.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 08:33:28 -0700 (PDT)
From: Anibal Limon <anibal@limonsoftware.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Ross.Burton@arm.com,
	bruce.ashfield@gmail.com,
	Anibal Limon <anibal@limonsoftware.com>
Subject: [PATCH 1/3] wic: pluginbase workaround on invalid module filenames
Date: Wed, 11 Jun 2025 15:33:17 +0000
Message-Id: <20250611153319.54778-1-anibal@limonsoftware.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 15:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218458

Apply a workaround on invalid identifiers replace '-' to '_' to load
the module with valid identifier.

Let the user know (warning) about plugin doesn't has a valid module
identifier to encourage fix, it gives time before rename oe-core wic
plugins and drop workaround.

Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
---
 scripts/lib/wic/pluginbase.py | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index b64568339b..ec515229e7 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -8,6 +8,7 @@
 __all__ = ['ImagerPlugin', 'SourcePlugin']
 
 import os
+import sys
 import logging
 import types
 
@@ -20,7 +21,8 @@ from wic.misc import get_bitbake_var
 
 PLUGIN_TYPES = ["imager", "source"]
 
-SCRIPTS_PLUGIN_DIR = ["scripts/lib/wic/plugins", "lib/wic/plugins"]
+SCRIPTS_PLUGIN_WIC_DIR = "wic/plugins"
+SCRIPTS_PLUGIN_BASE_DIR = ["scripts/lib", "lib"]
 
 logger = logging.getLogger('wic')
 
@@ -40,7 +42,9 @@ class PluginMgr:
             cls._plugin_dirs = [os.path.join(os.path.dirname(__file__), 'plugins')]
             layers = get_bitbake_var("BBLAYERS") or ''
             for layer_path in layers.split():
-                for script_plugin_dir in SCRIPTS_PLUGIN_DIR:
+                for script_plugin_base_dir in SCRIPTS_PLUGIN_BASE_DIR:
+                    script_plugin_dir = os.path.join(script_plugin_base_dir,
+                                                     SCRIPTS_PLUGIN_WIC_DIR);
                     path = os.path.join(layer_path, script_plugin_dir)
                     path = os.path.abspath(os.path.expanduser(path))
                     if path not in cls._plugin_dirs and os.path.isdir(path):
@@ -53,13 +57,26 @@ class PluginMgr:
                 if os.path.isdir(ppath):
                     for fname in os.listdir(ppath):
                         if fname.endswith('.py'):
-                            mname = fname[:-3]
                             mpath = os.path.join(ppath, fname)
+                            # If module doesn't have a valid identifier let the
+                            # user know and apply a workaround replacing '-' 
+                            # with '_' to load module with valid identifier.
+                            mname = fname[:-3]
+                            if not mname.isidentifier():
+                                logger.warn("invalid identifier at plugin module"\
+                                            " %s, please fix it.", mpath)
+                                mname = mname.replace("-", "_")
+
                             logger.debug("loading plugin module %s", mpath)
-                            spec = importlib.util.spec_from_file_location(mname, mpath)
+                            spec = importlib.util.spec_from_file_location(
+                                     mname, mpath)
                             module = importlib.util.module_from_spec(spec)
                             spec.loader.exec_module(module)
 
+                            cname = os.path.join(SCRIPTS_PLUGIN_WIC_DIR,
+                                                 ptype, mname).replace('/', '.')
+                            sys.modules[cname] = module
+
         return PLUGINS.get(ptype)
 
 class PluginMeta(type):
-- 
2.39.5


