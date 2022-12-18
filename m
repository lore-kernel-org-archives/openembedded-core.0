Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E987C4708D
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 16:13:49 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.32486.1671380011180914411
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 08:13:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=VQRISahr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id 4so6880984plj.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 08:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QMO3yIlwJOjEklpYqcrnXlxur5eI2rkELwy2YrMJ9PM=;
        b=VQRISahrzG0LPmSSGzYj/bD43zm1QAu72l/X6fO7XBLEkHfdH8cFWhWkk2Hj8ibOiV
         i2HZ+u5+hKPG2cormF6hIwmqS+xu3xKwrs1j7cY3vOHp8nbHNjgoptnY01WtfSzFqaBE
         PwApmFpiBCPNFnOT1jk5Nt7TCd4JYQpKMn9fBMPoW2i9OdLuC6zs/851ThOMjPQLMEco
         lJ2/aQsvvp7peB/i2iiyLuYprrcFiXLFJkUOR0NzPOj0URL4Iqq0cD53lVOlAHRIP+v6
         erLpEh2wZpUvo/hgaHXWdtToob5Ijn1nMEC2l2ZwyBalzdlciOEXZvxl5hktUnq+drFV
         iTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMO3yIlwJOjEklpYqcrnXlxur5eI2rkELwy2YrMJ9PM=;
        b=YOSTwUMMAzEh/sy7mlCYMKQ3uZs2nXw2AxpGFaknmElXWSk3YZwLIkplgfxYigNDFp
         EVQzMPzfFQWLa/NFU/zWV/Lgg0K+Rdy7c9mWZqS8KBY96EfyUhBQsrvdfQDr8Ph5+c/y
         SjbH718gRq1jGTdAEXYinGYoIELvrOVUGQqb2ICDVLFJGaYvOrGWGJCIVCd25VCHybw2
         kFkTJ0C6C0uub4y6U70klbj5SiM71wZWXkYr4mN6O0fZ7JkvIL81cRGvO8mrC0MrwlWX
         vwTiBwS1Vl1kAwFZ4x1uCl+RZMusGEguP0Jljv5S89mrLw1Je9RSCoq0e9IA8qnfoFlg
         KTLA==
X-Gm-Message-State: ANoB5pmXGfvTJY/+i/+bpo76CmGViJjw2PZ0wrttumF2+rLu6mD7f13K
	K9J2Ws6ID4V+W5dzFrX8/IbfOgS/0k4Bxw1AQeM=
X-Google-Smtp-Source: AA0mqf7gx6qYhFSqYnzeRTRg58QlrS9y0PijB1M5+/Tnw0wKII2al2RvhbcUX3aepG7tGmdw7Y9QCg==
X-Received: by 2002:a17:902:e20c:b0:189:a934:ee33 with SMTP id u12-20020a170902e20c00b00189a934ee33mr35236388plb.58.1671380025232;
        Sun, 18 Dec 2022 08:13:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902d48700b001896522a23bsm5278763plg.39.2022.12.18.08.13.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 08:13:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/19] combo-layer: dont use bb.utils.rename
Date: Sun, 18 Dec 2022 06:13:00 -1000
Message-Id: <87543ed6550f7e78b3ddcfed0ef088bea932ba57.1671379841.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671379841.git.steve@sakoman.com>
References: <cover.1671379841.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 16:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174803

From: Ross Burton <ross.burton@arm.com>

Bitbake may not be configured, and bb isn't imported anyway.

Instead just use os.rename(), and take the filename from the file object
instead of duplicating logic.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 528f4fb3683d048537604e4562ea758968060d62)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/combo-layer | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index c122f4b5e4..e467f390c1 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -507,7 +507,7 @@ def check_patch(patchfile):
     f.close()
     if of:
         of.close()
-        bb.utils.rename(patchfile + '.tmp', patchfile)
+        os.rename(of.name, patchfile)
 
 def drop_to_shell(workdir=None):
     if not sys.stdin.isatty():
-- 
2.25.1


