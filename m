Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F1CC83F27
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 20:36:30 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.5337.1752611784575240800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 13:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zdcqdB67;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2363616a1a6so51468455ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 13:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752611784; x=1753216584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Z/aDZbCtAK+kNhvmpi8pz0rYqOR3n4cGeNutrGKZjk=;
        b=zdcqdB67fluRcoI2vZPElt9P7tCPQIUVncKjAnlhl/14xImjzsw43gwS7kWcxjgyGe
         Y9uvnQCQciWOXcdwp9oKZJAyXg21ukaEdkcrDSmVkAnBPPG675w9btPFAoxUoAWcbBwE
         kNhQsxEOX+SCpvi1W6/3B8teOcHXhqhBUpCL22bkYmUUqDC9Mn0dGZidAE3Vjar+lxkg
         3EpfnoBuNAcUGfAf9bmQ/+ImlMsIg+oVQ4m4hNRBARGosa2GO/XL1tKc29fep0mIu7/7
         KUd2FttVm6sRrllA7v7J3jXV6BVYoBYNQziyemekwrLOmNZGWGEPV2xjHM64w1FyoJRI
         Ijcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611784; x=1753216584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Z/aDZbCtAK+kNhvmpi8pz0rYqOR3n4cGeNutrGKZjk=;
        b=Nxb0buAzsmnzcpvS4X9tvRGQxEnBL3ONxngsIg06+kIiOPQ0HbQHPV5Prhyc1Z/Ixl
         kM0zkXsI0tcgri8eAdZjUzLBhLB2Od7/DxeRNq5RDsebvD/8CzH5KaQV699GqTbm4h+1
         HZ+XvI269Fm+NVXu1QvHKUkeU3glec9c+iMighJ0Q+KnXvEPJlqJytY1tOSmyNKKOa34
         RXip1UwHyplBoDqcuj/X93Zxd/OBUI+Hpk+IjtWWo+KbjfbBDdiaYwrK1wm486L9iQUu
         NOhCecDX0EzWtPoxHeJ4IVfqQupNwoUvf8ImFNqB1Pz9HSbtCRIvFnYvCHYDA2CpsUNf
         UFwA==
X-Gm-Message-State: AOJu0YxvfWb/I92NOgqpm2STc631j+895sb+RJ133JN0T7OEFTCUl9+l
	vRye63WV+Beeo0C84XcfcFry6yNQnu5WqrTUDtAGDO3/z5KEuR8gYZiHiaXMl8sxKUtu5qYYLoI
	Gi/4N
X-Gm-Gg: ASbGncuhwk9Rs5thwn67wiStLEkWxpuMQho4F7uQVsFRtvOi40weH0uDG3kBqTdynoN
	4zaA2Jv7cN/m2bPOk7a2s60cmFPbPxlIoJbtmsgclxy+Jcv4OhG2dyvi3M70PWyVByTyrbZcPwP
	43HXdTGeyK4TgqWW4+j0ot04CEnhQ38sM1GlYeqxxFnCm6aLVlvF6DzFDvF11VHbWuopnBbJC7w
	yIUO0y3x8aJcR7fPtq+E/yBr4TkJ6Xmps0KfZsKEa6bcTRRTHrbUrlh2hMQ4aJarsKHiCLUJP6i
	keNP7/cST6MH18pM1vL/q0ZwvkUw73SePGZGO2cMVrSYrbr/MeuN2e9DVrlWUktgPfJC54cCfWB
	HqyHgiF59Hcg00s/1NCiM2zjD
X-Google-Smtp-Source: AGHT+IG64BSiWpO8FeRPlgNRFP/qWYWVxMhraTDSrPEJyDDiMe+qX6r2EVAffaerNfuL3I0XHMxGAw==
X-Received: by 2002:a17:903:2f8e:b0:236:9d66:ff24 with SMTP id d9443c01a7336-23e25686c7bmr1638135ad.8.1752611783629;
        Tue, 15 Jul 2025 13:36:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5c42:3781:50b6:b9d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43637f2sm115585595ad.241.2025.07.15.13.36.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:36:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/16] Patch review
Date: Tue, 15 Jul 2025 13:36:01 -0700
Message-ID: <cover.1752611671.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 20:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220409

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, July 17

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2021

The following changes since commit a7cea8a5c91d26ba7c3f72448f0897f5c2f81fd1:

  linux-yocto/5.15: update to v5.15.186 (2025-07-08 09:05:09 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (4):
  openssl: fix CVE-2024-41996
  ofono: fix CVE-2023-4232
  ofono: fix CVE-2023-4235
  gdk-pixbuf: fix CVE-2025-7345

Chen Qi (2):
  coreutils: fix CVE-2025-5278
  sudo: upgrade from 1.9.15p2 to 1.9.15p5

Deepesh Varatharajan (1):
  bintuils: stable 2.38 branch update

Guocai He (1):
  tcf-agent: correct the SRC_URI

Hitendra Prajapati (1):
  libxml2: fix CVE-2025-49794 & CVE-2025-49796

Peter Marko (4):
  python3: update CVE product
  openssl: upgrade 3.0.16 -> 3.0.17
  ghostscript: ignore CVE-2025-46646
  iputils: patch CVE-2025-48964

Praveen Kumar (1):
  sudo: upgrade 1.9.15p5 -> 1.9.17p1

Ross Burton (1):
  oeqa/core/decorator: add decorators to skip based on HOST_ARCH

Steve Sakoman (1):
  Revert "coreutils: fix CVE-2025-5278"

 meta/lib/oeqa/core/decorator/data.py          |  24 +++
 .../ofono/ofono/CVE-2023-4232.patch           |  30 +++
 .../ofono/ofono/CVE-2023-4235.patch           |  37 ++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |   2 +
 .../openssl/openssl/CVE-2024-41996.patch      |  48 +++++
 .../{openssl_3.0.16.bb => openssl_3.0.17.bb}  |   3 +-
 .../coreutils/coreutils/CVE-2025-5278.patch   |  10 +-
 .../CVE-2025-49794-CVE-2025-49796.patch       | 181 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   1 +
 .../binutils/binutils-2.38.inc                |   2 +-
 .../python/python3_3.10.18.bb                 |   2 +-
 .../tcf-agent/tcf-agent_git.bb                |   2 +-
 .../ghostscript/ghostscript_9.55.0.bb         |   2 +
 .../iputils/iputils/CVE-2025-48964.patch      |  99 ++++++++++
 .../iputils/iputils_20211215.bb               |   1 +
 ...o.conf.in-fix-conflict-with-multilib.patch |   7 +-
 meta/recipes-extended/sudo/sudo.inc           |   2 +-
 .../{sudo_1.9.15p2.bb => sudo_1.9.17p1.bb}    |  54 +++++-
 .../gdk-pixbuf/gdk-pixbuf/CVE-2025-7345.patch |  55 ++++++
 .../gdk-pixbuf/gdk-pixbuf_2.42.10.bb          |   1 +
 20 files changed, 548 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-4232.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-4235.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.16.bb => openssl_3.0.17.bb} (98%)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-49794-CVE-2025-49796.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/CVE-2025-48964.patch
 rename meta/recipes-extended/sudo/{sudo_1.9.15p2.bb => sudo_1.9.17p1.bb} (52%)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-7345.patch

-- 
2.43.0


