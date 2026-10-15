Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696EFCC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:03:40 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32812.1792040619352213250
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EAR8NI2l;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso3506132f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040617; x=1792645417; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tTBgMX9wnLgAsmvMRUCyAPoVqW1Ybi2NYDEfD0BV1Ac=;
        b=EAR8NI2ls0fRhL0S2mITcHlBttFMS1BsUIv34PlaR8y+ZWfjQEEkHkOs8eavjzXPLQ
         9eIuEvhllDgzdV5zM+PlXpq4S3f8swdIY5A+KOZYF2y91ENgBYX39xHnIyv/2dRIEEOp
         CFKTGYAuhyLFlkXFc6lIQaRKa5srwTMFUOsSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040617; x=1792645417;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tTBgMX9wnLgAsmvMRUCyAPoVqW1Ybi2NYDEfD0BV1Ac=;
        b=fI69hRTQo2bEe4fQE9C1DjxU8DytJgdOwbkq02MASX7a2S9snRW3qK1+l+sV+VGl8p
         6O9Jv5faQuHQjlwKrQVi74aYTLU42asGI/e0N7Y8XUwlmMwyfqqSHlO2F7PxsoX4zQn1
         rnkNj4QXnzFLAK3xuNKAFMhiRc7z0It+vuBZ6/cEPyWhUJiYzcDTgeY5sfZ2an8RGKvi
         e8VXkEcCAVK099dRMgjmyzpsdfxsBdZ/LoRYCvBbs2E108G6j97ih/oAG68BvLgIaB3f
         2O6wm527jOGVj/m8wSQ6QHLf3u8qOu0aKgn2cHK7Yhdny6aRcktr+/TR+DMEPHWHkh4d
         3UPg==
X-Gm-Message-State: AFq9FYJSPD0grPZJCPNOfgvnyyA7RoReY5k4SbMgAKJ7Zebep8Bc/A5e
	ZxEVIKvwzw9AN3w3pi3hI8/NVmPQhqRCciR72jdIy5qLeOux5eb86oh8HLw+s3EfN6xJHMCu5zc
	viQ8MWn4=
X-Gm-Gg: AYBFou0z8RwA4OVqxkVmb3YXwqOQsETtE7zlaBFDq/AFeQ+C1XHYVy98zo5Sbtq1KkI
	YPmOtooMEeXIYXBgQep9M3Xs3l0sYpMAP/0R8tVJfpzwmmuL3ld1ACdYmBeTaRKtv47lJIE6X83
	1ciVoUlCBZyRhRBCCfZFXw64m0YKsmzw9A+3JHXIGLGG9zxT8yvrAuZYaw+KskfzBauQxeWJntx
	ZZRue8dCCXLKmoX142lk7ezKtsban4IeBCMbiCqgmpfxHk8g8/RmKPNbDwzS2Rw0hFHOZwTOuOc
	Ecq3rbwbRgawoM8uDZsi17hO5gAlgzXz5N17mA5xGdaGuBGfIVuNDwdmuJ+Hi6L/s3eijgxdVwx
	bASYLZ9bRMellNXDX067hiXzoCCGyTBU6T4lriryjjrD5RWa0qAW9tWkBLB82XZyM0SwRs8obI8
	uhijaVcgh27LDmPZPYRYummvK8xPVRogVSvWfTBXxQXb2meEXVCifEdEu+jUEoK9YfT+wJoKgr8
	9SdiZb4niec9rBIKW4eHiGvToL8NUa5EmwAaacNegM2Ra0FdJ2vMM+dMEtAPWWlUZpaXIx0BsQ=
X-Received: by 2002:a05:600c:1e24:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4a18e49310amr358364685e9.5.1792040617011;
        Wed, 14 Oct 2026 22:03:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/55] Patch review
Date: Thu, 15 Oct 2026 07:02:23 +0200
Message-ID: <cover.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247799

Please review this set of changes for scarthgap and have comments back by
end of day Friday, October 16.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4934
* reproducible failed with #15898 – New sstate.yp.org CDN revealed partial sstate reproducibility tests false-positive error
  But the test warns about a missing sstate object from the reproducibleB
  build that is supposed to rebuild everything anyway, then, rebuilds the
  recipe. So, there is no issue with the series.

The following changes since commit b4f06303e55c7270a8482a610927a1c41d5dbf9c:

  build-appliance-image: Update to scarthgap head revisions (2026-10-07 16:20:29 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-review
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-review

for you to fetch changes up to c9b000059a37241c5b97426f0aadc012b13bd20f:

  python3-click: fix CVE-2026-7246 (2026-10-14 18:37:11 +0200)

----------------------------------------------------------------

Babanpreet Singh (3):
  devtool: standard: fix update-recipe/finish --initial-rev override
  oeqa/selftest/devtool: cover update-recipe --initial-rev
  qemu: restore 64-bit file lock handling for 32-bit guests

Darsh Kelaiya (2):
  python3-py: ignore CVE-2022-42969
  python3-click: fix CVE-2026-7246

Devansh Patel (5):
  curl: set CVE_STATUS for CVE-2026-9547
  curl: set CVE_STATUS for CVE-2026-12064
  curl: fix CVE-2026-8286
  curl: ignore CVE-2026-8924
  python3-py: correct CVE_PRODUCT mapping

Gaël PORTAY (1):
  connman: fix syslog identity with glibc

Hetvi Thakar (13):
  libxml2: Fix CVE-2026-86137
  libxml2: Fix CVE-2026-86138
  libxml2: mark CVE-2026-86139 fixed
  libxml2: Fix CVE-2026-86140
  libxml2: Fix CVE-2026-86141
  libxml2: Fix CVE-2026-86142
  libxml2: Fix CVE-2026-86143
  libxml2: Fix CVE-2026-86144
  vim: set CVE_STATUS for CVE-2026-51400
  vim: set CVE_STATUS for CVE-2026-51401
  openssh: fix CVE-2026-73283
  openssh: fix CVE-2026-73282
  openssh: fix CVE-2026-73281

Jaipaul Cheernam (7):
  libpcap: Fix CVE-2026-0799
  libpcap: Fix CVE-2026-31912
  libpcap: Fix CVE-2026-31911
  libpcap: Fix CVE-2026-6244
  libpcap: Fix CVE-2026-6554
  libpcap: Fix CVE-2026-18313
  libpcap: Fix CVE-2026-18238

Jakub Szczudlo (Nokia) (5):
  gnutls: fix CVE-2026-42012
  gnutls: fix CVE-2026-42013
  gnutls: fix CVE-2026-42014
  gnutls: fix CVE-2026-42015
  gnutls: fix CVE-2026-5260

Peter Marko (14):
  libpng: patch CVE-2026-33416 regression
  dhcpcd: set status for CVE-2026-56116
  mesa: patch CVE-2026-40393
  systemd: patch CVE-2026-4105
  libsolv: patch CVE-2026-48863
  expat: patch CVE-2026-66046 and CVE-2026-76641
  expat: patch CVE-2026-76956
  expat: patch CVE-2026-76957
  expat: patch CVE-2026-93990
  openssh: set status for CVE-2026-55653
  openssh: set status for CVE-2026-55655
  openssh: set status for CVE-2026-55654
  alsa-lib: patch CVE-2026-90781
  openssl: upgrade 3.5.8 -> 3.5.9

Rohini Sangam (1):
  gstreamer1.0-plugins-bad: Security fix for CVE-2026-3082

Ross Burton (1):
  libaio: update SRC_URI

Suresh H A (1):
  systemd: replace a bunch of assert() with friendlier checks

Vijay Anusuri (2):
  python3: upgrade 3.12.14 -> 3.12.15
  tzdata/tzcode-native: upgrade 2026c -> 2026d

 meta/lib/oeqa/selftest/cases/devtool.py       |  27 +-
 .../connman/connman_1.42.bb                   |   5 +-
 .../dhcpcd/dhcpcd_10.0.6.bb                   |   2 +
 .../libpcap/libpcap/01-CVE-2026-0799.patch    |  67 ++
 .../libpcap/libpcap/02-CVE-2026-31912.patch   | 591 ++++++++++++++++++
 .../libpcap/libpcap/03-CVE-2026-31911.patch   |  47 ++
 .../libpcap/libpcap/04-CVE-2026-6244.patch    |  49 ++
 .../libpcap/libpcap/05-CVE-2026-6554.patch    |  92 +++
 .../libpcap/libpcap/06-CVE-2026-18313.patch   |  84 +++
 .../libpcap/libpcap/07-CVE-2026-18238.patch   | 222 +++++++
 .../libpcap/libpcap_1.10.4.bb                 |   7 +
 .../openssh/openssh/CVE-2026-73281.patch      |  76 +++
 .../openssh/openssh/CVE-2026-73282.patch      |  80 +++
 .../openssh/openssh/CVE-2026-73283.patch      |  42 ++
 .../openssh/openssh_9.6p1.bb                  |   6 +
 .../{openssl_3.5.8.bb => openssl_3.5.9.bb}    |   2 +-
 .../expat/expat/CVE-2026-66046-01.patch       | 107 ++++
 .../expat/expat/CVE-2026-66046-02.patch       |  90 +++
 .../expat/expat/CVE-2026-76641.patch          | 160 +++++
 .../expat/expat/CVE-2026-76956.patch          |  26 +
 .../expat/expat/CVE-2026-76957-01.patch       | 121 ++++
 .../expat/expat/CVE-2026-76957-02.patch       |  85 +++
 .../expat/expat/CVE-2026-93990-01.patch       | 191 ++++++
 .../expat/expat/CVE-2026-93990-02.patch       | 328 ++++++++++
 meta/recipes-core/expat/expat_2.8.3.bb        |   8 +
 .../libxml/libxml2/CVE-2026-86137.patch       |  63 ++
 .../libxml/libxml2/CVE-2026-86138.patch       |  52 ++
 .../libxml/libxml2/CVE-2026-86140.patch       |  56 ++
 .../libxml/libxml2/CVE-2026-86141.patch       |  35 ++
 .../libxml/libxml2/CVE-2026-86142.patch       |  40 ++
 .../libxml/libxml2/CVE-2026-86143.patch       |  96 +++
 .../libxml/libxml2/CVE-2026-86144.patch       | 225 +++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  12 +
 ...a-bunch-of-assert-with-friendlier-ch.patch | 108 ++++
 .../systemd/systemd/CVE-2026-4105.patch       |  32 +
 meta/recipes-core/systemd/systemd_255.22.bb   |   2 +
 .../CVE-2026-7246-regression.patch            | 124 ++++
 .../python/python3-click/CVE-2026-7246.patch  | 201 ++++++
 .../python/python3-click_8.1.7.bb             |   6 +-
 .../python/python3-py_1.11.0.bb               |   3 +-
 ...{python3_3.12.14.bb => python3_3.12.15.bb} |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   3 +-
 ...all.c-drop-64-suffix-from-flock64-Co.patch | 225 +++++++
 ...ce-use-of-lfs64-related-functions-an.patch | 355 -----------
 ...-eliminate-other-explicit-LFS-usages.patch | 107 ++++
 .../recipes-extended/libaio/libaio_0.3.113.bb |   2 +-
 .../libsolv/libsolv/CVE-2026-48863.patch      |  25 +
 .../libsolv/libsolv_0.7.28.bb                 |   1 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../mesa/files/CVE-2026-40393-01.patch        | 126 ++++
 .../mesa/files/CVE-2026-40393-02.patch        | 119 ++++
 .../mesa/files/CVE-2026-40393-03.patch        | 103 +++
 .../mesa/files/CVE-2026-40393-04.patch        |  54 ++
 meta/recipes-graphics/mesa/mesa.inc           |   4 +
 .../alsa/alsa-lib/CVE-2026-90781.patch        |  41 ++
 .../alsa/alsa-lib_1.2.11.bb                   |   1 +
 .../CVE-2026-3082.patch                       |  46 ++
 .../gstreamer1.0-plugins-bad_1.22.12.bb       |   1 +
 .../libpng/files/CVE-2026-33416-05.patch      |  58 ++
 .../libpng/libpng_1.6.42.bb                   |   1 +
 .../curl/curl/CVE-2026-8286.patch             |  60 ++
 meta/recipes-support/curl/curl_8.7.1.bb       |   4 +
 .../gnutls/gnutls/CVE-2026-42012-pre1.patch   |  69 ++
 .../gnutls/gnutls/CVE-2026-42012-pre2.patch   | 162 +++++
 .../gnutls/gnutls/CVE-2026-42012-pre3.patch   | 129 ++++
 .../gnutls/gnutls/CVE-2026-42012.patch        |  48 ++
 .../gnutls/gnutls/CVE-2026-42013-pre1.patch   |  56 ++
 .../gnutls/gnutls/CVE-2026-42013.patch        |  74 +++
 .../gnutls/gnutls/CVE-2026-42014.patch        |  60 ++
 .../gnutls/gnutls/CVE-2026-42015.patch        |  43 ++
 .../gnutls/gnutls/CVE-2026-5260_p1.patch      |  69 ++
 .../gnutls/gnutls/CVE-2026-5260_p2.patch      |  33 +
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  10 +
 meta/recipes-support/vim/vim.inc              |   4 +
 scripts/lib/devtool/standard.py               |   4 +
 75 files changed, 5308 insertions(+), 367 deletions(-)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0799.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-31912.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-31911.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6244.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6554.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-18313.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-18238.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-73281.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-73282.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-73283.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.5.8.bb => openssl_3.5.9.bb} (99%)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-66046-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-66046-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-76641.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-76956.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-76957-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-76957-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-93990-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-93990-02.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86138.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86140.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86141.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86142.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86143.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86144.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-replace-a-bunch-of-assert-with-friendlier-ch.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-4105.patch
 create mode 100644 meta/recipes-devtools/python/python3-click/CVE-2026-7246-regression.patch
 create mode 100644 meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch
 rename meta/recipes-devtools/python/{python3_3.12.14.bb => python3_3.12.15.bb} (99%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-syscall.c-drop-64-suffix-from-flock64-Co.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-linux-user-syscall.c-eliminate-other-explicit-LFS-usages.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/CVE-2026-48863.patch
 create mode 100644 meta/recipes-graphics/mesa/files/CVE-2026-40393-01.patch
 create mode 100644 meta/recipes-graphics/mesa/files/CVE-2026-40393-02.patch
 create mode 100644 meta/recipes-graphics/mesa/files/CVE-2026-40393-03.patch
 create mode 100644 meta/recipes-graphics/mesa/files/CVE-2026-40393-04.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2026-3082.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-05.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8286.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre2.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre3.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42013-pre1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42013.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42014.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42015.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-5260_p2.patch


