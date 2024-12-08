Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24000E77173
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:15:55 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.78237.1733663747323958043
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 05:15:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FYaCOLID;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso1606757f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 05:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733663745; x=1734268545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IbqJvVC2xsgGFAM254LVb+YKPfeyHE+wt8l7kHqr06w=;
        b=FYaCOLIDPP7Ngh2lCT/j0uI3PZJMbdeZvF80cInDp3c7iAyQ5N9EVH3RDWKCc2Rpda
         2+X/Kv4we0UZPWrDUFuNOdgGkqVOC7AnK1knbyDR99ZWoHYZ3as1YTadl78n9bzUHLQ7
         vMUkrOtH3vTUNq46wJexRFVNCBqZUzvujH16KLnvw4CgRduPTE02wqfrzR78v3Qqr9sH
         EjBYPUoNwoW9eZ95nGQENSuHy2B4aBnN7KpIQzIGOl4LRmaOWvPH27kpqENpAGaM+gCD
         mDzAO2WkRY2akftMpDbN33Cy6li4dgs8QEMEbuIRh3N9020fYu7r6PtKPyRDCqce5Jdz
         RMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733663745; x=1734268545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbqJvVC2xsgGFAM254LVb+YKPfeyHE+wt8l7kHqr06w=;
        b=Jm6tARyFpTqF1k05au/XFiKKVzq5WSxgI2qnG6hxsI9uNhKNeToPcL0UVmywvh9Da7
         +TcJTSovjuUPrX7JMcvYn8dvWt66yoimnxNiOGmTQyJb/Hi3Lhw08MK17cEKvMPYnC92
         iiZdwmDC/OZXBY072V/oFhcJ/kkku2CjE5NknDJzRxnlhLHUJ5kMBqwbyajpGa8Uw6PN
         5WsJ67B69tq+jODGAU29Do8y6js+i/lSl4kv34fHXPcWUw8WRgGklblSgbOS8yecccgJ
         sqyW8wSokN92nWBcbBm2gnm7Ll31T6RjQjGOmP7rwDZnJriAEYDCKrdTKTtY0m6uRk0M
         xdNA==
X-Gm-Message-State: AOJu0YwhmjsMDYfzdpAfWE/zQcggd9RURJNeag3fT6NZjUaEiS9Vi9di
	hw7VXSsnw4YJOKa6WLuyAdc8dXmTvB1cPyncR8DZVKVCZCho9Ghw+gSbjg==
X-Gm-Gg: ASbGnct6iAPLu0LJwxCZapchz/4PrVwqiH7y/144pO16OPCCUP+/vihV8AuY76s3Vb8
	n5dFldnuTIbHwh7pBmSkiC/LrXXk1F96Yh3o1UzdA81BL+IQwPtfG+Qe12ZcKVaPgP4I48scPso
	Mi3Y4x997Ty+fdFo6TadYdmj9sQXKSN14zkw8rVc3PgATwOqFN4IgBe5F0jKRxTeq2II5QksErk
	fHIbQ0iwDQ1hv9q7i9/h4dtBWgWW1uJQwmoU77I50wpdt7BeBIX8l/JcN4PDix0Uw0FPedPH9k=
X-Google-Smtp-Source: AGHT+IFgOTLQ+3RlzLGz2bG8ZVCEovql4oydeuy20zguaDTXdexAYRTteXXifUUR6sxfQhstRBMFUA==
X-Received: by 2002:a5d:5f8c:0:b0:386:1cd3:8a03 with SMTP id ffacd0b85a97d-3862b379d16mr7476420f8f.32.1733663744922;
        Sun, 08 Dec 2024 05:15:44 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f59cc26sm9807830f8f.38.2024.12.08.05.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 05:15:43 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [styhead][PATCH 0/4] Backport a few dependency clean ups from master
Date: Sun,  8 Dec 2024 13:15:31 +0000
Message-ID: <20241208131535.5397-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 13:15:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208460


Guðni Már Gilbert (4):
  systemd: drop intltool-native from DEPENDS
  systemd-boot: drop intltool-native from DEPENDS
  python3-poetry-core: drop python3-six from RDEPENDS
  dnf: drop python3-iniparse from DEPENDS and RDEPENDS

 meta/recipes-core/systemd/systemd-boot_256.5.bb           | 2 +-
 meta/recipes-core/systemd/systemd_256.5.bb                | 2 +-
 meta/recipes-devtools/dnf/dnf_4.21.1.bb                   | 3 +--
 meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb | 1 -
 4 files changed, 3 insertions(+), 5 deletions(-)

-- 
2.43.0


