Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EA2109316C
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 00:28:38 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2617.1773966510172546734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 17:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zZ/2v70P;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fb439299so10147615e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773966508; x=1774571308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kMPBo8GWgaWNXTUIdw4EqDqB+y459hlpFE9cnluSJQE=;
        b=zZ/2v70PPCy4/07Wzsjg8NIFfB4YsoeTNGHvahjzgVHMYnVNxApy9ttlSpVTAgEbt4
         vfOU13wK9xEK0MVp+V4qXQVz8SjMUDFQcuD1Ha/TtV8wLnJqPcD/D3mXkKj1KpvY7fTw
         zwwhZp6yXyZ9RebYiCR4vWuUv7fX0EKbjt4x8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773966508; x=1774571308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMPBo8GWgaWNXTUIdw4EqDqB+y459hlpFE9cnluSJQE=;
        b=iqhHNLZetGAj/3tCs/1o3f8fgqxjKDy8mUKhe2MMkcINbUXefZnCocpW9VyMsO7xUu
         gNbWYPLV+p3twAzYByZwpRCUhvpbSo1ob+ivQFN7JvkRDjceBB9NGaMklkadx6iYdHFI
         tKH5SXmMPH9OoQCQ7aQHn7hhM1Lbb0LHxjUkZlYoyoHAPjKpwHpZ+0kD0f3Fts0SR0Yn
         UYshKjuQZbwe4jvAcz1HkdLk+EduBnRJNQxcpRY1OlGHhDSlKUkmyLp1h5D6SrGby658
         ppmCEWPMTNiCT/ohBAB1YSzYG7BQILhiicfJ9jmKT1XW7MxxliuVXbbBu/8Hftp5yYZJ
         cQag==
X-Gm-Message-State: AOJu0Yy2NNBodMBvrRhqiyT4eixuhlT7dEDS0PECv8mFumZ2nrD1dzfF
	2IGkiFQdCL7BPaVf48inKhLbQLY+uJdRVI0kDxicE41HIsdegBj8yFItvT4LzFwsb7xGcitXTgK
	wvuLS
X-Gm-Gg: ATEYQzwLwJeiqeuWQ7pVIHvn9EjVGkn/pHdGFZENqQ/0AJjE1sgAtkU004Bq22peuzS
	BdlOe0ncHx3/ExmYkbDwmLTwzm2bjXh3/bD+pgxBczw1REGTUwHDbc+3xQp+tyc11P3eH/A4sRQ
	ThFpu6thwsnjeBWyPfHpcIMOg35H8R2RcEkLeXo4tH9WbJzbqoObGd+8wOewoZUweAVoLAjx85G
	qnHAI2mZkCPm7BJglhKL8i3GYacgNh9ViaL8zTOCxn6DPilaW/m707J8jU45hUk6MoFr+M24/MR
	nkLjXGALIi0ge2TdxT6OzZRq+egIFKIDsYPWjD1MqKx4pkOxZm/QTWRib1HxDVdxtIiVgOu2Ntd
	eITB8pbNsLhEYxO2/D2/iHRbGEgU4v+Y5LbxNhf0iPHgEyr/Ub1+LVmI4vw2F0D22wu29loTqsR
	uEf7YTnwM7sDbHQn0xIopFEgUWorWK9mbbJDv04TBpDKDpsHElvespD2GlCg23SE2wj+dy5mV2t
	uPxTQguMB939R+UgWttjNm+nKtNNGGL0/PKTQ==
X-Received: by 2002:a05:600c:8b06:b0:485:41c4:e2e4 with SMTP id 5b1f17b1804b1-486fee1ae91mr14529805e9.23.1773966508241;
        Thu, 19 Mar 2026 17:28:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8359acsm23850655e9.12.2026.03.19.17.28.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:28:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/15] Patch review
Date: Fri, 20 Mar 2026 01:28:07 +0100
Message-ID: <cover.1773966414.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233561

Please review this set of changes for scarthgap and have comments back by
end of day Monday, March 23.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3457

The following changes since commit 077f258eb2125359ffe3982c58433ee14cb21f09:

  busybox: Fixes CVE-2025-60876 (2026-03-16 09:21:34 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

for you to fetch changes up to a6eecf76e21469a96979cf426f54de08d39118dc:

  python3-pip: drop unused Windows distlib launcher templates (2026-03-19 00:05:33 +0100)

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


