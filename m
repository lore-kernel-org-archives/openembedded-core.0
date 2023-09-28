Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AD7CE7AE6
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 02:48:58 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.6167.1695869333230890594
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 19:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=z+o+eTSe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.49, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6c4a25f6390so6827136a34.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 19:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695869332; x=1696474132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iO035cyK4CiIEuRWobi55iwj7IP0SItPSfZdGk/TtJk=;
        b=z+o+eTSe6Hn7Bnwxn302z4+DC9xBIHDaElAGlcThShKd7xFVjyPXmEARk6kIzwu9/G
         OqGFMpujqlNsKcNc7gR4jQqRWO+B2VUW51kWZILGxIkAArqMwrIJYGg6hBdCJcUxD23I
         g2Rd46SEqVLv5ZRAnkrY3qrcmIjVIom2dGpPFb9A7fg83N1/ZhWP9oxm5RCIcnqdgoJj
         /MZpGrJuFEyLrQxnVutt/4c+8IwNW3aQs41yHMxn0LIMccKexbBFowlmtd+++a1NOJ2L
         RTyYkV6ujmBTwKSWq4rFwKO6QUVw4z5HCeNu3wPDPt5qiPgj4/wztTLdmsB2q8xFlLP7
         ZfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695869332; x=1696474132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iO035cyK4CiIEuRWobi55iwj7IP0SItPSfZdGk/TtJk=;
        b=IFZDzwnxypQMxVY+EhkgNIq2PT1gCqwsUXmvHmIdRvWwJ28eJQcqt3AEHZ29lpPvnK
         FFx20gMyk6NUlYSFIs5FjeYA2zwZ4pkcWS66sqDYtV38Ptc0v2SyqH/kPFssA7lXOyOO
         yoVHsxSIi+GBxEJLim2ZqXy2OEqcTbgIol9FwO5I6j44rTEUSB9Wj0TOMYbHdKCF6ryh
         wEnFGg7ddJbI5bdxZM9au9u+ikyYsBBJgbSBuBpDfiPvqiqW7hl4NB80fh83NcG9a491
         UwmQdbdCBpGg6dANtD7s249S1nizEULNnlklV3uNFyG137SabhABdtkpfUWv9kzCaNNO
         qUig==
X-Gm-Message-State: AOJu0Yy1SkKr3A9FpoFPEZTmcmwHr1aQzPh1uTfUak5IQqVoEqmxZbHi
	OzL8mNX3gRME2gOYNLD/wyPb5hMoI+F3ewlilHU=
X-Google-Smtp-Source: AGHT+IEI1DiXlZW7HpOgoVPmsHX5hHc7PMUYrKqmQxXvs7RlQr64I4OEi+2bdImmyEGNJmL5Fzm1+Q==
X-Received: by 2002:a05:6808:1783:b0:3ae:5c09:73ce with SMTP id bg3-20020a056808178300b003ae5c0973cemr5206991oib.23.1695869331918;
        Wed, 27 Sep 2023 19:48:51 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n3-20020aa79043000000b0068e12e6954csm1850214pfo.36.2023.09.27.19.48.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 19:48:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/17] Patch review
Date: Wed, 27 Sep 2023 16:48:29 -1000
Message-Id: <cover.1695869144.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 02:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188350

Please review this set of changes for kirkstone and have comments back by
end of day Friday, September 29

Passed a-full on autobuilder (other than a known send-qa-email issue):

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5956
 
The following changes since commit d90e4d5e3cca9cffe8f60841afc63667a9ac39fa:

  build-appliance-image: Update to kirkstone head revision (2023-09-24 10:53:54 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (4):
  ghostscript: fix CVE-2023-43115
  gstreamer1.0-plugins-bad: fix CVE-2023-40474
  gstreamer1.0-plugins-bad: fix CVE-2023-40475
  gstreamer1.0-plugins-bad: fix CVE-2023-40476

Colin McAllister (1):
  libwebp: Fix CVE-2023-5129

Jaeyoon Jung (1):
  cml1: Fix KCONFIG_CONFIG_COMMAND not conveyed fully in do_menuconfig

Lee Chee Yang (2):
  cups: Fix CVE-2023-4504
  bind: update to 9.18.19

Meenali Gupta (1):
  ruby: fix CVE-2023-36617

Narpat Mali (1):
  python3-git: upgrade 3.1.32 -> 3.1.37

Peter Marko (1):
  openssl: Upgrade 3.0.10 -> 3.0.11

Ross Burton (2):
  linux-yocto: update CVE exclusions
  xserver-xorg: ignore CVE-2022-3553 as it is XQuartz-specific

Ryan Eatmon (1):
  kernel.bbclass: Add force flag to rm calls

Siddharth Doshi (1):
  go: Fix CVE-2023-39318

Soumya Sambu (1):
  shadow: Fix CVE-2023-4641

Yogita Urade (1):
  webkitgtk: fix CVE-2023-32439

 meta/classes/cml1.bbclass                     |    2 +-
 meta/classes/kernel.bbclass                   |    4 +-
 ...1-avoid-start-failure-with-bind-user.patch |    0
 ...d-V-and-start-log-hide-build-options.patch |    0
 ...ching-for-json-headers-searches-sysr.patch |    0
 .../bind/{bind-9.18.17 => bind}/bind9         |    0
 .../bind/{bind-9.18.17 => bind}/conf.patch    |    0
 .../generate-rndc-key.sh                      |    0
 ...t.d-add-support-for-read-only-rootfs.patch |    0
 .../make-etc-initd-bind-stop-work.patch       |    0
 .../bind/{bind-9.18.17 => bind}/named.service |    0
 .../bind/{bind_9.18.17.bb => bind_9.18.19.bb} |    2 +-
 .../{openssl_3.0.10.bb => openssl_3.0.11.bb}  |    2 +-
 meta/recipes-devtools/go/go-1.17.13.inc       |    1 +
 .../go/go-1.21/CVE-2023-39318.patch           |  238 +
 ...n3-git_3.1.32.bb => python3-git_3.1.37.bb} |    4 +-
 .../ruby/ruby/CVE-2023-36617_1.patch          |   52 +
 .../ruby/ruby/CVE-2023-36617_2.patch          |   47 +
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |    2 +
 meta/recipes-extended/cups/cups.inc           |    1 +
 .../cups/cups/CVE-2023-4504.patch             |   42 +
 .../ghostscript/CVE-2023-43115.patch          |   62 +
 .../ghostscript/ghostscript_9.55.0.bb         |    1 +
 .../shadow/files/CVE-2023-4641-0001.patch     |   36 +
 .../shadow/files/CVE-2023-4641-0002.patch     |  147 +
 meta/recipes-extended/shadow/shadow.inc       |    2 +
 .../xorg-xserver/xserver-xorg.inc             |    2 +
 .../linux/cve-exclusion_5.10.inc              | 7255 +++++++++++++++++
 .../linux/cve-exclusion_5.15.inc              |  151 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |    1 +
 .../CVE-2023-40474.patch                      |  118 +
 .../CVE-2023-40475.patch                      |   49 +
 .../CVE-2023-40476.patch                      |   44 +
 .../gstreamer1.0-plugins-bad_1.20.7.bb        |    3 +
 .../webp/files/CVE-2023-5129.patch            |  364 +
 meta/recipes-multimedia/webp/libwebp_1.2.4.bb |    1 +
 .../webkit/webkitgtk/CVE-2023-32439.patch     |  127 +
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |    1 +
 38 files changed, 8719 insertions(+), 42 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.17 => bind}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.17 => bind}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.17 => bind}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.17 => bind}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.17 => bind}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.17 => bind}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.17 => bind}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.17 => bind}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.17 => bind}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.17.bb => bind_9.18.19.bb} (97%)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.10.bb => openssl_3.0.11.bb} (99%)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2023-39318.patch
 rename meta/recipes-devtools/python/{python3-git_3.1.32.bb => python3-git_3.1.37.bb} (86%)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-4504.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-43115.patch
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-4641-0001.patch
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-4641-0002.patch
 create mode 100644 meta/recipes-kernel/linux/cve-exclusion_5.10.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40474.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40475.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40476.patch
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-5129.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2023-32439.patch

-- 
2.34.1


