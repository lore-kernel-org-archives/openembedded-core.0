Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C1BC10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 04:14:17 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.2280.1715228050723292481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 21:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RWJD5kPp;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-61f2dc31be4so1145634a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 21:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715228049; x=1715832849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yavF/kkMZL23Aa7vqGUx9Fpc5A+PCThBB9gyb01GoOI=;
        b=RWJD5kPpHvuT6ldT1aN4DzBk7Upq38a5BDKDnYUjlXc9FFaAtLTEb5Gbax/HSOZ3wt
         OtkDfcrtpU6l47AmIGc6Hlp2qZ8vmh/6DjWgv5aaiFH6ZTrFoqTqbc2XLdwc1Kiw4p3I
         nuqfQ56ajekKbjuUw3ioe6Tz5QBt3N+AwNxLymqzrYUe7WwuM0xR7nXvMBcSnTaQJO9t
         PQ/eefqk5rVsvuY40JSOCoPk9JXZXfDOb9kWu87JV6tv3go7r8mYOKRm6jriB4nQ+VeK
         d3YxXItKWlCRpDWbNGeS+rRLQPpeiM2QrYkhOP52bLZT4bTLabY0wxWSACry6qCGrW5Q
         UFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715228049; x=1715832849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yavF/kkMZL23Aa7vqGUx9Fpc5A+PCThBB9gyb01GoOI=;
        b=XumXyEQRN06Obuct3r6DQX46kdg8rLSB5zZ2EzkGsqpE8dU+1Gs82xCnDnpckiTm6Z
         Ca+RSxeY4QXAK9jp3k03tfya4mJBIkXJITTHmapoguknBSGQOajHKBseIkLNbbqJAqYF
         TLL5sjz07/y7kO95PsmPaF3529KsqFw/8BbyeBGCg9rOeov+Zgls2piLnys/0JXH4y4Y
         gPjGotF6sx0JqO78jdLfqEuGsasiVKw97i0uwA16+iql5ir/azNUOBCHUcMZ11bl2ddQ
         EDomZKUwFGuYo2osK1tSrjJq516VDO9FvNoZV9yD1JgvLFq9Wvri1Mg1cWXh4St4F+Bb
         zlvQ==
X-Gm-Message-State: AOJu0YyAPvFiSamDl2w+OmsLwRq3h+bqPjy1YdPnrajNNmLnd7gSteve
	rfZrnuuDTAqPArK6SMDMq6G9ec1QalvsW5X8MJqkegEgZdkZAk0Uc/rej5SQ
X-Google-Smtp-Source: AGHT+IHQJaZ62wYxl/ycKSpSN6UMKE/rIy65pJPgXvX9zGvltZCQ+Bo/JXxTV3wNm+RLXkfE9QhNdw==
X-Received: by 2002:a17:90a:5d8a:b0:2b2:9783:d0ca with SMTP id 98e67ed59e1d1-2b65fc0f5d3mr2301186a91.12.1715228049202;
        Wed, 08 May 2024 21:14:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::af2d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b628849c40sm2279024a91.18.2024.05.08.21.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 21:14:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] enchant2: Disable incompatible-pointer-types warning as error
Date: Wed,  8 May 2024 21:14:06 -0700
Message-ID: <20240509041406.2977304-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 04:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199139

This fixes build with GCC-14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/enchant/enchant2_2.7.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/enchant/enchant2_2.7.2.bb b/meta/recipes-support/enchant/enchant2_2.7.2.bb
index 08998dd48fe..7e175852556 100644
--- a/meta/recipes-support/enchant/enchant2_2.7.2.bb
+++ b/meta/recipes-support/enchant/enchant2_2.7.2.bb
@@ -27,3 +27,7 @@ FILES:${PN} += " \
     ${libdir}/enchant-2 \
 "
 FILES:${PN}-staticdev += "${libdir}/enchant-2/*.a"
+
+#api.vala:43:18: error: assignment to 'gchar **' {aka 'char **'} from incompatible pointer type 'const gchar * const*' {aka 'const char * const*'} [-Wincompatible-pointer-types] 
+
+CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.45.0


