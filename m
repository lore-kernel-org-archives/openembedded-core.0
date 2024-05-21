Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF45C25B7A
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 11:26:34 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.17336.1716290778431127172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 04:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zm1KWWB5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-34da04e44a2so3246352f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 04:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716290777; x=1716895577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MueVIHvMRjTD+0mcPIIchcL1PwL2yoMXhVmVC4USYb4=;
        b=Zm1KWWB58rFUhiiaecCdFXC8bB0hFjguGIwtSaI92dUKAhmnaSlYuW0tyBbULAhNBL
         XPiwoMbU+Xs4IK7qOAdKpuMLHCdvlyPGGmcyjtBjpKOx66LBCrKSSxbkUAFGiwQfh71F
         3DadlAGxC9cuSySxPZ/R3nEug/xba2ygGHiu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716290777; x=1716895577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MueVIHvMRjTD+0mcPIIchcL1PwL2yoMXhVmVC4USYb4=;
        b=G5KqYfIWmWMSM92HUMbV00MIE1uvqxozeT3hH8lrcwB9311+5MqufjrN9MlWjeOP7z
         n7AHmrQjaFUNO80D+7HS3McYJFzCElRUnBX1XfIIrMzjXo+i3ZJcuQdR6dJjw1TH7xNu
         8PtVpnjdriyGcESnb0d2DjMwftX0sV4qUp69G6uQe/JlBQv+bQ5vVmJGhjEBPQjN+WcW
         hDGe6h2kPJKATWUz28ZroD/VOGIRPng1wsAzNPK+dyENI/5cv3lHjhmu8qpoyYQQvfJb
         TT5XfI3xoDjdxwSbIdCoXOcKbepNw71BlhcnFQ5vcqkLR8XpHIxxDPmPGT9tfWB6XVlT
         7PTA==
X-Gm-Message-State: AOJu0YyEBliSkUhtTfAOfGFQ8JP9e4oLNFO3joquJZ8IxoKvo6Kz2zO7
	0vG2VCpOKBqVlyTUhz870fXkxR/nMaHNttKZiJ5ubufimf6V/GqhTubuUGO4o+c3+sxYlA7GbTe
	eYcs=
X-Google-Smtp-Source: AGHT+IHgq9ZsNruCtjuetUlonv/DSaK1tmH4iVnj4lTDGotIcSk9x/2HdkwCNlVp/ftuzM3D9bRWcQ==
X-Received: by 2002:a5d:538f:0:b0:34d:7eb6:6873 with SMTP id ffacd0b85a97d-3504a96d119mr21767009f8f.63.1716290776785;
        Tue, 21 May 2024 04:26:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1738:232d:aeeb:3bb7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbc4b41sm31670646f8f.113.2024.05.21.04.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 04:26:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/9] vulkan-headers: upgrade to 1.3.283.0
Date: Tue, 21 May 2024 12:26:07 +0100
Message-Id: <20240521112614.1137127-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240521112614.1137127-1-richard.purdie@linuxfoundation.org>
References: <20240521112614.1137127-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 11:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199622

From: Tim Orling <tim.orling@konsulko.com>

https://github.com/KhronosGroup/Vulkan-Headers/compare/vulkan-sdk-1.3.280.0...vulkan-sdk-1.3.283

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ulkan-headers_1.3.280.0.bb => vulkan-headers_1.3.283.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.280.0.bb => vulkan-headers_1.3.283.0.bb} (90%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb
similarity index 90%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb
index 371cc7304d9..6423ef9df60 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "577baa05033cf1d9236b3d078ca4b3269ed87a2b"
+SRCREV = "eaa319dade959cb61ed2229c8ea42e307cc8f8b3"
 
 S = "${WORKDIR}/git"
 
@@ -22,7 +22,7 @@ RDEPENDS:${PN} += "python3-core"
 
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools,
-# vulkan-validation-layers, vulkan-utility-libraries.
+# vulkan-validation-layers, vulkan-utility-libraries, vulkan-volk.
 # The tags versions should always be sdk-x.y.z, as this is what
 # upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.40.1


