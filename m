Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F76AC54F51
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:18:05 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2714.1785277079265216564
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QdoCUXu/;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4720f3bf164so988895f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277077; x=1785881877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gNxGFxVQv/Sorox5QR0uJtOAZDtRNy3hn4TiEfYza0E=;
        b=QdoCUXu/hsPHzRh4ETTAou/LwOE0ss7PDfLVL3P3/RMzDlrKgRWidzdCPhMenLa3av
         wMrufHcC7pScmDsIBzsjooq6WtyP80iYYL+fzGRA6Sg5Dk9wezZg2LYPVSl7ywxUfICQ
         VRkH+Z+a7NGfw3NgmovBAfsRGXM8IT6IJgO9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277077; x=1785881877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNxGFxVQv/Sorox5QR0uJtOAZDtRNy3hn4TiEfYza0E=;
        b=GZDkxhiMqVTy8SMA23haQBxR1ZsE8OMwtIkZ+Dhk0gKKrinvlaJtbmHcNGRn37q04O
         0UvqYVm5xnszUD/DkBWeFMLsmA3fG1H0tNH15E7zxu22FqXe7gJ8On4ZN/+tvTy7BrZB
         YUC/PJxwlBzlnvce446pEorK0XPClOurB8/ljESP6Wsq2mapH5KNxWoGpX/it6EYj3mb
         tL6UngnrErz3b/xDvBjbG96P3ewuWqposKAkMm3penz+XsYLsJn+h8x12bpf0/GaathY
         m4UUmZtf1+cwXdZDtqTGkO+fh8o/VA5HMLmWyFSqVJ/jOvEhVAayhV+9+jUGrwZecMd8
         gT+Q==
X-Gm-Message-State: AOJu0Ywzf25KumvwZGNYfOmHOpyZa5MWm9O/KEViy8mmOYu8FKpp1sNV
	h3s5QyVqJ3WqnIcxEPAyQwk7jPo4P9maO8POF+rtoekpi8rbLm9BE300/xlfin2n9QebkMZ07qj
	7hmMdNkA=
X-Gm-Gg: AR+sD10wsTClk9lMYgoHleatbCbQ8rCXdsWalEU0e+6NCWsjMCetZ+eXAMAna/uwtYg
	vbvv16J+CLikJSMJr9VhPRMm18p5A5dwsAL+fL6maLTDzONmeKNdrAMKdKXZQ9OoN14QD8QTTJY
	4WMbORIjKg2xjPyya61M4Wt4HhaIuv+nmoWvBFGQt6pB6bT9n+xcyqAaKzDRmdNLVD79f0uGHPo
	zlzMCs4tKqj+3Smcng9vbwzxRSeVCG/TZYoppzp/5LVxaLKliIbF/RHUg4+b1BI3/KgSlx759/f
	xxddxB6JZRo6JYLCWmZVwVtPDbxmJh9LyC9zfnWNzYBG3Ayadp0/GYgsQUUAWCU+koXRP1ZXbio
	SvfogmBjYDkb7JUJkOrPyDfpwZL7C0jSo3uVOp14TLN0NOPxlsS7UbB111LiWtX9o6JTMsmn5U7
	MjmgJIrGhFxhzRoKm9WZTyvc6K4U9DP2UljCGXtLKpxbEIzfNU7ZrnCrrHWDOyz4FFXSQAqYyWq
	ryeifVG/R0kVr1U
X-Received: by 2002:a05:6000:310a:b0:47f:95cf:26a3 with SMTP id ffacd0b85a97d-47fb1ecc19bmr5037876f8f.14.1785277077364;
        Tue, 28 Jul 2026 15:17:57 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6abd0a6sm1946743f8f.10.2026.07.28.15.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:17:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/31] Pull request (cover letter only)
Date: Wed, 29 Jul 2026 00:17:44 +0200
Message-ID: <cover.1785276897.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 22:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242202

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1785054429.git.yoann.congal@smile.fr/
No review, no change

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4287

The following changes since commit 3217490cc554069ae53aa54cf8ad7327ce85fa10:

  glibc-testsuite: Do not generate SPDX (2026-07-21 20:32:51 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to 762321beb0260b1411c7f98f13458ec99a118280:

  bzip2: fix 'bzip2 --version > /tmp/aaa 2>&1' hang (2026-07-25 23:57:45 +0200)

----------------------------------------------------------------

Bruce Ashfield (2):
  linux-yocto/6.6: update to v6.6.143
  linux-yocto/6.6: update to v6.6.144

Darsh Kelaiya (1):
  gzip: Fix CVE-2026-41991

Deepak Rathore (13):
  cups: fix CVE-2026-27447
  cups: fix CVE-2026-41079
  cups: fix CVE-2026-34978
  cups: fix CVE-2026-34980
  cups: fix CVE-2026-34979
  cups: fix CVE-2026-34990
  cups: fix CVE-2026-39314
  cups: fix CVE-2026-39316
  glib-2.0: fix CVE-2026-58010
  glib-2.0: fix CVE-2026-58011
  glib-2.0: fix CVE-2026-58012
  glib-2.0: fix CVE-2026-58013
  glib-2.0: fix CVE-2026-58014

Devansh Patel (8):
  libxml2: Fix CVE-2026-11979
  openssh: Fix CVE-2026-59999
  openssh: Fix CVE-2026-59997
  openssh: Fix CVE-2026-59996
  openssh: Fix CVE-2026-59995
  openssh: Fix CVE-2026-60001
  openssh: Fix CVE-2026-60002
  openssh: Fix CVE-2026-60000

Enoch Ng (1):
  libxpm: fix CVE-2026-4367

Hongxu Jia (1):
  bzip2: fix 'bzip2 --version > /tmp/aaa 2>&1' hang

Sudhir Dumbhare (3):
  gnutls: set status for CVE-2026-3832
  gnutls: fix CVE-2026-42009
  libpng: Fix CVE-2026-34757

Yoann Congal (2):
  scripts/install-buildtools: Update to 5.0.19
  linux-yocto/6.6: update CVE exclusions (6.6.144)

 .../openssh/openssh/CVE-2026-59995.patch      |   42 +
 .../openssh/openssh/CVE-2026-59996.patch      |   37 +
 .../openssh/openssh/CVE-2026-59997.patch      |   58 +
 .../openssh/openssh/CVE-2026-59999.patch      |   36 +
 .../openssh/openssh/CVE-2026-60000.patch      |  140 ++
 .../openssh/openssh/CVE-2026-60001.patch      |  130 ++
 .../openssh/openssh/CVE-2026-60002.patch      |  226 +++
 .../openssh/openssh_9.6p1.bb                  |    7 +
 .../glib-2.0/glib-2.0/CVE-2026-58010.patch    |  113 ++
 .../glib-2.0/glib-2.0/CVE-2026-58011.patch    |   78 ++
 .../glib-2.0/glib-2.0/CVE-2026-58012.patch    |  228 ++++
 .../glib-2.0/glib-2.0/CVE-2026-58013.patch    |  140 ++
 .../glib-2.0/glib-2.0/CVE-2026-58014.patch    |  106 ++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |    5 +
 .../libxml/libxml2/CVE-2026-11979.patch       |   70 +
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |    1 +
 ...-fix-bzip2-version-tmp-aaa-will-hang.patch |   65 +
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |    1 +
 meta/recipes-extended/cups/cups.inc           |   12 +
 .../cups/CVE-2026-27447-regression_p1.patch   |   33 +
 .../cups/CVE-2026-27447-regression_p2.patch   |   46 +
 .../cups/cups/CVE-2026-27447.patch            |  108 ++
 .../cups/cups/CVE-2026-34978.patch            |  107 ++
 .../cups/cups/CVE-2026-34979.patch            |   61 +
 .../cups/CVE-2026-34980-regression_p1.patch   |   31 +
 .../cups/CVE-2026-34980-regression_p2.patch   |   75 +
 .../cups/cups/CVE-2026-34980.patch            |   85 ++
 .../cups/cups/CVE-2026-34990.patch            |  351 +++++
 .../cups/cups/CVE-2026-39314.patch            |   45 +
 .../cups/cups/CVE-2026-39316.patch            |   40 +
 .../cups/cups/CVE-2026-41079.patch            |   71 +
 .../gzip/gzip-1.13/CVE-2026-41991.patch       |   75 +
 meta/recipes-extended/gzip/gzip_1.13.bb       |    1 +
 ...67-Out-of-bounds-read-in-xpmNextWord.patch |  140 ++
 .../xorg-lib/libxpm_3.5.17.bb                 |    1 +
 .../linux/cve-exclusion_6.6.inc               | 1216 ++++++++++++++---
 .../linux/linux-yocto-rt_6.6.bb               |    6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |    6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |   28 +-
 .../libpng/files/CVE-2026-34757_p1.patch      |  521 +++++++
 .../libpng/files/CVE-2026-34757_p2.patch      |  484 +++++++
 .../libpng/libpng_1.6.42.bb                   |    4 +-
 .../gnutls/gnutls/CVE-2026-42009_p1.patch     |   66 +
 .../gnutls/gnutls/CVE-2026-42009_p2.patch     |   47 +
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |    4 +
 scripts/install-buildtools                    |    4 +-
 46 files changed, 4964 insertions(+), 187 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59995.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59996.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59997.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59999.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60000.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60001.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60002.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58010.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58011.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58012.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58013.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58014.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
 create mode 100644 meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp-aaa-will-hang.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p1.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p2.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34978.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34979.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p1.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34980.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34990.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-39314.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-39316.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-41079.patch
 create mode 100644 meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41991.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxpm/0001-Fix-CVE-2026-4367-Out-of-bounds-read-in-xpmNextWord.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-34757_p1.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-34757_p2.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch


