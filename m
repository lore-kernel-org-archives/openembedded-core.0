Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F8EC74A5B
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:21:54 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.44308.1679494910668967250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ihx5/uAl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id i15so7175255pfo.8
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cDJ+8VkyQm2aj9IKszmbl/3uzQCGDEXNmmVMdDoXZ8M=;
        b=ihx5/uAlrkkM0vhJ+zPnA9rYys4bMptdVlXJJDy0/6UaEDZmGCdB8xmbxKMBiCRa5x
         x9g8OKmbysoBqrinde4U5ncuXGk8B4tKS11TwUkSpmg+xuDUlxwmk6NNtgrk4nYdDAsK
         nz3JtJ/IGAy4M4sfLHOX45x3LiHH0/12DIKHWJj8lbKdSypfGYvuw5ZQjinyzKdNXgGd
         stUUAruiDU9F8Z+d6CCwHjDA+SGt5Lha77VTVnXRShW9j947aWcUzWBqX4QX5sz/OmBI
         Nxa50VcXiFlrbfVaaEb06oyUiftGa6IOyM1o7MCHovyhHZBJp0iq/AqoQgrsuSys7001
         WWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cDJ+8VkyQm2aj9IKszmbl/3uzQCGDEXNmmVMdDoXZ8M=;
        b=ANwI6OGbBbsYl/Ax3rPGvaTD8tZJclOJHhcVbyODd7Rkb30vfIY+VAVKppj+YWmKYv
         COfgnloVJq55OtWlvxYTKvzs6Rqhwmg4kixSdKQSuuUKrZ7PNV1v9XoUB1PjCQ+W1cFu
         BcNJ5p90TxrNPhIcfB4qOBclBTxlBR97Hlz1dMpUl9WOEFtbLbM5WfJ0+arUUdo252bA
         sjjKrdDH14gfQl+vobUv1Bv8H2L3SRSSk7nqWUVaqVQ5W6BOhVi8pluj9PpKS/zc6igC
         0nNmjk5GQcdp0d0qlptiPcntOrJv+GxZha3T3Qm61qo9z/8vLzSES5pVOHbCZaEpEor/
         D/Uw==
X-Gm-Message-State: AO0yUKWj8CIMQB05dxt4PVL7OMQmB9vzQ5+VCPi0MHGGK8wBs6Lg/Mzs
	1oIP9fdn68y1P4/PXRirTpLiMu3nzz5dICHehcY=
X-Google-Smtp-Source: AK7set+lkyDnR4T2ut+UI0fpvm+YQyUNJQGoy99Zfw6YLuU9so+aVz0PTT2s8GvUgFGEMN3vKvS99w==
X-Received: by 2002:a62:1d12:0:b0:628:1852:7343 with SMTP id d18-20020a621d12000000b0062818527343mr3205172pfd.2.1679494909388;
        Wed, 22 Mar 2023 07:21:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.21.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:21:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/21] Patch review
Date: Wed, 22 Mar 2023 04:21:19 -1000
Message-Id: <cover.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178925

Please review this set of patches for langdale and have comments back by
end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5076

The following changes since commit 61f268be804795fadafbc918b465561819b592ec:

  base-files: Drop localhost.localdomain from hosts file (2023-03-16 04:35:11 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-nut

Alexander Kanavin (1):
  devtool/upgrade: do not delete the workspace/recipes directory

Chee Yang Lee (3):
  git: ignore CVE-2023-22743
  tiff: Fix CVE-2023-0795 CVE-2023-0796 CVE-2023-0797 CVE-2023-0798
    CVE-2023-0799
  go: upgrade to 1.19.7

Frederic Martinsons (1):
  cargo.bbclass: use offline mode for building

Khem Raj (1):
  systemd.bbclass: Add /usr/lib/systemd to searchpaths as well

Martin Jansa (3):
  timezone: use 'tz' subdir instead of ${WORKDIR} directly
  tzdata: use separate B instead of WORKDIR for zic output
  tzcode-native: fix build with gcc-13 on host

Mikko Rapeli (1):
  oeqa rtc.py: skip if read-only-rootfs

Mingli Yu (3):
  mdadm: Fix testcase 06wrmostly
  mdadm: fix tests/02lineargrow
  mdadm: Fix raid0 tests

Piotr Łobacz (1):
  systemd: fix wrong nobody-group assignment

Richard Purdie (2):
  pybootchartui: Fix python syntax issue
  pybootchart: Fix extents handling to account for cpu/io/mem pressure
    changes

Romuald JEANNE (1):
  image_types: fix vname var init in multiubi_mkfs() function

Romuald Jeanne (1):
  image_types: fix multiubi var init

Ross Burton (1):
  lib/resulttool: fix typo breaking resulttool log --ptest

Sudip Mukherjee (1):
  libgit2: update license information

Tim Orling (1):
  cracklib: update github branch to 'main'

 meta/classes-recipe/cargo.bbclass             |   2 +-
 meta/classes-recipe/image_types.bbclass       |  16 +-
 meta/classes-recipe/systemd.bbclass           |   1 +
 meta/lib/oeqa/runtime/cases/rtc.py            |   8 +-
 meta/recipes-core/systemd/systemd_251.8.bb    |   2 +-
 meta/recipes-devtools/git/git_2.37.6.bb       |   2 +
 .../go/{go-1.19.4.inc => go-1.19.7.inc}       |   2 +-
 ...e_1.19.4.bb => go-binary-native_1.19.7.bb} |   4 +-
 ..._1.19.4.bb => go-cross-canadian_1.19.7.bb} |   0
 ...{go-cross_1.19.4.bb => go-cross_1.19.7.bb} |   0
 ...osssdk_1.19.4.bb => go-crosssdk_1.19.7.bb} |   0
 ...o-native_1.19.4.bb => go-native_1.19.7.bb} |   0
 ...runtime_1.19.4.bb => go-runtime_1.19.7.bb} |   0
 .../go/{go_1.19.4.bb => go_1.19.7.bb}         |   0
 .../cracklib/cracklib_2.9.8.bb                |   2 +-
 ...-Fix-optional-write-behind-parameter.patch |  45 +++
 ...d-a-test-that-validates-raid0-with-l.patch |  41 +++
 ...-Run-udevadm-settle-before-setting-r.patch |  39 +++
 ...ow-clear-the-superblock-at-every-ite.patch |  33 ++
 ...metadata-avoid-passing-chunk-size-to.patch |  41 +++
 ...ts-fix-raid0-tests-for-0.90-metadata.patch | 102 ++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |   6 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../timezone/tzcode-native.bb                 |   3 +-
 ...0001-Fix-C23-related-conformance-bug.patch | 301 ++++++++++++++++++
 meta/recipes-extended/timezone/tzdata.bb      |  16 +-
 .../CVE-2023-0795_0796_0797_0798_0799.patch   | 154 +++++++++
 meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |   1 +
 meta/recipes-support/libgit2/libgit2_1.5.1.bb |   2 +-
 scripts/lib/devtool/upgrade.py                |   3 -
 scripts/lib/resulttool/resultutils.py         |   2 +-
 scripts/pybootchartgui/pybootchartgui/draw.py |   6 +
 .../pybootchartgui/pybootchartgui/parsing.py  |   2 +-
 33 files changed, 810 insertions(+), 32 deletions(-)
 rename meta/recipes-devtools/go/{go-1.19.4.inc => go-1.19.7.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.19.4.bb => go-binary-native_1.19.7.bb} (84%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.19.4.bb => go-cross-canadian_1.19.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.19.4.bb => go-cross_1.19.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.19.4.bb => go-crosssdk_1.19.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.19.4.bb => go-native_1.19.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.19.4.bb => go-runtime_1.19.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.19.4.bb => go_1.19.7.bb} (100%)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-Fix-optional-write-behind-parameter.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-00raid0-add-a-test-that-validates-raid0-with-l.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-fix-raid0-tests-for-0.90-metadata.patch
 create mode 100644 meta/recipes-extended/timezone/tzcode/0001-Fix-C23-related-conformance-bug.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-0795_0796_0797_0798_0799.patch

-- 
2.34.1


