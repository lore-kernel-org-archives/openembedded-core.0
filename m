Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E48C47258
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 16:27:42 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.15551.1704990452361158499
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 08:27:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iyLKD4oo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d542701796so29833295ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 08:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704990451; x=1705595251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WFRXR6/FdkfRb0/lQvwZfXuJ5YPW6NlSQ1muwnkpMWo=;
        b=iyLKD4oopQwLX3aCSF0RFCgtLUMQaQ6NY/2pVzyCgKARMoSkATlRjuprsVYpsUA7C1
         MngdrskrPL5to+B7BmqLFqbxUpPqLwWOP+E+Bx+BOJ0HXcQIG3y8A9nY4RuSoV9KeqqF
         DygI1jF9vGftyKWCulfwMap7+4030NQEanEMDb2OT3dJEE38EeBvuo9d5PzgkjTAv8Am
         PANw9g5JL8PpscQ/XY8a74nMf8s2OGnBo3iIieNxwbMYeIblXeLDFu+ZUVPcHLbk8VAn
         4sqW3V9Jf/mgeMZQ2boYpB5G36P08FQp8qpagMbcTDxo+oqevOVj5qALGSFeDv/M6C0e
         AOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704990451; x=1705595251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WFRXR6/FdkfRb0/lQvwZfXuJ5YPW6NlSQ1muwnkpMWo=;
        b=G1WrrUIKyMXWSlcf3O61+yrV+6+6FWVtvqt5g96flqZDMl0ABG9gHJ5ljb+chaJzyM
         TfXn+yj43XAyD7c8bpYFFWuSV+9OKpDp+Y/Hg4mMyVzgUTmi2EFrLiKrYUQ9OWdfKiqR
         7Sr+a6O4FHgf042vAafZ/Hzp0qrT93QDXfAZbGc5NLkXb6SxYn1QitKSe8FeEZxA6/bK
         PXWhTmKBeLdTORiruVyWdit1vtfBhlRgvWUHIX/Gc5kmgFb1JwR4tV8aI4xx2D9eQ4Qz
         yQHU8gvOOMFPKMgLVNC+aC0SB6EF782HkBPwv3oEJRYmH5uft/IoBMQiMgMZLtyWyYdL
         xN8Q==
X-Gm-Message-State: AOJu0YysK5JEXbK4cufr+pXW9sNbvTa94nJ2rBhsHnjc7IPze1i0xOp5
	4tg+a/JnJas9K8dbKSZxrVo6rQoTwpWEVLEg1m4+y4oQ2LSGSQ==
X-Google-Smtp-Source: AGHT+IGr5JNBqRQzmE01h9JUCFfGiDjUogobW1VN2i42caCbAkJ7CRMPTAsnGFvn9g0+FMNXUDKmiw==
X-Received: by 2002:a17:902:c40b:b0:1d3:adef:a49d with SMTP id k11-20020a170902c40b00b001d3adefa49dmr1547672plk.117.1704990450742;
        Thu, 11 Jan 2024 08:27:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ee8600b001d04d730687sm1347577pld.103.2024.01.11.08.27.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 08:27:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 00/12] Patch review
Date: Thu, 11 Jan 2024 06:27:13 -1000
Message-Id: <cover.1704990330.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 16:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193548

Please review this set of changes for nanbield and have comments back by
end of day Monday, January 15

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6437

The following changes since commit ff595b937d37d2315386aebf315cea719e2362ea:

  build-appliance-image: Update to nanbield head revision (2024-01-04 04:13:37 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/nanbield-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/nanbield-nut

Jason Andryuk (3):
  linux-firmware: Package iwlwifi .pnvm files
  linux-firmware: Change bnx2 packaging
  linux-firmware: Create bnx2x subpackage

Joao Marcos Costa (1):
  documentation.conf: fix do_menuconfig description

Jose Quaresma (2):
  go: update 1.20.10 -> 1.20.11
  go: update 1.20.11 -> 1.20.12

Khem Raj (1):
  tiff: Backport fixes for CVE-2023-6277

Massimiliano Minella (1):
  zstd: fix LICENSE statement

Richard Purdie (1):
  pseudo: Update to pull in syncfs probe fix

Ross Burton (1):
  avahi: update URL for new project location

Xiangyu Chen (1):
  shadow: Fix for CVE-2023-4641

Zahir Hussain (1):
  cmake: Unset CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES

 meta/conf/documentation.conf                  |   2 +-
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   5 +-
 .../cmake/cmake/OEToolchainConfig.cmake       |   3 +
 .../go/{go-1.20.10.inc => go-1.20.12.inc}     |   2 +-
 ...1.20.10.bb => go-binary-native_1.20.12.bb} |   6 +-
 ....20.10.bb => go-cross-canadian_1.20.12.bb} |   0
 ...o-cross_1.20.10.bb => go-cross_1.20.12.bb} |   0
 ...ssdk_1.20.10.bb => go-crosssdk_1.20.12.bb} |   0
 ...native_1.20.10.bb => go-native_1.20.12.bb} |   0
 ...ntime_1.20.10.bb => go-runtime_1.20.12.bb} |   0
 .../go/{go_1.20.10.bb => go_1.20.12.bb}       |   0
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 .../shadow/files/CVE-2023-4641.patch          | 147 ++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |   1 +
 meta/recipes-extended/zstd/zstd_1.5.5.bb      |   2 +-
 .../linux-firmware/linux-firmware_20231030.bb |  26 ++-
 ...277-Apply-1-suggestion-s-to-1-file-s.patch |  27 +++
 ...ompare-data-size-of-some-tags-data-2.patch |  36 ++++
 ...-compare-data-size-of-some-tags-data.patch | 162 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |   3 +
 20 files changed, 408 insertions(+), 16 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.10.inc => go-1.20.12.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.10.bb => go-binary-native_1.20.12.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.10.bb => go-cross-canadian_1.20.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.10.bb => go-cross_1.20.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.10.bb => go-crosssdk_1.20.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.10.bb => go-native_1.20.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.10.bb => go-runtime_1.20.12.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.10.bb => go_1.20.12.bb} (100%)
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-4641.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-Apply-1-suggestion-s-to-1-file-s.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data-2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data.patch

-- 
2.34.1


