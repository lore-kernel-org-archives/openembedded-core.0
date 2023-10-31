Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5CAC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 22:05:34 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.8372.1698789932204147358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 15:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=blzhVwck;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ba54c3ed97so6271030b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 15:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698789931; x=1699394731; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6RB5onhDfehhV+xbCet/7A7eB217ZeMGDNHzVxyhBf4=;
        b=blzhVwckPej1gm5SgxjclI4rj7MdRzoyYu56JjWWPxzxMe8TIp48zc8iDH3K+0LnEr
         g08/P4lLgIBvrymfsUN7TWKqKqX139LVz4x1geMGeoTDG+mtkfZf32cyVcGVToYKGRZb
         2DrwzM2Y3aTYzG5HtN5kuiPnFs2Fh03iZeW0Z16iuAgkB9rqxzyU/pVUyIdQ/CsMWWcK
         /9s98jdu+no14At7aUcPsAT983Zi1MZh0BNf4GiYeteVFDBpJdSOYM1N81spz3DxeuE7
         e73W7YTpTq/m3OvaX2AVF/1+dHJVaDk6G8EpRNV3qyLEAkV7rL0y39CD3N/3GKrFlHBK
         swUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698789931; x=1699394731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6RB5onhDfehhV+xbCet/7A7eB217ZeMGDNHzVxyhBf4=;
        b=ttWK81cVQYwXyGFY2TOyixo3du+qBBNuOMuluyZzANej32aD+spTGQ3HjPBJFYe7nV
         Y0W9cPyeJi8l0a/QLXFAtdcqn7V3WCSk9dDZz9QFdxvREO8KwWnurQNNEgVGKDJox4fX
         /e3gwbmQMhFGKxmeC9wzZkoHX2DT9dsOw6uOHUYYQQ6y/4EGeT1tGT+MF81cOfWywOAu
         3CV2KF37c4WgeIxo7kfOmx/6smehEhcpMaDilNL7eoY/oS48X+C+KNspP3/UKAB+UQ31
         ua2EFGlq86+jfSLOgw/aSs9SpjVdKB84ZiGEg3RCBeyq65ys61fL7q4oJlkTN7vTBcss
         +e2Q==
X-Gm-Message-State: AOJu0YzG1Wp73oqgGwO8r70YqsEQrHSAk7udlVZajVA3EloY2yCHAx34
	54HyOKcHLKRt7nQN/xi02f1DC7sKAvPuoUEcO1Q4kw==
X-Google-Smtp-Source: AGHT+IGjJjfNGrZTEbcJMaJzbn6EBYE4R+UMzC7LHeLhq7/3SlMoDTvS74fq/oBoHCBxwNRAGh+kMA==
X-Received: by 2002:a05:6a00:3a08:b0:6b1:c1c4:ae98 with SMTP id fj8-20020a056a003a0800b006b1c1c4ae98mr15332208pfb.18.1698789930998;
        Tue, 31 Oct 2023 15:05:30 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c24-20020a62e818000000b0068be3489b0dsm100301pfi.172.2023.10.31.15.05.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 15:05:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/3] Patch review
Date: Tue, 31 Oct 2023 12:05:16 -1000
Message-Id: <cover.1698789786.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189870

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, October 2

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6124

The following changes since commit 56503e3e80603de3b69acef2f6d32836bc9e5e5d:

  linux-firmware: create separate packages (2023-10-29 06:30:03 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Peter Marko (1):
  libxml2: Patch CVE-2023-45322

Soumya Sambu (1):
  libwebp: Fix CVE-2023-4863

Vijay Anusuri (1):
  tiff: CVE patch correction for CVE-2023-3576

 .../libxml/libxml2/CVE-2023-45322-1.patch     | 49 ++++++++++++
 .../libxml/libxml2/CVE-2023-45322-2.patch     | 79 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  2 +
 ...-2023-3618-1.patch => CVE-2023-3576.patch} |  3 +-
 ...-2023-3618-2.patch => CVE-2023-3618.patch} |  0
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  4 +-
 .../webp/files/CVE-2023-4863.patch            | 53 +++++++++++++
 meta/recipes-multimedia/webp/libwebp_1.2.4.bb |  1 +
 8 files changed, 188 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-45322-1.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-45322-2.patch
 rename meta/recipes-multimedia/libtiff/tiff/{CVE-2023-3618-1.patch => CVE-2023-3576.patch} (93%)
 rename meta/recipes-multimedia/libtiff/tiff/{CVE-2023-3618-2.patch => CVE-2023-3618.patch} (100%)
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-4863.patch

-- 
2.34.1


