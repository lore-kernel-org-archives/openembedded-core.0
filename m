Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953FAC54E65
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:31:08 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.37997.1747603863532611346
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U0FmpEug;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-30e7bfef27dso2110705a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603863; x=1748208663; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpHdjZcibezq+OfWawAWqOdyNMbbwo07a90GHWVeMSA=;
        b=U0FmpEug9uHcqOyHwFItVpQjG3xIw/0GfYzlTDqiKLDu3UIRzztToUfm5rLUH/N5my
         xqDg7hJ0pqnLG0wA5TSBDQoeKKAQZBgTKxB4BrJOlNbz/9alPvBTVSg1oQi8wpEDjwEL
         TTAwJ0I4I4cnEts+oedGhoLvOcFpg+EQHo15P5u1iP3cI9oNR2Ps6HOsxJ7eg2VJvBXe
         OValdfOhMWPiKwHOi5ztH+q7tea4fXYbNt9WT8zOBgaiwzyM0da82OkJADZ3MeXYPXdY
         601uvUF/URTNTPX59EPDYnbni1nlL1Gk3fp2aE/1maZAHyTnsVEZaGCKnb6I35NIuWPx
         yK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603863; x=1748208663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dpHdjZcibezq+OfWawAWqOdyNMbbwo07a90GHWVeMSA=;
        b=uoqo2iaRQnOcc/H7LH4EBSaAJiDvQ0eMDss5AOvcIr5AQJfuff/6nJLUtzr7vA/Pr9
         8k30/uTM7V0F/P1L2/r/p84z/kvIcWhxtyJKNfneEE17PgT/JxXgQO5cGn2nKIs8o2cA
         wS17uf2STcV2D68TPe2DArcEk4LS1WcXC8Qv+sjKW9nYJ0xyLvmMnzIQrg89hciLaCaC
         zelkBAcG5Mmf/QGS6NrG9hdr1G+/2jbOPfiSSzq99uIW/nLlh9RPugoJivJQkGlTlv55
         BaRuzUwTbCEuu2UqinELv7hqaWKnbzN2izJd8aTMVaqmQCDFIXkSJtSTF8BkITkNLkyR
         i7xQ==
X-Gm-Message-State: AOJu0YwRXjp82A8u9T9QJP1nCV1KGw/AkBhF02JlNPMMngvvpCKd7A3m
	k4bwf+OUdAzQDWohmcM7g5OrOEEBw5dpgiypu1X+z+0mu9eMmCcr4xolAcZiRVwt
X-Gm-Gg: ASbGnctOms068sqD4Tqq9T6g3KMX44Aab0FuVDThGCawzb2AlZxPW+P7/fGJwGyePIi
	LjMNeIblRksOcJ5+/Uf4CvX56n+Sgh+OX1otpNx04igIBRAyK1qbcy/AnsTlt+U4H9YSbFXG97x
	izYWlY+ls4MtQPgBilvIlRQXXKOqd1uODrg6FXn1JSqXyDvnBqMSRQgqloJlTwXUDfdlpZ4MT7c
	STknnswMh2Oqz5m+S6szI7WxwzRFF5aGoaCpNoHbXhKNiNZK1CmYF9Mf5s7olNFaOmVgBy2Nibn
	gGjI1jKA5C/Kc55Qv51YBnRqfLYVDK0lzFaUxc5TaMA=
X-Google-Smtp-Source: AGHT+IHY9OTyjEPPzL75mjDODwvDcawKxPRONUQZzr6u0Zo8DNK6CymQk5QIVKHbvc7fytYIPfLJew==
X-Received: by 2002:a17:90b:264e:b0:305:2d27:7cb0 with SMTP id 98e67ed59e1d1-30e831b842amr14250707a91.21.1747603862715;
        Sun, 18 May 2025 14:31:02 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:31:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:51 -0700
Subject: [PATCH 16/21] syslinux: Pin to using GCC toolchain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-16-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216800

It does not compile with clang due to include_next stdarg.h not working
as the system expects to match gcc behavior

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-toolchains.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/distro/include/default-toolchains.inc b/meta/conf/distro/include/default-toolchains.inc
index c3b602b8ae8ed7c57cc8c524e3b8398519079b1b..cec47ae860747df807695182878e88e4f798fe24 100644
--- a/meta/conf/distro/include/default-toolchains.inc
+++ b/meta/conf/distro/include/default-toolchains.inc
@@ -29,6 +29,11 @@ TOOLCHAIN:pn-pulseaudio:armv7a = "gcc"
 # https://github.com/llvm/llvm-project/issues/82541
 TOOLCHAIN:pn-rpm = "gcc"
 
+# com32/lib/../include/stdarg.h:9:15: fatal error: 'stdarg.h' file not found
+#    9 | #include_next <stdarg.h>
+#      |               ^~~~~~~~~~
+TOOLCHAIN:pn-syslinux = "gcc"
+
 # Emits lot of warning which are treated as errors
 # They must be looked into before disabling
 TOOLCHAIN:pn-systemtap = "gcc"

-- 
2.49.0


