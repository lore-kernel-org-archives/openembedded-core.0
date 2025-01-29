Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E9BC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 18:05:28 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.19363.1738173921791172402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 10:05:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sY7+IQnx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2165cb60719so129762575ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 10:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738173921; x=1738778721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOxlbr27ZnvjGHtjWc9CIPmUuLsQtpl/yuZMOHIwal0=;
        b=sY7+IQnxSx7pnZ9ZYIk1aMyJzbJe2IcwM5/c+XG1M76ObrqIVbSjrYymyrPGQSl+jW
         uORlbYNuY5Rmu0jPz28FuaQ/bBIZFlzxPbenrgppvb3Z4vx+53aJNdac+eS6nd+V9A4u
         o9UuFDMc9yZx+V3FP9DXyIRSBGNEl92U9M1xz5gC0FUXdzWlqqj2Iyana8+J+TKcGxRD
         fxkZ765ZOJ6e4r//SUrYYKY0X3cpUjsJRkAiT0UOvrtZH1j/uJ6DV5QIZCS4e4Lqxaa7
         hOqOLcCPOvQbl0xCe3t29PFMvNJrOjrW9m5f+D84tFAiz0ttZDsUEfQwSZjf8XUCAGYu
         qV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738173921; x=1738778721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOxlbr27ZnvjGHtjWc9CIPmUuLsQtpl/yuZMOHIwal0=;
        b=kYkre8UY/dwpry8I+7VTOw6AA0tUqeIeoFv73PwLpvOWi22R6g1k3zVPb/41QpIz0p
         /CO+jbHzL0ZqqxjxquAyk8zr41d3Vj12/+M8AA/e271CyfStbZyFw7CKJO6NiAQono4M
         YFdZlKpWZAQw0Wr7UiYE/e9MMA9YUYGjL4iEUBBdCatojNDFf3oAeBsdvApaxIBq15Mr
         R1VV5R8JvROcynybuWEa6xp0LwdPsvd3qTfL/ZGxJpGqq72qtzPyzchZewyhipenD4wt
         y+0unfGCbTXvHPjfr076fBWWgCjhwrbr1YrTYbQeYEadgs1PW7uAlsjRatr9xtu9IttU
         KqPg==
X-Gm-Message-State: AOJu0Yyw4HBgrvJWFABHzEJUKhMxUFUJVf1rQhuQEZyYVztknwyx20kj
	gd0hfHydKnN3K5jI3+bVGNlbGHGlxjDL5eSse0iKhrkwIzdqJWcz4aErArW4+OV/XWlZepYVCAy
	XRb4=
X-Gm-Gg: ASbGncujoQQNPd+Oh7tDKx6pyy/TVFlHl5HlBm3mHshkjw/6ArAf+EQIosEnDVEKbnM
	dWcvgK5ClyC5sHBH6Vc18OAl5ScLKLc+b/pD1s+mNNeseEnrOuVOF/pvTDCI2g0FsmbRug/qNH2
	xzaKIKccAewwh1Jqaj4bAJx/NSOS1SoZjNJyN+Ad+kp316QYLkxJacWhec8DWa107g3phcrkhIO
	EapLC1Q0ux0q2xDKrcmlOi2969Y8XMtFR0QC1risHXm4gGvdNYs3e9cqqWs/YNc5oqMrbZiLGtZ
	Hxht
X-Google-Smtp-Source: AGHT+IHlo28n8vBMY0BXMcPFijFqN8joP24o5jgNaa8ouYcH72+1cpfc0yBoRqaxTg+oMt6R6otaMg==
X-Received: by 2002:a05:6a00:3927:b0:729:c7b:9385 with SMTP id d2e1a72fcca58-72fd0be5439mr5985477b3a.6.1738173920938;
        Wed, 29 Jan 2025 10:05:20 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a69fb24sm11496435b3a.8.2025.01.29.10.05.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 10:05:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 8/8] devtool: ide-sdk remove the plugin from eSDK installer
Date: Wed, 29 Jan 2025 10:04:57 -0800
Message-ID: <a5e7ff4424a68335fc768e49a232a58011a5b160.1738173760.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738173760.git.steve@sakoman.com>
References: <cover.1738173760.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210401

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


