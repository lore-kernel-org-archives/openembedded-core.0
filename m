Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DEDDC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 10:13:21 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.9310.1646302400207553513
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 02:13:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CX6c0MuQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id y2so1278453edc.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 02:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kuGv2wRjocOdW2tLkgLT53H9BPspiUgWbbwie5zu1Zo=;
        b=CX6c0MuQ1IjXmhK5ocitadBq99JayEL6gi+egx4OPonKov4PUpUnJp9QAUWoshYdYn
         3Wg3nhQIKeRTCB4aik2DIW6zp5DFVx5Gl8NVqFRgddcoAVVwicz7F88bkjGKA5z6jDy0
         lGf4p4jMN7+yJkmuV4sqnfTiB6D0hJ1/MbBojBliqTlv22P4Bomi35yAHkOsj93+XT46
         9enOLYBtDmiXJO8Aq01DUuZGLxo5M+LsEqr+OiK5irn8QJ3iW3NR3fgcfYt2FU7AnqrE
         CE0QuoQpUbEgE4hzkW8pOAt1VN1eb7+XES/LC0DZM2eJSUw5s7I/MCGMeytI5dKI4/qA
         n5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kuGv2wRjocOdW2tLkgLT53H9BPspiUgWbbwie5zu1Zo=;
        b=NI0329Ks/Kl8V/Hjgasgh9EcR3EVSTYjbclR4aBd/etIkRTV1S5jqzpWTVFTLLIl1L
         POYYyXh+IM8bhS949uzXSNvukoT6W7kkG9+e5aSRGzWgg/iFV+vURww0AgqCbMb5Dwea
         HJszO1P1VWmYPHch4MR5yJs7ULJqYwbUIfruvWxESOflglES+/FqHy2TVd9pDquVKxuy
         BNEkKGFsxr4WtNGCa2SBy6cpIGyLdh/tPg4CoRJdVoZaLxtzK4xvuv2u/3jYx+4mQoLb
         1fjYg9yEzGMwZC61NRKIhPb6C3uys3H3FPn5nWnl5uIvQXd0r4st2cZHFUGU+dP/S1cy
         c5dA==
X-Gm-Message-State: AOAM530hTSTX5w4uoKUlUPZGnV92PDsEJ2/S3rW4tmrVdc9B/tx3u+6C
	Cspt4lc0KG3K1lLUUGEK2sqq5RNxJ0w=
X-Google-Smtp-Source: 
 ABdhPJybCvm8GciQ5yD0OdVN7qkahekOIFwVWbIBvrv3hCcCSDD4GWy+HJFS3TDJUhc7WMah4jmSlg==
X-Received: by 2002:a05:6402:1941:b0:413:2822:9c8 with SMTP id
 f1-20020a056402194100b00413282209c8mr33683425edz.13.1646302398516;
        Thu, 03 Mar 2022 02:13:18 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c23-20020aa7c757000000b0040f6b40f841sm654340eds.65.2022.03.03.02.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 02:13:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] glslang/spirv: synchronize with the rest of vulkan items
Date: Thu,  3 Mar 2022 11:13:15 +0100
Message-Id: <20220303101315.1664127-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 10:13:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162645

These components are now versioned in sync with vulkan releases:
https://github.com/KhronosGroup/SPIRV-Headers/issues/252
https://github.com/KhronosGroup/SPIRV-Headers/issues/266

"We'll continue tagging the repos contributing with SDK releases, as
that is when all the testing of the various projects is performed
together."

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../glslang/{glslang_11.8.0.bb => glslang_1.3.204.0.bb}    | 5 +++--
 .../{spirv-headers_1.5.4.bb => spirv-headers_1.3.204.0.bb} | 4 ++--
 .../{spirv-tools_2022.1.bb => spirv-tools_1.3.204.0.bb}    | 7 ++++---
 3 files changed, 9 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_11.8.0.bb => glslang_1.3.204.0.bb} (90%)
 rename meta/recipes-graphics/spir/{spirv-headers_1.5.4.bb => spirv-headers_1.3.204.0.bb} (88%)
 rename meta/recipes-graphics/spir/{spirv-tools_2022.1.bb => spirv-tools_1.3.204.0.bb} (89%)

diff --git a/meta/recipes-graphics/glslang/glslang_11.8.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.204.0.bb
similarity index 90%
rename from meta/recipes-graphics/glslang/glslang_11.8.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.204.0.bb
index a77d8bdf88..2af406212f 100644
--- a/meta/recipes-graphics/glslang/glslang_11.8.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.204.0.bb
@@ -8,10 +8,11 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "c34bb3b6c55f6ab084124ad964be95a699700d34"
+SRCREV = "2742e959347ae2fac58acd0d022c92a0ff1f24bf"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=master \
            file://0001-generate-glslang-pkg-config.patch"
-UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
+PE = "1"
+UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
 
 inherit cmake python3native
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.204.0.bb
similarity index 88%
rename from meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.204.0.bb
index 3144b1eb42..72416b441f 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.204.0.bb
@@ -9,9 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
 SRCREV = "b42ba6d92faf6b4938e6f22ddd186dbdacc98d78"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=master"
-UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
+PE = "1"
+UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
-PV .= "+git${SRCPV}"
 
 inherit cmake
 
diff --git a/meta/recipes-graphics/spir/spirv-tools_2022.1.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.204.0.bb
similarity index 89%
rename from meta/recipes-graphics/spir/spirv-tools_2022.1.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.204.0.bb
index 24142a4fe0..dc78073717 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2022.1.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.204.0.bb
@@ -7,9 +7,10 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "b1877de5cd776117050bd42f08d04b52bce16099"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
-UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
+SRCREV = "45dd184c790d6bfc78a5a74a10c37e888b1823fa"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=stable;protocol=https"
+PE = "1"
+UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
 
 inherit cmake python3native
-- 
2.30.2


