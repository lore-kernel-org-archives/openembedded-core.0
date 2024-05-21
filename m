Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A88C41513
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 11:26:34 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.17340.1716290782649753991
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 04:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iPjtesPM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41fd5dc0439so31346465e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 04:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716290781; x=1716895581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1qxaXjN5uazE9cnkCCzsTc3E9ITgeivQTj8HKWiMJE=;
        b=iPjtesPMHtsc8ssQXfLjwJX/9VBLENeXwkFjI6PPVdRjBBHX4cxiuBjyH3ThqI4t4N
         B55kEr7SfLMocvh1M133ThNHVP5oAMf7YFFhFcYb8bA+q1kuEcRChGfC2laD+7Vq6DXg
         ZeGYrSjOp+VAJddp+9TeRI1712XdVfEcjURnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716290781; x=1716895581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1qxaXjN5uazE9cnkCCzsTc3E9ITgeivQTj8HKWiMJE=;
        b=Ge/r2c/CzzjTtngkWuwi3OD21RJgAyKtBOBD8SorZQToC5YrvvirCJLWwvvpcdk4MB
         42b59yZRrEzmbPXpJyDSwsJFOqAIl3liBssSLd3YOgKc46D4M65OJukWpoNI30KzJYMl
         b8dICj4TtBTdkHxCxchloZHOtPcoQabKkB8l0c+cqUDPIckESmLuZbWluObPZ76ZYzDw
         OqyY1OpVDVxM15dPLfFSRtG4L1o/bPokc+9qWLsvH3er384ByYbjtV+XVt/3igiwy3nx
         H+sNliyx3MfEO4PaM9TFxO2gsarzb3XSTl6iTAYYoRNt86zoreP8uQx1a9yO8X/tuhRZ
         eEVg==
X-Gm-Message-State: AOJu0YyNPgHT+eOvUhzuTR1rGvuA5/yVlGldJ7TDCm4MY0ZmitCeGqyG
	SxAyhjQqQHtfyOwmdO473Fj32WnVLLIorloiZ0AzgVB1f1SDKCCbzSdG1c9j59/xf2jjPB4PqlQ
	ztd0=
X-Google-Smtp-Source: AGHT+IHEVQCfW9CVlPgRdy6X+rLqBiGC0jV7PDCd1ZsGJR24mDVy3gWWHHX09OQa5+tj4RzHiN6brw==
X-Received: by 2002:adf:f60d:0:b0:34f:824:17b2 with SMTP id ffacd0b85a97d-3504aa6332bmr22808442f8f.65.1716290780682;
        Tue, 21 May 2024 04:26:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1738:232d:aeeb:3bb7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbc4b41sm31670646f8f.113.2024.05.21.04.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 04:26:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 7/9] vulkan-validation-layers: upgrade to 1.3.283.0
Date: Tue, 21 May 2024 12:26:12 +0100
Message-Id: <20240521112614.1137127-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240521112614.1137127-1-richard.purdie@linuxfoundation.org>
References: <20240521112614.1137127-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 11:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199627

From: Tim Orling <tim.orling@konsulko.com>

branch=vulkan-sdk-1.3.283

https://github.com/KhronosGroup/Vulkan-ValidationLayers/compare/vulkan-sdk-1.3.280.0...vulkan-sdk-1.3.283

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...s_1.3.280.0.bb => vulkan-validation-layers_1.3.283.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.3.280.0.bb => vulkan-validation-layers_1.3.283.0.bb} (93%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.280.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.280.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb
index c488309c913..2f1efba856c 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.280.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cd3c0bc366cd9b6a906e22f0bcb5910f"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.3.280;protocol=https"
-SRCREV = "8506077b9a25a00684e8be24b779733ae1405a54"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.3.283;protocol=https"
+SRCREV = "d5bed3e26b3d487e8d21f0cc39039351eac921a7"
 
 S = "${WORKDIR}/git"
 
@@ -43,7 +43,7 @@ FILES_SOLIBSDEV = ""
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools,
 # vulkan-validation-layers, spirv-headers, spirv-tools,
-# vulkan-utility-libraries.
+# vulkan-utility-libraries, vulkan-volk.
 # The tags versions should always be sdk-x.y.z, as this is what
 # upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.40.1


