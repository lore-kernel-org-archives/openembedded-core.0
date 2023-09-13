Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF99EDEC65
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 14:30:56 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.13602.1694615448880030715
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 07:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=K71BLrLX;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5774b3de210so2973601a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 07:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694615447; x=1695220247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=igX9muqGh1xHGEfc3mzREYl57sbDiB+vHWx+jIoSNpo=;
        b=K71BLrLXRlJzt9Y98AAjBh1LTDzJqYIgG8p69uYhEELJvODPb3kpzRXQXMlJdbzLKz
         9C7c1Q2NcCxiIl0WCWnqHw1CvJuEexSlkuN/YxGpvCVrgJpDuSR6M8hNDxpLReccD/ot
         0DEWIfHylQi6ssYa8mXCAvjDMqV12IL2lq4SHTRcID921/N6/YtqUxYPA1mZL1GxAsfo
         Hz99VoCe8HFFyiQoMJSXeJKQBaVqm9pOGz74DyYlTebQ5MvuJRB17Q/IwUpC+j5ic8dq
         bK0poS0iBUt3eIKgSsYInZUIs48m5Ew8o0NZpaqvoDp1AjcRz/qM1w+E6xYkVNLmU26C
         +TgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694615447; x=1695220247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=igX9muqGh1xHGEfc3mzREYl57sbDiB+vHWx+jIoSNpo=;
        b=cYaCthJrQ7NV2pjGgTVq6Di4rP3gp0o8IAEMD9SohCwN81OEAGt+rYAAeedAf7g5IA
         m0Bops+ox528mqFZuIUpzLP9rbXBdZ2dEvm0hEBchkXsj+lFvEbC+GZ0fvuN7Qmx1m1u
         f/rrvlCuyBu8mpaKsVdCGK0j4T8wDqeAQwZeUQiEHkkToL7xvbYn3aYjCS1zfczvSHch
         pESIFr/m3g/X9Utl99aQvqW8dtJooUqhj9OOj87/1kFWsOncyYiyNEd5mCR5K6CVOIJU
         sb5/7QMGJK4MTQ3UoqW+4YZjKht2Yzlo42WWt3uDIQAaqQCtEs1sAOTRmRMi6IqU5f8v
         X93A==
X-Gm-Message-State: AOJu0YzzI1+/G7b+P7ULZom1iEdSpIV8rh5A1OW5MPKgHu+Um3qhHrdR
	Y1Lub0aiM1hxNRziEOwEeih1/GVTNi0K3p8sWpQ=
X-Google-Smtp-Source: AGHT+IHfWaO5z0TsWDRcruhxIw3jDlsSHL58Gb9Y0fi/28n1BYvv7dIPu9p015CUQFdKgbabnLvfQg==
X-Received: by 2002:a05:6a20:54a1:b0:118:e70:6f7d with SMTP id i33-20020a056a2054a100b001180e706f7dmr3116141pzk.10.1694615447456;
        Wed, 13 Sep 2023 07:30:47 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u2-20020aa78382000000b00686ec858fb0sm9185796pfm.190.2023.09.13.07.30.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 07:30:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/8] Patch review
Date: Wed, 13 Sep 2023 04:30:32 -1000
Message-Id: <cover.1694613269.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 14:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187595

Please review this set of changes for kirkstone and have comments back by
end of day Friday, September 15.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5876

The following changes since commit 47a1dd7f389e3cf4ac2dc5fc21dccc870aafab4a:

  sysklogd: fix integration with systemd-journald (2023-09-05 13:34:12 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Meenali Gupta (1):
  flac: fix CVE-2020-22219

Michael Halstead (1):
  yocto-uninative: Update to 4.3

Narpat Mali (1):
  python3-pygments: Fix CVE-2022-40896

Siddharth Doshi (1):
  gdb: Fix CVE-2023-39128

Soumya Sambu (1):
  libxml2: Fix CVE-2023-39615

Yogita Urade (3):
  dropbear: fix CVE-2023-36328
  qemu: fix CVE-2021-3638
  webkitgtk: fix CVE-2022-48503

 meta/conf/distro/include/yocto-uninative.inc  |   8 +-
 meta/recipes-core/dropbear/dropbear.inc       |   1 +
 .../dropbear/dropbear/CVE-2023-36328.patch    | 144 +++++++++++
 .../libxml/libxml2/CVE-2023-39615-0001.patch  |  37 +++
 .../libxml/libxml2/CVE-2023-39615-0002.patch  |  72 ++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   2 +
 meta/recipes-devtools/gdb/gdb.inc             |   1 +
 .../gdb/gdb/0011-CVE-2023-39128.patch         |  75 ++++++
 .../python3-pygments/CVE-2022-40896.patch     | 124 ++++++++++
 .../python/python3-pygments_2.11.2.bb         |   2 +
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2021-3638.patch             |  88 +++++++
 .../flac/files/CVE-2020-22219.patch           | 197 +++++++++++++++
 meta/recipes-multimedia/flac/flac_1.3.4.bb    |   1 +
 .../webkit/webkitgtk/CVE-2022-48503.patch     | 225 ++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   1 +
 16 files changed, 975 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2023-36328.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-39615-0001.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-39615-0002.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0011-CVE-2023-39128.patch
 create mode 100644 meta/recipes-devtools/python/python3-pygments/CVE-2022-40896.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3638.patch
 create mode 100644 meta/recipes-multimedia/flac/files/CVE-2020-22219.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-48503.patch

-- 
2.34.1


