Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA9EAC4332F
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 14:10:09 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.2951.1668262206920621865
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 06:10:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=MDKMzFv8;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id b62so6589414pgc.0
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 06:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qpbe+mEb/UHeCe13aou4qVZpqGTr8M3DBGmh6hhKam8=;
        b=MDKMzFv8ggaHIpuaLLQNICSlyi4efhdvwbSTiJwvmxJ7z9toCbgjhOZvf+t+/e1Kx4
         jFZL9FORSdQE7wsCljVvqIfrecFu9wCL2tG6EweBY8ZhxV0ZdO1CmPoTfjX43i7200Ms
         +Lrv7jX1DgPPP3uVMtewkm9xaOMl0JBlwuRv+DLzYLNiNYv8001zOz7O7lh223veOqrs
         1KrEeFZOQH6iIGlpGRpF1HwHhUbnOU5MxgllSnWY4jfYmasuUOV4Ldi8nqvysf+v9/fh
         enB5txUs2byJdlBmHwQBVkpZ9/EfPgVmSrEAyXVMe0AqlRA3iL4rsfDGJ6lm4yGitsHj
         jsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qpbe+mEb/UHeCe13aou4qVZpqGTr8M3DBGmh6hhKam8=;
        b=QVcf7h4sEMKvoa4qSS/d/pCDPoJwEeSh55tL2orBaC57Sko6qiiH08tuNq8lqHeGO6
         +bvQl1uBPw6iQgPOM49AgDran5aI25xJbaFCoDq+dQgu0bNmeW1bKLXh1MxFDDhzXWL/
         4S5XcfjWyGYMEVTaGZv7jiDBoEszVj3qJ+DBpIJnWKN9jX6lvF7gMtKewSl4w81dUSe2
         T36B0lMY6pT9CWpdR+uiYpR64EPdTPfKFiGGBzKXSHSDyEiTHmr+iOcPPU/kf8VpA4qw
         8S6K9ARhyudAt6/C3iGZiAsRKnV6LcYJ315rpVT93OUR/rSNqRiRV5OW19A5G7QAdXf+
         V2IQ==
X-Gm-Message-State: ANoB5pkTA7y+QeBL6QTeKcNrcM/MSv4jQRLz1q7EpSVTdiTkHr56wlDo
	VrkseqqiLEqw4t3tTV7ivXlawcDABVkJe0nu
X-Google-Smtp-Source: AA0mqf5K3m6rRgB9zwzCiajhkyeK01OobVjI4SF7FiLJoDSae2DwcVTo87JBrnYrY/AiaT2RS8k3TQ==
X-Received: by 2002:a63:5023:0:b0:429:8266:b617 with SMTP id e35-20020a635023000000b004298266b617mr5734920pgb.136.1668262205563;
        Sat, 12 Nov 2022 06:10:05 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id g10-20020a1709026b4a00b0018853dd8832sm3733883plt.4.2022.11.12.06.10.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 06:10:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/11] Patch review
Date: Sat, 12 Nov 2022 04:09:48 -1000
Message-Id: <cover.1668262073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 14:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173149

Please review this set of patches for dunfell and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4469

The following changes since commit babcb7cd3bbefe9c0ea28e960e4fd6cefbc03cae:

  bluez5: add dbus to RDEPENDS (2022-11-04 07:52:01 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alex Kiernan (1):
  openssl: upgrade 1.1.1q to 1.1.1s

Hitendra Prajapati (1):
  bluez: CVE-2022-3637 A DoS exists in monitor/jlink.c

Martin Jansa (1):
  externalsrc.bbclass: fix git repo detection

Peter Kjellerstedt (1):
  externalsrc.bbclass: Remove a trailing slash from ${B}

Ross Burton (1):
  sanity: check for GNU tar specifically

Sundeep KOKKONDA (2):
  binutils: stable 2.34 branch updates
  glibc : stable 2.31 branch updates.

Sunil Kumar (1):
  go: Security Fix for CVE-2022-2879

Vivek Kumbhar (2):
  curl: fix CVE-2022-32221 POST following PUT
  qemu: fix CVE-2021-3638 ati-vga: inconsistent check in ati_2d_blt()
    may lead to out-of-bounds write

ciarancourtney (1):
  wic: swap partitions are not added to fstab

 meta/classes/externalsrc.bbclass              |   6 +-
 meta/classes/sanity.bbclass                   |   8 ++
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 .../bluez5/bluez5/CVE-2022-3637.patch         |  39 ++++++
 .../{openssl_1.1.1q.bb => openssl_1.1.1s.bb}  |   2 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../glibc/glibc/CVE-2021-33574_1.patch        |  26 ++--
 .../binutils/binutils-2.34.inc                |   2 +-
 .../binutils/binutils/CVE-2020-16593.patch    |   4 +-
 .../binutils/binutils/CVE-2021-3549.patch     |  80 ++++++-------
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-2879.patch            | 111 ++++++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2021-3638.patch             |  80 +++++++++++++
 .../curl/curl/CVE-2022-32221.patch            |  29 +++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 scripts/lib/wic/plugins/imager/direct.py      |   2 +-
 17 files changed, 329 insertions(+), 66 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2022-3637.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1q.bb => openssl_1.1.1s.bb} (98%)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-2879.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3638.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32221.patch

-- 
2.25.1


