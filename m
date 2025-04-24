Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51475C369D1
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 07:21:02 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.9652.1745479260416158563
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 00:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lac3XRsV;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af908bb32fdso596315a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 00:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745479260; x=1746084060; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgTvORoci9GH0/5nAX0LS4Q58b32GZoNxohL0yXdQIo=;
        b=lac3XRsV4N5iTQ6DGNN6EDioXk0JWhvLKzPGbvX5+pF2qXa4FNhmXeos5/mbEAvEn2
         6uRTegbZHfiI+1ceYBNb1osJQY1vr6FHMx8SGwvLoLDj/M3gfGP5FCrNh2tp40nDsj22
         83asp55arARpWICiCyiSo/gFvvmZ1cBxYrUkDXFAEhZh7jtk42iOpw3dvrBX+e0bePc7
         C42V5dNYjqnmNQkmsQXcYu6rodrGSy7k7dEpu3a30/j654XRA4FGhki1lFf+nOsbzJN9
         zX1pABYQhb1CtpGIhTqrHq6X7hRrMgooVpfiUswgUgbj/ua7jzYowR/FYE2BzOooBglP
         ZUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479260; x=1746084060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgTvORoci9GH0/5nAX0LS4Q58b32GZoNxohL0yXdQIo=;
        b=SLlpYDAcWPLEomoyMx335WbNRwVjgYt0p0Joh3WpffJgXMa3ECjzHzSdyvF/nWOGoq
         AqW1aZsbrXv3JlAQcZMIYc0OVePJURBfcfA410mRp3YJAQcGPiVoFo2TX8pXzXTGV/UQ
         UvvyLF1IHHOn0S+sAlIxJ7FOg/MlEeyNRdkFb07PYPY7P2VS6f6QvoyKiX/g+2xhyY6n
         ScxxxTDxA7t2gftap/BXjy2eAWwv3mv1X/6VbBtDeEmleN1d9mfdiKUvt106rZgn4KKp
         ObDtgD7FhXNduX8CEtdJmfSXnG4jGeIcRpHtKHuAivtdWwpqUAYkgnsjlnqbpX4KCgOA
         7PgQ==
X-Gm-Message-State: AOJu0YzG0N7wrQ0X9yFA7NGgoXZlAG7Ba7l6HD3PpTfHld4wKDSm2Adh
	xcHrDctt6ZWUtYnkwYkZINC2hmHPLGyQAzKYPzriFX30X1ldXEoD
X-Gm-Gg: ASbGncsGy8E40eeu0/Tk9Xyt9QcWbAT0wQiGRCPehK1aAAzSYJQHIoxoDH4vm27rDm5
	xQkxK3RW7KISXTl7CKxXTmotr50a94mNpnNHw4/58SnHVatyLLfSz/Tdpwl0Cp988jyMKSfg7g+
	tS+Em6LUjuRcnIxViu9q5YDf8NAfmDyKEVbDEzitfSc25iCkYNxSX66GpzCvecbIqb2a0i5f0Ch
	MEn5bnwW3SK85A2fZKPb5EjooN6NV8vxoBWDe0nbHdX48vJ9o/uBpB/vOo0ai/cepmEHZrkk03z
	fEpWExPEI74QW0TD78FBJ+CLyxWuvNDA
X-Google-Smtp-Source: AGHT+IEiwCN/qTIIvEEZ5RlnVtbdduo2WVvNbdKgjd0yu66X4Q/kBi0Pv0mgFArfXfdZbwBYhrTu9A==
X-Received: by 2002:a17:90b:5188:b0:2ee:5c9b:35c0 with SMTP id 98e67ed59e1d1-309ee399265mr1758264a91.9.1745479259697;
        Thu, 24 Apr 2025 00:20:59 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5101636sm6234475ad.180.2025.04.24.00.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:20:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Apr 2025 00:20:42 -0700
Subject: [PATCH 08/11] clang: multilib-header fix for llvm-config.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-clang-merge-v1-8-5a492a8461aa@gmail.com>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
In-Reply-To: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Liu Yiding <liuyd.fnst@fujitsu.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 07:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215335

From: Liu Yiding <liuyd.fnst@fujitsu.com>

fix the issue that:
| file /usr/include/llvm/Config/llvm-config.h conflicts between attempted installs of lib32-llvm-dev-20.1.2-r0.core2_32 and llvm-dev-20.1.2-r0.core2_64

reproduce steps:
1. Add in local.conf the following lines:

  MACHINE ?= "qemux86-64"

  require conf/multilib.conf

  MULTILIBS ?= "multilib:lib32"

  DEFAULTTUNE:virtclass-multilib-lib32 ?= "core2-32"

2. add lib32-llvm-dev llvm-dev to core-image-minimal.bb

  IMAGE_INSTALL = "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL} lib32-llvm-dev llvm-dev"

3. $ bitbake core-image-minimal

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 86a5277a179bd9b9522ad0298212f7e0b4f6504f..92a2f7c94bffc3480254280923365656eda704ca 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -22,7 +22,7 @@ INHIBIT_DEFAULT_DEPS:class-native = "1"
 LDFLAGS:append:class-target:riscv32 = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
 LDFLAGS:append:class-target:mips = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
 
-inherit cmake cmake-native pkgconfig python3native python3targetconfig
+inherit cmake cmake-native multilib_header pkgconfig python3native python3targetconfig
 
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
 
@@ -244,6 +244,7 @@ do_install:append:class-target () {
     # Allow bin path to change based on YOCTO_ALTERNATE_EXE_PATH
     sed -i 's;${_IMPORT_PREFIX}/bin;${_IMPORT_PREFIX_BIN};g' ${D}${libdir}/cmake/llvm/LLVMExports-release.cmake
 
+    oe_multilib_header llvm/Config/llvm-config.h
     # Insert function to populate Import Variables
     sed -i "4i\
 if(DEFINED ENV{YOCTO_ALTERNATE_EXE_PATH})\n\

-- 
2.49.0


