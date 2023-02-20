Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB600C636D6
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 22:20:32 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.28055.1676931630559771113
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 14:20:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=M/h60VHn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id q5so2991688plh.9
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ygARm9lrHzWp46Wd8AA74TTbw9qZ74uxBNjK+kUVbE=;
        b=M/h60VHnv9tf7jD5qG4OqetVAJP5759ClZ4AaPm0Y5J21KpQbIAjtHOHJ/h5+VRGkQ
         wWMtpYYcm4hOZqjLp03jyYkMjxsQg5evkwwh72GE948cQEQiprVVj32+ekVg+D2XubtF
         JM6mEdRb6AjxSzxqsqER8R2VtFfjyRaDzbNbIIULatS3fg9n5hAcktu88J/Yg+9MDWM1
         5qVJBK18R8TgXkPpUwD+YXF93yMJheQEeFvZ4dso12hVIlXIOWspm6mkaynNZi8dyBVQ
         GYL0gucxliy8zLQtD+5hG/JIfvq3Gb+3qR/IN5dQyscIV9KcsuFVdbRR5M2e86MWpFgo
         MKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ygARm9lrHzWp46Wd8AA74TTbw9qZ74uxBNjK+kUVbE=;
        b=U417DRliuhpqjIb0ZQe9rSfyFGKaGgbdx/jQjgz3BWLrBY4YT+XT2A6cim69nFyyqO
         Bqwck4lfkVSlI9gNwM1qwFdkGxhreBnvP2Se6dRIXkIUtEbrvoXqmzRBrHIGoA6i5FsP
         roLvzCqbb/UIRe8TQJuGW5tRmIQC4gLkdGqhlaoFsQmCnxFB2rXwLViFqp8h0jzn8OGd
         efsuBqEM8c5k1T+K63Z6KNLjkEC9dcrOz3CljTgJW7AfgZyDUJziCHpbY4M4Yz3Lanl5
         mnphjKmB96WBCXaZsg6Rh1VySzit/fNjVJGTEifFXMmuKEfVU9Yr8CMSJIfnQBd0BiZZ
         /Ohw==
X-Gm-Message-State: AO0yUKWdM8dWqNyRu12HmoDeqAnvo8mse/1qxoto80+1Ug4dFikJKftW
	2PWA69opWOzgGbBrOCwM+miskqZXtXQ7s6PPuiQ=
X-Google-Smtp-Source: AK7set8xBtJ6SgtVRRGRqv18FUoxN170pqzF+xA8HZuKjqyK/2e/ezC2rFLBY7B/Mfkpfq+hFOY+/g==
X-Received: by 2002:a17:903:249:b0:19a:68e5:6665 with SMTP id j9-20020a170903024900b0019a68e56665mr3572322plh.52.1676931629193;
        Mon, 20 Feb 2023 14:20:29 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019719f752c5sm8401200plb.59.2023.02.20.14.20.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 14:20:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/16] Patch review
Date: Mon, 20 Feb 2023 12:20:07 -1000
Message-Id: <cover.1676931497.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 22:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177460

Please review this set of patches for dunfell and have comments back by
end of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4950

The following changes since commit daaee6fcb0d201f041678af433d8e1cd6f924d09:

  build-appliance-image: Update to dunfell head revision (2023-02-13 07:48:21 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (1):
  oeqa/qemurunner: do not use Popen.poll() when terminating runqemu with
    a signal

Antonin Godard (2):
  busybox: always start do_compile with orig config files
  busybox: rm temporary files if do_compile was interrupted

Hitendra Prajapati (1):
  git: CVE-2022-23521 gitattributes parsing integer overflow

Martin Jansa (1):
  meta: remove True option to getVar and getVarFlag calls (again)

Mikko Rapeli (1):
  oeqa context.py: fix --target-ip comment to include ssh port number

Omkar Patil (1):
  sudo: Fix CVE-2023-22809

Pawel Zalewski (1):
  classes/fs-uuid: Fix command output decoding issue

Richard Purdie (3):
  nativesdk: Handle chown/chgrp calls in nativesdk do_install tasks
  make-mod-scripts: Ensure kernel build output is deterministic
  libc-locale: Fix on target locale generation

Ross Burton (3):
  quilt: fix intermittent failure in faildiff.test
  quilt: use upstreamed faildiff.test fix
  git: ignore CVE-2022-41953

Steve Sakoman (1):
  qemu: Fix slirp determinism issue

Vivek Kumbhar (1):
  qemu: fix CVE-2021-3929 nvme DMA reentrancy issue leads to
    use-after-free

 meta/classes/fs-uuid.bbclass                  |   2 +-
 meta/classes/image.bbclass                    |   2 +-
 meta/classes/libc-package.bbclass             |   1 +
 meta/classes/license_image.bbclass            |   2 +-
 meta/classes/nativesdk.bbclass                |   2 +
 meta/lib/oeqa/runtime/context.py              |   4 +-
 meta/lib/oeqa/utils/qemurunner.py             |  11 +-
 meta/recipes-core/busybox/busybox.inc         |  27 +-
 .../git/files/CVE-2022-23521.patch            | 367 ++++++++++++++++++
 meta/recipes-devtools/git/git.inc             |   4 +-
 meta/recipes-devtools/go/go_1.14.bb           |   4 +-
 .../qemu/qemu-system-native_4.2.0.bb          |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   3 +
 .../qemu/qemu/CVE-2021-3929.patch             |  78 ++++
 meta/recipes-devtools/qemu/qemu_4.2.0.bb      |   4 +-
 meta/recipes-devtools/quilt/quilt.inc         |   1 +
 .../quilt/quilt/faildiff-order.patch          |  41 ++
 .../sudo/files/CVE-2023-22809.patch           | 113 ++++++
 meta/recipes-extended/sudo/sudo_1.8.32.bb     |   1 +
 .../make-mod-scripts/make-mod-scripts_1.0.bb  |   2 +-
 scripts/lib/devtool/menuconfig.py             |   2 +-
 scripts/nativesdk-intercept/chgrp             |  27 ++
 scripts/nativesdk-intercept/chown             |  27 ++
 23 files changed, 702 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-23521.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch
 create mode 100644 meta/recipes-devtools/quilt/quilt/faildiff-order.patch
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2023-22809.patch
 create mode 100755 scripts/nativesdk-intercept/chgrp
 create mode 100755 scripts/nativesdk-intercept/chown

-- 
2.34.1


