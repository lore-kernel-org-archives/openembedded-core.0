Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B4BC25B7D
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 11:26:34 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.17338.1716290779439130847
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 04:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UFnxzoY8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-34e0d47bd98so1914820f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 04:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716290777; x=1716895577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcpPPNQVchAavMUm0Us7RqJAzV+2wVFJjNxz9aPDQlc=;
        b=UFnxzoY8KC7PxYx+y7T032WuzVkn54TminGqPSv2lqokAVf5hXas4tQh0qqx9vNHYN
         IPzs1Ty8mlc+sZmvEXAuJugdviKKQvJ1bIPQxhTWx1gmL9KAgKOUumTlhg3vxwE/y4gJ
         ydTii8BrCdqT8IbgsBi4QrTPvaF6DI3CzwD7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716290777; x=1716895577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcpPPNQVchAavMUm0Us7RqJAzV+2wVFJjNxz9aPDQlc=;
        b=uzdgK9eAecQuo9s5FUPdGX9DX71fsMw4eY4kVf4Gosa8DKO9qPpTTZE7UjF2Y+XbKd
         6IDm1QaQVVjehsmA4sXGo+diyyLlojUFFFiRZEHNmYTcND/xjbc8XO5tb4fDI8u72ben
         wwiyBAsf02njllloaIWSeQf3jhqknUV+mCBvBqcI7+oxSEXTvU2KeuqK15Ej/HR7le2J
         bTXthWC7zbCA8QFNtNGNOilw84zwlaW6uKdl03V2q1ogYLI88hhT1iL6vu117vNJFPCD
         XVZIRamTGzgRlUI6mzeTYy7tnM+nheVhf3uCE3xzjNBjxpZaD9ZwP2uay8oMZQ1buS9g
         2qHw==
X-Gm-Message-State: AOJu0YwH7Vnj54gWXoh2O+j3+1Ts+qb7/eAomJ7KChn0TSEwXtSic1MK
	Kud42YBVasxZjykjxsPLOA4aJpbf18kA8VFij39OwMcuVt3EN1qYa5jQvwYVmfTUEpHqCKij8rI
	Ou7w=
X-Google-Smtp-Source: AGHT+IG4SlRylcEmXeSMykafdsHiOnTe/NRpeVt/Dr08GjJcJ5Eu3eSQ57JmpyellgEM6g0R/X/S+Q==
X-Received: by 2002:a5d:47a5:0:b0:354:c81e:b7ba with SMTP id ffacd0b85a97d-354c81eb827mr5722381f8f.3.1716290777575;
        Tue, 21 May 2024 04:26:17 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1738:232d:aeeb:3bb7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbc4b41sm31670646f8f.113.2024.05.21.04.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 04:26:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 3/9] vulkan-loader: upgrade to 1.3.283.0
Date: Tue, 21 May 2024 12:26:08 +0100
Message-Id: <20240521112614.1137127-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240521112614.1137127-1-richard.purdie@linuxfoundation.org>
References: <20240521112614.1137127-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 11:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199623

From: Tim Orling <tim.orling@konsulko.com>

https://github.com/KhronosGroup/Vulkan-Loader/compare/vulkan-sdk-1.3.280.0...vulkan-sdk-1.3.283

[RP: fix branch]
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ulkan-loader_1.3.280.0.bb => vulkan-loader_1.3.283.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.280.0.bb => vulkan-loader_1.3.283.0.bb} (91%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.280.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb
similarity index 91%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.280.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb
index b738771801b..6c3197e13f0 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.280.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.3.280;protocol=https"
-SRCREV = "61a9c50248e09f3a0e0be7ce6f8bb1663855f979"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.3.283;protocol=https"
+SRCREV = "720be5198aad4696381d2e3eeadc131c9f56bdc6"
 
 S = "${WORKDIR}/git"
 
@@ -37,7 +37,7 @@ RRECOMMENDS:${PN} = "mesa-vulkan-drivers"
 
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools,
-# vulkan-validation-layers, vulkan-utility-libraries.
+# vulkan-validation-layers, vulkan-utility-libraries, vulkan-volk.
 # The tags versions should always be sdk-x.y.z, as this is what
 # upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.40.1


