Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10394C001DF
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:02 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.77616.1690740060687111558
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=UUx1upTH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-68336d06620so3821074b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740059; x=1691344859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=U8QWuFQVMDpplW4bycRc5wqwMMK5C4jqsciRmMQyUrw=;
        b=UUx1upTHxDaXF2g2Uu+1g80oN9cn/mxH72RgVeQ7mPa26Od1uih16OpRVtM86Ev1lA
         zg5nMc6Ous0x0dsM5V8dmT/XfTYuDXuYvsphKCBX3nyEMNVNTGYRfP18G8WabcLAtQHV
         yrWrlASIokmWriBguIwd28c+TE/Bb+DatFm5WcXhp6L8kvS6HsPSGL3ENFWt8JLujMFd
         X23eVYXmWNO9vmbNM0hJUhAE8L5cEKKYAknyKDK1WTPj7+1yIAMDsKkbIsZmCbSq6rIO
         3b0w3hD0x9GLGyTdQMyc6bYwvUK339SMvoGsA7EFYnGSgHS8HrbXBo71uccVh9ZnP8Vs
         yAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740059; x=1691344859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U8QWuFQVMDpplW4bycRc5wqwMMK5C4jqsciRmMQyUrw=;
        b=fmWG/1HMa+eprx6W6cB0Eke3R8CNfQyCHgX7oeLceQrYu412FBKGJtsoPbGxNXupEZ
         mAMkcQVDg3pyDLzayXY9AR/hibWfqOSTQMLOpk3xWY+cAUc+v9V62MrETDex5P+BVQ1t
         DJ9bqjomGUmsFcqDBeKxgHFNXnBTEyDi63mlh5b15YrnqolAPhAWe5KKSBmzlcO/J4yd
         R+06aKeWVQR+0lm0J2otKA94p7thqxbofrctJp1JqCbuN/cGE4v1fOXzazJAop83UusC
         TFdMw/1YYOcKUX8OinafACzWykrgnuEu3ZzXbJy32poxEq+a9lU5HpFuAXejGxgj3I/d
         f7ag==
X-Gm-Message-State: ABy/qLZELFd4/Hg9oz33Pia8ONaQQN7zAd8Et67xPl2vSIQh1TKufsnL
	PSmHsr3q4Sy/Ke3FpYruxbHEFgsJSstXtEy2pepdcA==
X-Google-Smtp-Source: APBJJlEJR7TIFyjcAttg5dJSA5F8whvn5O68e7U4ghdWDWk+ZpAiAQVG3Y3SgYY9CcoOj25JccSzjg==
X-Received: by 2002:a05:6a00:240a:b0:64f:35c8:8584 with SMTP id z10-20020a056a00240a00b0064f35c88584mr9348518pfh.18.1690740059500;
        Sun, 30 Jul 2023 11:00:59 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.00.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:00:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/30] Patch review
Date: Sun, 30 Jul 2023 08:00:23 -1000
Message-Id: <cover.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185078

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5667

The following changes since commit e7d3e02a624f7ce23d012bb11ad1df2049066b37:

  package.bbclass: moving field data process before variable process in process_pkgconfig (2023-07-21 07:14:06 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (1):
  diffutils: update 3.9 -> 3.10

Andrej Valek (1):
  kernel: add missing path to search for debug files

Archana Polampalli (1):
  openssh: fix CVE-2023-38408

Benjamin Bouvier (1):
  util-linux: add alternative links for ipcs,ipcrm

Hitendra Prajapati (3):
  tiff: fix multiple CVEs
  tiff: fix multiple CVEs
  libtiff: fix CVE-2023-26965 heap-based use after free

Jose Quaresma (2):
  openssl: add PERLEXTERNAL path to test its existence
  openssl: use a glob on the PERLEXTERNAL to track updates on the path

Khem Raj (1):
  meson.bbclass: Point to llvm-config from native sysroot

Martin Jansa (1):
  libxcrypt: fix build with perl-5.38 and use master branch

Ovidiu Panait (4):
  mdadm: fix util-linux ptest dependency
  mdadm: fix 07revert-inplace ptest
  mdadm: fix segfaults when running ptests
  mdadm: skip running known broken ptests

Peter Marko (2):
  libjpeg-turbo: patch CVE-2023-2804
  python3: ignore CVE-2023-36632

Quentin Schulz (1):
  uboot-extlinux-config.bbclass: fix old override syntax in comment

Ross Burton (2):
  python3: fix missing comma in get_module_deps3.py
  oeqa/runtime/cases/rpm: fix wait_for_no_process_for_user failure case

Sundeep KOKKONDA (1):
  gcc : upgrade to v11.4

Tim Orling (1):
  python3: upgrade 3.10.9 -> 3.10.12

Vivek Kumbhar (1):
  go: fix CVE-2023-29406 net/http insufficient sanitization of Host
    header

Wang Mingyu (3):
  libassuan: upgrade 2.5.5 -> 2.5.6
  libksba: upgrade 1.6.3 -> 1.6.4
  lttng-ust: upgrade 2.13.5 -> 2.13.6

Yoann Congal (2):
  recipetool: Fix inherit in created -native* recipes
  oeqa/selftest/devtool: add unit test for "devtool add -b"

Yogita Urade (1):
  dmidecode: fix CVE-2023-30630

Yuta Hayama (1):
  systemd-systemctl: fix errors in instance name expansion

 meta/classes/kernel.bbclass                   |   1 +
 meta/classes/meson.bbclass                    |   1 +
 meta/classes/uboot-extlinux-config.bbclass    |   8 +-
 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/lib/oeqa/runtime/cases/rpm.py            |   4 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |  32 +
 .../openssh/openssh/CVE-2023-38408-0001.patch | 585 ++++++++++++++++++
 .../openssh/openssh/CVE-2023-38408-0002.patch | 173 ++++++
 .../openssh/openssh/CVE-2023-38408-0003.patch |  36 ++
 .../openssh/openssh/CVE-2023-38408-0004.patch | 114 ++++
 .../openssh/openssh_8.9p1.bb                  |   4 +
 .../openssl/openssl_3.0.9.bb                  |   4 +-
 ...ommon.pm-compatible-with-latest-perl.patch |  50 ++
 ...ve-smartmatch-usage-from-gen-crypt-h.patch |  62 ++
 meta/recipes-core/libxcrypt/libxcrypt.inc     |   7 +-
 .../systemd/systemd-systemctl/systemctl       |   2 +-
 .../util-linux/util-linux_2.37.4.bb           |   2 +
 .../dmidecode/CVE-2023-30630_1.patch          | 237 +++++++
 .../dmidecode/CVE-2023-30630_2.patch          |  80 +++
 .../dmidecode/CVE-2023-30630_3.patch          |  69 +++
 .../dmidecode/CVE-2023-30630_4.patch          | 137 ++++
 .../dmidecode/dmidecode_3.3.bb                |   4 +
 .../gcc/{gcc-11.3.inc => gcc-11.4.inc}        |   6 +-
 ...ian_11.3.bb => gcc-cross-canadian_11.4.bb} |   0
 .../{gcc-cross_11.3.bb => gcc-cross_11.4.bb}  |   0
 ...-crosssdk_11.3.bb => gcc-crosssdk_11.4.bb} |   0
 ...cc-runtime_11.3.bb => gcc-runtime_11.4.bb} |   0
 ...itizers_11.3.bb => gcc-sanitizers_11.4.bb} |   0
 ...{gcc-source_11.3.bb => gcc-source_11.4.bb} |   0
 ...rch64-Update-Neoverse-N2-core-defini.patch |  20 +-
 ...rm-add-armv9-a-architecture-to-march.patch |  54 +-
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 102 +--
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |   6 +-
 .../gcc/{gcc_11.3.bb => gcc_11.4.bb}          |   0
 ...initial_11.3.bb => libgcc-initial_11.4.bb} |   0
 .../gcc/{libgcc_11.3.bb => libgcc_11.4.bb}    |   0
 ...ibgfortran_11.3.bb => libgfortran_11.4.bb} |   0
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2023-29406.patch           | 210 +++++++
 .../python/python3/cve-2023-24329.patch       |  50 --
 .../python/python3/get_module_deps3.py        |   2 +-
 .../{python3_3.10.9.bb => python3_3.10.12.bb} |   7 +-
 ...001-Skip-strip-trailing-cr-test-case.patch |  19 +-
 .../{diffutils_3.9.bb => diffutils_3.10.bb}   |   2 +-
 ...anup-validate_geometry_ddf_container.patch | 148 +++++
 ...nter-dereference-in-validate_geometr.patch |  56 ++
 ...se-after-close-bug-by-closing-after-.patch |  91 +++
 ...gfault-when-calling-NULL-get_bad_blo.patch |  42 ++
 ...Mark-and-ignore-broken-test-failures.patch | 128 ++++
 ...dd-broken-files-for-all-broken-tests.patch | 454 ++++++++++++++
 meta/recipes-extended/mdadm/files/run-ptest   |   2 +-
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |   9 +-
 .../jpeg/files/CVE-2023-2804-1.patch          | 103 +++
 .../jpeg/files/CVE-2023-2804-2.patch          |  75 +++
 .../jpeg/libjpeg-turbo_2.1.5.1.bb             |   2 +
 ...ttng-ust_2.13.5.bb => lttng-ust_2.13.6.bb} |   2 +-
 .../CVE-2023-0795_0796_0797_0798_0799.patch   | 162 +++++
 .../libtiff/tiff/CVE-2023-25433.patch         | 195 ++++++
 .../tiff/CVE-2023-25434-CVE-2023-25435.patch  |  94 +++
 .../libtiff/tiff/CVE-2023-26965.patch         |  97 +++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   4 +
 ...{libassuan_2.5.5.bb => libassuan_2.5.6.bb} |   2 +-
 .../{libksba_1.6.3.bb => libksba_1.6.4.bb}    |   2 +-
 scripts/lib/recipetool/create.py              |   4 +
 64 files changed, 3585 insertions(+), 180 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-0001.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-0002.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-0003.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-0004.patch
 create mode 100644 meta/recipes-core/libxcrypt/files/0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch
 create mode 100644 meta/recipes-core/libxcrypt/files/0002-Remove-smartmatch-usage-from-gen-crypt-h.patch
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1.patch
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_2.patch
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_3.patch
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_4.patch
 rename meta/recipes-devtools/gcc/{gcc-11.3.inc => gcc-11.4.inc} (97%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_11.3.bb => gcc-cross-canadian_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_11.3.bb => gcc-cross_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_11.3.bb => gcc-crosssdk_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_11.3.bb => gcc-runtime_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_11.3.bb => gcc-sanitizers_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_11.3.bb => gcc-source_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_11.3.bb => gcc_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_11.3.bb => libgcc-initial_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_11.3.bb => libgcc_11.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_11.3.bb => libgfortran_11.4.bb} (100%)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-29406.patch
 delete mode 100644 meta/recipes-devtools/python/python3/cve-2023-24329.patch
 rename meta/recipes-devtools/python/{python3_3.10.9.bb => python3_3.10.12.bb} (98%)
 rename meta/recipes-extended/diffutils/{diffutils_3.9.bb => diffutils_3.10.bb} (93%)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-DDF-Cleanup-validate_geometry_ddf_container.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0002-DDF-Fix-NULL-pointer-dereference-in-validate_geometr.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0003-mdadm-Grow-Fix-use-after-close-bug-by-closing-after-.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0006-tests-Add-broken-files-for-all-broken-tests.patch
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2023-2804-1.patch
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2023-2804-2.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.5.bb => lttng-ust_2.13.6.bb} (95%)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-0795_0796_0797_0798_0799.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-25433.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-25434-CVE-2023-25435.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-26965.patch
 rename meta/recipes-support/libassuan/{libassuan_2.5.5.bb => libassuan_2.5.6.bb} (93%)
 rename meta/recipes-support/libksba/{libksba_1.6.3.bb => libksba_1.6.4.bb} (94%)

-- 
2.34.1


