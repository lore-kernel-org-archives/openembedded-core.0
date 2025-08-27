Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71421CA0EFF
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:29 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.6642.1756330226675980062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=a7/wWc1H;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b474e8d6d01so273214a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330226; x=1756935026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gC9nE5MVbzo3m58NchZ6y0Vej0N0tQUXvfWriYPgpaY=;
        b=a7/wWc1HpAI/CgyHO2rv7YHMpPEUyWvDFz90LPhyWIy0zuh+AyRcqtvITLmC8G65FS
         3NVvVCDkWCj27Pda+5DLVl+N1J4LGp8WwJKk1LSgSaq6uiKFz66P4Gd3BANVYTeLf7JE
         /wNVWyDQOwtsUyZIQ2+XWH7C612/sioNIWnVkXpwaNWNfzu9PpQqB2uTfcjsbT2l9VZ1
         kcn3wvqTBlHtvl17f0ct6EfvQ+Thzr9PJ96iX4j6ItBE7EULJ18rreI+wRAQIryP/6k3
         IN8B6LruBY+RyuKKq27P7RXn+oLN52sLUdEbcD9z1AC0f96la91D8Dv2p2gyocmP/7uM
         qAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330226; x=1756935026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gC9nE5MVbzo3m58NchZ6y0Vej0N0tQUXvfWriYPgpaY=;
        b=AygkJqKPPjg79+AyXmKg337WlNhorlWaHEkVQR89DK1yAi60ugePym4Yf6wza8tcxW
         85s/SFKwF1P7HqXiSwhjg+myhn5vzBQBeDw3toAAgIM8JfdZ9/xadX0EA9plgVo5jyCD
         hHdXG3sAwossaq+T68DNodamcylDF1DOdcFNwvK52Q7Jo8gtscIVM/1rPm/BPEIPodpA
         SeQmuBHZjn9CY5VN7HDqfRpAhlN0HZyT/BAO0+dFcBY35aEXPKXIfMAhzxK/ITRdZxcP
         q9cJ5Kks4l76wk5mUgHXepPLuazXertKcmDDDj0Q/kt1ZOjy+6h/W7ABskhqLoERI1zr
         tXkg==
X-Gm-Message-State: AOJu0Yz457JoSFuZ8KyX6F3ldL9qfOl7TlCgzdZgiIgHzvpVioEz056v
	ULZTcMr5kbk6kWIk0sSkZrFjnSYVkSfuFvFdvo1riERMoLS8UCwZ3MeueoRknLYt58585aGM75m
	1Mngx
X-Gm-Gg: ASbGncuAbMlEpyNN5OektpTtR3me0XJOJ+Kif4jaGEOQswR/vL6ElCclbl0FRL2Wm8+
	9ucRF3NzuT4H/lsfxc6Sqs4IDRLLYzaRoHeohM4eEhh9yUT1BltBqP69rogdME+3gWjW9AYLRc6
	9+u4X12HjtL3kCW4d00Rv5g8aBUzCI8YyXsWcTj3j5Rd2I3B6XXEPK4Ai98N86LtYYAwvwpaSY5
	uVLVDE9dxPnbGYJ8XQk1dloFh1Jn9rbIzD7UnjZSoZVP/WrHcBV3MuRTyHJ6hpHzhW5PMSIwTPA
	jkalCzLyzWJHiXVYDr3LiZP5lB94Gv7TljdWigEUxLUvZLNNwpC9IQF6RCtjBIy5Ukp1m07WA/5
	dmbzqoJ9orOjBCg==
X-Google-Smtp-Source: AGHT+IECqypKy/hcVNPhLsFyG3nhQ2Ua/hYThUghyK1gWE9Iinhn4xkwaR1AVPaniH2f0tKgyXQPZw==
X-Received: by 2002:a17:90b:1fcc:b0:327:6823:bfe with SMTP id 98e67ed59e1d1-32768230e60mr6255518a91.8.1756330225872;
        Wed, 27 Aug 2025 14:30:25 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/33] gmp: Fix build with GCC15/C23
Date: Wed, 27 Aug 2025 14:29:25 -0700
Message-ID: <5114bea0e9fe3cc15cb4f4d264a932d5b9897296.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222526

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...n-prototype-in-acinclude.m4-for-C23-.patch | 25 +++++++++++++++++++
 meta/recipes-support/gmp/gmp_6.3.0.bb         |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp/0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch

diff --git a/meta/recipes-support/gmp/gmp/0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch b/meta/recipes-support/gmp/gmp/0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch
new file mode 100644
index 0000000000..ee199a8373
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp/0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch
@@ -0,0 +1,25 @@
+From 51a657c827422d2bc284d752dfbcfd2b1311a5bf Mon Sep 17 00:00:00 2001
+From: Marc Glisse <marc.glisse@inria.fr>
+Date: Wed, 29 Jan 2025 22:38:02 +0100
+Subject: [PATCH] Complete function prototype in acinclude.m4 for C23
+ compatibility
+
+Upstream-Status: Backport [https://gmplib.org/repo/gmp/rev/8e7bb4ae7a18]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ acinclude.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 9cf9483..787511f 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -609,7 +609,7 @@ GMP_PROG_CC_WORKS_PART([$1], [long long reliability test 1],
+ 
+ #if defined (__GNUC__) && ! defined (__cplusplus)
+ typedef unsigned long long t1;typedef t1*t2;
+-void g(){}
++void g(int,t1 const*,t1,t2,t1 const*,int){}
+ void h(){}
+ static __inline__ t1 e(t2 rp,t2 up,int n,t1 v0)
+ {t1 c,x,r;int i;if(v0){c=1;for(i=1;i<n;i++){x=up[i];r=x+1;rp[i]=r;}}return c;}
diff --git a/meta/recipes-support/gmp/gmp_6.3.0.bb b/meta/recipes-support/gmp/gmp_6.3.0.bb
index fd4aec92fd..fd810a264d 100644
--- a/meta/recipes-support/gmp/gmp_6.3.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.3.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
            file://use-includedir.patch \
            file://0001-Append-the-user-provided-flags-to-the-auto-detected-.patch \
            file://0001-confiure.ac-Believe-the-cflags-from-environment.patch \
+           file://0001-Complete-function-prototype-in-acinclude.m4-for-C23-.patch \
            "
 SRC_URI[sha256sum] = "ac28211a7cfb609bae2e2c8d6058d66c8fe96434f740cf6fe2e47b000d1c20cb"
 
-- 
2.43.0


