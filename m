Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B31A3C87FDA
	for <webhook@archiver.kernel.org>; Sun, 10 Aug 2025 22:25:31 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.35365.1754864726763632227
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 15:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RhCd9+fs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45994a72356so29247245e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 15:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1754864725; x=1755469525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=D8t8k58jMFun9ErFuH0ROrE46L87J1DYuOwNZv++cH8=;
        b=RhCd9+fsyMIVG7kKPjYCQQLWd8XKz13wJCxqHulB71avVmJRVQ1rj3C35REbEkot7H
         XshuBB+KkRuo44KlESJKSNZ+ixvY5FW5ebEA8/k2jFJnsrjOr1kIMnb4MMALO41WQ+EM
         vRp7lVnDjrAMgJUpEysHGpsYlhDiNTQkcoRTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754864725; x=1755469525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D8t8k58jMFun9ErFuH0ROrE46L87J1DYuOwNZv++cH8=;
        b=mj8Q0M6gtm14FI5u2NSBhMhjMSgtBvtUrmJPZir39xJvC7fdlLOzbEJAGGgJuh2bX5
         Q3SdLCEWk6pzDPZ62Uzq7nZ/vNbiDmDd/LayClBSobi5cXYnIZ8TV9TsQbYYTNv0nWEz
         Dw99Er10V8l2XbiBXfmg29FuqXAaSsDOh6H8m1t1w4R6D2Kks/g6X5wH1LTdDh+cZMlb
         JUx7g4vLZEH/2ZGj4+Xuvuq/PK3C6kkZjMLNgSyjqeKUduvFcUaoLPh7qfzRq4TK2ADG
         S4Fm+Ohlld+qQdgrnStxGZHkXmqaYMYDEKSb6axkOjPlZAokZpuAMw3COJrn9z4zqvRp
         yTCQ==
X-Gm-Message-State: AOJu0YyfEzkhTWw0xBc47htyRoTinrWEsrgZD88SlOwlBCLWKANxL/VU
	nRzu7Als+T1LKIav0hcfcf8Um+9r//f1wwHtRDgtfeiXuhfKoIDfUWV+7P9BJSnmqNRDFGEYPFn
	aiTtE
X-Gm-Gg: ASbGnctoRXp1a9fr4DuPB8InyGmgs6Kk7DM1TIrVWD0zVLfBMMCoFyMfG1sQmk4yJiT
	gjnJsTUWbJSLbeNn9MvvnRYMYhMygTKtS7CPSYIjdBkF2mZKjyAhddumTVL7LvCPUqyxZDfjVvh
	3Tur0uwwPksDJ4QyaCqMEApcLeSxvT5iJeZqW+mG7rfAdq2Gio9P8bl4D6N9I1B+o8ueV2yuuLz
	QwFLCfC3itnktZDOTbvX0OV2euikpI7JWv4LDdJ+TsvffO4dicYhmSguUzukN1HUrSqUYy1vwKz
	V9KqN0eACQkeWhQ/hH+mUSr7qxrdDVOEvxY2Yvsixp2ubI06cfphx/luq8J7vO8aFUeG+5RSNN0
	SowWlElM6xgsKsAKRP0+GOVCuJNwLDVLMTbJTlHtFEyxMFfVakrw=
X-Google-Smtp-Source: AGHT+IG+Tf4Bhrfnh7hJ9wnP1TKyZjb9aXVH1Unn8FfSci578tLU2HNscOXoNmpoz2do7xh6df1jnA==
X-Received: by 2002:a05:600c:6217:b0:458:bd08:72a8 with SMTP id 5b1f17b1804b1-459fb7878cemr76569455e9.13.1754864724730;
        Sun, 10 Aug 2025 15:25:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2db4:de3e:1e1f:36bf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e0cd2c90sm274068745e9.17.2025.08.10.15.25.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:25:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Revert "qemux86-64: Reduce tuning to core2-64"
Date: Sun, 10 Aug 2025 23:25:23 +0100
Message-ID: <20250810222523.2487072-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 22:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221705

This was originally applied as our autobuilder had older hardware and couldn't
cope with the newer settings. This has been resolved in the new cluster so we
can go back to the newer tuning, which software is now more likely to need.

This reverts commit 369b1dfa28b1791d45f068acc765190defecd460.
---
 meta/conf/machine/include/x86/qemuboot-x86.inc | 4 ++--
 meta/conf/machine/qemux86-64.conf              | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/x86/qemuboot-x86.inc b/meta/conf/machine/include/x86/qemuboot-x86.inc
index 6ae03633aea..82ef4a0b732 100644
--- a/meta/conf/machine/include/x86/qemuboot-x86.inc
+++ b/meta/conf/machine/include/x86/qemuboot-x86.inc
@@ -4,8 +4,8 @@ QB_SMP ?= "-smp 4"
 QB_CPU:x86 ?= "-cpu IvyBridge -machine q35,i8042=off"
 QB_CPU_KVM:x86 ?= "-cpu IvyBridge -machine q35,i8042=off"
 
-QB_CPU:x86-64 ?= "-cpu IvyBridge -machine q35,i8042=off"
-QB_CPU_KVM:x86-64 ?= "-cpu IvyBridge -machine q35,i8042=off"
+QB_CPU:x86-64 ?= "-cpu Skylake-Client -machine q35,i8042=off"
+QB_CPU_KVM:x86-64 ?= "-cpu Skylake-Client -machine q35,i8042=off"
 
 QB_AUDIO_DRV = "alsa"
 QB_AUDIO_OPT = "-device AC97"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 62108b703b6..8aac7634b75 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -3,7 +3,7 @@
 #@DESCRIPTION: Machine configuration for running an x86-64 system on QEMU
 
 require conf/machine/include/qemu.inc
-DEFAULTTUNE ?= "core2-64"
+DEFAULTTUNE ?= "x86-64-v3"
 require conf/machine/include/x86/tune-x86-64-v3.inc
 require conf/machine/include/x86/qemuboot-x86.inc
 

