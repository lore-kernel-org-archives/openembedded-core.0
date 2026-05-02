Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6253ECD342F
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:36 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9412.1777739489719019607
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HCNhJlKn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-441209fb77eso1567194f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739488; x=1778344288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5rJrD2u5wzvMZYmzrDnhXowPBen21p6AXbFnzhqXxs=;
        b=HCNhJlKnzBYFoKW56NG67K+23bGd9C29qhcQC59ND+UrH8S5OtGmEwPcaxOVQLahe9
         RWCf+C6AAIu2wlwSfs9LCH3+GzMvukm4dvTOFvv1bvsKkDymY/SI1NhShOmzonwlgJFY
         4WSYF0Cz/mrxsr7WEfkp4FKLBdewOc3ncVh/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739488; x=1778344288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K5rJrD2u5wzvMZYmzrDnhXowPBen21p6AXbFnzhqXxs=;
        b=or+UOYszlPbV2GvofuJ29cbw1KI+KnKZ81x1vgla6UFlg0PI+8R/4zkifdy1YrHO7o
         LSmWjbVtKelvfjGvsaqtjWq+/MB3WkTMxvHYkIm2z5qtw96hbkGNDy4SJ9H6fPIwZFrX
         yYnljE4+0yRONUcQadCnWhrhsJ6CVZAOWb4jE3BcOGkLkJe1ecTEqrLaBvNTxZ57AxcW
         GBNEWXKtibT48tx6NlfSKrJ5lOR+O2ZvT/NstdoMQTGz57xHhdKcCaNkXpPp+G7JZBdM
         FybnlN93akvO0t3RMKOZ4QFdrqqTuwc3wdBHWPTvJOrT0MdAurQHTHvxEw7WftMOig3d
         rpbA==
X-Gm-Message-State: AOJu0YwOFclg44Oht64jnkwW5BGwAgHuCTE1B1qMgAPS7W7CUO3SFI3P
	5ENnq10c2GOAMKdZVmgJqBZVXay4c70cg1O5y+wswPkemDF22zJ8nRxfYifKuLn/fnyiCNtWdN+
	jm6/EYWZi7t8FO8+8KLKp7L1D3GrfWTBUOeB9zIbqfxjYZi8KG5hZ0Av4PAWAq+U+eLSTQ0MGtj
	RAfGpMD8L5JMGsLWE=
X-Gm-Gg: AeBDievbueDeUB02AEe6PB0D8Z9pK8Hwhw4cmUw1Z7NBIYUzp2LL8sS8wHZRDcz5Me1
	txgu8q+o5HWVDFkwUhsA7Z0S/GlEv4Wivsu1PhaX8rs+zNnFYAl9AbLyOkHQk3LxS0T/Ux4nb9f
	TTponPiTwBPr8otmm/hu2BhhzzAWEcpNI41m+HV3ss67E4B/WvfroWm7KnkjgMeAS/gZsiISaQi
	ckQ5IQILnuRbs2RfoLRsl/7w5YKdBppxmw0lPsVI7wHGhLV0EJzlt/qsNH85/5irArHcgXcZZlt
	PvdTZDkXcLBZTD/XQ7TCrgQxLauJunPSvSNjN/sFEdyYJHaXITul8JheRti1UYHGP6hsbupnpRL
	s4Rp/G65+6kwiUT85pzOoCdum4+eUTDRCV3k+bWwXWq2AMnPy2cBaW2q75sD/YcjzRKyxeImt5m
	7HxUMfnvHprXDryS9ZvlBut2r86EWQE7imM6tP9oy6nmyGUxPBEy+qGPMWPqmmXOU=
X-Received: by 2002:a05:6000:24ca:b0:449:d1f5:7101 with SMTP id ffacd0b85a97d-44bb51b5755mr5666003f8f.12.1777739487591;
        Sat, 02 May 2026 09:31:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.31.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:31:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 57/62] shaderc: upgrade 2026.1 -> 2026.2
Date: Sat,  2 May 2026 17:29:17 +0100
Message-ID: <20260502162929.1377831-57-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236366

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-cmake-disable-building-external-dependencies.patch | 6 +++---
 ...2-libshaderc_util-fix-glslang-header-file-location.patch | 2 +-
 .../shaderc/{shaderc_2026.1.bb => shaderc_2026.2.bb}        | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2026.1.bb => shaderc_2026.2.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index cb8bbdd28f6..f9731a8eaa9 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From 29f9099f15755ca8a201a4a02dc1370e21ec936a Mon Sep 17 00:00:00 2001
+From adf7927c3fa5055d33c3970be53fdf1a8853b617 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
@@ -53,7 +53,7 @@ index 06f5395..39b8869 100644
  
  function(define_pkg_config_file NAME LIBS)
 diff --git a/utils/update_build_version.py b/utils/update_build_version.py
-index b7ce5b8..95b34c5 100755
+index 7adcefc..3eac466 100755
 --- a/utils/update_build_version.py
 +++ b/utils/update_build_version.py
 @@ -30,6 +30,7 @@ import re
@@ -64,7 +64,7 @@ index b7ce5b8..95b34c5 100755
  
  def mkdir_p(directory):
      """Make the directory, and all its ancestors as required.  Any of the
-@@ -121,25 +122,32 @@ def get_version_string(project, directory):
+@@ -123,25 +124,32 @@ def get_version_string(project, directory):
      directory, which consists of software version string and git description
      string."""
      detailed_version_string_lst = [project]
diff --git a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
index 3f030e5c8b4..d639635766a 100644
--- a/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-libshaderc_util-fix-glslang-header-file-location.patch
@@ -1,4 +1,4 @@
-From 7831df8bb68a8992a07ecc359550879e629e8c79 Mon Sep 17 00:00:00 2001
+From f3915766d382d30c83da6d8077bf183e930a4789 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] libshaderc_util: fix glslang header file location
diff --git a/meta/recipes-graphics/shaderc/shaderc_2026.1.bb b/meta/recipes-graphics/shaderc/shaderc_2026.2.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2026.1.bb
rename to meta/recipes-graphics/shaderc/shaderc_2026.2.bb
index 1d66c2b810a..644db979690 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2026.1.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2026.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "75f8c09ada4a69b086afdd2c03d7a8be06242414"
+SRCREV = "baec0c74d6dca70c52d937e2e5bf6ffcd449e430"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \

