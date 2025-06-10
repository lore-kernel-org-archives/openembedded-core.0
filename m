Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3629C677C4
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:38:29 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.96519.1749584306405532959
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=F5b0lRWl;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b1fd59851baso3401418a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584305; x=1750189105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tTBE1nuP7K3phMn+3uO5FDkxU4wKkrDEL9BeYUllfeM=;
        b=F5b0lRWlzzfOV86B0pQbunbB4HDoeIcT0y4h17cYr4WBvVfFpNoMD+0McB7+zc8WCt
         3OSAj8Tm8nFHOOZMcKH3YKMV1M2Zl97KORfvqEQuQGaWH31LdQExPdjiv/5j6KN40r5m
         hXPX6TWMBoWmQmnSzFUU9CBaY9+PWXYuLNHs73YQ4seFduuPilX1LccscuEH3L5ryoJ0
         AnXsYf7sB7iMYJPfGqWKBxCKXtGPGrCn/DKfL91VSOo56ITkJ6rycskN3cwFGsdRMuq3
         VZTfSxShRfcMNOCoOz2Gaa18R5u9s2ysxd7XE6IDAaTAtwzZnMl7S83sjgyZh4IJbK5U
         X65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584305; x=1750189105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tTBE1nuP7K3phMn+3uO5FDkxU4wKkrDEL9BeYUllfeM=;
        b=vAKGKcWC2pJqzSF41dnIK5tfpCjT3psSuTjhXbFX6lK45WxLaBqjRdmHrPKtE5I/96
         29idICcZA6fV/cvcKvHaUI1cweQH8FFOTHohl6RzWDzrvbJvCFwb8E4BJ+F1ykStCj8P
         j5NYvGzpUYMgaJ15ryS/vEGpvdgrNNsOMH2lCb7+Hn4D+x77N8tC6qEKardAJ+iw7MmB
         2M30+eej6G5dzJSr7vbb66cdhOSA3dF3Tjw+tFTyyGXaZGQT189pGCz4Dl8jJevvd5Tw
         rRXu8C0c9TI10mEjw2bDJ0sCZOAYfJ8Bk8YNK0L8JmZyQjKLAjN4sbcBKgSXWKAZgm8d
         QKkw==
X-Gm-Message-State: AOJu0Yx/veQUCQxDUMi/DMlY71YOm6i2tJDJB1CRmMWfEE/SAs+GGQLU
	Ep7L5H1s/S3bHiDzHp1jdWgwoGNCuZNUvdlt+5wj12a8pADDa1wen1OfgTOhjPOUoxl7pUKvmpm
	zU8Pp
X-Gm-Gg: ASbGncuc6x1BV9KvbuK37Qxa+UF8lRBUZe+UefJIBAZmbxl8vi0ona7mFNCm5a90QoK
	knWN97dhthKlG9dBVOwRldwNGRH/5G3RSk3HawBz+dMEzO6FK4F6kzi1PeeRSqRdUS52/2mbd52
	pPanVmcorL+xQmUXzbDaFL/WrnqgS6DC/mH3W8ZgNrl9gt+Ps9x7nk2Km1oElBo9Oz4to4N3vVw
	GK1N7e8bKzhsLU7rGIcGATiSWBVcqxs/CRy9fuvuplP0elPfwthykMJB+pg4x8MHVRBjm87aon4
	4fvSvokuwH5BPbFtqBXEOG0VXIJLD/n6pMdoFAH8Cse3xjTFyi75L5vaDYg1M4TB
X-Google-Smtp-Source: AGHT+IH3iXvp+lHxSIqm0zS5hoM6ELL8XyPZdjRuljR9OXryZLt1R6QMwj98AzZc7bT1J3ciixZ6Tg==
X-Received: by 2002:a05:6a21:b92:b0:1f5:8dea:bb93 with SMTP id adf61e73a8af0-21f88fca4a9mr48018637.7.1749584305411;
        Tue, 10 Jun 2025 12:38:25 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f7827c0sm7198595a12.62.2025.06.10.12.38.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:38:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/15] Patch review
Date: Tue, 10 Jun 2025 12:38:06 -0700
Message-ID: <cover.1749584149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218422

Please review this set of hcanges for kirkstone and have comments back by
end of day Thursday, June 12

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1770

The following changes since commit 415e73d53e5342f3f6ff6acd521ded2df3fbca1f:

  nfs-utils: don't use signals to shut down nfs server. (2025-05-29 08:22:59 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (4):
  ghostscript: fix CVE-2025-48708
  ffmpeg: upgrade 5.0.1 -> 5.0.3
  ffmpeg: fix CVE-2025-22919
  ffmpeg: fix CVE-2025-22921

Deepesh Varatharajan (1):
  binutils: Fix CVE-2025-5244 & CVE-2025-5245

Divya Chellam (2):
  screen: fix CVE-2025-46802
  screen: fix CVE-2025-46804

Harish Sadineni (1):
  binutils: add CVE-2025-1182 patch file to SRC_URI

Hitendra Prajapati (1):
  icu: fix CVE-2025-5222

Jiaying Song (1):
  taglib: fix CVE-2023-47466

Martin Jansa (1):
  kernel.bbclass: add original package name to RPROVIDES for -image and
    -base

Peter Marko (1):
  python3: upgrade 3.10.16 -> 3.10.18

Vijay Anusuri (3):
  libsoup-2.4: Backport auth tests for CVE-2025-32910
  python3-setuptools: Fix CVE-2025-47273
  git: Fix CVE-2024-50349 and CVE-2024-52006

 meta/classes/kernel.bbclass                   |   3 +-
 .../binutils/binutils-2.38.inc                |   3 +
 .../binutils/0040-CVE-2025-1182.patch         |  18 +-
 .../binutils/0041-CVE-2025-5244.patch         |  25 ++
 .../binutils/0042-CVE-2025-5245.patch         |  38 +++
 .../git/git/CVE-2024-50349-0001.patch         | 100 ++++++
 .../git/git/CVE-2024-50349-0002.patch         | 321 ++++++++++++++++++
 .../git/git/CVE-2024-52006.patch              | 165 +++++++++
 meta/recipes-devtools/git/git_2.35.7.bb       |   3 +
 .../CVE-2025-47273-pre1.patch                 |  54 +++
 .../python3-setuptools/CVE-2025-47273.patch   |  59 ++++
 .../python/python3-setuptools_59.5.0.bb       |   2 +
 ...ib-termcap-to-linker-flags-to-avoid-.patch |   2 +-
 ...hell-version-of-python-config-that-w.patch |   2 +-
 ...file-do-not-compile-.pyc-in-parallel.patch |   2 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |   6 +-
 ...e-treat-overflow-in-UID-GID-as-failu.patch |   2 +-
 ...asename-to-replace-CC-for-checking-c.patch |  16 +-
 ...detect-multiarch-paths-when-cross-co.patch |   2 +-
 ...orlines-skip-due-to-load-variability.patch |   2 +-
 ...report-missing-dependencies-for-disa.patch |   2 +-
 ...up.py-do-not-add-a-curses-include-pa.patch |   4 +-
 .../python/python3/CVE-2025-0938.patch        | 131 -------
 .../python3/avoid_warning_about_tkinter.patch |   2 +-
 .../python/python3/makerace.patch             |   2 +-
 ...{python3_3.10.16.bb => python3_3.10.18.bb} |   3 +-
 .../ghostscript/CVE-2025-48708.patch          |  46 +++
 .../ghostscript/ghostscript_9.55.0.bb         |   1 +
 .../screen/screen/CVE-2025-46802.patch        | 146 ++++++++
 .../screen/screen/CVE-2025-46804.patch        | 131 +++++++
 meta/recipes-extended/screen/screen_4.9.0.bb  |   2 +
 .../ffmpeg/ffmpeg/CVE-2024-36613.patch        |  18 +-
 .../ffmpeg/ffmpeg/CVE-2025-22919.patch        |  41 +++
 .../ffmpeg/ffmpeg/CVE-2025-22921.patch        |  34 ++
 .../{ffmpeg_5.0.1.bb => ffmpeg_5.0.3.bb}      |   9 +-
 .../icu/icu/CVE-2025-5222.patch               | 164 +++++++++
 meta/recipes-support/icu/icu_70.1.bb          |   1 +
 ...ckport-auth-tests-for-CVE-2025-32910.patch |  76 +++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |   1 +
 .../taglib/files/CVE-2023-47466.patch         |  38 +++
 meta/recipes-support/taglib/taglib_1.12.bb    |   4 +-
 41 files changed, 1500 insertions(+), 181 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0041-CVE-2025-5244.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0042-CVE-2025-5245.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-50349-0001.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-50349-0002.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-52006.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273-pre1.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-0938.patch
 rename meta/recipes-devtools/python/{python3_3.10.16.bb => python3_3.10.18.bb} (99%)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-48708.patch
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2025-46802.patch
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2025-46804.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22921.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_5.0.1.bb => ffmpeg_5.0.3.bb} (96%)
 create mode 100644 meta/recipes-support/icu/icu/CVE-2025-5222.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/Backport-auth-tests-for-CVE-2025-32910.patch
 create mode 100644 meta/recipes-support/taglib/files/CVE-2023-47466.patch

-- 
2.43.0


