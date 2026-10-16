Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22382CCF2C1
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:51:43 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.266.1792191095281076770
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 15:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=x38hDafD;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so5306345e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 15:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792191093; x=1792795893; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oz/2TrEBhUcOSxK1AkJmNn02zRmUOI+NAkrhIlZWjbM=;
        b=x38hDafDBB+hbOWkrmSNY9l7+HXhK1Qx58N+iwfPFdei4LgwGQE7S+hKMNzWlV1qEg
         wmA6U6AZ8S6llEv7hGEVtdJOHsDwyWjyl5BEakB0wG65clNWncfRh43rGRjUnGaC3TRo
         D/XNoOVzxeu11ermsgXjIBTIdpf0p7JzRBVyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792191093; x=1792795893;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oz/2TrEBhUcOSxK1AkJmNn02zRmUOI+NAkrhIlZWjbM=;
        b=jJQkXZH8Nm81OLMlOPg4WvQlU4TDKEeQerourjG7kDRvqyvMAx+wz5vcLowNVpR+GB
         pBMUeWBkR6o36bMVCj7QkWogv8WeoyY7E/F/V/ll9oE14snA/kcmR5c7q0baumYxxFfH
         xNWkkAuEnzqOAQENgHAD/8deQmTO6wWaLBXz6NrX0TVaEdPaJpntQf8VAkYQoxx5XGGu
         Eb619dtx7Cz4vKQnlsD+LaBdAbZJyyYFzTMPDcGbG5foVQ9/xUmSpWqxTorJJb5Yc83s
         M3STG0uoYaGoRExo1PtJdcvP+XsP3QIJzpm8ulAvmEGfQvZjtsWXnYPXtjI/cSiu+A7a
         0Gog==
X-Gm-Message-State: AFq9FYIvueAhoufUXvxqCrdMcp4jjHygy7CbxdikFc8YS9QzltrfEN7e
	tmMpFbKq/dP3azYSGnq6QkfgVysH8YX7LuwV9pRzsMp+EptYAdSGXXBHd67jUCdLeBsdSnpFSUP
	6aLRwXnc=
X-Gm-Gg: AYBFou2iRaZU1zuAVYIGoQ8tUA8b10SnfvUXR9fFnehcqyFeaYYk6iQm4myWpbfCFMJ
	SNyMnpTJwtmnsU8u6g9NTHIYiQktU5rW8wPxn/8wAPM1T4KATZdyUYpNucmNww9gfL3zMqTlk4a
	uH4lENdXBnDr+b07ZZfaHe2rXeBB2ZdXsen0YyKpkeB3XVFufURo4m7cLnBWgN+plLCO/F8Vd2A
	8oETzFR0UMJiJxie4yBk4TcD1LENSKsFCj4NyrBMAhZheMmj35AszElJ+0YzqTGOz6BXjeZFbsY
	RIH53NX8EERk4n21Y6E67lAJBxHkZIeGOKojphrtrDJLZSggAu6QN664OQrczuhdiQfTCV6tNoy
	bHj98HLVje7CGkWtTSOohkL0xFnO+CHggm42bBCwWyTGBmyfMMYz7Ew4GNlyM/C9FDlyvW2Y9ll
	FEgm3UIoKPxjkiq/SJFVQZXHjTXLuLziMHAmeXpB0eXb5KKGHPlmhx9fId/qw8pnCvtAY1aKyGo
	jg1AWKiGO+mHAfqKllWo/wwi9hpTaIPNhcOHPJVKslGY3zeL/f4E31D2PCJlMopyTyTnmET4A==
X-Received: by 2002:a05:600c:8b29:b0:4a1:d456:ddc8 with SMTP id 5b1f17b1804b1-4a1d7bc2dc9mr26539435e9.7.1792191093305;
        Fri, 16 Oct 2026 15:51:33 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf983b88sm77484855e9.7.2026.10.16.15.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:51:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/55] Pull request (cover letter only)
Date: Sat, 17 Oct 2026 00:51:20 +0200
Message-ID: <cover.1792190972.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248068

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1792020605.git.yoann.congal@smile.fr/
(no change, no review)

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4934
* reproducible failed with #15898 – New sstate.yp.org CDN revealed partial sstate reproducibility tests false-positive error
  But the test warns about a missing sstate object from the reproducibleB
  build that is supposed to rebuild everything anyway, then, rebuilds the
  recipe. So, there is no issue with the series.


The following changes since commit b4f06303e55c7270a8482a610927a1c41d5dbf9c:

  build-appliance-image: Update to scarthgap head revisions (2026-10-07 16:20:29 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

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


