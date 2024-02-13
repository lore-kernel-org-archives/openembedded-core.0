Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E35AC4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 21:43:37 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.26194.1707860616465506343
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 13:43:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sx+40a4b;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e0a4823881so1993933b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 13:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707860616; x=1708465416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Smj5/CB6S8c04pCkhl+uQsnG1KKsRTmMScXSoV6uWtQ=;
        b=sx+40a4bmaObxjT+LtmraSdwBvYoBonWNCgRnAKP57eMf7V0kkeZPe3MgNm1UMo/Qu
         BAzM6m8Vxag2diptYSAyco/OZ3hjo3fyGjdQpvkMS92lHrHgjIH2KPmckOaaBgZQzKis
         lhS5f8Ghwh4pdLGKAf05WilsB/bwWYuucZTOcfR03qTbdzCHxjiZ8E/8mhUU9wS770gf
         YZ5VwU2nbFHFYNm4GaXYNi0m1hgRrI3hl/g7Qfvi3d9xnjzN7rclb5fbx2/u+Kw12U1T
         MlBOfeBUZPDh5P7z7slnes4Fs+g7HPzMhc1+ZmMvmdnO3gomxr2im5ak5QkCpZFHA73x
         73eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707860616; x=1708465416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Smj5/CB6S8c04pCkhl+uQsnG1KKsRTmMScXSoV6uWtQ=;
        b=IYQUZJPjGOgVhTupx+8y7rJS3/W0XT1KGe8O96aeREZrTNO2QtScYWN7RbeaGjTv0A
         MZJmMpppOXCI1iiaktAul/RpEpr3yZCmBxK51NwzETTQ8SPGfs3q2rp/LSZ0uirrKAI1
         QzvhOGBKn0WmM38tKo+QwCkBaIaII/MggHutrDFFr1hXl964TggyJsCsjpb+jje3znzZ
         UtF3KzVD54wocbjKaLW6Lhutc6gGmOW3kauzbGKD0WuWswyuLar9vO/Rrx1UyIP7zWGO
         PvhoPvxXpcsFxhjpoIRcFlQwWOwuTJR9rkEphUW5xYm91OlW5oEKdQ01nSfFoi/d63ph
         qlIw==
X-Gm-Message-State: AOJu0Yy94WiwvwhhmTdxhdfPphfvDj5tBBvcJD/mQtURpsVQCyiK8vIr
	yhrSNwr8GaW533EAqYXxNm91cvpeQC0cFkVFwPFyCWa0s+A7Wh8DgGoBIWpl56o2X3JADW9Bl1V
	C
X-Google-Smtp-Source: AGHT+IErAYm1CC8zRxdwk5ZhWFXSXo76KLrTFZPvc3dRP/vFlLQRrKl8/fRsLzvM4VExO4OBpS6MRQ==
X-Received: by 2002:a05:6a00:2d0d:b0:6e0:6bc7:15ea with SMTP id fa13-20020a056a002d0d00b006e06bc715eamr622397pfb.20.1707860615611;
        Tue, 13 Feb 2024 13:43:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id x37-20020a056a0018a500b006e04efcfbc2sm7767327pfh.74.2024.02.13.13.43.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 13:43:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Patch review
Date: Tue, 13 Feb 2024 11:43:20 -1000
Message-Id: <cover.1707860435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 21:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195429

Please review this set of changes for dunfell and have comments back by
end of day Thursday, February 15

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6564

The following changes since commit 18ae4fea4bf8681f9138d21124589918e336ff6b:

  systemtap: Fix build with gcc-12 (2024-01-25 03:58:24 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Matthias Schmitz (1):
  rsync: Fix rsync hanging when used with --relative

Ming Liu (1):
  go: add a complementary fix for CVE-2023-29406

Peter Marko (1):
  curl: ignore CVE-2023-42915

Vijay Anusuri (1):
  ghostscript: Backport fix for CVE-2020-36773

Zahir Hussain (1):
  cmake: Unset CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES

virendra thakur (2):
  perl: Whitelist CVE-2023-47039
  ncurses: Fix CVE-2023-29491

 .../ncurses/files/CVE-2023-29491.patch        |  45 +++++++
 meta/recipes-core/ncurses/ncurses_6.2.bb      |   3 +-
 .../cmake/cmake/OEToolchainConfig.cmake       |   3 +
 meta/recipes-devtools/go/go-1.14.inc          |   3 +-
 ...023-29406.patch => CVE-2023-29406-1.patch} |   0
 .../go/go-1.14/CVE-2023-29406-2.patch         | 114 ++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.30.1.bb     |   4 +
 ...lative-when-copying-an-absolute-path.patch |  31 +++++
 meta/recipes-devtools/rsync/rsync_3.1.3.bb    |   1 +
 .../ghostscript/CVE-2020-36773.patch          | 109 +++++++++++++++++
 .../ghostscript/ghostscript_9.52.bb           |   1 +
 meta/recipes-support/curl/curl_7.69.1.bb      |   3 +
 12 files changed, 315 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2023-29491.patch
 rename meta/recipes-devtools/go/go-1.14/{CVE-2023-29406.patch => CVE-2023-29406-1.patch} (100%)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29406-2.patch
 create mode 100644 meta/recipes-devtools/rsync/files/0001-Fix-relative-when-copying-an-absolute-path.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2020-36773.patch

-- 
2.34.1


