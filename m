Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6253710F9957
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 15:44:23 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.108466.1775660409786409821
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 08:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lpZQPnf2;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: zizuzacker@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3591cc98871so2799178a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 08:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775660409; x=1776265209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uEdbeNKtUf8P8IwlFq5zbH/2QgAUsNpQ/SbZZJ4NXKs=;
        b=lpZQPnf2urrqwIeqzqVzF8g5qvubQhNTsuN0eFO7x+VpR/IBqCPQz9cMjI2nTpBpsG
         jnhBTtX13NT8uOxWdt0I1N3hovO4cGHqiaMI68QPhPbqcevqHAxSvIAmuph0uGMgMq++
         fDoDG9+1/iVvLrPDctMpe3GQAucJuU6Cpq5mQnBAIAaNu2FtRr4JfZh/WXjGu8YwqBLH
         OZIBn6Rlgr2/A7n/BqDRVqWt/rvre5z5tdechevg9CPX3qFXDVOFO48wjSbelobqyzjw
         41mtiSFdvOYp2Z/lnqPHxR0nyfTNMVjj6KcCIS5i8UdqESwJPgSZayoIYb6kjc6xC04r
         r+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775660409; x=1776265209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEdbeNKtUf8P8IwlFq5zbH/2QgAUsNpQ/SbZZJ4NXKs=;
        b=WrbrqKcpVp9UU18JjwwMaGagmHqSPP0fSJYWt9P7kwVOSzGaXfonpEhN71KjUIZ5U7
         vPyKIZ+LJmI2j2ikq9qOwT1H4uliJBqDqpMNecSUR/G85h1M1V/ZVtmeFcHz4yQk8Dc3
         NNmetjC681PdRzndq/2zDrCJcGc5PQy+AhnDIK9PaCNmFAK8n0zmfeg+h+UnOF86UNTo
         9BocdKUbkGOmH3YDnOHD8u14BojjlT/pNm/R/tA6gFxlF5gIblNzEFUJfe/6niH1EgnC
         +exj5vnHlPPyLVeNpulHoMdKhr6gw5e58tBjSx30vUKuFmuY0q2Xs6moNMMSSE+ftwx8
         Z8mg==
X-Gm-Message-State: AOJu0YwIgOs2gqF0M4hYu/oo1dR6z+V6v1yv2KPal5/IBwpzZZjk6y59
	P6Cpu3cBBaIRkwB787n0haHpnQoFqboHZbtghHbq/F02BeMCKpirBNSEgm5t7A==
X-Gm-Gg: AeBDiettZfKAZcZ/pdz9rzJVERmBYjNqldDOmKGtCaqn+iQ6aYMz9zqHKzOX7Ad+QLx
	C6lhVKiyJxKfI4wuQ7Vzn5gbyZlIuQXCSTHayX7/eNhPFblEKBZwRKHQL+gc5EM4pgT+wE8OF9R
	Jk7n8n/rD4aWuYt/lBoPIG3TuPMv+RyUF8EVPja1jrvaw1tCBn6U0TjFjQSR9iOIt7QbfbgCLZk
	Sfkei6VMsg4YIeEKGCo3j1LiTRpY6cmShNlSgxarjAdT5dBBl/Bd31+DhRPlzsPWoTbRS5wgj7C
	m8G1TGjEmG9s6YrH+F8HqLs4KDaCbPTR2xvYBtYbPvSiF2YQDWop8cL28FBmOghR3kvtgAWV39E
	K2mjytLPpwwL3BCCBuSZ0NZRXC2f/DKsRAm4TGFxu/4J/bJEnOZr55PIX2m5UZtf0d2M/qBDXnS
	RNpk4pbWLCB3A92eSk3TFilMiUvMVi/K/mY1w=
X-Received: by 2002:a17:903:1ae6:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2b28183595amr230782405ad.25.1775660408322;
        Wed, 08 Apr 2026 08:00:08 -0700 (PDT)
Received: from localhost.localdomain ([42.112.63.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af31sm202895775ad.52.2026.04.08.08.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 08:00:08 -0700 (PDT)
From: "Zk47T" <zizuzacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: zizuzacker@gmail.com
Subject: [PATCH 0/2] useradd.bbclass: fix parse error when only USERADD_DEPENDS is set
Date: Wed,  8 Apr 2026 22:00:01 +0700
Message-Id: <20260408150003.18063-1-zizuzacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 15:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234852

When a recipe inherits useradd and only sets USERADD_DEPENDS (to depend
on users/groups created by another recipe) without creating any
users/groups itself, the parse-time sanity check in
update_useradd_after_parse() unconditionally throws a fatal error about
missing USERADD_PACKAGES.

This series fixes the issue by skipping the USERADD_PACKAGES validation
when USERADD_DEPENDS is set, and adds a selftest recipe to exercise this
code path.

Fixes [YOCTO #15863]

Zk47T (2):
  useradd.bbclass: allow inheriting with only USERADD_DEPENDS set
  meta-selftest: add usegroup-deponly recipe to test USERADD_DEPENDS
    only

 .../selftest-users/usegroup-deponly.bb        | 25 +++++++++++++++++++
 meta/classes/useradd.bbclass                  |  5 ++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-selftest/recipes-test/selftest-users/usegroup-deponly.bb

-- 
2.34.1


