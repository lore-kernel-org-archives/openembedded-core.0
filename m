Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B84AC36008
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:33:43 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.43699.1742834020088521396
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jRAzzx6G;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224019ad9edso13530135ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834019; x=1743438819; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B8xIP4YPiZLn/4lKx1R7AbMlKlNWB+g+KzAtr9JG+t8=;
        b=jRAzzx6GJ3nls/zPE4WD6au6dV/up/Q7ZASUxDWCnKHRNVAX3Uj+z4Uqfr1yNEGke1
         gfGr3SA3MqfJUuUkJOKbjLNgrTiRAEi7jz6+K97229AeeW/O4cuDR1pjEGElpvIyGguo
         Zl6Jdin5vVuU8NZp1imHD8diKmgsK26Q9i5L+oa2l+IJj1LKDsijfKITQeseKmImVyG3
         rlccfd82v5LRMTAGMis9Fdg/nZM3slqDAZIUsK+73yfzyZrUMCWx1cFk3TApyT4obxJ0
         vJ68jKqrczP054yw/UKRJvHnHAw8HtEOThct+cNBy06COR0K8fFvuXq9XpVjclp5O8kp
         g9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834019; x=1743438819;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8xIP4YPiZLn/4lKx1R7AbMlKlNWB+g+KzAtr9JG+t8=;
        b=cqJkiFC15lvze6nh14L0u3Scf+AFAo2cd4LD610TiR1vlshOwfqAlrem28PqKoBwEn
         JeqebXbZxDKUwC6hnfBSJiEflWHgIpApE0khwI0lOCdoqk0pX6bQtdMPNJVbr79SggDQ
         m8Bkn9qgKdLCRuUEQ3Ihw6zoOEO+Yei1pNCAufDr4SuOnIWY7Ku1m/2V5Us7aXDisZY/
         /6cWlh04dUjQkor91Cdo2t+g1WmLQnUpNoc6mPf2xBwFzyiRuwkAHbgVAfwzknxpkto3
         aHM/I9thA1KH3yTn6b8wQHEpGm48Zdb6T7lFFSvO8iw75be4pl6Ovc8rQHnEw7VPD/zA
         fPtA==
X-Gm-Message-State: AOJu0YxdiSjaOMLJt21L0rf1P/Dykhf3iGfTtkUMNkESiik09k7ISLXt
	CkW4PM54G5JgVa5roeHkwg7rwWyLpZB7BYhyTMd+lfgBZDfO6wWa
X-Gm-Gg: ASbGncvS19LZ5BmWYWBFjYKDm/r7I4OJwBZMPXAJcr3D4w4DYZXOLVWOlsSgxhT7Gb6
	f25Q4Og7BVfvbhzk+RMzJouBt/hStPlvatZ7mvcQL98p3UCEEdDul05kfJbkmYOJSu6li2VYXCQ
	l9m1rRBatO78qwSGZRMnTSkogktr/ULye8yrWjHTfAxCQr+RMIWtdjRxxYGry0W0IfyVed2rdMh
	rie7EXq4Q3cMNDqD0+kiJZGfR0TKiSPfENmbXu8v4JVvCLS51sH9W+C2mxiga1cecH7tsfBTCJJ
	BYXrASZB99DiwwZpDTgcVgdsypKLXvTw8GRs
X-Google-Smtp-Source: AGHT+IFyBRQ7uGBEbILzMboSCrvTEyqPkm1s/4xqre8OGXE+rSoqjh2tyePT2jNth7f/+kOoCXOisw==
X-Received: by 2002:a05:6a21:6da0:b0:1fa:995a:5004 with SMTP id adf61e73a8af0-1fe43205ff2mr20384645637.26.1742834019242;
        Mon, 24 Mar 2025 09:33:39 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:33:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 00/21] musl/gcc-15: Fix packages to build with gcc15 on
 musl platforms
Date: Mon, 24 Mar 2025 09:33:21 -0700
Message-Id: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFGJ4WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyMT3SQT3dzS4hzd9ORkQ1NdS0sjYyMD82TTJBMzJaCegqLUtMwKsHn
 RsbW1AHVIMvxfAAAA
X-Change-ID: 20250324-b4-musl-gcc15-9923207c5b46
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213532

This series fixes builds for musl-qemux86-64 and musl-qemux86 targets
on yocto Autobuilder.

Some of the patches will impact the native builds but I have not called
them out explicitly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Khem Raj (21):
      unifdef: Don't use C23 constexpr keyword
      unifdef: Drop md5sum for SRC_URI
      nettle: Fix build with GCC-15
      make: Fix signatures for getenv() and getopt()
      groff: Fix build with GCC-15 on musl
      gawk: Fix build with gcc-15 on musl
      which: Fix build with gcc-15 on musl
      which: Drop md4sum for SRC_URI
      db: Disable incompatible-pointer-types warning as error
      bc: Add missing params to getopt/getenv signatures
      parted: Fix build with GCC 15
      mtd-utils: Fix GCC version detection
      alsa-tools: Fix build with gcc 15
      ghostscript: Pin to C17 std
      lrzsz: Fix build with gcc-15
      lrzsz: Drop setting md5sum for SRC_URI
      xinetd: Pin to C17 std
      gperf: Pin to C17 std
      apt: Fix build with GCC 15
      syslinux: Use -idirafter to add back path for system stdarg.h
      vulkan-samples: Fix build with GCC-15

 .../lrzsz-0.12.20/0001-Fix-build-with-GCC-15.patch | 186 +++++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |   3 +-
 ...strutl-Add-missing-include-cstdint-gcc-15.patch |  26 +++
 meta/recipes-devtools/apt/apt_2.6.1.bb             |   1 +
 .../0001-Fix-signatures-for-getenv-getopt.patch    |  60 +++++++
 meta/recipes-devtools/make/make_4.4.1.bb           |   1 +
 ...01-Improve-check-for-GCC-compiler-version.patch |  34 ++++
 meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb       |   3 +-
 .../syslinux/syslinux_6.04-pre2.bb                 |   2 +-
 .../0001-Don-t-use-C23-constexpr-keyword.patch     |  57 +++++++
 meta/recipes-devtools/unifdef/unifdef_2.12.bb      |   4 +-
 ...missing-params-to-getopt-getenv-signature.patch |  40 +++++
 meta/recipes-extended/bc/bc_1.08.1.bb              |   1 +
 ...arameter-signatures-for-getenv-and-getopt.patch |  54 ++++++
 meta/recipes-extended/gawk/gawk_5.3.1.bb           |   1 +
 .../ghostscript/ghostscript_10.05.0.bb             |   2 +
 meta/recipes-extended/gperf/gperf_3.1.bb           |   2 +
 ...0001-getopt-Fix-type-signature-for-getenv.patch |  27 +++
 meta/recipes-extended/groff/groff_1.23.0.bb        |   1 +
 ...4-PATCH-parted-fix-do_version-declaration.patch |  40 +++++
 meta/recipes-extended/parted/parted_3.6.bb         |   1 +
 ...1-getopt-Fix-signature-of-getenv-function.patch |  39 +++++
 meta/recipes-extended/which/which_2.21.bb          |   2 +-
 meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb    |   2 +-
 ...-SpvBuilder.h-add-missing-cstdint-include.patch |  28 ++++
 .../0001-framework-Include-stdint.h.patch          |  26 +++
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb |   6 +-
 ...retask-fix-reset_changes_boot-declaration.patch |  26 +++
 meta/recipes-multimedia/alsa/alsa-tools_1.2.11.bb  |   3 +-
 meta/recipes-support/db/db_5.3.28.bb               |   5 +-
 ...-getopt-getenv-signatures-in-declarations.patch |  44 +++++
 meta/recipes-support/nettle/nettle_3.10.1.bb       |   1 +
 32 files changed, 716 insertions(+), 12 deletions(-)
---
base-commit: 6edb7e77f1342cb63f11067c50f9a2b10f10b3b9
change-id: 20250324-b4-musl-gcc15-9923207c5b46

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


