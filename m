Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FE4C021AA
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 21:10:38 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.7400.1739913029084895632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 13:10:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UhFQHw6z;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fa8ac56891so8632937a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739913028; x=1740517828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcgDwIeG9rHszKQyq1GKWbk6oW9+RtHMW2rhhKwus9I=;
        b=UhFQHw6z1PljW1Pxt1u2g2Cpp3opdG2f1hAH+XEbQBwEEsXPpEKwFlJ0COPSNrzaUx
         /c8zKa63sJ4I4ujZUv+aHKOmQLP1oarX/xWXZ7x3SxyOSvYe3NMD2cMMCNR/UDI1V9r6
         tuhTSJdj6SlUnQ9mxPenl/B77CMuku/SF5d5ddoXtWYpCvA7tWApkt6EfoFMsR0CKPgM
         jpFhKc3mfhwVWGKd3aQ5ByhSX6nSmNaIUhPcp1RQIEtnjS03FY90vtNLgk0v/dvZ2fMh
         ziBhxwOLbIDO06EVIw8knTQsf0qEuZ6Oyezutokee5gxIv5u+Y4IhSInWdwyhrTldRkv
         scyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739913028; x=1740517828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcgDwIeG9rHszKQyq1GKWbk6oW9+RtHMW2rhhKwus9I=;
        b=uamns1acg7Q6+uqV/O+y4WhInxLIlSMNmli9R37pU++OdJqWu6auEtWNA61nTwJ6Q0
         0Wvj6qtZ1rU9gNsVYdZN/ayruPPBaut9iZgVqqIxDZCMDjfpz4QdaaubleiOWMUWaVwV
         iPbLbdUKS3AdmUzaZguFuvyWugK/PgKpzUpyIXRD2bXI6p32wcaH/nFkzzht7x2+O7uz
         OHGXs9TfklcDPFJYY0nSDwAuRQ+JGcwU/zWxgwODk5/fW8394OHTNOMTQ68WL1QZJuCF
         5/ttWUx8WuZWQKRHPSNxsu2NyAkoNUmDFmlUfWV3uDMA16Y5vmg5kznGtKozluO90s3y
         knEg==
X-Gm-Message-State: AOJu0YwvYrvaiGgqQv0vE7kaOPc07P4DwmU+o5UT7Rqiwe38lpr5WIY5
	uqBVoqJDHQ6NAARsCUymRpAADfrpqBXE4RJHAakRk9mCCCwJ1g189iNasyOuQa+juhTeYMywEqM
	Q
X-Gm-Gg: ASbGncsN7QEH/m9I+mNj1pjoYP7XrlUzRZQ9MepxvAHjPnDe/TK59BKLhTO/zWgG1iI
	geDdnTCx3t0KVAolJV7PDN0qEtrZjSPyRsd8KiGsl4bO2ONFIInV1mdzDSoVattKIKSR1IjhjQ7
	nMXcSCItk/aO7QNo+gwFMo2F6++8ouPASFsrQZfVUhqf3boOsWyQPN9aANxMHqClMLslBOjYnjC
	r9tmrY/XNKxR/bzivWSJ7fTiAPoXuQ3y+WHWFI/aL65Dgg+vnVXd02DVSxciig15G8c5NpXcR3y
	rm1NAUs=
X-Google-Smtp-Source: AGHT+IFpI2CKvRBMAp3wY04gLfXfnj2CHtdX1uBFp7snPBoU9J93WX9E3CvrnC+4frH4xE1BMobb2g==
X-Received: by 2002:a17:90b:3b92:b0:2fa:15ab:4de7 with SMTP id 98e67ed59e1d1-2fc40f10763mr28350649a91.12.1739913028282;
        Tue, 18 Feb 2025 13:10:28 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:83c7:94a9:a555:bf05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b326bsm12820720a91.1.2025.02.18.13.10.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:10:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/12] procps: replaced one use of fputs(3) with a write(2) call
Date: Tue, 18 Feb 2025 13:10:05 -0800
Message-ID: <824dc4695add682052106401c912772469fa8169.1739912869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739912869.git.steve@sakoman.com>
References: <cover.1739912869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 21:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211651

From: Mingli Yu <mingli.yu@windriver.com>

This patch is ported from a merge request shown below,
and the following represents the original commit text.

------------------------------------------------------
top: In the bye_bye function, replace fputs with the write interface.

When top calls malloc, if a signal is received, it will
call sig_endpgm to process the signal. In the bye_bye function, if the
-b option is enable, the Batch variable is set, the fputs function
will calls malloc at the same time. The malloc function is not reentrant, so
it will cause the program to crash.

Signed-off-by: Shaohua Zhan <shaohua.zhan@windriver.com>
------------------------------------------------------

Reference(s):
https://gitlab.com/procps-ng/procps/-/merge_requests/127

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...x-for-the-bye_bye-function-merge-127.patch | 58 +++++++++++++++++++
 ...e-use-of-fputs-3-with-a-write-2-call.patch | 50 ++++++++++++++++
 meta/recipes-extended/procps/procps_3.3.17.bb |  2 +
 3 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps/0001-top-fix-a-fix-for-the-bye_bye-function-merge-127.patch
 create mode 100644 meta/recipes-extended/procps/procps/0001-top-replaced-one-use-of-fputs-3-with-a-write-2-call.patch

diff --git a/meta/recipes-extended/procps/procps/0001-top-fix-a-fix-for-the-bye_bye-function-merge-127.patch b/meta/recipes-extended/procps/procps/0001-top-fix-a-fix-for-the-bye_bye-function-merge-127.patch
new file mode 100644
index 0000000000..bbc137a3d8
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/0001-top-fix-a-fix-for-the-bye_bye-function-merge-127.patch
@@ -0,0 +1,58 @@
+From 37f106029975e3045b0cd779525d14c55d24b74e Mon Sep 17 00:00:00 2001
+From: Jim Warner <james.warner@comcast.net>
+Date: Mon, 21 Jun 2021 00:00:00 -0500
+Subject: [PATCH] top: fix a fix for the 'bye_bye' function (merge #127)
+
+In the merge request shown below, 1 too many bytes are
+written to stdout thus including the terminating null.
+As the cure, this commit just reduces the length by 1.
+
+[ along the way, we will remove some unneeded braces ]
+[ plus add some additional comments with attribution ]
+
+Reference(s):
+https://gitlab.com/procps-ng/procps/-/merge_requests/127
+. original merged change
+commit 0bf15c004db6a3342703a3c420a5692e376c457d
+
+Signed-off-by: Jim Warner <james.warner@comcast.net>
+
+Upstream-Status: Backport [https://gitlab.com/procps-ng/procps/-/commit/37f106029975e3045b0cd779525d14c55d24b74e]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ top/top.c | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/top/top.c b/top/top.c
+index 4d9860d5..0d21a1a5 100644
+--- a/top/top.c
++++ b/top/top.c
+@@ -569,13 +569,21 @@ static void bye_bye (const char *str) {
+ #endif // end: OFF_HST_HASH
+ 
+    numa_uninit();
++
++   /* we'll only have a 'str' if called by error_exit() |
++      or that xalloc_our_handler() function. if we were |
++      called from a sig_endpgm(), that parm is NULL ... | */
+    if (str) {
+       fputs(str, stderr);
+       exit(EXIT_FAILURE);
+    }
+-   if (Batch) {
+-      write(fileno(stdout), "\n", sizeof("\n"));
+-   }
++   /* this could happen when called from several places |
++      including that sig_endpgm().  thus we must use an |
++      async-signal-safe write function just in case ... |
++      (thanks: Shaohua Zhan shaohua.zhan@windriver.com) | */
++   if (Batch)
++      write(fileno(stdout), "\n", sizeof("\n") - 1);
++
+    exit(EXIT_SUCCESS);
+ } // end: bye_bye
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/procps/procps/0001-top-replaced-one-use-of-fputs-3-with-a-write-2-call.patch b/meta/recipes-extended/procps/procps/0001-top-replaced-one-use-of-fputs-3-with-a-write-2-call.patch
new file mode 100644
index 0000000000..4da13df047
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/0001-top-replaced-one-use-of-fputs-3-with-a-write-2-call.patch
@@ -0,0 +1,50 @@
+From 6b8980a3b6279058d727377e914cfb6439d6f178 Mon Sep 17 00:00:00 2001
+From: Shaohua Zhan <shaohua.zhan@windriver.com>
+Date: Mon, 22 Mar 2021 00:00:00 +0800
+Subject: [PATCH] top: replaced one use of fputs(3) with a write(2) call
+
+This patch is ported from a merge request shown below,
+and the following represents the original commit text.
+
+------------------------------------------------------
+top: In the bye_bye function, replace fputs with the write interface.
+
+When top calls malloc, if a signal is received, it will
+call sig_endpgm to process the signal. In the bye_bye function, if the
+-b option is enable, the Batch variable is set, the fputs function
+will calls malloc at the same time. The malloc function is not reentrant, so
+it will cause the program to crash.
+
+Signed-off-by: Shaohua Zhan <shaohua.zhan@windriver.com>
+------------------------------------------------------
+
+Reference(s):
+https://gitlab.com/procps-ng/procps/-/merge_requests/127
+
+Signed-off-by: Jim Warner <james.warner@comcast.net>
+
+Upstream-Status: Backport [https://gitlab.com/procps-ng/procps/-/commit/6b8980a3b6279058d727377e914cfb6439d6f178]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ top/top.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/top/top.c b/top/top.c
+index f4f82be4..951c240c 100644
+--- a/top/top.c
++++ b/top/top.c
+@@ -417,7 +417,9 @@ static void bye_bye (const char *str) {
+       fputs(str, stderr);
+       exit(EXIT_FAILURE);
+    }
+-   if (Batch) fputs("\n", stdout);
++   if (Batch) {
++      write(fileno(stdout), "\n", sizeof("\n"));
++   }
+    exit(EXIT_SUCCESS);
+ } // end: bye_bye
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/procps/procps_3.3.17.bb b/meta/recipes-extended/procps/procps_3.3.17.bb
index bbec5a543c..131063efb9 100644
--- a/meta/recipes-extended/procps/procps_3.3.17.bb
+++ b/meta/recipes-extended/procps/procps_3.3.17.bb
@@ -18,6 +18,8 @@ SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
            file://0002-proc-escape.c-add-missing-include.patch \
            file://CVE-2023-4016.patch \
            file://CVE-2023-4016-2.patch \
+           file://0001-top-replaced-one-use-of-fputs-3-with-a-write-2-call.patch \
+           file://0001-top-fix-a-fix-for-the-bye_bye-function-merge-127.patch \
            "
 SRCREV = "19a508ea121c0c4ac6d0224575a036de745eaaf8"
 
-- 
2.43.0


