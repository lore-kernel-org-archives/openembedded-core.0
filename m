Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB56C25B75
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 12:18:19 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.58493.1715602698667963344
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 05:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Xi5o1SPG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1ecd3867556so32328185ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 05:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715602698; x=1716207498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UR3eqGGk8Q/ATBf2ToGy5iBpCl8LIf2SbvU+9o0kDQk=;
        b=Xi5o1SPGbDJawrzSFdRl9ZPe9KU8Ou9DPJVqf7EJWx/nOzSKhuu0E4k+VEV3v5slqf
         aOdAtvvRrusMMTDboXyFc64zupY2BfnaAOqn+cuSCFDfduJ+HgpjVuLeIjEbPVRjZmZR
         ELeeNtFdlQIbXsRgsRSJys2Sg3fc4E9cq+0XFGh4UDFZPDvRT/5q/kRz55kAokTbKPlj
         qs3UDeRB2UdgpEk//408GYoLSJ7OpfPWheDDvBtqB3azlDuIZIF7ayG/2CjNQXA6TuC9
         KjtltB5LzG4h8Y3V50X4dHEeWmNlzjfGWnVFcaIJr9Ih3k8Ix2xeIXsuwDOF1vrCyd5/
         yRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715602698; x=1716207498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UR3eqGGk8Q/ATBf2ToGy5iBpCl8LIf2SbvU+9o0kDQk=;
        b=vCRR3egDYeNsfuQ2ffxO3mOypYzE6p9IxTwAwu7jl3NoUDpzVjWuMb928f5YCi2JHD
         DLpd4scPpAhN0O7qRBaNV9SPy4GDw0I6Vb8LX/5/rVpWwJngGs9B6IZTuA4Hn0fKVrGA
         UVgyJKfcx27MIXerItDkwVdC8qz4ETvOzTRJoMHKQ1TPECt/4uCGQDS5SOUEGj//5r6+
         vHniV0/U/NEziZYHWtmXLmreJ9+06f6HFZfmyL2FrtAhuFtveHT3p66Al1T/Om8rEI+A
         Q4UvvYmCzv9E8CqVQiUL4QFnYBgYPMxkOEZ8iMXoDXMRINPI6y/DZsWRNcuf+kPwPTP3
         GS+Q==
X-Gm-Message-State: AOJu0Yw8qJDlDoW82NM6dOq0n1irldQ6vzWbRkh1QFkJrJcwWkNj2WkS
	ukxFsd28yPHS06hDhVRbnpDi67HMzkPlqnHpSEMDEaHHtCF8pE0yl6Q1FW2e/Ln077cHwogtn5x
	RL0s=
X-Google-Smtp-Source: AGHT+IHL1JzZwsGZXjtARkIY506f/dY+fNQCa1W4fVoGlojAVatnTyjA+rI/v9RVDBU+US/R9aYM5A==
X-Received: by 2002:a17:902:f70d:b0:1e5:8769:aadc with SMTP id d9443c01a7336-1ef43d26f24mr111080705ad.22.1715602697631;
        Mon, 13 May 2024 05:18:17 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30b85sm77599225ad.181.2024.05.13.05.18.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 05:18:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/6] Patch review
Date: Mon, 13 May 2024 05:18:06 -0700
Message-Id: <cover.1715602539.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 12:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199232

Please review this set of changes for kirkstone and have comments back by
end of day Wednesday, May 17

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6895

The following changes since commit 24fd9b6756728a0337100f53a1c6e92aba092f9d:

  ppp: Add RSA-MD in LICENSE (2024-05-08 05:19:26 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (2):
  xserver-xorg: fix CVE-2024-31082
  xserver-xorg: fix CVE-2024-31083

Bhabu Bindu (1):
  libpciaccess: Remove duplicated license entry

Peter Marko (1):
  glibc: Update to latest on stable 2.35 branch

Vijay Anusuri (2):
  bluez5: Fix CVE-2023-27349 CVE-2023-50229 & CVE-2023-50230
  gstreamer1.0-plugins-bad: fix CVE-2023-50186

 meta/recipes-connectivity/bluez5/bluez5.inc   |   2 +
 .../bluez5/bluez5/CVE-2023-27349.patch        |  48 +++++++
 .../CVE-2023-50229_CVE-2023-50230.patch       |  67 ++++++++++
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 ...y-the-header-between-arm-and-aarch64.patch |  64 +++++-----
 meta/recipes-core/glibc/glibc_2.35.bb         |   5 +-
 .../xorg-lib/libpciaccess_0.16.bb             |   2 +-
 .../xserver-xorg/CVE-2024-31082.patch         |  52 ++++++++
 .../xserver-xorg/CVE-2024-31083-0001.patch    | 117 ++++++++++++++++++
 .../xserver-xorg/CVE-2024-31083-0002.patch    |  76 ++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |   3 +
 .../CVE-2023-50186.patch                      |  70 +++++++++++
 .../gstreamer1.0-plugins-bad_1.20.7.bb        |   1 +
 13 files changed, 478 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2023-27349.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2023-50229_CVE-2023-50230.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31082.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31083-0001.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31083-0002.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-50186.patch

-- 
2.34.1


