Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0856EEF99C9
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 18:47:35 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79038.1771008450627401108
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 10:47:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nBd563SK;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so10058855e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 10:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771008449; x=1771613249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yVjDG19vB2EkLmpMQ6M+ny2PqZSgt0NkgcqZaaYZoxc=;
        b=nBd563SKSK33Aa9hOVcBl0NBVYUxCEXoqDakuQBYAfoIm6z8rBU9h3tRBFEF7X+TDl
         35PU3QzJ3cNwJLhmKZLryDCngr0CYhgefDgu1rFrhT7+u3y3w2pDOS9fN8duPBlJqLEh
         Z8OsDJrXopOFV8PN1fGT81jdgWn/pvlCLrn/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771008449; x=1771613249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVjDG19vB2EkLmpMQ6M+ny2PqZSgt0NkgcqZaaYZoxc=;
        b=E0RxVJ6hW5y4QgSaxY8UEgORLSvL12vWRKHOy4frmwcvZfSAYIGYfiYPQslIeytsX2
         xgo+4e9yC7zswnvlYsPq0WGExF7dQUpSUp6Fb3xolsGZoRkaVeUBphu+KimHSJTOCpYI
         T3zlIoUtpmMHIhtM4jn43CC8nl/OwsQA52Z3i40MHAhqaXMaone9xmYWDheHv0ZnG8qq
         6kMd8/mE+oy6Ct3NhQUOQByHpH3/fwdE1+2CHXFVI7sqCk6Ikgo17kxQpEvh58EqrJgd
         7iDZBopkKGkZJKo/aZZ3k6Yag1l7SBGTuq/QWZClToM20H393wNP12kb7zjw/MifUXQl
         zYrg==
X-Gm-Message-State: AOJu0Yz3A3qPsx+A3IzJEwPsvkXAXPDZy4Qstv4CH+EjxY+Sde9sbKZ5
	HbIcqwTuxYyRAoH3XL0yTuOjJsjYj66J374gYykKFDviywOFl+HXZOQnPFoZPcb36lgV2rcGTdL
	g3ExY
X-Gm-Gg: AZuq6aJqwgCNukQ25C/P7/0NPAG/ryncLNZWIJuv+JicK3LsYtBdXryx//gv1TWMJyV
	PPYrhhdVybxSwlBfHkMH4nKvG2xP0t+k6gVNYYAlsfP3vd0EoWHnW0kpoFwIOVYvpX2nlP/J0Ib
	AnWv/5BE1+aSXaHhIDKUDjTxw0nRNyyJbkWBoSjd5ZO6KMgKheSeSmvKM/eK1r+GnEuDSgTFKJa
	oYM9Zq1uJ6gVrbfzNqlck5EPnP8qZRz4kjzJ1hgp59rW981ni8qzfl8r+aZb3MSTvvPPbquE2Qe
	AjaT5L+GZ7XFRYJhmu50Jukj4zB7DaX0ztfLbnr7TzJhbt5idyEauKNhSQACrnwKKq8z93XSb67
	7syZ5bcuSRKGncy2WnkS3EycI6mcP65tHybtMVJ+4GsxwlQsJuIRJV0IQFP82vy2iSOu6wvIx54
	nbl9MBAfOE0VYQd6xnObpEGdL8dRtUcoVY3Kc83RZdSI+G1457SJ+k2qhv9417O7FfDSE1S/x07
	JbosMYDFvHcUImTHk7foHGaSgc=
X-Received: by 2002:a05:600c:3b8b:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-4837104307amr75487865e9.3.1771008448666;
        Fri, 13 Feb 2026 10:47:28 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00d6f202ec534aee64.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d6f2:2ec:534a:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6b563sm7438910f8f.12.2026.02.13.10.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 10:47:28 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/28] Pull request (cover letter only)
Date: Fri, 13 Feb 2026 19:47:16 +0100
Message-ID: <cover.1771008295.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 18:47:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231137

This is mostly the same PR as
https://lore.kernel.org/openembedded-core/cover.1770901572.git.yoann.congal@smile.fr/T/#u
... with a added backported commit "pseudo: Update to include an openat2 fix"
to fix #16143 (AB-INT: do_image_wic: tar command return exit status 2)

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1770626074.git.yoann.congal@smile.fr/T/#t
with the following modification:
* zlib: ignore CVE-2026-22184 was changed to a cherry-pick from master
  and needed commits backported:
  * zlib: cleanup CVE_STATUS[CVE-2023-45853]
  * zlib: Add CVE_PRODUCT to exclude false positives
* pseudo: Update to include an openat2 fix

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3210

The following changes since commit d50e4680ed6f930582d907b37c9ed545a89f5c27:

  build-appliance-image: Update to scarthgap head revision (2026-01-26 09:50:47 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to 41fcd83622e6e20c0acf722e92f68ac59e321678:

  pseudo: Update to include an openat2 fix (2026-02-13 13:33:35 +0100)

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

Richard Purdie (2):
  pseudo: Update to 1.9.3 release
  pseudo: Update to include an openat2 fix

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


