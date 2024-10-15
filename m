Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA94D1F9A0
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:51:10 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.4781.1729018261897973439
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 11:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ynMNX/kr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e625b00bcso1997902b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729018261; x=1729623061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lyQHrHBcNSe0zVG4cBleNEkTZwSHJwGcJtUe5aXsCT0=;
        b=ynMNX/krBBP8/iHElS2/iMpOqPTCZsJpyRkBj50UjG7WSAU2n9OWvY6rgQm8dJnTOB
         anTFVQp888+gK/Q1ekJF4+IQM7R7rcaTt6WvphONHh+I13fJSlKIyivH96DFadX9QwYE
         5sL64QOYBZr/Z8pT0vq6uw3+4JCG9bHTc9rgVhXFaKAynsPmRFKCSzrC4qzWXsyIHZ1Q
         8UfwlRPJy9E+iR7hodXjBtgRTf9wqfIgf5Ao9PuoFx235iYaGYFfxvlDzTbqn7E3s5pp
         sOWp7rp3gQ+9qUatKs8mr9y2mJ4rUlGmmpRlV2NzGoHmSKHMnkzRRAQsBQ2cMHMXvpbD
         haOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018261; x=1729623061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lyQHrHBcNSe0zVG4cBleNEkTZwSHJwGcJtUe5aXsCT0=;
        b=qef+CMlTMKIPGSn79vdnci1roPxQu/Moh8rLrQwNW9L509OskBf4XW9iYaCn14iH9B
         TcjeOA2ZDf4tXeCyYRwi3Rx0Ju1Ja/deNYp/UtQRVY39RtX76y3JRurMq3hMowFkH9p5
         3mOp8YdIBBSxFimWfhovQlIofRadfK2mjPWJpMxRiGAFn63t1Ad/cFcdZvRX8vhKuGfy
         LdbOIFs2PzfHI+t+JNUGSTmFuAb9HNJqUB91N3033IKf5LE11IPOvmI60Yfe2pXAh2f8
         yCgGXBpQP5WnFgEYqNYuqnokOgXgvGS6e6tYCfwzyFwA3u5caSSD9YhvIHT8bHuVI8IL
         IM+w==
X-Gm-Message-State: AOJu0Yw1DDVxtrDTfJOzaU5ESLTkWF4jdtwV3IM5acS986/nBppTqebp
	6S3R8TZ7hVpeYsuEcuGlm5XQL2YKvTL7kPypkDpOot2lXz7szPYwuVDSm4CAWp9bcN4KBQwlPcD
	a
X-Google-Smtp-Source: AGHT+IEaSDxoCatCgHTNHyrXtLe8J2qbFX92HaIIw6XZFAlnk+lOZw4Eqz4uvtq8bN+/uBFwwCHWtQ==
X-Received: by 2002:a05:6a00:1310:b0:71e:3b8:666b with SMTP id d2e1a72fcca58-71e37ee768fmr22345331b3a.15.1729018260895;
        Tue, 15 Oct 2024 11:51:00 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773717b9sm1616187b3a.9.2024.10.15.11.51.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/18] Patch review
Date: Tue, 15 Oct 2024 11:50:36 -0700
Message-Id: <cover.1729018153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205924

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, October 17

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/277

The following changes since commit 5ea3ba00532265165e0d30f6d2eed568f5b5867f:

  meta-world-pkgdata: Inherit nopackages (2024-10-06 06:07:52 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Alexander Kanavin (1):
  sysvinit: take release tarballs from github

Claus Stovgaard (1):
  lib/oe/package-manager: skip processing installed-pkgs with empty
    globs

Hitendra Prajapati (2):
  cups: Backport fix for CVE-2024-47175
  libarchive: fix CVE-2024-48957 & CVE-2024-48958

Jaeyoon Jung (1):
  makedevs: Fix matching uid/gid

Jörg Sommer (2):
  ptest-runner: Update 2.4.4 -> 2.4.5
  runqemu: Fix detection of -serial parameter

Khem Raj (1):
  libpcre2: Update base uri PhilipHazel -> PCRE2Project

Louis Rannou (1):
  image_qa: fix error handling

Macpaul Lin (1):
  linux-firmware: upgrade 20240312 -> 20240909

Paul Barker (1):
  meta-ide-support: Mark recipe as MACHINE-specific

Paul Gerber (1):
  uboot-sign: fix counters in do_uboot_assemble_fitimage

Peter Marko (1):
  rust: ignore CVE-2024-43402

Purushottam Choudhary (1):
  virglrenderer: Add patch to fix -int-conversion build issue

Richard Purdie (2):
  license: Fix directory layout issues
  libsdl2: Fix non-deterministic configure option for libsamplerate

Teresa Remmet (1):
  recipes-bsp: usbutils: Fix usb-devices command using busybox

Yogita Urade (1):
  ruby: upgrade 3.2.2 -> 3.3.5

 meta/classes-global/license.bbclass           |  10 +-
 meta/classes-recipe/image.bbclass             |  11 +-
 meta/classes-recipe/uboot-sign.bbclass        |   3 +-
 meta/lib/oe/package_manager/__init__.py       |  76 +++---
 meta/lib/oe/utils.py                          |   2 +-
 meta/lib/oeqa/selftest/cases/meta_ide.py      |   4 +-
 ...devices-Fix-usb-devices-with-busybox.patch |  37 +++
 meta/recipes-bsp/usbutils/usbutils_017.bb     |   1 +
 meta/recipes-core/meta/meta-ide-support.bb    |   1 +
 meta/recipes-core/sysvinit/sysvinit_3.04.bb   |   5 +-
 .../makedevs/makedevs/makedevs.c              |  12 +-
 ...Alignof-to-define-ALIGN_OF-when-poss.patch |  52 ----
 ...e.in-do-not-write-host-cross-cc-item.patch |  32 ---
 ...Obey-LDFLAGS-for-the-link-of-libruby.patch |  25 --
 ...-Makefile.in-filter-out-f-prefix-map.patch |  42 ---
 ...eproducible-change-fixing-784225-too.patch |  26 +-
 .../0006-Make-gemspecs-reproducible.patch     |  18 +-
 .../ruby/ruby/CVE-2023-36617_1.patch          |  56 ----
 .../ruby/ruby/CVE-2023-36617_2.patch          |  52 ----
 .../ruby/ruby/CVE-2024-27281.patch            |  97 -------
 .../ruby/ruby/CVE-2024-27282.patch            |  28 --
 .../ruby/ruby/remove_has_include_macros.patch |  35 ---
 .../ruby/{ruby_3.2.2.bb => ruby_3.3.5.bb}     |  13 +-
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 meta/recipes-extended/cups/cups.inc           |   5 +
 .../cups/cups/CVE-2024-47175-1.patch          |  73 +++++
 .../cups/cups/CVE-2024-47175-2.patch          | 151 +++++++++++
 .../cups/cups/CVE-2024-47175-3.patch          | 119 +++++++++
 .../cups/cups/CVE-2024-47175-4.patch          | 249 ++++++++++++++++++
 .../cups/cups/CVE-2024-47175-5.patch          |  40 +++
 .../libarchive/CVE-2024-48957.patch           |  36 +++
 .../libarchive/CVE-2024-48958.patch           |  40 +++
 .../libarchive/libarchive_3.7.4.bb            |   5 +-
 .../libsdl2/libsdl2_2.30.1.bb                 |   1 +
 ...nversion-fatal-build-error-with-GCC-.patch |  41 +++
 .../virglrenderer/virglrenderer_1.0.1.bb      |   1 +
 ...20240312.bb => linux-firmware_20240909.bb} |   8 +-
 .../recipes-support/libpcre/libpcre2_10.43.bb |   2 +-
 ...-runner_2.4.4.bb => ptest-runner_2.4.5.bb} |   2 +-
 scripts/runqemu                               |   4 +-
 40 files changed, 898 insertions(+), 518 deletions(-)
 create mode 100755 meta/recipes-bsp/usbutils/usbutils/0001-usb-devices-Fix-usb-devices-with-busybox.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/0001-fiddle-Use-C11-_Alignof-to-define-ALIGN_OF-when-poss.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27281.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/remove_has_include_macros.patch
 rename meta/recipes-devtools/ruby/{ruby_3.2.2.bb => ruby_3.3.5.bb} (88%)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20240312.bb => linux-firmware_20240909.bb} (99%)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.4.bb => ptest-runner_2.4.5.bb} (95%)

-- 
2.34.1


