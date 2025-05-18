Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6755C54ED0
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:31:08 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.37992.1747603858734592816
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cLpdXCqh;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b26f67f10ddso1398959a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603858; x=1748208658; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGGFCmScvEozy+In68pO3a19rjzK+bCqa+eEIzK9avs=;
        b=cLpdXCqhEo67MR9TfvXIWF1v6IUe7kKxkCuvG8tVsz7Zjmy7kmhfcsVxQrgzKqfxgQ
         nk18Dm1bKpD2oyBwWc9CwaGv0bissxWJz0voHeSW+fpxBuDj4ooHUCKo4+qT3u6wy/b/
         QPLRBVXRWoIEx5mqhPPmfSYiS7M54PSkZYClAM4Lxa7MRuJGdrjH/5IKipOwjGEOBrQY
         137USvxhDq/ZrFKo4ItxbYmEkDkReA9UaK5T2A25wQF5nMLuOqZmvVaRBEfExhfYFSr2
         XEbs5/Nh5L87mEwh9JMPmByyCUix3dtvE1bbtpHqD1C2Etay5B3LGPQjMTbEdgy3WGHV
         UMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603858; x=1748208658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGGFCmScvEozy+In68pO3a19rjzK+bCqa+eEIzK9avs=;
        b=S+o146g9QIg6bkQGzOJRfeYtY4HXYZz2pNkfHQ5MjWmxHlcDqdM6cEJHgQVpIGLfrp
         +SukPHqKtjLQiOkMoabB4QVbAei1BlJ8qmO3NXyQiyF+Iv2DCOZrtd3loE74tkmHqLE4
         EanytzAP9+e2qXYlx9/12fY6es6c5rYLN7YQjVqehGybZkLaD8uIPq2JeWWxyC8KY9Js
         FEagws9mPpMJj1lEEopOGuQ/LwC9gEWIGAZYx/8onQpKphCAgtTKzRhOomifsRvMyjKB
         38dJUWM0TZWCRNup+ahG72tNBLJ7+XJ1mE7bheE6YVxvoWaDntgcw/yttlrLbroX1QmP
         wQCA==
X-Gm-Message-State: AOJu0Yy66qJlvyMPFC5cKwh6KR5c8V2SXeQmPn1PIbe5MyTsjcpd40Az
	PKsndAk7kPcloJdpClHIBu81KI0HxKDm85nONI9pSMaJOJCfjmXb0ikGo9gwntBK
X-Gm-Gg: ASbGncvjCezfDNdTkQp+NcS2aBDsaArDN5i5YKN+tHJhd4/KnXgfPOPqu9lVDEVTHbh
	MjrWjz4IJv3smY0ZfLr13CvTmLx04gK7BhjkiV1cKN4xFOA5+fCJdxAD/gfTNmyQqbMvfPIygYT
	W6s+/rKNThal6tsJxrzrutOIsnJ6LO3PEuDFC8BpcImMPK0DXVRQmpO9VZYRtxaYqV9IXskvEon
	jFpbLKDBzNqfpoeCKiXtIeKhjD8SgOBsdeUr1KVMI6RGvnNPDudMN6QTxdz9fylJb+frjO//50Q
	E6GIsjji5CEAYllfH1ueiceunbQCZT6Z9XBdZfH5N98=
X-Google-Smtp-Source: AGHT+IHHC84AdadmUd9+IWfgQgNl/u6isF4EG6QXOhdTLIZrxpPVFx4JMq1pbo/7hnuu+VQFn/jAgQ==
X-Received: by 2002:a05:6a20:d485:b0:1f5:97c3:41b9 with SMTP id adf61e73a8af0-2170c721ddcmr12656370637.5.1747603856966;
        Sun, 18 May 2025 14:30:56 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:30:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:44 -0700
Subject: [PATCH 09/21] pseudo: Pin to using GCC compiler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-9-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216794

It uses compiler built-ins which clang does not provide

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-toolchains.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/conf/distro/include/default-toolchains.inc b/meta/conf/distro/include/default-toolchains.inc
index 18208125dc2fee8acbde3abbd8faffb479e0a846..014a44ad8280e3ab086459ffe71c626dd5d31cc7 100644
--- a/meta/conf/distro/include/default-toolchains.inc
+++ b/meta/conf/distro/include/default-toolchains.inc
@@ -13,6 +13,13 @@ TOOLCHAIN:pn-libgcc = "gcc"
 TOOLCHAIN:pn-libgfortran = "gcc"
 TOOLCHAIN:pn-libssp-nonshared = "gcc"
 
+#| ./ports/linux/pseudo_wrappers.c:80:14: error: use of unknown builtin '__builtin_apply' [-Wimplicit-function-declaration]
+#|         void *res = __builtin_apply((void (*)()) real_syscall, __builtin_apply_args(), sizeof(long) * 7);
+#|                     ^
+#| ./ports/linux/pseudo_wrappers.c:80:57: error: use of unknown builtin '__builtin_apply_args' [-Wimplicit-function-declaration]
+#|         void *res = __builtin_apply((void (*)()) real_syscall, __builtin_apply_args(), sizeof(long) * 7);
+TOOLCHAIN:pn-pseudo = "gcc"
+
 # mix_neon.c:179:9: error: invalid operand in inline asm: 'vld1.s32 ${0:h}, [$2]
 #      vld1.s32 ${1:h}, [$3] '
 TOOLCHAIN:pn-pulseaudio:armv7ve = "gcc"

-- 
2.49.0


