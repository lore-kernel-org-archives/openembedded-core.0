Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23AFCC02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 14:38:04 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.22641.1736951878259517132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 06:37:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T1Qyqf1J;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2164b662090so120336275ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 06:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736951877; x=1737556677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=j8W/Qv310gGCk1sEx9lCc65SugXPsLrK7CyW2n3t4RY=;
        b=T1Qyqf1JwxuiZV6+Lp14t1gQa1AG6B4tIWARAo1UKRt57KnvqhPHGSAI/8Y9roZoe4
         gk4WIHlUlFkrUqfz+yM6mXow3QNI7OHXdogyAX7jn+bR7TxsUioKvKA9LCioJDNDASyZ
         NAigy+NrfiYtrQs9nLypHTWG++UuZPWAw6LLYyGux3A4C7YJUsFbstZ8BjTn3NjTADDy
         Xtv0Ly276pcdxbWcNR46txMqYpDrCegTuDmDFgikgz5W8WtDsUgpRMd4PqiZ8iKC8+4U
         Czl32CvhoX61qaUt4wqNZLofDMJtzjFOi7F10uqm20Ir4ZusCVSQrjer92gD0os2sm2S
         mw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736951877; x=1737556677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8W/Qv310gGCk1sEx9lCc65SugXPsLrK7CyW2n3t4RY=;
        b=Ncz8OYRO5DH69o0fHPIHlNH3LHU2zG3tH4AnsFbXrQP2KCSgtWYOpXsRighMs9B7Xu
         StyT6YFT8nFQOuIaLF1jfCN81HhMO7NQDmHpJ5T0n5V1fxN7Jm5/Rf7lRO5fXcRVrigM
         csvfaDx6084y2liOZabH+mb4k3Yw93cPlGpu9VpR7zRnUJGdWDZW5GVp/G0fjLnYrbmB
         PHhJ8zMtHBfOoxOf8ke6CkhMJw2A/qXZ/SBrLoBu44bFtcXZjdDdrePwb68+M/DWtkGG
         cUpnb+KeQYExCbp7q8aLqwDaPvzVNgDc/RqmSygEFULv2WJaNzIXsC/Iv9j6i6ITJHRO
         mipA==
X-Gm-Message-State: AOJu0YxpDCI/pR9keyN9RpdSBUAaTIlKT0VQz+buLwS/N2XQJHMd4qNI
	SgVvJ6PXJN7V/1LrAXsWcTyzZ97KahmwkGxKoFw6yfMLHe8vGpTfhq5LM660nIR9rxAEo/+2WPj
	A4k8=
X-Gm-Gg: ASbGnctcgDFMei8RqKiiRVSK8omP7y4jT7AMsXxveximKNqU0Q5+XeB8hjrwfzROdtd
	k4KNVYnN7MUsfxlKtFER2zlHmymg+9f2OdgLOmqLgsxy8intc1CIN0hc+rpilePv/aeS+10ObiI
	+LxJ10wV+NHY/PR7pA9pK5UiQEIRMTI8uaXmst1xPliX6VPxcAYChYVWQko8EsztzFJIQZFYLh7
	YOu+mU+X1Cdu6o9uvN+t4KDSGuK9OKWEspmcXfCBEAshQ==
X-Google-Smtp-Source: AGHT+IEo3Xhu4vyqALRtsTHRTpQdSs+GDl2ATnSEUkHZqeVK6ousWSYL0gR6qf86TCLyoANPYkgVbQ==
X-Received: by 2002:a17:902:ccc2:b0:215:6cb2:7877 with SMTP id d9443c01a7336-21a83f4b2b4mr498390625ad.4.1736951877469;
        Wed, 15 Jan 2025 06:37:57 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f244cccsm82333295ad.210.2025.01.15.06.37.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:37:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/11] Patch review
Date: Wed, 15 Jan 2025 06:37:38 -0800
Message-ID: <cover.1736951751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 14:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209905

Please review this set of changes for kirkstone and have comments back by
end of day Friday, January 17

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/809

The following changes since commit a270d4c957259761bcc7382fcc54642a02f9fc7d:

  build-appliance-image: Update to kirkstone head revision (2025-01-09 08:49:38 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (3):
  go: Fix CVE-2024-34155
  go: Fix CVE-2024-34156
  go: Fix CVE-2024-34158

Divya Chellam (1):
  ruby: fix CVE-2024-49761

Peter Marko (1):
  gstreamer1.0: ignore CVEs fixed in plugins recipes

Yogita Urade (6):
  ofono: fix CVE-2024-7539
  ofono: fix CVE-2024-7543
  ofono: fix CVE-2024-7544
  ofono: fix CVE-2024-7545
  ofono: fix CVE-2024-7546
  ofono: fix CVE-2024-7547

 .../ofono/ofono/CVE-2024-7539.patch           |  88 +++
 .../ofono/ofono/CVE-2024-7543.patch           |  30 +
 .../ofono/ofono/CVE-2024-7544.patch           |  30 +
 .../ofono/ofono/CVE-2024-7545.patch           |  32 +
 .../ofono/ofono/CVE-2024-7546.patch           |  30 +
 .../ofono/ofono/CVE-2024-7547.patch           |  29 +
 meta/recipes-connectivity/ofono/ofono_1.34.bb |   6 +
 meta/recipes-devtools/go/go-1.17.13.inc       |   3 +
 .../go/go-1.21/CVE-2024-34155.patch           |  71 +++
 .../go/go-1.21/CVE-2024-34156.patch           | 150 +++++
 .../go/go-1.21/CVE-2024-34158.patch           | 205 +++++++
 .../ruby/ruby/CVE-2024-49761-0001.patch       | 391 ++++++++++++
 .../ruby/ruby/CVE-2024-49761-0002.patch       | 104 ++++
 .../ruby/ruby/CVE-2024-49761-0003.patch       |  85 +++
 .../ruby/ruby/CVE-2024-49761-0004.patch       |  71 +++
 .../ruby/ruby/CVE-2024-49761-0005.patch       |  51 ++
 .../ruby/ruby/CVE-2024-49761-0006.patch       |  79 +++
 .../ruby/ruby/CVE-2024-49761-0007.patch       | 561 ++++++++++++++++++
 .../ruby/ruby/CVE-2024-49761-0008.patch       | 107 ++++
 .../ruby/ruby/CVE-2024-49761-0009.patch       |  46 ++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   9 +
 .../gstreamer/gstreamer1.0_1.20.7.bb          |   9 +
 22 files changed, 2187 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7543.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7544.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7545.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7546.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7547.patch
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2024-34155.patch
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2024-34156.patch
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2024-34158.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0001.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0002.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0003.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0004.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0005.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0006.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0007.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0008.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-49761-0009.patch

-- 
2.43.0


