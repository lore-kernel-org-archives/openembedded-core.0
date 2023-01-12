Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93469C54EBC
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 02:33:24 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.45231.1673490800707506564
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 18:33:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=TjDTU06c;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id m7-20020a17090a730700b00225ebb9cd01so22079032pjk.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 18:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DuhhX886B6qloTMYkK3w0XUKcmtEeqpeFZr0KwtOmhc=;
        b=TjDTU06caQjJ6VWN8qTvyoGfCf21I04dGDD+75F/oziJvCYT3UWxtntJ5WMq9pujB2
         x0vD1zLCcnFRyuV1V9DLPaRSOXjIMmplM1zSX5PP0f/JY+6QvHcuHtVLmHGcMqDhVvMY
         bjRmg0D9grhk2oAeomyEK5KTlfB+ZrDC3+5tgK7Wr5fAGFMZ7xdPzvblOxPmDNUtM6u4
         qh6pB3uWcVQnRGqd+hIz1eM+cW5jqftzyQIBgrAelH4+Aur0S2Fpv2Hsra4xFioNXP9P
         DHQh4AM37A+9AA7jixOLw+mu5qpScVqW9USE89tfFqXkA8XJ4D+Zr4tEnTEY4KLE30oM
         0FFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DuhhX886B6qloTMYkK3w0XUKcmtEeqpeFZr0KwtOmhc=;
        b=MT1gjIEpJi1vKkceJmSNIlbb5F/w4Adcxj/x0XzYdnYHzE2PXxNPDwBPHpUEcPsTYf
         rOz36upcQdi+PXe+tZS2fKyXmLw5zIrxWrymGuOnydryoN5HyBHHLeHrHQVGZ1Sft2l1
         HwuOiH9zPveV//r4IlOoC/rnkW2FbyM5uRmZ9JMLBJyAoET42ajjS7wDxTLj0GhDp5dU
         0e7HVZRTZZ8tnSjcWAJs+406nN7yabjA+TbI+BToJuwx0n4VFmPfwfWZZOcEpjLpXOAx
         LM80JmAkU0X/55ZAe1ywuDzGBgyR5X+LDpkmPaV+oVlPaT3DC4vWsuM0E05FopWZPVNq
         gJVw==
X-Gm-Message-State: AFqh2kpPovjlCnPxAsFjFlitbKsmW+ymIogSIGQSmdttEq3eZu1U4B5E
	jO5CBauvwWfab9nix9jC271tNBzkO6XjyAGS2NI=
X-Google-Smtp-Source: AMrXdXuqM8A8/bVYN97oqjTKrBXRZAnm7pptARGmO2nfHhzC0Dt38Gp2xwoHMPo8In6j9hObIfAyLA==
X-Received: by 2002:a17:903:228a:b0:191:271f:4789 with SMTP id b10-20020a170903228a00b00191271f4789mr98864698plh.27.1673490799424;
        Wed, 11 Jan 2023 18:33:19 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902cecb00b00192d389db91sm11006719plg.75.2023.01.11.18.33.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 18:33:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/11] Patch review
Date: Wed, 11 Jan 2023 16:33:01 -1000
Message-Id: <cover.1673490673.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 02:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175773

Please review these patches for kirkstone and have comments back by
end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4779

The following changes since commit 96d9b5ba9bdb394c2a0b67bf0067a01578178e50:

  oeqa/concurrencytest: Add number of failures to summary output (2023-01-04 05:08:37 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (2):
  libarchive: upgrade 3.6.1 -> 3.6.2
  devtool: process local files only for the main branch

Changqing Li (1):
  base.bbclass: Fix way to check ccache path

Hitendra Prajapati (1):
  systemd: CVE-2022-45873 deadlock in systemd-coredump via a crash with
    a long backtrace

Jose Quaresma (2):
  Revert "gstreamer1.0: disable flaky gstbin:test_watch_for_state_change
    test"
  gstreamer1.0: Fix race conditions in gstbin tests

Luis (1):
  rm_work.bbclass: use HOSTTOOLS 'rm' binary exclusively

Martin Jansa (1):
  systemd: backport another change from v252 to fix build with
    CVE-2022-45873.patch

Narpat Mali (1):
  ffmpeg: fix for CVE-2022-3109

Pavel Zhukov (1):
  oeqa/rpm.py: Increase timeout and add debug output

Wang Mingyu (1):
  bind: upgrade 9.18.9 -> 9.18.10

 .../devtool/devtool-test-local/file3          |   1 +
 .../devtool/devtool-test-local_6.03.bb        |   3 +
 .../devtool/devtool-test-localonly.bb         |   3 +
 .../devtool/devtool-test-localonly/file3      |   1 +
 meta/classes/base.bbclass                     |   2 +-
 meta/classes/rm_work.bbclass                  |  15 +-
 meta/lib/oeqa/runtime/cases/rpm.py            |  23 +-
 ...1-avoid-start-failure-with-bind-user.patch |   0
 ...d-V-and-start-log-hide-build-options.patch |   0
 ...ching-for-json-headers-searches-sysr.patch |   0
 .../bind/{bind-9.18.9 => bind-9.18.10}/bind9  |   0
 .../{bind-9.18.9 => bind-9.18.10}/conf.patch  |   0
 .../generate-rndc-key.sh                      |   0
 ...t.d-add-support-for-read-only-rootfs.patch |   0
 .../make-etc-initd-bind-stop-work.patch       |   0
 .../named.service                             |   0
 .../bind/{bind_9.18.9.bb => bind_9.18.10.bb}  |   2 +-
 ...w-json_variant_dump-to-return-an-err.patch |  60 ++++
 .../systemd/systemd/CVE-2022-45873.patch      | 124 ++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |   2 +
 .../libarchive/CVE-2022-36227.patch           |  42 ---
 ...ibarchive_3.6.1.bb => libarchive_3.6.2.bb} |   8 +-
 ...-vp3-Add-missing-check-for-av_malloc.patch |  44 +++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |   3 +-
 ...005-bin-Fix-race-conditions-in-tests.patch | 300 ++++++++++++++++++
 ...bin-test_watch_for_state_change-test.patch | 107 -------
 .../gstreamer/gstreamer1.0_1.20.5.bb          |   2 +-
 scripts/lib/devtool/standard.py               |  38 ++-
 28 files changed, 590 insertions(+), 190 deletions(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-local/file3
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-localonly/file3
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.9 => bind-9.18.10}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.9.bb => bind_9.18.10.bb} (97%)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-shared-json-allow-json_variant_dump-to-return-an-err.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-45873.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.6.1.bb => libarchive_3.6.2.bb} (92%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bin-Fix-race-conditions-in-tests.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-remove-gstbin-test_watch_for_state_change-test.patch

-- 
2.25.1


