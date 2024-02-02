Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA5CC47DB3
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 14:41:19 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.24089.1706884870530709392
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 06:41:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=fzpieVQO;
 spf=pass (domain: madison.systems, ip: 209.85.210.182, mailfrom: matt@madison.systems)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6de0f53f8e8so2609813b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 06:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google; t=1706884869; x=1707489669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bnOs0Ek5h2zoGYD6BRSeNuvUeXCrgLzWYVI/X6hJeOE=;
        b=fzpieVQOV9Ms2o6IIPey49y3j67MZeFVxW/Hxrcrf5CDOSG8jJOGA0kDzLqd/15lnO
         eDYdpkReLl7S6DHD9Wn5Zx59tZnP4L2r+1PZF6dPI1R8LKTTb3ECpy33821amy3OUXN2
         uuW4mwEPdSpD+eOFaUoxZ88O/OtrBLuokjXLaBR9SALx7qn8lCzW0Zz0zfthpGJJYgt0
         XbbXzFk2P+fl3XIchRWv9ptCDQ4dLtvHTEiYp9hyD8t6+OYBE5bb5gSafhQ9ad3xPehz
         cPN2wmGnhtf6tMeOdTahPhz7y3Kprn5tGjrkLgUoH42hhZebUVRVxp879mJgf+wzVxrX
         C6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706884869; x=1707489669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnOs0Ek5h2zoGYD6BRSeNuvUeXCrgLzWYVI/X6hJeOE=;
        b=GGLNaC58RaYMEH3HpTIKuZd2GQPzfCcmhw16Pd+oPtVeBtEgKlBjlhFGzVFD3qq5+H
         jx+ESDNtxQSjkUVZ/EY8k1u/qO7cEy35X/wvnRCbIeEhPZRZWp1mTMuTCo81gbWml6Dd
         7DWrU0kQ4Mv+9/nBRzWQhijA02alMfbQ3QxQAUpfDz/+rhhrCxLyqFXQxbGc+1hzfj7Q
         SHJT7ZKvfLDRLFwIUYtT1XLQp03xGs3VWqjdEYZLQBvVnAAsoG4U+P81nqsnFpr00hqQ
         Z4ainYaNny4yTkV5IYKZ78W92M2qPxPRwhdPt5FIYxUdAbMLk4A9uyE14ByGmtVMWBn9
         JIeQ==
X-Gm-Message-State: AOJu0YwoD3GwIhTAApZxFQFuz3PWy0RKYbU51JTirqYRBzI4spOB0HKn
	YJcS/MEY7hBs8EqEEXjmL+gr5AI5tuoViS1ELnSKjWBMwposFrAgFwh37GVnHETjEFZrHZhTvcq
	J
X-Google-Smtp-Source: AGHT+IHzJFgozz8z6MLsi91DHEMQAgmcJRmmeoGO4HvUd/8h8oLRpxD9nYYdpSOJWXAlVBfmIT6MzQ==
X-Received: by 2002:a05:6a00:6601:b0:6df:fc74:2802 with SMTP id he1-20020a056a00660100b006dffc742802mr1186373pfb.16.1706884869016;
        Fri, 02 Feb 2024 06:41:09 -0800 (PST)
Received: from visar.local ([2600:1700:87f0:9cff:50be:6081:b8b1:4e2c])
        by smtp.gmail.com with ESMTPSA id p21-20020a056a000a1500b006dab36287bfsm1696042pfh.207.2024.02.02.06.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 06:41:08 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Cc: Matt Madison <matt@madison.systems>
Subject: [PATCH] pseudo: add patch with statvfs64 wrapper
Date: Fri,  2 Feb 2024 06:40:42 -0800
Message-Id: <20240202144042.675454-1-matt@madison.systems>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 14:41:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194800

rpm 4.19 now builds with LFS64 support enabled by default,
so it calls statvfs64() to get the space available on the
filesystem it is installing packages into.  This is not
getting caught by pseudo, so rpm is checking the host's
root filesystem, rather than the filesystem where the
build is happening.

The patch here adds the missing wrapper, so pseudo performs
the correct path remapping.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 ...orts-linux-add-wrapper-for-statvfs64.patch | 50 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-ports-linux-add-wrapper-for-statvfs64.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-ports-linux-add-wrapper-for-statvfs64.patch b/meta/recipes-devtools/pseudo/files/0001-ports-linux-add-wrapper-for-statvfs64.patch
new file mode 100644
index 0000000000..bf22cdeaf9
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-ports-linux-add-wrapper-for-statvfs64.patch
@@ -0,0 +1,50 @@
+From e3eca18e28859b6d8a1450eac22dbb314e8e6225 Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Sun, 28 Jan 2024 09:49:55 -0800
+Subject: [PATCH][pseudo] ports/linux: add wrapper for statvfs64
+
+rpm 4.19 now builds with LFS64 support enabled by default,
+so it calls statvfs64() to get the space available on the
+filesystem it is installing packages into.  Add a wrapper
+for this call so the right filesystem is used.
+
+Upstream-Status: Submitted [https://lists.openembedded.org/g/openembedded-core/message/194464]
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ ports/linux/statvfs/guts/statvfs64.c | 15 +++++++++++++++
+ ports/linux/statvfs/wrapfuncs.in     |  1 +
+ 2 files changed, 16 insertions(+)
+ create mode 100644 ports/linux/statvfs/guts/statvfs64.c
+
+diff --git a/ports/linux/statvfs/guts/statvfs64.c b/ports/linux/statvfs/guts/statvfs64.c
+new file mode 100644
+index 0000000..856d3db
+--- /dev/null
++++ b/ports/linux/statvfs/guts/statvfs64.c
+@@ -0,0 +1,15 @@
++/*
++ * Copyright (c) 2018 Wind River Systems; see
++ * guts/COPYRIGHT for information.
++ *
++ * SPDX-License-Identifier: LGPL-2.1-only
++ *
++ * int statvfs64(const char *path, struct statvfs64 *buf)
++ *	int rc = -1;
++ */
++
++	rc = real_statvfs64(path, buf);
++
++/*	return rc;
++ * }
++ */
+diff --git a/ports/linux/statvfs/wrapfuncs.in b/ports/linux/statvfs/wrapfuncs.in
+index 1afb64d..6a59660 100644
+--- a/ports/linux/statvfs/wrapfuncs.in
++++ b/ports/linux/statvfs/wrapfuncs.in
+@@ -1 +1,2 @@
+ int statvfs(const char *path, struct statvfs *buf);
++int statvfs64(const char *path, struct statvfs64 *buf);
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 699cab11c6..f15fb0aaee 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -3,6 +3,7 @@ require pseudo.inc
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
            file://0001-configure-Prune-PIE-flags.patch \
            file://glibc238.patch \
+           file://0001-ports-linux-add-wrapper-for-statvfs64.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.34.1


