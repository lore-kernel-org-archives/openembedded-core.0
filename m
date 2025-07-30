Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7100BC83F26
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 21:08:34 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.46724.1753909712780739431
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 14:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aN9hEHGR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-748e378ba4fso368409b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 14:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753909712; x=1754514512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XdEPpLfKfp6q5mWW/rv0mkmUH+lPm74QFIhn9DCrLIc=;
        b=aN9hEHGRrddaz7TPQfFLMqD67HlX5OnZ6nqQM3YBDLsQ0oW8j+J34zcJIsXsD3O2yC
         38nR48flkMfkxmbejBOH6ThFWMfmyhPShat3qrS6hqkXU3sMXYckCclOYP7NhwFt1pWx
         ykOGOdEMwi85/1aYMD6eus714QIxv4rvoAreP4sBy+gECH5sn53LCXtszUe/aGo+sfgR
         xWz87U0HESPU3B3fzy/CeC8qyS/3HutqQRq5TcJ9HF+1OpuhUZHVL8K5mhu3J31F3x+m
         wdt82d1n/e80DHTW2ULZCogQMZ316JFAquJmslVQuCIL5IxevR7xlqLjguB0P8S7GPCT
         7NqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753909712; x=1754514512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XdEPpLfKfp6q5mWW/rv0mkmUH+lPm74QFIhn9DCrLIc=;
        b=sAxLm7Yj6pipBL11Dlqft+uf6cctGGqO2HclZCNTsMAQMHONzt0DQw+CZbhulTRjDl
         BEFOIP8zqEZyZzv2aUA4ycJmSuokND8IMUbmowSbgQd1C2HFLm7RSnDUwIQp72qlMeyq
         0SIWASx2dibGFYUGd1P/zDU3aDb/urvX7ZHOuqfjleSVedui2LP8LAdi1Ys5X/doz2DI
         T3LRENmy16NYbLO8vQshGlFRQQmTORHqkAfihsmGLHMa9ngvdPq6Lm+KWTQGy+2tbBG/
         LqyOuxc7ZnmPdFH7bb3WF5MEIYGMLt2Q/bmsjZ3WSZBjNVvyfVMyf2e+ga+XYURc67we
         LgDg==
X-Gm-Message-State: AOJu0YwDmNfUYIuxrpSgxPqz58Xa8ZYIXkd9M3dDWSndDpv8WY+VTkt/
	blOBWfXqCIJoqoNlohUvYl0u/zVKid/qAN7SBpAtUHka9mPrELKFkP8FLs5T8z+b+KqUA2calCr
	eLW8N
X-Gm-Gg: ASbGncufPBV+j0GFATQdY9Cg+H2kgCZJXp+O28Cya5zdzSc6WSUulwChOagb1f0q5TZ
	sRCPcYEhIegJTljxSoYONJaXVDiigYES3Z+fkP2M3tlxYZZ+jp3ulC2imYEE6HYLEqkvawT+w1/
	VaCrjs+26h2cSjtF2l8pUdhybNeJZCUE2SYzAqUWJ4YtaKnpJ+5i7JU24pvKy1eXZKSspZX52a0
	SFjf1WdSUSMP5Rn0J/O+OGdwgBGKX4G3/V0xppvNlIEbQ5+LMMk3LNo6Tl+KMUlFfMVZ+sl4QRp
	gEcQRjL+54lK110ruNao+IxRsGTXeeLOlg8O9WaWwnvW9xZ3rYgUu6YFbAOCTAcbOzg0qjf9z2Y
	zqaD2obzjrXbC
X-Google-Smtp-Source: AGHT+IH5v7aF/46NqAus5DdiJNOscQrYYNLGFrDIxEB5qh9lWcz+B5gXmHAHM0pLsAmmv18G6bLDkw==
X-Received: by 2002:a05:6a00:288a:b0:736:4644:86ee with SMTP id d2e1a72fcca58-76ab2b576aemr5803850b3a.14.1753909711830;
        Wed, 30 Jul 2025 14:08:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-769ee9ef1casm4929456b3a.3.2025.07.30.14.08.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 14:08:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 0/8] Patch review
Date: Wed, 30 Jul 2025 14:08:19 -0700
Message-ID: <cover.1753909581.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 21:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221150

Please review this set of changes for walnascar and have comments back by
end of day Friday, August 1

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2115

The following changes since commit 2e5234204922d08eba18812d297f469779d80c82:

  rust: Fix malformed hunk header in rustix patch (2025-07-23 09:15:40 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 5.2.2

Chen Qi (1):
  coreutils: fix CVE-2025-5278

Hongxu Jia (1):
  dpkg: fix CVE-2025-6297

Jiaying Song (1):
  ltp: Skip semctl08 when __USE_TIME64_REDIRECTS is defined

Peter Marko (2):
  ncurses: patch CVE-2025-6141
  libxml2: patch CVE-2025-6170

Praveen Kumar (2):
  git: upgrade 2.49.0 -> 2.49.1
  bind: upgrade 9.20.9 -> 9.20.11

 .../bind/{bind_9.20.9.bb => bind_9.20.11.bb}  |   2 +-
 .../coreutils/coreutils/CVE-2025-5278.patch   | 112 +++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.6.bb  |   1 +
 .../libxml/libxml2/CVE-2025-6170.patch        | 103 ++++++++++++++
 meta/recipes-core/libxml/libxml2_2.13.8.bb    |   1 +
 .../ncurses/files/CVE-2025-6141.patch         |  25 ++++
 meta/recipes-core/ncurses/ncurses_6.5.bb      |   1 +
 .../dpkg/dpkg/CVE-2025-6297.patch             | 130 ++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.22.11.bb    |   1 +
 .../git/{git_2.49.0.bb => git_2.49.1.bb}      |   2 +-
 ...8-Skip-semctl08-when-__USE_TIME64_RE.patch |  48 +++++++
 meta/recipes-extended/ltp/ltp_20250130.bb     |   3 +-
 scripts/install-buildtools                    |   4 +-
 13 files changed, 428 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.9.bb => bind_9.20.11.bb} (97%)
 create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-6170.patch
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2025-6141.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/CVE-2025-6297.patch
 rename meta/recipes-devtools/git/{git_2.49.0.bb => git_2.49.1.bb} (98%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch

-- 
2.43.0


