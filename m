Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AC2C4332F
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:55:33 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.92028.1669557328912778068
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=z9U6G0uC;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so11585328pjc.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rECWO/vrJBrQYK7pzk+0UY5HWQqisMGoviqBMHdo2Mo=;
        b=z9U6G0uCzQXZWgID1js1A+3rbkh8AVz4iYbRh9hfCVPfv+7Yfm5RIKm54WopFGTIkD
         cfFZDoM9moIK9yrvqgMmpL6c7Dq/8Fhem4TFbFb5xITY88MjFCVugy5Oueqxs7yaEkqr
         3zbScfZPkHeJPnF/ETbU7ZYg03Y7HNhkO87kZwp9jOK+fQEoRjzB5Lm+26Tzvx9YosQ+
         Orpqb7j3tjvlsrCxUD6mrjvCWBqzSzK0Sj8+mubKMK5/YOGW189JkYaio+Hjqr94Y56m
         KsYVdC0iKOpjZaTQQZoMTyY+x0ihgTqLA9oQTcFxMkaHI3hlYliyuJ67noGatLqE72oA
         kXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rECWO/vrJBrQYK7pzk+0UY5HWQqisMGoviqBMHdo2Mo=;
        b=oojc5cLFbg/oPy8Byjd+fHDdJ+7SbH1OUkzqZWzgHDV+rkgzC9yutG1t52+z3Pac+1
         UdT7aspGoC8FsnAGR5gw/AknaaHNsY9JuAcWudLLec93iHfemHJjwHP1UjmBsjZ1zCuu
         ipHVjJuDP3BkZK8TMpXhMRq9laGdInUo2L3Xyb3uM1wyjRxmWvan+8J5JPb7GAuntsg0
         ou3qMmsbFUhmLtfn6y4NMhgccco2BQyRQldKPas23jVJj7kV0stM6fzG9OuxuvDqOp33
         aTj/x0HyE3FRJdEehXAculdmBmI3iaVwfjLGd/WtM9jaE8/FgstoUgTqcGL0t6tN3uHi
         +ZZA==
X-Gm-Message-State: ANoB5pkA7VwG3tGassrBdFh32HnRcNSwD3MhBadTGW/iqmq+Q2Lp28YH
	kAJs3aC9gpkflfWwf2PmZ82xv113BwHhHkiLP50=
X-Google-Smtp-Source: AA0mqf4fVa1eySHxRJh8i/fMgY2aZfcUWkDqBDQ9S4MiMD/fRppFvXVz4qcjg6ymDSyAIJurr5Gr7g==
X-Received: by 2002:a17:90a:7f86:b0:218:9ea6:6593 with SMTP id m6-20020a17090a7f8600b002189ea66593mr37743875pjl.196.1669557327663;
        Sun, 27 Nov 2022 05:55:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.55.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:55:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/31] Patch review
Date: Sun, 27 Nov 2022 03:54:46 -1000
Message-Id: <cover.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173845

Please review this set of patches for kirkstone and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4543

The following changes since commit da2c64b3158c58eb0a484d3acbdf0419df2d34e8:

  wic: make ext2/3/4 images reproducible (2022-11-17 07:23:06 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (11):
  linux-firmware: upgrade 20220913 -> 20221012
  xwayland: upgrade 22.1.3 -> 22.1.4
  libffi: upgrade 3.4.2 -> 3.4.4
  libical: upgrade 3.0.15 -> 3.0.16
  mtd-utils: upgrade 2.1.4 -> 2.1.5
  gdk-pixbuf: upgrade 2.42.9 -> 2.42.10
  gstreamer1.0: upgrade 1.20.3 -> 1.20.4
  libepoxy: convert to git
  libepoxy: update 1.5.9 -> 1.5.10
  vala: install vapigen-wrapper into /usr/bin/crosscripts and stage only
    that
  gnomebase.bbclass: return the whole version for tarball directory if
    it is a number

Jose Quaresma (3):
  sstatesig: skip the rm_work task signature
  rm_work: exclude the SSTATETASKS from the rm_work tasks sinature
  sstate: Allow optimisation of do_deploy_archives task dependencies

Joshua Watt (2):
  qemu-helper-native: Re-write bridge helper as C program
  qemu-helper-native: Correctly pass program name as argv[0]

Konrad Weihmann (1):
  create-spdx: default share_src for shared sources

Martin Jansa (1):
  libsndfile1: Backport fix for CVE-2021-4156

Narpat Mali (2):
  ffmpeg: fix for CVE-2022-3964
  ffmpeg: fix for CVE-2022-3965

Peter Marko (2):
  systemd: add group render to udev package
  meta-selftest/staticids: add render group for systemd

Richard Purdie (1):
  sanity: Drop data finalize call

Ross Burton (1):
  linux-firmware: don't put the firmware into the sysroot

Sakib Sajal (1):
  go: fix CVE-2022-2880

Vivek Kumbhar (1):
  python3: fix CVE-2022-42919 local privilege escalation via the
    multiprocessing forkserver start method

Wang Mingyu (4):
  xwayland: upgrade 22.1.4 -> 22.1.5
  mobile-broadband-provider-info: upgrade 20220725 -> 20221107
  babeltrace: upgrade 1.5.8 -> 1.5.11
  iso-codes: upgrade 4.11.0 -> 4.12.0

Xiangyu Chen (1):
  bash: backport patch to fix CVE-2022-3715

 meta-selftest/files/static-group              |   1 +
 meta/classes/create-spdx.bbclass              |   5 +-
 meta/classes/gnomebase.bbclass                |   2 +-
 meta/classes/rm_work.bbclass                  |   2 +
 meta/classes/sanity.bbclass                   |  11 +-
 meta/classes/sstate.bbclass                   |   2 +-
 meta/lib/oe/sstatesig.py                      |   6 +
 .../mobile-broadband-provider-info_git.bb     |   4 +-
 meta/recipes-core/systemd/systemd_250.5.bb    |   2 +
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 ...util-avoid-query-parameter-smuggling.patch | 178 ++++++++++++++++++
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |   4 +-
 .../python/python3/CVE-2022-42919.patch       |  70 +++++++
 .../recipes-devtools/python/python3_3.10.7.bb |   1 +
 .../qemu/qemu-helper-native_1.0.bb            |   6 +-
 .../qemu/qemu-helper/qemu-oe-bridge-helper    |  25 ---
 .../qemu/qemu-helper/qemu-oe-bridge-helper.c  |  34 ++++
 meta/recipes-devtools/vala/vala.inc           |  10 +-
 .../bash/bash/CVE-2022-3715.patch             |  33 ++++
 meta/recipes-extended/bash/bash_5.1.16.bb     |   1 +
 ...pixbuf_2.42.9.bb => gdk-pixbuf_2.42.10.bb} |   2 +-
 .../{libepoxy_1.5.9.bb => libepoxy_1.5.10.bb} |   5 +-
 ...{xwayland_22.1.3.bb => xwayland_22.1.5.bb} |   2 +-
 ...20220913.bb => linux-firmware_20221012.bb} |   9 +-
 ...beltrace_1.5.8.bb => babeltrace_1.5.11.bb} |   2 +-
 ...c-stop-accessing-out-of-bounds-frame.patch |  89 +++++++++
 ...c-stop-accessing-out-of-bounds-frame.patch | 108 +++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |   3 +
 ...tools_1.20.3.bb => gst-devtools_1.20.4.bb} |   2 +-
 ...r-APNG-encoder-property-registration.patch |  86 ---------
 ...1.20.3.bb => gstreamer1.0-libav_1.20.4.bb} |   6 +-
 ...x_1.20.3.bb => gstreamer1.0-omx_1.20.4.bb} |   2 +-
 ....bb => gstreamer1.0-plugins-bad_1.20.4.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-base_1.20.4.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-good_1.20.4.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.20.4.bb} |   2 +-
 ....20.3.bb => gstreamer1.0-python_1.20.4.bb} |   2 +-
 ....bb => gstreamer1.0-rtsp-server_1.20.4.bb} |   2 +-
 ...1.20.3.bb => gstreamer1.0-vaapi_1.20.4.bb} |   2 +-
 ...er1.0_1.20.3.bb => gstreamer1.0_1.20.4.bb} |   2 +-
 ...flac-Fix-improper-buffer-reusing-732.patch |  29 +++
 .../libsndfile/libsndfile1_1.0.31.bb          |   1 +
 ...so-codes_4.11.0.bb => iso-codes_4.12.0.bb} |   2 +-
 ...m-sysv-reverted-clang-VFP-mitigation.patch |   6 +-
 .../libffi/libffi/not-win32.patch             |   8 +-
 .../{libffi_3.4.2.bb => libffi_3.4.4.bb}      |   4 +-
 .../{libical_3.0.15.bb => libical_3.0.16.bb}  |   2 +-
 47 files changed, 612 insertions(+), 170 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.18/0001-net-http-httputil-avoid-query-parameter-smuggling.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2022-42919.patch
 delete mode 100755 meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper
 create mode 100644 meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c
 create mode 100644 meta/recipes-extended/bash/bash/CVE-2022-3715.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.9.bb => gdk-pixbuf_2.42.10.bb} (98%)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.5.9.bb => libepoxy_1.5.10.bb} (86%)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.3.bb => xwayland_22.1.5.bb} (95%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220913.bb => linux-firmware_20221012.bb} (99%)
 rename meta/recipes-kernel/lttng/{babeltrace_1.5.8.bb => babeltrace_1.5.11.bb} (98%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.3.bb => gst-devtools_1.20.4.bb} (95%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.3.bb => gstreamer1.0-libav_1.20.4.bb} (82%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.3.bb => gstreamer1.0-omx_1.20.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.3.bb => gstreamer1.0-plugins-bad_1.20.4.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.3.bb => gstreamer1.0-plugins-base_1.20.4.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.3.bb => gstreamer1.0-plugins-good_1.20.4.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.3.bb => gstreamer1.0-plugins-ugly_1.20.4.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.3.bb => gstreamer1.0-python_1.20.4.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.3.bb => gstreamer1.0-rtsp-server_1.20.4.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.3.bb => gstreamer1.0-vaapi_1.20.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.3.bb => gstreamer1.0_1.20.4.bb} (97%)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/0001-flac-Fix-improper-buffer-reusing-732.patch
 rename meta/recipes-support/iso-codes/{iso-codes_4.11.0.bb => iso-codes_4.12.0.bb} (94%)
 rename meta/recipes-support/libffi/{libffi_3.4.2.bb => libffi_3.4.4.bb} (90%)
 rename meta/recipes-support/libical/{libical_3.0.15.bb => libical_3.0.16.bb} (96%)

-- 
2.25.1


