Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6150EC6FD18
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 05:45:36 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.48109.1680241532941983417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 22:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C+97+hJF;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id o24-20020a05600c511800b003ef59905f26so13096102wms.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 22:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680241531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3d6TGayWanAcSbGJCDOw7m41DhK+w8fRRPct8J/LDYk=;
        b=C+97+hJFALT96HhYxWO6ztVVUyP24AtmLeQ0orjc9GcFlT3nH9YDfGL/0sMqWsBXMj
         qOKS90vrq+sOCRdZGPNMpiqDOilDfQ4pr/W+fPJbMsSAibRyVn9IVUl4CzMPVYwkVyMy
         edeXuKA/uY0cAxuK6RK6Pr2ZpuuuM7h56+y6P/RxJMDYiE5eTU2gJGDt+RdaImTE69h4
         wiQG+j4B/jjVkWrp/Danx9My4r8WzxQ4hE8i4QM93L08qMs3tCIv96eu/KVq3CDr60OI
         fyF7Iid9HG0rwJ/GbAjHSaAA1+CToHCogIdNXkiS4Ycyk7M3mxzdsutHSm24to/rMkOu
         nWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680241531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3d6TGayWanAcSbGJCDOw7m41DhK+w8fRRPct8J/LDYk=;
        b=db+YYyp4d3yJMe+tZQPx0oIoWJ6wkg2t520T+klX7wcDIEOOkIMnKd1xbga6a7ZBlQ
         ODxiKPCh0EYm/rbbWIaS2lbe6r2NFSFTP5fuXMII8vQuRRJtqegMOtuhXgcZ1MQWVieq
         SzDKbelfm0vGW/cctROxPWSPBCgE6UuOH3NA6hISm1xjBhUvpBEW1fq9R6cf1JAgReW6
         F+Yx6vXslftAzRGHsqztKVs7aho37zX/DaLP+MNl3CbESCn0TPbBvgobcuX3evxKHapU
         x5KbPwj9jzOcnbJzmR5ka9me2UCiT4yar/dMkP0PPB9202+nMaupAGw3geqGHZnL8dld
         mjag==
X-Gm-Message-State: AO0yUKWPShxWWkaG0wN8w10XDTLDO7Le8IhqjN/CEbrtfWUENJAmIRHl
	y81EcIHMyBB2lphV7OQOWmKWFCBlvZQ=
X-Google-Smtp-Source: AK7set/GQvRM2he8x5HQCPG4xSxzcmcF7+ouFd0vegF2U25/W+Wy3xgHT2tKBKdKRxGV7nnFXZsorA==
X-Received: by 2002:a7b:cbd0:0:b0:3ed:2a8f:e6dd with SMTP id n16-20020a7bcbd0000000b003ed2a8fe6ddmr18322418wmi.6.1680241530858;
        Thu, 30 Mar 2023 22:45:30 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:72d4:654d:401f:66ef])
        by smtp.gmail.com with ESMTPSA id hg13-20020a05600c538d00b003ed793d9de0sm12664307wmb.1.2023.03.30.22.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 22:45:30 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH V6 0/6] 
Date: Fri, 31 Mar 2023 07:45:21 +0200
Message-Id: <cover.1680238655.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 05:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179393

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This series brings the support of local git repository inside
a cargo based recipe.

It also enables devtool capacity to such a recipe along with
an example of recipe and a new selftest case.

The following changes since commit c3fe173d5196506d89aa464ba56aabcf581a60db:

  oeqa/selftest/cases/package.py: adding unittest for package rename conflicts (2023-03-30 12:32:26 +0100)

are available in the Git repository at:

  https://gitlab.com/fmartinsons/openembedded-core cargo-extend-support-git-and-devtool

Alex Kiernan (1):
  cargo_common.bbclass: Support local github repos

Frederic Martinsons (5):
  cargo_common.bbclass: add support of user in url for patch
  devtool: add support for multiple git url inside a cargo based recipe
  patch: support of git patches when the source uri contained subpath
    parameter
  meta-selftest: provide a recipe for zvariant
  cargo-update-recipe-crates: force name overrides

 .../zvariant/zvariant-crates.inc              |  258 ++++
 .../zvariant/zvariant-git-crates.inc          |   14 +
 .../0001-Tweak-zvariant-crate-config.patch    | 1292 +++++++++++++++++
 .../zvariant/zvariant_3.12.0.bb               |   27 +
 .../cargo-update-recipe-crates.bbclass        |   35 +-
 meta/classes-recipe/cargo_common.bbclass      |   33 +
 meta/classes/externalsrc.bbclass              |    4 +-
 meta/lib/oe/patch.py                          |   57 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   93 ++
 9 files changed, 1778 insertions(+), 35 deletions(-)
 create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant-crates.inc
 create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant-git-crates.inc
 create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak-zvariant-crate-config.patch
 create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb

-- 
2.34.1


