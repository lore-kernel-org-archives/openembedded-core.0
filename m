Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D7AEE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:36:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.13048.1692801374395767261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=LxLFYKC1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1bbc87ded50so38272365ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801373; x=1693406173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dwxVc0s6mXcKsOzfgw3u1Zi5P/9+i7iA48LTFMVD5SA=;
        b=LxLFYKC1XHu7Sk0w0/VZr24Wx08zNxaidQBe1vaEO/tVueS/XyF8M1hCtZWDCpADd+
         74KXexIUycMlMBcV5a3SONsWyQhP9TCnDBdZQ1dxlu6TFi8SQBYpY00NcRHBGRRiodAR
         acBw5wqfmmCd74CefsK8jeVMzV+PXuEt/xwDPjn3Q0eKt4pvnt8xkZ19RU2JIH4fo37d
         P3B7ZaDRJmbg9RjVQ3uSuRsA8zxvkToqi2+bDHgG3OaH4PCJI9316CzeMv90870+FmZt
         CBFYyux3WXm0l0ns1pUMtL6B9hWXgaMmNTxUiOCWPxeetPFjXTsW12gtNfnq2btzOAZC
         MlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801373; x=1693406173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dwxVc0s6mXcKsOzfgw3u1Zi5P/9+i7iA48LTFMVD5SA=;
        b=ardxAxhyB/+96nSmOzXPFVsKLK2su7lYCORcQVxM4B7At94EZXifKebeVPosomIBiM
         m4O0vPVH/N9uZd3PhCf7GEaToMIJrCQtBiY08moYOZ0Okr8t6uAxbVXwtIznNNOHwJQl
         otIFT7okCet5XQzvwCgkdcRuHzslMsekfRGh9gPxlwctA+odZEbqwSrwAYaBpFk51Kud
         NVShi7TMUuQ/57hPFwevulCIRBmUWPYaZFXxsob8+mXR7I4pQFDSp8CRouM4eOhjjmbl
         e7BowYCahsWKi9hXzbTH6PbxYnhX8V5c5mVLMo9jssBXAFcVzdKvsG4QPJZijUQTigbN
         d5NQ==
X-Gm-Message-State: AOJu0Yy9CseenxlXVFVQIXum0/NFpnDOmR8KwM2f1dKDhIdG4DSlUuF8
	GmDWD5WZP0C4z3+Td3nxU5dLjxS4/kiXhaebrw8=
X-Google-Smtp-Source: AGHT+IGA/uCBwkqOEyo8u0mPQAi8EAqvLG6V2HvnQWm1Xa6FHenpTpF1B/baHlJmfwzZto+TQYmasA==
X-Received: by 2002:a17:903:25d4:b0:1bc:2c83:f770 with SMTP id jc20-20020a17090325d400b001bc2c83f770mr9313905plb.45.1692801373307;
        Wed, 23 Aug 2023 07:36:13 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.36.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:36:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/36] Patch review
Date: Wed, 23 Aug 2023 04:35:30 -1000
Message-Id: <cover.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186581

Please review this set of changes for kirkstone and have comments back by
end of day Friday, August 25.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5772

The following changes since commit f20a06149cb61264662d1eaf6ea02aefabc0a18b:

  libxcrypt: update PV to match SRCREV (2023-08-16 06:11:05 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alex Kiernan (2):
  rootfs: Add debugfs package db file copy and cleanup
  rpm: Pick debugfs package db files/dirs explicitly

Alexander Kanavin (1):
  glibc-locale: use stricter matching for metapackages' runtime
    dependencies

Anuj Mittal (5):
  selftest/cases/glibc.py: fix the override syntax
  glibc/check-test-wrapper: don't emit warnings from ssh
  selftest/cases/glibc.py: increase the memory for testing
  oeqa/utils/nfs: allow requesting non-udp ports
  selftest/cases/glibc.py: switch to using NFS over TCP

Archana Polampalli (1):
  gstreamer1.0: upgrade 1.20.6 -> 1.20.7

BELOUARGA Mohamed (1):
  linux-firmware : Add firmware of RTL8822 serie

Bruce Ashfield (3):
  linux-yocto/5.15: update to v5.15.122
  linux-yocto/5.15: update to v5.15.123
  linux-yocto/5.15: update to v5.15.124

Chee Yang Lee (2):
  librsvg: 2.52.7 -> 2.52.10
  bind: 9.18.11 -> 9.18.17

Dmitry Baryshkov (2):
  linux-firmware: package firmare for Dragonboard 410c
  linux-firmware: split platform-specific Adreno shaders to separate
    packages

Enrico Scholz (1):
  shadow-sysroot: add license information

Julien Stephan (1):
  automake: fix buildtest patch

Michael Halstead (3):
  yocto-uninative: Update hashes for uninative 4.1
  yocto-uninative: Update to 4.2 for glibc 2.38
  resulttool/resultutils: allow index generation despite corrupt json

Ovidiu Panait (1):
  mdadm: add util-linux-blockdev ptest dependency

Poonam Jadhav (1):
  pixman: Remove duplication of license MIT

Richard Purdie (6):
  lib/package_manager: Improve repo artefact filtering
  acl/attr: ptest fixes and improvements
  oeqa/target/ssh: Ensure EAGAIN doesn't truncate output
  oeqa/runtime/ltp: Increase ltp test output timeout
  target/ssh: Ensure exit code set for commands
  oeqa/ssh: Further improve process exit handling

Soumya Sambu (3):
  glib-2.0: Fix CVE-2023-32665
  glib-2.0: Fix CVE-2023-29499 and CVE-2023-32611
  glib-2.0: Fix CVE-2023-32643 and CVE-2023-32636

Staffan Rydén (1):
  kernel: Fix path comparison in kernel staging dir symlinking

Trevor Gamblin (1):
  linux-firmware: upgrade 20230515 -> 20230625

Wang Mingyu (1):
  libnss-nis: upgrade 3.1 -> 3.2

 meta/classes/kernel.bbclass                   |   7 +-
 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 meta/lib/oe/package_manager/__init__.py       |   5 +-
 meta/lib/oe/package_manager/rpm/rootfs.py     |   2 +-
 meta/lib/oe/rootfs.py                         |  20 +-
 meta/lib/oeqa/core/target/ssh.py              |   7 +
 meta/lib/oeqa/runtime/cases/ltp.py            |   2 +-
 meta/lib/oeqa/selftest/cases/glibc.py         |   8 +-
 meta/lib/oeqa/utils/nfs.py                    |   4 +-
 .../bind/bind-9.18.11/CVE-2023-2828.patch     | 197 ---------
 .../bind/bind-9.18.11/CVE-2023-2911.patch     |  97 ----
 ...1-avoid-start-failure-with-bind-user.patch |   0
 ...d-V-and-start-log-hide-build-options.patch |   0
 ...ching-for-json-headers-searches-sysr.patch |   0
 .../bind/{bind-9.18.11 => bind-9.18.17}/bind9 |   0
 .../{bind-9.18.11 => bind-9.18.17}/conf.patch |   0
 .../generate-rndc-key.sh                      |   0
 ...t.d-add-support-for-read-only-rootfs.patch |   0
 .../make-etc-initd-bind-stop-work.patch       |   0
 .../named.service                             |   0
 .../bind/{bind_9.18.11.bb => bind_9.18.17.bb} |   8 +-
 .../glib-2.0/glib-2.0/CVE-2023-29499.patch    | 291 ++++++++++++
 .../glib-2.0/CVE-2023-32611-0001.patch        |  97 ++++
 .../glib-2.0/CVE-2023-32611-0002.patch        | 282 ++++++++++++
 .../glib-2.0/glib-2.0/CVE-2023-32636.patch    |  50 +++
 .../glib-2.0/glib-2.0/CVE-2023-32643.patch    | 155 +++++++
 .../glib-2.0/CVE-2023-32665-0001.patch        | 104 +++++
 .../glib-2.0/CVE-2023-32665-0002.patch        | 211 +++++++++
 .../glib-2.0/CVE-2023-32665-0003.patch        | 418 ++++++++++++++++++
 .../glib-2.0/CVE-2023-32665-0004.patch        | 114 +++++
 .../glib-2.0/CVE-2023-32665-0005.patch        |  81 ++++
 .../glib-2.0/CVE-2023-32665-0006.patch        | 397 +++++++++++++++++
 .../glib-2.0/CVE-2023-32665-0007.patch        |  50 +++
 .../glib-2.0/CVE-2023-32665-0008.patch        | 395 +++++++++++++++++
 .../glib-2.0/CVE-2023-32665-0009.patch        |  98 ++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  14 +
 meta/recipes-core/glibc/glibc-locale.inc      |   8 +-
 .../glibc/glibc/check-test-wrapper            |   2 +-
 .../automake/automake/buildtest.patch         |   2 +-
 .../recipes-extended/libnss-nis/libnss-nis.bb |   4 +-
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |   9 +-
 .../shadow/files/login.defs_shadow-sysroot    |   1 +
 .../shadow/shadow-sysroot_4.6.bb              |   2 +-
 .../{librsvg_2.52.7.bb => librsvg_2.52.10.bb} |   2 +-
 .../xorg-lib/pixman_0.40.0.bb                 |   2 +-
 ...20230515.bb => linux-firmware_20230625.bb} |  37 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 ...tools_1.20.6.bb => gst-devtools_1.20.7.bb} |   2 +-
 ...1.20.6.bb => gstreamer1.0-libav_1.20.7.bb} |   2 +-
 ...x_1.20.6.bb => gstreamer1.0-omx_1.20.7.bb} |   2 +-
 ....bb => gstreamer1.0-plugins-bad_1.20.7.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-base_1.20.7.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-good_1.20.7.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.20.7.bb} |   2 +-
 ....20.6.bb => gstreamer1.0-python_1.20.7.bb} |   2 +-
 ....bb => gstreamer1.0-rtsp-server_1.20.7.bb} |   2 +-
 ...1.20.6.bb => gstreamer1.0-vaapi_1.20.7.bb} |   2 +-
 ...er1.0_1.20.6.bb => gstreamer1.0_1.20.7.bb} |   2 +-
 meta/recipes-support/attr/acl/run-ptest       |   6 +
 meta/recipes-support/attr/acl_2.3.1.bb        |   1 +
 meta/recipes-support/attr/attr.inc            |   1 +
 meta/recipes-support/attr/attr/run-ptest      |   7 +
 scripts/lib/resulttool/resultutils.py         |   6 +-
 65 files changed, 2901 insertions(+), 373 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2828.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind-9.18.11/CVE-2023-2911.patch
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.17}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.17}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.17}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.17}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.17}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.17}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.17}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.17}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.18.17}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.11.bb => bind_9.18.17.bb} (92%)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-29499.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32611-0001.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32611-0002.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32636.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32643.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0001.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0002.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0003.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0004.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0005.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0006.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0007.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0008.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0009.patch
 rename meta/recipes-gnome/librsvg/{librsvg_2.52.7.bb => librsvg_2.52.10.bb} (96%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230515.bb => linux-firmware_20230625.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.6.bb => gst-devtools_1.20.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.6.bb => gstreamer1.0-libav_1.20.7.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.6.bb => gstreamer1.0-omx_1.20.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.6.bb => gstreamer1.0-plugins-bad_1.20.7.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.6.bb => gstreamer1.0-plugins-base_1.20.7.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.6.bb => gstreamer1.0-plugins-good_1.20.7.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.6.bb => gstreamer1.0-plugins-ugly_1.20.7.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.6.bb => gstreamer1.0-python_1.20.7.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.6.bb => gstreamer1.0-rtsp-server_1.20.7.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.6.bb => gstreamer1.0-vaapi_1.20.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.6.bb => gstreamer1.0_1.20.7.bb} (97%)

-- 
2.34.1


