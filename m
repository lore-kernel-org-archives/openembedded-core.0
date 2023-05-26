Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F419C7EE37
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:29:31 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.102.1685068164603959111
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=iErFBOf4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2535d86a41bso289510a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685068163; x=1687660163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xmMgW0mSOoIp6jBKZt1x5skI2Pv1xMWioimHlKwF6xQ=;
        b=iErFBOf4xxVJBcaPvfBBKuPVitkAu9bIWP44qPeXceGo0qxkR19oz6HvieZnnaOWx4
         x6cOuiduvhP5+IfAhhjTGLxDS7D3BifQVyvPz2SHRj4YjbaS6O7sZ5alggYDXk7ijTeR
         LNrRsR+TinPKfuPvd2omJVwouDZpDRL0qkbmS8Esc1IMyORTSVm47tAU2ykglev+Qw1n
         OZts3MH8l1fRDaJwChPGLDwgx9KTKAqxMMpaa7uBIKAzForzrty6ry8+Sn28MSyg4Tli
         xNRj7AP8LLXYo4E5uQ1hzkjTuqiGvYrfa3Ql69xSOAHXK/u7Q8lYiBCSPficIR2DjJWy
         uaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685068163; x=1687660163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xmMgW0mSOoIp6jBKZt1x5skI2Pv1xMWioimHlKwF6xQ=;
        b=hhiME+i//H8GyiviMXMIki3C9+6s1v3cbRq0TVU7B6HUsx/6H9gsdOAnL1ZoUTlzUV
         aI2b+TcTl1lzg7xFmJ8lWHLxLB+pd5jRU4wV+Nd2K5FgUVaqnew+bNl9QrZ4zUsNLW5y
         RvlDAt8NzMDgZbyQ1zwle88HefSM1V9PCHbqPBml5xhaBWHwync4/ekERW2xbWMlxtBT
         J+vL0qmhpiDU82OxVqIOREo+ml39Pl6ywD6S4zh+c+RjzrvgSO0dpvgwwkWY4OToFVup
         1SRF1OybBFNEpHMwBZSXYHDwGuH/NIMV/BghAvprFwMDerebAd6AUophBs1HTds79sOG
         ARmQ==
X-Gm-Message-State: AC+VfDzsrgzEp/0chtvOVV5QZ0s8ZrZLz/x0Enr3Qp9hMzDwJWbC+A1h
	JwZaTI/FpsiithUyjjPIXmSLcLpdxnJbh52JXMc=
X-Google-Smtp-Source: ACHHUZ6M4oLQ5suhcc9geKFMzmn4eVGSXTnc3WgIiPn1nhRKj9TvxKS+P7x8AQG3/sxe+MG9qJtC9g==
X-Received: by 2002:a17:902:c946:b0:1af:d9d2:a234 with SMTP id i6-20020a170902c94600b001afd9d2a234mr893589pla.3.1685068163195;
        Thu, 25 May 2023 19:29:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b0019ee045a2b3sm2023794plr.308.2023.05.25.19.29.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 19:29:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/21] Patch review
Date: Thu, 25 May 2023 16:28:48 -1000
Message-Id: <cover.1685068004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181732

Please review this set of patches for kirkstone and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5349

The following changes since commit d2713785f9cd2d58731df877bc8b7bcc71b6c8e6:

  build-appliance-image: Update to kirkstone head revision (2023-05-12 04:05:43 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (1):
  dhcpcd: use git instead of tarballs

Archana Polampalli (1):
  git: ignore CVE-2023-25815

Eero Aaltonen (1):
  avahi: fix D-Bus introspection

Enrico Jörns (1):
  package_manager/ipk: fix config path generation in
    _create_custom_config()

Jan Luebbe (1):
  p11-kit: add native to BBCLASSEXTEND

Khem Raj (2):
  gcc-runtime: Use static dummy libstdc++
  quilt: Fix merge.test race condition

Marek Vasut (1):
  cpio: Fix wrong CRC with ASCII CRC for large files

Martin Jansa (1):
  llvm: backport a fix for build with gcc-13

Martin Siegumfeldt (1):
  systemd-systemctl: fix instance template WantedBy symlink construction

Ming Liu (1):
  weston: add xwayland to DEPENDS for PACKAGECONFIG xwayland

Pablo Saavedra (1):
  gstreamer1.0: upgrade 1.20.5 -> 1.20.6

Peter Kjellerstedt (1):
  license.bbclass: Include LICENSE in the output when it fails to parse

Richard Purdie (2):
  maintainers.inc: Fix email address typo
  maintainers.inc: Move repo to unassigned

Sakib Sajal (1):
  go: fix CVE-2023-24540

Tom Hochstein (2):
  piglit: Add PACKAGECONFIG for glx and opencl
  piglit: Add missing glslang dependencies

Upgrade Helper (1):
  waffle: upgrade 1.7.0 -> 1.7.2

Zoltan Boszormenyi (1):
  piglit: Fix build time dependency

leimaohui (1):
  nghttp2: Deleted the entries for -client and -server, and removed a
    dependency on them from the main package.

 meta/classes/license.bbclass                  |   2 +-
 meta/conf/distro/include/maintainers.inc      |   4 +-
 meta/lib/oe/package_manager/ipk/__init__.py   |   2 +-
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   3 +-
 .../dhcpcd/dhcpcd_9.4.1.bb                    |   7 +-
 .../systemd/systemd-systemctl/systemctl       |  13 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc     |   3 +-
 meta/recipes-devtools/git/git_2.35.7.bb       |   2 +
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.19/CVE-2023-24540.patch           |  93 ++++++
 ...-missing-cstdint-header-to-Signals.h.patch |  31 ++
 meta/recipes-devtools/llvm/llvm_git.bb        |   1 +
 meta/recipes-devtools/quilt/quilt.inc         |   1 +
 ...t-Fix-a-race-condition-in-merge.test.patch |  48 +++
 ...g-CRC-with-ASCII-CRC-for-large-files.patch |  39 +++
 meta/recipes-extended/cpio/cpio_2.13.bb       |   1 +
 ...roper-WAYLAND_INCLUDE_DIRS-variable.patch} |   0
 ...-shader.c-do-not-hardcode-build-pat.patch} |   0
 ...n-t-enable-GLX-if-tests-are-disabled.patch |  32 ++
 meta/recipes-graphics/piglit/piglit_git.bb    |  13 +-
 ...build-request-native-wayland-scanner.patch |   9 +-
 ...-make-core-protocol-into-the-library.patch |  23 +-
 .../{waffle_1.7.0.bb => waffle_1.7.2.bb}      |   8 +-
 .../recipes-graphics/wayland/weston_10.0.2.bb |   2 +-
 ...tools_1.20.5.bb => gst-devtools_1.20.6.bb} |   2 +-
 ...1.20.5.bb => gstreamer1.0-libav_1.20.6.bb} |   2 +-
 ...x_1.20.5.bb => gstreamer1.0-omx_1.20.6.bb} |   2 +-
 ....bb => gstreamer1.0-plugins-bad_1.20.6.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-base_1.20.6.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-good_1.20.6.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.20.6.bb} |   2 +-
 ....20.5.bb => gstreamer1.0-python_1.20.6.bb} |   2 +-
 ....bb => gstreamer1.0-rtsp-server_1.20.6.bb} |   2 +-
 ...1.20.5.bb => gstreamer1.0-vaapi_1.20.6.bb} |   2 +-
 ...005-bin-Fix-race-conditions-in-tests.patch | 300 ------------------
 ...er1.0_1.20.5.bb => gstreamer1.0_1.20.6.bb} |   3 +-
 .../recipes-support/nghttp2/nghttp2_1.47.0.bb |   6 +-
 .../recipes-support/p11-kit/p11-kit_0.24.1.bb |   2 +-
 38 files changed, 305 insertions(+), 364 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-24540.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/0001-Support-Add-missing-cstdint-header-to-Signals.h.patch
 create mode 100644 meta/recipes-devtools/quilt/quilt/0001-test-Fix-a-race-condition-in-merge.test.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch
 rename meta/recipes-graphics/piglit/piglit/{0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch => 0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch} (100%)
 rename meta/recipes-graphics/piglit/piglit/{0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch => 0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch} (100%)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch
 rename meta/recipes-graphics/waffle/{waffle_1.7.0.bb => waffle_1.7.2.bb} (92%)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.5.bb => gst-devtools_1.20.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.5.bb => gstreamer1.0-libav_1.20.6.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.5.bb => gstreamer1.0-omx_1.20.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.5.bb => gstreamer1.0-plugins-bad_1.20.6.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.5.bb => gstreamer1.0-plugins-base_1.20.6.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.5.bb => gstreamer1.0-plugins-good_1.20.6.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.5.bb => gstreamer1.0-plugins-ugly_1.20.6.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.5.bb => gstreamer1.0-python_1.20.6.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.5.bb => gstreamer1.0-rtsp-server_1.20.6.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.5.bb => gstreamer1.0-vaapi_1.20.6.bb} (95%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bin-Fix-race-conditions-in-tests.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.5.bb => gstreamer1.0_1.20.6.bb} (95%)

-- 
2.34.1


