Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5773DCA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 18:21:41 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.4613.1756405297385229480
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 11:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C9xCktVY;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad4f0so1883181a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 11:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756405296; x=1757010096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IGmPCjP5t/KTnJMaCuQKYj7cEFFJ7NrQoAY2WYdU7ls=;
        b=C9xCktVYIMlMp23GT4WQJ0SA5lhJItUL3fk8W+iV7Q2PblqQKLHz7RYhs9P28U6UKr
         jD9/RuErIIf6g0btAMPqqa9Xx3WGtEaCGPx9xx9eD0Xd2ZEqgZsNLfVHZKFrevDLo0ho
         eWMozFSfJkRxRLaF4O0ujlWN+2d52GlRw74dD0KLkUrsJdivvSj18BeJRgFE5yeX8Myq
         gOsu6GwNVSyiWhfnrO6dwBGwY6rPkc+s3zttAh8zjCXwql0+lcy9RNn/55uMCxoaszCg
         f94UQiUbAnMt3RIua/PembMrI+OcihqACjioWyrl4Urfkl+GpxlvuIiNAJUHbV2fYhKT
         r59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756405296; x=1757010096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IGmPCjP5t/KTnJMaCuQKYj7cEFFJ7NrQoAY2WYdU7ls=;
        b=iOfaNx71l1mIwfoSbjx0FWNGmnfQEbTmwMsoW6BRlTvEFJyqe8KAyFUS6KbrCaFR8W
         LpBWhHrySjHJRpcyHZVsvuFSnOpeuF14drejC1NCE6qEpiZlTMtRY8WuxfakGKAcx0kS
         JnnbfHEcNFkxP2SPb/2XzabLfmNnxPa7ZkBtx7nHyXIv6XB+Kppp4pXjExuGvImITLuB
         kaJefJtfJCbEIJS19KZ72KKCozGde3b9LPP4u2SPt4KR36q5TP12KBZfwMaoKcxuuGZr
         7vWxxWbjgVYoerRKRFdwQUuemZA7yH8F4/Zr3wlm0OCXiaMNvYRnx2TI/7sAfLTbEeXR
         CJqQ==
X-Gm-Message-State: AOJu0YwbhPHt4DHK2Ysy3vHp82142MdkReFUgFYOhvKmLGOs9N7GaXv0
	2yRsFpY76KF6bYG4beY4y53buT8WS96H2VvU5XwGKb9JgYdNYPpikG5Q1nUpVA==
X-Gm-Gg: ASbGncs9z6OmwpxvoJjwW5Y5XvCSoVHvTc6jcIw/URM4oiW91dsN/01hmPh2n752+F5
	tphnI5/Jtdg43dFFlYWVgJjm7U45ZAw+/NrPZOylIwFSVI1lDlYuYdySON+xM7OYlqd4fLQY/13
	qAzJ37WUE3vaT8Z+zaZGXrcVfxL4mf93A8eRfOS8UxGcxXOx89vJo0euHHyuHFOLj63452EDqZp
	/Vh5X2ri/m6AotyAvRsIoqj9ubImtYL+oRCkSp6YVN16z75czkBB2EAUcudb1VjNe6+Qt8CSrjN
	amrickLUOn0ocLJm6tYrBaLGPPF1RqNpenlmvld62LMhsWRwjN3ZkKbQV8qqMOZcOg9+HboC+Ir
	iJvcHTfqMBT4wTPcd1MX+KCyn5Xv9A6tvU/T86OZnog==
X-Google-Smtp-Source: AGHT+IHkl0X/SM2Dtu6SkZrpoZc7s4WQgryqIVUroKo6rydneYRnB5jkdnr8NqZ7t5u7WEfDfatI5g==
X-Received: by 2002:a05:6402:1e8e:b0:61c:3379:7915 with SMTP id 4fb4d7f45d1cf-61c33798213mr16146151a12.3.1756405295633;
        Thu, 28 Aug 2025 11:21:35 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc20f344sm147873a12.12.2025.08.28.11.21.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 11:21:34 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] libffi: upgrade 3.5.1 -> 3.5.2
Date: Thu, 28 Aug 2025 20:21:33 +0200
Message-ID: <20250828182133.1123507-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 18:21:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222593

Changelog:
-fix: enable FFI_MMAP_EXEC_WRIT for DragonFly BSD
-Emscripten: Add wasm64 target
-fix: Ensure trampoline file descriptors are closed on exec.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
v2: added the modified patch that wasn't committed in v1 accidentally

 meta/recipes-support/libffi/libffi/not-win32.patch              | 2 +-
 .../recipes-support/libffi/{libffi_3.5.1.bb => libffi_3.5.2.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libffi/{libffi_3.5.1.bb => libffi_3.5.2.bb} (94%)

diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/recipes-support/libffi/libffi/not-win32.patch
index 26263731f3..ca76fde855 100644
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ b/meta/recipes-support/libffi/libffi/not-win32.patch
@@ -23,7 +23,7 @@ diff --git a/configure.ac b/configure.ac
 index 258107d..ef1a285 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -403,7 +403,7 @@ AC_ARG_ENABLE(multi-os-directory,
+@@ -411,7 +411,7 @@ AC_ARG_ENABLE(multi-os-directory,
  
  # These variables are only ever used when we cross-build to X86_WIN32.
  # And we only support this with GCC, so...
diff --git a/meta/recipes-support/libffi/libffi_3.5.1.bb b/meta/recipes-support/libffi/libffi_3.5.2.bb
similarity index 94%
rename from meta/recipes-support/libffi/libffi_3.5.1.bb
rename to meta/recipes-support/libffi/libffi_3.5.2.bb
index be16008e0f..f648a33a46 100644
--- a/meta/recipes-support/libffi/libffi_3.5.1.bb
+++ b/meta/recipes-support/libffi/libffi_3.5.2.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ce4763670c5b7756000561f9af1ab178"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            "
-SRC_URI[sha256sum] = "f99eb68a67c7d54866b7706af245e87ba060d419a062474b456d3bc8d4abdbd1"
+SRC_URI[sha256sum] = "f3a3082a23b37c293a4fcd1053147b371f2ff91fa7ea1b2a52e335676bac82dc"
 
 EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
 EXTRA_OECONF:class-native += "--with-gcc-arch=generic"

