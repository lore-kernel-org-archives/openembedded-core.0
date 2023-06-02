Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9608C7EE2F
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 02:22:29 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.3355.1685672540741652386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 19:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=mlOZiCb2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.42, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6af8b25fc72so1359362a34.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 19:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685672539; x=1688264539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WnmIo3qOG177HykLj3H9ljfY1PFqPqtzT3VAzpeUCFA=;
        b=mlOZiCb2NEq0DX6/CrkP8l9tVtcVJSRCCyHl33wgkV5FKRQVZ1Ui6GlfbpObnCEH9d
         TVEfBe7EKE/9aWyT68Zs1PGN9Ow7FRV7VBjcTI6696DahsHtPTdLeyLtnwNR1/Y/WNzs
         2/lVg1fgnyieiJjgiT0F5he9o3AlhSyzOHM0Bsp+VjFORKoVNRkRNkhVXMxX7ewRza8C
         iyPdH2KXAEXfZQXxrpEeyR44YVGjaHMP6we3vJzvrd0OsMSnMucQgi7NjYqm1cec7jj6
         JdySxX2NaaE5+xN9mFMEVig13MK+ZS2+hj0SyNUTNLHsQ5qVHx05PtgBrwmz4XIksoFz
         Fccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685672539; x=1688264539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WnmIo3qOG177HykLj3H9ljfY1PFqPqtzT3VAzpeUCFA=;
        b=H2+8LsFlpL4S4Et++ULTY4zfeorUxqNLfl3B77LBz0B6+VHxl94g66TOtK7cY8gZWp
         ErV1JP6JvU7PXk77Z8oJTs6XA9Tp1W0rB8jDMMZyOv+1F8q43sQVDCROvhcQO1uL8DHJ
         brQFo8gqf3OKzMx8h3m/ugBu7qomLgv9YLIjjN8WnkU1glxAwDzv8tDr5P4BWA1ZeVPR
         8fenvP26CQME8l98aMKX474Jgsw6qRGpD/NdQcHP7DY2YRXuqLg6q9CS5yHfoMtYIlXp
         63TVJCNaqcfWOoMij+Vtxy0bXKsNUSskzePofMfQn9D2ReK6JHslXsuqmRrCeh63bfNd
         u9bg==
X-Gm-Message-State: AC+VfDzjlrXE8lDw0OsM8/PJT3ReEWlzYDrWgER64+WTCsitnI/LtQjY
	0Y3uNmwAYB/Quyc1EGlDXHVgrrZYlltHj9CN2dg=
X-Google-Smtp-Source: ACHHUZ4gzgf4Gm64ado/QkHieFhYWMYKemPWKc86qXH4o1nduPqPjm0jY4uxK0vWNCXzbaE9lcBXDg==
X-Received: by 2002:a05:6830:1201:b0:6af:8743:daac with SMTP id r1-20020a056830120100b006af8743daacmr983284otp.36.1685672539400;
        Thu, 01 Jun 2023 19:22:19 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id z16-20020aa785d0000000b0064fc715b380sm5850234pfn.176.2023.06.01.19.22.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 19:22:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/13] Patch review
Date: Thu,  1 Jun 2023 16:21:59 -1000
Message-Id: <cover.1685672395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 02:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182123

Please review this set of changes for mickledore and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5383

The following changes since commit c46d0cfe4b18318c00390eb112edcbea8b8d6a7a:

  gdb: fix crashes when debugging threads with Arm Pointer Authentication enabled (2023-05-26 13:55:18 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Alexander Kanavin (1):
  libgcrypt: update 1.10.1 -> 1.10.2

Archana Polampalli (1):
  git: ignore CVE-2023-25815

Bruce Ashfield (5):
  linux-yocto/5.15: update to v5.15.109
  linux-yocto/5.15: update to v5.15.110
  linux-yocto/5.15: update to v5.15.111
  linux-yocto/5.15: update to v5.15.112
  linux-yocto/5.15: update to v5.15.113

Martin Jansa (1):
  populate_sdk_base.bbclass: respect MLPREFIX for ptest-pkgs's
    ptest-runner

Michael Halstead (2):
  uninative: Upgrade to 3.10 to support gcc 13
  uninative: Upgrade to 4.0 to include latest gcc 13.1.1

Mikko Rapeli (1):
  qemurunner: avoid leaking server_socket

Qiu Tingting (1):
  e2fsprogs: fix ptest bug for second running

nikhil (1):
  tiff: Remove unused patch from tiff

 meta/classes-recipe/populate_sdk_base.bbclass |   2 +-
 meta/conf/distro/include/yocto-uninative.inc  |   8 +-
 meta/lib/oeqa/utils/qemurunner.py             |   1 +
 .../e2fsprogs/e2fsprogs/run-ptest             |   1 +
 .../e2fsprogs/e2fsprogs_1.47.0.bb             |   3 +
 meta/recipes-devtools/git/git_2.39.2.bb       |   2 +
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 ...-of-TIFFTAG_INKNAMES-and-related-TIF.patch | 267 ------------------
 ...01-libgcrypt-fix-m4-file-for-oe-core.patch |   6 +-
 ...ilding-error-with-O2-in-sysroot-path.patch |  10 +-
 ...ibgcrypt_1.10.1.bb => libgcrypt_1.10.2.bb} |   2 +-
 13 files changed, 40 insertions(+), 300 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libtiff/files/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.10.1.bb => libgcrypt_1.10.2.bb} (96%)

-- 
2.34.1


