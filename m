Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FACBC61DFD
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:26:27 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5529.1788326781586673621
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1Bj9hK2a;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso5894045e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326780; x=1788931580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+/ZOvSFJD56lVlI9b/OZrq05yETQ+rsCWYOHn6pBvM=;
        b=1Bj9hK2aVbSTALC/F3fCqnx5miH1giGqWchRwp8mc71w2Ntpu0rIDPuPSA+llbQw2w
         sRcTXJc+UATZq/J/55gUA8lpiyipLhZQcyECHScVMO+U2qMqw9mbKNHTNIjKNdAzlEy4
         Cb7ImfY+AVgcgwl2jbMjfaRlJsGHb7NUd6uDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326780; x=1788931580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3+/ZOvSFJD56lVlI9b/OZrq05yETQ+rsCWYOHn6pBvM=;
        b=I8w0ibNyZprvhce9dEoKHEYxp44tMNurpqRHWJlxO6hkMz3VjNMIN8KNxgUxrmaCyB
         /pGv6pyir0ANQcTn+IxfLOLQAIf2/3PTGGrbj9O5lTf95soC9MTZ18+jqmoY4xU9Pmc1
         Y6rqDmlv6yCoEbE5CPQxTGsYRBuKetFhTrXlLxhs3UuIHEMKvXYzbwssdWde/wpggHuT
         HlcLtSfS/t2q1tkC2ALFWMyTmNUc+kApB9K7gT6cJ3wxp5zb6h/gsgUXpWDawNXPXUKq
         r5OwXSt4X+6EREICe5Px1mhZx1783/00nxI20kv5wAjmkp2lHxY9VHfgOV5lvDsbUPwG
         bYUA==
X-Gm-Message-State: AFuF++mv5eaC+zOu1NHaRE3oXMxBwEBy7FE5o5+/fapk4jZZTurFZeCI
	g7+EaLRGLmLF33AY3QQxM0GYASyzNhMxOrGq59P5hhiB8iqwuVECg1AK3gbQjXXJIyFOgZopE1W
	OGGfcL7Q=
X-Gm-Gg: AR+sD11txq5NJ9RCiawBV2X4J6NfnwQJYJY3DPM6b5WK+UivgTt9ei0KG2DQRGpvzSZ
	aJgkrgZLMuOnaulno9UjL8CyHtxs1PfaJSp/F4eyJZiUzThs3S5XNZs3flpLCEEYmEPucA2ylb1
	PBGlyHxO4e8Ar0F4BdEWaRZCjyzNcUPacxORQzbs28uXfpLrBp6CFweWbV+aKO9dswqWx3DrZoo
	AW88a+xddp+jTdqh5EXjBym3vG2Mjah289IZGgP4SUF+m5eCVIwIIsJrF5hV2D2Pn9fB/0SHMzn
	unhhrEGR/Q8cnnDeCLNl7UsEPIxYTzlWZ+f+SVy5II7hg0fgtz5CfXXlpIJaoxh2NTcY3jC6Xp5
	/Ed1FLexBFigKj4s31siLFuS7Zqxlx7dzk71c9v0W/rTVejagdbkInhwIuG3R4yuf1wuEISmCsa
	+Y9J4DEZVGY7DMZWch56SaaUiuFFSoR4bvjbMfG1jNaTvtPmug3dRDt5deAqDEeAwVRdlCXrDBg
	AUqDNdHocgz3YOXEA==
X-Received: by 2002:a05:600c:83c8:b0:49c:d52e:d0ea with SMTP id 5b1f17b1804b1-49ce581779dmr41241895e9.4.1788326779524;
        Tue, 01 Sep 2026 22:26:19 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.26.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:26:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/27] Patch review
Date: Wed,  2 Sep 2026 07:25:17 +0200
Message-ID: <cover.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244851

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, September 3.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4636

The following changes since commit 310eec2cb646d7d1a3ca99bad7e37495bb418a0d:

  build-appliance-image: Update to scarthgap head revision (2026-08-28 09:52:39 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

for you to fetch changes up to 1b1e13055b4eed838e1411d91dea46de08e1d72f:

  patch: Fix CVE-2026-56288 (2026-09-01 17:07:13 +0200)

----------------------------------------------------------------

Emily Vekariya (2):
  python3-pyasn1: Fix CVE-2026-59886
  python3-pyasn1: Fix CVE-2026-59884

Hemanth Kumar M D (1):
  glibc: fix CVE-2026-5435

Hetvi Thakar (5):
  wget: Fix CVE-2026-58469
  wget: Fix CVE-2026-58471
  wget: Fix CVE-2026-58472
  patch: Fix CVE-2026-56289
  patch: Fix CVE-2026-56288

Jaipaul Cheernam (4):
  systemd: Fix CVE-2026-29111
  perl: fix CVE-2026-13221
  perl: fix CVE-2026-57432
  perl: fix CVE-2025-40909

Martin Jansa (1):
  socat: fix native build on host with newer glibc

Peter Marko (5):
  python3: upgrade 3.12.13 -> 3.12.14
  systemd: upgrade 255.21 -> 255.22
  libarchive: handle CVE-2026-5121
  libarchive: patch CVE-2026-5745
  gnutls: set status for CVE-2026-1584

Siddharth Doshi (9):
  vim: Security Fix for CVE-2026-55693
  vim: Security Fix for CVE-2026-55892
  vim: Security Fix for CVE-2026-55895
  vim: Security Fix for CVE-2026-57452
  vim: Security Fix for CVE-2026-57455
  vim: Security Fix for CVE-2026-59856
  vim: Security Fix for CVE-2026-59857
  vim: Security Fix for CVE-2026-59858
  vim: Security Fix for CVE-2026-57456

 ...ixed-strchr-with-const-for-new-glibc.patch |   38 +
 .../socat/socat_1.8.0.0.bb                    |    1 +
 .../glibc/glibc/0024-CVE-2026-5435.patch      |  137 ++
 meta/recipes-core/glibc/glibc_2.39.bb         |    1 +
 ...55.21.bb => systemd-boot-native_255.22.bb} |    0
 ...-boot_255.21.bb => systemd-boot_255.22.bb} |    0
 meta/recipes-core/systemd/systemd.inc         |    2 +-
 .../systemd/systemd/CVE-2026-29111-01.patch   |  170 +++
 .../systemd/systemd/CVE-2026-29111-02.patch   |   85 ++
 .../systemd/systemd/CVE-2026-29111-03.patch   |  106 ++
 .../systemd/systemd/CVE-2026-29111-04.patch   |   35 +
 .../{systemd_255.21.bb => systemd_255.22.bb}  |    4 +
 .../patch/patch/CVE-2026-56288.patch          |   75 +
 .../patch/patch/CVE-2026-56289.patch          |   36 +
 meta/recipes-devtools/patch/patch_2.7.6.bb    |    2 +
 .../perl-cross/files/CVE-2025-40909-dep.patch |   25 +
 .../perl-cross/perlcross_1.6.2.bb             |    1 +
 .../perl/files/CVE-2025-40909.patch           |  412 ++++++
 .../perl/files/CVE-2026-13221.patch           |   75 +
 .../perl/files/CVE-2026-57432-01.patch        |   52 +
 .../perl/files/CVE-2026-57432-02.patch        |   34 +
 meta/recipes-devtools/perl/perl_5.38.4.bb     |    4 +
 .../recipes-devtools/python/python-pyasn1.inc |    2 +
 .../python3-pyasn1/CVE-2026-59884.patch       |  245 ++++
 .../python3-pyasn1/CVE-2026-59886.patch       |  252 ++++
 ...shebang-overflow-on-python-config.py.patch |    2 +-
 ...-qemu-wrapper-when-gathering-profile.patch |    2 +-
 ...e-treat-overflow-in-UID-GID-as-failu.patch |    2 +-
 .../python/python3/CVE-2025-13462.patch       |  142 --
 .../python/python3/CVE-2026-11940.patch       |   66 -
 .../python/python3/CVE-2026-11972.patch       |   60 -
 .../python/python3/CVE-2026-1502.patch        |  113 --
 .../python3/CVE-2026-3644_CVE-2026-0672.patch |  154 --
 .../python/python3/CVE-2026-4224.patch        |  121 --
 .../python3/CVE-2026-4519_CVE-2026-4786.patch |   66 -
 .../python/python3/CVE-2026-4519_p1.patch     |  107 --
 .../python/python3/CVE-2026-4519_p2.patch     |  159 ---
 .../python/python3/CVE-2026-6100.patch        |   75 -
 .../python/python3/CVE-2026-7210.patch        |  148 --
 .../python/python3/CVE-2026-9669.patch        |   96 --
 .../python/python3/makerace.patch             |    2 +-
 ...{python3_3.12.13.bb => python3_3.12.14.bb} |   24 +-
 ...atch => CVE-2026-4426_CVE-2026-5121.patch} |    1 +
 .../libarchive/CVE-2026-5121-02.patch         | 1270 +++++++++++++++++
 .../libarchive/libarchive/CVE-2026-5745.patch |   39 +
 .../libarchive/libarchive_3.7.9.bb            |    4 +-
 .../wget/CVE-2026-58469-regression_p1.patch   |   39 +
 .../wget/CVE-2026-58469-regression_p2.patch   |   26 +
 .../wget/wget/CVE-2026-58469.patch            |   53 +
 .../wget/wget/CVE-2026-58471.patch            |   71 +
 .../wget/wget/CVE-2026-58472-regression.patch |  236 +++
 .../wget/wget/CVE-2026-58472.patch            |   77 +
 meta/recipes-extended/wget/wget_1.21.4.bb     |    6 +
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |    1 +
 .../vim/files/CVE-2026-55693.patch            |   88 ++
 .../vim/files/CVE-2026-55892.patch            |   81 ++
 .../vim/files/CVE-2026-55895.patch            |   53 +
 .../vim/files/CVE-2026-57452.patch            |   76 +
 .../vim/files/CVE-2026-57455.patch            |   72 +
 .../vim/files/CVE-2026-57456.patch            |   90 ++
 .../vim/files/CVE-2026-59856.patch            |  103 ++
 .../vim/files/CVE-2026-59857.patch            |  110 ++
 .../vim/files/CVE-2026-59858.patch            |  134 ++
 meta/recipes-support/vim/vim.inc              |    9 +
 64 files changed, 4444 insertions(+), 1328 deletions(-)
 create mode 100644 meta/recipes-connectivity/socat/files/0001-Fixed-strchr-with-const-for-new-glibc.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2026-5435.patch
 rename meta/recipes-core/systemd/{systemd-boot-native_255.21.bb => systemd-boot-native_255.22.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_255.21.bb => systemd-boot_255.22.bb} (100%)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-01.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-02.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-03.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-29111-04.patch
 rename meta/recipes-core/systemd/{systemd_255.21.bb => systemd_255.22.bb} (99%)
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2026-56288.patch
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2026-56289.patch
 create mode 100644 meta/recipes-devtools/perl-cross/files/CVE-2025-40909-dep.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2025-40909.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-13221.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-01.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-02.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59884.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyasn1/CVE-2026-59886.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13462.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11940.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11972.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-1502.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-3644_CVE-2026-0672.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4224.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4519_CVE-2026-4786.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4519_p1.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4519_p2.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-6100.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2026-9669.patch
 rename meta/recipes-devtools/python/{python3_3.12.13.bb => python3_3.12.14.bb} (96%)
 rename meta/recipes-extended/libarchive/libarchive/{CVE-2026-4426.patch => CVE-2026-4426_CVE-2026-5121.patch} (99%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-5121-02.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-5745.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p1.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469-regression_p2.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58471.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58472.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55693.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55892.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55895.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57452.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57455.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57456.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59856.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59857.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-59858.patch


