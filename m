Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7788C54FB3
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 03:52:56 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.41005.1747972370183992940
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 20:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z5zKGc41;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-231f325366eso66847405ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 20:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747972369; x=1748577169; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3S0hVcJqgxQcQXH8n05uMBDd8Isak1hFj99Zo5BbXa0=;
        b=Z5zKGc41xFZ3cX1PSL1LSr2qDpTZkDLE5wHem6il8gerWW/LqXQ2xbkH2GVNMWilnG
         aQdqs8fOpny8O4Q2XQ/aGvT+XEopoFvx7qjN4oRkPB8DBgu3ZFLMh5RuDjoso7WL73zg
         zJrPP2H9e8lYlfdR1zkJyhuTZGo93WwncrXFlLzeQ1yVm1V6LTkGUUGL9y5rSo2jojEf
         rpjxY5hezdC9F4luOOjce/S3zkDAa6rxhCFahr/IswhfPkZqVaZQfFklcrmxbL9oMJdz
         XmjRSZrNoJYHu7UtPALXuw9R5vpcWKp8oOohUWNEKs21c+sCqynWNsoIiurWY0SKfBxJ
         WjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747972369; x=1748577169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3S0hVcJqgxQcQXH8n05uMBDd8Isak1hFj99Zo5BbXa0=;
        b=Y85a9IA5YogC6dKp6826K+ZZ3e0QT7BJceT6p/moG23DvKkQPPxatBhew2YELtkCfI
         OYS1NdE0Y6GJdoYUJTE9cGvBX16Fz50R8iL5zCr8K49yodb2sk4x+6RfhMMOkS3m2t9C
         pmjsW0hy34LrsnZ7Veqf82oyFmamGW/dEs6YZO4H+e0qDfXHyzZSWF4uMWR1L3Lbv6j9
         sRi0ZsHnoD/E3ETdgsY4KLs2hf00I0GLbtAcsEP80NGznk9mljBEjLzwPY++4vlMQ2Ec
         5xNRnm5T/kGCTa6u3IjRF1C8qI7zDoQUYrcgpAQ8Z9315Am1t16xCqfmA+vFGrizvfLE
         7/5g==
X-Gm-Message-State: AOJu0YzmIGZkNPqEKlCVyvdP6tNIduq6bdOK/hak0kWyPgkDHtWuONV8
	icrx3ovKjLkOt61onFrRCyOji/11D29Kf+9bIg05cce5HaCwi8p94E6Z
X-Gm-Gg: ASbGncsb44DLlnArXznygcUwnvd94j+rLXht9jApcy0Cp1T1sfhuefHSwCsnA0bP4zv
	0qC9pVakT5YHiQGoXfxtiI/ZMVwSDwQ1qyDOWOyFn3bLnCEhAhr/K1wHgS4SEESeQ6GOB9mLEBK
	uHpeLdE0BlfWnlLOc/Ypc9qCMSh7JYINnOrU20Z4vRZ7QSvZx3XFgbBeezl7z4PzgXYGf8wu3+e
	Oqwb2bjIRenl4dBv0l5dDJs1Z03aUaeH7OMsn9RgBfX1Xp6OKd/WzzEtoLOWORXQxltSlp4HfUe
	6YiTXYSaTfl67tQ/80s/MYMVHN/xey7Bd7lbg3IPjNQ=
X-Google-Smtp-Source: AGHT+IGc2ON4hgXPajxB1cgyY+yMzuGB4EVbWkvy7uwrsgps1dqy0b9y93+M5BfuUVqNMnsnKt41pA==
X-Received: by 2002:a17:902:dad0:b0:231:bfbc:3081 with SMTP id d9443c01a7336-231d45a9e30mr397823495ad.44.1747972369615;
        Thu, 22 May 2025 20:52:49 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231ecd5ea41sm107181155ad.228.2025.05.22.20.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 20:52:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 20:52:41 -0700
Subject: [PATCH v3 07/13] pixman: Fix build with mips/clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-clang-toolchain-v3-7-16cfc6d9891b@gmail.com>
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
In-Reply-To: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 03:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217167

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
index c1c71fd42023fbd8c82d49ff623a981139f5ac7e..0c779ac3b4e6d035d9105c98aea0560a71d57ba3 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
@@ -6,6 +6,7 @@ including trapezoids, triangles, and rectangles."
 HOMEPAGE = "http://www.pixman.org"
 SECTION = "x11/libs"
 DEPENDS = "zlib"
+DEPENDS:append:toolchain-clang:mipsarch = " openmp"
 
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz"
 SRC_URI[sha256sum] = "02d9ff7b8458ef61731c3d355f854bbf461fd0a4d3563c51f1c1c7b00638050d"
@@ -38,6 +39,8 @@ EXTRA_OEMESON:append:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon","","
 
 EXTRA_OEMESON:append:class-native = " -Dopenmp=disabled"
 
+CFLAGS:append:toolchain-clang:mipsarch = " -fno-integrated-as"
+
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2023-37769] = "not-applicable-config: stress-test is an uninstalled test"

-- 
2.49.0


