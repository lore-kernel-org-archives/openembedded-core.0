Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FBBCF34D3
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 23:01:50 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.9952.1727996507843684266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Oct 2024 16:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UWPto134;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20bb610be6aso17021115ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Oct 2024 16:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727996507; x=1728601307; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M9OUCrs+aJpJ7EGOKFCkEloIOzOBphae6icH0f+ubzU=;
        b=UWPto134hBv/1dqEil0adx/1WwsXoayD7KbSgbvCJ5oj7arLOFUCOJjyTf8tSATc5D
         rzWvnfrNWfxhuV6bv8fJza0HlCjd44gtg+lo6qlL+KUR8a9ep5M8///djbh1gTXKro4D
         8iy2CvIWzd82JBN/NiGwzJT1UNvrQQuqe2HqcX32h0Ur7WVpVfGYguT2nqsvl2A0t+or
         DQzPJt7A6wN84iP7uu1cbJiGBRDGMhMdvbVxgJlIL3npacdz+/j0jRyB+3UjqYgJGzu4
         CeIhqtLjY2baMRPl6U4opGB/Tk2ZUP3YpgLi/s5OU2z7RAZ+Y+DznVTLvIXrRm807PXi
         8NCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727996507; x=1728601307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9OUCrs+aJpJ7EGOKFCkEloIOzOBphae6icH0f+ubzU=;
        b=WsvtK9h6OA66RhmRhIWksBHeR0fk8YrXIQmy0vx+RBjnj4xiCrn4i/04/gS8VMooZD
         pUpjvo34gjmAlexolqXYrXsGflRCyApVDshIb736KUHG8VcFKuzQYs5WBnEnj3STIgqa
         7L5PGJIs4c5vnktyrqLrF1CyqULK/d02FmCfNToJ6JgFV/iitwpmDGp2cCms4dDFaqYn
         uDT3BJB2VVIFsXqbn6zXfftCu8ugVvKJyewEGuSymAj+AgPwYn3eu/7KpfoChEiMrGNK
         sIRnsrGr6kRKyhPUtcPX7R2WqlGMxJVgtwWpaZHx2OaWRJaC8XHM326avDkkBCLpvDiF
         TLlg==
X-Gm-Message-State: AOJu0Yyrw7KICifi0dK75p5wuNWkXXPb4qrzlQvu4XV7f898pF20i4KC
	0WZaxbv3chk0Pt4yWYNamEKPZbfvn68But76qqUf4CSPnLsOhIQR6ANVNhws
X-Google-Smtp-Source: AGHT+IHJnnHSWoBL4hNrGjjTcuT4YiXWwjRo6+OZA9/hFAaI859yzQyLEw4RwubdA++NKQ8sEaBwFQ==
X-Received: by 2002:a17:902:ce05:b0:20b:c287:202d with SMTP id d9443c01a7336-20bfef2fa55mr12168095ad.55.1727996506858;
        Thu, 03 Oct 2024 16:01:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::1340])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20bef7fd7a8sm13761315ad.259.2024.10.03.16.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 16:01:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] valgrind: Drop patch regressing fdleak_cmsg test
Date: Thu,  3 Oct 2024 16:01:44 -0700
Message-ID: <20241003230144.900743-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Oct 2024 23:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205220

This patch is regressing on some distros where systemd
is used and /var/tmp is same as /var/volatime/tmp

Removing this tweak also passes on poky. So I wonder
if we really need this patch anymore

Fixes

--- fdleak_cmsg.stderr.exp      2011-04-05 23:00:00.000000000 +0000
+++ fdleak_cmsg.stderr.out      2024-10-03 18:43:03.611527646 +0000
@@ -25,10 +25,10 @@

 FILE DESCRIPTORS: 6 open (3 std) at exit.
-Open file descriptor ...: ...
+Open file descriptor ...: /tmp/data2
    ...

-Open file descriptor ...: ...
+Open file descriptor ...: /tmp/data1
    ...

 Open AF_UNIX socket ...: <unknown>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>
---
 ...eak_cmsg.stderr.exp-adjust-tmp-paths.patch | 34 -------------------
 .../valgrind/valgrind_3.23.0.bb               |  1 -
 2 files changed, 35 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
deleted file mode 100644
index e421ac6c801..00000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f405297d3382cd98391d02f397e2387da1f42879 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 24 Jan 2020 17:55:39 +0100
-Subject: [PATCH] none/tests/fdleak_cmsg.stderr.exp: adjust /tmp paths
-
-In oe-core, /tmp is linked to /var/volatile/tmp and
-valgrind output changes accordingly
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- none/tests/fdleak_cmsg.stderr.exp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/none/tests/fdleak_cmsg.stderr.exp b/none/tests/fdleak_cmsg.stderr.exp
-index 6e5a797b9..0ede1ab18 100644
---- a/none/tests/fdleak_cmsg.stderr.exp
-+++ b/none/tests/fdleak_cmsg.stderr.exp
-@@ -25,10 +25,10 @@ Open file descriptor ...: /dev/null
- 
- 
- FILE DESCRIPTORS: 6 open (3 std) at exit.
--Open file descriptor ...: /tmp/data2
-+Open file descriptor ...: ...
-    ...
- 
--Open file descriptor ...: /tmp/data1
-+Open file descriptor ...: ...
-    ...
- 
- Open AF_UNIX socket ...: <unknown>
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.23.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.23.0.bb
index 494a3c0df91..21beed94f2a 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.23.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.23.0.bb
@@ -31,7 +31,6 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch \
            file://0001-memcheck-vgtests-remove-fullpath-after-flags.patch \
            file://s390x_vec_op_t.patch \
-           file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-docs-Disable-manual-validation.patch \
            file://0001-tests-arm-Use-O-instead-of-O0.patch \

