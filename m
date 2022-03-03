Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5442C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 09:33:33 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.9114.1646300013046909416
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 01:33:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KObNB1ql;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id d10so9271770eje.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 01:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5QODykyYXJVPBE0aiBrmOegt0lMUiMhEi2zM1Uvf5lQ=;
        b=KObNB1qlEp4J3ndW3CNX0ttv9wSkrGhDzvOkjH5GmVJRoUN/Sn/0kLjHA+MmBKnOiE
         CFthbeGzh+5uBbE0xYsLx0h4Mm4O76hpXaAe1KPgePj5AWBB9Wuzd4xJcHWSDUVpOQum
         TZ1dtsiDo/F95bhPrEZDNrqZZrbLoX9cDN/WyqHjyxea6DC3TSPXbWjbpmaaB+46QM9R
         TqWGjSprgpAFWvlMdGtfzUkpgfG/sOAn6L0dHlWKdAMFXpscwqVB9+L3dD11GFUvwNIH
         JyhjBPqMN5W/tjjNdlIEMwxk15p2h95IMKyocNbt4dGWiN99p8GGJI2/YN3VAkcuFJwB
         D8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5QODykyYXJVPBE0aiBrmOegt0lMUiMhEi2zM1Uvf5lQ=;
        b=pppUCwtCURbiGLXFhjzxGja686Ibd5euSBC95JukpoCbTZwJls8A6wIyUL0NUPWutj
         QWNm7qe03u06Aa8J5GWIxMzU3ZYNlNyodahsSJ0dUs16l//OXYuo+0rqNn7Mycq+aZKx
         pUATX1y+yqDd+c5R9ZcaAiNkHW8fCJY64qiOLPp7ZOrDal2yWfFms24TCEjWLb8proWa
         K/pJukC3rTGdcO68fSIKQgfDBWd+hs1vbP0tzY4xmML9MewJae0R0OTTwaYtUMW1BntY
         cLtb00DOvc+44Mh8wC9T/jUU+4fvg5qM64akMVEQ9ojn+YgsnP9uX7YZnPGowGUZWN3i
         8ZoQ==
X-Gm-Message-State: AOAM531dcRZJHR9SLvz3ReSEX2m+lubBGotNeWtgtfdhIS12p+1Pb77w
	rnLDM71F3bF7LVuEvLV78oss31Unb/w=
X-Google-Smtp-Source: 
 ABdhPJx2PWTGtjXbpMJU0xhbxLlSL7sheUJ6Erai6wRgIIyVNe/iaryIvwLuAfU9H+0MUMIPfJgLRw==
X-Received: by 2002:a17:906:3e4b:b0:6cf:7f02:9332 with SMTP id
 t11-20020a1709063e4b00b006cf7f029332mr26159226eji.404.1646300011611;
        Thu, 03 Mar 2022 01:33:31 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 fb21-20020a1709073a1500b006da6eefdf11sm504650ejc.49.2022.03.03.01.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 01:33:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] glslang/spirv: synchronize with the rest of vulkan items
Date: Thu,  3 Mar 2022 10:33:24 +0100
Message-Id: <20220303093324.1663870-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303093324.1663870-1-alex@linutronix.de>
References: <20220303093324.1663870-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 09:33:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162640

These components are now versioned in sync with vulkan releases.

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


