Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54988C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 22:15:48 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50968.1789164945469387799
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 15:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZJCKCs75;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso470045e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 15:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789164943; x=1789769743; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HBg2Gob3qAfOu19sELEQUyjLeE3yPkEZe12OaFxbaOo=;
        b=ZJCKCs75MHRBnHMuXXAecLPZ24Se9snViMUpW3h9WU5igFggDGMW3JbDNc5pfLesqb
         SjIy25Bpfei0q6rXfs3muTQk3Yv3w2GoLshwK2xwsTN8Q3BYpk4CIw5IVeys4jNGx9RQ
         19yxUrhAUjSjZ+c3U/BzAOiz1jHppl6AYulbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164943; x=1789769743;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBg2Gob3qAfOu19sELEQUyjLeE3yPkEZe12OaFxbaOo=;
        b=XU2nYTMb0Myu9YN4yHWyILPLYs45+2bDfyTp1u9l4UxIWDOupqkle3UtBnlHeZvqWo
         Hk0OP9uy65Fj8/5yBW4N5ZxqFcnLLi47NhZEloXo+xSp2TUHt25hPzuzZW/oKY/k4ckD
         71m0IjLb2Vyzo/AD0XFv7WT0txfmkzvYWbM2jzjUp+y9GeFTW3HOlW52pFRQWqYDsMTb
         oc0aRYTXlSh6Rjk8SFrq0/pEfWCIK8p1Sg5XqIi/d5NLu86q0UluBcPAVNDFzMaq1sot
         hV+JEo5r7MTMcBn8gYpsRFOHijP33th/kqFy5ST6Y0Wt7P8Jv6xG21KTXvLGaGXJfR1C
         jvOQ==
X-Gm-Message-State: AFuF++kXPzR82WrZa/JqyPX3LLxsDl563KZnTSFtr3L/wbXTBgLE1mFT
	MwKAafEKRP53Kz6vS4+qotpOKyOzpxDYGfiqzPvebgMqao8UMgNiUiGPynN7jZ99of25BmvnkgE
	5Rk+a6pI=
X-Gm-Gg: AYBFou395YL2SzM/Ky0ZzsuBNLEK2S29fABGNlFXMICznfBZJJhmYBLajAs4hxnTqdj
	boxYJS0B2ejuAok6ej5ePm98XnbSveNf5bYY+y1PDnAzzI/Hn5qIH2xxRokD6QJJ+mAFK4/chzl
	bgQKTKP71tYOxEWsuyLZZzjgUvKkMyWmDgTEc92BrrL2MJcjp1DTrIV0MF4+sL6RNK+2uF2ZrSq
	nIurkKY2lCDbtvum4/uL8zbMMzxHBgwLW8p0lM2Zysdp0mbLIkrfoEJCIlHKVzLpyI2pdtvK/rA
	x+sFMVliC+FImLFet8ToOqRCrJyHyUYW4grHB7Al0KpSoI1vTVgxMKm/Rw0Zel557XKEViG3/7G
	KjVILJgNKkIZQQ1p+yI9bxvOw5ng8b8JzzquhayX9dI/RTCVj34kL+oJHXYiQKEF8qCvSP1HXN2
	NNWw7uN51RwBoHFrxpbPyd5pX5iiYFHPdZxb85wbCECyAu6HqarSqhMtOjT9hhyn7kxSO7yD6Ij
	RKayL3oG2niQimX3f/bWA8poHOE8c/+kMLuFpgvTqDfruGB4YB6UEVMN4h/lf5NGQS+U9JFCTE=
X-Received: by 2002:a05:600c:3491:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-49e6cbfc8c1mr1088455e9.16.1789164943278;
        Fri, 11 Sep 2026 15:15:43 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm8434045e9.11.2026.09.11.15.15.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/13] Patch review
Date: Sat, 12 Sep 2026 00:14:54 +0200
Message-ID: <cover.1789163914.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 22:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245670

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, September 15.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4718
* oe-selftest-fedora fails with 16415 – AB-INT: github infrastructure issues
  I still need to backport fixes from master to wrynose, and then,
  scarthgap.
* qemuarm64-ptest failed with 16267 – [scarthgap] AB-INT PTEST: python3 failure (test_wrong_cert_tls13)
  retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4516
Note: this build was not rebased on the latest build-appliance update.


The following changes since commit bb166ac536daa43602ce8962cd3eb137783b8dc9:

  build-appliance-image: Update to scarthgap head revision (2026-09-11 14:32:15 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

for you to fetch changes up to e85367ebf673225c69694ee63679ea7620c4b420:

  u-boot, u-boot-tools: Fix CVE-2026-46728 (2026-09-11 17:32:37 +0200)

----------------------------------------------------------------

Daniel Turull (1):
  libarchive: mark CVE-2026-14164 as fixed-version

Darsh Kelaiya (1):
  python3-lxml: fix CVE-2026-41066

Deepak Rathore (2):
  binutils: fix CVE-2026-3441 and CVE-2026-3442
  binutils: fix CVE-2026-4647

Devansh Patel (1):
  u-boot: share CVE_PRODUCT with u-boot-tools

Gyorgy Sarvari (1):
  python3-py: set CVE_PRODUCT

Hetvi Thakar (4):
  python3-pip: Fix CVE-2026-8643
  go: Fix CVE-2026-33814
  go: Fix CVE-2026-39823
  u-boot, u-boot-tools: Fix CVE-2026-46728

Peter Marko (1):
  openssl: upgrade 3.5.7 -> 3.5.8

Vijay Anusuri (1):
  p11-kit: Fix CVE-2026-18938

Yoann Congal (1):
  linux-yocto/6.6: update CVE exclusions (6.6.151)

 .../u-boot/files/CVE-2026-46728.patch         |  379 ++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |    2 +
 .../u-boot/u-boot-tools_2024.01.bb            |    2 +
 meta/recipes-bsp/u-boot/u-boot.inc            |    2 -
 meta/recipes-bsp/u-boot/u-boot_2024.01.bb     |    1 +
 .../{openssl_3.5.7.bb => openssl_3.5.8.bb}    |    2 +-
 .../binutils/binutils-2.42.inc                |    2 +
 .../CVE-2026-3441_CVE-2026-3442.patch         |   51 +
 .../binutils/binutils/CVE-2026-4647.patch     |  228 +
 meta/recipes-devtools/go/go-1.22.12.inc       |    2 +
 .../go/go/CVE-2026-33814.patch                |   44 +
 .../go/go/CVE-2026-39823.patch                |  100 +
 .../python/python3-lxml/CVE-2026-41066.patch  |  262 +
 .../python/python3-lxml_5.0.2.bb              |    4 +-
 .../CVE-2026-8643-regression_p1.patch         |   34 +
 .../CVE-2026-8643-regression_p2.patch         |   69 +
 .../python/python3-pip/CVE-2026-8643.patch    |   79 +
 .../python/python3-pip_24.0.bb                |    3 +
 .../python/python3-py_1.11.0.bb               |    2 +
 .../libarchive/libarchive_3.7.9.bb            |    5 +
 .../linux/cve-exclusion_6.6.inc               | 4540 ++++++++++++++++-
 .../p11-kit/files/CVE-2026-18938.patch        |   52 +
 .../recipes-support/p11-kit/p11-kit_0.25.3.bb |    1 +
 23 files changed, 5787 insertions(+), 79 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2026-46728.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.5.7.bb => openssl_3.5.8.bb} (99%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-33814.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39823.patch
 create mode 100644 meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-8643-regression_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-8643.patch
 create mode 100644 meta/recipes-support/p11-kit/files/CVE-2026-18938.patch


