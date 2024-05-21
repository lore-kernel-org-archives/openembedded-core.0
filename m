Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3144AC25B7C
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 11:26:34 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.17319.1716290781618943524
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 04:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AdhYKMXo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-420180b58c3so31223555e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 04:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716290780; x=1716895580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ia3wCl7Ul6rD6/hvmB2mWWtfk3yg448MZxYydU8/vg=;
        b=AdhYKMXo7W6wQeD2PhNzyg+jhzCGxIyFi2x0mbyfhwnXYe128IdX2EO7qMrEYpfOE8
         F1I8Gj/NfbYuu1t0bQzOumjVyPArEBRzyJLrbkz266MMjiOz9HLh94A6YCHpIWQskfz3
         byIyxx4uXq8v7WW12GV+djE2M5JlMwBl8hrQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716290780; x=1716895580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Ia3wCl7Ul6rD6/hvmB2mWWtfk3yg448MZxYydU8/vg=;
        b=btvdOkL5gi1UVit59l5/T8o+aHpg8ptTotZxI7eKIKm7emoNB8Mg1C4vn1c3hhXsoG
         oz6Ty31JgQTE9RzSDAQh6DIjx6lirFrmU42VXE6TqPZNopZXWx149VqrhJAup0eKdsL2
         CSTK6gkoVp8PToTj0papxMIIYN/yO1xYtJOSEXQcLtoZulwiZqiLRVqQ55lfCdgqLdDi
         WfQpsMwx9QE3c6FubVwMyCxdx2eSBJirt59rjKhz/8zIXVP5vurKf6EY7wH9bqMrMHC8
         jHseg3VX+HF91GjVl9GvpIxoxmIAxpZk4UJLB0WPnLrXLfHnRIRV+oGGDWuON5A1iLvv
         Vj0w==
X-Gm-Message-State: AOJu0YyOgTZ9Q8I+I1Pf+WwS7rQ64A0AccnQkBLgsMMyVCwbvT+okPS7
	/W/6GoV/wyspUKwfjkEOCdQQJvBnKcCIna6ZWH0XC1DM6G2mT959G5kFVctT58Dg32lX5zSVghV
	ujco=
X-Google-Smtp-Source: AGHT+IHGq5oaAdvXNHsWGntkemdBhrLi/a+cO/x/Qx8FPrauH4wustUj8eSnP/6I7/xpnkxLhn6bHg==
X-Received: by 2002:a05:600c:4fc9:b0:41c:1434:f571 with SMTP id 5b1f17b1804b1-41feac59deemr247559525e9.37.1716290779883;
        Tue, 21 May 2024 04:26:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1738:232d:aeeb:3bb7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbc4b41sm31670646f8f.113.2024.05.21.04.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 04:26:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 6/9] spirv-tools: upgrade to 1.3.283.0
Date: Tue, 21 May 2024 12:26:11 +0100
Message-Id: <20240521112614.1137127-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240521112614.1137127-1-richard.purdie@linuxfoundation.org>
References: <20240521112614.1137127-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 11:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199626

From: Tim Orling <tim.orling@konsulko.com>

https://github.com/KhronosGroup/SPIRV-Tools/compare/vulkan-sdk-1.3.280.0...vulkan-sdk-1.3.283

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{spirv-tools_1.3.280.0.bb => spirv-tools_1.3.283.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.280.0.bb => spirv-tools_1.3.283.0.bb} (93%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.283.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.283.0.bb
index d2b6acf9460..292a17f00d5 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.283.0.bb
@@ -7,12 +7,12 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "04896c462d9f3f504c99a4698605b6524af813c1"
+SRCREV = "dd4b663e13c07fea4fbb3f70c1c91c86731099f7"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https"
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


