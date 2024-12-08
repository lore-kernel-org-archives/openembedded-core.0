Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB38CE77173
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:10:54 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.78178.1733663445913390670
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 05:10:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gvd1MveF;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434f74e59c7so1523035e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 05:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733663444; x=1734268244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=63sBXNjb7rRENmQkhA/Xesr/lZ1n1Ik0XEx/mdpXD5I=;
        b=Gvd1MveFAUP2DrPrLIzaygk4Ycurnq3EhvkKF6/ho9li9GYn7wdPycqKWqNsaSYk76
         as90Hq0l1WLXNxhJUJyS/mmHA4gKU85eLc2MWLY+nqfN3HaQrR9rTzHvYmJpeo6rVqGN
         1T20UFIagDoov7R58wQ4j7tQkO9i7F0acv2uPyuAeUJ63sNt6BG3yBEZt3P7aVd2d6uy
         3okQRAlDmpTHdwNfPmQk4difFeuDYRtO9TAvf1f5WR+W5BpFK7JYLaXyi8atLfw7lKBa
         7ZSRuuS1Hcw/+Wvt//IMipTuzk0NlvCyxNtqhCAaR7IqggosAZZ7dwLbFno5+GqqBdxK
         U2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733663444; x=1734268244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=63sBXNjb7rRENmQkhA/Xesr/lZ1n1Ik0XEx/mdpXD5I=;
        b=Nl1uMZK78HTwMZ96SE/Lua27xodKpRBoOHMkGN1Cq5Pn6ivIw1Znqku9NRe51hq0kk
         3KWHiCa9/JOQ6IaUUYRsUsXBogMp3NecsXyfTUM3uFu0AyhhBBJkgAUJFvtAb7btbuFF
         6o8OxpJTZftC3uVk7hN17rZgidgcNsl3kn4uLgj617SOBG43k12+3tq8CLftYdnsCQtR
         uSMj+/a5IkP2WGAYmy4Mxcntt6lixzhw2M2w3ZNrRJwwH1j253u7PL88y4X7YB0Lh1ij
         NxKSjYr+vhd3imabwKHesu9pnlzrpdYj04t0m/gXlpZsDzJEYoHcwE6wwgQpGkC8FYHZ
         P5qA==
X-Gm-Message-State: AOJu0Yynu3eZmopLS6e280n2PIAQ5Anf66Pm+evAx4X/aO3mLW2Nl7Ns
	pWbyc6mFzrZS7fy82EYJve2icWmjLQQezgmRN2e0PNLHO5bxSUJfko0EN/eG
X-Gm-Gg: ASbGncvbi0JqORQixTb0yEfR23ZFRMUYHKtm3NxEmW+2hOpu7RWcxeh/GTtOhlZCS7c
	kpBCztqpWZKnolXUOascAhGPK8ZkeJhdXBHnIpLLtSFdOpeV5eYhkqcuY0YUgEevFQZanOJQXjb
	y0MOBGGSxO/Ckkw1iRGa8ed8E/z2OdFqslCdEklnfPPucSSA3U+/eduQss0htnyKc+1tW3rIotM
	OG3DrI5naXZY4YbauEowQD3ObIiAOVMBPhv+evDfV2kVuti5DKmREraG5aLGz6dTZTXcFvDARg=
X-Google-Smtp-Source: AGHT+IHOT8rbTPyufW+13YYeFbnnqcuNj9C7Bg/Grvo8KPYRtbvDRYgP5TPMfAUMKWQD8q41If48oQ==
X-Received: by 2002:a05:600c:34cb:b0:434:f817:4492 with SMTP id 5b1f17b1804b1-434f8174657mr4327635e9.31.1733663443927;
        Sun, 08 Dec 2024 05:10:43 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862a4ae481sm7522689f8f.25.2024.12.08.05.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 05:10:43 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [scarthgap][PATCH 0/4] Backport a few dependency clean ups from master
Date: Sun,  8 Dec 2024 13:10:30 +0000
Message-ID: <20241208131034.4696-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 13:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208454


Guðni Már Gilbert (4):
  systemd: drop intltool-native from DEPENDS
  systemd-boot: drop intltool-native from DEPENDS
  python3-poetry-core: drop python3-six from RDEPENDS
  dnf: drop python3-iniparse from DEPENDS and RDEPENDS

 meta/recipes-core/systemd/systemd-boot_255.13.bb          | 2 +-
 meta/recipes-core/systemd/systemd_255.13.bb               | 2 +-
 meta/recipes-devtools/dnf/dnf_4.19.0.bb                   | 3 +--
 meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb | 1 -
 4 files changed, 3 insertions(+), 5 deletions(-)

-- 
2.43.0


