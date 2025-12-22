Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE47E6ADE7
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:57 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87837.1766434132311606406
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HB7vmM+l;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64b921d9e67so5287948a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434131; x=1767038931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vv/s7HLD1JjQ2QPiejBbutPULXXtajmDXUxnR7nj5sw=;
        b=HB7vmM+lAc6HSU1LRE1Lo1cv8p/B1kEjySJsidsmqjIJTOu5N+rh9qLQILT3okLH8W
         +/cIJ0YYeEuPtsuu3TmBrcyzX4i6iLB05TF+oJxDXMbriXX4FWDRfdwyDvguygpIhgrd
         KkLUsCRtllnEo9nbMJPcRDFhse3gnw5+1b9Et/BFv0l5ErzPmDnyV/ce2zomzKyBK/kG
         96Rhq5kGLiZTysKJa3vIsbtMfUvBKgV1ASnGj7tVA/UUZ4EHDM0yx/4Gx1uuTt3WUZKk
         R4k75nd2Qa+4TPBqd1GPqlNuTpnpAbw9ea8daQZtA9E1R647jeC2YTyPh71e6zPf0yj/
         3QHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434131; x=1767038931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vv/s7HLD1JjQ2QPiejBbutPULXXtajmDXUxnR7nj5sw=;
        b=DKgQBl0ue153yAmva8+zKCf7Ds29o0R/cgcTXs21oQsScGuli833LZxn/Fu7C3lMVd
         OwA0vOUrb2WpyDmcDJch5J4SiWLSxJ4efuby7KJ88usWefyw0q/gzQHM40I6QgZtf2JO
         6twjWWrzh8ZHto7AGIwnMTeerJsY9RGfgUciikniPMOlnw6OGFivFl3q+HVzfpHkJhG/
         itaAgfmVRHiotmwjPUwBDbgRPZkJg3WjDIlI6QyQ3YSr8rXNqPMt1n5CggMAs1widpOP
         fUBG//zTGhBKWxKXv58eC796PiDoH73eUHDtZWHksMb5zr4OXLxLI+Nr3lGcWjj5R5ja
         zz3A==
X-Gm-Message-State: AOJu0YykkPp8jSdDfZfCmPZyaJMHx7XU0IjU8AQod6r2oCsrBuVJVUxA
	Y44lgXoSoj/diRV4DW28VjLUwstSlB88XhI3LAT3LkUjoBXz90lIrfORFFasxA==
X-Gm-Gg: AY/fxX4Gxh1Br74iJOPSrPjAlAuZ/s1KsSb41lK6KcgdJtr42GyrFIogUs5578wT3pv
	TL4g6EI3qtYnaL+cnnVoBIc2azh3Xd9vkL3yNZnyr+tFPoIvnfsgyt4gQSsuxpLCnKk7RdqR8Hd
	tWMI1yYXZfUaKFDfidLpt45YdN/Fp275ZAT+UDX77sPd359X8ZDhbkrgoyRPFAWKPfcKy2jzfXV
	L6ZEi7vaXbJ0eMHggwNNKZ/jR3US7q0fR1UA73d/0dIVvu+Mx8/gz5OYvjAR5jCyJf+h7cUs9wT
	LUT1jbjUBLBsGiHRBlVwitKrgic5rAvJIgfP8e8Upd1OUe9jXwPPyehnKdn1PDlurXOv35GmzMB
	BbqevXfQuvoVM6Yt1fIQv90ocforA2HYkAsmt2gkmMGakLbpxd9v9sOaJVb5Ow3BYI7an2KlCGJ
	KaQ2cpB1bfiIrmgsQyGTfsPon48tkHIjWO5ro1cwHKRYw86N4=
X-Google-Smtp-Source: AGHT+IGH+4JhNuHNms7eLOmkVbjT7ub+52XoqayZn3mMgrGkRLQ5p8GvUu3JWNLGFvGLsxGswmFjHw==
X-Received: by 2002:a17:907:97cf:b0:b79:e99d:913d with SMTP id a640c23a62f3a-b8037058bb0mr1198334966b.42.1766434130406;
        Mon, 22 Dec 2025 12:08:50 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 095/114] shaderc: upgrade 2025.3 -> 2025.5
Date: Mon, 22 Dec 2025 21:07:17 +0100
Message-ID: <20251222200739.2278706-95-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228420

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-cmake-disable-building-external-dependencies.patch   | 2 +-
 ...002-libshaderc_util-fix-glslang-header-file-location.patch | 4 ++--
 .../shaderc/{shaderc_2025.3.bb => shaderc_2025.5.bb}          | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2025.3.bb => shaderc_2025.5.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 77b81635b6..cb8bbdd28f 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From 3db09ee0d0bf6390eb3dcd835bd4ef786188bf16 Mon Sep 17 00:00:00 2001
+From 29f9099f15755ca8a201a4a02dc1370e21ec936a Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index 429b53c308..3f030e5c8b 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From 4797642a6394ad7e5a23aaa3bdf8e2d011f69adf Mon Sep 17 00:00:00 2001
+From 7831df8bb68a8992a07ecc359550879e629e8c79 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] libshaderc_util: fix glslang header file location
@@ -11,7 +11,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libshaderc_util/src/compiler.cc b/libshaderc_util/src/compiler.cc
-index 9bf9a43..dc0efd2 100644
+index f2ed3c7..59b262a 100644
 --- a/libshaderc_util/src/compiler.cc
 +++ b/libshaderc_util/src/compiler.cc
 @@ -20,7 +20,7 @@
diff --git a/meta/recipes-graphics/shaderc/shaderc_2025.3.bb b/meta/recipes-graphics/shaderc/shaderc_2025.5.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2025.3.bb
rename to meta/recipes-graphics/shaderc/shaderc_2025.5.bb
index 692e85e56c..9ae5defa5f 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2025.3.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2025.5.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "eb0bc20d0c31320fe834e4ee8eb02807292b9703"
+SRCREV = "bca2fa0bf0242340440d54f8d8e05c5dd2fafcea"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.47.3


