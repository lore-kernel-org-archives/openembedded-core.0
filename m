Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12418C54E68
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 02:22:13 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.34064.1710728525233738632
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 19:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2kt2MZAy;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.43, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5a4a102145fso470503eaf.3
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 19:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710728524; x=1711333324; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ycq18LuTH+zPX/nVp07/ywdRSkXzX/7wHgxiKhAMH4=;
        b=2kt2MZAysUsN0FPI25FmPzZiNlkadEt6NH7Xz6KkkPxQHXyVJdbjUOrQI6VWggwq2d
         hlg6XnTJfa89da19W+pWongHrQrxgI/EdGDmtG9sFdkL4GSXCdYM4dOcTQeDch+hcikq
         YZBIe7W6jvgtmf4+Z+t9tKpO+JbO2sDstt9ccRv6adVr5KX2CDS3odyvaubasTlwaJIK
         jmXqGpuWzdFUPY9CrbSx+HwGkopopfi/7Mq68mB+GOFckFWEo8JB5C5HC8ZN+zi1vbXm
         knwEtGtXft8MJTqpI3uGLJ2ErmZSuqpEdqODF1ir9whmTYEJmYBb+n568ZvAeVqe4F4I
         yakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710728524; x=1711333324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ycq18LuTH+zPX/nVp07/ywdRSkXzX/7wHgxiKhAMH4=;
        b=oN1QBsmFtU1li4VfLtyYmGLIlGQixH/xV4yOHJBEUu5HkQb4pxH+Cz0p2j3HEY68ci
         vyRl7jdNpADcxPWhKTZ4aqGxACcIPo+60z1p7QHPxFJuouhtc0QteA3PSA/ePeTsEp//
         ovU1I5HBUIA+Msl12mKDAWPmyHWu/jasNm5CZv1xcsEWgvsUOprba9NKC/cfn/1v9PbO
         IZNwj23tVcyvAz9C1BMeJVjYBJljUkkN+4ohelzDK5rfZ0Ocna7dUfUaIWXzclooWvQa
         8jX7oRAojUZdFVSAGN+IsjwTL32IqqWGXTQvFWLZupkog1fra+x5HcKQ4ad/LE2YcjS7
         ClDA==
X-Gm-Message-State: AOJu0YyVn4v1mvNNJqGTVmcFa2oKdt9pRSzeZJrRHQi/9PfcTLhdS39w
	FFvJfdrTFjg576wKaLf7pVUvs25qLy4USUzVCmqUEX0y8PkzKY0buVAAgz3LPQycHzXYDDEYlv2
	QgQtF9w==
X-Google-Smtp-Source: AGHT+IHLyQTJyHGyC8UQ1D8kFgegpU4jYqM6LsQsiW+Hjr4YO0zyXMVVqKBTPy7ICt5ZTALCFBmbkA==
X-Received: by 2002:a05:6358:7207:b0:175:4f0f:bbb6 with SMTP id h7-20020a056358720700b001754f0fbbb6mr6373361rwa.25.1710728524091;
        Sun, 17 Mar 2024 19:22:04 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 25-20020a630f59000000b005dc2ca5b667sm5953953pgp.10.2024.03.17.19.22.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 19:22:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 00/14] Patch review
Date: Sun, 17 Mar 2024 16:21:44 -1000
Message-Id: <cover.1710728384.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 02:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197275

Please review this set of changes for nanbield and have comments back by
end of day Tuesday, March 19

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6688

The following changes since commit f40a53370eac89df38b2fab47c411a61d4df4fc0:

  gnutls: Upgrade 3.8.2 -> 3.8.3 (2024-03-12 06:25:19 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/nanbield-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/nanbield-nut

Alex Kiernan (1):
  wireless-regdb: Upgrade 2023.09.01 -> 2024.01.23

Alexander Kanavin (1):
  linux-firmware: upgrade 20231211 -> 20240220

Claus Stovgaard (1):
  wpa-supplicant: Fix CVE-2023-52160

Khem Raj (1):
  core-image-ptest: Increase disk size to 1.5G for strace ptest image

Lee Chee Yang (1):
  openssl: upgrade to 3.1.5

Michael Halstead (1):
  yocto-uninative: Update to 4.4 for glibc 2.39

Priyal Doshi (1):
  tzdata : Upgrade to 2024a

Simone Weiß (1):
  cve-check: Log if CVE_STATUS set but not reported for component

Yoann Congal (6):
  cve-update-nvd2-native: Fix typo in comment
  cve-update-nvd2-native: Add an age threshold for incremental update
  cve-update-nvd2-native: Remove duplicated CVE_CHECK_DB_FILE definition
  cve-update-nvd2-native: nvd_request_next: Improve comment
  cve-update-nvd2-native: Fix CVE configuration update
  cve-update-nvd2-native: Remove rejected CVE from database

 meta/classes/cve-check.bbclass                |   3 +
 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 .../openssl/openssl/fix_random_labels.patch   |  22 --
 .../{openssl_3.1.4.bb => openssl_3.1.5.bb}    |   4 +-
 ...te-Phase-2-authentication-requiremen.patch | 213 ++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.10.bb     |   1 +
 meta/recipes-core/images/core-image-ptest.bb  |   2 +-
 .../meta/cve-update-nvd2-native.bb            |  35 ++-
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 ...20231211.bb => linux-firmware_20240220.bb} |   6 +-
 ....09.01.bb => wireless-regdb_2024.01.23.bb} |   4 +-
 11 files changed, 260 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.1.4.bb => openssl_3.1.5.bb} (98%)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20231211.bb => linux-firmware_20240220.bb} (99%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2023.09.01.bb => wireless-regdb_2024.01.23.bb} (88%)

-- 
2.34.1


