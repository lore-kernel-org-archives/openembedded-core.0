Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8A6C64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 02:49:06 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.10357.1678416543864620654
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 18:49:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=zcXmEqoX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id h8so4154754plf.10
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 18:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678416543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tLM9pfL8907XgFENcIfEozdfD5kMNT2/Jt4ezHtInGM=;
        b=zcXmEqoXGIFvzRpnN57HlYuZtdOBNEPcLmIQlweOCGtmMMfJOxSv0t3vO7byYU5sGl
         f3tWTrd8ECB7lwN4UNXJG3btYWZbpIEJl/escboEYeOMo24GUzu+E9pnoz4rKzzQwn3j
         yxbmOiGNbOUECAHVhwyJ1ipFHZXFg4LzTD62YRl8VvjJrRBMZltJxe9eBEwoN8+S1hyL
         0+Cb04HcY5C2XiAZ4pAbzO0QxspWpW8ofm3cxfC9H16z/px+WCLTtboBOvszIsA6gdje
         ie4qNpMMbfIBTYzVLAmJPQGNH1TFguEvpk5dIKKLOruIKDjr2TpX8Wjy0WE8tV2MDOw5
         C7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678416543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tLM9pfL8907XgFENcIfEozdfD5kMNT2/Jt4ezHtInGM=;
        b=OywRch8xsmEv92ZahG2ocP5FVNI91r8WaaxWpUftvftdcskYgDZqYTh31zDIJu4yiq
         tsQwNzuCs5kaeDuJn2Po1MgGeJb403Dmf/TZGmapV2kHR3pA2QsBSXRq6I3K655nDbgP
         dQfaKKXCDobj2KrDgXJ4mhycauGEO+Qu2WquiI2JX9hwpwAh9jO168vPK8QB2gT09qmz
         7w2mZjHqgf7mCPcJdfXOUmMhrDOyAHURiFCIip574eA5FpQGLK5N0yIuaBVmCUcEiquK
         pYiCsmfis13CKuoc5hsgsvZBt5/0RpbN3kqYHFk5r1FSsPbvBnpdWn1MC6miPLI2EzQE
         OFRw==
X-Gm-Message-State: AO0yUKXfqXOM2nznr5o9PV4yXqHZC6VrklVR5mZzEXQzSTcAICcF406Y
	bLet9fib5L1bjECqkhzMll4fXVHFlOyQ6QkldkE=
X-Google-Smtp-Source: AK7set96dcdJuVW14j5W3JFmroXQ8+mmCKameMk1+q/ug2kI0DDDPbf7i2JG0nYjRyWtkLryv4mJUw==
X-Received: by 2002:a05:6a20:431e:b0:cc:9b29:f617 with SMTP id h30-20020a056a20431e00b000cc9b29f617mr25105738pzk.0.1678416542663;
        Thu, 09 Mar 2023 18:49:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id n20-20020aa79054000000b0058b927b9653sm268936pfo.92.2023.03.09.18.49.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 18:49:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/23] Pull request (cover letter only)
Date: Thu,  9 Mar 2023 16:48:55 -1000
Message-Id: <cover.1678416279.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 02:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178305

The following changes since commit a3f31997c633e8476bad68c81fac0dcd0750c7d4:

  busybox: rm temporary files if do_compile was interrupted (2023-02-20 05:51:44 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (6):
  vim: update 9.0.1211 -> 9.0.1293 to resolve open CVEs
  linux-firmware: upgrade 20221214 -> 20230117
  linux-firmware: upgrade 20230117 -> 20230210
  wireless-regdb: upgrade 2022.08.12 -> 2023.02.13
  apr: update 1.7.0 -> 1.7.2
  apr-util: update 1.6.1 -> 1.6.3

Chee Yang Lee (1):
  tiff: fix multiple CVEs

Dmitry Baryshkov (2):
  linux-firmware: properly set license for all Qualcomm firmware
  linux-firmware: add yamato fw files to qcom-adreno-a2xx package

Hitendra Prajapati (1):
  curl: fix CVE-2022-43552 Use-after-free triggered by an HTTP proxy
    deny response

Hugo SIMELIERE (2):
  bluez5: Exclude CVE-2022-39177 from cve-check
  openssl: upgrade 1.1.1s to 1.1.1t

Khem Raj (2):
  apr: Use correct strerror_r implementation based on libc type
  apr: Cache configure tests which use AC_TRY_RUN

Mauro Queiros (1):
  image.bbclass: print all QA functions exceptions

Peter Kjellerstedt (1):
  devshell: Do not add scripts/git-intercept to PATH

Richard Purdie (2):
  apr: Fix to work with autoconf 2.70
  apr-util: Fix CFLAGS used in build

Rodolfo Quesada Zumbado (1):
  tar: CVE-2022-48303

Shubham Kulkarni (1):
  glibc: Security fix for CVE-2023-0687

Ulrich Ölmann (1):
  kernel-yocto: fix kernel-meta data detection

Vijay Anusuri (1):
  git: Security fix for CVE-2022-41903

Virendra Thakur (1):
  gcc: Fix inconsistent noexcept specifier for valarray in libstdc++

 meta/classes/devshell.bbclass                 |   2 -
 meta/classes/image.bbclass                    |   2 +-
 meta/classes/kernel-yocto.bbclass             |   2 +-
 meta/lib/oeqa/selftest/cases/reproducible.py  |   1 -
 .../bluez5/bluez5_5.55.bb                     |   7 +
 .../{openssl_1.1.1s.bb => openssl_1.1.1t.bb}  |   2 +-
 .../glibc/glibc/CVE-2023-0687.patch           |  82 +++
 meta/recipes-core/glibc/glibc_2.31.bb         |   1 +
 meta/recipes-devtools/gcc/gcc-9.5.inc         |   1 +
 ...nsistent-noexcept-specific-for-valar.patch |  44 ++
 .../git/files/CVE-2022-41903-01.patch         |  39 ++
 .../git/files/CVE-2022-41903-02.patch         | 187 +++++
 .../git/files/CVE-2022-41903-03.patch         | 146 ++++
 .../git/files/CVE-2022-41903-04.patch         | 150 ++++
 .../git/files/CVE-2022-41903-05.patch         |  98 +++
 .../git/files/CVE-2022-41903-06.patch         |  90 +++
 .../git/files/CVE-2022-41903-07.patch         | 123 ++++
 .../git/files/CVE-2022-41903-08.patch         |  67 ++
 .../git/files/CVE-2022-41903-09.patch         | 162 +++++
 .../git/files/CVE-2022-41903-10.patch         |  99 +++
 .../git/files/CVE-2022-41903-11.patch         |  90 +++
 .../git/files/CVE-2022-41903-12.patch         | 124 ++++
 meta/recipes-devtools/git/git.inc             |  12 +
 .../tar/tar/CVE-2022-48303.patch              |  43 ++
 meta/recipes-extended/tar/tar_1.32.bb         |   1 +
 ...20221214.bb => linux-firmware_20230210.bb} |  42 +-
 ....08.12.bb => wireless-regdb_2023.02.13.bb} |   2 +-
 .../libtiff/files/CVE-2022-3570_3598.patch    | 659 ++++++++++++++++++
 .../files/CVE-2022-3597_3626_3627.patch       | 123 ++++
 .../libtiff/files/CVE-2022-3599.patch         | 277 ++++++++
 .../libtiff/files/CVE-2022-3970.patch         |  45 ++
 .../libtiff/files/CVE-2022-48281.patch        |  26 +
 .../CVE-2023-0795_0796_0797_0798_0799.patch   | 157 +++++
 .../CVE-2023-0800_0801_0802_0803_0804.patch   | 135 ++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   7 +
 .../0001-Fix-error-handling-in-gdbm.patch     | 135 ----
 .../{apr-util_1.6.1.bb => apr-util_1.6.3.bb}  |   8 +-
 ...ion-to-disable-timed-dependant-tests.patch |  20 +-
 ...-runtime-test-for-mmap-that-can-map-.patch |  58 ++
 ...ir-path-references-from-installed-ap.patch |  25 +-
 ...configure.in-support-cross-compiling.patch |  63 --
 ...ze-doesn-t-match-in-glibc-when-cross.patch |  76 --
 .../apr/apr/CVE-2021-35940.patch              |  58 --
 .../apr/apr/libtoolize_check.patch            |  21 +-
 .../apr/{apr_1.7.0.bb => apr_1.7.2.bb}        |  24 +-
 .../curl/curl/CVE-2022-43552.patch            |  82 +++
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 48 files changed, 3238 insertions(+), 385 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1s.bb => openssl_1.1.1t.bb} (98%)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2023-0687.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.5/0002-libstdc-Fix-inconsistent-noexcept-specific-for-valar.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-01.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-02.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-03.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-04.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-05.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-06.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-07.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-08.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-09.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-10.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-11.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-41903-12.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2022-48303.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221214.bb => linux-firmware_20230210.bb} (96%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.08.12.bb => wireless-regdb_2023.02.13.bb} (94%)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-3570_3598.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-3597_3626_3627.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-3599.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-0795_0796_0797_0798_0799.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-0800_0801_0802_0803_0804.patch
 delete mode 100644 meta/recipes-support/apr/apr-util/0001-Fix-error-handling-in-gdbm.patch
 rename meta/recipes-support/apr/{apr-util_1.6.1.bb => apr-util_1.6.3.bb} (92%)
 create mode 100644 meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
 delete mode 100644 meta/recipes-support/apr/apr/0003-Makefile.in-configure.in-support-cross-compiling.patch
 delete mode 100644 meta/recipes-support/apr/apr/0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
 delete mode 100644 meta/recipes-support/apr/apr/CVE-2021-35940.patch
 rename meta/recipes-support/apr/{apr_1.7.0.bb => apr_1.7.2.bb} (80%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-43552.patch

-- 
2.34.1


