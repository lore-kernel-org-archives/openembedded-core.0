Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699C1C43602
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 14:40:28 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.175923.1783435219890619575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 07:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SBCrIGFa;
 spf=pass (domain: gmail.com, ip: 209.85.221.170, mailfrom: twoerner@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bd742ef278so812378e0c.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 07:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435219; x=1784040019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LuKNRaf2LnbuvpFPN47vT/ODN8O3ViMjL2qBptYjSaw=;
        b=SBCrIGFaWIBFMepDXbw0Y0s4ls1gMyzrRtehRKrWHJFjKzWcOJy95IQCPps+zTbGo+
         Q7jRkSm1QujDkwJYQwaMf82brg0VX0N464YRZ+x2sNKT51hQAQefXmpsFWHfJFRtTZf+
         brKDnMJ4Cxqlaox2Z98A/PGZPgO4eXDGl/6Oha7GlMreFMG4F3AShJJjvdUJyrF4a/yC
         FHGV1+ZCF1ZArMPdSegaFPeE12iWs0v4l3v/5c6mEA+3SkpRLYY3lcMCQivH2p1b253x
         ZjliuLSN16EhutASrF+8T8SjO/AGdAAtXhmVBXMP2EJupSEtaU7mNqA/kW51w4yVpIde
         fwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435219; x=1784040019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LuKNRaf2LnbuvpFPN47vT/ODN8O3ViMjL2qBptYjSaw=;
        b=PCOHsa2S84hBY6o06HCp6t3g+mc09I/3fqROgBi5FDmeenH63YPoQ0Ypb+qnkmy7tO
         Nqv/ViHtH88MDrZzVEpW2jCwJgIApHOEXjhWSxZVYiGG9sTPLIAj5YNyQ0NwOcPFMC4w
         7z6hK5lN0GI0lpQiG36ZIeQ+lNEyy9YhNZWd0BtFvU/RBLacnTdWT3MuGu3FcggbjTib
         6iYwZDuyDUvrAem5u/OdAFTFM/i3q3Vr8LkMdNTga/eKcAOWC/xW81FqFMNIWf//opyU
         HuposA2drXG2FwWcofBQT32GkTdYQJOdLWD/MyZv2xZ8Nde2GeOxuMTaVvlAv5IFE3/5
         Jfww==
X-Gm-Message-State: AOJu0YzkgK++Y4ay0YyarDpV9ThL/yvh5AuJzkEnnhFkOyi/fOlM0m/x
	sJcswkrBMP1T2HvKQ5rEmkb/vshSO2knaqX/oY4j1JxwfU1x+3HxXUFKvudrcMcH
X-Gm-Gg: AfdE7clRT/tpV6EEUH9LKEH0v/zf7DDmDrk/mwDqIPwMRZ0wadg9a0/i/XBLvc43cCZ
	lPfCPyfRwwC18O5V5PbtKZ7N+THwQaEh1wxST0mqRvW5Q3k5+x8Zzt7UtCwa+lFK1BaWScLwZS/
	gWn7U+t8ls5PJCCJkIZ92jIHZxqaHsaT9FspO3XpJuwZb67SDr6IHL+gu4tc9ckQGdE9+pqL1T0
	pBmoCuNPTUxB2YA8SVLiw1JPljgkb82Z0z21qgwX/8014XbBweHA2C+hnNIqLpzMFf9Eg34Yd4i
	O96k6c3G9sPztDf6kDGmgrm4gMZ9V6vGj0swHhAOzZxRtEy288cqN5GAr24ywwc8ehbuw6gq9c9
	ygxcxRMaitoZFqgOn4dkaesRBMvf9YWCF2OATxgmywBZKV/garhdX0ShFlYu+CNTaL08aLbXOZ9
	bfSBGZS/CjcM54sF6X6u3AWVqHnWpq+ZqmkIOCnqhm2/4feaRdN1pkHoE=
X-Received: by 2002:a05:6122:1794:b0:5a4:ac74:f5ba with SMTP id 71dfb90a1353d-5be908893e7mr3014284e0c.11.1783435218550;
        Tue, 07 Jul 2026 07:40:18 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5be02934c13sm7107780e0c.3.2026.07.07.07.40.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:40:17 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/3] wic: give installed wic the tools it needs
Date: Tue,  7 Jul 2026 10:40:06 -0400
Message-ID: <20260707144009.708407-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 14:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240396

wic shells out to a range of host-side tools but does not declare them,
so wherever it is installed as a package (rather than run from the
bitbake do_image_wic task, which has the wic-tools native sysroot on
PATH) it works only by chance depending on what the host happens to
have installed. This series makes an installed wic carry its own tools
and makes putting wic into the SDK an explicit, opt-in choice.

Changes since v1:
 - Dropped the wic-tools.inc refactor. With wic no longer added to the
   SDK by default and the tarball entries removed, there was nothing
   left to share, so the tool list now lives directly in the wic recipe
   as RDEPENDS instead of a new .inc.
 - buildtools-extended-tarball no longer swaps the parted/dosfstools/
   gptfdisk entries for nativesdk-wic; those three tools never belonged
   in this tarball (it ships build prerequisites, not image helpers), so
   they are simply removed.
 - wic is no longer added to nativesdk-packagegroup-sdk-host
   unconditionally. It is gated behind a new SDK_INCLUDE_WIC knob
   (default "no"), since pulling in wic also pulls in the long list of
   tools it might need.

The wic/wic-tools split and the machine-specific bootloader firmware
that wic-tools drags in are left for a separate follow-up.

Trevor Woerner (3):
  wic: add runtime dependencies on the tools it invokes
  buildtools-extended-tarball: drop wic helper tools
  nativesdk-packagegroup-sdk-host: optionally add wic

 .../meta/buildtools-extended-tarball.bb       |  3 ---
 .../nativesdk-packagegroup-sdk-host.bb        |  6 +++++
 meta/recipes-support/wic/wic_0.3.0.bb         | 23 +++++++++++++++++++
 3 files changed, 29 insertions(+), 3 deletions(-)

-- 
2.50.0.173.g8b6f19ccfc3a

