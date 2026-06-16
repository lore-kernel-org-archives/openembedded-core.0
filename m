Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5A0CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:17:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5805.1781637432451979826
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pjQyh+ft;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so32716585e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637431; x=1782242231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZzIxy+FJV1MgFvEVx+4gEi099DYtOJ3wnmbBY0YVbk=;
        b=pjQyh+ftGKoxiAiFXTtZnL3OblKudSct0GIqJRwzjWAvvwwgsEpXojr8zGHf4kaSwz
         mK6vOqBWkOuvRS7TZDZzfu8BWvhpa10jXWSYAHAifuNtenfk43DxWQco1AbBv791VgR8
         u4ywPCVUSe4fPdRJaj/PBfnmoeZ/jP9LoAzWrphE+VU1y0pA4v7HMbZqvZeEptqtM7zC
         fmmLUQ5XLNBxtjol7JAuHRDG6FwPTmt05rP7dyOdBt7JeS03WVFL3JRR0+SP8zzJFWN1
         xUvnTDg8LOyOtJMxsKPpBP2Cm15vBbM/NbVV0Pwq7rUkziGRGvCo7iIvjJRe+bPojv5+
         Qnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637431; x=1782242231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NZzIxy+FJV1MgFvEVx+4gEi099DYtOJ3wnmbBY0YVbk=;
        b=oLTRAqF89kv/8jhdzBuZzwgxQbUiPCnhqJCeG6y+6VW8HpT8lqJ+yQz2c3CzOboXBX
         y9dB0aXN9LjmMQTBrdmrDh3d2uUeEgWZ7E+vs3Lg+T9DsdGmwvJpRgzTReWn0emga7Rn
         84bB1SxQ9eagGGovMH3tHwdKsn00a/4XHN8yvF0EYq8sGod/UYJ9O33pDMR1MtZbU2BD
         azyC5tbdBnaivhitQW57y9UBMRi2IQUVRbqXMKEX4RFi+QOgROY2vVahDUNG4h73tGeh
         xft7CElNxEiKSJ8KMJ8zvt5BMwzxu672duCuZPBVbdE7+9p12qfkaagU5+z7KTIUTG5q
         GXsw==
X-Gm-Message-State: AOJu0YyBniEENeGsJSon+m67iYHNoQOXgPRMfkvZaTdEWyswCo7aa0zh
	smcZ1MQMzHVlRQCf2XgImEFEBs/yJ3UF/ewp4uirMc7rXDR4tGoAnW0x/3VJygB3
X-Gm-Gg: Acq92OEKCKr24ltGTXWtQ1C3ELShv2wrBgs/pXbrhDIkSK0oakYg4cqPgWCYoxN2wxj
	E15AnCCnK8xRvJ8yYfbCCLJYLPeD7eZeIcY19Og29WuixA8a4rdQynxHPknLFvmaoOP+8Qlys72
	vr500NSPgWwEoHBpLSfqzQFqbiQZwzY2YaB0ePa+7ZvzX6fOdausxD2QVfOOxH6WqMoc1MIayDZ
	YrBpCtCErgewh3OSXF9yfUfjSG+LxqU8sPDxPj8pnGOkYRbrutv3QDHbhhiwsiuvaUeFXRVlhu0
	QAW83zTKQsDvuFOgfHc3ALNEHyb8vBXaDgAPeqpMon7oGFvlntREK7M5MbYMj5xu3cLRUo9G2ND
	UoIX7UURrNM7AArPmEMW/3IQB3XnZ9Lh+FRh0OkG75IKNsiHC65x76ug149gZQ+X6MkARFH9z/3
	JXnOO/6RxMI1TwPPU+6umkrvUCTFJIdXgOdoaI9Fnr9aeIGAQzclSE4FuriIE=
X-Received: by 2002:a05:600c:c113:b0:490:c2a3:3302 with SMTP id 5b1f17b1804b1-492333df412mr10754215e9.35.1781637430499;
        Tue, 16 Jun 2026 12:17:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:17:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 30/30] strace: remove skip-bpf.patch
Date: Tue, 16 Jun 2026 21:16:26 +0200
Message-ID: <20260616191628.2014553-30-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:17:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238955

From: Alexander Kanavin <alex@linutronix.de>

Issue was resolved in https://github.com/strace/strace/commit/982e5ff96a670473187ccdf6e2d8ddb3c40c82e1

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../strace/strace/skip-bpf.patch              | 34 -------------------
 meta/recipes-devtools/strace/strace_7.0.bb    |  1 -
 2 files changed, 35 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/skip-bpf.patch

diff --git a/meta/recipes-devtools/strace/strace/skip-bpf.patch b/meta/recipes-devtools/strace/strace/skip-bpf.patch
deleted file mode 100644
index 1fa8c2db2d..0000000000
--- a/meta/recipes-devtools/strace/strace/skip-bpf.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 66edf5d44ba89f73d51657edeeb19fc10d008aea Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Mon, 22 Dec 2025 12:14:45 +0000
-Subject: [PATCH] strace: Skip bpd tests for now since they don't work with the
-
-These tests failed when upgrading to 6.18. Skip them for now until the issue can be resolved
-as the upgrade is needed for newer kernel versons.
-
-Upstream-Status: Inappropriate [issue reported at https://github.com/strace/strace/issues/370]
----
- tests/bpf-v.gen.test | 1 +
- tests/bpf.gen.test   | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/tests/bpf-v.gen.test b/tests/bpf-v.gen.test
-index e57154e..440ddfe 100755
---- a/tests/bpf-v.gen.test
-+++ b/tests/bpf-v.gen.test
-@@ -1,4 +1,5 @@
- #!/bin/sh -efu
- # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (bpf-v -a20 -v -e trace=bpf); do not edit.
- . "${srcdir=.}/init.sh"
-+skip_ "Test doesn't work atm"
- run_strace_match_diff -a20 -v -e trace=bpf
-diff --git a/tests/bpf.gen.test b/tests/bpf.gen.test
-index 1391d6b..c4906b1 100755
---- a/tests/bpf.gen.test
-+++ b/tests/bpf.gen.test
-@@ -1,4 +1,5 @@
- #!/bin/sh -efu
- # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (bpf -a20 ); do not edit.
- . "${srcdir=.}/init.sh"
-+skip_ "Test doesn't work atm"
- run_strace_match_diff -a20 
diff --git a/meta/recipes-devtools/strace/strace_7.0.bb b/meta/recipes-devtools/strace/strace_7.0.bb
index d91f984189..fa86f7bb4e 100644
--- a/meta/recipes-devtools/strace/strace_7.0.bb
+++ b/meta/recipes-devtools/strace/strace_7.0.bb
@@ -12,7 +12,6 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            file://ptest-spacesave.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            file://skip-load.patch \
-           file://skip-bpf.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
 		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
-- 
2.47.3


