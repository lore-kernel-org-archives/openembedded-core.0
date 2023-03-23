Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA14C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 21:04:52 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.85115.1679605491254181872
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 14:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=kFkmEzFC;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso3224213pjb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 14:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679605490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RU39GFMkYqrSgNOv7jiUjB1qLeU/p6is7CarPGMdTFc=;
        b=kFkmEzFCqyTh3rZ8nmaTASwDiVjtMiG3MnVficlm6OCdcZ9iw4uY4fXqMRtRN/WxAi
         mdBXOlRBLUxyMoSvceTK7fUcofkpFEnMLsgSB2VgONutJGushuBMI3suqrX+FrYtursS
         fonnhL5LaYaMg7Yl2x3OlcYtGxgbELKti3IN+kVZnxWHtawmR5vdrJOcQVu4cj+o/cmo
         e9ZNfULgEXj50ScwffC+97j4hV1OEsxz9eu2kRTJEeWQgH/XmSzielH/GeCSnvWRGCh2
         HFV7ReI3zOr0XRXkl3uZuE42VaPYLrztGwKjaldHI4D4E+jJQhJlsBVosX26bykCnzTd
         fDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679605490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RU39GFMkYqrSgNOv7jiUjB1qLeU/p6is7CarPGMdTFc=;
        b=a+RdaI1jWCa8nnMNH3tkp5moWMyqzqyVRuxkAgzCCZN7o16V/PF5i/EW3BDK7xyLrG
         Db1d5KihiTZNkKINUj3g3+VewN+YzYPRYqZysiqwyZECXeuaDnz8oRbsIqiDGham1b3m
         ei5TCpALXSR2YOI3cdeKFQV9WWMbNLhlvWAISeHwlz63R0vJgTo9gTRwEKwh0ivgVQN9
         lHbmulvn/fh0EeSvM5WhIZS1oQR3dZkAnP0gVVr0J9ZTOL9wy+SfkBha42n5oCNSdfqY
         zVYrmEDwxy0Mmubg8kMvXCMwv9zhby0smTt+/RLBr30MbCq1CMaOP6J6hdEDkWih4wrj
         e1aQ==
X-Gm-Message-State: AAQBX9eKlmg9qoPuACpdpzBuhcqKNdncHvr7yfwKpAb2tAhifoVF/FyC
	ltVzQW9p2WXpG3DOPJ1S6Y6kelIOBLZgA0OC8dM=
X-Google-Smtp-Source: AKy350aCTk97HhBagfs1bziiRgyKf8MDJ6f7N3wV6rUPokk8SeBKogf27q+xWQUdhDrJ9Rd9k7a8MA==
X-Received: by 2002:a17:902:c950:b0:19e:b9f8:1fca with SMTP id i16-20020a170902c95000b0019eb9f81fcamr362499pla.10.1679605489875;
        Thu, 23 Mar 2023 14:04:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902724100b001a198adb190sm12760417pll.88.2023.03.23.14.04.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:04:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/14] Patch review
Date: Thu, 23 Mar 2023 11:04:28 -1000
Message-Id: <cover.1679605352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 21:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178994

Please review this set of patches for kirkstone and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5087

The following changes since commit 7df46e003ea76cf7d5b7263f23bd6e6a781bd22c:

  base-files: Drop localhost.localdomain from hosts file (2023-03-17 04:52:21 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (1):
  devtool/upgrade: do not delete the workspace/recipes directory

Chee Yang Lee (1):
  git: ignore CVE-2023-22743

Khem Raj (1):
  systemd.bbclass: Add /usr/lib/systemd to searchpaths as well

Martin Jansa (3):
  timezone: use 'tz' subdir instead of ${WORKDIR} directly
  tzdata: use separate B instead of WORKDIR for zic output
  tzcode-native: fix build with gcc-13 on host

Mikko Rapeli (1):
  oeqa rtc.py: skip if read-only-rootfs

Pawan Badganchi (1):
  curl: Add fix for CVE-2023-23914, CVE-2023-23915

Peter Marko (1):
  systemd: fix CVE-2022-4415

Piotr Łobacz (1):
  systemd: fix wrong nobody-group assignment

Richard Purdie (1):
  pybootchartui: Fix python syntax issue

Romuald Jeanne (1):
  image_types: fix multiubi var init

Ross Burton (1):
  lib/resulttool: fix typo breaking resulttool log --ptest

Tim Orling (1):
  cracklib: update github branch to 'main'

 meta/classes/image_types.bbclass              |   3 +
 meta/classes/systemd.bbclass                  |   1 +
 meta/lib/oeqa/runtime/cases/rtc.py            |   8 +-
 .../systemd/systemd/CVE-2022-4415-1.patch     | 109 +++++
 .../systemd/systemd/CVE-2022-4415-2.patch     | 391 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |   4 +-
 meta/recipes-devtools/git/git_2.35.7.bb       |   2 +
 .../cracklib/cracklib_2.9.8.bb                |   2 +-
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../timezone/tzcode-native.bb                 |   3 +-
 ...0001-Fix-C23-related-conformance-bug.patch | 301 ++++++++++++++
 meta/recipes-extended/timezone/tzdata.bb      |  16 +-
 .../curl/curl/CVE-2023-23914_5-1.patch        | 280 +++++++++++++
 .../curl/curl/CVE-2023-23914_5-2.patch        |  23 ++
 .../curl/curl/CVE-2023-23914_5-3.patch        |  45 ++
 .../curl/curl/CVE-2023-23914_5-4.patch        |  48 +++
 .../curl/curl/CVE-2023-23914_5-5.patch        | 118 ++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   5 +
 scripts/lib/devtool/upgrade.py                |   3 -
 scripts/lib/resulttool/resultutils.py         |   2 +-
 .../pybootchartgui/pybootchartgui/parsing.py  |   2 +-
 21 files changed, 1351 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-4415-1.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-4415-2.patch
 create mode 100644 meta/recipes-extended/timezone/tzcode/0001-Fix-C23-related-conformance-bug.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23914_5-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23914_5-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23914_5-3.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23914_5-4.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23914_5-5.patch

-- 
2.34.1


