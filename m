Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91257EE3685
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 13:27:54 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44854.1770902864984578050
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 05:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Zfn/xS1i;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-436e87589e8so4268942f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 05:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770902863; x=1771507663; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ugzOTjyFfBHfKt4yDXUFNR9NI+lc5hEg5SQ3FreXw+Y=;
        b=Zfn/xS1iyftRFZHI9vBayXXGMlNuAIYi+HVh9l+wQVE8yc92AOP6kOEhdlz3vCZLnE
         LcHQVo9pqi/sSuRYZjpEMXJ/q8m8CKFnU5WmRhvXc/JJjtoNGCsZmST/743ZxS0e1DUf
         yNj3t0l4i1owNpg5xhAargE50A4CYogiBMgO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770902863; x=1771507663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugzOTjyFfBHfKt4yDXUFNR9NI+lc5hEg5SQ3FreXw+Y=;
        b=Bi4lvKimmeKho258lKe7/C8KBYmzLNpllx3FfoOYKR2JF+4/vblDzq2PtLm41oOmZz
         eLGrqNZrMUUN/rc7j3cthruGpuOy45/Tz82CfNS63mYhDbuUQfs6Xgo8t/QJRjMTitlD
         dBIWZC0Z8lIW76lQpl0c6BJX7A+e1PPZTi1A6MQp0A/ozh/9c1j6A0iz1ihIIbgw4b0i
         wfCae5Jmvt/fPEZeK0iS+eaJ5D/BDE15Lo9nWj9CsvAlmDSwnrhcbLsWtZ/BxQmEQzNW
         73EGCcDGTFUIRzf6kEL9EFXHugGNkrCQowiEeo5WA/rQuc/NFAgSR58vT7qrcV9lxn8v
         nlwQ==
X-Gm-Message-State: AOJu0Yy7F+qeLQPaqI7a2+N5Y0UeOVj7kGJ9L4YJYt7rPxAx2JeCKmZF
	Y2WGz6qgf8LsjIo8Z+wxBBG/7OZtOFoXdqMZqsxgUjfuVSLNLTsYctqm7nxmBXP0cZpVTYC3cMy
	336Vs
X-Gm-Gg: AZuq6aKq6tjZPgV0bj8bv+2qu6Y/7Fp1JJ1DISMnt+V5IOO+nSeK0FEya6NFme5OmBj
	ZRDT2LKInkkC47EXKfSVd1rHngTjF9Sj2Y7ev2HnamEsENtHJwnTCgwcn93IY7wAZGnANg0LFhl
	591iQrMhlTT8zO0BPJjpNy9+V3pE/uHqlDWDfxVuKVmRCQDQCpoIEU26BtvzbdRu/8/lswQUGio
	AA4JiAgK1R6wBN7sbI+jaHOo1OXcriqjc3m1Ke/i+yXurQmIqqS70Rh95WLAYG1+4sjvcA7aF4M
	hHMu9wSuHYALq1UooIh7yLly1QEXMwHmYTWlJ1xwqRvlTdiRJ/f9RO417c221bWzfgFzZCVEDF2
	MKhlLPlCicN/bi+QRj11aqU1YD37Y5n1rWkhMTSEf+nVA0VeH6Dkuk6zJol4XakNRnDNLgEwobK
	6jtHzljlALW2P0P0Tf+8SR0bfg4TQGiSYhXogosVeDw7KBge/QYLDurug/0sJp4HF/ZQ3fTDlUs
	yfxVmbTZzcihrqFhTppADkUl2A=
X-Received: by 2002:a05:6000:2582:b0:430:fb00:108f with SMTP id ffacd0b85a97d-4378acf563emr5471405f8f.18.1770902862737;
        Thu, 12 Feb 2026 05:27:42 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa0091410e731fc6f0fa.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:9141:e73:1fc6:f0fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783e5c92fsm12853793f8f.38.2026.02.12.05.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 05:27:42 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/27] Pull request (cover letter only)
Date: Thu, 12 Feb 2026 14:27:29 +0100
Message-ID: <cover.1770901572.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 13:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231030

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1770626074.git.yoann.congal@smile.fr/T/#t
with the following modification:
* zlib: ignore CVE-2026-22184 was changed to a cherry-pick from master
  and needed commits backported:
  * zlib: cleanup CVE_STATUS[CVE-2023-45853]
  * zlib: Add CVE_PRODUCT to exclude false positives

Passed a-full on autobuilder (with AB-INT):
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3195
* The build qemuarm-oecore failed:
  https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/3140
  This was caused by bug #16143 – AB-INT: do_image_wic: tar command return exit status 2
* The build qemuarm-oecore was succesfully retried:
  https://autobuilder.yoctoproject.org/valkyrie/?#/builders/40/builds/3143

The following changes since commit d50e4680ed6f930582d907b37c9ed545a89f5c27:

  build-appliance-image: Update to scarthgap head revision (2026-01-26 09:50:47 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to 5f81d44ce98b9bfe905acf162b01b1b80f00ac27:

  libtheora: set CVE_PRODUCT (2026-02-10 16:40:35 +0100)

----------------------------------------------------------------

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

Het Patel (1):
  zlib: Add CVE_PRODUCT to exclude false positives

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

Yoann Congal (1):
  zlib: cleanup CVE_STATUS[CVE-2023-45853]

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
 meta/recipes-core/zlib/zlib_1.3.1.bb          |   6 +-
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
 46 files changed, 2434 insertions(+), 218 deletions(-)
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


