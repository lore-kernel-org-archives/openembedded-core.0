Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4E6FEC11D
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 22:28:05 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9558.1774391283300806090
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 15:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vEaUPZvB;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483487335c2so47452835e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 15:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774391281; x=1774996081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xTtZhwLribg3KwO1i63Ix0GMzot3yxAP4/Zu4IJzUys=;
        b=vEaUPZvBF19gc1DhWAIi6HZ5hHbWgKPB1p/P2MS+L2fPRIhwQl6ZhlQOH0J7P446+O
         +rAc+4GopBBYxp9BjD3SwYHq78vE71D2y0K2VyJNZNc+gFe/2B+HSFRKlolXV3ioN+Qs
         PRbeLEw5QfdSahkWnwv44W/E24PS8Qc2e54WY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774391281; x=1774996081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTtZhwLribg3KwO1i63Ix0GMzot3yxAP4/Zu4IJzUys=;
        b=h8ZFyLZ8N84yxNwDToz6JKKFPia2iJrybxeoWCHxTa6gZ8Ohy8RXbLL7UkLhcsFqx0
         hVD8KUgosHbxa//Ie3naBTTXveG4HQB/eVoikE8whDmQGk/FI97Va9X7j3CJRASh/Tcq
         JPWecVJ/Nk9a73TNQK6CTOeVfBKK0/hQu5eawLLRevJACkVKTx8+SGfMONTCCzeUPcds
         l4RnD2/pvec2+7UhjILPh7ksNzrcnaXj2YFAUMKs58e2ruTz5To6COh2XIgyNQ89RJ2f
         e9l7AejKpbfxZbAVd3PynhbYL2MVV9pRMBoCooWhrz4IzseR92EspzmifE4EEKxUznk7
         2tVg==
X-Gm-Message-State: AOJu0Yy/x+NS0WtNRpa100U03JFinZjEPpIp1ZBc5zLr9UhNYapj1Y9I
	IxNZ7soLCwvZmqimcN8QOkFJye4+c/DdaBRtesCzifH2PyG9EwZCKPhe5JBnexQJ8eXeN4HTKfS
	hqqt3
X-Gm-Gg: ATEYQzzWh3oeFMfzmAggf3/IOCichSiV7LuPuJa4/dXWgJlO0JGHJVW4ebEpAXY4Ju0
	PeCJcU3pvhikaveHF4yTyxKUs5rPsRd5dEsuBuY9ZqTwGTxcd1wvCOvQ3fnRkCR/TCDC78Jqc8w
	fNr13PGbmeNnZbRR8HBFw8Meq6zXY0WChroKRA7aj+SbrRLh8V82YvZIFeqfcwEk+j+ynp4dee/
	quEKW3Ik+bpoU8fUdTmGDlbvcdZUSitJjwRVXqOonENYlT84Hs2XyVoaeKwAYBWz842oqtLhJiP
	XnXZGfA9aV5gl1RYYxvTLnumOI/FQJjbkea4aX9Jw9DfCZ7EKqtVOekimntU46zwDRSL0KCWXyd
	rYIYzq9IWkaaVPbol08Z9JkHjGuK7/DA0wuNUFVPZJuTmDDIt69bBssxIbVIdFOF8VNrE1KLw+7
	JbC7pam7DL1PP/5+hR2YPcdIR+h0i8NO/TKlHVNAoC51by1vgfJCd4fkQyQ9micKd6gFgRChLr6
	fGjzvWPxN+njeCoyZmcRttM7A0=
X-Received: by 2002:a05:600c:1394:b0:485:3fe6:21f5 with SMTP id 5b1f17b1804b1-48715fd9fe7mr20085825e9.10.1774391281345;
        Tue, 24 Mar 2026 15:28:01 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871169384dsm85309485e9.1.2026.03.24.15.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:28:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/15] Pull request (cover letter only)
Date: Tue, 24 Mar 2026 23:27:47 +0100
Message-ID: <cover.1774391127.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 22:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233828

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1773966414.git.yoann.congal@smile.fr/T/#t

Passed a-full on autobuilder (with an AB-INT):
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3502
* qemuarm64-tc failed on what look like the bug 16058 – AB-INT: rust do_test_compile/do_install segfault
* rebuilt successfully in https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/3396

The following changes since commit 077f258eb2125359ffe3982c58433ee14cb21f09:

  busybox: Fixes CVE-2025-60876 (2026-03-16 09:21:34 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to 9f2a6cfda6a2305f52411ca8121f27c8a5a91fa2:

  python3-pip: drop unused Windows distlib launcher templates (2026-03-20 10:56:43 +0100)

----------------------------------------------------------------

Ankur Tyagi (2):
  wireless-regdb: upgrade 2025.10.07 -> 2026.02.04
  tiff: ignore CVE-2025-61143, CVE-2025-61144 and CVE-2025-61145

Daniel Turull (3):
  improve_kernel_cve_report: do not override backported-patch
  improve_kernel_cve_report: do not use custom version
  improve_kernel_cve_report: add option to read debugsources.zstd

Eduardo Ferreira (1):
  go: Fix CVE-2025-61726.patch variable ordering

Krupal Ka Patel (2):
  python3-setuptools: drop Windows launcher executables on non-mingw
    builds
  python3-pip: drop unused Windows distlib launcher templates

Martin Jansa (1):
  lsb.py: strip ' from os-release file

Peter Marko (1):
  inetutils: patch CVE-2026-28372

Ryan Eatmon (1):
  oe-setup-build: Fix typo

Trent Piepho (1):
  systemd-systemctl: Fix instance name parsing with escapes or periods

Vijay Anusuri (3):
  freetype: Fix CVE-2026-23865
  python3-pip: Fix CVE-2026-1703
  inetutils: Fix CVE-2026-32746

 meta/lib/oe/lsb.py                            |  2 +-
 .../inetutils/inetutils/CVE-2026-28372.patch  | 86 +++++++++++++++++++
 .../inetutils/inetutils/CVE-2026-32746.patch  | 40 +++++++++
 .../inetutils/inetutils_2.5.bb                |  2 +
 .../systemd/systemd-systemctl/systemctl       |  7 +-
 .../go/go/CVE-2025-61726.patch                | 21 ++---
 .../python/python3-pip/CVE-2026-1703.patch    | 37 ++++++++
 .../python/python3-pip_24.0.bb                | 13 ++-
 .../python/python3-setuptools_69.1.1.bb       |  9 ++
 .../freetype/freetype/CVE-2026-23865.patch    | 54 ++++++++++++
 .../freetype/freetype_2.13.2.bb               |  1 +
 ....10.07.bb => wireless-regdb_2026.02.04.bb} |  2 +-
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |  2 +-
 scripts/contrib/improve_kernel_cve_report.py  | 37 +++++++-
 scripts/oe-setup-build                        |  2 +-
 15 files changed, 295 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2026-23865.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.10.07.bb => wireless-regdb_2026.02.04.bb} (94%)


