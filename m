Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9672FE77171
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:36:36 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.25140.1733344589242431097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=U8uZv/tH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-724e113c821so219240b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733344588; x=1733949388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HxzVYC1cP8UvPR1zmZlvdt2Fb7Kfnzca5EHKjYucaQg=;
        b=U8uZv/tHpUR7U0OpiRTH0NVvc1UJyyvSX1g3wNn779svsRo6+/rIDXeW1NSHLxNENc
         SpLlm1FM/mQc95f7nPT2hTsaFZgaZ2lI8iXphUePzkKwGB8ni0c+NgtJWtmO81v4H+ao
         WLn6zo3miRQupgtMigkIlR2Iga1YD6nIiG/L0cTyci16WztWzGRQjhANyFHelM1fw4Fc
         hfr9Q/jUWuB+7XOGnxRYYZcRuldZ9O89wYyKD2cpkJv3CtfYAKjSWa+mAdWNOVP+FbYS
         GFFumWv/bE5nPy4SyX6q0sBqma7yEhVHCe9gmlY4B95/UKgh57aI1fn58enE4N0uDUPz
         UJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344588; x=1733949388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HxzVYC1cP8UvPR1zmZlvdt2Fb7Kfnzca5EHKjYucaQg=;
        b=pZYcihDsHJHAQ6KrVTt417MW9PP4/XHlxjPUvKMQFwSlotZtPo8de3SC8vlvEVzzLt
         bJL4kZsi4QyOSiUh/Ey2RpCxzbF5BjTaoTWEaNo6/klPmerWH5GQEEt6/0LESuhZj4ox
         MbAJkaufscZN1W+5qBT0GlI0X50NZ5OAivDxPRHxajRUQ3FhizBi8rWloLJPnFcGeQux
         tDDUHmfbIMjP3jBVrU5NhGMPrK9vLwV1eG8hJ1AbhYqtNkny64HWjhrMdVSpAXcd8Jhy
         8n/2kUfIS8EQbgqG4+a3orBTTVQeWGGGbu/tcmroin6w/rIi4dlmI4vRU7dFrDhih/r/
         xTww==
X-Gm-Message-State: AOJu0Yzlffu49BXWVOKavler/D7EMzEM65ZBFCHWU8D/maUX+faD2B1g
	HYzEr3PFRAyUkixVAXRvSMiLsGNn89DaKAuIQBGhd6d+U2Zx5Tv3SyocnCVfYIwj+FGC54DTbcD
	Y
X-Gm-Gg: ASbGncvqSTlxHDerdUO0i+T1FjxKHftx+LoE3En3ILJetGzcfiIi8TSLaenWRIV0enp
	oR3hPc7y7tZVctKKnve6FVt95bZlj+Ez+z84UBGXrAMA+VO42V3Az0QeYz28hO1lkR0hYqbmeW2
	FndiEVHPG3T3mIwceMwDpYQ+Rxnqb7mqPDPZRTBzzU4ZTWWNr0DO4SizGpOZe1p94EB2kH2RgOS
	+AbEXVbVbZRfuqrF690+8eJfcAwq2XTrEx3WG0=
X-Google-Smtp-Source: AGHT+IHkXBXKE38qpoNgpzKKahorUK8ycBdn7PYcUBjGOA5j+zf8bDpuvPh/ARcUFvL5xqJ6+xXweA==
X-Received: by 2002:aa7:8896:0:b0:725:64d:c803 with SMTP id d2e1a72fcca58-7257fcde02cmr9515810b3a.26.1733344588451;
        Wed, 04 Dec 2024 12:36:28 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f3d7sm12827805b3a.55.2024.12.04.12.36.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:36:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/15] Patch review
Date: Wed,  4 Dec 2024 12:36:07 -0800
Message-Id: <cover.1733344462.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:36:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208328

Please review this set of changes for scarthgap and have comments back by
end of day Friday, December 6

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/582

The following changes since commit e0c4f2f69723f64a29ba35c4de5fb1a7c79ef718:

  rootfs: Ensure run-postinsts is not uninstalled for read-only-rootfs-delayed-postinsts (2024-12-02 10:18:14 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Changqing Li (1):
  rxvt-unicode.inc: disable the terminfo installation by setting TIC to
    :

Hongxu Jia (2):
  ovmf: fix CVE-2024-38796
  ovmf: fix CVE-2024-1298

Richard Purdie (12):
  do_package/sstate/sstatesig: Change timestamp clamping to hash output
    only
  selftest/reproducible: Drop rawlogs
  selftest/reproducible: Clean up pathnames
  resulttool: Allow store to filter to specific revisions
  resulttool: Use single space indentation in json output
  oeqa/utils/gitarchive: Return tag name and improve exclude handling
  resulttool: Fix passthrough of --all files in store mode
  resulttool: Add --logfile-archive option to store mode
  resulttool: Handle ltp rawlogs as well as ptest
  resulttool: Clean up repoducible build logs
  resulttool: Trim the precision of duration information
  resulttool: Improve repo layout for oeselftest results

 meta/classes-global/sstate.bbclass            | 16 ----
 meta/lib/oe/sstatesig.py                      |  7 +-
 meta/lib/oeqa/core/runner.py                  |  2 +-
 meta/lib/oeqa/selftest/cases/reproducible.py  |  8 +-
 meta/lib/oeqa/utils/gitarchive.py             |  4 +-
 ...ential-UINT32-overflow-in-S3-ResumeC.patch | 51 +++++++++++++
 ...-Fix-overflow-issue-in-BasePeCoffLib.patch | 36 +++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  2 +
 .../rxvt-unicode/rxvt-unicode.inc             |  3 +-
 scripts/lib/resulttool/manualexecution.py     |  2 +-
 scripts/lib/resulttool/report.py              |  2 +-
 scripts/lib/resulttool/resultutils.py         | 76 +++++++++++++++----
 scripts/lib/resulttool/store.py               | 26 ++++++-
 13 files changed, 188 insertions(+), 47 deletions(-)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-Potential-UINT32-overflow-in-S3-ResumeC.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-issue-in-BasePeCoffLib.patch

-- 
2.34.1


