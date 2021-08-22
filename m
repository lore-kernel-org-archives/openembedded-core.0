Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.9618.1629636695627089044
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aB5nk1Q6;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id x12so21741206wrr.11
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NAUgcsOpqtFvcwEU0B8rYoonLRFTWS5Iu6BeoHm26Gs=;
        b=aB5nk1Q6PMkX8xq4F+N8bKMf8WNkHAlLIvD4mk1JyPsbRqntB/c2/IYM8H59M/4YXR
         XjDvkV77R1mdoQkZeEu29V2q6TPx3ZUyHoGnB5s4WgvLaZlJVZK+j+2fO9wqjs/WodOZ
         uIV/K2TKv0sgv2AldzI3j4t+yIPnwFTDAlA26yJ1M33HYh1AjCby+rLCB6cc1YJy1DGm
         sOJJ1KQySv/ozKeUMbb9NHltY7SeqyGhP2ytbRweba6LigUNcLdj5g6KFLEQ5HgtNHgA
         OepxQQUv3s14s5XwtXk9h3OJ5AzIqt9rM+6++T1uRgEzc+TWijyuQ9Z+NRUsVdYbcgPI
         bGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NAUgcsOpqtFvcwEU0B8rYoonLRFTWS5Iu6BeoHm26Gs=;
        b=Dpz0VxKxdbOcPo9sKcWvFiEbcZKzvXhsjkR62v0qucottJrIZGUMuKhhyWX4yU6mau
         ziC9dZJMWmYgcovAIbypP929SOrAeRux8QfXLZMi1LjGfyrcKMEDxbfIt02J2OP2aKiP
         JP+x2Nb8FoI/u4/JKdzVsHyQBBH3pQQCQ3Pi2U3a3n/+gkvogANFhqMUem+/PLXaao3A
         7t+IA647H7NEovMkwA0pgG3B+WYAt81ug/nmcm3j4X7rwMODiJZamUSNuAeuZiY/BDhi
         wMyRHXP6Uod6Z5j8b2aL13EWcZqdyVG1opjLijcSu7Igjin5zkaQ9zxxJ2WzMIZ1NA7N
         NTaw==
X-Gm-Message-State: AOAM531ggjy++cq7AsecsfAiO8dwQG5DOARq3zmNNonnOnzqSYMqmLqG
	tMcw0gtFcKzyOZgJiJJBinZWfs1I3ey2Fw==
X-Google-Smtp-Source: ABdhPJwuSWckrpG6Wj5NmOlPJjEPIAil/0Su5+Qh2Y9+/jUdGgijYq2n9Fr7GotIWi6/x2WeKlp1LQ==
X-Received: by 2002:adf:ffcb:: with SMTP id x11mr8600887wrs.158.1629636694255;
        Sun, 22 Aug 2021 05:51:34 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:33 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 34/55] stress-ng: upgrade 0.12.12 -> 0.13.00
Date: Sun, 22 Aug 2021 14:50:42 +0200
Message-Id: <20210822125103.310416-34-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-stack-size-via-sysconf-then-PTHREAD.patch | 103 ------------------
 ...ess-ng_0.12.12.bb => stress-ng_0.13.00.bb} |   3 +-
 2 files changed, 1 insertion(+), 105 deletions(-)
 delete mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-Detemine-minimal-stack-size-via-sysconf-then-PTHREAD.patch
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.12.bb => stress-ng_0.13.00.bb} (81%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Detemine-minimal-stack-size-via-sysconf-then-PTHREAD.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-Detemine-minimal-stack-size-via-sysconf-then-PTHREAD.patch
deleted file mode 100644
index d275e3d7f9..0000000000
--- a/meta/recipes-extended/stress-ng/stress-ng/0001-Detemine-minimal-stack-size-via-sysconf-then-PTHREAD.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From f839de283c44ffe46a2d14bfdf854c145abd8ed6 Mon Sep 17 00:00:00 2001
-From: Colin Ian King <colin.king@canonical.com>
-Date: Mon, 19 Jul 2021 20:49:34 +0100
-Subject: [PATCH] Detemine minimal stack size via sysconf, then PTHREAD_STACK_MIN then guess
-
-Don't rely on PTHREAD_STACK_MIN being defined, use sysconf, then
-PTHREAD_STACK_MIN if it is defined, then 8K default.
-
-Upstream-Status: Backport [https://kernel.ubuntu.com/git/cking/stress-ng.git/commit/?id=f839de283c44ffe46a2d14bfdf854c145abd8ed6]
-Signed-off-by: Colin Ian King <colin.king@canonical.com>
----
- core-helper.c    | 31 +++++++++++++++++++++++++++++++
- stress-ng.h      |  1 +
- stress-pthread.c | 13 ++-----------
- 3 files changed, 34 insertions(+), 11 deletions(-)
-
-diff --git a/core-helper.c b/core-helper.c
-index 508627f2..97a3b869 100644
---- a/core-helper.c
-+++ b/core-helper.c
-@@ -2494,6 +2494,37 @@ size_t stress_min_sig_stack_size(void)
- 	return (size_t)sz;
- }
-
-+size_t stress_min_pthread_stack_size(void)
-+{
-+	static long sz = -1, min;
-+
-+	/* return cached copy */
-+	if (sz > 0)
-+		return sz;
-+
-+	min = stress_min_aux_sig_stack_size();
-+#if defined(__SC_THREAD_STACK_MIN_VALUE)
-+	sz = sysconf(__SC_THREAD_STACK_MIN_VALUE);
-+	if (sz > min)
-+		min = sz;
-+#endif
-+#if defined(_SC_THREAD_STACK_MIN_VALUE)
-+	sz = sysconf(_SC_THREAD_STACK_MIN_VALUE);
-+	if (sz > min)
-+		min = sz;
-+#endif
-+#if defined(PTHREAD_STACK_MIN)
-+	if (PTHREAD_STACK_MIN > min)
-+		min = PTHREAD_STACK_MIN;
-+#endif
-+	if (8192 > min)
-+		min = 8192;
-+
-+	sz = min;
-+
-+	return (size_t)sz;
-+}
-+
- /*
-  *  stress_sig_handler_exit()
-  *	signal handler that exits a process via _exit(0) for
-diff --git a/stress-ng.h b/stress-ng.h
-index 8a8b17ae..cd744756 100644
---- a/stress-ng.h
-+++ b/stress-ng.h
-@@ -4056,6 +4056,7 @@ extern WARN_UNUSED int32_t  stress_get_opt_ionice_class(const char *const str);
- /* Misc helper funcs */
- extern WARN_UNUSED size_t stress_sig_stack_size(void);
- extern WARN_UNUSED size_t stress_min_sig_stack_size(void);
-+extern WARN_UNUSED size_t stress_min_pthread_stack_size(void);
-
- #define STRESS_SIGSTKSZ		(stress_sig_stack_size())
- #define STRESS_MINSIGSTKSZ	(stress_min_sig_stack_size())
-diff --git a/stress-pthread.c b/stress-pthread.c
-index 0da3aeec..27777af8 100644
---- a/stress-pthread.c
-+++ b/stress-pthread.c
-@@ -69,12 +69,7 @@ static const stress_opt_set_func_t opt_set_funcs[] = {
-
- #if defined(HAVE_LIB_PTHREAD)
-
--/* Some systems such as GNU/HURD don't define PTHREAD_STACK_MIN */
--#if !defined(PTHREAD_STACK_MIN)
--#define PTHREAD_STACK_MIN		(16 * KB)
--#endif
--
--#define DEFAULT_STACK_MIN		(16 * KB)
-+#define DEFAULT_STACK_MIN		(8 * KB)
-
- #if defined(HAVE_GET_ROBUST_LIST) &&	\
-     defined(HAVE_LINUX_FUTEX_H)
-@@ -404,11 +399,7 @@ static int stress_pthread(const stress_args_t *args)
- 	stress_pthread_args_t pargs = { args, NULL, 0 };
- 	sigset_t set;
- #if defined(HAVE_PTHREAD_ATTR_SETSTACK)
--#if DEFAULT_STACK_MIN == PTHREAD_STACK_MIN
--	const size_t stack_size = PTHREAD_STACK_MIN;
--#else
--	const size_t stack_size = STRESS_MAXIMUM(DEFAULT_STACK_MIN, PTHREAD_STACK_MIN);
--#endif
-+	const size_t stack_size = STRESS_MAXIMUM(DEFAULT_STACK_MIN, stress_min_pthread_stack_size());
- #endif
-
- 	keep_running_flag = true;
---
-2.32.0
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.12.bb b/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
similarity index 81%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.12.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
index afc9ddf96c..198f7e87c7 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.12.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
@@ -7,9 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
-           file://0001-Detemine-minimal-stack-size-via-sysconf-then-PTHREAD.patch \
            "
-SRC_URI[sha256sum] = "f27af50f6f2308e707fef927674bdd209a046b116734281b792aeca35a4e4499"
+SRC_URI[sha256sum] = "1cefe4a3057c1522b146e62f61b80ce6e2e99da2d85ebe25bc03fc45228e58cd"
 
 DEPENDS = "coreutils-native"
 
-- 
2.31.1

