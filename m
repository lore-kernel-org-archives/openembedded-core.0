Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF53C87FCC
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 20:04:52 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.66851.1753646688924464097
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 13:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Qa8LHyS7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2403c13cac3so350315ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 13:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753646688; x=1754251488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/FF/pO8TxjRcSkIXrnFgdC0EB7d7VeZU7XYWka+4DhI=;
        b=Qa8LHyS7IkyczEWGqTrZfcrqaHeZ/aJdI0HcXa5Joqbhn+lvM7s4mB5C95anRkItw1
         ZfAm1vYk88WtcqbCJO/RFUFEvXqO80DerIi4AmDeuJR8CqrdyUb934zwltbuGmMSQCoO
         r+rO3xnVTjmvySLf+toUcwyW8HHcJolgKzWWWQFLd7YWS+lJUjLGvP+bnB3PzpGrRHxc
         xDCWEpwMpSG+VPUcA2CldkbKKoWvuJ2TT2TlxTr2UUq/3jjfxi0lV931rkUgXoTeDyUL
         JHXfRORUVnShDUFwrvEQhgMmyHweEfYy7V2A7PPDqu2nowkhwbr+sXIYFtYcvfBXmiGB
         ydUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753646688; x=1754251488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/FF/pO8TxjRcSkIXrnFgdC0EB7d7VeZU7XYWka+4DhI=;
        b=RAHUG2SHkf6I6FJgxIIQV6ozI3YKGOmuq8kTf+YqcL7FpBXZjk3QyyWsXn7DCGWxwC
         T4kMne0FphLrUVa0ES6zBOGQIbfpjAUlBEBQgDOnvvbe06eu3zYWSLjMoQMVH0y1L8C0
         i7/xEAmpkmE8OMbEklKvI+6B6YgVYY2BCw1pJqxmJP87abrjtT1ZoRWiVpoUgHNjuJoo
         h9OIIzHWUhYZxUmUOahGZh3VIDX2Gc+wKCvsX1RoW4zI9sXXuFMuVX5QbNkrzSR3jK1o
         pCCrt/GpYN9xL1U2HhwIDbCHnPLNg3Zc6Wdh9THdvyA0WISKrdc5nCAghvSOsKHkVj6d
         2q4w==
X-Gm-Message-State: AOJu0YxxU9vgOtxBYJs/hl4JIAeUkq3k7BqWcGxA/LnrhD2e5ZltrrA4
	555+Kh7n6zu9eoi7OozgjtdBeHBFRi3o7JXo1d5wyIg3sySk2ITroQdtae+Dxe2bVPAz553LIb5
	skmeed34=
X-Gm-Gg: ASbGncvpq+yW6OCBTwxhBmCGKCbsyObRvWIxlkhxgP6tPyFLlvk/0cVO9vG4UOFDtVk
	Clge3mRTA7bhWAxKPJrZBvhLByYJN8Q/ZgoKvLfs8Aaz6D/3NeaknNDpoY2sN1k5wNXUw5kAIy1
	IuxygC/8x0UDmCLhehf1aKdc3xMML3bzXLlRnV4AiTRQk9AQSqLufDe9lO+bf7x4Sl4QYFg+ogf
	Pq3eo/04rwsDtNDkp/axRqbHOs1zzOohlt9lT2Fzeuq0Y4+c3f/Vd3tq4nZopfs6i0/P61K2P/d
	JsXOnuouzbD50yOK+KFBsoiq9Cz7D3h1jobrFHWdptyiaY1GA8zsRsn6nDAjDXo1Z7OMP8LNiqJ
	4OeCgeJQNXmwJFBFXQhmo+s99
X-Google-Smtp-Source: AGHT+IG7XtN9JS/tAOvd6GymWRrzk+SOh58lxAOaQLbxndQ7Pn7PtV7hSCPBI72fn9TWmNVftbNFjQ==
X-Received: by 2002:a17:902:ec8f:b0:234:11e2:f41 with SMTP id d9443c01a7336-23fa5ce7270mr174512495ad.6.1753646687848;
        Sun, 27 Jul 2025 13:04:47 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:22e3:7abf:ace0:e5ff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe512ef7sm38905665ad.131.2025.07.27.13.04.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 13:04:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/10] Patch review
Date: Sun, 27 Jul 2025 13:04:32 -0700
Message-ID: <cover.1753646578.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 20:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220971

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, July 29

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2092

The following changes since commit d9f424921179a52ffe053411c44f20e44e7deba1:

  tcf-agent: correct the SRC_URI (2025-07-15 06:42:30 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 4.0.28

Daniel Díaz (1):
  ffmpeg: Ignore two CVEs fixed in 5.0.3

Deepesh Varatharajan (1):
  glibc: stable 2.35 branch updates

Hitendra Prajapati (1):
  libpam: fix CVE-2025-6020

Martin Jansa (1):
  db: ignore implicit-int and implicit-function-declaration issues fatal
    with gcc-14

Peter Marko (2):
  orc: set CVE_PRODUCT
  ncurses: patch CVE-2025-6141

Rob Woolley (1):
  ruby: correct fix for CVE-2024-43398

Yash Shinde (1):
  binutils: Fix CVE-2025-7546

Yogita Urade (1):
  gnupg: fix CVE-2025-30258

 meta/recipes-core/glibc/glibc-version.inc     |    2 +-
 .../glibc/glibc/0025-CVE-2025-4802.patch      |    3 +-
 meta/recipes-core/glibc/glibc_2.35.bb         |    2 +-
 .../ncurses/files/CVE-2025-6141.patch         |   25 +
 .../ncurses/ncurses_6.3+20220423.bb           |    1 +
 .../binutils/binutils-2.38.inc                |    1 +
 .../binutils/0043-CVE-2025-7546.patch         |   44 +
 meta/recipes-devtools/orc/orc_0.4.40.bb       |    3 +
 .../ruby/ruby/CVE-2024-43398-0001.patch       |  212 +++
 .../ruby/ruby/CVE-2024-43398-0002.patch       |  130 ++
 ...-43398.patch => CVE-2024-43398-0003.patch} |   23 +-
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |    4 +-
 ...001-pam_inline-introduce-pam_asprint.patch |  102 ++
 .../0001-pam_namespace-include-stdint-h.patch |   42 +
 .../pam/libpam/CVE-2025-6020-01.patch         | 1588 +++++++++++++++++
 .../pam/libpam/CVE-2025-6020-02.patch         |  187 ++
 .../pam/libpam/CVE-2025-6020-03.patch         |   35 +
 meta/recipes-extended/pam/libpam_1.5.2.bb     |    5 +
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb |    6 +
 meta/recipes-support/db/db_5.3.28.bb          |    4 +
 .../gnupg/gnupg/CVE-2025-30258-0001.patch     |  141 ++
 .../gnupg/gnupg/CVE-2025-30258-0002.patch     |  131 ++
 .../gnupg/gnupg/CVE-2025-30258-0003.patch     |  624 +++++++
 .../gnupg/gnupg/CVE-2025-30258-0004.patch     |  193 ++
 .../gnupg/gnupg/CVE-2025-30258-0005.patch     |   36 +
 meta/recipes-support/gnupg/gnupg_2.3.7.bb     |    5 +
 scripts/install-buildtools                    |    4 +-
 27 files changed, 3534 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2025-6141.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7546.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0001.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0002.patch
 rename meta/recipes-devtools/ruby/ruby/{CVE-2024-43398.patch => CVE-2024-43398-0003.patch} (87%)
 create mode 100644 meta/recipes-extended/pam/libpam/0001-pam_inline-introduce-pam_asprint.patch
 create mode 100644 meta/recipes-extended/pam/libpam/0001-pam_namespace-include-stdint-h.patch
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2025-6020-01.patch
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2025-6020-02.patch
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2025-6020-03.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0001.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0002.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0003.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0004.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-30258-0005.patch

-- 
2.43.0


