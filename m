Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FDBC54E92
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:03 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.4698.1747808397033650045
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:19:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XrD0RSTU;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-742b614581dso5004189b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808396; x=1748413196; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U48re4z2gGwsh7doGBRZzWmpNJmm9WpMzMS4mFuI3dg=;
        b=XrD0RSTURYcFqFyVH028bpZ4avTKghg3wrI+zyLi6bAxnK1fD/KI9mnMqdzVNEyhcv
         t5Y5aRErNgcDByf9OR2/qfHMm8znqYUIqwhynwPspTngFjVFlF3n++hGm2BQGYO+Wvih
         XqRMcLbwzeR7jxKanDL6QoraveddcXuxbwCAEvzStLO5Xtx9CNJIYPY/1U2TNfhkVi/9
         4T74Osjl7Ys6vBSsEcyp/4M+9S4WffrmqnlLKhamCaYP86avcdnHAEbU7ucgvklY8Ims
         8ST9L0l7VcFgGSJlvIgDcb7XkRNIEkzsPzjNVswHOsQDDv9XNzDnV0UAA8ozV3Ps12H3
         BoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808396; x=1748413196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U48re4z2gGwsh7doGBRZzWmpNJmm9WpMzMS4mFuI3dg=;
        b=T0K9m8KahKtT3AohlbrCGj4kDQVK+x8v+NGMgX6NOG8kw9UW912zsasInIDdJTcdNn
         OSTJKJw+wwVaB+gx/3CmWax9tFTmcNc56U0kRF9WrpVzToQq0wyzf9tgx7H4icHfxJBY
         v5tThXxHzLcj+YgPoevdd+ueT0HM6iCWyzWqiZrkqkv8imNj02SbNkAUtmvjtvMWY0pd
         RhC5dOeBeaJ7VLp/ShgL8Ie6C8KlazhoPr/fSDYbZReTyc2JXaFiYUrqJuGZYVy+kDkw
         a4nuqrKxqdbd9vroAvEmGE3fmc8qjKUw1qblXOMM3f1rOw6KsvuaYiZc8t3Y8Ya8qAwP
         PlGA==
X-Gm-Message-State: AOJu0Yzw9GX2SgCzaQ/PMnierRcHiws0ka+wTFRfHy2Q3xqfH8PZ8bdy
	7kMxgb0IW9OvtunW3/N9NvozqyvSkTVLqRk1qAMmTJFxS61IxoxP25+PcnMNlTOs
X-Gm-Gg: ASbGncubQdweE40BeiZYSWp+WihXUP5T8GbGiaEIcRvuRks5NJljtbkoLgwWvnKZ6iG
	G59QrYPCEALscV1i2KMlWERS4PJY0bMoqSZJThGH4aFXAbGwJ51FqHWi07kvkc8bGmRsZNUmPWU
	OvZs9mRY0wtulYUs89g7p/g6Dnts2npfBFp7Ivf27ZCkBs6QgF0kFGcTfkBcNBwc9NjJrtu5wi5
	16yVgyEw4Bpz8RM3C5f60RUQ49qWrK8pw7A/HmEJTSx+8MsZ8eT1O4itHtI6pZ/sQF79NltW5x5
	J00IOhrxy6QMakB3Mcrci037m6fgUEXdy6huSiqfJ1wxr6EP/aHS1w==
X-Google-Smtp-Source: AGHT+IHAmijaOnPJ1eZ2oRzbFeX/TEzf4KBNNsP+pzLa3LKI65BKTlDPUTR8kpc06wnmUAbH7PU7jw==
X-Received: by 2002:a05:6a00:391a:b0:740:a879:4f7b with SMTP id d2e1a72fcca58-742acd5115amr25129463b3a.18.1747808396236;
        Tue, 20 May 2025 23:19:56 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:19:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:42 -0700
Subject: [PATCH v2 06/28] tcf-agent: Fix ranlib call when using llvm-ranlib
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-6-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216974

This ensures that binutils-ranlib or llvm-ranlib
behaves same as gcc-ranlib

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 235936288ba792c86af4dd1899b2f6585328141f..41706f4b60f1f25233ff91c8f112b8122a5c6c30 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -51,6 +51,11 @@ CFLAGS:append:riscv64 = " ${LCL_STOP_SERVICES}"
 CFLAGS:append:riscv32 = " ${LCL_STOP_SERVICES}"
 CFLAGS:append:loongarch64 = " ${LCL_STOP_SERVICES}"
 
+# This works with gcc-ranlib wrapper only which expands $@ shell array,
+# but it will fail if RANLIB was set to <cross>-ranlib or
+# <cross>-llvm-ranlib has same behaviour
+RANLIB:append:toolchain-clang = " $@"
+
 do_install() {
 	oe_runmake install INSTALLROOT=${D}
 	install -d ${D}${sysconfdir}/init.d/

-- 
2.49.0


