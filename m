Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E00C3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 19:08:24 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.84915.1747163301211117025
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 12:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0kc9AGby;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b268e4bfd0dso3774559a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 12:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747163300; x=1747768100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7MWSVzAKbnZmcqPsk5MG/F1YebmuBWgxFtNIMqjZ7k4=;
        b=0kc9AGbyXsl8LK8APcYieQMy3E/sN7OwpDi7+CoA3sHrklpvFD9LPdQDwWKXLVYRns
         NwBDIlWywZ/oWSMJLniBTykptIp1fRJubp34ayQIdG8jXbcpmrZbXArkLnAvpPgLzGqg
         8SFpuSgpC/y/brMGZC7wB0oRSWp48EaA6Oc2xoE8oOV3Tvff9SPXUp24Xt2BfnjsmnPL
         Or01U2T8XMGdNnzlqTEPwtafME7ZWY2uJ9sq8LDB6nSDAS5fypu9mtlZn/fZpoqyoYdv
         sSuit83hMEWSaVu+hMQ3EzmxUcPyKqiluG6xM9SDMBPipJGYtL7UFqz/ltsLKbDPvXFu
         XSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747163300; x=1747768100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7MWSVzAKbnZmcqPsk5MG/F1YebmuBWgxFtNIMqjZ7k4=;
        b=dHGaeP+BIkla8H06flP7jFi/fVhcrdZ1MhV4KwQ8/w+lSCXF8bN//idnF0WnqtWbad
         I7zF9DZmCmNRHOmvm/sBfhZf+0f2auzw13bQ9DQ4atcIDvktdklgGIP96OqpG4iEjIZL
         h60Znh+WBorCXkcSH1XzWnmmKb1JY92o053PKMaptWF6Y1P5W2dBXmSY8zeeUMRKa9hS
         yVi7tf0d/cHITsMtAe1lkK2udVhaVZpU/BXgaHkjKP4k25fqoNHDWv/yfEWOxrTBWsp/
         Q5vnXX2X0KPxn6cDMQWmI4peI4dTxRnQeq3c4QzFHxeRUtTMrGl+nEKbWmxuLZJNch+b
         ENYQ==
X-Gm-Message-State: AOJu0YzAyaGzfaHnge6oeKSQTZhz8c0XAGd8iqvBX/KH4y2lO7BUn4JE
	hUbaBdtwPh3QCdHjsdrLJlgWKuy2f9pay9Rc6j0u0165F6VT4eNneh+9IDPuUNPTTFwUpWgg+7R
	/
X-Gm-Gg: ASbGncsCIIlWZ3rkPP8XzO775oiDXvu9hGbsXVx8Tl3pA+O/yOaFpxL9SiV0XeKYaIH
	42U0+EuOuWBrDzS+TY0fxdPVDjS61SZ54+YexNWGmZL/cZdLd6CLQ3MXSL022+potll4qE1eo8E
	zreYJzxmGVrFh9x+LxRdsFU+1j9oaPhXjgVsENyb0Egw5dGNkMokS+8zSY22pda+6cjLoHN5zaz
	FaC5oQBa4IjgAJ6TB4QqOsB5+8BZJLXkYECqg+y3u9GlJbqN4nna6wysoCxABjoh/IE+zrWp214
	7zxYHbv1nFP4StJDzDEM+xpWJKcBm81D0Ey8QpKTDdc=
X-Google-Smtp-Source: AGHT+IFiP0zPjdEfe5ZsTJUhWBHe7p8XGSwIMt6AvAPLAzZhixsNukLBB/urlaxzgDco+BtKyyHfdg==
X-Received: by 2002:a17:903:1b26:b0:224:1074:63a2 with SMTP id d9443c01a7336-231981befb6mr8712595ad.43.1747163300266;
        Tue, 13 May 2025 12:08:20 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:37ec:faaf:5b57:6b2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829d425sm84851005ad.202.2025.05.13.12.08.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 12:08:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/15] Patch review
Date: Tue, 13 May 2025 12:07:57 -0700
Message-ID: <cover.1747163155.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 19:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216433

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, May 15

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1582

The following changes since commit 00f7a2f60dd6de95a1a47fa642978613ce76dc56:

  glibc: Add single-threaded fast path to rand() (2025-05-09 09:01:16 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 4.0.26

Alexander Kanavin (1):
  perl: enable _GNU_SOURCE define via d_gnulibc

Alon Bar-Lev (1):
  module.bbclass: add KBUILD_EXTRA_SYMBOLS to install

Deepesh Varatharajan (1):
  glibc: stable 2.35 branch updates

Peter Marko (1):
  perl: patch CVE-2024-56406

Vijay Anusuri (10):
  libsoup-2.4: Update fix CVE-2024-52532
  libsoup-2.4: Fix CVE-2025-32906
  libsoup-2.4: Fix CVE-2025-32909
  libsoup: update fix CVE-2024-52532
  libsoup: Fix CVE-2025-32906
  libsoup: Fix CVE-2025-32909
  libsoup: Fix CVE-2025-32910
  libsoup: Fix CVE-2025-32911 & CVE-2025-32913
  libsoup: Fix CVE-2025-32912
  libsoup: Fix CVE-2025-32914

 meta/classes/module.bbclass                   |   1 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 ...4-56406-Heap-buffer-overflow-with-tr.patch |  30 ++++
 meta/recipes-devtools/perl/perl_5.34.3.bb     |   2 +
 .../libsoup-2.4/CVE-2024-52532-3.patch        |  46 ++++++
 .../libsoup-2.4/CVE-2025-32906-1.patch        |  61 +++++++
 .../libsoup-2.4/CVE-2025-32906-2.patch        |  83 ++++++++++
 .../libsoup/libsoup-2.4/CVE-2025-32909.patch  |  36 +++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |   4 +
 .../libsoup/libsoup/CVE-2024-52532-3.patch    |  46 ++++++
 .../libsoup/libsoup/CVE-2025-32906-1.patch    |  61 +++++++
 .../libsoup/libsoup/CVE-2025-32906-2.patch    |  83 ++++++++++
 .../libsoup/libsoup/CVE-2025-32909.patch      |  36 +++++
 .../libsoup/libsoup/CVE-2025-32910-1.patch    |  98 ++++++++++++
 .../libsoup/libsoup/CVE-2025-32910-2.patch    | 149 ++++++++++++++++++
 .../libsoup/libsoup/CVE-2025-32910-3.patch    |  27 ++++
 .../CVE-2025-32911_CVE-2025-32913-1.patch     |  72 +++++++++
 .../CVE-2025-32911_CVE-2025-32913-2.patch     |  44 ++++++
 .../libsoup/libsoup/CVE-2025-32912-1.patch    |  41 +++++
 .../libsoup/libsoup/CVE-2025-32912-2.patch    |  30 ++++
 .../libsoup/libsoup/CVE-2025-32914.patch      | 111 +++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  12 ++
 scripts/install-buildtools                    |   4 +-
 23 files changed, 1076 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/files/0001-CVE-2024-56406-Heap-buffer-overflow-with-tr.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32909.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2024-52532-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32906-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32906-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32909.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32910-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32910-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32910-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32911_CVE-2025-32913-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32911_CVE-2025-32913-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32912-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32912-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32914.patch

-- 
2.43.0


