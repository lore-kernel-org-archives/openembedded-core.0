Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C895AC83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 13:38:23 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.10921.1751377097255463191
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 06:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Wj9kLe1F;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso5895621a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 06:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751377096; x=1751981896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EN/DhUF0FoVjsghV8GKYMp1ZUhUk+Cz/fXrAa/iR5EE=;
        b=Wj9kLe1FcoZl/zcjxBTXv/07mgWsxb4XLKWsR4JQT4IEit+ER0TA0xXmDo6urszNQP
         4UJPDSVqHAzMe1fupPru5XWYbMEv+0tVAlC0eLjOt4M+Wfcnro7dsTIoseLvHXM1jt06
         w2ZsyFX9UyqYlmmCMH9cWe++Enb1AvKu2MY3c7wkhg7pUiuktNUMcBWcFV0jDlQyf5Ip
         VikzB8IgDj5xnLOA6/IotGhqsHCO791tEwdL787FzzEwXfrYXW2rY0D/ZPk9HEGDhTWw
         L8isRbXWBxYWmdFjE1cs+tQaNYD2e0sdJGjc/5+JDjgJKMA9PagqfNyCEH+3kNmvbo+n
         tkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751377096; x=1751981896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EN/DhUF0FoVjsghV8GKYMp1ZUhUk+Cz/fXrAa/iR5EE=;
        b=RMweTj7PZEbD/BhrvstPg+lm2kmAYMF0N1iDTdIFA7bWZpYsMKoGfGryS9RAwfZQFZ
         rOQELLANw3TAKxhJyimgYxE6m+NFERha5/ZrV41LLHRIjMhACWpZCjbHD0yjUHm9YgMM
         YxF0tPJGvhZZwDdnJt4oMpwc+i2ZpBgGs9Qpc22/Mwyldwh4D8+BUn5eXH23yWOK5h0F
         weq0VBHcESVkQ68DVZCZ+38EtAB03a5aRQ3MjnuNwXJIht0RLNeFnC1Z7p1tnuwK0jaj
         2CSDQ0vCcj+eJLJ+FJwSnuY8aMVedx/fs7cSxRlynabSIb+kTLaQr0wVFTxUcxj2hXKJ
         gzig==
X-Gm-Message-State: AOJu0YwKdAkQfVsmEiAIP0m17LB+VtcULnhn74JSUlIDPNpzKyc18cQN
	Xy/ZysPgt+gtcPjKd2bIp6tNr+qlGOLNW1BUeqqIDacKH0v+yn9FoOs4+XWN7FEsKnVTWuARuIk
	H61v9
X-Gm-Gg: ASbGncugEH5EkNHH2yrjMCFCkqas/7I79LGx6KkTlaq3T/nZsREx5GgzhpI+XMmE6xc
	oD2imN6wP8KMaCviBIxAanxi7Ak4s2xLir7IkUfJr6EjWYceYrGNoluxhJGxAnuOXKug6GUfPmN
	G5oWKAaG7kcZKygJcLiTkWpbrlbg3tnFrmVV28elryvdZ4poTyFK6NHTUcJ8uOUXz8AfzsXkjjl
	XKFUGfQm+1pLoa+tEqWfVQVfoMLrH3Z5wMaBCVfTsr3ddD4GZpaRpBEeNX60Jr1ngEOZrwpUJkM
	x7ix0rsFnIVv57aTpJ1scKL4GyaoiSYhRgc0rb2DEYiZJVR7ylxikUMHBv4kSQeD
X-Google-Smtp-Source: AGHT+IEa4gyh/+e1fx92BnI8TSLOZrnxC9155W7ajQwEd75Fz4WA+XZ9WMoQzGozyvQy5nEoXZaMoA==
X-Received: by 2002:a17:90b:4f4b:b0:311:f05b:86a5 with SMTP id 98e67ed59e1d1-318c8ce555fmr30243830a91.0.1751377095860;
        Tue, 01 Jul 2025 06:38:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c152331fsm11466117a91.44.2025.07.01.06.38.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 06:38:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 00/11] Patch review
Date: Tue,  1 Jul 2025 06:37:58 -0700
Message-ID: <cover.1751376952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 13:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219571

Please review this set of changes for walnascar and have comments back by
end of day Thursday, July 4

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1914

The following changes since commit ead0d06d6335fb74c1ae0dc7bdcf414c66b3e4ab:

  cmake: Correctly handle cost data of tests with arbitrary chars in name (2025-06-20 09:36:36 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Colin Pinnell McAllister (1):
  libarchive: fix CVE-2025-5914

Guocai He (1):
  tcf-agent: correct the SRC_URI

Guðni Már Gilbert (1):
  python3: drop old nis module dependencies

Praveen Kumar (1):
  python3-setuptools: fix CVE-2025-47273

Rasmus Villemoes (1):
  sstate: apply proper umask when fetching from SSTATE_MIRROR

Richard Purdie (3):
  xwayland: Add missing libtirpc dependency
  oeqa/sstatetests: Fix NATIVELSBSTRING handling
  oeqa/sstatetests: Improve/fix sstate creation tests

Robert Yang (1):
  package_rpm.bbclass: Remove empty build directory

Yogita Urade (2):
  python3-urllib3: fix CVE-2025-50181
  python3-urllib3: fix CVE-2025-50182

 meta/classes-global/package_rpm.bbclass       |   1 +
 meta/classes-global/sstate.bbclass            |  22 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py   |  97 +++---
 .../CVE-2025-47273-pre1.patch                 |  55 ++++
 .../python3-setuptools/CVE-2025-47273.patch   |  60 ++++
 .../python/python3-setuptools_76.0.0.bb       |   5 +-
 .../python3-urllib3/CVE-2025-50181.patch      | 283 ++++++++++++++++++
 .../python3-urllib3/CVE-2025-50182.patch      | 125 ++++++++
 .../python/python3-urllib3_2.3.0.bb           |   5 +
 .../recipes-devtools/python/python3_3.13.4.bb |   2 -
 .../tcf-agent/tcf-agent_git.bb                |   4 +-
 .../libarchive/libarchive/CVE-2025-5914.patch |  46 +++
 .../libarchive/libarchive_3.7.9.bb            |   4 +-
 .../xwayland/xwayland_24.1.6.bb               |   2 +-
 14 files changed, 639 insertions(+), 72 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273-pre1.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2025-47273.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-50181.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch

-- 
2.43.0


