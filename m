Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432D4CCF9EA
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 02:54:54 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.34.1761706488755193214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 19:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=leYddqk9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-290b48e09a7so80883795ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 19:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761706487; x=1762311287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vd/KvHllDnm4h9hCfBRB4csFG6TcBhqYxIEz421kjn8=;
        b=leYddqk9kCujcSxrGeY1rsBCF1ByqgiIBlQi2sLvvfCbRQTxOasu0opuXAEWaEiA0a
         bD7TMZXoehIx7TSoW2chUKMc1td27sWAxmobXueTsZn6a1dufB3LxXNK36RHLfQGxpX9
         b3ZXLvSVUrolQQcpVYzX0zyyAUrfde+KhJgkrHJUqEGJgrwG6vLGlDsTle4g/25wMg/S
         OA5oksrRQhB2MR3jSovvxJ4fHC8Geb95nFSzSHqgG0+dUxsqYJbYFPYFK/a3fFYCEIyL
         IMgkLlNEh1G0DJ6KqMR60lDJozO3mkLckY+EctA5trY6+M+4lQcCYEl/tKx3Bs4L8SVS
         pv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761706487; x=1762311287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vd/KvHllDnm4h9hCfBRB4csFG6TcBhqYxIEz421kjn8=;
        b=g/K+vIqGGHslTb+CbKRVtxkiGh79snU5yIpPS7cfc+WS4Xg2fySuDV6xRGrDiQq+aV
         taH7T45ziVZHiy9DizZ71H0tTRR7Idqatmo6xeptY4hF8ylLyMok62tkh9oxpIBbJGk6
         /rfb6EIacj5PyKjtDiKaTf8/q5Ka2nRverxC73BFNjQdxj86c+onepcyPLQwUexd32Wz
         5G5KayZowScVeeohdPON1MpGi885WRF2aUvGyJoBgCx401QhoeUlBeRxzz2r0YNbLQmh
         C4EX+8POn/g3nErAi9pMd45WH6gSbosheXwu5oQ5u+puGbp7c+HGv8SPE5GV25JB+RP8
         IVHg==
X-Gm-Message-State: AOJu0Yx1udytHb7XTmhMiyl++mHuzKJmN0jmcunsuza4MfqoOW+i6FGw
	AU9oIrJcTnNxtDDh2XxZ8bgQHpMZntlTM4/S8ToSdDK8LeDIFBckW30z8X+I8wf8MK0oRSq7dfF
	BAZWFBwg=
X-Gm-Gg: ASbGncuwWD2hTjVu2lJjw6yT55rwSYQbS1HvOmYI5UFZAwNiY2ZmuZftKKpKqUSTKJY
	7o9ZzDIMhp1mEJZb/H9VKLSK8AAPgVPyP8qDRObFvQQ6iTVTbXGDVBaNVCuV+r3HJXA9PJ7jkX2
	nYsLldWQfzpNfSj5g1eYfPDDv3pgARjPzpERuxuwrVGq54I16bYLzFQxaKn5O7N9BdnOpBiUeeV
	RnETbaaBkaBd8OUkHdpEKjcvFSsHvoQ2otEjSC3JMRn8OHZ9DEuMPsPYWWaFu30LjvcyYkdqttW
	LxUSyPjKP/slxq2OjxzLeHzGbPHAzvCWGQXVaPnXcbOcjeUfgIHSOBnjb6IEJNDCRBd1vvJrAS3
	UEFuWnSEWG/5EDRBRFG2kFInKm6K7wqY4M+1NeR3NoA5md4q2NdIuZRKq6MV2ioJ7Hug=
X-Google-Smtp-Source: AGHT+IGm4/OuLqiL6XryuzrNEuQ2uvq48EYQi5bSRlkATvBBSwJqskBhw87oxIQs+Gcap7rhxJ453g==
X-Received: by 2002:a17:903:2f8c:b0:24e:3cf2:2453 with SMTP id d9443c01a7336-294def17b11mr13906665ad.61.1761706487344;
        Tue, 28 Oct 2025 19:54:47 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2bae:51f5:3bdc:4c68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d27345sm131058945ad.54.2025.10.28.19.54.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 19:54:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/4] Patch review
Date: Tue, 28 Oct 2025 19:54:26 -0700
Message-ID: <cover.1761692326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 02:54:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225422

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, October 30

Passed a-full on the autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2650

The following changes since commit 9b3dbd691f6ebdbdfe88cef3d3a676ddd1399c63:

  python3: upgrade 3.10.18 -> 3.10.19 (2025-10-17 07:39:27 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Hitendra Prajapati (1):
  git: fix CVE-2025-48386

Peter Marko (1):
  lz4: patch CVE-2025-62813

Yash Shinde (2):
  binutils: fix CVE-2025-11081
  binutils: fix CVE-2025-8225

 .../binutils/binutils-2.38.inc                |  2 +
 .../binutils/0046-CVE-2025-11081.patch        | 84 ++++++++++++++++
 .../binutils/0047-CVE-2025-8225.patch         | 47 +++++++++
 .../git/git/CVE-2025-48386.patch              | 97 +++++++++++++++++++
 meta/recipes-devtools/git/git_2.35.7.bb       |  1 +
 .../lz4/files/CVE-2025-62813.patch            | 69 +++++++++++++
 meta/recipes-support/lz4/lz4_1.9.4.bb         |  4 +-
 7 files changed, 303 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0046-CVE-2025-11081.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0047-CVE-2025-8225.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2025-48386.patch
 create mode 100644 meta/recipes-support/lz4/files/CVE-2025-62813.patch

-- 
2.43.0


