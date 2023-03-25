Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445DBC7619A
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 09:01:01 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.17924.1679734851992128712
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 02:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fd95XOW5;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so4403648wmq.4
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 02:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679734850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mMItSEjPXplRBIUOL0C49SoMfstC/0zSrxooyg7I/LM=;
        b=fd95XOW5TUwcBzCbO0qzaD/479HBRnoiYUk9aAI/pdyc5m7qCAqgTp9JzwjBvyBWua
         L46QCs5i3egHSYgQGbVS//HH4kARWIJYD6NluZuSPPQ0HA/c//9U3lLD1wlPeo+uUOsk
         vdGZwMSVNnhqnZTTK9Em+Jx/4d9CgILYvZRhGozXZq5GVGxd/7Zy5j4qwY0+mOhidpyE
         g1pseYsiq6MvX2FRnmOM+dTy2J1eSt/XsOvJ0HZBy9rhhqrZMNPTGqyxGWQmICQ40dHo
         lIvN2+j4/fczgblmxl00q8blNVy/2bkERr3WILalRvuQQcWes68EDxR5tUneuRF6srVV
         VEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679734850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMItSEjPXplRBIUOL0C49SoMfstC/0zSrxooyg7I/LM=;
        b=32bIK31cNZPwQhV8sp3ob5+E+j58wqdERQH60QWs+ZjSLX0R+rmhj/PMCNlvBOTpfq
         JGDUcXz9rVzDtU9tm7qfCNtkQOLbGSrccPNGliTc8nFG8ynwwfaw4JjDuEox1PVJfK2L
         bCKUTN/ZnQtvVweSFKDhB1KrxrHe89PMAzuMDuiOkiJmjX6x+FOeFhXMlwi3O2TtgVnS
         R/pXRemDvnETeEMptXYwlkf6MpKlx8yUHYm5EyAYzoVUHIbqJ799ypZiN/5HReWjVgqf
         uAFhYvcMjAuHrH8uWdUQjnrcIWMRGYcjr0tu5vL+FzAXO4VPT4+uuULihUEjXpEe9VJG
         wEEQ==
X-Gm-Message-State: AO0yUKXpZngbJk7zQevihzXDhSxGS5ItYGOn13boJHn8j0eStFrBQwfU
	Huymp+mcEOLHRPuwTpIxIYThea66CVo=
X-Google-Smtp-Source: AK7set+6wojl6K7FAxXP5h5ei3+4huBKH2tVXZLWseMsZywsWteJBcPyV+ytNTUA2F/HVnykYrIFwA==
X-Received: by 2002:a7b:c7c5:0:b0:3ed:809b:79ac with SMTP id z5-20020a7bc7c5000000b003ed809b79acmr4395004wmk.19.1679734849877;
        Sat, 25 Mar 2023 02:00:49 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:a02e:c702:681f:71a5])
        by smtp.gmail.com with ESMTPSA id c16-20020adffb50000000b002c56179d39esm20226621wrs.44.2023.03.25.02.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 02:00:49 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH 0/5] Extend cargo based recip support
Date: Sat, 25 Mar 2023 10:00:30 +0100
Message-Id: <cover.1679734210.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 09:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179089

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This series brings the support of local git repository inside
a cargo based recipe.

It also enable devtool capacity on it and provide a real crate
example recipe to show how things are done.

The following changes since commit 4876189dd2ae5a04a296b11b537b9f613159c6bf:

  xcb-proto: Fix install conflict when enable multilib. (2023-03-23 22:38:41 +0000)

are available in the Git repository at:

  https://gitlab.com/fmartinsons/openembedded-core cargo-extend-support-git-and-devtool

Alex Kiernan (1):
  cargo_common.bbclass: Support local github repos

Frederic Martinsons (4):
  cargo_common.bbclass: add support of user in url for patch
  rust-example: provide a recipe for zvariant
  devtool: add support for multiple git url inside a cargo based recipe
  patch: support of git patches when the source uri contained subpath
    param

 meta/classes-recipe/cargo_common.bbclass      |   40 +
 meta/classes/externalsrc.bbclass              |    3 +
 meta/lib/oe/patch.py                          |   57 +-
 .../rust-example/zvariant-crates.inc          |  145 ++
 .../0001-Tweak-zvariant-cargo-config.patch    | 1249 +++++++++++++++++
 .../rust-example/zvariant_3.12.0.bb           |   20 +
 6 files changed, 1501 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-extended/rust-example/zvariant-crates.inc
 create mode 100644 meta/recipes-extended/rust-example/zvariant/0001-Tweak-zvariant-cargo-config.patch
 create mode 100644 meta/recipes-extended/rust-example/zvariant_3.12.0.bb

-- 
2.34.1


