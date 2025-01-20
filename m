Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AF5C02185
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 17:51:15 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.42121.1737395470467002469
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 09:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Arask+5b;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21670dce0a7so99669605ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 09:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737395470; x=1738000270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=L+iKwzSxYVm1P2u7TWnM4gBumuNfdHgOy5TcD8ddEQM=;
        b=Arask+5bmcUSC8ZAuYvX8sLWUhqz/gYkbDwehW68NWxD09ejJz/oVNVgriSoPsENUP
         j4DLSg9HlbcJeCZlD9DBhd+NECB0/iQsJAyitioTdBKUwmoRJfEQAb/xS2klNWM86SoE
         Cc8Bk6CtBlaGMVCDNG5sSv8HybRp5ijE4eF+IVSS+5Q8Vby7sIhW4coxnoqUW8Ld4XrI
         fbhtm7jR92tVci//kxm/KnMqVAfEvwNezoQYfQRhpykfgFuPa3GQ2hBqh/2sIsUSNr4U
         3h1kNP8PZEo03jxrcGpbmF9XR0h4tEL7ZZILnTMBDCUZZQFaQq0u2AJ4m+MWM9pULhg7
         g6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737395470; x=1738000270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L+iKwzSxYVm1P2u7TWnM4gBumuNfdHgOy5TcD8ddEQM=;
        b=sYE6qlWhttW4pSI8O/A5jluiR3u9fWCjNCAwsoYPsfH4zJ21KdAY7DvbIOLKx+zVZx
         VjEPYuzpwalnpGwElSkvJhcF+mmlbx0tpQ/Dw7kABivUHFfQulqqOQiB89JL89qcDvdm
         Kb2awCC1slBntVKYx0QjglWPPo19yMHcvLp4NrlPEfXw/Bo/3fkEteOHCkNSiXq1oMyD
         e80zu92QPNyCoNboLucbZ8BgUbyGduuQnyyQfeVVXiJ4BvAEiYUA694fDWjXVBsUyquM
         a2W8Yuz+Go5jR8O506Wl5+HNwveAQ/2YPaH5EvevrdHmr+xjsx2rHdnlWB34GJ3oGlOr
         psBQ==
X-Gm-Message-State: AOJu0YxqjhLgoLBQJzfH0n+Yuju3Xoj2sCxF9qt6YDQgEDKRs9GjTZky
	pelywbMfxdLbidwd1karmPGmYPrnoCZnJ9bTfPDH3jy6G4exp6smlWzmoxipfFXgSp7poi/Sm3v
	EPg0=
X-Gm-Gg: ASbGncvxzxvyz+x5CHJhS1Y78V0oIogqQWer+FouHyJQSGBJ1KCCOOKDS8HL04+RvjC
	Parf63A7C8h/jmnkByQsseMLLzLL24W+tjMysjOJUXC7+eS7LJiiONP9nQ++yLsvC8csgTq7JVC
	XFerpSFCsBOHGKb42W5x9tfp5LS4Xnw5RcTZ95v3ViQxdeYGpscznVpRK/IQ7PE/JpxKqGwmgGX
	Ys5tLgq8/FqBPYmqyN2yRWLcvdlOUseNYnWvdWm6L0Wq72X8ZKZL/KKo+8=
X-Google-Smtp-Source: AGHT+IFnTwGENA2+AcWfGKhwNym9OAJ7B83JiJiq5OYpN9a0lnMX6ycgoT2lHZM6lDM7E1w5YZA1ZA==
X-Received: by 2002:a17:902:f7ce:b0:215:773a:c168 with SMTP id d9443c01a7336-21c352de425mr212847055ad.1.1737395469462;
        Mon, 20 Jan 2025 09:51:09 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcdcf643esm6155565a12.38.2025.01.20.09.51.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:51:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/16] Patch review
Date: Mon, 20 Jan 2025 09:50:44 -0800
Message-ID: <cover.1737395091.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 17:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210044

Please review this set of changes for kirkstone and have comments back by
end of day Wednesday, January 22

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/842

The following changes since commit 8c32d91b64ae296d7832ddeb42983f4f3c237946:

  ofono: fix CVE-2024-7547 (2025-01-14 05:49:41 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 4.0.23

Alexander Kanavin (1):
  rsync: update 3.2.5 -> 3.2.7

Archana Polampalli (6):
  rsync: fix CVE-2024-12084
  rsync: fix CVE-2024-12085
  rsync: fix CVE-2024-12086
  rsync: fix CVE-2024-12087
  rsync: fix CVE-2024-12088
  rsync: fix CVE-2024-12747

Divya Chellam (1):
  wget: fix CVE-2024-10524

Khem Raj (1):
  rsync: Delete pedantic errors re-ordering patch

Peter Marko (2):
  socat: patch CVE-2024-54661
  ofono: patch CVE-2024-7540, CVE-2024-7541, CVE-2024-7542

Ross Burton (2):
  classes/nativesdk: also override TUNE_PKGARCH
  classes/qemu: use tune to select QEMU_EXTRAOPTIONS, not package
    architecture

Zhang Peng (2):
  avahi: fix CVE-2024-52616
  vte: fix CVE-2024-37535

 meta/classes/nativesdk.bbclass                |   1 +
 meta/classes/qemu.bbclass                     |   8 +-
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   1 +
 .../avahi/files/CVE-2024-52616.patch          | 104 +++++++++
 ...024-7540_CVE-2024-7541_CVE-2024-7542.patch |  52 +++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |   1 +
 .../socat/socat/CVE-2024-54661.patch          | 113 ++++++++++
 .../socat/socat_1.7.4.4.bb                    |   4 +-
 meta/recipes-devtools/gcc/gcc-testsuite.inc   |   6 +-
 ...-prototypes-to-function-declarations.patch |  28 ++-
 ...antic-errors-at-the-end-of-configure.patch |  68 ------
 .../rsync/files/CVE-2024-12084-0001.patch     | 156 ++++++++++++++
 .../rsync/files/CVE-2024-12084-0002.patch     |  43 ++++
 .../rsync/files/CVE-2024-12085.patch          |  32 +++
 .../rsync/files/CVE-2024-12086-0001.patch     |  42 ++++
 .../rsync/files/CVE-2024-12086-0002.patch     | 108 ++++++++++
 .../rsync/files/CVE-2024-12086-0003.patch     | 108 ++++++++++
 .../rsync/files/CVE-2024-12086-0004.patch     |  41 ++++
 .../rsync/files/CVE-2024-12087-0001.patch     |  49 +++++
 .../rsync/files/CVE-2024-12087-0002.patch     |  31 +++
 .../rsync/files/CVE-2024-12087-0003.patch     |  40 ++++
 .../rsync/files/CVE-2024-12088.patch          | 141 +++++++++++++
 .../rsync/files/CVE-2024-12747.patch          | 192 +++++++++++++++++
 .../rsync/{rsync_3.2.5.bb => rsync_3.2.7.bb}  |  15 +-
 .../wget/wget/CVE-2024-10524.patch            | 197 ++++++++++++++++++
 meta/recipes-extended/wget/wget_1.21.4.bb     |   1 +
 .../vte/vte/CVE-2024-37535-0001.patch         |  63 ++++++
 .../vte/vte/CVE-2024-37535-0002.patch         |  85 ++++++++
 meta/recipes-support/vte/vte_0.66.2.bb        |   9 +-
 scripts/install-buildtools                    |   4 +-
 30 files changed, 1645 insertions(+), 98 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch
 create mode 100644 meta/recipes-connectivity/socat/socat/CVE-2024-54661.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12084-0001.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12084-0002.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12085.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0001.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0002.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0003.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0004.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0001.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0002.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0003.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12088.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12747.patch
 rename meta/recipes-devtools/rsync/{rsync_3.2.5.bb => rsync_3.2.7.bb} (81%)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2024-10524.patch
 create mode 100644 meta/recipes-support/vte/vte/CVE-2024-37535-0001.patch
 create mode 100644 meta/recipes-support/vte/vte/CVE-2024-37535-0002.patch

-- 
2.43.0


