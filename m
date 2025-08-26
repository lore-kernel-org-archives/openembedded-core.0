Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D50CA0FED
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 20:55:29 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.76535.1756241725876079896
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 13:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jwcNwHIj;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso5360650b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756241725; x=1756846525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MqDdFBhEsSV0mHc+Tb47uzH+qaV18ka6zOlqNZrgO6k=;
        b=jwcNwHIjEW4Vkpq+Kx7zrwympTGAP3riPSsru2FY7ZGxvSCq/TW9NsehM1u2B3Rda8
         jkeCr5fFx3VKcdu6lpBtYr21BYt/jytHH7PL+vJAoSVkMKtVA6o7uoQOADn9Xhc9nSj5
         wOXE2h5P1IXVA4Uxl5bv8HixnlR2n/QQ9SWv79/Yegrqi+xqPJ8RoNvEfkaEDI772dDA
         Cv4MRUXxhVnbAYIhS4DYmGUwtOXWpyI6iM41YhoPATk+mZsCO5mXsS+LYTOrde/NME7K
         FKTbwNDH7CtzenraBDtlSrb0fVv1IeXTAy2/sZFMFvVhncblvG+kVHrieh2iZLrGVtJc
         lLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756241725; x=1756846525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqDdFBhEsSV0mHc+Tb47uzH+qaV18ka6zOlqNZrgO6k=;
        b=YCIoog6H9vXyWaSaYCPBMP0r18Mck38rY+/NkDuJieIDuk3uHM3RnaSooRnf8/rtml
         KW1SqaImjAtKIztUj55jwnTcWRXmzckJvl66Xr9hqEIY11o/lb6Wc9H+KIMEuFZpoB2q
         m33ro3G46XlwEt/ocjECgpJ/UpRjMzV9OqKakF7J/J6KRXPa1UrYaMzaAoj9AFxYbMg1
         8/bFDkTX63a6RSE3G7itluN4ziS5IYrZs8c3fK55h/vZM8k0xeD0Ue99hKXV1BTXCJOq
         KBF8drxv4V7E6WP2Uejzj/xVH4kd+kOlWDcCDMSDP5Wl0MwoxdFgKQ1uWZjMvrxwIJTy
         BrVw==
X-Gm-Message-State: AOJu0Yy0OaTvtjplCuQPh7pNyVbtV+DWj+nVePunLum1OB7V9bZXcMXe
	FzIQ28bS0ldGLE5HujEpgtr5g4An+OM4o5kosJRsz1mHlUVE/1ejQL4Rb9tcweND
X-Gm-Gg: ASbGnctDgtaxWUrje3zFWwbqQZk1YRfrivzav9/U5KCP0a6xacKiUoqzn/Lo4titVc3
	FELtvroXEeOOSqt8cKzRBFB1lL0tlTWKcoKJQtQN+wbBrpumwgElhRsfEmWiQH3ACB6/7ZGMzOd
	Z46ZsES24HKuidZ4x0fHy9mtpu8D3imAB60FcdR401URaPLZdNvuzphjMkTXfsiOuebZ/nlGMHP
	TIi+FH+4dN/+j9fJm/KYDjYHE03FHc1V2B8dCDTadlp/OOcNIDsAXNS5apfe+0EkSS4XCO8lKCp
	0fMn1/HQM4CJBl7CGp7awWqcjpkYD1Olq1HfFOIyPOTBaT56v3PKJZhvxVKuk3tVzLBNUqOYLQf
	dnGArISh0i6Se891hqSzB6MkxMVYRf13oX1Hsq5AGQ1AuFFfVveNwlCainwO+7CdK1xMhkVPCtN
	+Wka9mC/qBDZCCXiOd442ufS23bG+FNrE1qR7SD8wI
X-Google-Smtp-Source: AGHT+IGzAI1e+A90Em5t0LcVIRh1Y2ZacdGbEpKgtnHYF3Cx3wQSN5sHL9VGzyesnShkCFh+b5lfgA==
X-Received: by 2002:a05:6a21:6d87:b0:243:95c4:e681 with SMTP id adf61e73a8af0-24395c4e771mr2820769637.2.1756241724871;
        Tue, 26 Aug 2025 13:55:24 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4b77dc7614sm6257137a12.8.2025.08.26.13.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 13:55:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] sdk: Remove go from SDK_TOOLCHAIN_LANGS for rv32
Date: Tue, 26 Aug 2025 13:55:22 -0700
Message-ID: <20250826205522.762884-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 20:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222478

RISCV32 port of go compiler does not yet exist remove it from list
Fixes SDK builds for qemuriscv32 and other rv32 machines

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass            | 1 +
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 948e6334ee0..12137cea394 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -64,6 +64,7 @@ SDK_TOOLCHAIN_LANGS:remove:sdkmingw32 = "rust"
 SDK_TOOLCHAIN_LANGS:remove:mipsarchn32 = "rust"
 # go will not build for x86-x32 or mingw
 SDK_TOOLCHAIN_LANGS:remove:linux-gnux32 = "go"
+SDK_TOOLCHAIN_LANGS:remove:riscv32 = "go"
 SDK_TOOLCHAIN_LANGS:remove:sdkmingw32 = "go"
 
 TOOLCHAIN_HOST_TASK ?= " \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 84e1a41d9a0..3a412597697 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -14,6 +14,7 @@ TARGET_TOOLCHAIN_LANGS ??= "${SDK_TOOLCHAIN_LANGS}"
 TARGET_TOOLCHAIN_LANGS:remove:sdkmingw32 = "rust"
 # libstd-rs doesn't build for mips n32 with compiler constraint errors
 TARGET_TOOLCHAIN_LANGS:remove:mipsarchn32 = "rust"
+TARGET_TOOLCHAIN_LANGS:remove:riscv32 = "go"
 
 RDEPENDS:packagegroup-core-sdk = "\
     packagegroup-core-buildessential \

