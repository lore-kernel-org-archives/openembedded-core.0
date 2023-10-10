Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4CD1CD8C84
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 14:14:39 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.92307.1696947273642290733
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 07:14:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WbJPMwfd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c9bf22fe05so3233385ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 07:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696947273; x=1697552073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fm4Bu40UxYVhv3DTeIo4rQXJJmhE+bN9MxZStEdeW+U=;
        b=WbJPMwfdkIEXDHs2Vnrf+UW777bqXQcI42REsn1SI4HkG6pp8651aarh3jdzRfM1zv
         oiCZcu3Zrr8YJREXYhGcAnbuV8VFgnevNgMAtW9j9lESn9NR0YtzdXGEgCb1oxkfdnyp
         rcUQeduPmWYg/3Z13SIuWyeO72HxE2A6xhq4Sf+q5jZe21F4G7IV8Z4Q4I4ffausL8A5
         B1OqoxtigLvtsBGJuA+3+7f6ktAiUKqYC6y1WetXL4HrobznXBNidHpHF8773ZSBzRFq
         jA4TAMyd4qIG8mcFA8XPdht+sFx+bN7iZz5ax0NRz8P1Zny9Bv0MKCVV2jmhyn+cHnHh
         aQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696947273; x=1697552073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fm4Bu40UxYVhv3DTeIo4rQXJJmhE+bN9MxZStEdeW+U=;
        b=czNjz0teCGmkYiPJxSVtspyTrdmDREoo4PuVIvHttwGUExirAJjQGCzMb4CDiLFeGR
         /v9Zq7cyskBFT4vp36L53fClqoeJQbYgDz+Uv8fs8UEZPs5UlU0A1WOfs+1Ym2QJ5Fmb
         lrY2UD6Ifn5EVyYnvpdkq4hZkTb0wtbEzLHydb92VfEoyV9FuWrokBJZXWg8Q403rjue
         tgz+/0PnjFgY5/xLGki2ZgHL7/oZC/ULwljbRtXdWruwaobcQi9v1IQ02wi/UMZkS/mc
         A9lcATxu6qiNTavdrXvAkHAev7xnuebl0Vu3LfOB3O8uKwZJV64FWXvfge3KkqO91ccU
         V+Ng==
X-Gm-Message-State: AOJu0Yz1QDqUs/ICmfV1KO6qqJG8bP3kXp21/fgbhC9vaJtWP551FMO7
	9twfjKMNusqzKmh+GbM3rnsLNsIoTQwjUaJxgJ4=
X-Google-Smtp-Source: AGHT+IHF8sm9F/KiLSeeC0bVV74hjLxWI2fuSgxTZ24eKQIXn0b6sm8YF8n/XhxIw3eoRkZDTAxY3Q==
X-Received: by 2002:a17:903:1211:b0:1c3:64f9:45ad with SMTP id l17-20020a170903121100b001c364f945admr18604359plh.48.1696947272355;
        Tue, 10 Oct 2023 07:14:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b8-20020a170902d50800b001b81a97860asm11737610plg.27.2023.10.10.07.14.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 07:14:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/11] Patch review
Date: Tue, 10 Oct 2023 04:14:17 -1000
Message-Id: <cover.1696946306.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 14:14:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188898

Please review this set of changes for dunfell and have comments back by
end of day Thursday, October 12.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6026

The following changes since commit 9a800a2e2c2b14eab8c1f83cb4ac3b94a70dd23c:

  glibc: Fix CVE-2023-4911 "Looney Tunables" (2023-10-05 13:10:56 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Hitendra Prajapati (1):
  xdg-utils: Fix CVE-2022-4055

Julian Haller (2):
  dbus: Backport fix for CVE-2023-34969
  dbus: Add missing CVE_PRODUCT

Marek Vasut (2):
  busybox: Backport CVE-2022-48174 fix
  cpio: Replace fix wrong CRC with ASCII CRC for large files with
    upstream backport

Shinu Chandran (1):
  libpcre2 : Follow up fix CVE-2022-1586

Shubham Kulkarni (1):
  go: Update fix for CVE-2023-24538 & CVE-2023-39318

Sourav Pramanik (1):
  openssl: Upgrade 1.1.1v -> 1.1.1w

Vijay Anusuri (3):
  cups: Backport fix for CVE-2023-32360 and CVE-2023-4504
  gawk: backport Debian patch to fix CVE-2023-4156
  ghostscript: Backport fix CVE-2023-43115

 .../{openssl_1.1.1v.bb => openssl_1.1.1w.bb}  |   2 +-
 .../busybox/busybox/CVE-2022-48174.patch      |  82 +++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |   1 +
 meta/recipes-core/dbus/dbus.inc               |   3 +
 .../dbus/dbus/CVE-2023-34969.patch            |  96 +++
 meta/recipes-devtools/go/go-1.14.inc          |   5 +-
 .../go/go-1.14/CVE-2023-24538-1.patch         |   4 +-
 .../go/go-1.14/CVE-2023-24538-2.patch         | 447 ++++++++++++-
 .../go/go-1.14/CVE-2023-24538_3.patch         | 393 ++++++++++++
 .../go/go-1.14/CVE-2023-24538_4.patch         | 497 +++++++++++++++
 .../go/go-1.14/CVE-2023-24538_5.patch         | 585 ++++++++++++++++++
 ...3-24538-3.patch => CVE-2023-24538_6.patch} | 175 +++++-
 .../go/go-1.14/CVE-2023-39318.patch           |  38 +-
 ...g-CRC-with-ASCII-CRC-for-large-files.patch |  39 --
 ...-calculation-of-CRC-in-copy-out-mode.patch |  58 ++
 ...appending-to-archives-bigger-than-2G.patch | 312 ++++++++++
 meta/recipes-extended/cpio/cpio_2.13.bb       |   3 +-
 meta/recipes-extended/cups/cups.inc           |   2 +
 .../cups/cups/CVE-2023-32360.patch            |  31 +
 .../cups/cups/CVE-2023-4504.patch             |  40 ++
 .../gawk/gawk/CVE-2023-4156.patch             |  28 +
 meta/recipes-extended/gawk/gawk_5.0.1.bb      |   1 +
 .../ghostscript/CVE-2023-43115.patch          |  62 ++
 .../ghostscript/ghostscript_9.52.bb           |   1 +
 .../xdg-utils/xdg-utils/CVE-2022-4055.patch   | 165 +++++
 .../xdg-utils/xdg-utils_1.1.3.bb              |   1 +
 .../libpcre2/CVE-2022-1586-regression.patch   |  30 +
 .../recipes-support/libpcre/libpcre2_10.34.bb |   1 +
 28 files changed, 3041 insertions(+), 61 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1v.bb => openssl_1.1.1w.bb} (98%)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2022-48174.patch
 create mode 100644 meta/recipes-core/dbus/dbus/CVE-2023-34969.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24538_3.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24538_4.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24538_5.patch
 rename meta/recipes-devtools/go/go-1.14/{CVE-2023-24538-3.patch => CVE-2023-24538_6.patch} (53%)
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0003-Fix-calculation-of-CRC-in-copy-out-mode.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0004-Fix-appending-to-archives-bigger-than-2G.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32360.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-4504.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-43115.patch
 create mode 100644 meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patch
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-1586-regression.patch

-- 
2.34.1


