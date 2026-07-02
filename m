Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02DEC43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 08:11:24 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64705.1782979869786604031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 01:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bP2R780b;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso1440817f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 01:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782979868; x=1783584668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oL4jaHIxMIz26rb8pj1cP8t9jAdE7SgZqljR9H7rPS0=;
        b=bP2R780bApmDdb5WoSv0hJP4wJnTEqtF6jSDSWQHVxGbbXs3kecqaUVoSNLCQJ6FFK
         tAChvmSIThPemvS9ytOFiY3vUmjQVUglZRYCLgM2MHQMYpvjCHFSstj1bom1zQkXXyWx
         R2rgYKhggzl3zKxM7HVdH90mbhBri/oOzuvbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979868; x=1783584668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oL4jaHIxMIz26rb8pj1cP8t9jAdE7SgZqljR9H7rPS0=;
        b=WlLrBWXRUnrED0Ay+lyh74cYbHRKNF4PjqXOJsIUuhgUdqVbF1nQWj5/o6K5sGH3VF
         N0QVGdfD1i4i8/ZkFzapvE635KMjlonJQU8P+Y0s0IU1dSwJtXV494Hz+cECbyz/b/bU
         aFXXVrDiXaw8QlViFlD6wfA9EPLHcGlY2r5LZ1/bl5Eq9aLtBXosqISNpULCrUO8XUZx
         rGXjN1Y/FVQVphZmB6CFcoOEaDxRB5WopTcG4FcbtPJSxSM2EKKhKGuGvYLSkqDiDP/0
         fNMKjX4wH8Uv4OCkbxXDFPDXhoRiYujMjLRDKeedhTclzYZs57r2gkzqGRiXHi4PrNO2
         n1FQ==
X-Gm-Message-State: AOJu0YzHc6zhaySHDF/B8DZUrcnTlQG9F4wJoKlIIArkEQY/rYw0IHWx
	8yZ1oJZ230xr7NoekABUZ1aLYxiUo71JtUabl7aerG6arZsdfF0WPVsBDsDsIPCw0yl27NK4Bhp
	UQhQ8C2Y=
X-Gm-Gg: AfdE7clGoJJjii4Eadv1xTOKusnA5NBHUhtaRod+swnnhnDPZLwhWP6E7kAk97YJd7/
	PdYyCt6ELMCcXijdqqktK79/jankaCgtSqvU1ICXrBULbAuHzDiOCCU3v5OH2eSflsQtlSLHRJ2
	swLSXdhVKgj3czmS0XElfo8rXl1kpFakQcmvT5tJ7aB431RfkAR9Vw9YXD53NDVjkht0nzuurUT
	PmmEBWCTCyMg9HPFgZfrOoS8JxS20npEC2ZasdiH8hPieW08Q05D+g14SWGsuoS4tneninbiZc8
	1KXiKYP1bZG2FhCeHtnzeHNeoXaj3gEIiQhj12wwxZvUuYAvVSqSGHEksMGF7EpujNNoZrQASG5
	nD4kcGKYuUMPJT9LhDBj3BKcJlTHZbx7pRCVMmkXi8/7/Pvs5Zuq4NPZ4AbNp0G8xVHXBhcNbkb
	uD3a3lBR03Af4uWXgIKrmeIKMuWMtQsMM+EkSLqJfd/5qOcNdmN9idE+fK7arEBhTPuLgwERYUG
	MpjNblOD/J+VwjG
X-Received: by 2002:a5d:5d09:0:b0:478:3f4b:348b with SMTP id ffacd0b85a97d-4783f4b365fmr2479411f8f.7.1782979867931;
        Thu, 02 Jul 2026 01:11:07 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dde19e8dsm6842022f8f.27.2026.07.02.01.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:11:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/17] Pull request (cover letter only)
Date: Thu,  2 Jul 2026 10:10:36 +0200
Message-ID: <cover.1782856910.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 08:11:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240023

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1782742373.git.yoann.congal@smile.fr/
Following review, 2 patches where removed from the series:
* binutils: Fix for CVE-2025-69648 and CVE-2025-69646
* cve-update-nvd2-native: allow setting resultsPerPage

Passed a-full on autobuilder (without the 2 patches):
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4113
* oe-selftest-debian failed with 15957 – AB-INT: concurrencytest errors
  retried as https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/4179

The following changes since commit 737293bead3e7b994347e47f09bc69437479d50c:

  linux-yocto/6.6: address ltp hang (2026-06-23 20:33:35 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to be8b46f3a31b679b5ab532dd6e16888f868ce076:

  recipetool: Recognise https://git. as git urls (2026-06-30 18:29:25 +0200)

----------------------------------------------------------------

Alexander Kanavin (1):
  gawk: use native gawk when building glibc and grub

Amaury Couderc (1):
  python3: fix CVE-2026-4224

Anil Dongare (1):
  libusb1: fix CVE-2026-23679 and CVE-2026-47104

Hitendra Prajapati (2):
  libsoup: fix for CVE-2025-11021
  libsoup: fix for CVE-2026-2369

Richard Purdie (3):
  grub/glibc: Bump versions to resolve hashequiv/reproducibility issues
  oeqa: Drop /git/ from our urls
  recipetool: Recognise https://git. as git urls

Ross Burton (1):
  gawk: trim native build configuration

Sudhir Dumbhare (1):
  nfs-utils: fix CVE-2025-12801

Theo Gaige (Schneider Electric) (1):
  go: patch CVE-2026-27145

Vijay Anusuri (5):
  xwayland: Fix CVE-2026-33999
  xwayland: Fix CVE-2026-34000
  xwayland: Fix CVE-2026-34001
  xwayland: Fix CVE-2026-34002
  xwayland: Fix CVE-2026-34003

Yoann Congal (1):
  gawk-native: fix gcc-15/C23 compilation issues

 .../recipes-test/gitrepotest/gitrepotest.bb   |   2 +-
 .../gitunpackoffline/gitunpackoffline.inc     |   4 +-
 .../lib/oeqa/manual/toaster-managed-mode.json |   6 +-
 meta/lib/oeqa/sdkext/cases/devtool.py         |   4 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   4 +-
 meta/lib/oeqa/selftest/cases/recipetool.py    |   2 +-
 meta/recipes-bsp/grub/grub2.inc               |   6 +-
 .../nfs-utils/CVE-2025-12801-build-fix.patch  |  44 ++
 .../CVE-2025-12801-dependent_p1.patch         | 450 +++++++++++++++++
 .../CVE-2025-12801-dependent_p2.patch         |  81 +++
 .../CVE-2025-12801-dependent_p3.patch         | 181 +++++++
 .../CVE-2025-12801-dependent_p4.patch         | 468 ++++++++++++++++++
 .../nfs-utils/nfs-utils/CVE-2025-12801.patch  | 254 ++++++++++
 .../nfs-utils/nfs-utils_2.6.4.bb              |   6 +
 meta/recipes-core/glibc/glibc.inc             |   6 +-
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-27145.patch                |  96 ++++
 .../python/python3/CVE-2026-4224.patch        | 121 +++++
 .../python/python3_3.12.13.bb                 |   1 +
 .../0001-Fix-some-C23-compilatio-issues.patch |  35 ++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |  15 +-
 .../xwayland/xwayland/CVE-2026-33999.patch    |  49 ++
 .../xwayland/xwayland/CVE-2026-34000.patch    |  72 +++
 .../xwayland/xwayland/CVE-2026-34001.patch    | 104 ++++
 .../xwayland/xwayland/CVE-2026-34002.patch    |  93 ++++
 .../xwayland/xwayland/CVE-2026-34003-1.patch  | 113 +++++
 .../xwayland/xwayland/CVE-2026-34003-2.patch  | 223 +++++++++
 .../xwayland/xwayland_23.2.5.bb               |   6 +
 .../libsoup-3.4.4/CVE-2025-11021.patch        |  57 +++
 .../libsoup/libsoup-3.4.4/CVE-2026-2369.patch |  32 ++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   2 +
 ...-2026-23679_CVE-2026-47104-dependent.patch |  46 ++
 .../CVE-2026-23679_CVE-2026-47104.patch       |  88 ++++
 meta/recipes-support/libusb/libusb1_1.0.27.bb |   2 +
 scripts/lib/recipetool/create.py              |   2 +-
 35 files changed, 2661 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-build-fix.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p1.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p2.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p3.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801-dependent_p4.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/CVE-2025-12801.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-27145.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4224.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/0001-Fix-some-C23-compilatio-issues.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2026-33999.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2026-34000.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2026-34001.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2026-34002.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2026-34003-1.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2026-34003-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-11021.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2026-2369.patch
 create mode 100644 meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104-dependent.patch
 create mode 100644 meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.patch


