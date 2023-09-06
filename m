Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FC6EE14BB
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 16:57:02 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.4190.1694019413362128553
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 09:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cDX6DQpj;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2bcc846fed0so1374241fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694019411; x=1694624211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xvbbIaa8c/wTYDO59Klwx9tr4JdASvw1AE/4hsfKks=;
        b=cDX6DQpjmRAF47aoqA3k8bRRi046kE7bmSgXeX9FaxXF6vVWSapbNOvd3uHGp5vGdH
         DJMZ0WPAJzRJOleoc5bpCG0Aqd+JKD3NY28xqvXkgObQViMvtI8Nx4xmaOe5Ncq44VKp
         xCjCy5zz3e3Xnz/AwjSnOL6h7JVNL9HC055Ia19U0mCkAEa0TJsZGNQHFLtj0zsJPzTZ
         /aroz5URofMULwT7Us1Da47PzZGuv6H+Y22NRhZ0pwptyGLXMgJyF42c9f6uWSsMAKbW
         G6DyghV6YJbZHFBRjLlW20zKgep4kjlf2Hw2yPllrPxDk17VoMTAKfJup9sU5DVV7P90
         Olww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694019411; x=1694624211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xvbbIaa8c/wTYDO59Klwx9tr4JdASvw1AE/4hsfKks=;
        b=jXbK9trM6uxDrjwMRmR/d/WqKXfI3pBt6+sAGZSetaksMJ2i2HvEw2ZvfeBapOjZrh
         K4Ab6Cr80sxwEAT848V2mR0Y7oqweSms5i2wxsMvWuRomkziAqJjRDNzX0LEBcjIgscQ
         8pzs5Sy5PNWvLqUN349y3i66RvGRgBv6rfVGLMlAqhYRhdmZc7v8M+YfHYSHSc6JILxt
         /2unGyF91x7/MxlM0ygVGmFYuND1q/quKvvP4TBKwTCm7MTwZZicMwDZAzh2q8LnpDFv
         XzUBvQ6sJQmRV3T5DmUVichr5CSpIp/Ti2xkgT6c5vS1zYzquKrBldocAT3xhg28tYHb
         QWlA==
X-Gm-Message-State: AOJu0YwcGNI/eSJuPEPvoYG47VB/a0L/MBRCcDIAM2nh29vVBY4EIKzi
	cLebLMGvztQhnzpQNYZ5IKiCe4nnZDU=
X-Google-Smtp-Source: AGHT+IGRSpfQCKiQtt/cT5Pr+kpHlwVGdfyi6x9UTQl3YDO/JbnQbRtrbMMP3dZQg26PnbI6mXbkNg==
X-Received: by 2002:a2e:8842:0:b0:2bc:dcb8:8c15 with SMTP id z2-20020a2e8842000000b002bcdcb88c15mr2680116ljj.36.1694019411376;
        Wed, 06 Sep 2023 09:56:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lh7-20020a170906f8c700b0098e34446464sm9284848ejb.25.2023.09.06.09.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 09:56:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/17] build-sysroots.bb: run tasks one after the other
Date: Wed,  6 Sep 2023 18:56:32 +0200
Message-Id: <20230906165633.2382629-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230906165633.2382629-1-alex@linutronix.de>
References: <20230906165633.2382629-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 16:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187338

Target task is using executables populated by the native task
and as they run in parallel, races can occur.

This was triggered by shadow recipe update which added depedendent libraries,
and where half-populated native sysroot (dependent libraries missing)
was triggering useradd failures.

Presence or absence of useradd itself is a soft failure, and so was previously unnoticed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/meta/build-sysroots.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/build-sysroots.bb b/meta/recipes-core/meta/build-sysroots.bb
index 1a3b692a1b1..ac74dda22c4 100644
--- a/meta/recipes-core/meta/build-sysroots.bb
+++ b/meta/recipes-core/meta/build-sysroots.bb
@@ -42,6 +42,6 @@ python do_build_target_sysroot () {
 }
 do_build_target_sysroot[cleandirs] = "${STANDALONE_SYSROOT}"
 do_build_target_sysroot[nostamp] = "1"
-addtask do_build_target_sysroot before do_build
+addtask do_build_target_sysroot before do_build after do_build_native_sysroot
 
 do_clean[cleandirs] += "${STANDALONE_SYSROOT} ${STANDALONE_SYSROOT_NATIVE}"
-- 
2.30.2


