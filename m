Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8123DC3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:23:53 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.1399.1746804232287883429
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WJaUA3qT;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b2093aef78dso1860440a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746804231; x=1747409031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sOe/50HILBy1eEFtrdDiM1AmEIRF5HYTUZI8xHUKa8s=;
        b=WJaUA3qT2UyOOzupyvfKYxCmpV01dDbalSa8SfljyDAtXqMhvxOIU0xj7v2UVVJ3ZU
         zVbwpSqGVp03ROdf0nY6lO8syXHYaao9IdlxhX5eUA4CMkMHUxSDY+0p5E1cXlXjGXGk
         mWaoFwGnOp48Iq6Pa37OTlUNyTuUykgBWGtG06c21PSJZDoogdVTjonNkmVo7/ueO5JW
         K52Fa1WHbKZiU7Vi4ct+4sVS31Dzrqd3dYOZ26NXnUAqwhdl3kxYsTxxlRdfNYHF6c1o
         9+xtHVsGHOJ+4JdLQrO8ChbfwWAUH+cedQcR71+U0Rr8UARwjYQDEgN8uwva51cYJg5Y
         8PUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804231; x=1747409031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sOe/50HILBy1eEFtrdDiM1AmEIRF5HYTUZI8xHUKa8s=;
        b=RW31ZUe5JDJxT/h8cUT+2zDJs1qOe23A7koEs+2XouAmDWYW8kwJDmyXDrGPZTM40n
         SLh2UNEYYlw/cscW0hK5H6WiO+w6pbmCJTs2/BUPcRFnv8tIO+dm96URNOiRMPbOvVf7
         YeDdwNP/HXzuvLivsGGpnsh/JLLeeLU5QNbjXfqh9kxzF9Y+dKndFDwrz+V2xwWyW32Z
         22neNmL7CVp8x99kcI9EyZK3uAlxLf9u213ajZvQMV2WkrevGBY32yJUP/ToanHjMsx2
         zfhZICS2Im4c00mZ6msnx8SDFUkD33FS31WHj6Lm4bi+L1sYSCwWjrJ8rxOu09pnDa3m
         XU6Q==
X-Gm-Message-State: AOJu0YwG7H87F9JkAyuYIvIDQgezaYBCTPETYs7GxHH8Wx3UexXg7Owt
	gn5hkBY5tUHpgO6mHnFh8Xp434pk6nKa8bFDHj0Sxv8RgT7kow/fFcogZ1anhTUfAgR8u6C8cPM
	P
X-Gm-Gg: ASbGnctMAbtycfJObG01tQN82IfoH84CYBbAyqEnf7H0/jrx4+yfAAPPXrlz2U5do4f
	l5fBHyN9vpurbiPSXHBmwhu8QTch6SWp/eAknv1p/074TP2O3snEXNjModyB+lPBuHLlXT6eBmx
	gihrD/eseAzlEJs+lZbtiC6tWzWMN2jSLBpjYgwVdod9hUS95MA5cSdnA/wHNUlLZhf9miIXm6E
	PhWmYmtSMO2wp07vP7eNl7Vrd1wncSqu8QT/450zNaAJtqorjkQ+0VtX52HmOeGGaQgOhO4Q+ZD
	9THqPO5akiX7CTHiHNoEICpaJxY0qJwB
X-Google-Smtp-Source: AGHT+IGUVOz8V0Xs71Q/cpODl9+X3AGKaZqfWqMc+FIYaLSZHN0y2CjLV1YlmYwPts9hOAf2w4moTg==
X-Received: by 2002:a05:6a21:c91:b0:1ee:ef0b:7bf7 with SMTP id adf61e73a8af0-215abb3b979mr5015723637.19.1746804231149;
        Fri, 09 May 2025 08:23:51 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a108fbsm1848319b3a.115.2025.05.09.08.23.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:23:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 00/17] Patch review
Date: Fri,  9 May 2025 08:23:16 -0700
Message-ID: <cover.1746804035.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216208

Please review this set of changes for walnascar and have comments back by
end of day Tuesday, May 13

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1556

The following changes since commit 6ec2c52b938302b894f119f701ffcf0a847eee85:

  systemd: always depend on the explicit serial console units (2025-04-23 19:47:34 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Changqing Li (6):
  libsoup-2.4: fix CVE-2025-32911
  patch.py: set commituser and commitemail for addNote
  initscripts: add function
    log_success_msg/log_failure_msg/log_warning_msg
  buildtools-tarball: move setting of envvars to respective envfile
  buildtools-tarball: add envvars into BB_ENV_PASSTHROUGH_ADDITIONS
  buildtools-tarball: Make buildtools respects host CA certificates

Guðni Már Gilbert (1):
  bluez5: add missing tools to noinst-tools package

Haixiao Yan (1):
  glibc: Add single-threaded fast path to rand()

Hongxu Jia (2):
  cdrtools-native: fix booting EFI ISO live failed
  syslinux: improve isohybrid to process extra sector count for ISO 9660
    image

Jiaying Song (1):
  gobject-introspection: Fix wrong PN used in MULTILIB_SCRIPTS

Khem Raj (1):
  webkitgtk: Use WTF_CPU_UNKNOWN when building for riscv64

Madhu Marri (1):
  qemu 8.2.7: ignore CVE-2023-1386

Peter Kjellerstedt (2):
  insane.bbclass: Move test for invalid PACKAGECONFIGs to do_recipe_qa
  insane.bbclass: Report all invalid PACKAGECONFIGs for a recipe at once

Praveen Kumar (1):
  connman :fix CVE-2025-32743

Priyal Doshi (1):
  tzdata/tzcode-native: upgrade 2025a -> 2025b

 meta/classes-global/insane.bbclass            |  20 ++--
 meta/lib/oe/patch.py                          |  14 ++-
 .../bluez5/bluez5_5.79.bb                     |   8 +-
 .../connman/connman/CVE-2025-32743.patch      |  48 ++++++++
 .../connman/connman_1.43.bb                   |   1 +
 .../openssl/files/environment.d-openssl.sh    |  24 +++-
 ...dd-single-threaded-fast-path-to-rand.patch |  47 ++++++++
 meta/recipes-core/glibc/glibc_2.41.bb         |   1 +
 .../initscripts/initscripts-1.0/functions     |  21 ++++
 .../initscripts/initscripts_1.0.bb            |   1 -
 meta/recipes-core/meta/buildtools-tarball.bb  |  29 +++--
 .../cdrtools/cdrtools-native_3.01.bb          |   1 +
 ...ix-nsectors-exceeds-0xffff-situation.patch |  69 ++++++++++++
 .../git/git/environment.d-git.sh              |  19 ++++
 meta/recipes-devtools/git/git_2.49.0.bb       |   9 ++
 .../environment.d-python3-requests.sh         |  11 ++
 .../python/python3-requests_2.32.3.bb         |  11 ++
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 ...-count-from-section-entry-for-EFI-ca.patch | 104 ++++++++++++++++++
 .../syslinux/syslinux_6.04-pre2.bb            |   1 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../gobject-introspection_1.84.0.bb           |   2 +-
 .../webkit/webkitgtk/fix-ftbfs-riscv64.patch  |  38 +++++++
 meta/recipes-sato/webkit/webkitgtk_2.48.0.bb  |   1 +
 .../curl/curl/environment.d-curl.sh           |  19 ++++
 meta/recipes-support/curl/curl_8.12.1.bb      |   9 ++
 .../libsoup-2.4/0001-CVE-2025-32911.patch     |  74 +++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   3 +-
 28 files changed, 560 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-path-to-rand.patch
 create mode 100644 meta/recipes-devtools/cdrtools/cdrtools/0001-fix-nsectors-exceeds-0xffff-situation.patch
 create mode 100644 meta/recipes-devtools/git/git/environment.d-git.sh
 create mode 100644 meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0001-Add-extra-sector-count-from-section-entry-for-EFI-ca.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
 create mode 100644 meta/recipes-support/curl/curl/environment.d-curl.sh
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch

-- 
2.43.0


