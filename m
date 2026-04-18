Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415ECF99C8C
	for <webhook@archiver.kernel.org>; Sat, 18 Apr 2026 18:34:09 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71725.1776537246102903328
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2026 11:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ntco4asZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: adam.blank.g@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a3d1561e38so1476939e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2026 11:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776537244; x=1777142044; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KNOCasvQpaUYdybvTMnoe4uZQnzaZRRBXDlIhefdLHM=;
        b=Ntco4asZG+/MWXFdtV9nKnXatiW/lbqo/LAGx4BmbqN6oa7lE5LpCzW/qvF+4aPN6P
         ICbVf7/9g+2eK25VltcscUS5MRo9AXeeVv8YmRJjwgilezuN/lxpHNVJddXDkzJ/VzJL
         Q63j0DA5Lg0+WQgDGc7POSa6wt75kF77AB/BurhkCUfIjPss26IP0YGgySpew5FTjM66
         KklllZQ/FwYEEowlOKzAqYFCJ4b7Zai/5I+HXnsBb/z3+Xv896DG/+ybXg+/TR3DEyv1
         jparJFrqMrOe1fBcnZqIwdpNH+4BbFyBLR6i3bw9++KeCxOO1DL0iHsgQTDdmauiNlL6
         kaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776537244; x=1777142044;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNOCasvQpaUYdybvTMnoe4uZQnzaZRRBXDlIhefdLHM=;
        b=Qg2sWIUuHwOWRh3xNy2koMIXmJ7YO8E0piev4XB3N0HQtdra3VirzTP4kJTs8y22Gc
         Si6XCqgeiba5JTolXZV1ASTzQIXGDmnS6GqmfEMezERg40+OytZ23hKPk06LOXtySdoD
         hEegvIEeMXxgkNh2tmyTAH68Ay89Cp7rMaEtPqidOxtaFneaGxMS2hvFWm2xv4iLEsfY
         Cez4yEV9Oa86OegukaLG0a0Rn49yDa+3pGYzTBXDB5DkUD0qwIWeSSQeiWznybZ0jRWe
         KBzGHzCSgvIBezDeeaJmKMFBVElaiTpxg/BSAVuiqGp3JvFri96fFBGvs2KI29pv/1P8
         8VgA==
X-Gm-Message-State: AOJu0YzqRofgFfyb37wlIjRrYDjiWSagjz77Ig3Z3Fcl9kjWBvM/KyKj
	JXwoLwQHnz2mLhH135dAfLoHC5vt4Z4Qia8EOBf27Ho2UbvL7xMF2CAn
X-Gm-Gg: AeBDievO4Pu9ItChMgsOC8Fb3PnAvgTlayj4QxnuARZuHfvaO6zV6Iu94+4WwZQC3/f
	NUGqGErAVyVA14P7hdYuwwWE4lAn6hpv1hbfe2uesqCf7gYMsaBMYjR/M3P2pVLa+MwkYwQxdGT
	YgiNZa6yfmu2SA8ywgUHr1TnAxOQ+iSW5wGHTyBTEmXmVubXnoF69Z0CTmz+fMVN/T4qDRsMn0d
	KXRK3eFEbxM7WrwYU6OyTdqok3kcI08t5j7aqzy4dY+ThUvSlnCkgvJoroLtP0ROzSxvhOG6pRD
	5lIF4KPAZHA4z52TwyVrdzi1pI+tIh+Qjtyb+PpBxq4Y9OLcBeRJviz977SxozjKzj4oH8lJykU
	nq3imQfGD8lpE3Y/zljhdOY7hSSzXERw+0Io4m5f1emOF3aUQX9zvDQxA0jWV6fkOKY+gaH2JVd
	EZGSJM71p9HmlELPNQqXhgPZQxP4mAjC2sqE7xWyhr
X-Received: by 2002:a05:6512:1594:b0:5a2:bb45:7f21 with SMTP id 2adb3069b0e04-5a4172f6573mr2002500e87.28.1776537243689;
        Sat, 18 Apr 2026 11:34:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:8f12:8be3:442f:59fd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0bfdsm12965981fa.26.2026.04.18.11.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 11:34:03 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Subject: [PATCH 0/7] Remove 'extend_recipe_sysroot' from
 'BB_HASHEXCLUDE_COMMON'
Date: Sat, 18 Apr 2026 20:34:00 +0200
Message-Id: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJjO42kC/x3MQQqEMBAF0atIryegomK8igwSk6/Tm0S6RRTx7
 hNcvkXVTQphKA3FTYKDlVPMqD4F+Z+LKwyHbKrLuiubqjc4d8QwCTxvmPRSSWk3wbb97KxfnHW
 U202w8Pl+x+/z/AHTygHCZwAAAA==
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776537242; l=1579;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=VE85wFm8oAmBjL0Pxvg5exYGZkJ5fdc3tFCchZuUOGo=;
 b=hnW6PWywI/lutlngrCzNbGuGf6L3cVaQu9rvAJCz5V0G9NCZ9Lw6nLyrcUkiLSEP68MkV4A+T
 vKuRJf2jw13Ch9PyToZEQGlXxaVX3D028OHGWIZcJMwdgzQ0X+A3T6O
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2026 18:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235514

It has lain there for a while, obscuring certain aspects of
how task signatures are calculated.

This changeset does not change the current status quo, but
rather changes the way in which it is implemented. It can be
followed by changes which further refine what is excluded and
how, from those tasks which refer to 'extend_recipe_sysroot'.

Related discussion:
https://lore.kernel.org/openembedded-core/aa893eb861bf4dd18e3e84e6bbebdee3b0367d1b.camel@linuxfoundation.org/

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
Adam Blank (7):
      package_pkgdata: fix typo to stop calling undefined function
      staging: add 'vardepsexclude' to 'staging_populate_sysroot_dir'
      staging: add 'extend_recipe_sysroot' to 'vardepsexclude'
      cross: add 'extend_recipe_sysroot' to 'vardepsexclude'
      native: add 'extend_recipe_sysroot' to 'vardepsexclude'
      wic-tool: add 'extend_recipe_sysroot' to 'vardepsexclude'
      bitbake.conf: remove 'extend_recipe_sysroot' from BB_HASHEXCLUDE_COMMON

 meta/classes-global/package_pkgdata.bbclass | 4 +++-
 meta/classes-global/staging.bbclass         | 5 ++++-
 meta/classes-recipe/cross.bbclass           | 1 +
 meta/classes-recipe/native.bbclass          | 1 +
 meta/conf/bitbake.conf                      | 2 +-
 meta/recipes-core/meta/wic-tools.bb         | 1 +
 6 files changed, 11 insertions(+), 3 deletions(-)
---
base-commit: d9b69d0a2d69e003b9432e1473830a89ff5a06c4
change-id: 20260418-extend_recipe_sysroot-d958ba9cfa9a

Best regards,
-- 
Adam Blank <adam.blank.g@gmail.com>


