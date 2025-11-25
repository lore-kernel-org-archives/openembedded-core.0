Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E87D0EE37
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:59:00 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4276.1764104337429567633
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:58:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=k6r3G4Fc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso154329b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 12:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764104337; x=1764709137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+GERHN+REgacm9cA+4pgquSgcXS3nq+OreHILhFCxbU=;
        b=k6r3G4Fc4fwQKZ1E1kiUm9GUpIflo9QIvcx/SGDw7kaBj1LYxNpRp2Gbf0iqPXOPlM
         15WZqECPlE+WSfLxBEKu1ywXQ/T1+qYm95qDoazGfCGPZ/WrVaNURtvdJ6+oVTclgoWG
         Ov8jrJXRaWgDmmDoQ1Jd4Vzv20NEWkCDoVn5WwzQr4uGmpNXpvJBZo4qGEjVbF9Mlkk7
         rOESX60qSZCEahqH650+zt+wrMHdkRXKxyCVr5jcKxQI2MPEsabJLlRiGFH1V7Pasv1y
         n/ipztHT/uzTo6NBnc2AnUTzHi/ewdA4PN2kayl7RYcgzDwOHeDX9Js5Yd1qJ1X2wF5Z
         8q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104337; x=1764709137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+GERHN+REgacm9cA+4pgquSgcXS3nq+OreHILhFCxbU=;
        b=pNX3CvF2N6PmIYZGzvkqLzWpsjbqTebzVuT2IAPCUfQLYHOWGPFXhdzXw8MV4rL1vx
         GCKDlfJnHcwEqNoqC/GZ3+nqskm+OSavJdMr6qAxpNztXOdbCyE3+sRI16Porf9bnGCG
         rG6GOLVhNbzs7gay4dqN3CEybhVVwUWTXBI5izq21ByBBdatNzhbKCPViAODAm0ll8AC
         ONmnFUgxy1GimQi0/xFPdDtu4b3sE9X9xbmda/ggg2DpVpatnULpRNNN4PmF2FtWVf51
         A7VAH/KzwFwy1NjzDj6FKcZAc9tAxP34QNrvkmM9JHFzX+ETp3R79dxBIo7y6j7svbLA
         /sVw==
X-Gm-Message-State: AOJu0Yyxfq2nasJUn31hGOWSer1ZfBMoVRngwCiChDjKzti8U1lhLQki
	jNNtCJNIczdZRfeBdt0iNGbTNWBJNyicSWT1Q1KwK0o71EmRpLw9F0gKf0j6+C3GGWWIy7CN8g7
	JKdxx
X-Gm-Gg: ASbGncuH8D4Br8YhiUmOkPgdjKPlkTzO8kcFWI8EoQOrHe6i6AeMTNk9Hlei2wwC59o
	Os2qIcQiEOv8dixDqg+umAx4E7X6+rUYHPuB0t7gh0a0EpYOBKFyxlX0vteU/iKtgLLRi3RJn6i
	rweOiJlCxqH6uOJYTwJEQG+Sm5KR186FEaxMMXV/W18kBH4+BdxLD2U7bDk4LVWJUCHIuBfCPJ+
	S2aPr7BMkQj2ChD+zG8O56NkStaCILDf1rYWAynvbmdh9tWYpnzYEAd1oP56sAImeUhKp3KyNE9
	HIQG2XNCpQ1DEoPwNA3WVtPkFiOR97XUkzcKsmUuIhPFSEei61NrsPmmDiOeQPN/uN65mVbZ24c
	350DsfauEmxNuWVzIF4j+29kZ5G8JppedbiK/3/P+glYUjBEOPa9TisFkCVIsBRKQmuMW5Dg8Qt
	4Sgg==
X-Google-Smtp-Source: AGHT+IEjrcQ+mgVHeYyrz6/9PojSJwE8kwuSPetF7dvq3CDqOUmi9zcr605xE8cQe2EUwNLDMk9xTw==
X-Received: by 2002:a05:6a20:6a26:b0:35d:c88e:4603 with SMTP id adf61e73a8af0-3613e396aefmr23616784637.3.1764104336612;
        Tue, 25 Nov 2025 12:58:56 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6346sm17340755a12.4.2025.11.25.12.58.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:58:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/9] Patch review
Date: Tue, 25 Nov 2025 12:58:38 -0800
Message-ID: <cover.1764104199.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 20:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226785

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, November 27

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2770

The following changes since commit 7cfacaee1b3319e561036512a849e762d0f68a5e:

  oeqa/sdk/buildepoxy: skip test in eSDK (2025-11-20 06:46:31 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Benjamin Robin (Schneider Electric) (5):
  spdx30: provide all CVE_STATUS, not only Patched status
  vex.bbclass: add a new class
  cve-check: extract extending CVE_STATUS to library function
  spdx: extend CVE_STATUS variables
  vex: fix rootfs manifest

Kai Kang (1):
  Revert "spdx: Update for bitbake changes"

Peter Marko (3):
  libarchive: patch 3.8.3 security issue 1
  libarchive: patch 3.8.3 security issue 2
  libarchive: patch CVE-2025-60753

 meta/classes/cve-check.bbclass                |  17 +-
 meta/classes/spdx-common.bbclass              |   5 +
 meta/classes/vex.bbclass                      | 319 ++++++++++++++++++
 meta/lib/oe/cve_check.py                      |  22 ++
 meta/lib/oe/spdx30_tasks.py                   | 156 ++++-----
 meta/lib/oe/spdx_common.py                    |   2 +-
 ...request-2696-from-al3xtjames-mkstemp.patch |  28 ++
 ...st-2749-from-KlaraSystems-des-tempdi.patch | 186 ++++++++++
 ...st-2753-from-KlaraSystems-des-temp-f.patch | 190 +++++++++++
 ...-request-2768-from-Commandoss-master.patch |  28 ++
 .../libarchive/CVE-2025-60753.patch           |  76 +++++
 .../libarchive/libarchive_3.7.9.bb            |   5 +
 12 files changed, 942 insertions(+), 92 deletions(-)
 create mode 100644 meta/classes/vex.bbclass
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2696-from-al3xtjames-mkstemp.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2749-from-KlaraSystems-des-tempdi.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2753-from-KlaraSystems-des-temp-f.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2768-from-Commandoss-master.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-60753.patch

-- 
2.43.0


