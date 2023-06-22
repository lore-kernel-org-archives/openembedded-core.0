Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58704C3DA41
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 02:36:13 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.1193.1687401366041554551
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 19:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=D6gmL+vw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b539d2f969so1322215ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 19:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687401365; x=1689993365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y++nCXJhYWt93rp1mV+8OxPYpkqRGQfHWKGD+aCCkQs=;
        b=D6gmL+vwuD6B+KXUYq5fPZTZpHWPn/kSiaisVKLZsnDiaGQ0u4EKgzF7vm4zH3Cf7L
         3xkJUH9xKLLBDDYSqmY/9orQ77uGj8QfcMu+LvpSY5SXTGFPu+Wi0iyUgBozl90MDk+3
         tixWRctg/pCLTmI07M0JNxMHR/NBWphnHSh9zKoBlAbHZFHrTiiThWPjxnCL955ygo8N
         FMT+pKcdsJT1UhloNHBY8zDzuM3MAtVTpdoxaXX7cs0SW7v0nM73ruA5mvS6v14lQv0n
         ba1ep5mY1GmvESgtSyRCWqw7HjXmgKNX4HKhvXV8OzbwAYra6VcnRn5dL+9GuSp7LDtw
         bkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401365; x=1689993365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y++nCXJhYWt93rp1mV+8OxPYpkqRGQfHWKGD+aCCkQs=;
        b=eZcS2hwg1uMFqMVnIKjR4Qlf9EoIOvegxK34ThrRbp1RXZr/DeQB1FPsGUp3ONbww2
         M79RaLbn2UqO3sStV119bWeOrkpAWma07H/zA5jQtWRhoVHtbBGkLPNvLbWjuh5XQFhg
         MipuHKXdkrcdU70G//jjqghMjMSXEwVH/0gWCWR5LE4ZIKcSztstEOvvTTonGEYrLN0p
         7+LTZ01Zqkl4cXUul1EtqxXVlCruAAoUO9qDi0qgFAwR/2nmArMypf5WyYYg+FyFygif
         fzqCX6724VZUQ61DuSvyTy1SrlDxecysjoEALgXhwNUECf9Zu7U4+gSLC2Z0V5nEojlu
         Q7Jg==
X-Gm-Message-State: AC+VfDytZrio1/qubkoqXQJqNeL4rxKJhTGr/lAZ7Vjv0OvXtViVRg42
	6xOVqH1mxZEaeHaurfrArdgYKAujIWIivtU83tA=
X-Google-Smtp-Source: ACHHUZ6TBNWpiiiLwc9TGQ08VELPZ+ZioRR7cVuOceROsAVu5AbzL3ZWRufzavaEOZO/sBb3RHX9Tg==
X-Received: by 2002:a17:903:32c4:b0:1b1:76c2:2966 with SMTP id i4-20020a17090332c400b001b176c22966mr22724005plr.20.1687401364425;
        Wed, 21 Jun 2023 19:36:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001b679ec20f2sm4143691plb.31.2023.06.21.19.36.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/23] Patch review
Date: Wed, 21 Jun 2023 16:35:32 -1000
Message-Id: <cover.1687401182.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 02:36:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183200

Please review this set of changes for mickledore and have comments back by
end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5503

The following changes since commit c734906a901c5dead9d879df0f251ba848fdb577:

  systemd-systemctl: support instance expansion in WantedBy (2023-06-15 11:36:34 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Alexander Kanavin (1):
  maintainers.inc: correct Carlos Rafael Giani's email address

Bruce Ashfield (7):
  linux-yocto/6.1: update to v6.1.26
  linux-yocto/6.1: update to v6.1.27
  linux-yocto/6.1: update to v6.1.28
  linux-yocto/6.1: update to v6.1.29
  linux-yocto/6.1: update to v6.1.30
  linux-yocto/6.1: update to v6.1.31
  linux-yocto/6.1: update to v6.1.32

Deepthi Hemraj (2):
  glibc: stable 2.37 branch updates.
  binutils: stable 2.40 branch updates

Richard Purdie (1):
  layer.conf: Add missing dependency exclusion

Ross Burton (1):
  ninja: ignore CVE-2021-4336, wrong ninja

Sanjay Chitroda (1):
  cups: Fix CVE-2023-32324

Wang Mingyu (9):
  babeltrace2: upgrade 2.0.4 -> 2.0.5
  fribidi: upgrade 1.0.12 -> 1.0.13
  libdnf: upgrade 0.70.0 -> 0.70.1
  libmicrohttpd: upgrade 0.9.76 -> 0.9.77
  libxft: upgrade 2.3.7 -> 2.3.8
  libxpm: upgrade 3.5.15 -> 3.5.16
  mobile-broadband-provider-info: upgrade 20221107 -> 20230416
  bind: upgrade 9.18.14 -> 9.18.15
  xdpyinfo: upgrade 1.3.3 -> 1.3.4

Xiangyu Chen (1):
  dbus: upgrade 1.14.6 -> 1.14.8

 meta/conf/distro/include/maintainers.inc      |  2 +-
 meta/conf/layer.conf                          |  1 +
 ...1-avoid-start-failure-with-bind-user.patch |  0
 ...d-V-and-start-log-hide-build-options.patch |  0
 ...ching-for-json-headers-searches-sysr.patch |  0
 .../bind/{bind-9.18.14 => bind-9.18.15}/bind9 |  0
 .../{bind-9.18.14 => bind-9.18.15}/conf.patch |  0
 .../generate-rndc-key.sh                      |  0
 ...t.d-add-support-for-read-only-rootfs.patch |  0
 .../make-etc-initd-bind-stop-work.patch       |  0
 .../named.service                             |  0
 .../bind/{bind_9.18.14.bb => bind_9.18.15.bb} |  2 +-
 .../mobile-broadband-provider-info_git.bb     |  4 +--
 .../dbus/{dbus_1.14.6.bb => dbus_1.14.8.bb}   |  2 +-
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 .../binutils/binutils-2.40.inc                |  2 +-
 .../{libdnf_0.70.0.bb => libdnf_0.70.1.bb}    |  2 +-
 meta/recipes-devtools/ninja/ninja_1.11.1.bb   |  3 ++
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2023-32324.patch            | 36 +++++++++++++++++++
 .../{xdpyinfo_1.3.3.bb => xdpyinfo_1.3.4.bb}  |  2 +-
 .../{libxft_2.3.7.bb => libxft_2.3.8.bb}      |  2 +-
 .../{libxpm_3.5.15.bb => libxpm_3.5.16.bb}    |  2 +-
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++--------
 ...eltrace2_2.0.4.bb => babeltrace2_2.0.5.bb} |  2 +-
 .../{fribidi_1.0.12.bb => fribidi_1.0.13.bb}  |  2 +-
 ...ttpd_0.9.76.bb => libmicrohttpd_0.9.77.bb} |  2 +-
 29 files changed, 75 insertions(+), 34 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.14 => bind-9.18.15}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.14 => bind-9.18.15}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.14 => bind-9.18.15}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.14 => bind-9.18.15}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.14 => bind-9.18.15}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.14 => bind-9.18.15}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.14 => bind-9.18.15}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.14 => bind-9.18.15}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.14 => bind-9.18.15}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.14.bb => bind_9.18.15.bb} (97%)
 rename meta/recipes-core/dbus/{dbus_1.14.6.bb => dbus_1.14.8.bb} (98%)
 rename meta/recipes-devtools/libdnf/{libdnf_0.70.0.bb => libdnf_0.70.1.bb} (97%)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32324.patch
 rename meta/recipes-graphics/xorg-app/{xdpyinfo_1.3.3.bb => xdpyinfo_1.3.4.bb} (88%)
 rename meta/recipes-graphics/xorg-lib/{libxft_2.3.7.bb => libxft_2.3.8.bb} (92%)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.15.bb => libxpm_3.5.16.bb} (88%)
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.4.bb => babeltrace2_2.0.5.bb} (98%)
 rename meta/recipes-support/fribidi/{fribidi_1.0.12.bb => fribidi_1.0.13.bb} (89%)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.76.bb => libmicrohttpd_0.9.77.bb} (90%)

-- 
2.34.1


