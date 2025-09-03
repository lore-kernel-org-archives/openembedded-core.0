Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7D7CA1014
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 16:15:13 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.16911.1756916106468183693
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 09:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HNXfRWKv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-772627dd50aso1356920b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 09:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756916106; x=1757520906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gEQ70H7oOLKB/8kymh1Rho8HuTdclZFpe0EE1kMIkJY=;
        b=HNXfRWKvQU8i122uKWH0BmobqzXRK9HVKyz4KYv0exTBzHkuVKIh3WdmpBi5ebtRmm
         3SjuGjerpSXP7db3yES2q4K9OjTbseZzk1lx6KEI39+WkARCUllR99+ldRYORZE3oJyQ
         h/R+PHNkkihUoYzcSpbLpHICv1qob3Fuydc8MgGP/L2TN5vE6FDqMTKtwdEHNEB+5MqQ
         xX+3wLZj2ekvUhI1nznaU6hlXG4O73zromQSJYs6ABZ8uY/t+LazgapbxOnTfzcQsBkl
         d0MkpFJmC5bSps7NxwcD+4/JK6beYhWPs1LKtQMQPmDZzY/5rQUrX6y4M7nLVWs3CsH5
         si/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916106; x=1757520906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gEQ70H7oOLKB/8kymh1Rho8HuTdclZFpe0EE1kMIkJY=;
        b=oAjuILAtL3x2W7s8FeqOsd5gbBeYGFriF8cLUmJpYllCQmn4qrqUhxqhK76BtM2A7+
         X6UfMIfZSoi0sosvzc8cc5/ZJS4I/1Hmz0nMsFR/crHjMmabVcFWYKq5hYIfXNjhNe1U
         8WOrPrjeq45C1pB8YSuXIoB0vm4uDIR+WqlX9oJ0PuEVU1nLO8MiVyTbRpZdp6W9ga9S
         a81qeLCPzeNi08yc5ZtI1JEe3jTolCKyDGyQU8VoEIUKr17Mp7/lHE87Y9BBjuQe8KY+
         1xLhM/LV8hLtOYCFeTfI/1KwqQfaRgmVlFOtySBcguwp9ffopWU9nv2q+b5A/7+mYybJ
         ZKbg==
X-Gm-Message-State: AOJu0YyMOfnRnwvKi36A7ifO+PZVrpmDhnG1kP7P7QN/4L2XAUai/+T7
	sl8LuTGxo0un5XrVN7LsXIIf51mNontkz9qqGol5/+9GIuULicrbKXNfw6U5qxIEecNsvO5+zJf
	HDRXc
X-Gm-Gg: ASbGncsTTL+iCnJLnjAxl3ycn3rpigInB3RHAEkwdk42nzebrzlwWmejRFqFqZ7JihB
	+M06dGWYo59vVC5nNC344c7m6FLdg2ONnqpXhpCqyzjjdankbgSAiQJX+QxjVibp+wOqUf4/uQr
	dFVZRmO1+0AsU/wWDgjNU/aHX+w+mEZqJpGml+eOUgLoW8Ho1S7LXL560I+seZugOzzxSyZf8Q9
	0CDAEAxvgYgAKxbQy0DLRIDq7YxCrtuPOw7futlt+Iu+Rb/jabCsc+24F73kex23y0R/lY0OX6h
	Y/hb3xHcJcZOPykOtrr5eYFKAirb2FtPqffuH2IVoqdB30OegpwEfScpumXPuZYT+Ve/LYUnktN
	xp1tXeE8KohLaHQ==
X-Google-Smtp-Source: AGHT+IEAs0vom178J/QmJy/cDlMc/82raF4TWugSs9A4ArQ/+3gB6sSyIx632xd7uYNE5qtHk8V3Jw==
X-Received: by 2002:a05:6a20:a10d:b0:248:7e43:b6b8 with SMTP id adf61e73a8af0-2487e623cccmr4292266637.3.1756916105359;
        Wed, 03 Sep 2025 09:15:05 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:9ffe:4bb4:e2b3:4b1c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7724f079b88sm11027602b3a.40.2025.09.03.09.15.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:15:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/9] Patch review
Date: Wed,  3 Sep 2025 09:14:50 -0700
Message-ID: <cover.1756915922.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 16:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222865

Please review this set of changes for kirkstone and have comments back by
end of day Friday, September 5

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/2309

The following changes since commit 36cf6bb39df081b27306d27b20155995b73e1a01:

  Revert "sqlite3: patch CVE-2025-7458" (2025-09-01 08:18:45 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Deepak Rathore (1):
  default-distrovars.inc: Fix CONNECTIVITY_CHECK_URIS redirect issue

Kyungjik Min (1):
  pulseaudio: Add audio group explicitly

Mingli Yu (1):
  vim: not adjust script pathnames for native scripts either

Peter Marko (2):
  vim: upgrade 9.1.1198 -> 9.1.1652
  sudo: remove devtool FIXME comment

Praveen Kumar (1):
  git: fix CVE-2025-48384

Yogita Urade (3):
  tiff: fix CVE-2024-13978
  tiff: fix CVE-2025-8534
  tiff: fix CVE-2025-8851

 meta-selftest/files/static-group              |  1 +
 .../distro/include/default-distrovars.inc     |  2 +-
 meta/lib/oeqa/sdk/buildtools-cases/https.py   |  4 +-
 .../git/git/CVE-2025-48384.patch              | 85 +++++++++++++++++++
 meta/recipes-devtools/git/git_2.35.7.bb       |  1 +
 meta/recipes-extended/sudo/sudo_1.9.17p1.bb   | 52 ------------
 .../libtiff/tiff/CVE-2024-13978.patch         | 47 ++++++++++
 .../libtiff/tiff/CVE-2025-8534.patch          | 60 +++++++++++++
 .../libtiff/tiff/CVE-2025-8851.patch          | 71 ++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  3 +
 .../pulseaudio/pulseaudio.inc                 |  2 +-
 ...src-Makefile-improve-reproducibility.patch | 10 +--
 .../vim/files/disable_acl_header_check.patch  | 12 +--
 .../vim/files/no-path-adjust.patch            | 35 +++++---
 meta/recipes-support/vim/vim.inc              |  7 +-
 15 files changed, 308 insertions(+), 84 deletions(-)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2025-48384.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8851.patch

-- 
2.43.0


