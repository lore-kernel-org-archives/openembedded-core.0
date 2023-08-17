Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A8EC05052
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 02:49:56 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.178655.1692240595720734953
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 19:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=u423rr5Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6887b3613e4so1443149b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 19:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692240594; x=1692845394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5PZ5UuvSbp1m8cYh1aOH+EJVCJjFYbe241tTrQW+Rp8=;
        b=u423rr5QY3wdGYB9tYgYD+LgzI6wNUHSNh1VVhuRNgEkpdKf83kWp7nDs4SHRdPdSv
         YSbuzwYwvgm3efCemdtn8Suruxnun+9pFEYyglv5JA4Yg9fD/7BnJrNcKQxrYL6WzOhQ
         r0MFV92+w6JCVFWz08sEtKBRRoUz03fgJfCtfY6Ht4AxLdmZI2ANjP33CLoAsS+8/A92
         LacjKiyDa3X21EwQ2LM38V0ZgZWohKpPFbJ4BbkBtSJSGlSrgIuw3PUnO6LUiFSDtCLT
         J0Gas73VKRJW6JxlfXVQryzwBxeFEwflC+ZABL0itlM0ggD9WJ8/Jw96uMl/4HInpNjZ
         2z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692240594; x=1692845394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5PZ5UuvSbp1m8cYh1aOH+EJVCJjFYbe241tTrQW+Rp8=;
        b=geQNIv3wtuhbfNQt3Mxe6mW4e3jZXFFJ4u8hYUJJZux+gBE+o50UTukIph5XK1lNAN
         19zJVSp9rzYLFJonN/vlkJ3IMnhNKSl30jr6AMylO8g/4xdkXTGuNEexKnYNdRGVnz/t
         RvdfLhwiO+fH9bB0/Qog0qBd4UJ7icOyKMsXr/+JB5CpqYi1i4vGryTxr8/Nd83uSfQL
         E5WN16JBbDhtXLpdLe3XFNJmAcfKKp+MGsYzDP0q8Y4B7UZbLic6NJU5nGDcZKpAmwZ/
         wHxdldn/7oQumATbUQaaKFx5FKLTexS0mplYvCiuWtl50WnL/qXOy18OJCuByRoUF7wo
         ZcEg==
X-Gm-Message-State: AOJu0YyXmzP+VuGqHUSVhOrFHnYD8TUa3+cYJsJpML6CMEKY43U2fikh
	r89MMJgpFzwoaogaNvKqH2XlGVL+t8+ZQrxBJR0=
X-Google-Smtp-Source: AGHT+IH4ylHV/F7jPCAQT1GaXa/gg7KGMZzWDfLvNb9F2fXwdnzxFAZDhaFtavJdtpq+Y4oOgzziXw==
X-Received: by 2002:a05:6a20:8e02:b0:138:1980:1837 with SMTP id y2-20020a056a208e0200b0013819801837mr5481027pzj.13.1692240594378;
        Wed, 16 Aug 2023 19:49:54 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o5-20020a170902d4c500b001bb9bc8d232sm13827594plg.61.2023.08.16.19.49.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:49:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/16] Patch review
Date: Wed, 16 Aug 2023 16:49:32 -1000
Message-Id: <cover.1692239433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 02:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186265

Please review this set of changes for kirkstone and have comments back by
end of day Friday, August 18.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5748

The following changes since commit e1a604db8d2cf8782038b4016cc2e2052467333b:

  build-appliance-image: Update to kirkstone head revision (2023-08-07 04:41:22 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Adrian Freihofer (1):
  dmidecode: fixup for CVE-2023-30630

Alberto Planas (1):
  rpm2cpio.sh: update to the last 4.x version

Alexander Kanavin (1):
  libxcrypt: update PV to match SRCREV

Archana Polampalli (2):
  ghostscript: fix CVE-2023-38559
  qemu: fix CVE-2023-3180

Ashish Sharma (1):
  curl: Backport fix CVE-2023-32001

Bruce Ashfield (3):
  linux-yocto/5.10: update to v5.10.186
  linux-yocto/5.10: update to v5.10.187
  linux-yocto/5.10: update to v5.10.188

Marek Vasut (1):
  linux-firmware: Fix mediatek mt7601u firmware path

Martin Jansa (1):
  npm.bbclass: avoid DeprecationWarning with new python

Narpat Mali (1):
  python3-certifi: fix CVE-2023-37920

Pavel Zhukov (1):
  scripts/rpm2cpio.sh: Use bzip2 instead of bunzip2

Peter Marko (1):
  procps: patch CVE-2023-4016

Vivek Kumbhar (1):
  qemu: fix CVE-2023-3354 VNC: improper I/O watch removal in TLS
    handshake can lead to remote unauthenticated denial of service

Yogita Urade (1):
  qemu: fix CVE-2020-14394

 meta/classes/npm.bbclass                      |   2 +-
 ...ibxcrypt_4.4.30.bb => libxcrypt_4.4.33.bb} |   0
 .../dmidecode/CVE-2023-30630_1a.patch         | 236 ++++++++++++++
 ...-30630_1.patch => CVE-2023-30630_1b.patch} | 126 +++-----
 .../dmidecode/CVE-2023-30630_2.patch          |  11 +-
 .../dmidecode/CVE-2023-30630_3.patch          |  60 ++--
 .../dmidecode/CVE-2023-30630_4.patch          | 149 ++++-----
 .../dmidecode/dmidecode_3.3.bb                |   3 +-
 .../python3-certifi/CVE-2023-37920.patch      | 301 ++++++++++++++++++
 .../python/python3-certifi_2021.10.8.bb       |   4 +-
 meta/recipes-devtools/qemu/qemu.inc           |   3 +
 .../qemu/qemu/CVE-2020-14394.patch            |  79 +++++
 .../qemu/qemu/CVE-2023-3180.patch             |  50 +++
 .../qemu/qemu/CVE-2023-3354.patch             |  87 +++++
 .../ghostscript/CVE-2023-38559.patch          |  32 ++
 .../ghostscript/ghostscript_9.55.0.bb         |   1 +
 .../procps/procps/CVE-2023-4016.patch         |  85 +++++
 meta/recipes-extended/procps/procps_3.3.17.bb |   1 +
 .../linux-firmware/linux-firmware_20230515.bb |   2 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 .../curl/curl/CVE-2023-32001.patch            |  39 +++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 scripts/rpm2cpio.sh                           |  30 +-
 25 files changed, 1117 insertions(+), 223 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.30.bb => libxcrypt_4.4.33.bb} (100%)
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630_1a.patch
 rename meta/recipes-devtools/dmidecode/dmidecode/{CVE-2023-30630_1.patch => CVE-2023-30630_1b.patch} (63%)
 create mode 100644 meta/recipes-devtools/python/python3-certifi/CVE-2023-37920.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-14394.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3354.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-38559.patch
 create mode 100644 meta/recipes-extended/procps/procps/CVE-2023-4016.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-32001.patch

-- 
2.34.1


