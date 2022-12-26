Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29246C4708D
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 08:45:19 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.133335.1672044310783592950
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Dec 2022 00:45:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AwwuTzMd;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso7210132wmo.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 00:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpGZifAH9x0x3lGzxqjOuBQXHQ8bJeqzDk4knYhqWM0=;
        b=AwwuTzMdx0SjlglyeD5G5WcXIjwha4LZGmElUnKvnSip3uLUjSSQEU+xAIFtJOxBll
         TQ3Wk6w/0npJDaw8La5OZsH1GsYFavd1tvGxohlNNmD1g1Iv5JudvUgjg6CXCarnBY1n
         DS81pkslZhMIdRW3NKmmTBFnOQUUjx19mt9Jq4qyoviQ9had7tbkyztJRUfV0l7p8R/m
         3DmMcYj9jFnrcqSRIU4YJu+D07rXTdgVM38IHJrh/g4eYfc+8tO9iUczGqdrYDSLco+c
         DNUZKWJn8sDY3fhGcPCJaHEJYDXZM+quCZdkjHnJaIQxIBv076RfeUK2sPAHov/dJP0Z
         UsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpGZifAH9x0x3lGzxqjOuBQXHQ8bJeqzDk4knYhqWM0=;
        b=OW6MxN6TqTWabBaJrPUn6nQ80e4M4Jj968XthmX89ssLd/5gBKH7n22RwRr9vO4rrm
         zSf3KC7741s52kxNitfmDABehTm0Eijg/2uM5fF2vShf181NxySoyynCKiBICVbYZZQw
         S9xQJw8A9bwY5Jz34S2iOh0ChI/ZkHf58OX6w1vFHCZiDJpL3TaXM1171rjEtfD5vLqt
         htl/anhg96KGVE8nuZ4eDIG+XjqBh2cJoWmNClOWSZJJBczcS5DI8EGxoqS3M/s/Dbx6
         Rv3lLGEYtuKYO4XCzUUhBtRdR0TPeD0ZR3qd+8PuGuBO32sv8y9hTlYr0dqKQHStp6s5
         oYxw==
X-Gm-Message-State: AFqh2kr9Ft6No9NQEV5kRmN11q0Yd562TzQdquapLzK/thn2JJbj/zDC
	Sf969RmI0XFJjyd/9k+dKWVdnVz+PgU=
X-Google-Smtp-Source: AMrXdXvYxhRLTLEUJ6WMPFc8uptHmpzfMhCbrpFYZcI392K06cxseWtBRbEA911L+Ad3Xj9/OmnIYw==
X-Received: by 2002:a05:600c:5006:b0:3d2:3eda:dd1 with SMTP id n6-20020a05600c500600b003d23eda0dd1mr12458551wmr.17.1672044309105;
        Mon, 26 Dec 2022 00:45:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n64-20020a1ca443000000b003d21759db42sm18203942wme.5.2022.12.26.00.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 00:45:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 2/3] qemux86-64: build for x86-64-v3 (2013 Haswell and later) rather than Core 2 from 2006
Date: Mon, 26 Dec 2022 09:44:54 +0100
Message-Id: <20221226084455.2835751-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221226084455.2835751-1-alex@linutronix.de>
References: <20221226084455.2835751-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 08:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175014

This allows us to
- test those more recent instruction sets (AVX, AVX2, BMI1, BMI2, F16C, FMA, LZCNT, MOVBE, XSAVE)
- benefit from improved performance across the stack both in kvm-driven system emulation and when running
on real silicon.
For example, glibc:
https://www.phoronix.com/news/Glibc-strcasecmp-AVX2-EVEX

v4 level is adding AVX-512, which is far less established, particularly Intel has famously backtracked
from supporting it in Alder Lake/Raport Lake client CPUs and AMD has only implemented it in very recent Zen4 products:
https://www.phoronix.com/news/GCC-11-x86-64-Feature-Levels

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/machine/include/x86/qemuboot-x86.inc | 4 ++--
 meta/conf/machine/qemux86-64.conf              | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/x86/qemuboot-x86.inc b/meta/conf/machine/include/x86/qemuboot-x86.inc
index 3953679366..31db1b2a61 100644
--- a/meta/conf/machine/include/x86/qemuboot-x86.inc
+++ b/meta/conf/machine/include/x86/qemuboot-x86.inc
@@ -4,8 +4,8 @@ QB_SMP = "-smp 4"
 QB_CPU:x86 = "-cpu IvyBridge -machine q35,i8042=off"
 QB_CPU_KVM:x86 = "-cpu IvyBridge -machine q35,i8042=off"
 
-QB_CPU:x86-64 = "-cpu IvyBridge -machine q35,i8042=off"
-QB_CPU_KVM:x86-64 = "-cpu IvyBridge -machine q35,i8042=off"
+QB_CPU:x86-64 = "-cpu Skylake-Client -machine q35,i8042=off"
+QB_CPU_KVM:x86-64 = "-cpu Skylake-Client -machine q35,i8042=off"
 
 QB_AUDIO_DRV = "alsa"
 QB_AUDIO_OPT = "-device AC97"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 8640867911..ba8ed21707 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -9,8 +9,8 @@ PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
 
 require conf/machine/include/qemu.inc
-DEFAULTTUNE ?= "core2-64"
-require conf/machine/include/x86/tune-corei7.inc
+DEFAULTTUNE ?= "x86-64-v3-64"
+require conf/machine/include/x86/tune-x86-64-v3.inc
 require conf/machine/include/x86/qemuboot-x86.inc
 
 UBOOT_MACHINE ?= "qemu-x86_64_defconfig"
-- 
2.30.2


