Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6462FC44500
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 21:07:34 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22532.1769029651464336746
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 13:07:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Rv1kFWNG;
 spf=pass (domain: konsulko.com, ip: 209.85.214.173, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a78e381fc1so1200985ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 13:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769029650; x=1769634450; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gSB9sfBHnzIe5IMmjTUJG3N0WOhc/cMVu1tAtmzY2J8=;
        b=Rv1kFWNG7lvgfTslmqd76wIRvddbPK8zDPzDd6eWav9wm+9NA5zBNl+zfEdXSY1pv9
         w2StEC7vlXipMRnFrkWES9S/pCfN0QHiIa8Lammzaf6V3FBwIyHlxRYI6wCNxhr9cv1L
         jGEZwKAZPVSIVRhNvYqt0EuTRGO4SrYFyUS3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769029650; x=1769634450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSB9sfBHnzIe5IMmjTUJG3N0WOhc/cMVu1tAtmzY2J8=;
        b=vGgvUlclsHN564xe1zqNZLoGne1edEYMcCLyn8tRnn50RYSKjvhYmqUPYFKMQjnLTX
         lPCV5sqpD55+dzTJEu9bhAXr0HEPp7sbCVzxNoiEQrTOEdaCPH+QOD2sijv7qa/LQX5A
         kh7GHvt6zENMcX/MW7PAGl4+b6HWKTXXfPelispyMJWOWluGcUU0X3Xqmul82MYkilnS
         53l34cgKcsFfzRDi59OsX88PjYJrBjGLf0jg3O7PPaPuKa8e/dHiDEmpU3MsjuLeL6+r
         rKWSA0ZiSYO5IAI5xysYUAVI8zP7QdkTEMIutGo42UsAjc0vwbKQ9Ljm22vGGHM8Ezmq
         fOmQ==
X-Gm-Message-State: AOJu0Yzx52pxEoDK/xBXWfKlrV1yNFV1tQvojxefoEgbvNtzHE802BRY
	HBZ++G7/IzDaXg4Hb+BCwEPstUXMiTaDHOAoazed3NDNEaCOfUkSEik9WlAOWdGKgFJ2O4JtYab
	8kYRa
X-Gm-Gg: AZuq6aJoCsieQdOaDnQrS8J62DdN6CVd6/QD7CB7KIFTCTybK5KcSP92+j9M27Y6n2T
	bVXM5cKx9E3KWCfZ+bX2DzrYZQSJGku/9c53ESPemIMSoYLSqHevKy9iRjFN7gOgw4tMGoIoVpn
	NAsUJuqnmKiG7DbiFHBt2V0S3C4nddWh8nDxXFU0w9jwib8Z9qIn/ocbOhP3PRpPguAfNeiijnq
	RDDgd9VmZf5X0HsdNIn/oQpoati2EvKP5g7V1JJeHhiE1kuGUhfGx27hqbpYq0bP7RwMZU75B1x
	kR/SEhq+opv0DVy//05MLOvnCOV0dsXir1zRTXTIsCDDVmMuXVFOPFX7kcfxpP1n/uYBMVWOWiS
	3h/6IETwvj1xvZmq1X9nzmP1yKT/3RRlvginI3ilAx4iBdCl+kCJdoPdO8fy90TVmKX3WdtzV5A
	NT4MbUTEfykjSZtK07aM1P0jx7obMInLI0wWBneIver7o53pytGQ==
X-Received: by 2002:a17:903:37c4:b0:29e:facd:7c02 with SMTP id d9443c01a7336-2a7175be530mr174251785ad.28.1769029649917;
        Wed, 21 Jan 2026 13:07:29 -0800 (PST)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dd19asm163765605ad.59.2026.01.21.13.07.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 13:07:29 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] python3-maturin: upgrade to 1.11.5 and fix tests
Date: Wed, 21 Jan 2026 13:07:16 -0800
Message-ID: <cover.1769028980.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 21:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229822

From: Tim Orling <tim.orling@konsulko.com>

Now that we are a few releases into the 1.11.0 series, maturin looks to
be stable enough to update again.

At some point in the 1.10.x series, the oe-selftest runtime tests stopped
working, or else it is related to the Python 3.14 upgrade. Either way, the
guessing_game code from the Rust Book (and the Maturin Tutorial) has been
updated in this series and the selftests aligned to the changes.

This series was tested on qemux86-64 and the maturin oe-selftest runtime tests pass.

This series is based on top of the current master-next.

The following changes since commit d2adaa1f3dbed35bdc58c89de1da4c90123e1def:

  uki.bbclass: fix building of UKI images with multiple initramfs fstypes (2026-01-20 08:59:08 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib timo/recipe-upgrades_2026-01-20
  https://git.openembedded.org/openembedded-core-contrib/log/?h=timo/recipe-upgrades_2026-01-20

for you to fetch changes up to 73bea91160931edef54adf84a40f79c60e1ef9a6:

  oeqa/runtime: Update tests for maturin (2026-01-21 12:25:23 -0800)

----------------------------------------------------------------

Tim Orling (3):
  python3-maturin: upgrade 1.10.2 -> 1.11.5
  lib/oeqa/files/maturin: update guessing_game
  oeqa/runtime: Update tests for maturin

 .../files/maturin/guessing-game/Cargo.toml    |  12 +-
 .../maturin/guessing-game/pyproject.toml      |   2 +-
 .../files/maturin/guessing-game/src/lib.rs    |   4 +-
 meta/lib/oeqa/runtime/cases/maturin.py        |   9 +-
 .../python/python3-maturin-crates.inc         | 316 +++++++++---------
 ...in_1.10.2.bb => python3-maturin_1.11.5.bb} |   2 +-
 6 files changed, 176 insertions(+), 169 deletions(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.10.2.bb => python3-maturin_1.11.5.bb} (92%)

-- 
2.43.0


