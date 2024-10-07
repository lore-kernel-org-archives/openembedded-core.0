Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70B3CFB443
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 01:55:19 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.44005.1728266110935875724
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Oct 2024 18:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dhcevDMq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2e0a5088777so3085391a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Oct 2024 18:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728266110; x=1728870910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zqyz9htqwN/bOAoGHkUF6isLvvXRcgqX34LcG24bBCY=;
        b=dhcevDMqOXq5c2Q+jdv6NVts+feDdONaTVCIy7KIOla92M1Xn/pWWG9mTDS2OzxXTx
         XKLVuFvHimebbLtdELK11EmjmQXFCEts23Owy3EvM6j7LqMqETcT1+s5FwJgUDm9zERX
         96ATQqmHz8bFnY6a0gQKtEGwuaQG10QBTUWFFVRJ7J9gKjRednDD28g93V7Jd/oz7cS3
         PR+j0j8kjsWQRpSZkzRdphROoXx4zO4YEfX/vzCiWFyrltQW2QQIqZsE/H9cz+FD/j8T
         sZ379Xj6sbmdrtIO1hIrX5EtikLzg9ohu4Vxxe9eaCRaHk19RgfeqwhKtn/F6OKPqPs9
         mi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728266110; x=1728870910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zqyz9htqwN/bOAoGHkUF6isLvvXRcgqX34LcG24bBCY=;
        b=i5rLyVFkmpzK2eRTDRjzrC73GTG9VZVtjZynLFO+7ip0gS06f590PCt1rUJbvDrs7w
         NsromxM2cwc316T0GaoKPF3n0mNNDbCROrD2A6fQ3FXGNW8SOgtbrZPhplzNzADC/ioy
         ZA3RbWH+d7drKTj2JEGZ9JTSfd2HY4SIx+xiVLs9Jq3gsbspwAsrHDdPtNpSgDCvnY7N
         Nw8deAYwn61r/kLUeYdQrn5jOHwY7Q1CEP72cwFOT3EWJg38PGR9x0s5uWK1ClWGiEn4
         p657ZMBkxKPv9vr3XgOUdaQPOcTH/PrZVBpTt90c8UQl4qTJQW5BX8Yz4IoR6jyx/YaY
         /z+Q==
X-Gm-Message-State: AOJu0YyJbf57XolEhBxZs+Z4b8H+4Qd3aQrLjhECdXfJMIfYp9xQ3FTB
	7A36m4onvceH1Kb2wPdFeidWyyc7YstKLuvngWQqz79EfLLgogWZZXg11RItYPvLEFDtPCqpuzj
	Jb1U=
X-Google-Smtp-Source: AGHT+IE6PEvyEMdx/RmzxgJ36r3wDO/2ocEvoQg1m/RX0wPFXlcX1b+A/GBm3xofnHovN+wBFgRLUQ==
X-Received: by 2002:a17:90a:3fcf:b0:2dd:6969:2096 with SMTP id 98e67ed59e1d1-2e1e63676dcmr11511635a91.38.1728266109866;
        Sun, 06 Oct 2024 18:55:09 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20aebb70asm4074938a91.19.2024.10.06.18.55.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 18:55:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/10] Patch review
Date: Sun,  6 Oct 2024 18:54:53 -0700
Message-Id: <cover.1728266000.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 01:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205248

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, October 8

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7374

The following changes since commit 3d894863f442188bad446095bd7fdd82665bb54b:

  makedevs: Fix issue when rootdir of / is given (2024-09-28 05:21:51 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Deepesh Varatharajan (1):
  glibc: stable 2.39 branch updates.

Hitendra Prajapati (1):
  webkitgtk: upgrade 2.44.1 -> 2.44.3

Khem Raj (2):
  gnupg: Document CVE-2022-3219 and mark wontfix
  openssh: Mark CVE-2023-51767 as wont-fix

Martin Jansa (2):
  populate_sdk_base: inherit nopackages
  meta-world-pkgdata: Inherit nopackages

Peter Marko (3):
  wpa-supplicant: Ignore CVE-2024-5290
  wpa-supplicant: Patch CVE-2024-3596
  wpa-supplicant: Patch security advisory 2024-2

Wang Mingyu (1):
  cryptodev: upgrade 1.13 -> 1.14

 meta/classes-recipe/populate_sdk_base.bbclass |   2 +-
 .../openssh/openssh_9.6p1.bb                  |   1 +
 ...valid-Rejected-Groups-element-length.patch |  52 ++++++
 ...valid-Rejected-Groups-element-length.patch |  50 ++++++
 ...id-Rejected-Groups-element-in-the-pa.patch |  38 ++++
 .../wpa-supplicant/CVE-2024-3596_00.patch     |  82 +++++++++
 .../wpa-supplicant/CVE-2024-3596_01.patch     | 165 ++++++++++++++++++
 .../wpa-supplicant/CVE-2024-3596_02.patch     |  62 +++++++
 .../wpa-supplicant/CVE-2024-3596_03.patch     |  37 ++++
 .../wpa-supplicant/CVE-2024-3596_04.patch     |  52 ++++++
 .../wpa-supplicant/CVE-2024-3596_05.patch     |  51 ++++++
 .../wpa-supplicant/CVE-2024-3596_06.patch     |  46 +++++
 .../wpa-supplicant/CVE-2024-3596_07.patch     |  67 +++++++
 .../wpa-supplicant/CVE-2024-3596_08.patch     |  47 +++++
 .../wpa-supplicant/wpa-supplicant_2.10.bb     |  14 ++
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 meta/recipes-core/meta/meta-world-pkgdata.bb  |   1 +
 ...-linux_1.13.bb => cryptodev-linux_1.14.bb} |   0
 ...odule_1.13.bb => cryptodev-module_1.14.bb} |   3 -
 ...-tests_1.13.bb => cryptodev-tests_1.14.bb} |   4 -
 meta/recipes-kernel/cryptodev/cryptodev.inc   |   4 +-
 ...ng-header-file-provided-by-another-p.patch |  25 ---
 ...001-tests-Makefile-do-not-use-Werror.patch |  25 ---
 ...able-to-control-macro-__PAS_ALWAYS_I.patch |   6 +-
 ...spection.cmake-prefix-variables-obta.patch |   2 +-
 ...fic-declarations-in-FELighting.h-unn.patch |  44 -----
 ...icDowncast-adoption-in-platform-code.patch |  65 -------
 ...d5e22213fdaca2a29ec3400c927d710a37a8.patch |   2 +-
 .../webkit/webkitgtk/no-musttail-arm.patch    |   6 +-
 .../webkit/webkitgtk/reproducibility.patch    |   2 +-
 .../webkit/webkitgtk/t6-not-declared.patch    |  12 +-
 ...ebkitgtk_2.44.1.bb => webkitgtk_2.44.3.bb} |   6 +-
 meta/recipes-support/gnupg/gnupg_2.4.4.bb     |   1 +
 33 files changed, 786 insertions(+), 190 deletions(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-SAE-Check-for-invalid-Rejected-Groups-element-length.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-SAE-Check-for-invalid-Rejected-Groups-element-length.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_00.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_01.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_02.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_03.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_04.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_05.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_06.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_07.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-3596_08.patch
 rename meta/recipes-kernel/cryptodev/{cryptodev-linux_1.13.bb => cryptodev-linux_1.14.bb} (100%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-module_1.13.bb => cryptodev-module_1.14.bb} (74%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-tests_1.13.bb => cryptodev-tests_1.14.bb} (74%)
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0002-More-dynamicDowncast-adoption-in-platform-code.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.44.1.bb => webkitgtk_2.44.3.bb} (96%)

-- 
2.34.1


