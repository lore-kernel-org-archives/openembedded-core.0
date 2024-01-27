Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1968C47422
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:38:19 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.8498.1706323090842459944
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:38:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=biYsp06Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d50d0c98c3so19845105ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323090; x=1706927890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHw7TKPOtpYj1F51hsUJv/F+Fu8NfPW3QMn7jDUGWto=;
        b=biYsp06ZP4vqWGeWNetZc3qXbFvTPOgw72CQa7mSKqdvhCPtQLSF8pSf080TbSuRhn
         kwW/4heGV1vqhCBYcrNBtLT580vOKgaYb0t/abw2rw6foESoQzxnjiESIAduVuNhEfPe
         ykFdbq+selB4ppmKRDG/cxhXqF6yGdFwNdobmBWz1wPlMGWNWHRk/RF8hAHyanzGUDBV
         nDQEBm+/bep/n7iS+0gGZj/I1aYtmoRzaKj7DViNrKDm7Z6j7N5fjFr+8J+VgrKgVJsq
         qUNXT0NNs41DpwzgYOqUkEB/4xznpb7Jcg5p9MQqgnuREUoP1n7zzRlvL7RlPKz7YsgU
         0ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323090; x=1706927890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHw7TKPOtpYj1F51hsUJv/F+Fu8NfPW3QMn7jDUGWto=;
        b=qZbjma1HbtI7eqKhlHBKelkIvKWRTM8wwpGanyAs9ThidEA+KhWOCKJYvhRMFaI1S7
         BhacyW1cqDTptHa7yj0HLLXpd4Pt7ZpyEHQyER3djY1UQ3vK9DRObQB1DOenAnsO6nTE
         rJVk1KhdBVcsMwc8r8ozk5mW9gccn2fiUSzOGinVBOqrP9GXGwYR41+5XH1db1POO45u
         L7DOMpiWBn7hDYTQdLdtx6Q6MYO4NWIfjeTQPpGDdIZrevHpCleQ7Xw5ZZbJ95Cl5V8I
         46Y7Gn9rpeikWIKPelgrSNsOd2nSCMqokH5Ljfcste5Pdl+D4zNaQPACn2v2TXR7KrY0
         hFcQ==
X-Gm-Message-State: AOJu0Yx/4WhnmadIno0+iv/hoNEdnlHwtHGbHvwlt30dTsM4IaVEVzfS
	G3bH9u5IOa51MkEQb3ihhYmLq59Fv/ffvegjyPRJ6ZizZ9llb99AiKaFnVdUwbEwr5QYJalq9b5
	eZZ454A==
X-Google-Smtp-Source: AGHT+IEglimm+UZI8xyI/Wj6hapTCvvT4etP3W0xZhfi8oX7d39PW4OZctmLnbFfUKohoMAdVX1t7A==
X-Received: by 2002:a17:903:1c8:b0:1d7:3809:a995 with SMTP id e8-20020a17090301c800b001d73809a995mr957221plh.37.1706323090028;
        Fri, 26 Jan 2024 18:38:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.38.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:38:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 17/23] devtool: deploy: provide max_process to strip_execs
Date: Fri, 26 Jan 2024 16:37:25 -1000
Message-Id: <162607e3f7fd490c4b01775a9516a1bcf643eae6.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194426

From: Clay Chang <clayc@hpe.com>

Use oe.utils.get_bb_number_threads to get max_process

Signed-off-by: Clay Chang <clayc@hpe.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f0056dca0a44c374f1f0c5fccbf66ae88e0b1850)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/deploy.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index e14a587417..eadf6e1521 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -140,6 +140,7 @@ def deploy(args, config, basepath, workspace):
     import math
     import oe.recipeutils
     import oe.package
+    import oe.utils
 
     check_workspace_recipe(workspace, args.recipename, checksrc=False)
 
@@ -174,7 +175,7 @@ def deploy(args, config, basepath, workspace):
             exec_fakeroot(rd, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
             os.environ['PATH'] = ':'.join([os.environ['PATH'], rd.getVar('PATH') or ''])
             oe.package.strip_execs(args.recipename, recipe_outdir, rd.getVar('STRIP'), rd.getVar('libdir'),
-                        rd.getVar('base_libdir'), rd)
+                        rd.getVar('base_libdir'), oe.utils.get_bb_number_threads(rd), rd)
 
         filelist = []
         inodes = set({})
-- 
2.34.1


