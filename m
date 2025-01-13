Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFAFC02183
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 23:39:19 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.32971.1736811558426345474
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 15:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZQcZqeqJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4368a293339so55842905e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 15:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736811556; x=1737416356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bP1LM+ckcsRvcik0eTZ2CBHyHrq8jsqTbnD4Ze//4s=;
        b=ZQcZqeqJezmUsOIbM80UZ2g1pQip5saa5MFOWgO+Q+fdQS2efa1mUDl68Dkjic8Xgh
         b8bSMqZtPDKIYpqF14g8wUGph0Xqve5kI1REHmug8Y2FKvnh9ONUX5p9nUXCUC31Q3eO
         ARUFZicUIHEXxbT2wb62Vrham9VG3GL2WoFEJYwv7bUtKGgjEhdb31JQR3vXQhAzaV3o
         OT/earUof8idAg1dxjji3nWfKkNHW7QCWFEwUFv1DU/K2dTU29tmaTOi8StRw/yTkLsR
         j4peAQLZtoT2ZKJYLyw1Cc7PNQG/dDLb66kqi/nxDmN8W4Cn8B0SpyOgGm+hyGaN871g
         vSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736811556; x=1737416356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bP1LM+ckcsRvcik0eTZ2CBHyHrq8jsqTbnD4Ze//4s=;
        b=pCab9vkp/EHnbl2q1d5X0mkDmryXebOWQjeAjZB/kC2V2I0nyX++8vtpaSCXb/kVmY
         xEhZpbRr+ouNySjmMUvaO9tRsEkO75hZlyRA6/avvmAuCuRCMGXhbBlLk3DHFRD+MjP7
         HIJoCOaRgpKwoCW2XrvPoCgE/jk6Zx8LlCVMADqgLlFKr0UyrB2wajX4hhdlnDzb9c4D
         sAucNxZUp4j9Bl/ABU+qPK65eQuGXQVKQB/okwJb/8LWSUYL9sE9kxsZkSZXQF+DHteZ
         nwrS4IvcPeP8EWOO1VM2/ElACwIVv1JVq7pG5kGuxnpgJ3GbyExCPfurnf1tja6jS6pg
         huOA==
X-Gm-Message-State: AOJu0YygBb2d/fMnYvH6UNuKv7MyK5Z5UVriOelhDLOgyqJiiAs0++Kz
	Y0L+ahLRSx1yVjy1xrO3Ruvf5VjSTWDk0pNXc0u6RhjvRpnLgBon1CDMuttu
X-Gm-Gg: ASbGncs2CcFfrHQl0DXWroIuIHOOfYfGmrVqcire8LN5SJNMdSf5Tx530bxXGSTm1Aq
	/nRt9J7Fj+xzhpIgWh6PfazBQlo+xNenCe0s2QRpD16FxA3iMlrAqcVJy+gFgnHGcoizFJDdPB8
	zYuBLDBzfdbMvG3rNjTmPb1Y91sPTwVo6LPYjvKBc1pLusIkjgPF03QZHZswapV6lMR1fuvl3Al
	O+LUcCKl6QrLLpKPQ4s4vt4C9Ll8Lybr/iorRLqWuuppF0kbWKslew4+JdZ1g0xP8nGmXtVE7AN
	74g=
X-Google-Smtp-Source: AGHT+IFpQXbI/ZPLVKhDRc/duoLUcFmP4iP9dcKRP8cgKm6+rW6u7JQMhtbCvRCB7f1iu2M0hYQDUA==
X-Received: by 2002:a5d:6484:0:b0:385:fd07:85f4 with SMTP id ffacd0b85a97d-38a87312c8dmr20570658f8f.31.1736811556478;
        Mon, 13 Jan 2025 15:39:16 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da7768sm194596605e9.5.2025.01.13.15.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 15:39:15 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/2] devtool: ide-sdk remove the plugin from eSDK installer
Date: Tue, 14 Jan 2025 00:39:09 +0100
Message-ID: <20250113233909.4182045-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113233909.4182045-1-adrian.freihofer@siemens.com>
References: <20250113233909.4182045-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 23:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209770

The ide-sdk command bootstraps the SDK from the bitbake environment
before the IDE configuration is generated. In the case of the eSDK
installer, the bootstrapping is performed during the installation of
the eSDK installer. Running the ide-sdk plugin from an eSDK installer
based setup would require skipping the bootstrapping and probably taking
some other differences into account when generating the IDE
configurations.

This would be possible. But it will probably never be implemented, as
running devtool ide-sdk directly from the bitbake environment is much
more flexible.
Also, some of the recent improvements that have made it into the core
have the potential to make the eSDK installer obsolete at some point in
the future:
- bitbake-layers create-layers-setup replicates the layers
- bitbake-config-build replicates the build configuration
- The new sstate mirror features replicate the sstate
- bblock locks the sstate more flexible than the eSDK installer
- devtool ide-sdk bootstraps the SDK directly from the bitbake
  environment. The same environment-setup... file is provided with
  --mode=shared.
  The devtool modify based workflow is supported since always by devtool
  and also the default --mode of devtool ide-sdk.
These functions essentially cover what the eSDK installer does without
a need for the current implementation of the eSDK installer and the
populate_sdk_ext, which is hard to maintain and takes a lot of time to
build.
This means that instead of making the ide-sdk plugin compatible with the
eSDK installer, we should rather replace the current implementation of
the eSDK installer and populate_sdk_ext with an implementation that can
replicate a normal bitbake environment in a convenient way where the
ide-sdk plugin also just works without additional complexity.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 42ac20c6547..f8cf65f4a84 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -927,6 +927,15 @@ def ide_setup(args, config, basepath, workspace):
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
 
+    # The ide-sdk command bootstraps the SDK from the bitbake environment before the IDE
+    # configuration is generated. In the case of the eSDK, the bootstrapping is performed
+    # during the installation of the eSDK installer. Running the ide-sdk plugin from an
+    # eSDK installer-based setup would require skipping the bootstrapping and probably
+    # taking some other differences into account when generating the IDE configurations.
+    # This would be possible. But it is not implemented.
+    if context.fixed_setup:
+        return
+
     global ide_plugins
 
     # Search for IDE plugins in all sub-folders named ide_plugins where devtool seraches for plugins.
-- 
2.47.1


