Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B6DCA0EE5
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 21:29:03 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.7877.1755120536400776563
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 14:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ihi8pP11;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2430c5b1b32so10504595ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 14:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755120536; x=1755725336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5HcAnWhhQV/+ejm6Kinb4WzVzzFz9utvgK2m35QvbHo=;
        b=Ihi8pP11xbDgJORgenPRG2RK7p2jeCM7PINMZDfip9BpMOeKKAmTdW6oBGAydM9fJl
         tSWqf0E1vzt3EV2o8ZU/NK3tXpw++nbJ+4WxlrpGY1IhlOgpEo9gxy7VMDrqt2Ap2zU/
         wA/6g29gaJWKHacZWDIYkgys4XHIucIZtbwfC59mk8y0nNHmuf5bBBcO1+sZF4QWxert
         6Qti7EZoEfnk1I2hldCn1mYfN9t8jcc+M19yGkeDqPCIzsLlB6fo350S2OOfrWabWn0k
         NBtxQQMN9wyUu9R9iM5eG4KCEmIqDmvDl2vOSJFo/1zWDl0aIxONE08JLosHxhkfoPDf
         MU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755120536; x=1755725336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5HcAnWhhQV/+ejm6Kinb4WzVzzFz9utvgK2m35QvbHo=;
        b=wscnjmufAS8AxeQxLWFbBCq0XayzxltSNe4gzdgfLY9O9yflVdUsfxOq77sEI/IEpy
         HWd9jBcr9cZXF3+vDgiAw/n/RNCjROmrrK0oszEF6TbLurd7SebJYQcaKtBUKNkzTuMM
         hziiAGM53ytdp9au6W0ntzO70SA25SDU8aHcTZnodsz2EEsOeZqRjBrLl/FRScGnIu10
         FhTy6qKwr4qhBHPGwHIb0Tlte4Cof/xmuVR/3TSYQt4tu66gEm3u959kItqPzN9OhAwc
         TRvKrLtwy99wODUyRJZ1UJvswgxG+7CiKajmO6/h7Mz5I96m7pmiUP4SFfPpZc6NH+mk
         QwmA==
X-Gm-Message-State: AOJu0YzieOrCp1XcbLfu9olZ71BKgvZmMfKSgRevbf6vQK3SQVayl2Q5
	Vq9CP6nEz/xSSO7V6ppiLEICybw+df5qdi9mcKSVKDoWSCZdpuInfjOF7MFJfUkJQrDhrQFo2Wu
	UHr9m
X-Gm-Gg: ASbGncsfJvNwFD/jBYRBsuLKMGaB+72GG/0Z+HtlKPU3mi57mmGUBWxApzUxgPl0F0r
	49loIQnF3rzBjdJfPCYFWwG2FHiYH6oHbMVLQDOg8fbPpNH3wyA722mVkpxM3mSOdCCsMkf7GQz
	FNxxdTp1vIlkEMmrL39Eid6OsD+UTPwyq5b5EO7VeNjOr7MUuBoq2CjBO+RxUXenP8v6Z+TP0rZ
	OTXsg50Np8bvGoON1ARqq8wkuGpYMa6+TcQ8Wh7g1v+sRaaDSUSF3NEeTn+Pf9b9P0cKN034XOF
	gjXStRlvtMgpPDUU4T0ltimMXuI+p0fmmQGfmyW03IgOtYLuCsmxAl3IiDwv1Mexdh2KfYOopcz
	853IsvEULADnNyg==
X-Google-Smtp-Source: AGHT+IFgvdySIIOmM8mYeQTZNsAN9KOlLmS8tgB+F3pEvFNZZSwuAPK3c0tJkVuvaYLwlbsLYxca7A==
X-Received: by 2002:a17:902:cf03:b0:242:5f6c:6b4e with SMTP id d9443c01a7336-24459b058bfmr3064675ad.7.1755120535530;
        Wed, 13 Aug 2025 14:28:55 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:38b9:9a51:8a43:9529])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a48esm336178545ad.114.2025.08.13.14.28.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 14:28:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/8] Patch review
Date: Wed, 13 Aug 2025 14:28:41 -0700
Message-ID: <cover.1755102550.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221831

Please review this set of changes for kirkstone and have comments back by
end of day Friday, August 15

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2196

The following changes since commit bd620eb14660075fd0f7476bbbb65d5da6293874:

  build-appliance-image: Update to kirkstone head revision (2025-08-08 06:31:30 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Guocai He (1):
  gnupg: disable tests to avoid running target binaries at build time

Hitendra Prajapati (1):
  libxslt: fix CVE-2023-40403

Peter Marko (3):
  python3: patch CVE-2025-8194
  go: ignore CVE-2025-0913
  libarchive: patch CVE-2025-5918

Quentin Schulz (1):
  go-helloworld: fix license

Yogita Urade (2):
  tiff: fix CVE-2025-8176
  tiff: fix CVE-2025-8177

 meta/recipes-devtools/go/go-1.17.13.inc       |   2 +-
 .../python/python3/CVE-2025-8194.patch        | 219 +++++++++++
 .../python/python3_3.10.18.bb                 |   7 +-
 .../go-examples/go-helloworld_0.1.bb          |   4 +-
 .../0001-FILE-seeking-support-2539.patch      | 190 ++++++++++
 .../0001-Improve-lseek-handling-2564.patch    | 320 ++++++++++++++++
 .../libarchive/libarchive/CVE-2025-5918.patch | 217 +++++++++++
 .../libarchive/libarchive_3.6.2.bb            |   3 +
 .../libtiff/tiff/CVE-2025-8176-0001.patch     |  61 +++
 .../libtiff/tiff/CVE-2025-8176-0002.patch     |  31 ++
 .../libtiff/tiff/CVE-2025-8176-0003.patch     |  28 ++
 .../libtiff/tiff/CVE-2025-8177.patch          |  35 ++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   4 +
 meta/recipes-support/gnupg/gnupg_2.3.7.bb     |   1 +
 .../libxslt/libxslt/CVE-2023-40403-001.patch  | 257 +++++++++++++
 .../libxslt/libxslt/CVE-2023-40403-002.patch  | 147 ++++++++
 .../libxslt/libxslt/CVE-2023-40403-003.patch  | 231 ++++++++++++
 .../libxslt/libxslt/CVE-2023-40403-004.patch  | 349 ++++++++++++++++++
 .../libxslt/libxslt/CVE-2023-40403-005.patch  |  55 +++
 .../recipes-support/libxslt/libxslt_1.1.35.bb |   5 +
 20 files changed, 2160 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-8194.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-FILE-seeking-support-2539.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Improve-lseek-handling-2564.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5918.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0001.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0002.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176-0003.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2023-40403-001.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2023-40403-002.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2023-40403-003.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2023-40403-004.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2023-40403-005.patch

-- 
2.43.0


