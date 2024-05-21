Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3417CC25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 11:26:24 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.17318.1716290779838599317
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 04:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GuYQq/TC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-351cda41b53so2886950f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 04:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716290778; x=1716895578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJUHSxUd7eKcaUwHesGt3dW5AxZCvnkDiCwdr41Cq+E=;
        b=GuYQq/TCmQVyfglSMzsVi9GufbcusTVVa4OFGkVvcxyW+6RoevX0cG1IPlaqsoF1HS
         awBk78ScVZQIib/+L6+MAEWMGRxACbT/q8Ez73N9PYSR4mtcGgYJIipDuIhn+AsAqBRV
         N0AyF+yYcEVb7FpbWJEIcwwMG3X3BnwA73zvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716290778; x=1716895578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJUHSxUd7eKcaUwHesGt3dW5AxZCvnkDiCwdr41Cq+E=;
        b=S20vybBAqp+SGu0IL60uYkma8uf2M8r/tdna6M99XUm2oFOiLwSLNkjZIwtW3FbGhL
         dERcqHuaffan9hYonihkiTeEKiYB8SaAzG0Avuju81SG+/w7a21tp1Cw0UGaj8IZapd6
         RhcDXfZxUAqz8gTax3yoHieQOvz8wkTrfceQsgqA/3Ru95ltN9NacZKPz1gkHi0xuwV4
         utPpIYKnNpEce2mKXlUmGvwFmow1sJtUDVxavP5V0YdecY0sz2tJmqiYvcGRlGJTefBT
         Fyj2ULQ+sREpma9W4hKwMAfLlRVBnYigQ/bTWr+m9iTxvQUx2aBXgnLFiUkJARzaHfLV
         A/6w==
X-Gm-Message-State: AOJu0Ywx6jbmeLcXJxegvYSn1JNr5SlH1Q1xrHRXiWnfNBlG9iSy7j8D
	dRXJUfUyQGCaICp9NIspc5IB+X5imG9jgS9goerc8UkFVNVy9JmGDY+9dkIz2Dy26FyDwTQN/hn
	Hkr4=
X-Google-Smtp-Source: AGHT+IGAdEoKiQm/yu5GcQr+FZGHW/LMdXb6Q8I+ip0vdXRZO5Oo5GztodMVpIXY6pBO0po0KpXACw==
X-Received: by 2002:adf:9794:0:b0:351:db60:3def with SMTP id ffacd0b85a97d-351db6040b3mr10968472f8f.51.1716290778189;
        Tue, 21 May 2024 04:26:18 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1738:232d:aeeb:3bb7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbc4b41sm31670646f8f.113.2024.05.21.04.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 04:26:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 4/9] vulkan-tools: upgrade to 1.3.283.0
Date: Tue, 21 May 2024 12:26:09 +0100
Message-Id: <20240521112614.1137127-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240521112614.1137127-1-richard.purdie@linuxfoundation.org>
References: <20240521112614.1137127-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 11:26:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199624

From: Tim Orling <tim.orling@konsulko.com>

https://github.com/KhronosGroup/Vulkan-Tools/compare/vulkan-sdk-1.3.280.0...vulkan-sdk-1.3.283

[RP: fix branch]
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{vulkan-tools_1.3.280.0.bb => vulkan-tools_1.3.283.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.280.0.bb => vulkan-tools_1.3.283.0.bb} (90%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.283.0.bb
similarity index 90%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.283.0.bb
index a7e4a67aaa1..a76f60735f2 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.283.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.3.280;protocol=https"
-SRCREV = "136976082d0b14dad8b9687982b2a80cc6e6a633"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.3.283;protocol=https"
+SRCREV = "38321da9031f5909f1ca2dbafac8840ef6b2c144"
 
 S = "${WORKDIR}/git"
 
@@ -31,7 +31,7 @@ PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SU
 
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
-# vulkan-validation-layers, vulkan-utility-libraries.
+# vulkan-validation-layers, vulkan-utility-libraries, vulkan-volk.
 # The tags versions should always be sdk-x.y.z, as this is what
 # upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.40.1


