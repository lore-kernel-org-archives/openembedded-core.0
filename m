Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F560C74A5B
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 14:20:27 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.14384.1679408425098098504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 07:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fnK1Hfc2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id kq3so3769116plb.13
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679408424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bov2R52D+/vcYiZgkMI6Rq15NtVl/YHW0zKlvpCYt/8=;
        b=fnK1Hfc2iqL0EEV3JTCJK+5NPc7o4Nd6ryKU3Tl4+NdxMWpJN32JybkPiRiUtAlMgX
         fH8b3+qr597lLIcGRp4L32Z8/7xjxNno7/WpCownPMbOt7scTmQDyfYXMfMBAL9JM/zm
         PZ0UcTjlIDpXYV+D8nRI4fkWvVXtFOxXG+Jbxsn7/5jbt3E3dHlBY/dGWlTNmEShZ02j
         LqwjQCLApsQCJ81+FTvT+isaXbvyqHqtIPhu5NXDNTFaDdq1iGFl86yGhoJtsldUt/iN
         oby+AuXzaPXoJYsKiQM0onIPqRA5vl/NVdA6jm5gxE18FgUR5excOFQwVMGO/oQm6aUE
         xZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679408424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bov2R52D+/vcYiZgkMI6Rq15NtVl/YHW0zKlvpCYt/8=;
        b=RYPdQHhSw+S2+E2xUAoTg74nGoT9ucX34NI63Hp1UHweiQyRrjlV7WTErSLk3NOEmZ
         h02nwmhAH0SoKevZg3h/2OU9W6FfrGVspGwm0j+jahVuEDHbDb0bdypUjxajF8AFgq4A
         4gLismXbP0T8vSAan9FRLBdYbutvscc6L+n2QhRJTMKTGp0nWglSgvf3MiNJBK24Kyco
         eZEFOc1Z8hDnApMJfyvT4q8GM3a3Gro9pcSYln66b4LNTobd0CwbsGkjV2MNSIzr925Y
         BjDdLliT+m3OnjyfY6T7M9ezUtLEl/tlv1dZ6ErhnbpxyP7s4M0mYHVQ0O+ws4Ft7GcZ
         JbIw==
X-Gm-Message-State: AO0yUKXnGpVF156n0v1jJcm3gStyZLRVIFJSfUF6F1uZMlN8eghGMd+G
	G7QCxRF6C1bcz5tdLJ11ONZko4QKTK7cMRl5RaE=
X-Google-Smtp-Source: AK7set+CtzCgOCICnt/N0u5Ajt07Xt4OQdqQCtAnjTZex1iCVqj7bwZ5i3HQsjMTdmY2SjDmV/bAdA==
X-Received: by 2002:a05:6a20:65af:b0:d5:58df:fbaa with SMTP id p47-20020a056a2065af00b000d558dffbaamr2426594pzh.12.1679408423942;
        Tue, 21 Mar 2023 07:20:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id g11-20020aa7818b000000b005892ea4f092sm8551291pfi.95.2023.03.21.07.20.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:20:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/14] Patch review
Date: Tue, 21 Mar 2023 04:20:05 -1000
Message-Id: <cover.1679408291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 14:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178871

Please review these patches for dunfell and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5073

The following changes since commit efb1a73a13907bed3acac8e06053aef3e2ef57f5:

  build-appliance-image: Update to dunfell head revision (2023-03-15 23:09:39 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alban Bedel (1):
  systemd: Fix systemd when used with busybox less

Andrej Valek (1):
  libarchive: fix CVE-2022-26280

Chee Yang Lee (2):
  ghostscript: add CVE tag for
    check-stack-limits-after-function-evalution.patch
  libksba: fix CVE-2022-3515

Hitendra Prajapati (1):
  QEMU: CVE-2022-4144 QXL: qxl_phys2virt unsafe address translation can
    lead to out-of-bounds read

Kenfe-Mickael Laventure (3):
  buildtools-tarball: Handle spaces within user $PATH
  toolchain-scripts: Handle spaces within user $PATH
  populate_sdk_ext: Handle spaces within user $PATH

Richard Purdie (4):
  staging: Separate out different multiconfig manifests
  staging/multilib: Fix manifest corruption
  glibc: Add missing binutils dependency
  base-files: Drop localhost.localdomain from hosts file

Ross Burton (2):
  vim: upgrade to 9.0.1403
  vim: set modified-by to the recipe MAINTAINER

 meta/classes/multilib.bbclass                 |   1 +
 meta/classes/populate_sdk_ext.bbclass         |   2 +-
 meta/classes/staging.bbclass                  |   4 +
 meta/classes/toolchain-scripts.bbclass        |   2 +-
 meta/recipes-core/base-files/base-files/hosts |   2 +-
 meta/recipes-core/glibc/glibc.inc             |   4 +-
 meta/recipes-core/meta/buildtools-tarball.bb  |   2 +-
 .../systemd/systemd/systemd-pager.sh          |   7 ++
 meta/recipes-core/systemd/systemd_244.5.bb    |   5 +
 meta/recipes-devtools/qemu/qemu.inc           |   9 +-
 .../qemu/qemu/CVE-2022-4144.patch             | 103 ++++++++++++++++++
 ...tack-limits-after-function-evalution.patch |   2 +-
 .../libarchive/CVE-2022-26280.patch           |  29 +++++
 .../libarchive/libarchive_3.4.2.bb            |   1 +
 .../libksba/libksba/CVE-2022-3515.patch       |  47 ++++++++
 meta/recipes-support/libksba/libksba_1.3.5.bb |   1 +
 meta/recipes-support/vim/vim.inc              |   8 +-
 17 files changed, 215 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pager.sh
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-26280.patch
 create mode 100644 meta/recipes-support/libksba/libksba/CVE-2022-3515.patch

-- 
2.34.1


