Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4607AC369CB
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 02:32:45 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.20266.1745721155854914006
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 19:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mlg/Hm2v;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-73bb647eb23so3043943b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 19:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745721155; x=1746325955; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jNsTmaqrOiO7ntuTWHcjJRGivyOiHBAs9leYFSPJb50=;
        b=Mlg/Hm2vD+9s5+yCdC6rsQJZe/oFTSkY2r58lTjUssrPOxg1bOcOjzrvbW9NPO/WR5
         nZBcgFK58ZGH7dDy+gkkx7NYhrr/ywjLxWGD+hLr83f6c9GgiEiXtDpC8C/HjXHJ4iqG
         3UeXY6Z7Hfa6uMU5K5JK2AKcsPKwuaN8FpwiDxp+SYBmMn5nkbutiw34/4O2DyMrTaLB
         6uFe8U0n2Fx9RidSIKbH0LfChrU0/PzuHVlu/E/AppEDRpsfiacY6C1KftjXsxf3TWNw
         vxEYsXY5TtuxlxyjA4y5atdalY+ndxY1yFuJMR2v2f3F3U4PEvH75zHnGoXCA04EghwF
         4Lyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745721155; x=1746325955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jNsTmaqrOiO7ntuTWHcjJRGivyOiHBAs9leYFSPJb50=;
        b=Acfa7p4XhjCv84TPSsF3wTCgAT3ZrR3VZN5R5Wb2xd4SXHHCj16ZJBPr1Lp9c+NkOz
         senk9QGJAwti1ZnblnBo82MDcshtywLu1j0XdOZZOP19jwE1gWpDlaFiTgBsdiLZiVUD
         G35R3TdoAHUHashGsJrAeGnTaOscHc6t6zYk2Q/z55FBXpMdYxyW5ooK1dSjdzbDUIKz
         TO/J3Fk4Ij6sXpJC8wTfYoMzVKcr1P06Ujls+7YyhNMQNuHgH60dWJpVk9OIB8zgxgHf
         Dl3kIWPhh/xYEkdlWz/hHWBkivy95CU5QxNS03CZz3PEOgTvKG2ouoN6AjRqK7vr8DLA
         FVjA==
X-Gm-Message-State: AOJu0Yy8PQvGQtc2fkBsqkD1S1JIQvAZuZCuLoqas8Vl5xEILdjAyFAt
	NZ6eY68HHMkTfvOft7UP4+QfIgp5WSgeExA99pRNPeJIuC33omlETMFCoRIu
X-Gm-Gg: ASbGncvInWX539yeP+KoZd1dRbZc5LqtWYvcrCk4DrCBMsxh1GRdyBaGOijalLZ6YOj
	sqyhDLs5GmnER53qokVFXloKM04gvfbRTchnhILlwE1RH/dSJo3Bi7FEDJ2Iqu2Z+30UCBRjaZM
	lHdzeOUYjlKBUDVDsqGYM0K5i51/h72FMsGPgwnBM40jPfXChqTHkrxyZTNsSXs+VC5xPWNFLMc
	ZWNfxwEF29YMb2nEz1uL3JUK32NtH2widljOfJcpkSIOerk/EKj7T4x63OHcAWmYqFAYbp6jy8D
	+3rFtvvxpS+tumlAq6BeXqtY9y6Llulk
X-Google-Smtp-Source: AGHT+IF5Kl7y0qskmyxD/E6MzFPivtAfOADnxfIoHkCC8U8Dj//ToZD5DqKs4hrMDzbi+UgD2aQuKQ==
X-Received: by 2002:aa7:88d2:0:b0:736:ab1e:b1ab with SMTP id d2e1a72fcca58-73ff70ccfc2mr6464324b3a.0.1745721154843;
        Sat, 26 Apr 2025 19:32:34 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2593f4fbsm5508214b3a.45.2025.04.26.19.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 19:32:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] harfbuzz: Upgrade to 11.1.0 release
Date: Sat, 26 Apr 2025 19:32:32 -0700
Message-ID: <20250427023232.2771349-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 02:32:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215530

Changes are:

Include bidi mirroring variants of the requested codepoints when subsetting. The new HB_SUBSET_FLAGS_NO_BIDI_CLOSURE can be used to disable this behaviour.
Various bug fixes.
Various build fixes and improvements.
Various test suite improvements.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../harfbuzz/{harfbuzz_11.0.1.bb => harfbuzz_11.1.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_11.0.1.bb => harfbuzz_11.1.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb
index 8945467a001..645e1e42163 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.0.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4a7890090538136db64742073af4b4d776ab8b50e6855676a8165eb8b7f60b7a"
+SRC_URI[sha256sum] = "477f0d48c34dc32093b45304178eb9733361ca1832b5159879c99e6d40227969"
 
 DEPENDS += "glib-2.0-native"
 

