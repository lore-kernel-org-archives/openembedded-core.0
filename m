Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFB4C531CC
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7133.1785054611533831331
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VM8aIvxR;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954aff6088so14424495e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054610; x=1785659410; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMLQRkGiuNjnOyzsneqUuG33m3VCHGDi6yLfXcK/6mI=;
        b=VM8aIvxRyYsCjz0bZ/LpEHdPqJV1aXGrTozb2as70hdXdgM4kvklp282YJTw+ZQIOf
         cKMWgu3GYH3w+P5zZafFCkPUGZCSsNpJGYYj8IYvhl/xZHHD21w0nz8nM2jDLZ9LSvt9
         FEtbA7XLfhJ+EWic7NSWQs+//h+4I1V7DbOLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054610; x=1785659410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HMLQRkGiuNjnOyzsneqUuG33m3VCHGDi6yLfXcK/6mI=;
        b=MnRT928mgNXl+wYJD1ykl5GJMCUE432fGtnmtY97EwI2qGJ8+9TuTe6NVaJKoKWubs
         oBEiw1Y/H6tjB11M9TWyqeg53VwtUmNHIe13mZLXOaFoF7hKUbpCMXf1lT/jGlZHKAvz
         qaHCFWmB5KafNzfURPynJr1wB1neFnxj03Z5+nU4ZgdsBUXPCQ2c/+MVnPOZjMS+FUAS
         rHrVOomn28B6ROXrUbhHRkRY8kFz8yjxWJFtBxqNtzzHmm2W9tG7sDLgaGrDcQVpiNwu
         LS4QGECftEuNmvvYZGppgtWsu+feSErp+/68dWcw5QVuvvKs9VjuV4+VAqNOzex2aUcO
         9/fw==
X-Gm-Message-State: AOJu0YwHpjPaMosfduEFUP5W7zXZEESdZUPHjWckqodvFu4449WPgtsW
	U5YIv4LR/qAzFblAvYIu+mp7+L7839QYcd54GwxUwauENVrARHHxDYCbio4iq+L9N5cghvx4IvF
	VK5aEsv4=
X-Gm-Gg: AR+sD12Z7kNX20UiEuX9gDnIV/kf+/yLrBhehshn5/JNGLPVVs3o3jIqu5L7XwJrOLo
	RPqUO4Gv4QQMTFnbBTnY/hvvVdaYG9KOLp4FYGBHzWQqIiNwiAonf2MBTawqlbHPE4l1xAKtwvy
	XhOzFR591ggmWUvgO2XbzTURPo+SKNU+3vjicUNSL1MBHIXvAkN0Be8/zZTjk9Jy73qy07LCx2W
	45peVrsawUo5qPnaNIdBYzXSx+eNjQpWLP2oK7ktZb6gzmS809Q3AVNuJTbBuSI1kOpGiATj29l
	C78GWMj/2OXAoILywCF+9bZGMdj6IX8ibYSxF8PlrQzNyzxztlvT6krbnqh9FAgsim0o6tPPsPA
	K5yVgpb5Jv6T2EGTtf98gs0RweVZRTUo4/mahyw+ML+h3x49+REFIQlI00woUpWVqFg17cNCzG8
	HRbBPvRBUfLzlkg93oroPDcKvDj3Kmhx2jlLdLOLHpxy1tMMPg15QsOx2slxoguTVktjmQ7q/Ut
	ysluw==
X-Received: by 2002:a05:600c:1383:b0:495:7a36:bf5c with SMTP id 5b1f17b1804b1-496b56e6585mr58390325e9.10.1785054609461;
        Sun, 26 Jul 2026 01:30:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/31] Patch review
Date: Sun, 26 Jul 2026 10:29:24 +0200
Message-ID: <cover.1785054429.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241982

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, July 28.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4287

The following changes since commit 3217490cc554069ae53aa54cf8ad7327ce85fa10:

  glibc-testsuite: Do not generate SPDX (2026-07-21 20:32:51 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

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


