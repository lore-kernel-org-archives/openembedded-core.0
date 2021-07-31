Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.1320.1627758700558286890
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jul 2021 12:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VCY7iE39;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id l19so20007075pjz.0
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Jul 2021 12:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pYl/0r31zlpjQgYsTCIS5bWqJfDzIRAH8jPP9rLZj50=;
        b=VCY7iE39mJkDz9C+XObh0bbI88l1pkgpM/h6+BSZruGKgIfPiC3lXhrKuJREz1tSFL
         k8qBgkXoZNF4ZEc+znWKNlAt8YfH3ZxEIjmUagIRyrLyo2g1lnAe3yb/Q7OaQ0aLcRek
         Zr4HnfNeJmSl0GYKKcwPcjRz8+rconHZW6zr/M0oyCfxPfKg7T/u7ENnRPAJeHadspBn
         Nk0UkJZGTwbWE3U/4JQVEmD/Sus82y0iu2ajVBYVop65zhkwLk7MhtSNkXG8EL9SpLZT
         TOOYFKQk1794hbULpZwjdNELsH+AT6hEAFBOw5ood/2JPHz+nfGG4AIgUJnqggUr0yh5
         hVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pYl/0r31zlpjQgYsTCIS5bWqJfDzIRAH8jPP9rLZj50=;
        b=fw5ard9Xv0AIJgmY4rrEHJ7nBTKYomIJICbmsAxSgGQLnxDwcktkQbVtJZHY79EsB0
         uFcVhHBavNm5wCOxXcZhU5BwuYqmIMqGIQknjCXCXJUpoizEcZLlg1ti0dC9o91uwxcc
         g1HEYxpYy/otTJ9/9aJ1ihwU5omufGnkDZSz93cIqyYSAqfzII8aI8f+UqPP0zvCm8xv
         AvCrNxBebZGS4es1B2RgPkVSIIeReAu1JWS7vmuf6ZNaXQMZp5ikckNpf/GqyCi6GZVd
         rPQykLBGLtFbFsjCRTKNyPeDzpFYGCZ1emyu9hb7Rmdguul6dO8Pp2wbu6mSrwt+PaVg
         02yg==
X-Gm-Message-State: AOAM5303L6xlggN5a+IngJdPlf4VHCjzGRTF2ooHe2tF47F0JkXLGaL7
	rMtivq2rsM0pyY0Ps/Q6148fj/K7G4g18Q==
X-Google-Smtp-Source: ABdhPJxtZiAc2Dvs2COS283MeN0WVzhdPRAIfw3b6kvvHtq8NcRjLdEEvKAtRK89eNu8A58clg7log==
X-Received: by 2002:a17:902:9006:b029:107:394a:387 with SMTP id a6-20020a1709029006b0290107394a0387mr7754161plp.35.1627758699901;
        Sat, 31 Jul 2021 12:11:39 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d2cb])
        by smtp.gmail.com with ESMTPSA id q13sm5734051pjq.10.2021.07.31.12.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 12:11:39 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] stress-ng: Detemine minimal stack size via sysconf
Date: Sat, 31 Jul 2021 12:11:37 -0700
Message-Id: <20210731191137.1858822-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps it compile with glibc 2.34+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-stack-size-via-sysconf-then-PTHREAD.patch | 103 ++++++++++++++++++
 .../stress-ng/stress-ng_0.12.12.bb            |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-Detemine-minimal-stack-size-via-sysconf-then-PTHREAD.patch

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Detemine-minimal-stack-size-via-sysconf-then-PTHREAD.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-Detemine-minimal-stack-size-via-sysconf-then-PTHREAD.patch
new file mode 100644
index 0000000000..d275e3d7f9
--- /dev/null
+++ b/meta/recipes-extended/stress-ng/stress-ng/0001-Detemine-minimal-stack-size-via-sysconf-then-PTHREAD.patch
@@ -0,0 +1,103 @@
+From f839de283c44ffe46a2d14bfdf854c145abd8ed6 Mon Sep 17 00:00:00 2001
+From: Colin Ian King <colin.king@canonical.com>
+Date: Mon, 19 Jul 2021 20:49:34 +0100
+Subject: [PATCH] Detemine minimal stack size via sysconf, then PTHREAD_STACK_MIN then guess
+
+Don't rely on PTHREAD_STACK_MIN being defined, use sysconf, then
+PTHREAD_STACK_MIN if it is defined, then 8K default.
+
+Upstream-Status: Backport [https://kernel.ubuntu.com/git/cking/stress-ng.git/commit/?id=f839de283c44ffe46a2d14bfdf854c145abd8ed6]
+Signed-off-by: Colin Ian King <colin.king@canonical.com>
+---
+ core-helper.c    | 31 +++++++++++++++++++++++++++++++
+ stress-ng.h      |  1 +
+ stress-pthread.c | 13 ++-----------
+ 3 files changed, 34 insertions(+), 11 deletions(-)
+
+diff --git a/core-helper.c b/core-helper.c
+index 508627f2..97a3b869 100644
+--- a/core-helper.c
++++ b/core-helper.c
+@@ -2494,6 +2494,37 @@ size_t stress_min_sig_stack_size(void)
+ 	return (size_t)sz;
+ }
+
++size_t stress_min_pthread_stack_size(void)
++{
++	static long sz = -1, min;
++
++	/* return cached copy */
++	if (sz > 0)
++		return sz;
++
++	min = stress_min_aux_sig_stack_size();
++#if defined(__SC_THREAD_STACK_MIN_VALUE)
++	sz = sysconf(__SC_THREAD_STACK_MIN_VALUE);
++	if (sz > min)
++		min = sz;
++#endif
++#if defined(_SC_THREAD_STACK_MIN_VALUE)
++	sz = sysconf(_SC_THREAD_STACK_MIN_VALUE);
++	if (sz > min)
++		min = sz;
++#endif
++#if defined(PTHREAD_STACK_MIN)
++	if (PTHREAD_STACK_MIN > min)
++		min = PTHREAD_STACK_MIN;
++#endif
++	if (8192 > min)
++		min = 8192;
++
++	sz = min;
++
++	return (size_t)sz;
++}
++
+ /*
+  *  stress_sig_handler_exit()
+  *	signal handler that exits a process via _exit(0) for
+diff --git a/stress-ng.h b/stress-ng.h
+index 8a8b17ae..cd744756 100644
+--- a/stress-ng.h
++++ b/stress-ng.h
+@@ -4056,6 +4056,7 @@ extern WARN_UNUSED int32_t  stress_get_opt_ionice_class(const char *const str);
+ /* Misc helper funcs */
+ extern WARN_UNUSED size_t stress_sig_stack_size(void);
+ extern WARN_UNUSED size_t stress_min_sig_stack_size(void);
++extern WARN_UNUSED size_t stress_min_pthread_stack_size(void);
+
+ #define STRESS_SIGSTKSZ		(stress_sig_stack_size())
+ #define STRESS_MINSIGSTKSZ	(stress_min_sig_stack_size())
+diff --git a/stress-pthread.c b/stress-pthread.c
+index 0da3aeec..27777af8 100644
+--- a/stress-pthread.c
++++ b/stress-pthread.c
+@@ -69,12 +69,7 @@ static const stress_opt_set_func_t opt_set_funcs[] = {
+
+ #if defined(HAVE_LIB_PTHREAD)
+
+-/* Some systems such as GNU/HURD don't define PTHREAD_STACK_MIN */
+-#if !defined(PTHREAD_STACK_MIN)
+-#define PTHREAD_STACK_MIN		(16 * KB)
+-#endif
+-
+-#define DEFAULT_STACK_MIN		(16 * KB)
++#define DEFAULT_STACK_MIN		(8 * KB)
+
+ #if defined(HAVE_GET_ROBUST_LIST) &&	\
+     defined(HAVE_LINUX_FUTEX_H)
+@@ -404,11 +399,7 @@ static int stress_pthread(const stress_args_t *args)
+ 	stress_pthread_args_t pargs = { args, NULL, 0 };
+ 	sigset_t set;
+ #if defined(HAVE_PTHREAD_ATTR_SETSTACK)
+-#if DEFAULT_STACK_MIN == PTHREAD_STACK_MIN
+-	const size_t stack_size = PTHREAD_STACK_MIN;
+-#else
+-	const size_t stack_size = STRESS_MAXIMUM(DEFAULT_STACK_MIN, PTHREAD_STACK_MIN);
+-#endif
++	const size_t stack_size = STRESS_MAXIMUM(DEFAULT_STACK_MIN, stress_min_pthread_stack_size());
+ #endif
+
+ 	keep_running_flag = true;
+--
+2.32.0
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.12.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.12.bb
index 430eac0d87..2925815044 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.12.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.12.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
+           file://0001-Detemine-minimal-stack-size-via-sysconf-then-PTHREAD.patch \
            "
 SRC_URI[sha256sum] = "f27af50f6f2308e707fef927674bdd209a046b116734281b792aeca35a4e4499"
 
-- 
2.32.0

