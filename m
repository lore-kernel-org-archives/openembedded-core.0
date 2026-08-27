Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 993C0C61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 07:59:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31104.1787817578058880133
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 00:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vzXhxixJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b14637dfdso2466935e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 00:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787817576; x=1788422376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dnyS0sGgs/obFrW4BnDkrMc2aBRKKSo1K0PVmQkOH10=;
        b=vzXhxixJ75ZNDXycagLapREA9kVd+Qvs38Gxzlw3E0j8FOE5/+sBKpCv6tDTf5pHPZ
         jW4X4PRl2Ajcnx/L9vrlMeQ6fblw9vcB+CJhlMRgflV7hIGhPkgLkWIzsC642m08/i7j
         +TxWcBm2e4EVwICRwoWO3WZyVH5pk/LWaJ5TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787817576; x=1788422376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dnyS0sGgs/obFrW4BnDkrMc2aBRKKSo1K0PVmQkOH10=;
        b=gSVE/qKBJiXrqZuM9LtH/DlMgmCnI1IJ7BOdisnN+sMomcSIqiGEZ0AmB9lf2mKNFL
         +8PPmD4Z8R3Yr3lTNF04PqjwzFKkx2xO1yR86omXCtfjzDrtGC6aNkyBtXH9b5Spzk/H
         mwaTQrgivxuXIlB4+LZ6HtCCsaiebrqRwl5X3C8uFcNiXS3fwktMaZgSocklWBb29FbR
         /sgE0d9Gz9M2rJY8OC60D7APE+MM6BvWuJyeBLmYqJQA1tuUWnR2IL+paYYywCMYlCH9
         6vswZJwYCRORlczKob3bib2CjQYxgF86sq7+ljoLtwMojJmO+qZBU0UaU8Zy7j4LzXRL
         OEuQ==
X-Gm-Message-State: AFuF++mFQ7wYJrYeHqyLzZODD+MaF1uTbC0hfM0rM/rKR9EGrN5NVJFC
	7v5MYiaibff4wMtxaWi8eU2p7x1u/g8jGl4Qg3fkaAVzVwO0FU62EVAE/w+f2xsV5sEuM6MW0DB
	PXw5LrYI=
X-Gm-Gg: AR+sD13pJoNs3JSFeksIc5B+ZNpkCMVoQYk67YSqanaEBD/DR7/Y+tRtnlbuzerq6Jn
	2n7E0o350cVkErz2MOj+1/CKKl/TY/7cVr6wKd5+1Wf86BBIg5sfFfHQza56y/w3Lq0DeOwnBxj
	NaPyIS1zoBtLvIMgMZN/IAIezzMXBZMdV/t1EHMNEN4Dns+Ju6X/RSfgzNBkWc1faplj5/AuFr6
	K1ExcclSnOuVDcPhn48xyqaSB3pxez/hU2YDKP87kyNE5PZ12ZFafxRRSg84XjiAjKXFPpUFylA
	VAsFDnIShz6cvsM+s43XaaJU5NAB8liuu3SQwdUSyU+8nBWd5N4LF06TihfafmALkb4+5OQnRQJ
	ulu+wUMRrcdBw51YFkYau9wlPiADFmjanML3GYZ9rkRRLnMwXlCEevtdtF7m5acwaUM+nrxca5Q
	5rSzlXtYbtBn2R9oH5NHoKzkQ3IG6CiUFeZEKQHW7hGuPoa4d+B/37phfNpYYnfUVWSdnLBaQP2
	J6rEyW8fCG2L1j4ajt7InwfnK1B001ji9mubXHBx5QcC5hV+N2aeGwayXst4kEoBQ==
X-Received: by 2002:a05:600c:1382:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-499dc70b76dmr130028455e9.7.1787817576189;
        Thu, 27 Aug 2026 00:59:36 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm29154165e9.4.2026.08.27.00.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:59:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][wrynose 00/19] Pull request (cover letter only)
Date: Thu, 27 Aug 2026 09:58:51 +0200
Message-ID: <cover.1787817328.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 07:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244469

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1787576160.git.yoann.congal@smile.fr/
No changes

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4542

The following changes since commit ef022bf82d79015802309d14c28b13373ebe53f5:

  build-appliance-image: Update to wrynose head revisions (2026-08-18 08:40:33 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to f7397af248e1e338929d70a910b0fbc2341528ec:

  mirrors: Disable YP mirrors on autobuilder (2026-08-21 18:06:46 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  libssh2: fix CVE-2026-58050

Deepak Rathore (2):
  curl: fix CVE-2026-4873
  nghttp2: set status for CVE-2026-58055

Jaipaul Cheernam (6):
  libssh2: fix CVE-2026-66032
  libssh2: fix CVE-2026-66033
  libssh2: fix CVE-2026-66034
  libssh2: fix CVE-2026-66035
  binutils: Patch for CVE-2026-15003
  binutils: fix CVE-2026-18220

Michal Sieron (1):
  rpcbind: Drop dependency on quota

Peter Marko (6):
  busybox: patch CVE-2026-38754
  libsndfile1: patch CVE-2026-37555
  bison: patch CVE-2026-56389
  cpio: patch CVE-2026-66485
  cpio: patch CVE-2026-66484
  cpio: patch CVE-2026-66486

Richard Purdie (3):
  rpcbind: upgrade 1.2.8 -> 1.2.9
  oeqa/maturin: Update dependency version
  mirrors: Disable YP mirrors on autobuilder

 meta/classes-global/mirrors.bbclass           |  19 +-
 .../yocto-autobuilder/autobuilder.conf        |   1 +
 .../files/maturin/guessing-game/Cargo.toml    |   2 +-
 .../busybox/busybox/CVE-2026-38754.patch      | 155 ++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |   1 +
 .../binutils/binutils-2.46.inc                |   2 +
 .../binutils/binutils/CVE-2026-15003.patch    | 402 ++++++++++++++
 .../binutils/binutils/CVE-2026-18220.patch    |  65 +++
 .../bison/bison/CVE-2026-56389.patch          |  56 ++
 meta/recipes-devtools/bison/bison_3.8.2.bb    |   1 +
 meta/recipes-extended/cpio/cpio_2.15.bb       |   3 +
 .../cpio/files/CVE-2026-66484.patch           |  28 +
 .../cpio/files/CVE-2026-66485.patch           | 210 ++++++++
 .../cpio/files/CVE-2026-66486.patch           | 497 ++++++++++++++++++
 .../0001-systemd-use-EnvironmentFile.patch    |   7 +-
 ...pcbind_add_option_to_fix_port_number.patch |  25 +-
 .../{rpcbind_1.2.8.bb => rpcbind_1.2.9.bb}    |   4 +-
 .../libsndfile1/CVE-2026-37555.patch          |  44 ++
 .../libsndfile/libsndfile1_1.2.2.bb           |   1 +
 .../curl/curl/CVE-2026-4873.patch             |  52 ++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 .../libssh2/libssh2/CVE-2026-58050.patch      |  45 ++
 .../libssh2/libssh2/CVE-2026-66032.patch      |  36 ++
 .../libssh2/libssh2/CVE-2026-66033.patch      |  45 ++
 .../libssh2/libssh2/CVE-2026-66034.patch      |  40 ++
 .../libssh2/libssh2/CVE-2026-66035.patch      |  56 ++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |   5 +
 .../recipes-support/nghttp2/nghttp2_1.68.1.bb |   2 +
 28 files changed, 1776 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-38754.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-15003.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-18220.patch
 create mode 100644 meta/recipes-devtools/bison/bison/CVE-2026-56389.patch
 create mode 100644 meta/recipes-extended/cpio/files/CVE-2026-66484.patch
 create mode 100644 meta/recipes-extended/cpio/files/CVE-2026-66485.patch
 create mode 100644 meta/recipes-extended/cpio/files/CVE-2026-66486.patch
 rename meta/recipes-extended/rpcbind/{rpcbind_1.2.8.bb => rpcbind_1.2.9.bb} (95%)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-37555.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-4873.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66032.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66033.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66035.patch


