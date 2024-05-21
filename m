Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A325C25B7E
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 11:26:34 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.17317.1716290777857439354
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 04:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ANg0OG66;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-420180b5897so29087775e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 04:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716290776; x=1716895576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FR/WIrxyff3LDKXwwPJ3azJJ6LEtjg5aEGmggc94HXM=;
        b=ANg0OG66VJ0luusmpzZ6cxrysc31gMURw/u3yajE0B7rRjqUkozyHAyrvQqGlsrMoJ
         BHgb7oZ1Dv7IWtWWvXnapJPHqQSbDrmMQcOUxWDGzrCwWT6NceIcbRzM0d8TqsfYKfKw
         Bwzg3pBXGPgg9oDcgQlIsIMzUcvzqf53UI3R8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716290776; x=1716895576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FR/WIrxyff3LDKXwwPJ3azJJ6LEtjg5aEGmggc94HXM=;
        b=SP4xmNJ35to9mfvt+XU6STeiOUo7e0eao6+lb6RwcJtAxlrHZTjIKV7NxwnKds8aN9
         LCFu2jHdB9nOJvIyn4OGz3kCUuJiEBeFqVeiafXowy6S2gxCXH0QJzYZeIQATOtxNqWC
         +ErdbdRh43vmSUDw7XP0mQO0raRQCOunC0jllEmujY3ViFiROmboKhcFlBHkpV4Kyq/8
         9+93Fdd8GkAU/B+QDxv5HdoDaWpNBFLmMaCjkrcLHfMwt1ha3wkD76N4+gI4OOaVjJqT
         kWuK192xvxN6+KNVbtW5k1nuOwqRUjL9gSaGQeFc8kVAY+rijTutCowQyjy4W8JtA0Te
         Jg3w==
X-Gm-Message-State: AOJu0YxzXr3fyVEwBQIhPyHq0bBQEjdhbyhuSeqy+e/0cFIjV+LHALX+
	07hH9Inaayech42jfBSFeLlKOfbfjSV0Bc2gLf6Kj+XVS7ijfA0CASuh8lrp9BtVzpWf7ihol92
	gZN0=
X-Google-Smtp-Source: AGHT+IFMLoZAu8LBILgCwALlHMyDQz53v3b0u0NLsOr7/lmScECp2TZHIUwROrgKvaIFuwb/hveQDA==
X-Received: by 2002:a05:6000:d82:b0:351:bc37:c68d with SMTP id ffacd0b85a97d-351bc37c731mr15696625f8f.49.1716290776030;
        Tue, 21 May 2024 04:26:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1738:232d:aeeb:3bb7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbc4b41sm31670646f8f.113.2024.05.21.04.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 04:26:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/9] glslang: upgrade to 1.3.283.0
Date: Tue, 21 May 2024 12:26:06 +0100
Message-Id: <20240521112614.1137127-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 11:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199621

From: Tim Orling <tim.orling@konsulko.com>

https://github.com/KhronosGroup/glslang/compare/vulkan-sdk-1.3.280.0...vulkan-sdk-1.3.283.0

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../glslang/{glslang_1.3.280.0.bb => glslang_1.3.283.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.280.0.bb => glslang_1.3.283.0.bb} (92%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.280.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.283.0.bb
similarity index 92%
rename from meta/recipes-graphics/glslang/glslang_1.3.280.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.283.0.bb
index 637082c7199..b58bd1e9562 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.280.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.283.0.bb
@@ -8,14 +8,14 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "ee2f5d09eaf8f4e8d0d598bd2172fce290d4ca60"
+SRCREV = "e8dd0b6903b34f1879520b444634c75ea2deedf5"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
            "
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
-# vulkan-validation-layers, vulkan-utility-libraries.
+# vulkan-validation-layers, vulkan-utility-libraries, vulkan-volk.
 # The tags versions should always be sdk-x.y.z, as this is what
 # upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.40.1


