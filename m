Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AB1C61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 09:55:33 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.49702.1675677326902704404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Feb 2023 01:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VqEfp7nS;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id x18so4388931ljj.5
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Feb 2023 01:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ss7low5NEXGCiJsEU3Xu2qccEiYlnFzwwOJA/i0tRCc=;
        b=VqEfp7nSDSIqxYgsMun3LXdSOJMM8GwUBr7qJZnG9qzOXnm7LRVZYV3nhR6e7dz6cC
         GiOXeA0kF1G5z7ZMaPpClkzBQWpFxwCSQPx0yyZ8jJr464aAl8J7n49ZYR82W4o799pc
         1DokFHSKqkaRSg7JG8Fdi/2pAqXKejqN+UIOx/EkjpjlIU8P940GmOSEbwN4HHpBPbnk
         Fk7lsz2r05TDlZnQ9KULkWBjkbU5lwT5JNLHWGUz1ZQ08oy+7HecS0BhkNNNkfMzVRej
         Ygn8HCzdv+5/MgCVYA4oJS3hEFh9jFG10cumvaxEsQnjw/AjhTzJ7GcpU8nTkD5gxSx4
         Y1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ss7low5NEXGCiJsEU3Xu2qccEiYlnFzwwOJA/i0tRCc=;
        b=wnnRsRkgdZ1Uxn+98uvfoeqXWwjgqWYYBRGNvYqanSuojNc8+a1PqrOfFc7QZNjUHQ
         0totedZbSRIpydTgGqsuJChnLhtYydgn6HRA7xbOY71XVaDzEtHScBOZGHaLcE4M9hyB
         ppsrx/WhUF8qEbP1CMsX+72mKcTsrfzcrbJjjOASbz+WguCShihVOUSbDD24E3xajikw
         RaygFBieQsvFE1Z6gSJs6kzWXP2h+yaaEJ7aONLddd94VTi1RDsQW6OQwCOkFFSNPQhM
         dKkrgcPRlqI6TMMdCTb2Zi/eWfWTt5+ejLvXH0bv9tev+tJ/oHNgVj7MVXOYDEzwZ214
         tgxA==
X-Gm-Message-State: AO0yUKUSj0V5g9BCNm/rY6jA5WU41DG9KmdTJDTFz96RE2H6P0k5PxHG
	LSq9g66lgV2L9xKLr+Jm6kptSBKKqdkelmuyRJA=
X-Google-Smtp-Source: AK7set8o3O/NvyYlOCWgAopsNH3FaSOp0KrsGvmJC7vAZyNITK1S62Sqy1Fx8rcQZJTTCJNr/AIXFtlhJ+HB2Qu2t2k=
X-Received: by 2002:a05:651c:33c:b0:290:637f:c6d6 with SMTP id
 b28-20020a05651c033c00b00290637fc6d6mr2841143ljp.132.1675677324707; Mon, 06
 Feb 2023 01:55:24 -0800 (PST)
MIME-Version: 1.0
References: <20230206084401.2055798-1-haitao.liu@windriver.com>
 <CANNYZj_ohNDo5o7D2geVqjOiAe3trFUvP=park9YUUZu5MBLNw@mail.gmail.com> <DM6PR11MB39451BB9C5075D4CB533D7BD9FDA9@DM6PR11MB3945.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB39451BB9C5075D4CB533D7BD9FDA9@DM6PR11MB3945.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Feb 2023 10:55:13 +0100
Message-ID: <CANNYZj9WvgUSye5R8CNQjr1x0qYZ4UkKVRj+Ow852m_0Eww1HA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] libgit: add ptest for libgit2
To: "Liu, Haitao" <Haitao.Liu@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Feb 2023 09:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176791

Thanks, can you add this to the the patch description? Is it possible
to add the installation rules into it as well, and then offer the
patch upstream?

It's probably time we split slow ptests into subsets and test them in
parallel with two different image recipes. Can you look into that
please?

Alex


On Mon, 6 Feb 2023 at 10:43, Liu, Haitao <Haitao.Liu@windriver.com> wrote:
>
> HI Alex
>
> >// Did you use kvm? 21 minutes looks excessive, and I'm not sure we want to lengthen the ptest by this much. libgit2 is not at the core of the typical linux stack.
>
> I have tested libgit2 on a intel board with "Intel(R) Genuine Intel(R) CPU", not KVM. It took so much time because that it has 2885 testcases.
>
> >// The added patch needs a better commit message. What does it add or change and why? Why is it inappropriate for upstream submission?
>
> An absolute path (CLAR_FIXTURES)is defined as specifying the location of the resource files. The CLAR_FIXTURES is set at compile time.
> The test binary will try to load the files from the absolute patch which does not exist on target board and  it  yields a lot of errors about "No such file or directory. "
> So I  have to change CLAR_FIXTURES to PTEST path (/usr/lib/libgit2/ptest/).
>
>
> Thanks,
> haitao
>
> -----Original Message-----
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Monday, February 6, 2023 4:49 PM
> To: Liu, Haitao <Haitao.Liu@windriver.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH] libgit: add ptest for libgit2
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Did you use kvm? 21 minutes looks excessive, and I'm not sure we want to lengthen the ptest by this much. libgit2 is not at the core of the typical linux stack.
>
> The added patch needs a better commit message. What does it add or change and why? Why is it inappropriate for upstream submission?
>
> Alex
>
> On Mon, 6 Feb 2023 at 09:44, jason.lau <Haitao.Liu@windriver.com> wrote:
> >
> > Add ptest for libgit2.
> > ALl test passed on a trial run and it took around 21m56s to execute so
> > added curl-ptest to PTESTS_SLOW.
> >
> > Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
> > ---
> >  .../distro/include/ptest-packagelists.inc     |  1 +
> >  ...ests-add-CLAR_FIXTURES_DIR-for-ptest.patch | 54
> > +++++++++++++++++++  .../recipes-support/libgit2/libgit2/run-ptest |
> > 7 +++  meta/recipes-support/libgit2/libgit2_1.5.0.bb | 18 ++++++-
> >  4 files changed, 78 insertions(+), 2 deletions(-)  create mode 100644
> > meta/recipes-support/libgit2/libgit2/0001-tests-add-CLAR_FIXTURES_DIR-
> > for-ptest.patch  create mode 100644
> > meta/recipes-support/libgit2/libgit2/run-ptest
> >
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> > b/meta/conf/distro/include/ptest-packagelists.inc
> > index 5422ecd378..9b88b58070 100644
> > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > @@ -104,6 +104,7 @@ PTESTS_SLOW = "\
> >      tcl-ptest \
> >      util-linux-ptest \
> >      valgrind-ptest \
> > +    libgit2-ptest \
> >  "
> >
> >  PTESTS_SLOW:remove:riscv64 = "valgrind-ptest"
> > diff --git
> > a/meta/recipes-support/libgit2/libgit2/0001-tests-add-CLAR_FIXTURES_DI
> > R-for-ptest.patch
> > b/meta/recipes-support/libgit2/libgit2/0001-tests-add-CLAR_FIXTURES_DI
> > R-for-ptest.patch
> > new file mode 100644
> > index 0000000000..f547d29e8a
> > --- /dev/null
> > +++ b/meta/recipes-support/libgit2/libgit2/0001-tests-add-CLAR_FIXTURE
> > +++ S_DIR-for-ptest.patch
> > @@ -0,0 +1,54 @@
> > +From 7ae59e785260bb820cf1449da84140f8ae613e9f Mon Sep 17 00:00:00
> > +2001
> > +From: Liu Haitao <haitao.liu@windriver.com>
> > +Date: Mon, 6 Feb 2023 06:40:20 +0200
> > +Subject: [PATCH] tests: add CLAR_FIXTURES_DIR for ptest
> > +
> > +Upstream-Status: Inappropriate [yocto specific]
> > +
> > +Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
> > +---
> > + tests/libgit2/CMakeLists.txt | 8 +++++++-
> > + tests/util/CMakeLists.txt    | 8 +++++++-
> > + 2 files changed, 14 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/tests/libgit2/CMakeLists.txt
> > +b/tests/libgit2/CMakeLists.txt index 27f421ad6..e1a95a610 100644
> > +--- a/tests/libgit2/CMakeLists.txt
> > ++++ b/tests/libgit2/CMakeLists.txt
> > +@@ -9,7 +9,13 @@ if(NOT PYTHONINTERP_FOUND)
> > + ENDIF()
> > +
> > + set(CLAR_PATH "${PROJECT_SOURCE_DIR}/tests/clar")
> > +-set(CLAR_FIXTURES "${PROJECT_SOURCE_DIR}/tests/resources/")
> > ++
> > ++IF (CLAR_FIXTURES_DIR)
> > ++      SET(CLAR_FIXTURES "${CLAR_FIXTURES_DIR}/resources/")
> > ++ELSE()
> > ++      set(CLAR_FIXTURES "${PROJECT_SOURCE_DIR}/tests/resources/")
> > ++ENDIF()
> > ++
> > + set(TEST_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
> > + add_definitions(-DCLAR_FIXTURE_PATH=\"${CLAR_FIXTURES}\")
> > + add_definitions(-DCLAR_TMPDIR=\"libgit2_tests\")
> > +diff --git a/tests/util/CMakeLists.txt b/tests/util/CMakeLists.txt
> > +index 232590ffd..c736bb3bb 100644
> > +--- a/tests/util/CMakeLists.txt
> > ++++ b/tests/util/CMakeLists.txt
> > +@@ -9,7 +9,13 @@ if(NOT PYTHONINTERP_FOUND)
> > + ENDIF()
> > +
> > + set(CLAR_PATH "${libgit2_SOURCE_DIR}/tests/clar")
> > +-set(CLAR_FIXTURES "${libgit2_SOURCE_DIR}/tests/resources/")
> > ++
> > ++IF (CLAR_FIXTURES_DIR)
> > ++      SET(CLAR_FIXTURES "${CLAR_FIXTURES_DIR}/resources/")
> > ++ELSE()
> > ++      set(CLAR_FIXTURES "${libgit2_SOURCE_DIR}/tests/resources/")
> > ++ENDIF()
> > ++
> > + set(TEST_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
> > + add_definitions(-DCLAR_FIXTURE_PATH=\"${CLAR_FIXTURES}\")
> > + add_definitions(-DCLAR_TMPDIR=\"libgit2_tests\")
> > +--
> > +2.39.1
> > +
> > diff --git a/meta/recipes-support/libgit2/libgit2/run-ptest
> > b/meta/recipes-support/libgit2/libgit2/run-ptest
> > new file mode 100644
> > index 0000000000..66e0392af6
> > --- /dev/null
> > +++ b/meta/recipes-support/libgit2/libgit2/run-ptest
> > @@ -0,0 +1,7 @@
> > +#!/bin/sh
> > +
> > +cd tests
> > +
> > +export CLAR_SUMMARY="${PWD}/results.xml"
> > +
> > +./libgit2_tests -t | sed -e 's|ok .* - # SKIP|SKIP:|' -e 's|not ok .* -|FAIL:|'  -e 's|ok .* -|PASS:|'
> > diff --git a/meta/recipes-support/libgit2/libgit2_1.5.0.bb
> > b/meta/recipes-support/libgit2/libgit2_1.5.0.bb
> > index ee4d79b11a..aca8b94551 100644
> > --- a/meta/recipes-support/libgit2/libgit2_1.5.0.bb
> > +++ b/meta/recipes-support/libgit2/libgit2_1.5.0.bb
> > @@ -5,12 +5,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=112e6bb421dea73cd41de09e777f2d2c"
> >
> >  DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
> >
> > -SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main;protocol=https"
> > +SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main;protocol=https \
> > +           file://0001-tests-add-CLAR_FIXTURES_DIR-for-ptest.patch \
> > +           file://run-ptest \
> > +          "
> >  SRCREV = "fbea439d4b6fc91c6b619d01b85ab3b7746e4c19"
> >
> >  S = "${WORKDIR}/git"
> >
> > -inherit cmake
> > +inherit cmake ptest
> >
> >  EXTRA_OECMAKE = "\
> >      -DBUILD_CLAR=OFF \
> > @@ -19,4 +22,15 @@ EXTRA_OECMAKE = "\
> >      -DREGEX_BACKEND='pcre2' \
> >  "
> >
> > +EXTRA_OECMAKE_PTEST = " -DBUILD_CLAR=ON -DVALGRIND=ON -DCLAR_FIXTURES_DIR=${PTEST_PATH}/tests "
> > +
> > +EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${EXTRA_OECMAKE_PTEST}', '', d)} "
> > +
> > +do_install_ptest(){
> > +        install -d ${D}${PTEST_PATH}/tests/
> > +        install ${B}/libgit2_tests ${D}${PTEST_PATH}/tests/
> > +        cp ${S}/tests/resources/ ${D}${PTEST_PATH}/tests/ -rf }
> > +
> > +
> >  BBCLASSEXTEND = "native"
> > --
> > 2.39.0
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#176788):
> > https://lists.openembedded.org/g/openembedded-core/message/176788
> > Mute This Topic: https://lists.openembedded.org/mt/96779266/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

