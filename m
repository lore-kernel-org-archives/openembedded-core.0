Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C616EB64D7
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 02:55:50 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.21.1687143347150741799
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 19:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=m1k8wuMt;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.171, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-3fde068cc3eso17855071cf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 19:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687143346; x=1689735346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qw03TR+JIrHsLinUyPmxgeB+NHCW0iL6ncpt+hAKg4A=;
        b=m1k8wuMt8p0kg9L2ezpJTTRZH3ZxVUXd5Ua83fsKD6hJewKtI/Y9A5u3IIZ/YL6HCW
         RHSG3kfPfUPa8eamndeyGQwcoxWDTrHXVQ9+GSnZO89KZPP6H5DUIA0qPM3NKMQsAlzd
         H2hZNXZD1zSz2hJs2zGxeSliUBETtsWqE6WGM8Obvlwk5RTmVdN1mIQ25Uh4dj+xKmSt
         rPM5SR5Cc/mozfPQtH6B4PJqV7jZ7TCu0z6YwZoUOsdgyW/JiZNHJycf2Z4rUUN7WXPt
         39MiSp7cTYfirynTHtE2RW9PvAveLEXuKTp62rN7IBr9p/4w+tfm8xx77yFasP7HkjV1
         tG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687143346; x=1689735346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qw03TR+JIrHsLinUyPmxgeB+NHCW0iL6ncpt+hAKg4A=;
        b=jhhCXtvWPTlXV0SWhsljJEh+0f1jxnLClXaW7RN3Pa8XEvxExcSHe+4m+aCvS28nek
         e56HJlnRhkyF8DCTxyV7nuYhUfooKQrXzSOINt9T9gtDi75ztDFexMg9fPUXcbH9DZGm
         xO/FpBXLz3hfh5xouQeuxBj0ljCWmtkyQRXXHrBBP/3CBHWhBpCOFIAwDZ47USClvjcf
         NNlkNaUmkcZotBa+GXV3P0UsVJh8832+FPSpYbpZSH+EduZQXT896ZaLHTT4ImNHBixh
         l1W7KZY7NH+9+eVWum4sK3HDiM15EVuxBnFWupsQfx5CuqXXCWVviX8Y1svcQlmf+Jna
         9wXw==
X-Gm-Message-State: AC+VfDyKi1OAu0IrRwwLsQYxt51IGbva2iVn+egwTk6fpi1R9Tb7qhxQ
	okpBOhBM5QE10N64l1XLwibi8JVldNCJp0p33cA=
X-Google-Smtp-Source: ACHHUZ5KVIodLca3EVg33GkIRDVdFJNCypJSsIBG/A+NSv3Oe2V3d4y4fDMO11zumazQqIQeU8u7jw==
X-Received: by 2002:a05:622a:1708:b0:3f0:ac80:1ed7 with SMTP id h8-20020a05622a170800b003f0ac801ed7mr11808397qtk.45.1687143345709;
        Sun, 18 Jun 2023 19:55:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b0062dba4e4706sm16611481pfi.191.2023.06.18.19.55.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 19:55:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/18] Patch review
Date: Sun, 18 Jun 2023 16:55:20 -1000
Message-Id: <cover.1687143192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 02:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183067

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5481

The following changes since commit 6e0d694ea1eb5d478dc7508d181c3a820098ee5f:

  uninative: Upgrade to 4.0 to include latest gcc 13.1.1 (2023-06-09 06:04:24 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Andrew Jeffery (1):
  Revert "ipk: Decode byte data to string in manifest handling"

Bruce Ashfield (5):
  linux-yocto/5.15: update to v5.15.109
  linux-yocto/5.15: update to v5.15.110
  linux-yocto/5.15: update to v5.15.111
  linux-yocto/5.15: update to v5.15.112
  linux-yocto/5.15: update to v5.15.113

Chen Qi (1):
  openssh: fix CVE-2023-28531

Deepthi Hemraj (1):
  glibc: stable 2.35 branch updates

Ian Ray (1):
  systemd-systemctl: support instance expansion in WantedBy

Jan Vermaete (1):
  cve-update-nvd2-native: added the missing http import

Marta Rybczynska (1):
  cve-update-nvd2-native: new CVE database fetcher

Qiu Tingting (1):
  e2fsprogs: fix ptest bug for second running

Randy MacLeod (1):
  vim: upgrade 9.0.1429 -> 9.0.1527

Sanjay Chitroda (1):
  cups: Fix CVE-2023-32324

Yogita Urade (4):
  webkitgtk: fix CVE-2022-46691
  webkitgtk: fix CVE-2022-46699
  webkitgtk: fix CVE-2022-42867
  webkitgtk: fix CVE-2022-46700

 meta/classes/cve-check.bbclass                |   4 +-
 meta/lib/oe/package_manager/ipk/manifest.py   |   2 +-
 ...-destination-constraints-for-smartca.patch |  35 ++
 .../openssh/openssh_8.9p1.bb                  |   1 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../glibc/glibc/CVE-2023-0687.patch           |  82 -----
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 -
 .../meta/cve-update-nvd2-native.bb            | 334 ++++++++++++++++++
 .../systemd/systemd-systemctl/systemctl       |   9 +-
 .../e2fsprogs/e2fsprogs/run-ptest             |   1 +
 .../e2fsprogs/e2fsprogs_1.46.5.bb             |   3 +
 meta/recipes-extended/cups/cups.inc           |   1 +
 .../cups/cups/CVE-2023-32324.patch            |  36 ++
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 .../webkit/webkitgtk/CVE-2022-42867.patch     | 104 ++++++
 .../webkit/webkitgtk/CVE-2022-46691.patch     |  43 +++
 .../webkit/webkitgtk/CVE-2022-46699.patch     | 136 +++++++
 .../webkit/webkitgtk/CVE-2022-46700.patch     |  67 ++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   4 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 22 files changed, 792 insertions(+), 115 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-upstream-include-destination-constraints-for-smartca.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2023-0687.patch
 create mode 100644 meta/recipes-core/meta/cve-update-nvd2-native.bb
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32324.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-46691.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-46699.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-46700.patch

-- 
2.34.1


