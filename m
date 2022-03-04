Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30852C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:04:43 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.7934.1646406282065772828
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:04:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=sYFKi9yA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id e2so7959320pls.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wyv2k2pXLa5oHV0s7v+woylGCHXIKWIMDbxVNvtl+7M=;
        b=sYFKi9yAkfWhS865tSbrfLFIb5BeIxQ4nGKO0cT0QuuGnK8HNRcUl3UgKnxEivsZQs
         nh0rzxmT6XXNKrgyLGIf1Gj2qyY/Z11lotUGdlMlL/F+KJ1FxI7osPfXfYTF8XnC5Vud
         K8MosQrR1az4za/YP1L+GJeOqAzoyxc3t/3rY230xyWOF+L40dBju+nTmUA83wa0TrRl
         aMoJU6sh1ZDkERpeOo31H3DA4rLCUMAeZ/Rod/VMkoZOKHOR90h4JqJJW4hDEY00wz+2
         gALwqKWTM3sDw6DyBA2DlgnXxBEHBo2fUOtTH8vRKh/Hd6HnBaAPvw18y5Kb0blD6fR2
         lgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wyv2k2pXLa5oHV0s7v+woylGCHXIKWIMDbxVNvtl+7M=;
        b=UfKc2GTc7M4jQJSYIwfw1TdAXa/XuDG5Sa5ckFUEO0/7GACk7iHnw6So6A3sWx1vwI
         O6uMophKidAlkcznv+H+MfA2Wo8KXDLyLiOwMiINUQxEFYYlOXcGAa38h+pJQ5C47kfw
         sJOlKSCb2FadRLllerWfG13HI4rcTRJSr8tK1L0hqmSd0qtjcoqOVJ57pqY2gu9TNQla
         1bOQ6skYKpFkzCFRD3bY9+aDCse78lqxL/i0hvP5gm5UVjIOkA2irJ4q8ItA7ASp70cX
         BnhIMgBUJmMkzB9ayPn2spcBUIFZBHYufI1C0zduR74ME/3rTdclzDNBOt73x20wfbhx
         eOQQ==
X-Gm-Message-State: AOAM531LK3ylqL8De7KBbvbplz0BArhACXeeq1B5iWe3tpnDE/AHN9WY
	sWMTuleg+N7ugNGnH5RpU6CVmsf/D4lfxVyNdx8=
X-Google-Smtp-Source: 
 ABdhPJw+NrHlJT4X3LqDKBv4cp2LtItFPN6rM7CAM5hpaMnLNzV/h5GrME1MJ1gvMzcwjFw/ts/cEA==
X-Received: by 2002:a17:90b:3504:b0:1bc:7bc8:bd4a with SMTP id
 ls4-20020a17090b350400b001bc7bc8bd4amr11169726pjb.226.1646406280730;
        Fri, 04 Mar 2022 07:04:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm80400pfa.77.2022.03.04.07.04.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 07:04:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/18] Patch review
Date: Fri,  4 Mar 2022 05:04:08 -1000
Message-Id: <cover.1646406001.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 15:04:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162719

Please review this set of patches for dunfell and have comments back by end
of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3314

with the exception of a known autobuilder intermittent issue on qemumips64:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14029

which passed on subsequent retest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/4787

The following changes since commit 79ce9059f716546a7d6f4562ba194aedd90c22cd:

  grub: add a fix for a crash in scripts (2022-02-23 05:00:42 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Jose Quaresma (1):
  buildhistory.bbclass: create the buildhistory directory when needed

Marek Vasut (1):
  bootchart2: Add missing python3-math dependency

Michael Halstead (1):
  uninative: Upgrade to 3.5

Minjae Kim (2):
  go: fix CVE-2022-23806
  go: fix CVE-2022-23772

Nathan Rossi (1):
  cml1.bbclass: Handle ncurses-native being available via pkg-config

Richard Purdie (2):
  libxml-parser-perl: Add missing RDEPENDS
  uninative: Add version to uninative tarball name

Ross Burton (3):
  coreutils: remove obsolete ignored CVE list
  cve-check: get_cve_info should open the database read-only
  Revert "cve-check: add lockfile to task"

Steve Sakoman (5):
  expat: fix CVE-2022-25235
  expat: fix CVE-2022-25236
  expat: fix CVE-2022-25313
  expat: fix CVE-2022-25314
  expat: fix CVE-2022-25315

Virendra Thakur (1):
  libarchive: Fix for CVE-2021-36976

wangmy (1):
  wireless-regdb: upgrade 2021.08.28 -> 2022.02.18

 meta/classes/buildhistory.bbclass             |   1 +
 meta/classes/cml1.bbclass                     |   8 +
 meta/classes/cve-check.bbclass                |   4 +-
 meta/classes/uninative.bbclass                |   2 +-
 meta/conf/distro/include/yocto-uninative.inc  |  11 +-
 meta/recipes-core/coreutils/coreutils_8.31.bb |   3 -
 .../expat/expat/CVE-2022-25235.patch          | 283 +++++++++++++++
 .../expat/expat/CVE-2022-25236.patch          | 129 +++++++
 .../expat/CVE-2022-25313-regression.patch     | 131 +++++++
 .../expat/expat/CVE-2022-25313.patch          | 230 +++++++++++++
 .../expat/expat/CVE-2022-25314.patch          |  32 ++
 .../expat/expat/CVE-2022-25315.patch          | 145 ++++++++
 meta/recipes-core/expat/expat_2.2.9.bb        |   6 +
 .../bootchart2/bootchart2_0.14.9.bb           |   2 +-
 meta/recipes-devtools/go/go-1.14.inc          |   2 +
 .../go/go-1.14/CVE-2022-23772.patch           |  50 +++
 .../go/go-1.14/CVE-2022-23806.patch           | 142 ++++++++
 .../perl/libxml-parser-perl_2.46.bb           |   1 +
 .../libarchive/CVE-2021-36976-1.patch         | 321 ++++++++++++++++++
 .../libarchive/CVE-2021-36976-2.patch         | 121 +++++++
 .../libarchive/CVE-2021-36976-3.patch         |  93 +++++
 .../libarchive/libarchive_3.4.2.bb            |   6 +-
 ....08.28.bb => wireless-regdb_2022.02.18.bb} |   2 +-
 23 files changed, 1711 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25235.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25236.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25313-regression.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25313.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25314.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25315.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-23772.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-23806.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-36976-1.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-36976-2.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-36976-3.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2021.08.28.bb => wireless-regdb_2022.02.18.bb} (94%)

-- 
2.25.1


