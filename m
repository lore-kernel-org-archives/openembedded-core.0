Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD57C36014
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:12:18 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.2184.1743577935488222524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hibeOQpp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso63496105e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577933; x=1744182733; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cL22NygJUmtrArhscHE7mtrkJPKeVdmROwKQ0iSH3Zk=;
        b=hibeOQppkduPtbkwLQ0FSSkUZiJOshk3X6DL7xgYy8recxQS99DmfGW6GLXidVJol7
         oM8sS+GDS9CkhC11JDAxqcr5jcbaIlPt2tctwe1cmUK0jo8vlswB6DQpZpZCGJYw4iuS
         V4jO/YxHwMlXeErfCGQtb8Rr4R/cbRAO1DxUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577933; x=1744182733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cL22NygJUmtrArhscHE7mtrkJPKeVdmROwKQ0iSH3Zk=;
        b=kjAs0rnPku7rVgu/ao0LkA7vhqwWpDA4jIwYxb4KlGPy01a7FrllIr6MrKqQISbbOv
         jezXe0Zj0i2Zy2xTOsdQAe+Mzw00WkvSJFh7X34ksd9dt5SjKfb9lPAavg+iQGtHhGYS
         yQlMgUHtWClqNvz7kc2tsqb7kymMTLPJk7mfoJwfPnx4R0m3um9Au00mPNkNspzEZwmK
         GOac/bCETcTViSGxsoewluky2OrS6pkkDZuJVnfE5eamy58sW6w6tCM2+kmGNATnR4Jb
         S2BP/1R2Czc7wQCSOTAyb9zE6FOruDS5mXcAJGEycgPMJ+QcJRPFKrYJw7qKCWElqZDE
         Qr2w==
X-Gm-Message-State: AOJu0Yz4LHdDl5rTxCn6+0qOgpYqablHkoTp+GYVepTSBDY4jNTzkS8F
	PrwCRDbydfcYnPNBPekvoAhLUYwLAvAnpATWTQvpW5Bcnola9vEbrw2vFFmfRnC6taSQ9OC+4tC
	i
X-Gm-Gg: ASbGnctS6QF6doF74mRICuBmdqekDyrGmpbbASAsZcMIvG4THKq9eLkRIB9JBpJatvs
	wzl0Xk73QEA9CYT+J9hZxwaJh+yjRtQa+WCBiH7hKS0io1Jwrp4+aOpwfZx5eRqmT8gh8Cpyj9i
	y3S5vy15mXbfyUIjuYVVSbZqAUKHsbUzgkroYQQ/KWuSZV6P+4bTs5BCzj4gztbT4rM0HvI6eyo
	LZVNa5nk3NXsDTpfjiBCTd/xv9k85bgQ9T6Qmp6PVIH4l8zESOQty+GAZWFIbzN/UzBIlBR1kIz
	rL6iGKm6wQiNafAxHBIKkv4fnth88zQLqDkUZ8Rz6z8guP1VcfdQcmyFgSH45B17uUX8x42aVQ=
	=
X-Google-Smtp-Source: AGHT+IGOKGF5vITsc0F8kj01wHdOZUjkoEiH+2eNmFPzRpY1jDSMIx8iUZFNKeQM7/P9kqHo0nfJuw==
X-Received: by 2002:a05:600c:4fd1:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-43db8527142mr159001935e9.31.1743577933320;
        Wed, 02 Apr 2025 00:12:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.12.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:12:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 45/48] shaderc: upgrade 2024.3 -> 2025.1
Date: Wed,  2 Apr 2025 08:10:14 +0100
Message-ID: <20250402071017.2157620-45-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214218

Add tag to SRC_URI to verify SRCREV.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-cmake-disable-building-external-dependencies.patch   | 4 ++--
 ...002-libshaderc_util-fix-glslang-header-file-location.patch | 4 ++--
 .../shaderc/{shaderc_2024.3.bb => shaderc_2025.1.bb}          | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2024.3.bb => shaderc_2025.1.bb} (93%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 5c49aa7fd5a..07765653bbc 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From 941f5f5831e7a52c26168f81f25d0470860ca6f1 Mon Sep 17 00:00:00 2001
+From ed0e2fad08a3cd3f0a0c70922737d8a6886f484d Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
@@ -15,7 +15,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  2 files changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ffcb54b..cce715e 100644
+index bd6b890..f1ddd74 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -62,6 +62,7 @@ else()
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index 39f982b7f3d..429b53c308c 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From ec2442940e1d5338971861bb81537bae3a6c19e2 Mon Sep 17 00:00:00 2001
+From 4797642a6394ad7e5a23aaa3bdf8e2d011f69adf Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] libshaderc_util: fix glslang header file location
@@ -11,7 +11,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libshaderc_util/src/compiler.cc b/libshaderc_util/src/compiler.cc
-index e5f5d10..5fd6d3c 100644
+index 9bf9a43..dc0efd2 100644
 --- a/libshaderc_util/src/compiler.cc
 +++ b/libshaderc_util/src/compiler.cc
 @@ -20,7 +20,7 @@
diff --git a/meta/recipes-graphics/shaderc/shaderc_2024.3.bb b/meta/recipes-graphics/shaderc/shaderc_2025.1.bb
similarity index 93%
rename from meta/recipes-graphics/shaderc/shaderc_2024.3.bb
rename to meta/recipes-graphics/shaderc/shaderc_2025.1.bb
index 0948ba28d6a..e9c0ecdd373 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2024.3.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2025.1.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "7223dc3d5e34bbcc44f3150546dbfa8a5da58c4c"
-SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
+SRCREV = "7f68b1cf6f35f518febf36d425365bb8e6ad224a"
+SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
            "

