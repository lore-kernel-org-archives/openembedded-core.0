Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71073C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 14:42:54 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.12868.1669819371403422439
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 06:42:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vf/LlwRY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d3so11902480plr.10
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 06:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3/Gz1liMxM2Q4OIGR6zvTI19rvofGYTqgonyLBH6Tc=;
        b=vf/LlwRYc4n3tKn8GxiNr4NrDPXSum3eKUDWxMBjUG5T1NPW7eZXo1/h4HJq9ghemZ
         y+8vk8ovNITxuNmg7Dsv3hRMZFunXyyrdjvkfV8IfFOdLCcQSczHgDMgoZmZyxS4srBY
         Hdh4GetbTsjQheFQx+C+om/jWDMtC+ppm5EKKrGvwKkDq9fizTZvEz5I1Mxd8LZwnA6h
         GQ15cZSCeg13sy7z9gO3ExyDsGiEM7Imjwt/OdxPNPIIySaBCyGpUehwg6sg4GPM0V1S
         ovX9nSTZ/PVpZIlGZeewfReNAxJzzPvT7uOxYv/VjKbC4ijkN3wc6bchZNGWnojWAByD
         qViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3/Gz1liMxM2Q4OIGR6zvTI19rvofGYTqgonyLBH6Tc=;
        b=bzjGvUZIty9flf5Zl841wEB85D93l+UmXmIfIY6Kw/0c9fJ9gPXpnIjLuep/pNh3Gp
         aDXmZTwmZMVLO9Ru1moPRcozW1bGutGHaG8gSGZrqgfOVdnZfU7eOTv2Qb2yjbLDM0q3
         iu+OVhfTQ22+eL+La7cMCuucTToUNWbipNKGeNTkhF4vnp5HoJ+ausfsC/P1eAIxlYtO
         utH5RJbQavpVlzpzJlJH/Fz0X7klH1/IWM8bnjTyC/lOKfi7fbvLrdlTUadYwWCeyAAo
         SKelVYjx4upqY2unUmmLlC+xF7kal0GgpAyz1SoWk/lw4CNPx02kHmJsuIaXWfyMYYzY
         avUw==
X-Gm-Message-State: ANoB5pntGGDcbyXhyVz0SPopRBH0W2m1nIRoTHzU50BkVRTnlYBGUr/3
	RVGNjaPo0dms8PuTHyxqcs/cucAwqBIm0pUSTZw=
X-Google-Smtp-Source: AA0mqf70eXdOe1yOe/Twn0skrjLnkoVxW52eJTMC8CBwAqi4SP1mXfWuIqHhBpev6efpBxPgZNUpbA==
X-Received: by 2002:a17:90b:290:b0:219:2b00:8d23 with SMTP id az16-20020a17090b029000b002192b008d23mr19262591pjb.167.1669819370081;
        Wed, 30 Nov 2022 06:42:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id w5-20020a170902ca0500b00180033438a0sm1557735pld.106.2022.11.30.06.42.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 06:42:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/31] Pull request (cover letter only)
Date: Wed, 30 Nov 2022 04:42:44 -1000
Message-Id: <cover.1669819288.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 14:42:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174014

The following changes since commit da2c64b3158c58eb0a484d3acbdf0419df2d34e8:

  wic: make ext2/3/4 images reproducible (2022-11-17 07:23:06 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

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


