Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C8EC0218E
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 12:48:23 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.29139.1737895700581368865
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jan 2025 04:48:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RtG/9DlU;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43634b570c1so24772605e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 04:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737895699; x=1738500499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKnWFOn5Kw8wxIS2x/gnbuEmaI/r1IFLo/zpMQYB05A=;
        b=RtG/9DlUC8FYwSGrrVM1vIK7kQhVk+mBjuEW7GfWkNa6ogDcTfp2vEm6MRy9hbMk/v
         uhdEuCnMAkjHQCoF9/HucK+8BtXbblRWwUl22ZvoFnGrCwHxD9BV3hz/WMvfQIy43QOw
         r2vI4NzTKbTnBJJ0hLQOXMGjc2KI8DBQDWPNE9mPlCaL8EnGnQz8/mJo5sooR4ir3kNB
         PYM0jHpCxC6ZCYY0GE3o6MSGGv57XLpazkePzUoR0Tz0q3UqA1gvcxBWWyrJjaR5cgyc
         XX5EiLqzoxsRXyPivJOcFB2Ik2EbFESnzTe8YaoR0Zkj4DZFTQEaDvJd2H+0dQlKmzZb
         zovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737895699; x=1738500499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKnWFOn5Kw8wxIS2x/gnbuEmaI/r1IFLo/zpMQYB05A=;
        b=pRYSbmfgWjmSdtQbPFAgVSBazLrmUND7yflvuUxk7g/uZmNsR7T3HLfsnuQpc4YUL2
         soELur4NbqMnYCRI3kL9WATFlgIPUAg3P6owPCBVfa34bwvxOdjCTM5C8oRai2zDgl4U
         dFy+Gyv7LEzleEZ5kzOlUIHQeZrORcJPv1+LQ5Q07apmGpn25OT9vLetxXbcGqJ4o4FO
         mSZ/9g/ZuT5uu8yKcq0hWjJB01luqjUCKPFETAFMd4lTjtazyOY/LXbVotgbo2yJibxT
         WAjp6uq6aYcEaq9AeABs7IwmoV/N2LlXKyMEJX5xqE1i6arcSm+jofmOmvB7tguCO8bR
         Oryg==
X-Gm-Message-State: AOJu0Yyr9J/nBCzC6GzMXzVGoXg8oCs/0whbEBc8ToI47w4kAF/UXdhY
	KfVLSNEKXD9aGqcGDW6QieeEBoXuT8HXTdHeB0xJDmYF4Qz27955hjwdPA==
X-Gm-Gg: ASbGncuTqJzXWdPCULrIE2ua9oD20hW6kyvqmlKYPGTHJvrcG144JH4qftUOEh5asA9
	Na65314zILYuPf30Z/vA3W/2xnRMFBtiQePYzwlBu9xpKSfbIiP14fvxRmj+w1+sdxziOphXp/A
	Zv7fvoAiKjYFl7KERBcEmF3LLo6AIn9SQ2rBVbcvoAARFE/USpVuC5TohL9i5kj1K4qYID3Lc4T
	qGheuvofaj340Wzk2TkMNEHmCy5YOlGuPByR+hMFVQnf03TwIN+rBYCPfgutz/Afvlyg0xBAgfE
	3GIxVbBSQIDNCaQRvZxafE80SYA=
X-Google-Smtp-Source: AGHT+IGreR0iChGxIGjS3dGFGvpGsoMiucGtqFumOyIlvLwN6FFh6tr8C6FjF0nfQ/BZeK8w19XS1w==
X-Received: by 2002:a05:600c:524c:b0:435:306:e5dd with SMTP id 5b1f17b1804b1-4389143a66dmr314967035e9.22.1737895698382;
        Sun, 26 Jan 2025 04:48:18 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd48a906sm95938295e9.18.2025.01.26.04.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 04:48:17 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap,styhead][PATCH 5/5] devtool: ide-sdk remove the plugin from eSDK installer
Date: Sun, 26 Jan 2025 13:48:06 +0100
Message-ID: <20250126124806.1453644-6-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250126124806.1453644-1-adrian.freihofer@siemens.com>
References: <20250126124806.1453644-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 12:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210284

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
2.47.1


