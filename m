Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92076EE7FFD
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 13:47:17 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.39138.1694180831047881292
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 06:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oFfpMXzj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68a56401b9aso1840312b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 06:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694180830; x=1694785630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6d07yc1qGU/S5shd2jl9utqjAcyz+eYJtrnUtl3LVTw=;
        b=oFfpMXzjIJphmALkJETWYgrxI5wKx/Y3LWWRulW69qFyO6QS+L/M/+v53Yyg6q5acn
         q5cFejT+LumjsMiVbOs/RIeagyzg1DBNBnZeRRZGzL0/16oGq1JaKPbQo03cDCmJAHSQ
         WjpO3oUh/DRxbGcH+lSXU41dQellv6bVvbviumT4b5zNSLYsa4akGHsVc2XbiEOyrZsG
         a47S2YjBVRp7tyY4KepY+Q3Vokj9dnrStbqLrt2p1K497bwZNBdABj+reP9cpBbr/54s
         AQeCx3Xnrcs0FNJtTRbuXqWfiyzNWK3GozbI9wxr3ptNzQJ1optp6EejRhfgEIVIKxIp
         4VcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694180830; x=1694785630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6d07yc1qGU/S5shd2jl9utqjAcyz+eYJtrnUtl3LVTw=;
        b=XZK88FONbs0W6tdbNmXnkO0lwXz5M9W4+6xNAOG//w6ty+2k0j2nyTMkKutf8FnRlb
         agoN5KSBCx8nf8+J4x56zskxrN49Rrour06D++XWRZj+OmaL1uQyYYiRkTANMvtzwLRR
         FROySN/gy1KNVFg9+2tN0As9x0b2DDHABjAlPrqpylc8Tsyr/EJchB2yZleifD6/wOdd
         nMsMNPV1N+OPFjvlG7aL5fXESctoPX3iWDTOvlfb7gbGzRmTntZLp32gQRuXCL3Zzx0V
         W1YGV5n9ZnwWe1FvY16q5UpZdww3l8fuFzSMRDzZpOOeHS0whidEVLJrruyxkRwC4V0e
         AJQQ==
X-Gm-Message-State: AOJu0YyzZAvuO55p1/uUA5wdcrVzSa0eT5CQImsYiaYZD75FQSknZr50
	dG+QMMqA9aPoyXJQjzZSdS6qikJjvFm4r4oGQ1o=
X-Google-Smtp-Source: AGHT+IFeeaewSlYEiUDNAM8vOAMeDMgczOwQO8IJcE7xbbB9bseR5x/hIvDpxA+0SrgTSLxvB7r4Uw==
X-Received: by 2002:a05:6a20:430c:b0:126:9081:2156 with SMTP id h12-20020a056a20430c00b0012690812156mr3063981pzk.4.1694180829756;
        Fri, 08 Sep 2023 06:47:09 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id x18-20020a056a00271200b00653fe2d527esm1344828pfv.32.2023.09.08.06.47.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 06:47:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 0/9] Patch review
Date: Fri,  8 Sep 2023 03:46:51 -1000
Message-Id: <cover.1694179812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 13:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187422

Please review this set of changes for mickledore and have comments back by
end of day Tuesday, September 12

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5856

The following changes since commit 981fa51afe040550c7c351fff028553d4bbbd1ca:

  vim: update obsolete comment (2023-08-29 06:47:33 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Alexander Kanavin (2):
  python3: upgrade 3.11.2 -> 3.11.3
  python3: update 3.11.3 -> 3.11.4

Chee Yang Lee (2):
  libssh2: fix CVE-2020-22218
  python3: update to 3.11.5

Kai Kang (2):
  webkitgtk: fix CVE-2023-32439
  webkitgtk: fix CVE-2023-32435

Michael Halstead (1):
  yocto-uninative: Update to 4.3

Sakib Sajal (1):
  go: upgrade 1.20.6 -> 1.20.7

Yogita Urade (1):
  nghttp2: fix CVE-2023-35945

 meta/conf/distro/include/yocto-uninative.inc  |   8 +-
 .../go/{go-1.20.6.inc => go-1.20.7.inc}       |   2 +-
 ...e_1.20.6.bb => go-binary-native_1.20.7.bb} |   6 +-
 ..._1.20.6.bb => go-cross-canadian_1.20.7.bb} |   0
 ...{go-cross_1.20.6.bb => go-cross_1.20.7.bb} |   0
 ...osssdk_1.20.6.bb => go-crosssdk_1.20.7.bb} |   0
 ...o-native_1.20.6.bb => go-native_1.20.7.bb} |   0
 ...runtime_1.20.6.bb => go-runtime_1.20.7.bb} |   0
 .../go/{go_1.20.6.bb => go_1.20.7.bb}         |   0
 ...-search-system-for-headers-libraries.patch |   2 +-
 ...e-stdin-I-O-errors-same-way-as-maste.patch |  12 +-
 ...-use-prefix-value-from-build-configu.patch |   2 +-
 ...tutils-prefix-is-inside-staging-area.patch |   2 +-
 .../python/python3/makerace.patch             |   8 +-
 .../{python3_3.11.2.bb => python3_3.11.5.bb}  |   2 +-
 .../webkit/webkitgtk/CVE-2023-32435.patch     |  59 +++++++
 .../webkit/webkitgtk/CVE-2023-32439.patch     | 128 +++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.38.6.bb  |   2 +
 .../libssh2/libssh2/CVE-2020-22218.patch      |  34 ++++
 .../recipes-support/libssh2/libssh2_1.10.0.bb |   1 +
 .../nghttp2/nghttp2/CVE-2023-35945.patch      | 151 ++++++++++++++++++
 .../recipes-support/nghttp2/nghttp2_1.52.0.bb |   1 +
 22 files changed, 398 insertions(+), 22 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.6.inc => go-1.20.7.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.6.bb => go-binary-native_1.20.7.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.6.bb => go-cross-canadian_1.20.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.6.bb => go-cross_1.20.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.6.bb => go-crosssdk_1.20.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.6.bb => go-native_1.20.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.6.bb => go-runtime_1.20.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.6.bb => go_1.20.7.bb} (100%)
 rename meta/recipes-devtools/python/{python3_3.11.2.bb => python3_3.11.5.bb} (99%)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2023-32435.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2023-32439.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2020-22218.patch
 create mode 100644 meta/recipes-support/nghttp2/nghttp2/CVE-2023-35945.patch

-- 
2.34.1


