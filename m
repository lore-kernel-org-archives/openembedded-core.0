Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C415ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 07:42:38 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.4899.1662968544892317851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 00:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i2ariE2p;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d82so7784092pfd.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 00:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=CiBNJp93sKGHpS/lWyCrXljQvB5j5Yd56dPPxFa9iSc=;
        b=i2ariE2pUsYYu03uYp0jgP4c4IS+OeazVZOyGJ6cZvqaicx1D1EaGmdlgAfJpNnXdZ
         UQSV7W0lMlHJeBnaK0eBy3hAEmbeKATUJ4VyWxmQ9Y+rw9T8Gqvt60Wt4ypEfgS2XvUg
         CT476mA+4tERClGFtopXCc1rccHfUclAb520woP+WKZcTECEmOuBlUSVeqrQ3xaPE0Wy
         NIHxt0kJBh02H9Iye45XeFdnq7i44yhD+TSNjxI8XyIJnw/6OgBKf6qXKbx4xkn9Tj+B
         yrmnrQJiWgBxmEYX2vXcslwDPzsQOwd492vLZWHuHaMp4rm6NhzcXvj1nbz9rPLX7L2S
         lflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=CiBNJp93sKGHpS/lWyCrXljQvB5j5Yd56dPPxFa9iSc=;
        b=m5x2ls8akDGwozSDSW9H8wkuR5AwSnXxQiaVywfNKJuVWohfXMC4xFUJuykwu29FUz
         q4CLqi/sXOeA/rMEB1lBTS2pUbCn/qXPrXkehISPWF2hdoL1l00rB6wRpmllq2NOgrtb
         J+HPkrrrEvuqXgwAH7pYAzl4vudDf4IFDSmUP/FKT7bpoUn976juSGyompBB8Va1LvrW
         o1V2RJGYrbrz9royRFTCR1U8df0gSkFDm4dYrOeANiRu/x84JPZ8g9NFQ4uma8nnhAjL
         9Igyl0rY4BA2WDBQRC3zkjO4PjHNX2ZI1VI4OD9FpjQ/02WiVNPl3UnN/AkC2GZcmst8
         fJSA==
X-Gm-Message-State: ACgBeo2PvZ4XUwobwVJ2NyQTu+3GRZmD73C0VkrclyNgB+Vdmve5Akks
	eyBP379rMk4ivLWz/p3fC6b/MXIc/ChQGQ==
X-Google-Smtp-Source: 
 AA6agR6iLne3cYKwApAuoOmrE9jNi8a2CJqEOY68ZHVBgn7WZ36qt5rHRIiRaAEvYb2DU/72zZ5W3A==
X-Received: by 2002:aa7:8397:0:b0:535:933b:54c with SMTP id
 u23-20020aa78397000000b00535933b054cmr25985966pfm.38.1662968543881;
        Mon, 12 Sep 2022 00:42:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 c3-20020a170903234300b001780a528540sm5243956plh.93.2022.09.12.00.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 00:42:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4] rust: Use libc++ runtime when using clang with llvm
 runtime
Date: Mon, 12 Sep 2022 00:42:21 -0700
Message-Id: <20220912074221.3443597-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 07:42:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170532

meta-clang has options when it comes to C++ runtime, default is to use
gnu runtime, other options are llvm runtime and android runtime. This
patch helps when a distro is using llvm runtime for C/C++ runtime. It
informs the rust build system about right C++ runtime to configure for
when such a setting is used.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebase now that 1.63 is in
v3: Use renamed variable RUNTIME -> TC_CXX_RUNTIME
v4: Remove True from d.getVar

 meta/recipes-devtools/rust/rust.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index a33eb00e25..956301023a 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -110,6 +110,8 @@ python do_configure() {
     # [llvm]
     config.add_section("llvm")
     config.set("llvm", "static-libstdcpp", e(False))
+    if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
+        config.set("llvm", "use-libcxx", e(True))
 
     # [rust]
     config.add_section("rust")
-- 
2.37.3


