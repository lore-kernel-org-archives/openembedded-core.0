Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145D0C677C4
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 15:33:41 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.1418.1749656014117941258
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 08:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=0wMKY3Ff;
 spf=pass (domain: limonsoftware.com, ip: 209.85.219.174, mailfrom: anibal@limonsoftware.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e733a6ff491so6660219276.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 08:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1749656013; x=1750260813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y73mLOTZa9cKGdXrQ2+OP9W79TQ9tESrJ5NRwj67WB4=;
        b=0wMKY3FfnmF1bQqTC7sVHDzYmb9K8FFrZk+yMm6Pm7XqdzcQPi0sPaC/G5+BUCwfi1
         z7F96tX9ucGBhteDDeVTYBjgriQ2d6FhppScHIwyHs2rjsO6Oo9z9wOQ3Mo8xaNFcWYX
         kLpFbdx9lPHEBs5HW6NRDrp7JVrnob3lqoBvrecrDaW/E9tHJb2fFmjWT5rwx/n55JcJ
         KqKRpBNk4D5CFy/0LkXJa13Mz6O/+q8jJgZGPjDFBU5zPABLcF9eaCw2c7ZQuItllIPp
         nbpWEtP57jnz/LjyQwOO4zzuwE3X+Ts07dYFnVovnpRSD7XuQFQoiZ+I24pZJMTV92Lk
         IjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749656013; x=1750260813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y73mLOTZa9cKGdXrQ2+OP9W79TQ9tESrJ5NRwj67WB4=;
        b=RTsgUtV7FhFMZFT061esdUud5D5WMBo4nfTxg1RXx9Kt3oknRvGcpKrgreKtdUu9tN
         Qp1KLpxtyJZVUAArQJlroEl6ddUmdZ3Zzi9HA73J+BpO8KlGb6Ht9TwrApN7FLOX4JhS
         fK+5Dd7qptvoEfym9xosapFY2fAq7cmmonyUekjHfDxrnnxFNTJZ9Xr7wmi7gjdPayCj
         54USByipyFK1Easgx8LMNkEK/ECd0TEfLxSoooSn/rRU5xCjgvRhG3ORP8+0nhWSlj/s
         JttTPa1g6lgyjKuVAcEN1P2JPW4GoFsNCi73zsRsAWc7OFm64LfdQBsaXgICh6TZzaB9
         xpRA==
X-Gm-Message-State: AOJu0YwaVapk0ViQyq7tOfpY3f0ua4x/yfUBCIJJt6EpcYJ40T+M94BT
	0x+DUASiIcQXQ+6zb6rqtNv2RJFDHEo/2Nfn4LtKnnlye5UIgnsaTPl/HcMW8PmZ3vG87yyev8S
	G6JPfq/Q=
X-Gm-Gg: ASbGnctoSRGGZOmJmgOQwd/EWXsvE7Lm5d15rzypQeRYfboz+Rt5xoDagVgM0DfjJ51
	F82sPJSb3A9PZig+t6sQ5zDmzgUghcyp/EQ2E26h6QRUz7m/SC1c84rAoc0xhAW5wKYFTIr+D4Y
	qOwIlu6U9Asm6bP1hqejre4lNkTUbfqsnN2sbUylsFzSZ3h60goMvh2fZvjmJ+HfnqBOoHgnz4y
	m6WvlJVWfU9CECwjAPg9Ceho8lYbUxlC9XfFGv4ytuh4wRhltUCDnJnif6+Sk84Z6NqTm7z24fH
	rTIzC6+J/3cZIyA9Zz0oOX5fB7KgD6W8ZSu+4nrYLRDpmOFSFUnyyQxjjDi5B6uj2s3M3ueNTvi
	SmA==
X-Google-Smtp-Source: AGHT+IHewMIxRSUNa2S6o/ZZ/6JfJXTyRvY42ZxxYaZUDzbd4bJylgTZBkJDnXg3wMUq15oRzhnF4g==
X-Received: by 2002:a05:6902:2e85:b0:e81:78c2:7327 with SMTP id 3f1490d57ef6-e81ff601a40mr4330402276.14.1749656013124;
        Wed, 11 Jun 2025 08:33:33 -0700 (PDT)
Received: from ls.ts.net ([189.172.229.129])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e81a402c9aasm3589608276.18.2025.06.11.08.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 08:33:32 -0700 (PDT)
From: Anibal Limon <anibal@limonsoftware.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Ross.Burton@arm.com,
	bruce.ashfield@gmail.com,
	Anibal Limon <anibal@limonsoftware.com>
Subject: [PATCH 2/3] wic: pluginbase ensure layer order when load plugins
Date: Wed, 11 Jun 2025 15:33:18 +0000
Message-Id: <20250611153319.54778-2-anibal@limonsoftware.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250611153319.54778-1-anibal@limonsoftware.com>
References: <20250611153319.54778-1-anibal@limonsoftware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 15:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218459

To support extensions on wic plugins, the load order needs
to be grauntee matching BBLAYERS variable.

Fix cases when try to import a plugin from another layer,
example of the case to fix,

```
Traceback (most recent call last):
  File "/workspaces/ls/linux/layers/openembedded-core/scripts/wic",line
547, in <module>
    sys.exit(main(sys.argv[1:]))
             ^^^^^^^^^^^^^^^^^^
...
  File "/workspaces/ls/linux/layers/openembedded-core/scripts/lib/wic/
engine.py", line 137, in list_source_plugins
    plugins = PluginMgr.get_plugins('source')
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/workspaces/ls/linux/layers/openembedded-core/scripts/lib/wic/
pluginbase.py", line 73, in get_plugins
    spec.loader.exec_module(module)
  File "<frozen importlib._bootstrap_external>", line 940, in exec_module
  File "<frozen importlib._bootstrap>", line 241, in _call_with_frames_removed
  File "/workspaces/ls/linux/limonsoftware/bsp/scripts/lib/wic/plugins/
source/bootimg_rpi_autoboot_partition.py", line 1, in <module>
    from wic.plugins.source.bootimg_partition import BootimgPartitionPlugin
ModuleNotFoundError: No module named 'wic.plugins.source.bootimg_partition'
```

Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
---
 scripts/lib/wic/pluginbase.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index ec515229e7..d2229c91a1 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -48,7 +48,7 @@ class PluginMgr:
                     path = os.path.join(layer_path, script_plugin_dir)
                     path = os.path.abspath(os.path.expanduser(path))
                     if path not in cls._plugin_dirs and os.path.isdir(path):
-                        cls._plugin_dirs.insert(0, path)
+                        cls._plugin_dirs.append(path)
 
         if ptype not in PLUGINS:
             # load all ptype plugins
-- 
2.39.5


