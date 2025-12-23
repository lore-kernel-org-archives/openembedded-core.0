Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FF3E6FE4A
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:26:16 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.109408.1766525168612718144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:26:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=J4HTG8wl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0833b5aeeso72719175ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766525168; x=1767129968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8W7Qo3pYsPtRGYky/pPSg4jRRXoUE7WNDGDrarhYsQg=;
        b=J4HTG8wl4EQT/p6Kt3mvSazAD5uqGq7doH2ydOBlhvEgTWfcU+kC56hj8GEg0wBp8M
         1chxfzW1XcTJraaU61QSQGAv9ZBPvNRFwaKpAZDmeXFisim3uLIuJLxULCPebUdmhgDQ
         UNtzIT/yF5CNexPUPeVikEfVppi6Tx5s777J5Q2rxnh5YPiD+E8AMld29qLqlvoLCkVl
         YQQ7a/ZPxNq1ej0ixzBC6evBiNRclJMOyGfnR6Oz2j7PmNthTDPWz/zcKtq5cKsTqzs7
         jPX4nU82DESwZzM7QV7eBR4Mq82okM+TX464yombtjXc7krt6hNsi/KNa3Igycbt58l9
         LZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766525168; x=1767129968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8W7Qo3pYsPtRGYky/pPSg4jRRXoUE7WNDGDrarhYsQg=;
        b=D0/1DXumyMXgP2ZhRCutcNfG0rOoYBFF2Z1qcSFAIdixDUNCWSxuQbBzXd2uP5KsOg
         MG9K5+kLGhl9Gc06bMG3r2F9GpadY/SASoXtIhFJFF1ImsMzRCmgCLORsF1HB0dof+wI
         tT+CX/kRVREQrdVfyyW0iswBm23b4zuPv67Tmnd1Ivj2eFASJmiLZg+dM+I41MeDirM5
         GxHzt7ooaejUHbH8orMCrTQKbQtSSfTLBdwO9a28gPzi3EJJIpEu4ofGCC60tVUIadrT
         RylEJW/WGVroWqORCETCkdOLvLJO3p/qgeBEwS0B9R4ZNQhHKTsHuaeIMkcIvID3cQx6
         HaSg==
X-Gm-Message-State: AOJu0Yz2RxRCoAuMH+GrI6VdwMo3oPPiTzrPCGm3XsRtA0wvexZlMwI/
	gCz98g8XX0VilkGnVL8eyXgba0l3Ht5jJgOLAaSleBuFrR8U/erSHw4b8Y0rCGY3ThXW2fIKHdx
	icYjV
X-Gm-Gg: AY/fxX4N9plO+8u8zTnSm44yJznui6ruYYPF3UyKHub4KLRM6QGsdJmZGcyqDxeUU3w
	BxqHBdksu2KfKyEXGUPwb8Gxd+urI+mA8NYHwvsobGuM/3J73QZxkCVXbNpaYz3fyM5UQbqTUQQ
	aG4kTaQnayi+g0a+a+gvkVZEg+ipgTjxTaxeWD9ihbef3ZPPQCfqLmUXsmyTy0YuGNbw6RMzIKc
	hjRidg9HCb3pD0+0oswjwtLCT5B8p9sE6o11bqg8GDD2WBw5li1REIsFoOXoV/MGCZHyycQ7o9Y
	pblSHqOUE2m2chfqXQobgfsI+LhUiR3nYDACQ+DecdDpY+Rmv8sJifbr9vCtIaD23ersuK278xi
	ltOYEXrChiBa2qCrYGCzz8ccZIwSdC8zydi9gL4oplHTIj2rJmdcVZqe1jxbviPSRLjRaPkIQra
	92iw==
X-Google-Smtp-Source: AGHT+IECK6HPJjJQGXrXzGX8v/MF8gV+JtyOUmFlwWOtG7zcZ84o6v8fX0HFc5w28DTyo05KEWrhEQ==
X-Received: by 2002:a17:902:cf08:b0:2a2:ecb6:55ac with SMTP id d9443c01a7336-2a2f220cbf6mr177063875ad.7.1766525167854;
        Tue, 23 Dec 2025 13:26:07 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6a80esm133756765ad.8.2025.12.23.13.26.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:26:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/10] Patch review
Date: Tue, 23 Dec 2025 13:25:51 -0800
Message-ID: <cover.1766525021.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228493

Please review this set of hcanges for kirkstone and have comments back by
end of day Tuesday, December 30

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/2920

The following changes since commit 2ed3f8b938579dbbb804e04c45a968cc57761db7:

  build-appliance-image: Update to kirkstone head revision (2025-12-12 08:52:06 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 4.0.31

Changqing Li (1):
  libsoup: fix CVE-2025-12105

Deepesh Varatharajan (1):
  binutils: Fix CVE-2025-11494

Kai Kang (1):
  qemu: fix CVE-2025-12464

Libo Chen (1):
  go: Fix CVE-2023-39323

Liyin Zhang (1):
  rsync: fix CVE-2025-10158

Martin Jansa (1):
  cross.bbclass: Propagate dependencies to outhash

Mingli Yu (1):
  libxslt: Fix CVE-2025-11731

Yash Shinde (2):
  binutils: fix CVE-2025-11839
  binutils: fix CVE-2025-11840

 meta/classes/cross.bbclass                    | 36 ++++++++++
 .../binutils/binutils-2.38.inc                |  3 +
 .../binutils/0048-CVE-2025-11494.patch        | 43 ++++++++++++
 .../binutils/0049-CVE-2025-11839.patch        | 32 +++++++++
 .../binutils/0050-CVE-2025-11840.patch        | 37 ++++++++++
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.21/CVE-2023-39323.patch           | 55 +++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2025-12464.patch            | 70 +++++++++++++++++++
 .../rsync/files/CVE-2025-10158.patch          | 36 ++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |  1 +
 .../libsoup/libsoup/CVE-2025-12105.patch      | 34 +++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 .../libxslt/libxslt/CVE-2025-11731.patch      | 42 +++++++++++
 .../recipes-support/libxslt/libxslt_1.1.35.bb |  1 +
 scripts/install-buildtools                    |  4 +-
 16 files changed, 395 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0048-CVE-2025-11494.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0049-CVE-2025-11839.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0050-CVE-2025-11840.patch
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2023-39323.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-12464.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-12105.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2025-11731.patch

-- 
2.43.0


