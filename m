Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072A9C369DC
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 21:26:32 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.60668.1745875588646523232
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 14:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=abZgJkp7;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-224341bbc1dso57192705ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 14:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745875588; x=1746480388; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfG9KvC0Yi0ZfpFQDCzV+4Qiz1nxJ1wMHdo1gjxCHNc=;
        b=abZgJkp7eVaNNFVIcLLSnBxAsynQSCBC0gpXSoFWZOrLfU7uAFtcbVRuzdSzRToV8q
         VWptaXsovgprmvDBQM8DVpGd5r52lqe4gcW2S3wZUyoTYWG1I+KushCYuwtEop1d2p0F
         wT+S5Ed8cfmzj5RJpxqYqV7CpN/p6TFyFfUph9s3zTziyMvo+nwHQaSJdXQiQ7E7PT51
         Sc3K4d37lcO31GMfMBG/c3H9aYT0gi0A+Rs+dLvX99hDROS5bjGIm0wQS5o3eSZgfmVz
         uMWHZvyILLPHz+aYpoOsGR7VSv8pgbBsVB3XW63Nqkaysswb5lNlnR3leyOuo60eOBC4
         xPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745875588; x=1746480388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfG9KvC0Yi0ZfpFQDCzV+4Qiz1nxJ1wMHdo1gjxCHNc=;
        b=RudOYRraXBkZSYI7R1cQLHLCh7L+HqvJd626Ctj8t4efyKANnON4tJs9vufhlzs+9Y
         /HCr4NxeDpw6rEHO1zgqVrlmA3kiWnoBi3VBUAwisVPv1HOlBZcF/oXg5cfAndj7PwTn
         Sffd9V94/vB8opC7/NcK7FU3jC+H8FgM1FWKMtooIohkGiXd4+7fSN22WcW5Qisg0uqG
         eJLF9aJA7HBxubVFmDfZ0+iJFlFRuqaCgk889cklwtHxa65tgjKZ75b0J9/R2yaUKEJw
         syAmWv9qgr1l+WaltAtV5RUJ4C2eesXggXGt5Ms97RSUtHka4c1KavJF0I5buk/qZ17p
         VwZQ==
X-Gm-Message-State: AOJu0Yxs3+a/79W3tRGBfP/KumG5hVJG5LJqjL1/f1T0ak/DXB9QoYkW
	1Cs/Ss93q3MhLSfjJY0JTp4ww5mIJ5HfiEfLYzTwxAt2Yzfh1Pa8
X-Gm-Gg: ASbGncsXZFWqrh5UIDOOAdGa1UwSozg7goKGydknB8oGPataii9UVuiYrk5kv4BaZAw
	cyTggMpwLlosrEUYPpp+Uxy2cKCozaijIDgDm08PL8yyl00xsjxlaUXMoayIqHPlpnA482IlEfm
	7ZPsDjbp7xh7Rqar5RtE/UX+mDOT+OXDsNtQw6gcEkwdYZkGFu7fDyREdP5DNX9Q1R5YbzZVzbC
	3uN31uNe+ms67Zo0P60GlpposmYxBdjp7LFBsHqQelYRgknPhHX/fmZjUDkrwT8XsFr4XB3XOcP
	2FXBsZMg5RVgx//y5e6DhvQKB5ZdFFXQ
X-Google-Smtp-Source: AGHT+IE1K/i43FdDw7FKPPU8/d41rMsk5WDCciBnDQM3PsMrxldOkmjDl6OiuHpmn0AYp1L3f7bIrw==
X-Received: by 2002:a17:903:3c47:b0:220:c4e8:3b9f with SMTP id d9443c01a7336-22de6f52052mr9435305ad.0.1745875588031;
        Mon, 28 Apr 2025 14:26:28 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::2f75])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76f61sm87924995ad.3.2025.04.28.14.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 14:26:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Apr 2025 14:26:23 -0700
Subject: [PATCH v5 08/10] mesa: Pass needed clang flags via
 BINDGEN_EXTRA_CLANG_ARGS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-clang-merge-v5-8-c31e76e643e1@gmail.com>
References: <20250428-clang-merge-v5-0-c31e76e643e1@gmail.com>
In-Reply-To: <20250428-clang-merge-v5-0-c31e76e643e1@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 21:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215642

This is needed for clang to find the c++ headers when invoked via
bindgen

Fixes
| /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' file not found
| Unable to generate bindings: clang diagnosed error: /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' file not found
|

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index cd0f02c6d7b7c8de37bdb1695abc70d95f99a919..c477b774628eb49dacae8b64244d3e98bfcc2588 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -266,6 +266,10 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              mesa-vdpau-drivers mesa-tools \
             "
 
+do_compile:prepend:class-target() {
+    export BINDGEN_EXTRA_CLANG_ARGS="${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}"
+}
+
 do_install:append () {
     # libwayland-egl has been moved to wayland 1.15+
     rm -f ${D}${libdir}/libwayland-egl*

-- 
2.49.0


