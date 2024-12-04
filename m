Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B4E0E77170
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:54:15 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.21180.1733334853009719482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:54:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RnK5bvpE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso35248a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334852; x=1733939652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dzBteZ5bm4jOjw88UgbvK9xHg+zqWuyhPtKMbN0gz9g=;
        b=RnK5bvpEETEg92U7RwKxvqRtPt3G280GYe9zWXACQlBffD7N0NBqK8VLR1/Q2R8UsE
         lXvqAIurp/lloofSlBOs/emE6pjdOSjwzOkDXhHf/PEHw45kjjz9gl6g/tho8c3/648y
         f5PZ98ETQE7Fv2bVO/Rxc5mpvpimk3pBWtEr1gc+LNZb9nl55VwrmbHzXqH9QVUt/1b7
         O/daQu8JM9HHhPh4RE3i1yOGDymGeBUnCSx2Vn/SGIMeqes8KRUNN7s79cTKk3dXbS3l
         K/2eu8V7J/3GwY8IUpzfuGmXdUZgIaIWF9o4ei+ubVslPX2J7uo+TeOLL+f1QQpdxFtv
         eeyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334852; x=1733939652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dzBteZ5bm4jOjw88UgbvK9xHg+zqWuyhPtKMbN0gz9g=;
        b=h/jH0huIyyDzbzWWfRi7fn6kEcokNioD1UhWeXG+ouAXHBpGG1ckryINMCAWaeGB0E
         MKGEGeX6on+COUUxJqgKSxv2Hbvp76nrEvUSMPQ9ZIteEuAQnFPIrH+YnnteAdWTJOsV
         YeWJGc3aaleU2Wygp9w00UztlKxaaW0mtpKXGAlnRNO4m5vqky6UvfavdgIcEslqNelw
         nQo+n4ivPwMQAg6rzzwh/GRpmhuihTG+F7Z0qGZnzzmuUoiKR/DM6Dt9akWenoLzRPWe
         aV5xDXYe9T+Y3KaGcseCybtyjWKRMa4NiPEgbcnJc5uWj74ec7v7wnF8cT+e8fGD6xfn
         nYLA==
X-Gm-Message-State: AOJu0YyCt7SkOOkgVBjUi3Ld0D/BBkeYOo3vC2CCLeujQlIa5y1mbvuL
	GwII8u2FlNv7DYtljQ72O9aGwkFhz6zTY44DvVGqj+H+xc9qbg5s1vC+8VAH2sP5/BS7QPuJomP
	R
X-Gm-Gg: ASbGncth+Okt/Ljmz+24NxFTjZJwsIdr/FlQglIiPXO5nbxkSP91ZCviOtbrfsJQGOq
	lqYqzQnykmUlM8IguhtNkBDndL9i8KJNlBeUAbe8bEuEuzjiFjH1j+eNLz/UI/a06OlWbFwEVw+
	TiI/bbf/uzrnrJFaZxDewxvTbXw1RTcWVi5VQfpeeK7zKDMC2TPyFJVipoRMzUeajWwV/XKxGjE
	xFVsmGOMUZWlPExqcblvN/QJC1pNRvHYTQf7LY=
X-Google-Smtp-Source: AGHT+IFPbUAYAtCIbNq3ZLFcdI6beotH1ofvRFOtRalPDRADMQHQrK0btFOdO0HLCySNoiZsfJiMQg==
X-Received: by 2002:a05:6a21:a4c4:b0:1dc:151e:d800 with SMTP id adf61e73a8af0-1e16bdfd4b6mr8222254637.16.1733334852040;
        Wed, 04 Dec 2024 09:54:12 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.54.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:54:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/38] Patch review
Date: Wed,  4 Dec 2024 09:53:27 -0800
Message-Id: <cover.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208283

Please review this set of changes for kirkstone and have comments back by
end of day Friday, December 6

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/581

The following changes since commit 13b13b81b91f618c13cf972067c47bd810de852f:

  gstreamer1.0: improve test reliability (2024-11-27 06:57:56 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Changqing Li (2):
  libsoup: fix CVE-2024-52531
  rxvt-unicode.inc: disable the terminfo installation by setting TIC to
    :

Divya Chellam (1):
  qemu: fix CVE-2024-3446

Hongxu Jia (3):
  ovmf: fix CVE-2024-38796
  ovmf: fix CVE-2024-1298
  python3-zipp: fix CVE-2024-5569

Jiaying Song (1):
  diffoscope: fix CVE-2024-25711

Peter Marko (6):
  cpio: ignore CVE-2023-7216
  gnupg: ignore CVE-2022-3515
  qemu: ignore CVE-2022-36648
  grub: ignore CVE-2024-1048 and CVE-2023-4001
  pixman: ignore CVE-2023-37769
  qemu: patch CVE-2024-6505

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

Soumya Sambu (11):
  ovmf: Fix CVE-2022-36763
  ovmf: Fix CVE-2022-36764
  ovmf: Fix CVE-2023-45230
  ovmf: Fix CVE-2023-45231
  ovmf: Fix CVE-2023-45232, CVE-2023-45233
  ovmf: Fix CVE-2023-45234
  ovmf: Fix CVE-2023-45235
  ovmf: Fix CVE-2023-45229
  ovmf: Fix CVE-2023-45237
  ovmf: Fix CVE-2023-45236
  ovmf: Fix CVE-2022-36765

Vijay Anusuri (1):
  libsoup-2.4: Backport fix for CVE-2024-52531

Yogita Urade (1):
  qemu: fix CVE-2024-3447

 meta/classes/sstate.bbclass                   |   16 -
 meta/lib/oe/sstatesig.py                      |    7 +-
 meta/lib/oeqa/core/runner.py                  |    2 +-
 meta/lib/oeqa/selftest/cases/reproducible.py  |    8 +-
 meta/lib/oeqa/utils/gitarchive.py             |    4 +-
 meta/recipes-bsp/grub/grub2.inc               |    2 +
 ...ential-UINT32-overflow-in-S3-ResumeC.patch |   51 +
 ...-Fix-overflow-issue-in-BasePeCoffLib.patch |   37 +
 .../ovmf/ovmf/CVE-2022-36763-0001.patch       |  985 ++++++++++
 .../ovmf/ovmf/CVE-2022-36763-0002.patch       |  889 +++++++++
 .../ovmf/ovmf/CVE-2022-36763-0003.patch       |   55 +
 .../ovmf/ovmf/CVE-2022-36764-0001.patch       |  271 +++
 .../ovmf/ovmf/CVE-2022-36764-0002.patch       |  281 +++
 .../ovmf/ovmf/CVE-2022-36764-0003.patch       |   48 +
 .../ovmf/ovmf/CVE-2022-36765-0001.patch       |  179 ++
 .../ovmf/ovmf/CVE-2022-36765-0002.patch       |  157 ++
 .../ovmf/ovmf/CVE-2022-36765-0003.patch       |  135 ++
 .../ovmf/ovmf/CVE-2023-45229-0001.patch       |  604 ++++++
 .../ovmf/ovmf/CVE-2023-45229-0002.patch       |  539 ++++++
 .../ovmf/ovmf/CVE-2023-45229-0003.patch       |  244 +++
 .../ovmf/ovmf/CVE-2023-45229-0004.patch       |  157 ++
 .../ovmf/ovmf/CVE-2023-45230-0001.patch       | 1617 +++++++++++++++++
 .../ovmf/ovmf/CVE-2023-45230-0002.patch       |  604 ++++++
 .../ovmf/ovmf/CVE-2023-45231-0001.patch       |   65 +
 .../ovmf/ovmf/CVE-2023-45231-0002.patch       |  250 +++
 .../CVE-2023-45232-CVE-2023-45233-0001.patch  |  360 ++++
 .../CVE-2023-45232-CVE-2023-45233-0002.patch  |  417 +++++
 .../ovmf/ovmf/CVE-2023-45234-0001.patch       |  154 ++
 .../ovmf/ovmf/CVE-2023-45234-0002.patch       |  485 +++++
 .../ovmf/ovmf/CVE-2023-45235-0001.patch       |  243 +++
 .../ovmf/ovmf/CVE-2023-45235-0002.patch       |  379 ++++
 .../ovmf/ovmf/CVE-2023-45236.patch            |  829 +++++++++
 .../ovmf/ovmf/CVE-2023-45237-0001.patch       |   78 +
 .../ovmf/ovmf/CVE-2023-45237-0002.patch       | 1288 +++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |   28 +
 .../0001-Add-SanitizedNames-mixin.patch       |   89 +
 ...Names-in-CompleteDirs.-Fixes-broken-.patch |   30 +
 .../0003-Removed-SanitizedNames.patch         |   95 +
 ...-loop-when-zipfile-begins-with-more-.patch |   48 +
 ...ath.rstrip-to-consolidate-checks-for.patch |   30 +
 .../python/python3-zipp_3.7.0.bb              |    8 +
 meta/recipes-devtools/qemu/qemu.inc           |   13 +
 .../qemu/qemu/CVE-2024-3446-0001.patch        |  218 +++
 .../qemu/qemu/CVE-2024-3446-0002.patch        |  427 +++++
 .../qemu/qemu/CVE-2024-3446-0003.patch        |   68 +
 .../qemu/qemu/CVE-2024-3446-0004.patch        |  144 ++
 .../qemu/qemu/CVE-2024-3446-0005.patch        |   42 +
 .../qemu/qemu/CVE-2024-3446-0006.patch        |   43 +
 .../qemu/qemu/CVE-2024-3447.patch             |  137 ++
 .../qemu/qemu/CVE-2024-6505.patch             |   40 +
 meta/recipes-extended/cpio/cpio_2.14.bb       |    2 +
 .../xorg-lib/pixman_0.40.0.bb                 |    3 +
 .../rxvt-unicode/rxvt-unicode.inc             |    3 +-
 .../diffoscope/CVE-2024-25711.patch           |  116 ++
 .../diffoscope/diffoscope_208.bb              |    1 +
 meta/recipes-support/gnupg/gnupg_2.3.7.bb     |    2 +
 .../libsoup-2.4/CVE-2024-52531-1.patch        |  131 ++
 .../libsoup-2.4/CVE-2024-52531-2.patch        |   36 +
 .../libsoup/libsoup-2.4_2.74.2.bb             |    2 +
 .../libsoup/libsoup/CVE-2024-52531-1.patch    |  116 ++
 .../libsoup/libsoup/CVE-2024-52531-2.patch    |   40 +
 .../libsoup/libsoup/CVE-2024-52531-3.patch    |  136 ++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |    3 +
 scripts/lib/resulttool/manualexecution.py     |    2 +-
 scripts/lib/resulttool/report.py              |    2 +-
 scripts/lib/resulttool/resultutils.py         |   76 +-
 scripts/lib/resulttool/store.py               |   26 +-
 67 files changed, 13550 insertions(+), 47 deletions(-)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-Potential-UINT32-overflow-in-S3-ResumeC.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-issue-in-BasePeCoffLib.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0002.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0003.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36764-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36764-0002.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36764-0003.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0002.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0003.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45229-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45229-0002.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45229-0003.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45229-0004.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45230-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45230-0002.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45231-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45231-0002.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45232-CVE-2023-45233-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45232-CVE-2023-45233-0002.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45234-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45234-0002.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45235-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45235-0002.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45236.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch
 create mode 100644 meta/recipes-devtools/python/python3-zipp/0001-Add-SanitizedNames-mixin.patch
 create mode 100644 meta/recipes-devtools/python/python3-zipp/0002-Employ-SanitizedNames-in-CompleteDirs.-Fixes-broken-.patch
 create mode 100644 meta/recipes-devtools/python/python3-zipp/0003-Removed-SanitizedNames.patch
 create mode 100644 meta/recipes-devtools/python/python3-zipp/0004-Address-infinite-loop-when-zipfile-begins-with-more-.patch
 create mode 100644 meta/recipes-devtools/python/python3-zipp/0005-Prefer-simpler-path.rstrip-to-consolidate-checks-for.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0001.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0002.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0003.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0004.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0005.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0006.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3447.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-6505.patch
 create mode 100644 meta/recipes-support/diffoscope/diffoscope/CVE-2024-25711.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52531-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2024-52531-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2024-52531-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2024-52531-3.patch

-- 
2.34.1


