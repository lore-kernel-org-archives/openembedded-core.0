Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD98E78D74
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:26 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43981.1770629359729862177
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aBsOoI50;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43767807cf3so763226f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629358; x=1771234158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+/cpNZIMCGhLvX4uPAjuS/0YAYDdbp4eKMA70pxr7xQ=;
        b=aBsOoI50PcJhF1eiM/teFe7JEw0ZmbV6oVIl8Qz5+e4l0ogQ3mPInV+kBqeNOIuYd1
         QyRC+3XgazolfxjoPMOP7xc5weAs/3i08deNRsnhFbTTtRotyEXkn5InEX4/f/t8sXTw
         k9ngqhdrSbM4BSegz3D83SuPjly5XnxlCC3bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629358; x=1771234158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+/cpNZIMCGhLvX4uPAjuS/0YAYDdbp4eKMA70pxr7xQ=;
        b=sul1A3iOI8zpOTb+YeAC3YclKWIrH/af59yX33KwM5AWkSecpDWYS1A2qhwhJeSy7V
         cjWEKG4/JEeO52Qd0kNJiR772c1CDsgquji4u+gntK+MgaRMdZahW9NBnsLf8VAPTdZx
         TcraJuv5oopIJO9pHQiKRYLC5TP3Bb8jldhEA1wUTsPid3AX1/YICu6DMsZRo9PQ57m7
         aMv+TneKLUe6KNj68p7H8gZ+Mm6IP+9lj0FRFgWJvyilUiI2ZE9UXV1bn2hf7zGEb4IB
         jdjmHL1ykVSDQby0CBGDDXuzNeEmDhYAKzUvCND9jEEaNTEwlw8lbV7595CjE9Qa6i7z
         4RMQ==
X-Gm-Message-State: AOJu0YxO1HEha/M9tzzePi7zbhO7Pb/WSdZBRqxhQwxRIuUUA1F9WoF9
	HuQzAwKbd+Ld5yYsDR5S7TRQjCtZDd+PdFIaTfAohtGKfFUjXLO5RESp1dO5tFH/yE+AwiA8sJ4
	K4DHlztM=
X-Gm-Gg: AZuq6aK5qKemM/Ke1IUfhb4aNovSw3BozrxUuBtvLdebd4g3wgTNn/IN0BhhRqC5U/z
	E8BmNRplJ2AJH46HmWpX9wH2lWxPG7WmSVywQhZB0cG2pXc+DoGZ2LBB26YMU71RxzvA6WoZuHg
	EwoWgiz2djZJ66O9TjKSxlhEjMXEYxgN5KIG+USDfQhnlG4fbOTZvrD8SqPOFWu324u3z8JeGFN
	ZkMTN9+nE5apQDqSL3mt78wxwlxXFCed5eNUgrz1FDq+UFEAO09ceXY6HjEIhHgGyp3OTCsF6+g
	sdoMKMnfxjiITrwrgLGBt4uYUHGd3NwFEAjYNJmzaMOfqoSAmumvycQnGbzypjDzukAQJJKo8t4
	ZPWOJ59P5TPiQc/LkqSRQeoEM5ZIJA1UlXpMOmOWpm/tE2cDEOkfCzrt6JJ3dQR5FAUjl3YqIT4
	QfL2lxfcv4ceJFG2rK7tdOeom9M+vuK6FjJtNqGWfzbVOJJhE91tH9wCx85t3IxOXSel5hAvbjo
	nRQe627laL/7T0=
X-Received: by 2002:a05:6000:4211:b0:435:92d3:d9b4 with SMTP id ffacd0b85a97d-43629378f8cmr17091369f8f.26.1770629357529;
        Mon, 09 Feb 2026 01:29:17 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:17 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/25] Patch review
Date: Mon,  9 Feb 2026 10:28:43 +0100
Message-ID: <cover.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230751

Please review this set of changes for scarthgap and have comments back by
end of day Wednesday, February 11.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3183

The following changes since commit d50e4680ed6f930582d907b37c9ed545a89f5c27:

  build-appliance-image: Update to scarthgap head revision (2026-01-26 09:50:47 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Adarsh Jagadish Kamini (1):
  python-urllib3: Backport fix for CVE-2026-21441

Amaury Couderc (1):
  curl: patch CVE-2025-14524

Ankur Tyagi (2):
  ffmpeg: upgrade 6.1.3 -> 6.1.4
  ffmpeg: ignore CVE-2025-25469

Benjamin Robin (Schneider Electric) (1):
  meta/classes: fix missing vardeps for CVE status variables

Daniel Turull (1):
  improve_kernel_cve_report: add script for postprocesing of kernel CVE
    data

Fred Bacon (1):
  lighttpd: Fix trailing slash on files in mod_dirlisting

Hitendra Prajapati (1):
  curl: fix CVE-2025-10148

Hugo SIMELIERE (1):
  libtasn1: Fix CVE-2025-13151

Ken Kurematsu (1):
  libtheora: set CVE_PRODUCT

Khai Dang (1):
  docbook-xml-dtd4: fix the fetching failure

Peter Marko (12):
  expat: patch CVE-2026-24515
  expat: patch CVE-2026-25210
  glib-2.0: patch CVE-2026-0988
  libpng: patch CVE-2026-22695
  libpng: patch CVE-2026-22801
  libxml2: patch CVE-2026-0989
  libxml2: patch CVE-2026-0990
  libxml2: patch CVE-2026-0992
  libxml2: add follow-up patch for CVE-2026-0992
  python3: patch CVE-2025-13837
  zlib: ignore CVE-2026-22184
  glibc: stable 2.39 branch updates

Richard Purdie (1):
  pseudo: Update to 1.9.3 release

Vijay Anusuri (1):
  inetutils: Fix CVE-2026-24061

 meta/classes/create-spdx-2.2.bbclass          |   1 +
 meta/classes/create-spdx-3.0.bbclass          |   2 +
 meta/classes/cve-check.bbclass                |   1 +
 meta/classes/vex.bbclass                      |   1 +
 .../inetutils/CVE-2026-24061-1.patch          |  41 ++
 .../inetutils/CVE-2026-24061-2.patch          |  85 ++++
 .../inetutils/inetutils_2.5.bb                |   2 +
 .../expat/expat/CVE-2026-24515-01.patch       |  43 ++
 .../expat/expat/CVE-2026-24515-02.patch       | 117 +++++
 .../expat/expat/CVE-2026-25210-01.patch       |  27 +
 .../expat/expat/CVE-2026-25210-02.patch       |  38 ++
 .../expat/expat/CVE-2026-25210-03.patch       |  28 ++
 meta/recipes-core/expat/expat_2.6.4.bb        |   5 +
 .../glib-2.0/glib-2.0/CVE-2026-0988.patch     |  58 +++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   1 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 meta/recipes-core/glibc/glibc_2.39.bb         |   2 +-
 .../libxml/libxml2/CVE-2026-0989.patch        | 309 ++++++++++++
 .../libxml/libxml2/CVE-2026-0990.patch        |  76 +++
 .../libxml/libxml2/CVE-2026-0992-01.patch     |  49 ++
 .../libxml/libxml2/CVE-2026-0992-02.patch     | 323 ++++++++++++
 .../libxml/libxml2/CVE-2026-0992-03.patch     |  33 ++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |   5 +
 meta/recipes-core/zlib/zlib_1.3.1.bb          |   1 +
 .../docbook-xml/docbook-xml-dtd4_4.5.bb       |  10 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   4 +-
 .../python3-urllib3/CVE-2026-21441.patch      | 105 ++++
 .../python/python3-urllib3_2.2.2.bb           |   1 +
 .../python/python3/CVE-2025-13837.patch       | 162 ++++++
 .../python/python3_3.12.12.bb                 |   1 +
 .../lighttpd/0001-mod_dirlisting.patch        |  48 ++
 .../lighttpd/lighttpd_1.4.74.bb               |   1 +
 .../ffmpeg/ffmpeg/CVE-2024-35365.patch        |  62 ---
 .../ffmpeg/ffmpeg/CVE-2024-36618.patch        |  36 --
 .../ffmpeg/ffmpeg/CVE-2025-1594.patch         | 105 ----
 .../{ffmpeg_6.1.3.bb => ffmpeg_6.1.4.bb}      |   7 +-
 .../libpng/files/CVE-2026-22695.patch         |  77 +++
 .../libpng/files/CVE-2026-22801.patch         | 173 +++++++
 .../libpng/libpng_1.6.42.bb                   |   2 +
 .../libtheora/libtheora_1.1.1.bb              |   2 +
 .../curl/curl/CVE-2025-10148.patch            |  57 +++
 .../curl/curl/CVE-2025-14524.patch            |  44 ++
 meta/recipes-support/curl/curl_8.7.1.bb       |   2 +
 .../gnutls/libtasn1/CVE-2025-13151.patch      |  30 ++
 .../recipes-support/gnutls/libtasn1_4.20.0.bb |   1 +
 scripts/contrib/improve_kernel_cve_report.py  | 467 ++++++++++++++++++
 46 files changed, 2431 insertions(+), 216 deletions(-)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-1.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-03.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-01.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-03.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13837.patch
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirlisting.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-35365.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-36618.patch
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-1594.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_6.1.3.bb => ffmpeg_6.1.4.bb} (98%)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-22801.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-10148.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch
 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch
 create mode 100755 scripts/contrib/improve_kernel_cve_report.py


