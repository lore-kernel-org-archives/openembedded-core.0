Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D494C53210
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:53 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.177177.1672213056038755280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JDt8En11;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id t15so5385677wro.9
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyYjZEv2BTAhr6Q1EoXM/w08wPDVcYBusaiWYZmGRM8=;
        b=JDt8En11GtGQb6w8HXcKDtCw/IZWkIt2hEIOWLSmZDH9tVWWPjyPXK4zJH2IdmRBl/
         hR3oGzm0gV8jX/gPeurrgcwc0rQCKuRjLKhjyVWNDC4lXICw3I6TvkNM33DVXXS54cD6
         gEMrYvL8Dn15RmRrC/8TXWRwi5cMR9l0s7G/rQkhJxCDQJaiG48TcbHDM9RIgsDICGfl
         W0PJFZV1Y415gg+3rrCYVuKmLEwC5LAykHyAxpS3S0lfEKGHOXvkit9yZeTmOP6PrXEw
         at+Zqhqmu+nNu0L+iuojaWnGbwvdYT9Dmha8OpVsF44Hxjit6v59EDwaobtCD515zqlS
         LvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZyYjZEv2BTAhr6Q1EoXM/w08wPDVcYBusaiWYZmGRM8=;
        b=TUSOq1zuF7PhuukXxmkgo4j066CKPeXjeh9BeHqtZeYMxo96h+YkBSnSZVKz4gBqIU
         eh1IK/ecHHJPcQ/a4PLfTQSCCa/2FPHne2aEsggBpcoY4anuwt32cm1RXB2ISNkGz9c3
         o9rgxiSarxp+z/9TQ0I1DQLAmVxsbERqTZItO/c74Wm6qKHhpzFrVnhduTfPsGZQ8WHf
         942pb7yWWCAOwcj7D7jOgnKGLRXmmPcaBw5NjJ2ke3XUJeVhLHt6/ejefN2N54izp1cN
         Uegs5TjXWI9EZfLfNtwqVt6vF7BrCpNfCyFZudvlgSrwN9Pg0lL2YjANHIibhk//KJgM
         xseg==
X-Gm-Message-State: AFqh2kre71y1JUF7ihUzVPx6yg61+tiTDapY2wIus6bTzC5DaU4NsqS0
	f2e9NPrNNdt3Af0qnrWxYCbJ0I6DdQY=
X-Google-Smtp-Source: AMrXdXs5T8RnSxjOQhfJronYsWB3GjJNMjSxzuLXnwE0RuZqnSfSp6VzU48AxqJPXezqL4fueFjxqA==
X-Received: by 2002:adf:a50c:0:b0:241:faf0:17ec with SMTP id i12-20020adfa50c000000b00241faf017ecmr16112764wrb.4.1672213065893;
        Tue, 27 Dec 2022 23:37:45 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/25] vulkan: upgrade 1.3.231.1 -> 1.3.236.0
Date: Wed, 28 Dec 2022 08:37:20 +0100
Message-Id: <20221228073721.3454255-24-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175062

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../glslang/{glslang_1.3.231.1.bb => glslang_1.3.236.0.bb}    | 2 +-
 ...{spirv-headers_1.3.231.1.bb => spirv-headers_1.3.236.0.bb} | 2 +-
 .../{spirv-tools_1.3.231.1.bb => spirv-tools_1.3.236.0.bb}    | 2 +-
 ...ulkan-headers_1.3.231.1.bb => vulkan-headers_1.3.236.0.bb} | 2 +-
 ...{vulkan-loader_1.3.231.1.bb => vulkan-loader_1.3.236.0.bb} | 4 ++--
 .../{vulkan-tools_1.3.231.1.bb => vulkan-tools_1.3.236.0.bb}  | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.231.1.bb => glslang_1.3.236.0.bb} (95%)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.231.1.bb => spirv-headers_1.3.236.0.bb} (92%)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.231.1.bb => spirv-tools_1.3.236.0.bb} (96%)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.231.1.bb => vulkan-headers_1.3.236.0.bb} (93%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.231.1.bb => vulkan-loader_1.3.236.0.bb} (94%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.231.1.bb => vulkan-tools_1.3.236.0.bb} (93%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.231.1.bb b/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb
similarity index 95%
rename from meta/recipes-graphics/glslang/glslang_1.3.231.1.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.236.0.bb
index fede2516b1..99eca6a6c1 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.231.1.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.236.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "5755de46b07e4374c05fb1081f65f7ae1f8cca81"
+SRCREV = "77551c429f86c0e077f26552b7c1c0f12a9f235e"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=master \
            file://0001-generate-glslang-pkg-config.patch"
 PE = "1"
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.231.1.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb
similarity index 92%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.231.1.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb
index fdcc8d523f..e35628ecbf 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.231.1.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.236.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "85a1ed200d50660786c1a88d9166e871123cce39"
+SRCREV = "1d31a100405cf8783ca7a31e31cdd727c9fc54c3"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=master"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb
similarity index 96%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb
index e175cde145..c921bdef72 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "eb0a36633d2acf4de82588504f951ad0f2cecacb"
+SRCREV = "40f5bf59c6acb4754a0bffd3c53a715732883a12"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb
index b41b82af9d..8716376fc0 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "98f440ce6868c94f5ec6e198cc1adda4760e8849"
+SRCREV = "b75e5a02b6933caf86c5822d019067b335492c85"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb
index 7aab7446f6..56f9d765f8 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.231;protocol=https"
-SRCREV = "eedbf08292a6be19c3527e77ae2df3f209cab285"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.236;protocol=https"
+SRCREV = "1ee83a25c2c20e2efbfc0ac976c7a3ddb5fc291c"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.231.1.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.236.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.231.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.236.0.bb
index 9066821de0..a3561bbb5c 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.231.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.236.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.3.231;protocol=https"
-SRCREV = "8d2d3e22d684540fdc5a76c15e456fc2fd11e4b7"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=master;protocol=https"
+SRCREV = "ce45337c51ed53e6f1b337aa746a5a96c5018f86"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


