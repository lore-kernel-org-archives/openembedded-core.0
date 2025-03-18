Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E90C35FF3
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:39:06 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.2943.1742323139613955101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AY9ENbqG;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3018f827c9bso3499955a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323139; x=1742927939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V76gE1t15i7HtBeNxC7RLmZPcN5O/9N+2cvLc5uxWCw=;
        b=AY9ENbqGmMtyeM4VtkXdwQhj2ONOkS84zHhbw0dfBDVOZkLJlD4gRneDHqaTjxh9Ws
         6U+UpuZBZ36BX/v9Hf174niniA69QI6dHj985wI6nZrH851f/9p2NVft6fKjmz+lraCo
         TAiggDCpWfMXskNCM6QqUG694115c/yJDYITKWj6ieeXfjxuw93vEYSFPqBMlzsEfzGm
         ycBnqjQa/ea0HtW0nr/Eb8Jp6EHflt7TZJfrab/KSMLxo7Q3Zvxhlu6iGJrdsCwOQ77U
         3eaL1G07Q/L5UMZlTmxFtY6FM1Xgn5eqo59n2r+yVlFpjQ2Yqjqc8DuKqwflGxJPrEiU
         QvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323139; x=1742927939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V76gE1t15i7HtBeNxC7RLmZPcN5O/9N+2cvLc5uxWCw=;
        b=K0+ms9i3Qk+lyrPSNWvylVG4DsUFCtfzDWkEZq0DCz7xdCsjjL0nyjaN+sZ9FpbehR
         aTCnDTFTr3OXhAbyvrDpsAlFfnsA1FSAKV9IzA9xTDIqWJTr4nN+iWmvrvKFw1c+bdBB
         5xN6RSi7zKFSrxrpV2vuAs9XCkUicqbfHc0DUPsKakmUHMHdP0G/CXcwxRcL+EuDUInp
         C2c6TvRhDG+NCoCjFDFo2ph6MT2mO4soesHOMvvstO5UKhSI+iRix4nrESltKHzeyfV2
         nIia1OdKi6t4F++o7VdtJLNgfjI1acMBQuZ1xT1BjJGlIsQ17gAsFpKyK9PJbDXh8Hmz
         avOQ==
X-Gm-Message-State: AOJu0YzeHFq5oiAk9aZorN2+lMvTwjcPBIxOVl6JZmCm+hdvCD2UuxFG
	J7xQYn8NB9+Y849jfUyVwfUVNo4SsBQ1nmLKnVxE9PopH/E6dPq/h4F+XRFD
X-Gm-Gg: ASbGncsUaRzBRzkvCZlwXDF8/VFuZc3Ll1Bv1Q+x2tLGJ3STGPW+Yb339KeJFhYhoMB
	tj0O0DPXpkjNubhTeXW3PtGe0+Nk8+X3Ti45zFOzV2Rw4ae/4mk9GhHeV714PRzNzK/RGmqCk1W
	kS2TNrGxRD6IStUYNYAPrB0rF0ERZVZqCaY1vg4nbNH9KYD8dRzgV2UgxHgHOT9P6y98sear3+X
	WGco7tiin0bFLKpXGgTU2eIVvwxVZ6LZASuw1oR6OmnuvOlq4vZH5cGte5vM/HXmgDkUjbOundi
	uAkDJMxXfrXqJS17OzeKtgBFcdqKYTrhA3ir
X-Google-Smtp-Source: AGHT+IFjBRp9csHhgJUh5xf/mKdRU2voWVCpF+GVyg5hYH7ytMJSmSnYMn1QeAQh/au5pNRzZi1ufg==
X-Received: by 2002:a17:90b:52d0:b0:2ff:556f:be8 with SMTP id 98e67ed59e1d1-301a5b1e514mr5036261a91.16.1742323138790;
        Tue, 18 Mar 2025 11:38:58 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:38:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 17/25] makedumpfile: Fix build with GCC-15
Date: Tue, 18 Mar 2025 11:38:32 -0700
Message-ID: <20250318183842.2256284-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213243

fix gcc-15 compiling error: too many arguments to function eppic_init

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-compiling-error-too-many-arguments-.patch | 43 +++++++++++++++++++
 .../makedumpfile/makedumpfile_1.7.6.bb        |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch

diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch
new file mode 100644
index 00000000000..90f1b4038be
--- /dev/null
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch
@@ -0,0 +1,43 @@
+From 73e62a08022bf8e5edad250f8c1452f0be3771a3 Mon Sep 17 00:00:00 2001
+From: Coiby Xu <coxu@redhat.com>
+Date: Thu, 23 Jan 2025 17:47:10 +0800
+Subject: [PATCH] [PATCH] fix gcc-15 compiling error: too many arguments to function eppic_init
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2340813
+
+When building makekdumpfile against gcc-15, the following error is
+shown,
+
+    erase_info.c: In function ‘process_eppic_file’:
+    erase_info.c:2226:13: error: too many arguments to function ‘eppic_init’; expected 0, have 1
+     2226 |         if (eppic_init(&eppic_cb)) {
+          |             ^~~~~~~~~~ ~~~~~~~~~
+    make: *** [Makefile:109: erase_info.o] Error 1
+
+Upstream-Status: Backport [https://github.com/makedumpfile/makedumpfile/commit/73e62a08022bf8e5edad250f8c1452f0be3771a3]
+
+Signed-off-by: Coiby Xu <coxu@redhat.com>
+Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
+---
+ erase_info.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/erase_info.c b/erase_info.c
+index cbe1681..af6bfae 100644
+--- a/erase_info.c
++++ b/erase_info.c
+@@ -2192,7 +2192,7 @@ process_eppic_file(char *name_config)
+ {
+ 	void *handle;
+ 	void (*eppic_load)(char *), (*eppic_unload)(char *);
+-	int (*eppic_init)();
++	int (*eppic_init)(struct call_back *);
+ 
+ 	/*
+ 	 * Dynamically load the eppic_makedumpfile.so library.
+-- 
+2.48.1
+
diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
index 21847ece6b8..46be13e7d0f 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
@@ -26,6 +26,7 @@ FILES:${PN}-tools = "${bindir}/*.pl"
 SRC_URI = "\
     git://github.com/makedumpfile/makedumpfile;branch=${SRCBRANCH};protocol=https \
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
+    file://0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.patch \
 "
 
 S = "${WORKDIR}/git"

