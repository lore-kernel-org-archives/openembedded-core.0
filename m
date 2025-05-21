Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56617C54F32
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:14 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.4706.1747808406056445456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:20:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SwuuuRxE;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-742c3d06de3so4040443b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808405; x=1748413205; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5Yzb4GIH6OovkXY1r7hq1248AYyKhAE7azyt6wFZDw=;
        b=SwuuuRxErKkoO5Y/D8T5mlh5pxwdNsqtDyMZqar1G9tdLE//20ZKgn+l+brx37WZ+B
         52AUxN6ILqBfizQOyD4Xhkw2o5rWO67aGTm8vdVbrE4BrDtLu50XT86ZC0uPGCfoo6kj
         rfze7FggKt4KLVLmv5V5DpJIDEh6M0g5ORPPLYC9WxvbPqQdw53sRM54TNqFDptAPDGW
         RTVUWfkbKXuLHmLYOZqTFNL9hcubaCdONCeg0o8Lmzu4g6TeNXeu8UdCOh2kWmz5daay
         BuSiVeYFxqwoeySgLh2vhg1WTmEwoDxjj59f5Zs2dy5bxDSat2BTDlMaYaTUUnWAkeFf
         dW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808405; x=1748413205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5Yzb4GIH6OovkXY1r7hq1248AYyKhAE7azyt6wFZDw=;
        b=rl5L2ZOAT/i/wzRhWqW+BmahyR6xPFju+uOSIdQstdWPbQzMCUBh2VCOOT+3CNu1n+
         u8ZabxJk25uGhqlj4aSAdd0Bn9OZCEPXiUUijqn0QlwkakLIkk0xlaNcynJs1XB60eIO
         3dQGNnjvBr1EAxpfFYaKHYPmLS89mm8lupC+lRd8B81AE3Td6PKRc27edAEnfAAcWkjS
         6SqXTAdZlHYLRv4dKklXwRKLV2DGiRZ2XCDJMiwYCV60pW0HC6a+g1XkKtpeFfbgYfd8
         EG1dLT3kJ3Mkq2VU8EslfPYC8NJ3QBu+9Ws6uKZbbMFWrRPxg/ljWpJtw41KV6ugJ1B1
         RDeQ==
X-Gm-Message-State: AOJu0YwT/cUxLqoLgKGQQZX099nCemko5Lbq4Fegf8lbH8UrUal+Oo03
	jZ4/KtvIYlyoPwz3lVhlikrLUB4OFecCX75dpt42p0EXf/peZAl+OEoJRsRiNTDh
X-Gm-Gg: ASbGncvw3fvBKnnGvl0CwvSSG0G5FqSzn6ka/vxr3NlYXH0vG594kDHs1jwtetwt4II
	9seQAECm5Q6YEIPLbIv1UPuGs9Lb+ceOaqroD2vFhBuzUojd9xquAvJaaom7MYKO8jmHgAgrLxx
	uoFOA6DX2dFyUN6fFBjNb61/ItDJbFJaGstOd2Q7zAwzBZe3dzKsJm/RyX6Z++ULBahzOLlOSJu
	p8VQcXHk9ejxOc8WitFO+V1amjyTLC3cYG9UzdNAz0Eb5iadPkC+5P2RoVMGT726g5RHFAv+a86
	9FFZyTOwTDthKdZALXHZzKeqwQk++ecVb1LVoWoWIMY=
X-Google-Smtp-Source: AGHT+IHgdZOZgJ8cFodGD8eqUlaSl4s27m3RPh7A1c8OMZZGpTW2BekhL9N+cA62eadcsQDv2M4eSg==
X-Received: by 2002:a05:6a00:1382:b0:740:5927:aa4c with SMTP id d2e1a72fcca58-742acba8f87mr25418902b3a.0.1747808405100;
        Tue, 20 May 2025 23:20:05 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:20:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:53 -0700
Subject: [PATCH v2 17/28] grub,grub-efi: Pin to using gcc on aarch64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-17-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216985

It needs porting to work with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/grub/grub2.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 1fe39a59d2d9dc6909ba88bfceaf6fd4222c13d2..ffa04e415d379d431995d551f5ca6f9ce479a87c 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -106,3 +106,7 @@ do_configure:prepend() {
 	FROM_BOOTSTRAP=1 ${S}/autogen.sh
 	cd ${B}
 }
+
+# | aarch64-poky-linux-clang: error: invalid argument '-mcmodel=large' only allowed with '-fno-pic'
+# see - https://bugs.gentoo.org/942843
+TOOLCHAIN:aarch64 = "gcc"

-- 
2.49.0


