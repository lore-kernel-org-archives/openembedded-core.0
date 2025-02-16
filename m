Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2DDC02198
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 16:37:14 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.31985.1739723832564649757
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Feb 2025 08:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B4KHr+Kn;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-220f048c038so38348635ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 08:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739723832; x=1740328632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/MHBTyhxv/OdRA3wdSK3jzEG9R6fkoRqF60NA3QOlIc=;
        b=B4KHr+KnNHEXrqJ8BqR9ZQf6VQGkwoGbhHln6gbT9Jt+R6AD1yFjSTJsXOTq9hakuT
         Jaybjd/ItIsAWfa5xrionLWvv7/BWmBD4e2Z3WXxCyk/N2IjKy15I8NLqfdl4pTZ5dv9
         USFg3cCLh/nydNoWbtusEMFcAJqxGRGMTLJGjb4JxUa4oGGLg18L7H7ioI1B1AG4cBrw
         +mqKU4qelLfMt2pW+9rGzwbJQWXoVIzMW4pkEw+K+a7KO2jJ9LLLf2xLGuw0hT/JmUXC
         sHtwpUZ3sJz/ut7TCOr+1fHJC1RPb6ikye9sN/53Ag/78HOzbJAebetDBMLfVY45+/1O
         RBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739723832; x=1740328632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/MHBTyhxv/OdRA3wdSK3jzEG9R6fkoRqF60NA3QOlIc=;
        b=BDndVTWSZM1tYqmBTTuc7S05SxJVqH8lnO6pgeB8Hl+ViEnGcJ0CkwoUJvV5eKEq9z
         2rlXJTfx7ZHqIT8ti/ckfDukhtijWfwK7gkdFbkWhiPEC6oClY4kPqsWBFT//fhfiD/w
         Usp4Sa9mh9D+Z1A++A7JYvhiQ0H6HXZ6nr6Gar48bTmcR2CponK8NuvF7eRyiJrBQhgZ
         KyaKeijnMLycRUJnGwnAL4wSNZstiMfIpIswEwOjfHhWKrKcNy2v5rsmEEzLszPrNWnl
         lHSaE+pGkm2Lxh28X/gVDv2N+yDT+CrHpgm+rtAr37tuXngxKcvEqjuT0Ccy9nRurUCJ
         n95Q==
X-Gm-Message-State: AOJu0YwX67l3a8bDeWRFDtaBG78jSBiJ7E3SVusRiMSTZEP/OIHTt0lm
	6RZROjG57aR5FlvKOXQUKscZnXN6PSZtMKDCF2igMS2ymbFisWrh4eECzYOH
X-Gm-Gg: ASbGnctOTWD+hbJKy5KuzdppQcb1LTaS7LydxQa9Ylp1qC4ZF5jmNWQ+/+c+MEpa06P
	nd5A59F47IV2SP59DS1BhzJOIj5iAzlkKeW5/eOqYOgHk11oV/FLiVHM8DT/MUzUvi5GLqfPBcK
	5DtAvIMV5q5d5CgNY21r8CQ1od+dUOWzOLmIwSa4jZCOgmrpqE2d5uoBROeTzhFChdQdVDIRUbL
	F7MBVOiwaipbDC7lNS6TELvpAvqgmvEUys/TgnNDDivvH+iYHdoDVhZigB2NPW60LpLZQPXX3k0
	ycnEpw8=
X-Google-Smtp-Source: AGHT+IHBAU+wuhu2eoW6ODr5fcs+r58T2Nbdey1hshUWWmh7uISngvAs+hKVN8tg5ydoT0y1OxkhTg==
X-Received: by 2002:a17:903:2f88:b0:221:331:1d4e with SMTP id d9443c01a7336-22103efedc3mr103421075ad.7.1739723831549;
        Sun, 16 Feb 2025 08:37:11 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::b976])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d4c9sm57371595ad.140.2025.02.16.08.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 08:37:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Upgrade to latest tip of trunk
Date: Sun, 16 Feb 2025 08:37:09 -0800
Message-ID: <20250216163709.3460272-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 16:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211506

* c47ad25e iconv: harden UTF-8 output code path against input decoder bugs
* 4c4f15da hasmntopt: match only whole options not arbitrary substrings
* e5adcd97 iconv: fix erroneous input validation in EUC-KR decoder
* 5e594aea iconv: fix erroneous decoding of some invalid ShiftJIS sequences
* 6af4f25b s390x: manually inline __tls_get_addr in __tls_get_offset
* 5ccf05d8 ldso: don't reclaim zero-memory-sized segments
* 1a985764 sched.h: reduce namespace conflicts in _GNU_SOURCE profile
* d36e5bf8 mq: add x32-specific implementations to work around mismatched kernel ABI
* 561cd07d SIGEV_THREAD timers: re-block signals when reusing kernel thread
* 47fa6e4f SIGEV_THREAD timers: fix fatal signal if internal SIGTIMER becomes unblocked

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 4d44a8cda32..5ef8d7bca97 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "61399d4bd02ae1ec03068445aa7ffe9174466bfd"
+SRCREV = "c47ad25ea3b484e10326f933e927c0bc8cded3da"
 
 BASEVER = "1.2.5"
 

