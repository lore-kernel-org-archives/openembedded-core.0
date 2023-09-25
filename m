Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E22C2FC03
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 18:04:24 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.68357.1695665056145109541
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 11:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nqcq1bLc;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-27760c31056so1533492a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 11:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695665055; x=1696269855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w62YEtg/ZpCW90rCsSmCYH08TQHl96DpLs8uvgeu3ZI=;
        b=nqcq1bLcxfKE34Dan3TNic1W/r+UcoiE66yRCAVrEumDxaqYK38dK9/GbjabpWqL9A
         uvyMVXmp9uHbFBFOrg7jolE3I5iJs8BANZqkh61MHCHojx/GRMC+IrvZ7MYvBwulR05N
         7wxOJPXyOtNMlNMEOV0NfsR5hL7k8nbM5aO+2dr293BYghfZPPo7tc+7EIkFXcZiyDGC
         SKDliRv7t/Vb8zyzgLEGJ52IRj7wMiV2nXZtZLP4tpCyWpC1bfcEU/lHEnLH0UrHLJtZ
         TEOWAwbXeES++Gi8l+Ps8daGRK7fwhK+wG0sD52NoF5XdNE2a1clH3p0+mN3uVH2rkHn
         O/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695665055; x=1696269855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w62YEtg/ZpCW90rCsSmCYH08TQHl96DpLs8uvgeu3ZI=;
        b=kLbGVB2mZzbL8HftmrRLc0Qw9cYaUDi9/FHvAifXACg7LKjIL6JZeOJ2GmWvwCcXEd
         XtyuOaO7fXhjIHf9+kPYM27pgBvqZ+j5CYF0LeUVDky0mESYA9qIRtDzajbSKTj72JXh
         I23jlQ0NJVDI6+nVElhxRntHmN7wUSY876FeMAITHr9D9odG1BM8V4ZgrOZHAFi8nb4v
         Yr9igIT0GdtXez5JhYtUclZ51KmDfG15s/poA9qtbSrbJyNydQUW8ZjMtLbvHK1WJB3l
         FlqlVP4JAkxAK3Py8qadpEZZgrGAvSYo8J5z6cf+zK11xkJmayqHb/LeJUqPrEo5U4sU
         HCkA==
X-Gm-Message-State: AOJu0YwRb5SUALOrmJ+cSGHUjgCmAqWeT5qQRSk9FL07/9thxPCCLTWn
	whd6YGJ705ANXFlHNSl/GzAPa79gfeFuxQ==
X-Google-Smtp-Source: AGHT+IEiseESVwck1j+YC58QXezGrD1g4H6NhokeLMTfmUtYDRFgazmbxrTRxhxELm57VjHlqyKjDg==
X-Received: by 2002:a17:90a:eb17:b0:26d:1a49:d1e9 with SMTP id j23-20020a17090aeb1700b0026d1a49d1e9mr5278180pjz.17.1695665055207;
        Mon, 25 Sep 2023 11:04:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id u23-20020a17090abb1700b00267d9f4d340sm9993226pjr.44.2023.09.25.11.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 11:04:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 0/2] Fix musl patches for 254.4
Date: Mon, 25 Sep 2023 11:04:10 -0700
Message-ID: <20230925180412.1765616-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 18:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188203

Drop the backports
Fix patch-fuzz

Khem Raj (2):
  systemd: Drop two upstreamed musl patches
  systemd: Refresh patches to avoid patch-fuzz

 ...14-Use-uintmax_t-for-handling-rlim_t.patch | 23 ++---
 ...-not-disable-buffer-in-writing-files.patch | 89 +++++------------
 .../0022-Handle-__cpu_mask-usage.patch        |  9 +-
 .../0025-include-sys-file.h-for-LOCK_EX.patch | 29 ------
 ...-Include-sys-timex.h-for-struct-time.patch | 28 ------
 ...clude-missing-sys-file.h-for-LOCK_EX.patch | 98 -------------------
 meta/recipes-core/systemd/systemd_254.4.bb    |  3 -
 7 files changed, 31 insertions(+), 248 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0025-include-sys-file.h-for-LOCK_EX.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0026-test-test-sizeof-Include-sys-timex.h-for-struct-time.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0027-include-missing-sys-file.h-for-LOCK_EX.patch

-- 
2.42.0


