Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD81FC636D6
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 18:28:21 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.21094.1676917697010189442
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 10:28:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ar5bEOOP;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id bg28so1577689wmb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 10:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ljuW+L8UPZmHwUteYPhaC6W4jaT6OEPQ/XIQd1WYjuk=;
        b=Ar5bEOOPUwelxfI+1sV+8dcqa9ZUifF1bPDZmggel1lutIBsa3+kYMGh3x1Ce7sUyn
         JWf9JWkHcInip1VwUuKkNaln/nKawDbz3Ky562v/Dixks0UgZImgKheRx5gZlLiOJkyM
         HwBeB2WVL179NjV30r1uYX7HSgguxxT6xhyzBH78BUOQmBcuK1RgKKzTA4BA5VdWHb6F
         cherzQLDq+NJuxUiNiNE6M859d2DpcDccfFf8dZSzSFNt8P8gFXEPWPK+JSfiDp3S/0R
         5/SNHszMMQnRKiXia5rgj80dfrc9djkke/tkaW2byg213r5mmiZCitQVZGpQniG2wRPF
         x6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ljuW+L8UPZmHwUteYPhaC6W4jaT6OEPQ/XIQd1WYjuk=;
        b=8ItHcT4hoqVRAyQTM1K98zMjJxi2wzjL8hZowUUfvuHz5BCaLVf1J+YHXJoB75sZjI
         ZooiemWq16C6qGbKefdr6y4pS44w6ZJol8W2B6iYG0uMqjG8fE/l5JH+qsLrwmyzqej5
         P4xXZHOYZtnXSmPP/bDTHFY5OuKOseYzNL/4q2jjIIOkUp2Ym2zBWZw80ayit7Uaw1Md
         306vp/x8f4U3uvWi4BF4GL9ujQqoEOySACUioaxj3YwQ2s+oOlt+SRRYkZCN2k7GzfLV
         07JQ8r9IhNTB30enTzVMLzCvo4uqL5dvf0BE6tXdBCh8EuvfaPgG06wlWuTy5ric+y+n
         DA1g==
X-Gm-Message-State: AO0yUKWTKefktDfQokVc2AHY2TA6picSW9m1gwndDj3+aZUbLAMZhP56
	4Modtoy/3kzz0pw9iyJbqriirYao6iM=
X-Google-Smtp-Source: AK7set9QpY2q6st5FVHnnuuRLi9yfiEBmheptGhMcl3cnVbVWyzEuEIxLiOttmXDga0xklp0/+PAZQ==
X-Received: by 2002:a05:600c:44c5:b0:3e2:1f63:4a8c with SMTP id f5-20020a05600c44c500b003e21f634a8cmr1265666wmo.23.1676917695309;
        Mon, 20 Feb 2023 10:28:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id y11-20020a05600c364b00b003dc0cb5e3f1sm14227275wmq.46.2023.02.20.10.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 10:28:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] devtool: ignore patch-fuzz errors when extracting source
Date: Mon, 20 Feb 2023 19:28:13 +0100
Message-Id: <20230220182813.2785151-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 18:28:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177450

So that patch fuzz issues can actually be fixed,
as extracting source with 'devtool modify' is the first step
for that.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/lib/devtool/standard.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d64e18e179..0339d12763 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -567,6 +567,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
         logger.debug('writing append file %s' % appendfile)
         with open(appendfile, 'a') as f:
             f.write('###--- _extract_source\n')
+            f.write('ERROR_QA:remove = "patch-fuzz"\n')
             f.write('DEVTOOL_TEMPDIR = "%s"\n' % tempdir)
             f.write('DEVTOOL_DEVBRANCH = "%s"\n' % devbranch)
             if not is_kernel_yocto:
-- 
2.30.2


