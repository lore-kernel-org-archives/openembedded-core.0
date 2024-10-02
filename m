Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B18CF31BA
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 13:13:04 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.6936.1727874783122127963
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 06:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=e6xFy+NI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so550736b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 06:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727874782; x=1728479582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mjndNIj9767O0ynDVaRk4K+y/43AXYdF2ixFVMCG6W4=;
        b=e6xFy+NIXgvADJacTvRiBlPuGDkIRqiA+YEcoPJw9vE8sIXP23lWihXuinMm+J57ez
         6SW6k2dJ1eCSOQ4gP9b4CXPjGGYtxvBLk2DqD+d7E7KW8tdlA758XjJ5KHFM1GuOq8FB
         yeeqfqkVG7yKJi8lTKNoZY0gf1s+F7WBk0BkhwKHPV8CaWZmyYp3zoeYicdN9I4e519Z
         DXmmSbxaXqI1SuPRXzZXooI1KqCCXWAfgxacO1KC3+E+m+YnHZiW9sBvuotKccScnbq9
         4XdeqT60L5eIm6Sr84F+hWAo8tH/ezvhYqe0XjuUAoJt9Un4VrOq1cP3bWgr4XOVglgc
         ucGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874782; x=1728479582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mjndNIj9767O0ynDVaRk4K+y/43AXYdF2ixFVMCG6W4=;
        b=OTX2MxMwiBNqlclq+yFJ98nkiDqhPDaDxOUpFfbp6s+NQSxRbLw0iSE2z9W/62kZxz
         WNDvM9w+6POD6R+z1tjd1CmupPBTGpKcbsLHyoNeaZDwS6EqULctz0kmNoQ6ePEnaV0h
         Rj6v+Vpx4gMh2OnqWGJQgcSTDZiIz8oD4Ah0C1moh+Rk5wF/jAxpyqp3utMRKLBhdGQQ
         wz14HeWvhMfkjwia2CpLzH+B+46Ia3Kf+2wyS9Jvi06OI7t1I2eyLgSazY07RYiNg7Fg
         Aa+IoyPjfTiay/VUtThVcn3SJ7/HHNPq0pwwTJ9d9DkSRdvHUlos/7ChADx3UzBBUNwy
         wyNw==
X-Gm-Message-State: AOJu0YwUaGFkuQ7uaWyf/g8vza7YriDkrWp3yHicp0IiDeVjxOT7Nzjf
	+cC6L5BvemY9HbwZnWu2bT47sfwM2uRgh8PpB9V+EG6REZAgsgRtrA6z8+NMsUTd6nRfMMcqEHE
	PuOw=
X-Google-Smtp-Source: AGHT+IEpTD5BpLkgAu/hPcaXPpCJ2l9JXabB2j6lMOoQ/JOb+/h5Rgxjda0JFqNR+CX8rIPprNPB0A==
X-Received: by 2002:a05:6a20:6f03:b0:1d5:1250:44b4 with SMTP id adf61e73a8af0-1d63772ee42mr4615843637.24.1727874782157;
        Wed, 02 Oct 2024 06:13:02 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649c775sm9773436b3a.29.2024.10.02.06.13.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:13:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/16] Patch review
Date: Wed,  2 Oct 2024 06:12:40 -0700
Message-Id: <cover.1727874367.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 13:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205184

Please review this set of changes for kirkstone and have comments back by
end of day Friday, October 4

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7370

The following changes since commit ff720f337e40761c7d4d544c963cf518ad5403ad:

  lib/oeqa: rename assertRaisesRegexp to assertRaisesRegex (2024-09-21 06:18:58 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Aleksandar Nikolic (3):
  install-buildtools: remove md5 checksum validation
  install-buildtools: fix "test installation" step
  scripts/install-buildtools: Update to 4.0.21

Deepthi Hemraj (3):
  gcc: upgrade to v11.5
  glibc: stable 2.35 branch updates
  bintuils: stable 2.38 branch update

Jinfeng Wang (1):
  procps: patch CVE-2023-4016

Martin Jansa (1):
  populate_sdk_base: inherit nopackages

Mingli Yu (1):
  curl: free old conn better on reuse

Paul Eggleton (1):
  install-buildtools: support buildtools-make-tarball and update to 4.1

Peter Marko (4):
  gnupg: Document CVE-2022-3219 and mark wontfix
  wpa-supplicant: Ignore CVE-2024-5290
  wpa-supplicant: Patch CVE-2024-3596
  wpa-supplicant: Patch security advisory 2024-2

Purushottam Choudhary (1):
  kmscube: Add patch to fix -int-conversion build error

Vijay Anusuri (1):
  curl: backport Debian patch for CVE-2024-8096

 meta/classes/populate_sdk_base.bbclass        |    2 +-
 meta/conf/distro/include/maintainers.inc      |    2 +-
 ...valid-Rejected-Groups-element-length.patch |   52 +
 ...valid-Rejected-Groups-element-length.patch |   50 +
 ...id-Rejected-Groups-element-in-the-pa.patch |   38 +
 .../wpa-supplicant/CVE-2024-3596_00.patch     |   82 +
 .../wpa-supplicant/CVE-2024-3596_01.patch     |  165 +
 .../wpa-supplicant/CVE-2024-3596_02.patch     |   62 +
 .../wpa-supplicant/CVE-2024-3596_03.patch     |   37 +
 .../wpa-supplicant/CVE-2024-3596_04.patch     |   52 +
 .../wpa-supplicant/CVE-2024-3596_05.patch     |   51 +
 .../wpa-supplicant/CVE-2024-3596_06.patch     |   46 +
 .../wpa-supplicant/CVE-2024-3596_07.patch     |   67 +
 .../wpa-supplicant/CVE-2024-3596_08.patch     |   47 +
 .../wpa-supplicant/wpa-supplicant_2.10.bb     |   15 +
 meta/recipes-core/glibc/glibc-version.inc     |    2 +-
 .../binutils/binutils-2.38.inc                |    2 +-
 .../gcc/{gcc-11.4.inc => gcc-11.5.inc}        |    8 +-
 ...ian_11.4.bb => gcc-cross-canadian_11.5.bb} |    0
 .../{gcc-cross_11.4.bb => gcc-cross_11.5.bb}  |    0
 ...-crosssdk_11.4.bb => gcc-crosssdk_11.5.bb} |    0
 ...cc-runtime_11.4.bb => gcc-runtime_11.5.bb} |    0
 ...itizers_11.4.bb => gcc-sanitizers_11.5.bb} |    0
 ...{gcc-source_11.4.bb => gcc-source_11.5.bb} |    0
 ...rch64-Update-Neoverse-N2-core-defini.patch |   38 -
 .../gcc/gcc/CVE-2023-4039.patch               | 2893 -----------------
 .../gcc/{gcc_11.4.bb => gcc_11.5.bb}          |    0
 ...initial_11.4.bb => libgcc-initial_11.5.bb} |    0
 .../gcc/{libgcc_11.4.bb => libgcc_11.5.bb}    |    0
 ...ibgfortran_11.4.bb => libgfortran_11.5.bb} |    0
 .../procps/procps/CVE-2023-4016-2.patch       |   60 +
 meta/recipes-extended/procps/procps_3.3.17.bb |    3 +-
 ...001-common-fix-cast-type-in-init_egl.patch |   34 +
 meta/recipes-graphics/kmscube/kmscube_git.bb  |    6 +-
 ...01-url-free-old-conn-better-on-reuse.patch |   95 +
 .../curl/curl/CVE-2024-8096.patch             |  210 ++
 meta/recipes-support/curl/curl_7.82.0.bb      |    2 +
 meta/recipes-support/gnupg/gnupg_2.3.7.bb     |    2 +
 scripts/install-buildtools                    |   63 +-
 39 files changed, 1219 insertions(+), 2967 deletions(-)
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
 rename meta/recipes-devtools/gcc/{gcc-11.4.inc => gcc-11.5.inc} (95%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_11.4.bb => gcc-cross-canadian_11.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_11.4.bb => gcc-cross_11.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_11.4.bb => gcc-crosssdk_11.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_11.4.bb => gcc-runtime_11.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_11.4.bb => gcc-sanitizers_11.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_11.4.bb => gcc-source_11.5.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-defini.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/CVE-2023-4039.patch
 rename meta/recipes-devtools/gcc/{gcc_11.4.bb => gcc_11.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_11.4.bb => libgcc-initial_11.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_11.4.bb => libgcc_11.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_11.4.bb => libgfortran_11.5.bb} (100%)
 create mode 100644 meta/recipes-extended/procps/procps/CVE-2023-4016-2.patch
 create mode 100644 meta/recipes-graphics/kmscube/kmscube/0001-common-fix-cast-type-in-init_egl.patch
 create mode 100644 meta/recipes-support/curl/curl/0001-url-free-old-conn-better-on-reuse.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-8096.patch

-- 
2.34.1


