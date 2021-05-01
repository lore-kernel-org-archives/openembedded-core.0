Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.10088.1619891223813381178
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 May 2021 10:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UEd2cTeh;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id j7so796869pgi.3
        for <openembedded-core@lists.openembedded.org>; Sat, 01 May 2021 10:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Y+Dme7ZtcDpd25pR21civl9mzcxuPJlgQxCJPW+wlQ=;
        b=UEd2cTehEepkX/tqhD0YuZurbmgBDhEvPKvHkSKW7hTpjni9YvsdWKwZZEw94p/NYb
         lhyfPO+mcmRgIsLbB/gcxsbq1M5JvIofyx0F5fReckV2c8kFn4pyoh+QYRYSSVCOfO1j
         sh5tu01/+nUkHTLjuOXn/uyEm8pSOrjrZBtDYO6MJtl6kftJa6Q0wjN874Vnzf9rBCNZ
         Vvt7zsAM8Qb4cHhpK2jmMKshiH4G+WGJfpzvcRgBoj3xcWZ936xD43zLf/tAxYk6goL3
         bui88iWGoonzCV8BRymqbiF++qpqTugUbNtl8JzZ12sEXligITyRZ5P4iBq1yyr5Y05s
         zUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Y+Dme7ZtcDpd25pR21civl9mzcxuPJlgQxCJPW+wlQ=;
        b=XEmUXBNtqZryhmF/bghd2MRiG/lCY1OedCD1gZE6BTwhQzq9p5juNPS/y4aGTcKy4D
         exGay9NAGRcg9KF4E51pwLz7lcC13L4WIoOFjaCBqL4AMC868Lqf0x7yRjk2YyK47JeL
         SLNNCt/on29GBQacEavZymgfPXO2SmvDwKgDGNMsLy0mJdZO4kxbi0dph9clCTc5E0x0
         p83dYQI2yXZ4O1B622LB7/C7YErDMou2c3iiUmrixKcYf5UzKAmF8iSaKJfoGszzkQ6x
         QhY7S+FX8K0M05TGsgRNaXDMAnLZkXeuyo+smQxRUj5uxXEU/xEBj4x/VUd5us0SowV+
         D1pQ==
X-Gm-Message-State: AOAM532zlLmzZ2vGue3ooJx3HmOIE/0VhFBXdbPtMBLD47Gy+aA3rQ5o
	nQoOxP3dnTwsRk9gmsMTqaKFhOlmmk32YQ==
X-Google-Smtp-Source: ABdhPJwUsM8tHmtnWzNnS5a4rbRUbYoMZ9lJowJtZxyd42lENrkk8zzTHqCFCjRg/uupbaX6LXXVmQ==
X-Received: by 2002:a62:81c4:0:b029:257:cf19:2f02 with SMTP id t187-20020a6281c40000b0290257cf192f02mr10248624pfd.50.1619891223084;
        Sat, 01 May 2021 10:47:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id h9sm5750098pgl.67.2021.05.01.10.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 10:47:02 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/4] findutils: Do not use SIGSTKSZ
Date: Sat,  1 May 2021 10:46:56 -0700
Message-Id: <20210501174658.524270-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210501174658.524270-1-raj.khem@gmail.com>
References: <20210501174658.524270-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-c-stack-stop-using-SIGSTKSZ.patch    | 84 +++++++++++++++++++
 .../diffutils/diffutils_3.7.bb                |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-extended/diffutils/diffutils/0001-c-stack-stop-using-SIGSTKSZ.patch

diff --git a/meta/recipes-extended/diffutils/diffutils/0001-c-stack-stop-using-SIGSTKSZ.patch b/meta/recipes-extended/diffutils/diffutils/0001-c-stack-stop-using-SIGSTKSZ.patch
new file mode 100644
index 0000000000..50e627fa30
--- /dev/null
+++ b/meta/recipes-extended/diffutils/diffutils/0001-c-stack-stop-using-SIGSTKSZ.patch
@@ -0,0 +1,84 @@
+From 87b3a8f9ceb2cf0a5c8b72e460465fb9ff2d62d9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 30 Apr 2021 17:40:36 -0700
+Subject: [PATCH] c-stack: stop using SIGSTKSZ
+
+This patch is required with glibc 2.34+
+based on gnulib [1]
+
+[1] https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=f9e2b20a12a230efa30f1d479563ae07d276a94b
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/c-stack.c | 22 +++++++++++++---------
+ 1 file changed, 13 insertions(+), 9 deletions(-)
+
+diff --git a/lib/c-stack.c b/lib/c-stack.c
+index 9bbe6fe..e0874c9 100644
+--- a/lib/c-stack.c
++++ b/lib/c-stack.c
+@@ -51,13 +51,14 @@
+ typedef struct sigaltstack stack_t;
+ #endif
+ #ifndef SIGSTKSZ
+-# define SIGSTKSZ 16384
+-#elif HAVE_LIBSIGSEGV && SIGSTKSZ < 16384
++#define get_sigstksz()  (16384)
++#elif HAVE_LIBSIGSEGV
+ /* libsigsegv 2.6 through 2.8 have a bug where some architectures use
+    more than the Linux default of an 8k alternate stack when deciding
+    if a fault was caused by stack overflow.  */
+-# undef SIGSTKSZ
+-# define SIGSTKSZ 16384
++#define get_sigstksz() ((SIGSTKSZ) < 16384 ? 16384 : (SIGSTKSZ))
++#else
++#define get_sigstksz() ((SIGSTKSZ))
+ #endif
+ 
+ #include <stdlib.h>
+@@ -136,7 +137,8 @@ die (int signo)
+ /* Storage for the alternate signal stack.  */
+ static union
+ {
+-  char buffer[SIGSTKSZ];
++  /* allocate buffer with size from get_sigstksz() */
++  char *buffer;
+ 
+   /* These other members are for proper alignment.  There's no
+      standard way to guarantee stack alignment, but this seems enough
+@@ -208,10 +210,11 @@ c_stack_action (void (*action) (int))
+   program_error_message = _("program error");
+   stack_overflow_message = _("stack overflow");
+ 
++  alternate_signal_stack.buffer = malloc(get_sigstksz());
+   /* Always install the overflow handler.  */
+   if (stackoverflow_install_handler (overflow_handler,
+                                      alternate_signal_stack.buffer,
+-                                     sizeof alternate_signal_stack.buffer))
++                                     get_sigstksz()))
+     {
+       errno = ENOTSUP;
+       return -1;
+@@ -284,14 +287,15 @@ c_stack_action (void (*action) (int))
+   stack_t st;
+   struct sigaction act;
+   st.ss_flags = 0;
++  alternate_signal_stack.buffer = malloc(get_sigstksz());
+ # if SIGALTSTACK_SS_REVERSED
+   /* Irix mistakenly treats ss_sp as the upper bound, rather than
+      lower bound, of the alternate stack.  */
+-  st.ss_sp = alternate_signal_stack.buffer + SIGSTKSZ - sizeof (void *);
+-  st.ss_size = sizeof alternate_signal_stack.buffer - sizeof (void *);
++  st.ss_sp = alternate_signal_stack.buffer + get_sigstksz() - sizeof (void *);
++  st.ss_size = get_sigstksz() - sizeof (void *);
+ # else
+   st.ss_sp = alternate_signal_stack.buffer;
+-  st.ss_size = sizeof alternate_signal_stack.buffer;
++  st.ss_size = get_sigstksz();
+ # endif
+   r = sigaltstack (&st, NULL);
+   if (r != 0)
+-- 
+2.31.1
+
diff --git a/meta/recipes-extended/diffutils/diffutils_3.7.bb b/meta/recipes-extended/diffutils/diffutils_3.7.bb
index 8111ae6065..b9a54fea54 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.7.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.7.bb
@@ -6,6 +6,7 @@ require diffutils.inc
 SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
            file://run-ptest \
            file://0001-Skip-strip-trailing-cr-test-case.patch \
+           file://0001-c-stack-stop-using-SIGSTKSZ.patch \
 "
 
 SRC_URI[md5sum] = "4824adc0e95dbbf11dfbdfaad6a1e461"
-- 
2.31.1

