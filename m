Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7D1C5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:57:41 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10400.1787155057460548016
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UjkbhaKe;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47fde295992so39901f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155056; x=1787759856; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SN8rlhmU2tcwoAN3DvNjctgfr+XIpQqfZ/q4AQlNGrs=;
        b=UjkbhaKe91qzqxN0JgJjESIind3tPGXGzYPUVKIfpngr9p0qia03O5CC46eFpRV1lC
         hY2LOvO+ocft6kC8Yu+VZfLr9WVGA9loScHWurLikbZ+CEsHB/ufSgAdnRoqowVm91xL
         uA4fYATBUZkWcFFaLjfm0VaSSR9Zu8muE90ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155056; x=1787759856;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SN8rlhmU2tcwoAN3DvNjctgfr+XIpQqfZ/q4AQlNGrs=;
        b=N5U02GulWIV+Jadcgn9BXOpyNplkTeCoVD9P7Bh3pb6u7CvBbX2YBqpOChcyRx6hmR
         Aiw5cRu4q9fWWb946ZJBaOfTlYcsswbF4uwdEqxBVCcdv9spwwEKf0NqFnTLcwXooe/P
         3Cfv8EZWvNolxYIjkD8kxBJDEJO6KLaY5BF8tqZGwDzx+hw5w259Ia4WSTjRQ2hqHHsx
         QzyktMrrWds9Gerzw5nCbtHN7OHJzvB5DntYF23zaAd/UkvE83gXkTCZghRo6NU/rnfF
         cAfi4go3ofZl19F0NFvCGxpZA9y1j3R1908zoRkSvyH+9IWZ9+rTethF0GvHm1UAg7Xv
         1A+Q==
X-Gm-Message-State: AFuF++lnGFauFPeyqe5DG0aGwDoKUPxd7DYakPgyLcVCUaLJTHwbGM4C
	kyobW3aG6975XRCpQWsTdV8QS/yyaLXDmWTr0VjEF37m++AlO0qvVZFVsFoy3gGtYDyPKfv2CMr
	MYKjm9Ro=
X-Gm-Gg: AR+sD13AsTjieH0e96BNYlkWVlA/vLxbpoUSIWPYRgL0NUhrT0D79NTKwQsRLjGlPK4
	VImkH+oCbAPR8EfUT1ob+ClgIYvEYFkn0vmM0hD/N8nDHkdZuas0fMxbL3KxytXgAnRPPS76R2/
	ssStEtKAevAoOyLpmVYBlWtKL6nEbsR7TfIJZFhQGRzdfliLyT+Bde9l2Ctiq2NioZwQk1P0VQF
	2kJKnhq/T8DnNoZEWCO+2jovUjqvjvGV01r6n7oq7ZxQBNTp3+hZjwVHkIofNJAq80xMDJSG6Dc
	PLTiky45Axv5vzQvLssp1A6DrkbgFDovzfnsYecRX6S9r+d3Fi+5D6CQvJDPaqZ8fkOt0oUDA5g
	4SlaLEp7JorwkbYDEwCh3BLISYfCLpbPiTu0ssLJHjCBD1G3Ji4W0KJ+8Sp2hlcfDkOcidKnpxz
	GtQNu+SlLf3mn63FMYENmwCo8m82lN6XlMH3NWqCfReTZ03n+DorzHQ//fDv9+gz6pxDXFmA4AB
	UOfmFrdjZ3hJyFHW34Dk3mgq8DYoQmJxn5lrp+om3m0fW3FvCsGMrHTwEgcWGjpTxu0yChpYaEz
	6dwtGcfpd4+kNl8xQ0k/e4cFqboQneDif5+rJIWo
X-Received: by 2002:a05:6000:230f:b0:481:562d:6fb1 with SMTP id ffacd0b85a97d-482b782c84fmr264067f8f.6.1787155055515;
        Wed, 19 Aug 2026 08:57:35 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:34 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/37] Patch review
Date: Wed, 19 Aug 2026 17:56:31 +0200
Message-ID: <cover.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:57:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243736

Please review this set of changes for scarthgap and have comments back by
end of day Friday, August 21.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4516
* The 2 warnings about ptest-curl are under investigation

The following changes since commit 1ba3cd7c884dc6c3d78c6bedc15e081f5000c8c9:

  ref-manual/variables.rst: document the QB_DEFAULT_BIOS variable (2026-08-13 12:33:22 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib stable/scarthgap-nut
  https://git.yoctoproject.org/poky-contrib/log/?h=stable/scarthgap-nut

for you to fetch changes up to 7bc6442a1f83593427a502bbb924a3f91b4a0456:

  linux-yocto/6.6: update to v6.6.147 (2026-08-19 13:48:46 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  gnutls: fix CVE-2026-3833

Alexander Kanavin (1):
  perf: drop newt from tui build requirements

Amaury Couderc (1):
  python3: fix CVE-2026-7210

Bruce Ashfield (1):
  linux-yocto/6.6: update to v6.6.147

David Nyström (1):
  libssh2: Fix CVE-2025-15661

Deepak Rathore (15):
  expat: fix CVE-2026-56403
  expat: fix CVE-2026-56408
  expat: fix CVE-2026-56404
  expat: fix CVE-2026-56405
  expat: fix CVE-2026-56410
  expat: fix CVE-2026-56406
  expat: fix CVE-2026-56409
  expat: fix CVE-2026-56411
  expat: fix CVE-2026-56407
  expat: fix CVE-2026-56132
  curl: fix CVE-2026-5545
  curl: fix CVE-2026-6253
  curl: fix CVE-2026-6429
  curl: fix CVE-2026-7168
  curl: fix CVE-2026-4873

Himanshu Jadon (1):
  python3-pip: set CVE_PRODUCT

Jaipaul Cheernam (4):
  libssh2: fix CVE-2026-66032
  libssh2: fix CVE-2026-66033
  libssh2: fix CVE-2026-66034
  libssh2: fix CVE-2026-66035

Maik Otto (1):
  u-boot: Set CVE_PRODUCT

Marta Rybczynska (1):
  flex: update CVE_PRODUCT

Peter Marko (5):
  xserver-org: update CVE_PRODUCT
  shadow: set CVE_PRODUCT
  sudo: set CVE_PRODUCT
  busybox: patch CVE-2026-38754
  libsndfile1: patch CVE-2026-37555

mark.yang (5):
  python3-pyopenssl: set CVE_PRODUCT
  python3-idna: set CVE_PRODUCT
  python3-certifi: set CVE_PRODUCT
  python3-xmltodict: set CVE_PRODUCT
  python3-pyyaml: set CVE_PRODUCT

 meta/recipes-bsp/u-boot/u-boot.inc            |   2 +
 .../busybox/busybox/CVE-2026-38754.patch      | 155 +++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |   1 +
 .../expat/expat/CVE-2026-56132_p1.patch       |  80 ++++
 .../expat/expat/CVE-2026-56132_p2.patch       |  60 +++
 .../expat/expat/CVE-2026-56132_p3.patch       |  74 +++
 .../expat/expat/CVE-2026-56132_p4.patch       |  60 +++
 .../expat/expat/CVE-2026-56132_p5.patch       |  56 +++
 .../expat/expat/CVE-2026-56403_p1.patch       |  81 ++++
 .../expat/expat/CVE-2026-56403_p2.patch       |  52 +++
 .../expat/expat/CVE-2026-56404.patch          |  45 ++
 .../expat/expat/CVE-2026-56405.patch          |  30 ++
 .../expat/CVE-2026-56406-dependent.patch      |  59 +++
 .../expat/expat/CVE-2026-56406.patch          |  34 ++
 .../expat/expat/CVE-2026-56407.patch          |  41 ++
 .../expat/expat/CVE-2026-56408.patch          |  29 ++
 .../expat/expat/CVE-2026-56409.patch          |  51 +++
 .../expat/expat/CVE-2026-56410_p1.patch       |  46 ++
 .../expat/expat/CVE-2026-56410_p2.patch       |  39 ++
 .../expat/expat/CVE-2026-56411.patch          |  50 +++
 meta/recipes-core/expat/expat_2.6.4.bb        |  17 +
 meta/recipes-devtools/flex/flex_2.6.4.bb      |   2 +-
 .../python/python3-certifi_2024.2.2.bb        |   2 +
 .../python/python3-idna_3.7.bb                |   2 +
 .../python/python3-pip_24.0.bb                |   2 +
 .../python/python3-pyopenssl_24.0.0.bb        |   1 +
 .../python/python3-pyyaml_6.0.1.bb            |   2 +
 .../python/python3-xmltodict_0.13.0.bb        |   2 +
 .../python/python3/CVE-2026-7210.patch        | 148 ++++++
 .../python/python3_3.12.13.bb                 |   1 +
 meta/recipes-extended/shadow/shadow.inc       |   2 +
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb   |   2 +
 .../xorg-xserver/xserver-xorg.inc             |   2 +-
 .../linux/linux-yocto-rt_6.6.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  28 +-
 meta/recipes-kernel/perf/perf.bb              |   5 +-
 .../libsndfile1/CVE-2026-37555.patch          |  44 ++
 .../libsndfile/libsndfile1_1.2.2.bb           |   1 +
 .../curl/curl/CVE-2026-4873.patch             |  58 +++
 .../curl/curl/CVE-2026-5545.patch             |  42 ++
 .../curl/curl/CVE-2026-6253.patch             | 392 ++++++++++++++++
 .../curl/curl/CVE-2026-6429.patch             | 367 +++++++++++++++
 .../curl/curl/CVE-2026-7168.patch             | 425 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   5 +
 .../gnutls/gnutls/CVE-2026-3833.patch         |  90 ++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   1 +
 .../libssh2/libssh2/CVE-2025-15661-1.patch    |  45 ++
 .../libssh2/libssh2/CVE-2025-15661-2.patch    | 131 ++++++
 .../libssh2/libssh2/CVE-2025-15661-3.patch    |  57 +++
 .../libssh2/libssh2/CVE-2026-66032.patch      |  36 ++
 .../libssh2/libssh2/CVE-2026-66033.patch      |  45 ++
 .../libssh2/libssh2/CVE-2026-66034.patch      |  40 ++
 .../libssh2/libssh2/CVE-2026-66035.patch      |  56 +++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |   7 +
 55 files changed, 3091 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-38754.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56404.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56405.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56407.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56408.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56409.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56411.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-37555.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-4873.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5545.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6253.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-7168.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2025-15661-1.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2025-15661-2.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2025-15661-3.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66032.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66033.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66035.patch


