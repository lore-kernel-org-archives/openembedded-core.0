Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA513E77166
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 22:38:58 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.807.1733265529807283775
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 14:38:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DCkk4Z3S;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-29e149aff1dso2508393fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 14:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733265528; x=1733870328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZzMWcCQtPCZxwfVHFKnHpUS3co87id/jthhuNObb0bA=;
        b=DCkk4Z3SMoQ5ygjUxcQR3KiLrtMl+UWwOmwejijuLFMDKIO8Q+YYf/VDBcSIkiaHD+
         PBPsldELw/zlSrQ79wcKqLKsqNnsBd3wgzd24/8NrkxqvAYlIh1BTuv+nlam1Eagf0mV
         4WjsfFNzLXNlccxbnvYBoZdEcmtduIyB+XcDMvwi+2eZqf5wqjZ8IhmxXQmW8kYgnX7v
         +1//0vaAhaXdlqDM32ALQXjbUbfCJsD4yppXc+uP/+buHmDQCWhGmIrszm22YvbOdKYm
         76537DUlnWmqRF8qqySYa/Dbb62GcziB8rKrEwWxPVHsi0QW8OoRhZgGHedFBe33lKmj
         ocaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733265528; x=1733870328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzMWcCQtPCZxwfVHFKnHpUS3co87id/jthhuNObb0bA=;
        b=nYwA+p3NsTOFeVbUZUb5h/TS3+ZBHEZ5dawCK9nsC3fAh+ob5q4meuXu+xO9J7c4xj
         +pdJybcnoNg7Oc2fOlvyPtlbZIjJCFW3dVmSkEQDDQOG02F0z+61udEJ84RRBvIfdhmg
         Qu1lSol6xxrHII82yqS2aGGjpoS2i0KALsc6f6+yaLbE/S701BCtgl+Spt6+bHbkT39T
         NGcRnd5+aFOm0SAwStksnYwfhzXWifSLKU4Gy/RQEf/aRyKRIRGeG32YNjNJEOOgy2UF
         ahmv8iJ08V2m+kyG4s00u8W8drxYgtz+9cDRpUExK5qRtilx9GEJVwAuuG6ptb6LismA
         RcgQ==
X-Gm-Message-State: AOJu0YzGYXpsw7L9kCvbs5IqiL58ScgVKSa8OLNXjes+QJYPlrHFDaBr
	hdxszoJkOKKPPtlleqRSnh2STJKNhT19Q/bkFQ6zppjZbeuAevTiy+UitA==
X-Gm-Gg: ASbGncsNviVECAmmLbu2x+Aff22MRISd5I6MXuypLXK7TSjyUvSC6O5Z1VrbrjezV5i
	CbW2Y5TqYdkKOddV0llrz7WJZ86GcQlV9kevS+qCrEgOACsEeRxYHpB9ZeB8L2zpqxNx5AqSiii
	IEsxGaLlX+nqvrHDpyUUoOFdOzlwwOmpq7V0w3do3bb8ERTZ9jFHxn8RPtJWbcL6kvWhXhXWoPr
	pjgLKn5eTIkL2EB16P2aRIN6G9n1jURO1lAvT9K6qc33m/7
X-Google-Smtp-Source: AGHT+IFbfRV9Pf3neDp2XeVh7aAw2CS74Gs6kby7d8oUePOTMy7lB/APj29ECsosrr4Q4oospNtCxA==
X-Received: by 2002:a05:6871:3805:b0:29d:e853:6203 with SMTP id 586e51a60fabf-29e88705b6amr4766262fac.22.1733265528482;
        Tue, 03 Dec 2024 14:38:48 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::dc1a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29de928c9b7sm4037836fac.22.2024.12.03.14.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 14:38:46 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 0/5] Various SPDX Fixes
Date: Tue,  3 Dec 2024 15:37:05 -0700
Message-ID: <20241203223844.2689172-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:38:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208221

In the course of making training material for SPDX, I discovered that
several of SPDX options to add additional information about the build
were broken. Fix these, and add a selftest to make sure that they
continue working in the future.

Joshua Watt (5):
  lib: sbom30: Fix import handling
  lib: sbom30: Fix agent reference
  classes: create-spdx: Fix variable dependencies
  lib: spdx: Fix SPDX_BUILD_HOST
  lib: oeqa: spdx: Add tests for extra options

 .../create-spdx-image-3.0.bbclass             |   3 +
 meta/classes/create-spdx-3.0.bbclass          |  10 +-
 meta/lib/oe/sbom30.py                         |  17 +--
 meta/lib/oe/spdx30_tasks.py                   |   2 +-
 meta/lib/oeqa/selftest/cases/spdx.py          | 118 +++++++++++++++---
 5 files changed, 123 insertions(+), 27 deletions(-)

-- 
2.47.1


