Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40743C3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 15:58:11 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.105636.1747238287093746254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 08:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2X97euvk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22e45088d6eso87941155ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747238286; x=1747843086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tga5u+pFBSmsUC/pddkes5TvoKt1ZnvqO0orj+HBntU=;
        b=2X97euvk8j/mK4r6uCoFG+8w7isksueAM3GLWE0lmnGpEBg6TUPN8tx0wWLbMRIh8G
         2bYErTZpvvfF9hr63jN/VPTgDa1QBFaq1m/oPAtvrKLKOYLgx8DEb6gapGi/GLhcfAt9
         KJ1n3feELV3eW6KHPz18nrApgv0HzluOi5GXl5HTLMWAZYuf3cZAUsh246qn+sgRTiab
         P2vafzG7aHw8u3IDxVZi/5x5zMyD8XUGiMvZp6xudfKxPP7qwgJ+1LFSTCfb6bbDYP3O
         Qn+Ww8t+16dhhpHLAsS/OAw6DDLIYuhNirUm+5L8ySyr1aQJCasNhQo2DogYPgsTrJ+F
         nR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747238286; x=1747843086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tga5u+pFBSmsUC/pddkes5TvoKt1ZnvqO0orj+HBntU=;
        b=ETdpY0crTQOCUaSPbzpIp859qAPeFGsWdsTYWewRtkV4aeszaL+1dpKcT3J1OXwVNl
         cxfLwp+OYrF1q5wsNVb1o9womvDC3JIAdI6T3LAZC9TYZcuZHIRgySq43me4skv2+LJU
         CGIhzLACo/Ue28R3wWR7uYL4PcXFuWmGZSLyjZrAGA+47xVCEI5KBCSzLxA1ViAj1rkC
         g0dLAFzzJ0JnsN/PrfFdOXGtXAVjjc3vFNRcX4MmemITzB5RkY3wKfI75OvGPv5nKHpQ
         e0TFGXbjx4r84o+yuOdMmntSH3cwJUuY8U/31DJlyDblOBH1Savo43X+GjiN0wk/6gmh
         suaw==
X-Gm-Message-State: AOJu0YwcqoJ37ltxFRQ7wHv+ci9rhVo+Z0dJWfn2ZSsYGe8ETtRrZ/pu
	hxkYAoGVFwKw2eeBeELdOqLZNUNnBiThNTsSXB7KUJMvUadSFxYPrkSFJemg0Tyiv0veVGQ674J
	m
X-Gm-Gg: ASbGncvGLt4MRrIWgde7wuWcEzkCXDCwSeNy8EMCMQOsUXv0uNAk8Y9RwGaV4qXjwFh
	S6+7yD9h/ypXXmgQ6iLOLHBZYXA/Ms1/nWo3ElQXO2a7VDRtub98dA7O2TdfnguW24LUF0NCuns
	uII2jmb1MQyQwZaMFtFqdlcKpAvS+rB37en3wP68WiW4vM2xQFHVclWr1J5IPcVe0j7/B6w6Iuw
	uywm0HLbzMGEUne2g+HyJu3kwEtsjcAqDfNzIfGHyJYrhPgQAIFe3of/W1RFbIZxg1ptIVCaukG
	Dfwuq42lTsv2bxQNw0IY7SRMbxzTVnrRk9V6oIazlYTUvyCRTGY=
X-Google-Smtp-Source: AGHT+IFNulgOZhrURdrLtXspJHqS0nnafmgyCb4xLrKtfccp5GdZiGK7h5qSfsINHg81JNrD8tMe2A==
X-Received: by 2002:a17:903:3baf:b0:22e:5df9:8f67 with SMTP id d9443c01a7336-23198129730mr65162105ad.34.1747238286183;
        Wed, 14 May 2025 08:58:06 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:671:bf16:d45b:ad8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271bcfsm101347385ad.125.2025.05.14.08.58.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:58:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 00/12] Patch review
Date: Wed, 14 May 2025 08:57:48 -0700
Message-ID: <cover.1747238138.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216504

Please review this set of changes for walnascar and have comments back by
end of day Friday, May 16

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1584

The following changes since commit 5e594b3d074900580fa83ca50f7d837937c17856:

  gobject-introspection: Fix wrong PN used in MULTILIB_SCRIPTS (2025-05-08 13:19:12 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 5.2

Alon Bar-Lev (1):
  module.bbclass: add KBUILD_EXTRA_SYMBOLS to install

Archana Polampalli (4):
  ffmpeg: fix CVE-2025-22921
  perlcross: 1.6 -> 1.6.2
  perl: upgrade 5.40.0 -> 5.40.2
  go: upgrade 1.24.1 -> 1.24.2

Changqing Li (2):
  libsoup-2.4: fix CVE-2024-52532
  icu: set ac_cv_path_install to ensure install tool reproducibility

Deepesh Varatharajan (1):
  binutils: stable 2.44 branch updates

Peter Marko (1):
  go: upgrade 1.24.2 -> 1.24.3

Yogita Urade (1):
  webkitgtk: upgrade 2.48.0 -> 2.48.1

rajmohan r (1):
  glibc-y2038-tests: remove glibc-y2038-tests_2.41.bb recipe

 meta/classes-recipe/module.bbclass            |    1 +
 meta/conf/distro/include/maintainers.inc      |    1 -
 .../distro/include/ptest-packagelists.inc     |    2 -
 meta/conf/distro/include/time64.inc           |    2 -
 .../glibc/glibc-y2038-tests_2.41.bb           |  107 -
 meta/recipes-core/glibc/glibc/run-ptest       |   37 -
 .../binutils/binutils-2.44.inc                |    3 +-
 .../binutils/0015-CVE-2025-1153.patch         | 3355 -----------------
 .../go/{go-1.24.1.inc => go-1.24.3.inc}       |    2 +-
 ...e_1.24.1.bb => go-binary-native_1.24.3.bb} |    6 +-
 ..._1.24.1.bb => go-cross-canadian_1.24.3.bb} |    0
 ...{go-cross_1.24.1.bb => go-cross_1.24.3.bb} |    0
 ...osssdk_1.24.1.bb => go-crosssdk_1.24.3.bb} |    0
 ...runtime_1.24.1.bb => go-runtime_1.24.3.bb} |    0
 .../go/{go_1.24.1.bb => go_1.24.3.bb}         |    0
 .../{perlcross_1.6.bb => perlcross_1.6.2.bb}  |    2 +-
 .../perl/{perl_5.40.0.bb => perl_5.40.2.bb}   |    2 +-
 .../ffmpeg/ffmpeg/CVE-2025-22921.patch        |   34 +
 .../recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb |    4 +-
 ...04-main-7ffc29624258-.-https-bugs.we.patch |   75 -
 ...or-no-matching-function-for-call-to-.patch |   77 -
 ...ebkitgtk_2.48.0.bb => webkitgtk_2.48.1.bb} |    4 +-
 meta/recipes-support/icu/icu_76-1.bb          |    6 +-
 .../libsoup-2.4/CVE-2024-52532-1.patch        |   37 +
 .../libsoup-2.4/CVE-2024-52532-2.patch        |   43 +
 .../libsoup-2.4/CVE-2024-52532-3.patch        |   48 +
 .../libsoup/libsoup-2.4_2.74.3.bb             |    5 +-
 scripts/install-buildtools                    |    4 +-
 28 files changed, 183 insertions(+), 3674 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
 delete mode 100755 meta/recipes-core/glibc/glibc/run-ptest
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1153.patch
 rename meta/recipes-devtools/go/{go-1.24.1.inc => go-1.24.3.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.24.1.bb => go-binary-native_1.24.3.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.24.1.bb => go-cross-canadian_1.24.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.24.1.bb => go-cross_1.24.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.24.1.bb => go-crosssdk_1.24.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.24.1.bb => go-runtime_1.24.3.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.24.1.bb => go_1.24.3.bb} (100%)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.6.bb => perlcross_1.6.2.bb} (92%)
 rename meta/recipes-devtools/perl/{perl_5.40.0.bb => perl_5.40.2.bb} (99%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.48.0.bb => webkitgtk_2.48.1.bb} (96%)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch

-- 
2.43.0


