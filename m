Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8720C02194
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 02:51:46 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.7732.1738205499936234790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 18:51:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Og/sZHgB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21670dce0a7so6254835ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738205499; x=1738810299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOxlbr27ZnvjGHtjWc9CIPmUuLsQtpl/yuZMOHIwal0=;
        b=Og/sZHgBojGOA8teoZyFK1NeWlonRPVHHPmi333d1j0WTK2/KbNUkVdeCNVO/5RY6u
         9UcLU4lu1jdbPjki5ky6ERDUrbFbBxrMSmmp7UtrNTlSIviqsqU7hlyCiYHnqNtaod6u
         WM7qHMeDH9HwGpOBukv1ZymWPEOmHU3ch128ZEE4e8frrO1XQlSJ1ESez/+jPrR9wSNg
         4KKczmJer/dl2dKv8ZmQLSAkJ7KDv0cR/DiwKvVd2RNmHW6vUEZRnIAYv8fGnOLfLoV7
         +sgu+/q2I3SbOGFGZJLk2UFeQTzg4b6muzM1jwYqAB0ouWiNlf1AcED+TpXAJQ0v3YzI
         yaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738205499; x=1738810299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOxlbr27ZnvjGHtjWc9CIPmUuLsQtpl/yuZMOHIwal0=;
        b=vTN3/W8vtdkCxpAumSjySoVunqliV1jc6lqHpS2zqNKThN0tO75Y14tNxPogZzDOwL
         5v2ik/8w9zYxE4xLdLB6jrPpOgvD6KPaDS+7dy+E/lo3r5GKv75PHCTRikyCODr1VkFt
         Wm1M8bOyoR6Er/tdHcIru3poiMv3L9X5gs/f3is3ltQonjUkT8M3LhhARAhOiwmeYo+V
         SZCKPgetDdI9CnNBYONIdcaDWu4kdd/++1Ef7oQucjgb2jKCKQlZ+6WFwBS8mw6d1Ohy
         L+mYB4EXTARm394gz31B6TpaQRYUENiQ+B0mmk4eYJZUsN/PSCizGkjJRTPweP/TeemL
         WiKQ==
X-Gm-Message-State: AOJu0YwqA9aHvSQ7vVsDKALfbwqlz5JzYoOQ0VlvxVMsd3nKGGgVczb8
	c9ULQ8a6E5Kw11DpMDnMzevuCJU1V5mC0U4xeIm3oPnDeIWp1MkeGfoTdGAKwErYD99ZQ0AxO3R
	2IMk=
X-Gm-Gg: ASbGncuKErMr+QjMTSQMT6mqB+2UZdNAvCird50Toc2MG47zwrlITxWmPMz3DPutCGQ
	wjiZ/jRvhlAgNNxZT5Gn6NGO0hDrK9zKRkMyUcJ4L2FiHUjuiifAVwDxxQDvTRo6NdhQzb5nVJG
	w9otctUrFh81PUJKLjCup9g8oEKnnYRYuU7ytzIvOiMupuTN+ff/6WlTJAfSxIpIBV27dRjuf9U
	8tNSbT7CB5rUn+y2fyH/vdrhyGH+hOTcLJptTlm1Yl/4tASj1HzZl2WLcLg1NnDQlz5ZcnrMufy
	st0M
X-Google-Smtp-Source: AGHT+IFzCWjOsdCCENYC57p3irUQY8RCnGVDNA+EnvPTjNKWh5UY5zEqAVYos4kyOBR91POtml5Cog==
X-Received: by 2002:a05:6a21:9211:b0:1e1:a06b:375a with SMTP id adf61e73a8af0-1ed7a6e191emr10860737637.35.1738205499158;
        Wed, 29 Jan 2025 18:51:39 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04794a4sm249726a12.60.2025.01.29.18.51.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 18:51:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/12] devtool: ide-sdk remove the plugin from eSDK installer
Date: Wed, 29 Jan 2025 18:51:12 -0800
Message-ID: <f50306ea3e174b8db46b20b68a7ac4299a69f50d.1738205405.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738205405.git.steve@sakoman.com>
References: <cover.1738205405.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 02:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210432

From: Adrian Freihofer <adrian.freihofer@gmail.com>

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/ide_sdk.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 5e4c543275..0b50165a12 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -965,6 +965,15 @@ def ide_setup(args, config, basepath, workspace):
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
2.43.0


