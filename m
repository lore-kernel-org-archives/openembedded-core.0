Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 174D3C46467
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:06 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.15984.1672594677535279752
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:37:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=m8/sJ4d0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9so10395511pll.9
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9vhzyoxaGECiXzyxbIeV1m8T3tzF9UJCwDC1ww8PLZg=;
        b=m8/sJ4d0g/SHQ5sOQUPnYFUE4MQQkgT+ttR8qX4fz7HNX+/6xOL9ZDV5a9JAf/PGx+
         NB2aYxQoZr2hiYdt5rMhKBitbEAaAQ8B3dyFKnJXB+vuGT1Hpzy0OORbuyV1pR48lOA5
         VNXhw4cdztl/pB8Q2i6vnyGpEyo9G6vmo27/OuNnAlkmmC2S7MG13LYl6T9yeINgF2FO
         GBgxAUagVuHZ/brNqOhBAPWqaXI12lPF9QzOWe0Oztc/gG3eh6WHIbyTTd3dmqhhr9F7
         4MvJ35sHyAxffS+SRhpkgOG7bPdtPz8rFqyFD3pWP6ygqWELTean75bhFIITOv8Y11FO
         XdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9vhzyoxaGECiXzyxbIeV1m8T3tzF9UJCwDC1ww8PLZg=;
        b=bHiNngrTNUwzrU7BZmMKwuH94l91/TY8fPn6tta1dYTLDhfcft+MfSRjigy8V03XM8
         Neazr3cd8TtjRdxPraWn7enT4XcRcRZeHtQvm2mzmPNGn8WoStECX8hqJsv3mSD/iNmu
         iXIcqUYlKd0icL3cTCgHSLUlxNCRjvV401ha0Nzj37YfamaK4GTcWMQIXfj6eT7NcyG0
         aYV93ZQcQX4Y/t97iGHVhPGfMVByAIcF5ah16wc7GKGBMS3+v8nfwkr8oFHBI3liSWxr
         7uWuPHxFqxxykTpzPo9RePK1yfs8tsIpQIpQNoLpj0VBAoChrRd7ismcI4CYrDwosG9Y
         2RAQ==
X-Gm-Message-State: AFqh2krw77gRvY/F342dbzaCsd//+/ATHc08wVY31UMVDDEUbnk5bnEf
	9h/zgxPaH8yQ52y6X6BP+8JIl3cuXwZXhhPJd7Y=
X-Google-Smtp-Source: AMrXdXvdW4JcBmwOX3yFc08TZSU6suTFFbJad5FERcdjU2MM5rQXpL9aomB+DlTeRfUGj58Tyeuz0Q==
X-Received: by 2002:a05:6a20:1715:b0:b0:25ba:1764 with SMTP id bn21-20020a056a20171500b000b025ba1764mr40684218pzb.26.1672594676208;
        Sun, 01 Jan 2023 09:37:56 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.37.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:37:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/29] Patch review
Date: Sun,  1 Jan 2023 07:37:22 -1000
Message-Id: <cover.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175188

Please review this set of patches for kirkstone and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4710

The following changes since commit ada5e64a97d5f269886772540e0bb0c324088b21:

  efibootmgr: update compilation with musl (2022-12-17 04:10:41 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alejandro Hernandez Samaniego (1):
  baremetal-image: Avoid overriding qemu variables from IMAGE_CLASSES

Alexander Kanavin (5):
  libnewt: update 0.52.21 -> 0.52.23
  ruby: merge .inc into .bb
  ruby: update 3.1.2 -> 3.1.3
  tzdata: update 2022d -> 2022g
  devtool/upgrade: correctly handle recipes where S is a subdir of
    upstream tree

Bruce Ashfield (3):
  linux-yocto/5.10: update to v5.10.152
  linux-yocto/5.10: update to v5.10.154
  linux-yocto/5.10: update to v5.10.160

Hitendra Prajapati (2):
  systemd: CVE-2022-45873 deadlock in systemd-coredump via a crash with
    a long backtrace
  libX11: CVE-2022-3554 & CVE-2022-3555 Fix memory leak

Jagadeesh Krishnanjanappa (1):
  qemuboot.bbclass: make sure runqemu boots bundled initramfs kernel
    image

Joshua Watt (1):
  classes/create-spdx: Add SPDX_PRETTY option

Kai Kang (1):
  webkitgtk: 2.36.7 -> 2.36.8

Martin Jansa (1):
  libxml2: fix test data checksums

Ovidiu Panait (1):
  kernel.bbclass: remove empty module directories to prevent QA issues

Quentin Schulz (1):
  cairo: update patch for CVE-2019-6461 with upstream solution

Randy MacLeod (1):
  valgrind: skip the boost_thread test on arm

Ranjitsinh Rathod (3):
  curl: Correct LICENSE from MIT-open-group to curl
  curl: Add patch to fix CVE-2022-43551
  curl: Add patch to fix CVE-2022-43552

Richard Purdie (1):
  oeqa/concurrencytest: Add number of failures to summary output

Robert Andersson (1):
  go-crosssdk: avoid host contamination by GOCACHE

Ross Burton (1):
  libepoxy: remove upstreamed patch

Vivek Kumbhar (1):
  sqlite: fix CVE-2022-46908 safe mode authorizer callback allows
    disallowed UDFs.

Wang Mingyu (2):
  libpng: upgrade 1.6.38 -> 1.6.39
  gstreamer1.0: upgrade 1.20.4 -> 1.20.5

Xiangyu Chen (1):
  openssh: remove RRECOMMENDS to rng-tools for sshd package

Yash.Shinde@windriver.com (1):
  binutils : Fix CVE-2022-4285

 meta/classes/baremetal-image.bbclass          |  11 ++
 meta/classes/create-spdx.bbclass              |  22 +++-
 meta/classes/kernel.bbclass                   |   4 +-
 meta/classes/qemuboot.bbclass                 |   3 +-
 meta/lib/oe/sbom.py                           |   4 +-
 meta/lib/oeqa/core/utils/concurrencytest.py   |   4 +-
 .../openssh/openssh_8.9p1.bb                  |  10 +-
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   4 +-
 .../systemd/systemd/CVE-2022-45873.patch      | 124 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |   1 +
 .../binutils/binutils-2.38.inc                |   1 +
 .../binutils/0019-CVE-2022-4285.patch         |  37 ++++++
 meta/recipes-devtools/go/go-crosssdk.inc      |   2 +
 meta/recipes-devtools/ruby/ruby.inc           |  39 ------
 ...001-Remove-dependency-on-libcapstone.patch |  36 -----
 .../ruby/{ruby_3.1.2.bb => ruby_3.1.3.bb}     |  48 ++++++-
 .../valgrind/valgrind/remove-for-aarch64      |   1 +
 .../0001-detect-gold-as-GNU-linker-too.patch  |  14 +-
 ...-t-ignore-CFLAGS-when-building-snack.patch |  29 ----
 ...{libnewt_0.52.21.bb => libnewt_0.52.23.bb} |   4 +-
 meta/recipes-extended/timezone/timezone.inc   |   7 +-
 .../cairo/cairo/CVE-2019-6461.patch           |  35 ++++-
 ...atch_common.h-define-also-EGL_NO_X11.patch |  27 ----
 .../libepoxy/libepoxy_1.5.10.bb               |   4 +-
 .../xorg-lib/libx11/CVE-2022-3554.patch       |  58 ++++++++
 .../xorg-lib/libx11/CVE-2022-3555.patch       |  40 ++++++
 .../xorg-lib/libx11_1.7.3.1.bb                |   2 +
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 ++--
 ...tools_1.20.4.bb => gst-devtools_1.20.5.bb} |   2 +-
 ...1.20.4.bb => gstreamer1.0-libav_1.20.5.bb} |   2 +-
 ...x_1.20.4.bb => gstreamer1.0-omx_1.20.5.bb} |   2 +-
 ....bb => gstreamer1.0-plugins-bad_1.20.5.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-base_1.20.5.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-good_1.20.5.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.20.5.bb} |   2 +-
 ....20.4.bb => gstreamer1.0-python_1.20.5.bb} |   2 +-
 ....bb => gstreamer1.0-rtsp-server_1.20.5.bb} |   2 +-
 ...1.20.4.bb => gstreamer1.0-vaapi_1.20.5.bb} |   2 +-
 ...er1.0_1.20.4.bb => gstreamer1.0_1.20.5.bb} |   2 +-
 .../{libpng_1.6.38.bb => libpng_1.6.39.bb}    |   2 +-
 ...ebkitgtk_2.36.7.bb => webkitgtk_2.36.8.bb} |   4 +-
 .../curl/curl/CVE-2022-43551.patch            |  35 +++++
 .../curl/curl/CVE-2022-43552.patch            |  80 +++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   4 +-
 .../sqlite/files/CVE-2022-46908.patch         |  39 ++++++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |   1 +
 scripts/lib/devtool/standard.py               |  19 +--
 scripts/lib/devtool/upgrade.py                |  18 ++-
 50 files changed, 595 insertions(+), 238 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-45873.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby.inc
 delete mode 100644 meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch
 rename meta/recipes-devtools/ruby/{ruby_3.1.2.bb => ruby_3.1.3.bb} (68%)
 delete mode 100644 meta/recipes-extended/newt/files/0002-don-t-ignore-CFLAGS-when-building-snack.patch
 rename meta/recipes-extended/newt/{libnewt_0.52.21.bb => libnewt_0.52.23.bb} (87%)
 delete mode 100644 meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3554.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3555.patch
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.4.bb => gst-devtools_1.20.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.4.bb => gstreamer1.0-libav_1.20.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.4.bb => gstreamer1.0-omx_1.20.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.4.bb => gstreamer1.0-plugins-bad_1.20.5.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.4.bb => gstreamer1.0-plugins-base_1.20.5.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.4.bb => gstreamer1.0-plugins-good_1.20.5.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.4.bb => gstreamer1.0-plugins-ugly_1.20.5.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.4.bb => gstreamer1.0-python_1.20.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.4.bb => gstreamer1.0-rtsp-server_1.20.5.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.4.bb => gstreamer1.0-vaapi_1.20.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.4.bb => gstreamer1.0_1.20.5.bb} (97%)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.38.bb => libpng_1.6.39.bb} (93%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.7.bb => webkitgtk_2.36.8.bb} (97%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-43551.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-43552.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2022-46908.patch

-- 
2.25.1


