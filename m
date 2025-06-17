Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BA9C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:04:43 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.23160.1750176274414682806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sM/uFiKY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-235f9ea8d08so58460885ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750176274; x=1750781074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kqPYWdbOX0+EPNWdgzS2lhlaDWZUyeku2wowja6vCrs=;
        b=sM/uFiKY3kovha3hi8OQHPM7OMshwnZEhkXhO90nLxdJQ67Z1vpbsAB86EncF+s3bM
         4x+eB9cd2G+WaDeGC0kcENUBcmh87uYG1d+7HCHZNoqt44wuEBjpoYQC3O+eZI/RkNfH
         tPA212TCPcdqMfpWye7928LyvA2Q5Y0977MkqzTpg4hWw8mUYRWMVGroCy0kS3aanBoK
         NinG2A7pcSXOigLHxeDYwXNFivy9Rh5xKBVM5MHRuXtNri/ertgPBUqICcicI4O1Ljmt
         LryqSyhwvrAccFjL9VNOgoS+ORrdsumX6aACV3kqx5NDhK9fikEFvZeEoWj6Swz4wKJk
         DpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176274; x=1750781074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kqPYWdbOX0+EPNWdgzS2lhlaDWZUyeku2wowja6vCrs=;
        b=XdD8MF6amIfl5Uo8v1GRpDfKYwndadQkm8R/5c44cCrHsc4lx0jq63LF5PNP8JvZYa
         YyLm2ORswBUuAPRc7CRz/HIYM8jQn8WGExoAsSBk4GOTj042BTkil0HkfRHoyZLufdCS
         gzppoqFZrjMtHSJp/IDiUSVi3lzu4FYcHMC6fLj9i7zve+eMKy94PUszt9BSl+xIz643
         nYU0Os60CAtl69BD1qn3q34RI5nFrfHysHZmCxnUdUl+XHvij0R+vLCaOuuUsF25Gc0w
         uDWvB//BYQxWfYiVtuT0J8J66UxxdAPUCfQ5IpboFH8djg/gEH7isdnv/OrWHeWcHfbL
         cMvw==
X-Gm-Message-State: AOJu0YwFJtN9V4S6TrGpZer0gG4gHmp15muYizUF5Fa7o3QPW4saPPoN
	tWu36w2bpLX/ZkVSTAK9dPs5viG8JPVjJFaxMWIP8DCBvSmahzDIx2OOpKZd2ZNo2xFvh4HYyjY
	vIw9Q
X-Gm-Gg: ASbGncusojBzqj2RGHyyrhP+iysxZ3VuYLn2dppCLPbCg+iEQkYSlkU9dcAP74qZeHH
	NvszGTCLWhvotKX4qgZjBS64ADUGe/MavPUN9gfhwlwf9BWv9B5qOjfQHU2qbUcwnRHd63X8ZBM
	C3dfOez3qSeBH3hz5/tX7i2HDd6KmArJaJoJR2kYxwTWLyYjj3ZbrOQzcylE7SeOY78wbhN49CU
	ZIFXHg2prYhkI8Gyxt/K2vR+91MsQ42FIwDRXRQwKhBmc4MITPEK+NE2p5L0fC+mq5adelhWZhX
	Dix0f8ByNA9/dIdyLDKQuhY+hpWnQolOA5ejSNlgB8sTDrenMTujRg==
X-Google-Smtp-Source: AGHT+IHEMcvHzpNPSu4/9GDe153eNshNp176kmBwA9iaAhI/Coiw13SLMhWhVb5fu0AZH92/ldsQ9Q==
X-Received: by 2002:a17:902:cccd:b0:235:f298:cbbe with SMTP id d9443c01a7336-2366afe481cmr248300835ad.12.1750176272999;
        Tue, 17 Jun 2025 09:04:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365decaf71sm82043365ad.217.2025.06.17.09.04.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:04:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/8] Patch review
Date: Tue, 17 Jun 2025 09:04:18 -0700
Message-ID: <cover.1750176125.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:04:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218901

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, June 19

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1820

The following changes since commit f7ee6db8ca5dc72b7a468531e31403b60e6a0020:

  testimage: get real os-release file (2025-06-09 08:06:42 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 5.0.10

Colin Pinnell McAllister (1):
  ffmpeg: fix CVE-2025-1373

Deepesh Varatharajan (1):
  gcc: Upgrade to GCC 13.4

Jiaying Song (1):
  python3-requests: upgrade 2.32.3 -> 2.32.4

Peter Marko (1):
  net-tools: patch CVE-2025-46836

Poonam Jadhav (1):
  libpng: Add ptest

Sandeep Gundlupet Raju (1):
  tune-cortexr52: Remove aarch64 for ARM Cortex-R52

Savvas Etairidis (1):
  systemd: Rename systemd_v255.21 to systemd_255.21

 meta/conf/distro/include/maintainers.inc      |   2 +-
 .../distro/include/ptest-packagelists.inc     |   1 +
 .../include/arm/armv8r/tune-cortexr52.inc     |   5 +-
 .../{systemd_v255.21.bb => systemd_255.21.bb} |   0
 .../gcc/{gcc-13.3.inc => gcc-13.4.inc}        |   8 +-
 ...ian_13.3.bb => gcc-cross-canadian_13.4.bb} |   0
 .../{gcc-cross_13.3.bb => gcc-cross_13.4.bb}  |   0
 ...-crosssdk_13.3.bb => gcc-crosssdk_13.4.bb} |   0
 ...cc-runtime_13.3.bb => gcc-runtime_13.4.bb} |   0
 ...itizers_13.3.bb => gcc-sanitizers_13.4.bb} |   0
 ...{gcc-source_13.3.bb => gcc-source_13.4.bb} |   0
 ...ix-c-tweak-for-Wrange-loop-construct.patch | 113 ----
 ...4fffe3fc82a710bea66ad651720d71c938b8.patch | 549 ------------------
 .../gcc/{gcc_13.3.bb => gcc_13.4.bb}          |   0
 ...initial_13.3.bb => libgcc-initial_13.4.bb} |   0
 .../gcc/{libgcc_13.3.bb => libgcc_13.4.bb}    |   0
 ...ibgfortran_13.3.bb => libgfortran_13.4.bb} |   0
 ...s_2.32.3.bb => python3-requests_2.32.4.bb} |   2 +-
 .../net-tools/CVE-2025-46836-01.patch         |  91 +++
 .../net-tools/CVE-2025-46836-02.patch         |  31 +
 .../net-tools/net-tools_2.10.bb               |   2 +
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.2.bb |   4 +
 .../recipes-multimedia/libpng/files/run-ptest |   7 +
 .../libpng/libpng_1.6.42.bb                   |  42 +-
 scripts/install-buildtools                    |   4 +-
 25 files changed, 185 insertions(+), 676 deletions(-)
 rename meta/recipes-core/systemd/{systemd_v255.21.bb => systemd_255.21.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-13.3.inc => gcc-13.4.inc} (94%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_13.3.bb => gcc-cross-canadian_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_13.3.bb => gcc-cross_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_13.3.bb => gcc-crosssdk_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_13.3.bb => gcc-runtime_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_13.3.bb => gcc-sanitizers_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_13.3.bb => gcc-source_13.4.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch
 rename meta/recipes-devtools/gcc/{gcc_13.3.bb => gcc_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_13.3.bb => libgcc-initial_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_13.3.bb => libgcc_13.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_13.3.bb => libgfortran_13.4.bb} (100%)
 rename meta/recipes-devtools/python/{python3-requests_2.32.3.bb => python3-requests_2.32.4.bb} (91%)
 create mode 100644 meta/recipes-extended/net-tools/net-tools/CVE-2025-46836-01.patch
 create mode 100644 meta/recipes-extended/net-tools/net-tools/CVE-2025-46836-02.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/run-ptest

-- 
2.43.0


