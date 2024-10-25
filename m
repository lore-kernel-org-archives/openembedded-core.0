Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4656D149DE
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 18:29:42 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.2549.1729880977750248979
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 11:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pc3POhsS;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.50, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-277e6002b7dso955541fac.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 11:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729880977; x=1730485777; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ou+S36Zp0DYMEjefpjewkcXgU4iQOCIwvb7UjGSfhM=;
        b=pc3POhsSbMt/+W9N34PZZwHGmvgD4oPMFcRo3yD5NWwzQ0ro54OOlY6MQPNdoh/5yX
         n3PNXWmDxHpYslKF6Q1U8ZDtt5voq2kICi3/oMznMm2VLHrLMey6CuZS++N0vZWtyShf
         gYS666PR4jzGEN8jvfSoB7Y5YxNxrZy1Hn7Y+EpiGsVg/qwR8GYwJ/NNp4TLexdzQcuV
         D4JEfpBMXJDq6PG8KW2u2Ykh4EAOks985pyiZpWMRaJslRcN5LAjE28RQ5AZTl5XWSNd
         If9ajXsCU5gAZX9V6P7rxentHQ6uvlN0EiBegpsgdKjitnnvRQoseQfhNR3Hhme0Q+AF
         4ipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729880977; x=1730485777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ou+S36Zp0DYMEjefpjewkcXgU4iQOCIwvb7UjGSfhM=;
        b=OdqS/NnDTwpLvXgCbTzXyFrsiCajyva4giMwIdABYGBqyWyV33sZJLY/eEYBkyFyx5
         kDMGlQrFx/gv7xh1Ls8eiElXjCNsqKe+Xy2hT9NocSWAvcDYSSTZV5HZMw8nqDFPm3QD
         9VWwvbSCDlW31GHOiU/zJoLdnSjgcpdLIR3Vk2GocyMvKJrU1CV6RUO8Potsyy+MpHQM
         9Vf9S8E9A6SndcjqkzIFCgU8NXS2Pi0YqLS65I40Px8vGizPRBv0qJsuk2ias8IZ9d+E
         dzl7gnUIu37mkQ/0wJwx9zx/FVoyRwMOlK6nIZMIJMf60u3UCfO3PGMQ57oLMGEzxvfo
         5y3g==
X-Gm-Message-State: AOJu0YyprwaBtbwP115/Xm1nM/WSxYlHQJctLx8ai4bhvL4+KFr9lExd
	3EIsXdux4M+SLfBeOdVDcX7r46B5VAhi+iKmIs/HwXT8aNk0kLyX2kfhu0ttSMD3YY/jVjy2FMP
	3
X-Google-Smtp-Source: AGHT+IGOl32xbSUlOt0feHki6hINvBwHNyoykLlmEpii0PMmE/mTHMpTewFXDGu6K94FsFAtqzlUrw==
X-Received: by 2002:a05:6870:32d2:b0:270:64ed:c125 with SMTP id 586e51a60fabf-29051b6ba34mr451831fac.16.1729880976847;
        Fri, 25 Oct 2024 11:29:36 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7a51:eecd:55a5:9cd2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8a4780esm1394972a12.86.2024.10.25.11.29.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 11:29:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/11] Patch review
Date: Fri, 25 Oct 2024 11:29:19 -0700
Message-Id: <cover.1729880682.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 18:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206360

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, October 29

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/332

The following changes since commit a1b28a88bc7697371ab166b18587b615d6d39c8e:

  image.bbclass: Drop support for ImageQAFailed exceptions in image_qa (2024-10-16 06:21:24 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Anuj Mittal (1):
  sqlite3: upgrade 3.45.1 -> 3.45.3

Bruce Ashfield (2):
  linux-yocto/6.6: update to v6.6.52
  linux-yocto/6.6: update to v6.6.54

Jiaying Song (1):
  liba52: fix do_fetch error

Jonas Gorski (1):
  rootfs-postcommands.bbclass: make opkg status reproducible

Peter Marko (1):
  openssl: patch CVE-2024-9143

Rohini Sangam (1):
  vim: Upgrade 9.1.0698 -> 9.1.0764

Ross Burton (1):
  icu: update patch Upstream-Status

Sergei Zhmylev (1):
  lsb-release: fix Distro Codename shell escaping

Shunsuke Tokumoto (1):
  python3-setuptools: Add "python:setuptools" to CVE_PRODUCT

aszh07 (1):
  ffmpeg: Add "libswresample libavcodec" to CVE_PRODUCT

 .../rootfs-postcommands.bbclass               |   4 +
 .../openssl/openssl/CVE-2024-9143.patch       | 202 ++++++++++++++++++
 .../openssl/openssl_3.2.3.bb                  |   1 +
 .../python/python3-setuptools_69.1.1.bb       |   2 +
 meta/recipes-extended/lsb/lsb-release_1.4.bb  |   2 +-
 .../linux/linux-yocto-rt_6.6.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  28 +--
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |   2 +
 .../recipes-multimedia/liba52/liba52_0.7.4.bb |   2 +-
 .../icu/icu/fix-install-manx.patch            |   4 +-
 .../{sqlite3_3.45.1.bb => sqlite3_3.45.3.bb}  |   2 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 13 files changed, 237 insertions(+), 28 deletions(-)
 create mode 100755 meta/recipes-connectivity/openssl/openssl/CVE-2024-9143.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.45.1.bb => sqlite3_3.45.3.bb} (69%)

-- 
2.34.1


