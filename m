Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEDEC55164
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 21:14:51 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21939.1785359686845630514
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 14:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YJ+8d47t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f6609c657so741634f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 14:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785359685; x=1785964485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UGzKWXl5md3253kuxjAVtIO9ok9gNHpbgl15NO2mckA=;
        b=YJ+8d47tmMCKFOz3rROWdAFxUgnO4NrOi0vBO7BxxhTj39WygwmvQiLXwoWXYv1dtr
         aKtIIxHk0xChTG0Nah6BUL4xXRJq6RJ6frlkRv80vTQziPXWCteBFblWPtret7Mb+jfy
         LmYHi/f31Eny7za2he1AYb60nw68xX0vU79UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785359685; x=1785964485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UGzKWXl5md3253kuxjAVtIO9ok9gNHpbgl15NO2mckA=;
        b=rs11VECifdo3UHe7GSsYPP/3cQLgUSHSb7tScpnOnYF6efkFQtERlxeA/2Dnqou/Ps
         oPV+/QVrHq0ueQ7m2cUKPGuMXDNV6YbqBtb0NWMpUF8Aca7l5FaAW8uHq7CfwBbl9tCQ
         MLIj6uBy+vfaXwbTe7KSxbiMTmYj4ieYI4UBBPlzga4yF/9IpxaiMzVrabuapdbGOSLT
         mvXZbsXHIp/SwMj9XanZt9txCBRquVZ9i9atARf51P8RvwYb2TnzxkaxMfoMt4PrN00d
         Wh07HCNJ3c2QHbupQxTt+6vr8qW57GXHXmBXSbx7SbF94j/NPuXx+ocQ26dlst3DBKBy
         wqAQ==
X-Gm-Message-State: AOJu0Yx6yltuzuPbjXNEg0+Nqe/i8+LPg61MuX855R9MvbbLhk9lXPMM
	rgI9xhH00FTbCozxGXcFLNZdlksYnrTHdIiKxmI62VYZnOqTpgMRn/ugJWJHiAGYRt8saPg3FNC
	sJHuCv9U=
X-Gm-Gg: AR+sD11dS6Kk0bxQHWYUOqcIVTS+Z/TyElF7oEztHE51x0JOiLF7d1a2m40iGxoggrE
	wVBQgLVPICksPNJZc/hql55FGm8ckrKns6JGR1Wt64+jlHDZVWxXrHTDZdfDFACZqtCiUZUADrP
	p7KrZTVL3/xSVM4KP9HD2ESbdhI6pnBOajotuQ1vfZkkM4K3AzMs7YKI57I5gBehDBnyonsylJD
	jyjUcyLSOAMFfRoAYu+ecgmRZk0H5jRiCG/xugUiSrqyzZdSuGo3P3bNsE9M4MB60CcECvvqpDr
	jRcTQcbXT4oUIQs88/kOHMTBlEwsRfA+56XCgn42v7wNe7MZNyAhSIDn1x+fsidMeu8X7zlvzMJ
	7ehigy0RGPKfrPISiKucCqqtRNhtJgQBb6BJG8Iy2zzb2JwuQq7ki9Y3svMUf6VDZU4qtaxvYCs
	IFgO0AWn+IWtTYZbPJPwt0LgAXuCkwtt6Aq2YJdrb3g6pgygS+CjOVVlEeFB7JYJbjJHOtwheOi
	WpJW4Q7ndP1xI9Kh4QtfHyQsKtI
X-Received: by 2002:a05:6000:2611:b0:475:f0f0:9ec8 with SMTP id ffacd0b85a97d-47fc668869amr476902f8f.51.1785359685113;
        Wed, 29 Jul 2026 14:14:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3647:86f2:68ea:efc7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a94sm11277116f8f.8.2026.07.29.14.14.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 14:14:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] vulkan-volk: upgrade 1.4.350.1 -> 1.4.357.0
Date: Wed, 29 Jul 2026 22:14:35 +0100
Message-ID: <20260729211437.3394641-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729211437.3394641-1-richard.purdie@linuxfoundation.org>
References: <20260729211437.3394641-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 21:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242291

7768933 Merge pull request #303 from zeux/update/357
11f5a1b Update generated source with the new exclusion rules
1bb1f65 Update extension version filtering mechanism to be more generic
94d905c Update to 1.4.357
3b00554 Merge pull request #302 from zeux/update/356
f5e6b44 Update to 1.4.356
91e0d29 Merge pull request #301 from zeux/update/355
2ad9fb2 Update to 1.4.355
477a354 Merge pull request #300 from zeux/update/354
e2e6d51 Update to 1.4.354
9aa85bf Merge pull request #299 from zeux/update/353
6a8a2d5 Update to 1.4.353
47cddf7 Merge pull request #298 from zeux/update/352
40a3321 Update to 1.4.352
916c68b Merge pull request #297 from zeux/update/351
44a84ca Update to 1.4.351

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{vulkan-volk_1.4.350.1.bb => vulkan-volk_1.4.357.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.4.350.1.bb => vulkan-volk_1.4.357.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.1.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb
index 4541b71a982..4e8504ed660 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=cfcbdd69e15396e371f639c69acf40bf"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "3ca312a4f38baa63d8006b6905abbeeb89c8087d"
+SRCREV = "776893306c5d3b22b6185b5d4a258b81d94572bf"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 

