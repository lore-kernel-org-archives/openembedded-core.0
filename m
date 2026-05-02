Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89CFCD3423
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:30 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9493.1777739429794431537
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ChUJFBpc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so1498351f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739428; x=1778344228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7yTlG7hqCVk5nwAU21Hlj15pRpteB5M+qJVzUCw4Kk=;
        b=ChUJFBpc7vMxufEbcC2bRCffP2szZyRQhP6qbyMnqSeOnuSqKD6iur0yukeiWGkeLC
         TgR6zOIroBkMwzaztHX76/T4Bf9/YdwD+x3j/ku7WvVOowmepvTwcNCneB2U/+4mSkyk
         bKY3/Jp8xmVG+wQnn41dNMljqnEs+KOdl+YSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739428; x=1778344228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z7yTlG7hqCVk5nwAU21Hlj15pRpteB5M+qJVzUCw4Kk=;
        b=qacv5xWc1505e2z9SGDfWgYBRDibL0u0mY/l+MuxyobAh9GDy+WlI79gik90lVT6nY
         eJknJ6NuHAhdaobs3V/VA47vof4X8TA4z85ntHNQGiWtkZHebZqQSFDq9hz1YDJJFi0u
         nE8w4eoTnmsIcqbETEHv2RDFxzYGLirvGC5NajuRQOi+3m8/+Bena6DcWu4/sBmhuwZ7
         vJcEZAj1iXnynNANnX/FVl6i+ZSAvVLg16t2Do0JT8JdphUmhEThXlUqjO+evY/Dtnbw
         M8eiahkxIx4k0KX2wcxV+f+VPo2XRPEOjXk8E+X8xOiUludWCnvoS26EXHcSAalTxu2G
         FenQ==
X-Gm-Message-State: AOJu0YwtxrUyWdvgtCT92RBN3hmOrfr9M7EL+qoxcaepNaSUgNuYMfAY
	+1lQFhV4zVx/CXeqHvU3/BcHMZKgjoPwEyjuOIqvua9KEbnp2n0Xs7Kp2PqNpbH2KI6y3gpRMLB
	4MCOcuWd1Uq6KFnz/5VqIVBlIGfMjR+7UEFCgCnA/9lqdhLlTuxFByaMbUNQrTFslvj3LbH4jM9
	Natwjt/vbat7GCUiA=
X-Gm-Gg: AeBDietbq8xy45nvqT+JSd1Er9jH9/RL1r3F7J4jK0/Cq99P2wlpyHhHmgJsjXQpcef
	rnpqIH5BcsiyN7mYmKorrALsHdBJnWr1zECL5Dd4Ra1EJf4gtwkRifu22Q6eYVOF1oX3YTmH6ne
	LBbPoCv4C+P9futJeAjUnLLWge0OioWYgpTz07Lawi059Y6JOXIH2OztH5HsbLc9XsJMh6lRuqX
	HXV4/Cr74hY8BXDG7KxkZMhd6qik5h4XxWs5OF3s/Dcp2C6i9AERM8IXDp6/Av6VHdEnHnZWcfF
	/THtivhZBM7nMKNnOQR8hb5hr61q6sgplkWezuzgykraboATJdkVeji7Fbt4yU2kDkankSsCtRH
	vC4iDCC83nMtIjmkbnsExryqHy2NtbjWHLVSoXFuBwTJm9y4bP2YqUQWnvptbGirkOvdKaoC+QP
	1XOvYG7nGAuCZT1ES0zsHXQ50L3e6ltxQ4Jqwj9bEsCwtgZJ0x7oZwsHJmC1ScyVY=
X-Received: by 2002:a05:6000:2311:b0:43c:fa96:d939 with SMTP id ffacd0b85a97d-44bb5495b6bmr5738135f8f.22.1777739427600;
        Sat, 02 May 2026 09:30:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 29/62] nghttp2: upgrade 1.68.1 -> 1.69.0
Date: Sat,  2 May 2026 17:28:49 +0100
Message-ID: <20260502162929.1377831-29-richard.purdie@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236338

Drop patch included upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...xt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch | 26 -------------------
 .../{nghttp2_1.68.1.bb => nghttp2_1.69.0.bb}  |  7 ++---
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch
 rename meta/recipes-support/nghttp2/{nghttp2_1.68.1.bb => nghttp2_1.69.0.bb} (62%)

diff --git a/meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch b/meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch
deleted file mode 100644
index 32adb05e073..00000000000
--- a/meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From eb5812d018eb96284aa6ef82569d0b6b75bcd020 Mon Sep 17 00:00:00 2001
-From: Ankur Tyagi <ankur.tyagi85@gmail.com>
-Date: Sun, 9 Nov 2025 12:45:25 +1300
-Subject: [PATCH] lib/CMakeLists.txt: Fix NGHTTP2_CONFIG_INSTALL_DIR path
-
-Remove hard coded path to fix installation on 64-bit arch.
-
-Upstream-Status: Submitted [https://github.com/nghttp2/nghttp2/pull/2551]
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- lib/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
-index 98e3dbe7..3b6a4400 100644
---- a/lib/CMakeLists.txt
-+++ b/lib/CMakeLists.txt
-@@ -51,7 +51,7 @@ set(NGHTTP2_GENERATED_DIR "${CMAKE_CURRENT_BINARY_DIR}/generated")
- set(NGHTTP2_VERSION_CONFIG "${NGHTTP2_GENERATED_DIR}/${PROJECT_NAME}ConfigVersion.cmake")
- set(NGHTTP2_PROJECT_CONFIG "${NGHTTP2_GENERATED_DIR}/${PROJECT_NAME}Config.cmake")
- set(NGHTTP2_TARGETS_EXPORT_NAME "${PROJECT_NAME}Targets")
--set(NGHTTP2_CONFIG_INSTALL_DIR "lib/cmake/${PROJECT_NAME}")
-+set(NGHTTP2_CONFIG_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")
- set(NGHTTP2_NAMESPACE "${PROJECT_NAME}::")
- set(NGHTTP2_VERSION ${PROJECT_VERSION})
- 
diff --git a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb b/meta/recipes-support/nghttp2/nghttp2_1.69.0.bb
similarity index 62%
rename from meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.69.0.bb
index 71d5eef8d6b..8f3e1e4a97b 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.69.0.bb
@@ -4,12 +4,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
-SRC_URI = "\
-    ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
-    file://0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch \
-"
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "6abd7ab0a7f1580d5914457cb3c85eb80455657ee5119206edbd7f848c14f0b2"
+SRC_URI[sha256sum] = "1fb324b6ec2c56f6bde0658f4139ffd8209fa9e77ce98fd7a5f63af8d0e508ad"
 
 inherit cmake manpages python3native github-releases
 

