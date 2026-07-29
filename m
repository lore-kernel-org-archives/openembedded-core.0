Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9900C55160
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 21:14:50 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21940.1785359688122124296
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 14:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T/5B+SXS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f71156e1aso774632f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 14:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785359686; x=1785964486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9Qt65x2lpHANn2cFsk4Mz3v+h7yy5jb/GP8olGUG/nc=;
        b=T/5B+SXSz16eKQUJL17hSqhL8eqbMfNDwLHmFUvILxvlFfN6aeBLkeZX+bFM++ditl
         VbgkplpL3DlIfe3OUvh333iQFv6kM1KxyCzIktTtrYrsbS7aa8qg2Kem0Tj845EPgKKD
         /vCCZKk61KzXLVKY/YTqjpXEwi25akl1QOOTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785359686; x=1785964486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9Qt65x2lpHANn2cFsk4Mz3v+h7yy5jb/GP8olGUG/nc=;
        b=Zn8ZWMUn6mRfPilIy1cApkwepWJZ+kCqmqH7vvJ3HoxQZ6JRQZxx1mnYx+KyJxKzvd
         A0Q2QURSUpzdMXADHdI6IxxcZv/q1Ye8vlc2dAG/ZpDYA1v/rPTZUhGozYYo7z5nTQGr
         mbmUZMMQHTJg6LuaNhRBkarK2fdIrrk2PRKOFBJRklRe4aM8GfD9+ws26vsbucnS9Og+
         Ph9/tm4+nMPSjBldDvdwsVAqcvPSE5C1Z/OrI6cO+UzhlxxHaXHZTutqsM/roW78FC1/
         EV4WiNOdcoPDnHnOILYptIy1wHv1e5OPExERadGeveRwjnxejE4zA+A5w7tV1u9g6EMN
         z3dA==
X-Gm-Message-State: AOJu0Yyd8JBNrqLAAHsjLEe9SFsAHmOT3uxSTI7T60ZYUxtT50nH+9KI
	F90+x8PIxHPVVSs6jlzrX4TPiYj9UQBoQi/SU109KhYtjbWbJ4vgeByMTg4M0ZHvxEoXD6Vr8B+
	SlC9npGg=
X-Gm-Gg: AR+sD103OXc4j3vXgHuIUyySd/1udwS72cx6SMLTFssKWQEg26FTZsJ5P6YdmJ/dvHB
	QVX8Ah3YZcljPHpJmpWi+J16kyKmvZZhxPK4/IeNo/t8sAB3nYOvGIYC5mN8/pwJkfcCArpSHfE
	mJfHk07jgvTmgUHW0ng6SsywBDjSBu/l15folTsd59WPKa1BEbASscVAQBXtJWpmBuXcH2ox2j1
	JaNhAS6b0zSIf07APtGhdiB6husQ1BQGLytz6SAUYpV9z19/Pcr0jsFbylxv8nbbaR70NliwQ1F
	Xi+sG9zYKMyHTONY1kpcqaHEdATMTgYoPCdShPv0FIit6pidezTi3RMsy0xZoKwKTXmXf6FK+3d
	RehrxkcxUoUmq7l5icqFf0tSKKOvGQqqrtmQLdF92Pzlotv5FkGIn2Few0ILYll826mvaLA8G2y
	IUbe6wXmtMbcOxoF2KpACuLuLUm7dJ4XMunU2jPWf6ZN7QGBzu2d28nEbXwJcwLieydxiW7axGg
	EQ04drZr9s89UBq+oNyL+EcxfJz
X-Received: by 2002:a5d:5c89:0:b0:47f:7114:7d6c with SMTP id ffacd0b85a97d-47fc666d8admr425207f8f.44.1785359686379;
        Wed, 29 Jul 2026 14:14:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3647:86f2:68ea:efc7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a94sm11277116f8f.8.2026.07.29.14.14.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 14:14:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] vulkan-headers: upgrade 1.4.350.1 -> 1.4.357.0
Date: Wed, 29 Jul 2026 22:14:36 +0100
Message-ID: <20260729211437.3394641-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729211437.3394641-1-richard.purdie@linuxfoundation.org>
References: <20260729211437.3394641-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 21:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242292

e3b1eec Update for Vulkan-Docs 1.4.357
8d6039a Update for Vulkan-Docs 1.4.356
8c26833 Change to dual license on static Vulkan headers
d2d8ded Add new C header
6433e5c Update for Vulkan-Docs 1.4.355
0307c70 build(deps): bump actions/checkout from 6 to 7
01393c3 Update for Vulkan-Docs 1.4.354
45834b7 Update for Vulkan-Docs 1.4.353
015e25c Update for Vulkan-Docs 1.4.352
8cfaaa1 chore: Upgrade reuse to 3.3
0e9de56 Update for Vulkan-Docs 1.4.351
7f233bc Fix incorrect header on AI-Assisted Contributions
bc927f3 Add AI-Assisted Contributions and CLA section

License-Update: Some headers are now dual license, one is still MIT

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...kan-headers_1.4.350.1.bb => vulkan-headers_1.4.357.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.4.350.1.bb => vulkan-headers_1.4.357.0.bb} (84%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb
similarity index 84%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb
index f6d797cae75..4a91e39dcdb 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.350.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb
@@ -7,11 +7,11 @@ HOMEPAGE = "https://www.khronos.org/vulkan/"
 BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-Headers"
 SECTION = "libs"
 
-LICENSE = "Apache-2.0 AND MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
+LICENSE = "Apache-2.0 AND MIT AND (Apache-2.0 OR MIT)"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=adc9da32fdd898219b3db5529f2185c0"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
 
-SRCREV = "8864cdc896bbc2a9b6eb36b3218fc9ef57908d77"
+SRCREV = "e3b1eec08173d6b825cd3ac88c885a63b621504a"
 
 inherit cmake
 

