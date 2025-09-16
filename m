Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02376CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 14:17:56 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.21512.1758032274631139998
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 07:17:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SQmtinsV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-77619f3f41aso3152333b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 07:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758032274; x=1758637074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4zDX8N6UA7aZvqNe7i0GjiWFiS22HgO7I3VCt8YodSg=;
        b=SQmtinsV+LKvkcLgp6cyiJZzhaqK5ulwDtY5yeJ/MKoZvYDH2m5D0FUyT9JtWqurQm
         5XoGb/rlj+dwjwu9CAZlM4iAUZ7e/rt4iMuePXFjVBBs/DwwaoCiAfck0xhbAgLsxR2W
         ihg9Xq8dCzo6odofcJGeM4egbPy9Y69eS0A/AZWbhcZL+f+XCpyr6+VL7sYdxxTrULEr
         Sx1VEhRlw/1//iO7zWkqQC5PwovbrfuW/rLWW+pvWrR3cVOUOsZVd3iFhrv022J5c7Dd
         vhf/ASbc634ycYjhtLIfbV1ixxH6plPQjQ6kxcQ+CZx6GfKRNov3vk35UCQy+xj7a7/5
         x3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758032274; x=1758637074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4zDX8N6UA7aZvqNe7i0GjiWFiS22HgO7I3VCt8YodSg=;
        b=gvJuBZX9MB43QP8CfoHi6EAaNQNIgS3PSkgu89Ic0GJ77fd0l9EOqPW9sOjm+55jpe
         cei3Xi5Li1CF1UHHx710cxjRNqr4DGAjT2dSevTbfh+Di74iYFid2Eobch3wOhGqtkhY
         TGybDcIsmsNPClGep5iA9hzipjFpeUxDp7MxnTS6sr9UaNBKzZI9Zu9zGrCaA4JJUCvh
         I6eD8DQaiviKdRKFCmziR8NLYHCW16XyEsEkxaeN2T1Vmmj1CMgG5KgsAQdq5ZfVD4+O
         3LudnicWTd3DA5p/sCGqFJSf/iEaarwd+ebpQv2bobsZSIT4btNWiGcmQ6/Fik0etLZh
         3nDw==
X-Gm-Message-State: AOJu0YxueB5Yw5gk+M3ceMh0j57ujkCLtukdTLjo9eJJOE/iVAIwWvCw
	ijW96+dJpqUyz9haI2UzDHwM08Dg+u8Bi22Y/67PrQawqikbKRVMohsViOLwNArYw0qk6rZrSz6
	DPc1v
X-Gm-Gg: ASbGncszosqhlOQln5REfor0Xd4FRBL3Ad/gLNTO9blfpfbZ5RPloOOK5gP6H3AY2Mw
	GxMJ5kBHBIn04zesA5KKL79vJwxqvB/LJa4Hyg+FfvoMecM2XhWy+w7eUASyXXY2KTCOQXCMd0P
	FiKXdGeP8rd7sruSw2ra6s6Y0Jcyw0Vx0n/tYVi3UNyY6pFWwcfrl/qPsG6IYAPk2GKQ6hw3oX6
	ZfkZ7mBFS1YbgJ3Oxn9NApzljXer+TUgoYujqPPy958bHa1HefQ4aSiMNAXNFS9oJBIJq3tl19m
	wwIvIE14adUIYlziSLt7BM9ieYClAzhy+QEQPhfu+UKvYOuVrAcQ1TE78xeLmY9j3Kvxz73YhDd
	DC8K8+u+1GQWnuQ==
X-Google-Smtp-Source: AGHT+IEaj+fbGHqmCgCfHqaGhEltex9utTx7i+h5ddoF44BioFGAa6EJF4q379UG4ZrZbLBQK0yOhA==
X-Received: by 2002:a05:6a21:3287:b0:251:a106:d96c with SMTP id adf61e73a8af0-2602a59dad7mr22452976637.10.1758032273781;
        Tue, 16 Sep 2025 07:17:53 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a7d1:d8f6:b364:5fab])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a3aa47c0sm14534083a12.53.2025.09.16.07.17.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 07:17:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/3] Patch review
Date: Tue, 16 Sep 2025 07:17:45 -0700
Message-ID: <cover.1758032126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 14:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223555

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, September 18

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2381

The following changes since commit 3dd917c52ace30607800f0b70a52a52662dda731:

  wpa-supplicant: fix CVE-2022-37660 (2025-09-09 09:01:30 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Hitendra Prajapati (1):
  go: ignore CVE-2024-24790

Philip Lorenz (1):
  insane: Ensure that `src-uri-bad` fails correctly

Richard Purdie (1):
  insane: Improve patch warning/error handling

 meta/classes/insane.bbclass             | 24 ++++++++++++++++--------
 meta/recipes-devtools/go/go-1.17.13.inc |  3 ++-
 2 files changed, 18 insertions(+), 9 deletions(-)

-- 
2.43.0


