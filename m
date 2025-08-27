Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E26EC8303F
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 04:36:09 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.7714.1756269367001520425
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 21:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TCLaAPSF;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2465cb0e81bso30370395ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 21:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756269366; x=1756874166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s4l8cQdOJsgwEkAKs9Zp3kd2YbpmXAVM5e1o4NRk7eE=;
        b=TCLaAPSFeTEmyrWY0//RQkrSDcvF3IcAowwdPeoqXCNjteb5QRT6r+F2em4Si0kJ2u
         icEapFzl0x3Km/OyLZOgwbfIiAOu/IHGLpnsqVBmXFuWyfV2T4wvaOi3uqJNLICcmVh2
         gsE5sBprQ3n+Q3f9MWwTejb0Al+yKKDbLF/k8q7tfMGQaSxvp0JTqKpCGm2qEhfctFB7
         i2eyl7y1HGL1z6tCQRU/p1EoLVAXOCilQSVybZqNmZjfw53NMLNUeyfnOdf5J8cXWuDB
         3P+riydLoqNKhvK/3NYVQh2WpEaliO4CRGQlyyFz/mgugQU4lZ7QRxj+nhd0MHOfv/0F
         tyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756269366; x=1756874166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4l8cQdOJsgwEkAKs9Zp3kd2YbpmXAVM5e1o4NRk7eE=;
        b=n/b75B8YDyLhThvaC5yLrJ8GRWvsKWbLFZ+n2kcTJVRaMR0B6eToKGe6/tDHsyxaJl
         rhiR4e+G3ytXFvF9cAK7qFTf3UbglfN3j5vj1TT2mmSslpC0q+rPqoZBhBqyfQ/6FMlN
         f/AnKCz6thbyg2n3jpl1ckimE6qzersHwXGewaXT+yYDpIowO83QjpBYwroMl0oS+yxb
         ECdUF8DWrDfnuYNkaPQ9qyHQd29q6quPXoBRp375LPaLVy5YmliHoel96mFQvLuKlczs
         FgJEvuaYCsD5hOO6x5gYDZmYV+uPbdLupe/qggJqkuDk0noR/7FIX+VoXE86U8W64YLY
         pTeg==
X-Gm-Message-State: AOJu0YwAa3zLIUArMGXcL1E5NnzEdZX/l1/QgKa3xHqJzlG3wydkx27Q
	rrWqPxEQjv5grN5ThRlROe17zKB6Tw1uR1t1YoFXKKXoZV5eVLAlUsEf7W5ixS/I
X-Gm-Gg: ASbGncuoa/8v4eFXLCSXrytzGRzinmG4Qd/wvgRaNjpFsDSRNPbph4bSShcflSksGcY
	cFIL+EOTs8G3gRMUS6Xq5yXYl7ewan6cjvItkBPz3L8zZjY8kybatOW43NgiDnsHYZjQ/vVg53X
	YaYH4/Ub33E/6diPMUHDJz4/gHOkRsYlQoYMPTHiYFFtRF7Co7dSUuBEZO99w82Ok2WIWB40PGY
	lnYiXHpPxfX4VePNneOFjrJM4k7Jk14RmCJ+pLVONBgTzReir30KMh93SpEIiJLBH6dNjy+5oKh
	WVC3TMS4XR6AbGN2mqlyzxuf5Cac6Lb6ko1gGQ5K3vQghl4x56gIc5WGguMEkltt0HGWAQvXYCh
	D1LDYkphWmGDFYXnGfuMefaKj5AElHeqKTj+YAn/ZQOXpS4wzVkVrbtpXZSvIx2PkWgUpMCkbw8
	+zI6Ui5CL8lItKj+cSPxLOllJpYeNxMLJS4J0C8wxu
X-Google-Smtp-Source: AGHT+IHPFBDtovMl1VsjGH+er5Jof+sAv221NE7OWUWxOQREgxsypxmAR6UpJlMM7Y1hAp/05Kk06w==
X-Received: by 2002:a17:902:ec87:b0:246:6a8b:8473 with SMTP id d9443c01a7336-2466a8b8672mr194345635ad.45.1756269365955;
        Tue, 26 Aug 2025 21:36:05 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668864431sm110169525ad.93.2025.08.26.21.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 21:36:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] spirv-llvm-translator: Upgrade to 21.1.0
Date: Tue, 26 Aug 2025 21:36:01 -0700
Message-ID: <20250827043603.2833795-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 04:36:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222489

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-translator_20.1.4.bb => spirv-llvm-translator_21.1.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_20.1.4.bb => spirv-llvm-translator_21.1.0.bb} (88%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb
similarity index 88%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb
index 64a73ce55aa..6a6c6ac77c4 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
 SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
-SRCREV = "74843f2186bb63b6802758222084da17fcbe603c"
+SRCREV = "acb023b63a4bafd53d0ba6a1a452b1f0e5671458"
 SRC_URI = " \
-    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v${PV};branch=${SPIRV_BRANCH} \
+    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=${SPIRV_BRANCH} \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
@@ -20,6 +20,7 @@ inherit cmake pkgconfig python3native
 # Specify any options you want to pass to cmake using EXTRA_OECMAKE:
 # for CMAKE_SHARED_LIBS=OFF see https://github.com/KhronosGroup/SPIRV-LLVM-Translator/issues/1868
 EXTRA_OECMAKE = "\
+    -DBASE_LLVM_VERSION='${@oe.utils.trim_version('${PV}', 3)}' \
     -DBUILD_SHARED_LIBS=ON \
     -DCMAKE_BUILD_TYPE=Release \
     -DCMAKE_POSITION_INDEPENDENT_CODE=ON \

