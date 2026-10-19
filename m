Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55CECCF2E5
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:39:41 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36164.1792420772176091521
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 07:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: otavio.salvador@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3550c917fd3so2597850eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420771; x=1793025571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5vXw6GrSZKBLBBwB+SoRE0bFEgI7JiDThBD2HIDBdZ0=;
        b=T2U9mioy+5lXG6CAln2Ezu2MzvwuDqFRx0Y8F2jolFtF2P3Pk8m6juDwtP2tc69F25
         7j9mx5jBsX22WJw9AuYZ7dtYB7lyZht1UNAktjC3K6aUicJZVldmuAeWKIJQaEiv+ihG
         WYOHiAFdFIztPveO5weorNwjnq/fYzSZWpV5PYPXqNaWWvFy4gLJB0KG/lzSlitm/UML
         iSZej8ztceJuzu26WwoWrieVDGVUy4uTHd/480PPIVH77tYJ0tJKKXN/M+Br7iE4KhOQ
         wqB7SPLQhoYk1oxp2frmRH97RaOtwwUI+QkyYdu+Ensga03v9BAufNe3x3OQxn29rpRV
         QzOA==
X-Gm-Message-State: AFq9FYJUl8XHF6r7lF4noRQutqr+LQ9CB+e1FXdP3gc6FkwXesZYmH54
	CqU1l3hYzXjCGqlcsR+mQWDMToxAr+gu0dmxGZfwvK4HnITdVVznZ4+GcYqN23oh
X-Gm-Gg: AYBFou2KgEVqtWkp0o0SSZvDEtsS/fH4Yyv2cd8IaGbInKfJXL7SqGBmfUprCG4oaPI
	bktBQFNL7IcnrlIvC4CJi/tfmIvsNgegUlGtHTKZ7dHPBIZ91S6raqvfaLHsIcuyYiTewVx4UGM
	AOC7riohMY+zzOHYd8USeZRfcLNRiOS1aqzrmyiO2fYULE7HMjGDEXO+KVnJmn2BSjRPIJ3DdAT
	6xEkSUdKz5ykwA4BZaWblD1/RieWgeY2PiQzx8/5ZousZnV0pnS8jrEoju9Zwpi/K4Y3yCg47xF
	64OqUHQIjFlp21z179Bt0OPTT1OLxzlhiu9WRd576MYiTmf4/OU1AxTX3aFuBtepJEY2crvVWWD
	1VFVORhvnHXo78uKZ1ZYpRCbzl7ANveMUE3v0UqZ9ayQIiXbUPbKfN4EcRCphhzoKWyl0rCLzYP
	Rg29LG8nk/CjNDDQ5Ub0CfNAmzR5b82lkF2kUQzUPTp0FmvlSnYGrh8Thnd58aWMhsTWx/LfczB
	qBhyexaLEEV2fTluj1LC97Pfekx6KRLhHTVSl9FkX0my75t8YrJ4qr5WI/2nka6E7wKB/jyTgNK
	NSYV5Zu+mWT58sc9+536lq+WiWuH6NeWT/meJGkwYwhBHlj/9u3UfpRBBXYNeqAYq7HpnnTsk1C
	C
X-Received: by 2002:a05:7301:fc09:b0:34b:5ab2:e200 with SMTP id 5a478bee46e88-361a1860934mr10437678eec.14.1792420771213;
        Mon, 19 Oct 2026 07:39:31 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082b8573dsm32927022eec.25.2026.10.19.07.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:39:30 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 0/3] yocto-check-layer: Faster BSP checks over many machines
Date: Mon, 19 Oct 2026 11:39:21 -0300
Message-ID: <20261019143924.1521981-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261017225656.680168-1-otavio@ossystems.com.br>
References: <20261017225656.680168-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 14:39:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248175

Checking a BSP layer over many machines is dominated by world signature
dumps: two per machine, plus four for the common tests. In CI the
machines are usually split into several runs, which repeat the common
tests and their dumps in each.

This series lets such runs select their tests and dumps each
configuration once:

- --run-tests, as in oe-test, so the common tests run once and the BSP
  tests in each group of machines;
- no initial (pre-layer) dump when test_signatures is not selected;
- get_signatures() always runs with -k and returns the error with the
  signatures, so the common tests, and each machine of the BSP tests,
  dump once in setUpClass() and the world and signature tests share it.

A full run over N machines goes from 2N+4 dumps to N+3; a split run
does 3 dumps for the common tests and N for the BSP ones.

Changes in v2:
- Patch 3 replaces the signature cache in get_signatures() with one dump
  per configuration in setUpClass(), as suggested by Paul Barker. Failed
  dumps are no longer run a second time either.
- Patches 1 and 2 are unchanged.

Tested on meta-freescale against unpatched OE-core and against the
wrapper proposed for its CI, which does the same from outside
yocto-check-layer: with two and eight machines, a recipe breaking world
on one machine, and a recipe that does not parse. Every test gives the
same result in all of them, with the same machines reported as broken.
World dumps per run:

                                  unpatched  wrapper  v2
  full run, 2 machines                8          5      5
  BSP tests, 2 machines, 1 broken     -          3      2
  BSP tests, 8 machines, 1 broken     -          9      8
  parse error, 2 machines             7          7      5

  (-: unpatched yocto-check-layer cannot run the BSP tests alone)

The only visible change is in world failures: the dump now uses -k, so
it lists all the errors of the failing machine instead of the first one.

v1: https://lists.openembedded.org/g/openembedded-core/topic/121810615

Otavio Salvador (3):
  yocto-check-layer: Add --run-tests to select the tests to run
  yocto-check-layer: Skip initial signatures unless test_signatures runs
  checklayer: Share each world signature dump between the tests needing
    it

 scripts/lib/checklayer/__init__.py     | 28 +++++++++++++-------------
 scripts/lib/checklayer/cases/bsp.py    | 15 +++++++++-----
 scripts/lib/checklayer/cases/common.py | 20 +++++++++++-------
 scripts/yocto-check-layer              | 14 +++++++++----
 4 files changed, 47 insertions(+), 30 deletions(-)

-- 
2.54.0


