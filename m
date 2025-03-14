Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E524C35FF1
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 14:10:25 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.15427.1741961415702390129
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 07:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=F95GPzUl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22548a28d0cso62279865ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 07:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741961415; x=1742566215; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RkiLjA5h3nW6aAqcZRN0FzlbCBqRLFH2FU10AuEMnog=;
        b=F95GPzUleCSI1pojStU6LKQ3GMVeiMkEXEsDk7EThZbtxKwGhP74oO5Tw8WGnZWpgg
         mxO0VoowPsj9i3f/e+ECPt/rRm2Wm8wkHb5cUemr/lyygfByixrzILTZjoFhal+019Mb
         1pOj4s4Ad3exAIlWqBnHtzONKmAleWm1j5zJ2qAKVxEpNanzuHY58BLIEZU5cWLHTn3H
         t9/QLot7x42WqlSb8nXGA44yN8P9Ae7v80z671yASnSpj94Iu8vERYMlaUirL0P3s4Tz
         H38FfEeRMrxpEyXRsN+bHy4ETfRiRo0g4U6QtNTMluMghc/zjO9SuQQyTEuEjEO9O9Kx
         q1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741961415; x=1742566215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RkiLjA5h3nW6aAqcZRN0FzlbCBqRLFH2FU10AuEMnog=;
        b=JKP/RSZeoA9Nrocm7CC0YQJqcgqRCvSP7d8NPtudNJ0haGhqNrGKwd3i9sPGWXudur
         9iFkZ7AQ4oFGqlNwu0sq1g9bQ8Bh4hhDWpDvCQZfN605JKGgLd4q2OijZxmKMwTRRQKy
         RQxylYzBN7emKavyzTACHhuLKc9ok/DWDz5z70tSDi9LrQjv0qvl0m8PhZABJuwWww5X
         QLmvDgDXHzRltzKxpQDUlzGBSFzoreOaIorjrceKZSzbqxXuKUy+EiRdb6Nrxiq0uguX
         OnBNpkjJCdD1I+k4V/Aq5P9sMB6oPnznZiQbmh2RgmeI0znrLe/KZ37edvs49oMR2KeD
         35uQ==
X-Gm-Message-State: AOJu0YwwTYLsZEYAvn8rXGylf79oHgt0vIpQ0w7I8bpZjYWTS+4oFx9h
	D7O0biNPs+4rQlTeVKdEeuRwFNvMoYUwaxnbYAYfYigqvqZN73ugH+X35zcxCG3GbCxUJnnUsC5
	Z
X-Gm-Gg: ASbGnctw+8bgtPCWoltA3IdA6dfx1Jj78pt+xVtTe6Y5I8ZcAYSEPx/6aV1P63CxbM/
	G3YHP7LcchMFXJxowauANhAI7/mKip15f6FL8/gY0FDx/zQEQwgLb3s+R9bjb6zi6rXg8hicod2
	NYavuGqdN8ljRVPQXdOE+/LexD+3PgSFKc6RBj1/CIhq7LDhF1TVufYOXuglul0WiiqqbbSi/V2
	gWIosK7zq9CJZzHapfDwm0bAW1DzcmEgE+sRkmACwgedqQwjhM9ZKln+YxsRaQimQ23sMq19y7d
	dZdJd9A42tnB+xmfLImGpiMf5f6epBDcSs+X
X-Google-Smtp-Source: AGHT+IFDRVi8r2PdaxpgXLuySH5anxnSp/1cqbQjYLvuOVI8v+gUpOQNKaUzakyG0xaWSdvg2ZwjYA==
X-Received: by 2002:a17:902:e784:b0:220:e9ef:ec98 with SMTP id d9443c01a7336-225e0a58949mr33788825ad.19.1741961414746;
        Fri, 14 Mar 2025 07:10:14 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f60d:ac2a:8f85:c2ab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711559269sm3000774b3a.65.2025.03.14.07.10.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:10:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/7] Patch review
Date: Fri, 14 Mar 2025 07:10:02 -0700
Message-ID: <cover.1741961309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 14:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212846

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, March 18

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1187

The following changes since commit 0216c229d5c60d0023b0a7d6e8ee41bdfa16f8ef:

  tzcode-native: Fix compiler setting from 2023d version (2025-03-07 07:00:55 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Ashish Sharma (1):
  ruby: Fix CVE-2025-27219

Divya Chellam (1):
  vim: Upgrade 9.1.1043 -> 9.1.1115

Hitendra Prajapati (2):
  grub: Fix multiple CVEs
  grub: Fix multiple CVEs

Peter Marko (2):
  puzzles: ignore three new CVEs for a different puzzles
  libarchive: patch CVE-2025-25724

Zhang Peng (1):
  mpg123: fix CVE-2024-10573

 .../0001-misc-Implement-grub_strlcpy.patch    |  68 ++
 .../grub/files/CVE-2024-45774.patch           |  40 +
 .../grub/files/CVE-2024-45775.patch           |  41 +
 .../grub/files/CVE-2024-45776.patch           |  42 +
 .../grub/files/CVE-2024-45777.patch           |  60 ++
 .../files/CVE-2024-45778_CVE-2024-45779.patch |  58 ++
 .../grub/files/CVE-2024-45780.patch           |  96 ++
 .../grub/files/CVE-2024-45781.patch           |  38 +
 .../files/CVE-2024-45782_CVE-2024-56737.patch |  39 +
 .../grub/files/CVE-2024-45783.patch           |  42 +
 .../grub/files/CVE-2025-0622-01.patch         |  39 +
 .../grub/files/CVE-2025-0622-02.patch         |  44 +
 .../grub/files/CVE-2025-0622-03.patch         |  41 +
 .../grub/files/CVE-2025-0624.patch            |  87 ++
 ...025-0685_CVE-2025-0686_CVE-2025-0689.patch | 380 +++++++
 .../files/CVE-2025-0678_CVE-2025-1125.patch   |  90 ++
 .../grub/files/CVE-2025-0690.patch            |  75 ++
 .../grub/files/CVE-2025-1118.patch            |  40 +
 meta/recipes-bsp/grub/grub2.inc               |  18 +
 .../ruby/ruby/CVE-2025-27219.patch            |  31 +
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   1 +
 .../libarchive/CVE-2025-25724.patch           |  40 +
 .../libarchive/libarchive_3.6.2.bb            |   1 +
 .../mpg123/mpg123/CVE-2024-10573.patch        | 978 ++++++++++++++++++
 .../mpg123/mpg123_1.29.3.bb                   |   4 +-
 meta/recipes-sato/puzzles/puzzles_git.bb      |   2 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 27 files changed, 2396 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/0001-misc-Implement-grub_strlcpy.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45774.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45775.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45776.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45777.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45778_CVE-2024-45779.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45780.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45781.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45782_CVE-2024-56737.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45783.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-01.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-02.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0622-03.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0624.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0678_CVE-2025-1125.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0690.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-1118.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27219.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-25724.patch
 create mode 100644 meta/recipes-multimedia/mpg123/mpg123/CVE-2024-10573.patch

-- 
2.43.0


