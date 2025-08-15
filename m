Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B7BCA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 16:45:26 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.16356.1755276317525880905
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 09:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LPt/pPzz;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b47156b3b79so1654672a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 09:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755276317; x=1755881117; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wb+4SKsEfgCD8dp+c45eCD23qZi/uChr+4JlO0tg0Ok=;
        b=LPt/pPzzZkBHRYl9KYUdsiq5JL5qjWCM9XjnF62zfsY3j14SDs0OrfpTselEvycmoU
         f9L+BISYqEp94XTet1mns7Qf3PpGPDQK2WHHKeLCsJtgXsNz3qEUrvD4KrfKPMqWNuXB
         GHvqUT9P0gNdtINnQHI2YdUJDpeMO/ICES/vrJ2S3U2ccBYFi5kZUXTk10hZGuj7flEn
         M/BWIPcSoVr4qhLQLcYizBD4eov1oPXQIkC2SFWUkoGCS/eLQIADk85FEFTdea6W/7rs
         GFHU95h5LDlhm47xYDhm8hub7OBybdJUySHXSVavK5FzbZ23U8kNYGcOyQ2Lzho3FjnG
         pc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755276317; x=1755881117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wb+4SKsEfgCD8dp+c45eCD23qZi/uChr+4JlO0tg0Ok=;
        b=sHwe7JMOmswd1NBqBu7QSVB6v/dzCKL7U0MvxP/z2sV0oAu0IH8PA9MEPWGLWNMW0s
         KNl+wgnAIvHuzInjK2D4nbuEOmHAImj/ZV7SWp3BSGNgs71pnIp+F8soe8iD8LnL7O0L
         cqJviwpnlHqxqvqiP7kTUrbduDxmfZNNnlG44BdTxNzPzl/3gW3AGqOzSCIoE918cxhm
         g1fZwJYDZadFamtlGxeVEQWpf/ahm70QErnWmaKu4DIqQrXG2dUpYL/5DyRW2bWzmE+V
         H4QPfXB2w3M+FcVJKytl0hMDIJY7ow5Jlh6IkWvdsEDs4pUZmCbBLhU58z1C+wTOjbvv
         Xb5w==
X-Gm-Message-State: AOJu0YzlT0emAvD+x4wQQVxuzsf/wh8bzVbXlK3QOeypFKpSAX7b8AA3
	jp6i5wPNf3j803amj/ep9/BnD7DRMRgGi1SeiJBfHV6wfPNO59xney40Qp9+25d1F4vdRbwuNeX
	CFzFg
X-Gm-Gg: ASbGnculrnF9WcaxoMTgVa4RL2CTZ8W9Ho+4YqP59IAdsybpYGqvmtp4w3duoNeW6BN
	1hVl9BkFiBUluAYn1ucYh3f82zrpDeSORhX+vVuLRptmEqax/JAn9rash+jnl/JR5d7PGLQLgox
	w4/nAMusHpsE6FLddpxEJUiJw0kavWSQY8d2XMbfeJMAV9zQGeMJL6eJpJW5MPyj37kUdirpNuG
	XePw+lYNoi0f+46Dyqmk2FxIQDOP8lasAb4UCgGXLYzGRMwPF11izbdT3j0QqpQyFrJq1kGXrwv
	JF8h2QX7Gc3mKb9TeHeBLe+SYn/4mltyuaNsbUkfH+XVRC9NQ5nmM/Itz9KGc8AXCZ+Z9u4yv24
	LEAfH1F5jrZC2eMzM8xqj3btL
X-Google-Smtp-Source: AGHT+IH+iKgcfuHfyz3+KesDITQk7DQwfOvpcJD4hZV9B8tvzh0jRmBOFpt+9YyeEDRba6zQRmao4w==
X-Received: by 2002:a17:902:ea06:b0:237:f757:9ad8 with SMTP id d9443c01a7336-24459486714mr116128485ad.1.1755276316691;
        Fri, 15 Aug 2025 09:45:16 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3ec5:7840:3390:1caa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c9ab2asm1554476a91.30.2025.08.15.09.45.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 09:45:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 8/9] cmake: Add PACKAGECONFIG option for debugger support
Date: Fri, 15 Aug 2025 09:44:59 -0700
Message-ID: <776846eb8aa2f5f8c1ec8842cdbaff6b6bcdfa65.1755276097.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755276097.git.steve@sakoman.com>
References: <cover.1755276097.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 16:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221988

From: Nikhil R <nikhilr5@kpit.com>

Starting from CMake version 2.27 support for interactive debugging of CMake
scripts and configurations was added. However, by default the `nativesdk-cmake`
is compiled with debugger support turned off.

This change adds debugger support for cmake

(From OE-Core rev: 8acfca456c3502f0d097ba01a2d08f83fb75ab60)

Signed-off-by: Nikhil R <nikhilr5@kpit.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/cmake/cmake_3.28.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake_3.28.3.bb b/meta/recipes-devtools/cmake/cmake_3.28.3.bb
index 63d483801a..2d47b4c027 100644
--- a/meta/recipes-devtools/cmake/cmake_3.28.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.28.3.bb
@@ -44,9 +44,11 @@ EXTRA_OECMAKE=" \
     -DKWSYS_CHAR_IS_SIGNED=1 \
     -DBUILD_CursesDialog=0 \
     -DKWSYS_LFS_WORKS=1 \
-    -DCMake_ENABLE_DEBUGGER=0 \
 "
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[debugger] = "-DCMake_ENABLE_DEBUGGER=1,-DCMake_ENABLE_DEBUGGER=0,"
+
 do_install:append:class-nativesdk() {
     mkdir -p ${D}${datadir}/cmake
     install -m 644 ${WORKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cmake/
-- 
2.43.0


