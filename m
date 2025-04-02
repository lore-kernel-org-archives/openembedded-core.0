Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F38C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 14:47:01 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.10476.1743605211083908493
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 07:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CW06WoEy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso607617f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743605209; x=1744210009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=a1pkAoNWELcewglcpsdV3f8n+Oi6+Er3wr4hDVYlk4M=;
        b=CW06WoEy+VCYs9yDIghOwJSiz8pd9yecyo3QgQdFMTOFakUsLlBRMvXsFSSgKAhvW1
         OL3Q6IHWVdK7ItvCTuMjLdE0eykqanMGyG4Un4fbjaC6AHXw+MukJNOjaxGe67ztYb79
         MUQYYrN5E09oYrHQn7I8LnI8H743HKeCYPHZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743605209; x=1744210009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a1pkAoNWELcewglcpsdV3f8n+Oi6+Er3wr4hDVYlk4M=;
        b=iaaIqVwWbdTOr8hYqjptlPTFonGdxBemtC2Yn0URmPxjABkBlHYObh2cQmWKQDrNgV
         GiYWHgUUf+xxUQOgbKYgr8RRRsbLvl9OaN8iGW1Gwyo0srT90cxKx5xGlhu8meeEt51O
         uHsqHqCJV/JR1WsFhZyv86RgR/5IfDr8kmSoNt6Tdv3BFsUqLG9zlZujimmDe6lCRXe8
         fNWodw3HSCPuCudcnfrYsd5nJEm85WWcshG2Dzrrln1G2lixsjaLPvTKpR60A5V+/lRd
         peoqzDZp+sov8dwCnDUbSfuby0F/rUw8+MEboBA1dKjaKeyp6lbnlPBHGf/a2zhGeiAl
         Cgjg==
X-Gm-Message-State: AOJu0YzMlf3HxmkGjanBqn0U0tHIb7zyu1dq6APv8drObV0Rfd4pAOWk
	FAKAFp25pdyYlX6PdlDIS+jPvNSATPZXexKvVhpZM7zNMiSGvOSKcbZI79QQ32al6QPPzyFKcdk
	e
X-Gm-Gg: ASbGncsXxwEawc5omw4GNDNISR3K+5dyJk+GW9I45Vv1xlFx5lGJYz7HAhZruZQffEl
	2lUe7cmE2/E6ccYd438FCVs5XMzF18cv//TgfcOZwppxvFRCgz+W69j+KMM3FEdHI5hS+8Vupv+
	pAcqgToLBGhAyS9jEYV2wEjh5W0TdLSUSXxOxUESsWsxmVdtA4jVb9YEExVJudB7za5OcmY8mBS
	GfJyms9Rf7Nz6izCLXEHvieM5xMuqU/14+7JmLDyiN7fmiSOmXEt5TihqGxF5H2iI8JVjgX/OIe
	N28Jue9738WRA/VVNns536DWaYwW62lFsujT9kv7YMT/eAlhnriXDabi6quq57PDbadyqMZmP5H
	W3Ub1WUDi
X-Google-Smtp-Source: AGHT+IFffwNyGphxm0d+g2ZDR42isagYEDDRSS3Yhf8OVbYR7z4OZ7dPLuXfjzb1wjzxoD6Gu0wORw==
X-Received: by 2002:a05:6000:1acf:b0:390:ec6e:43ea with SMTP id ffacd0b85a97d-39c2a35c64fmr2346861f8f.15.1743605208955;
        Wed, 02 Apr 2025 07:46:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fcf42asm22924755e9.15.2025.04.02.07.46.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:46:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rust-llvm: Disable libedit
Date: Wed,  2 Apr 2025 15:46:47 +0100
Message-ID: <20250402144647.2416009-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 14:47:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214267

This option currently floats and is leading to non-deterministic builds. It
is used for commandline option tab completion which we don't need in our
builds in general, let alone internally within rust's llvm.

This should fix autobuilder deterministic build issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/rust-llvm_1.85.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb b/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
index 566348c617d..12d7b2f1817 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
@@ -42,6 +42,7 @@ EXTRA_OECMAKE = " \
     -DLLVM_ENABLE_ZSTD=OFF \
     -DLLVM_ENABLE_LIBXML2=OFF \
     -DLLVM_ENABLE_FFI=OFF \
+    -DLLVM_ENABLE_LIBEDIT=OFF \
     -DLLVM_INSTALL_UTILS=ON \
     -DLLVM_BUILD_EXAMPLES=OFF \
     -DLLVM_BUILD_LLVM_DYLIB=ON \

