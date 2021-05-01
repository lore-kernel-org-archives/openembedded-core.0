Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.10207.1619891222878873358
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 May 2021 10:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XLr4kgM5;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id p4so1288298pfo.3
        for <openembedded-core@lists.openembedded.org>; Sat, 01 May 2021 10:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tZMoQgBRaDcm0BVnx6Ko8AEx/dDvq35dTWBByNiPaoo=;
        b=XLr4kgM5kasUBeuK0r7XlJzvX60t46DozKqw7PHqOw0t1UtLA7MXcPz0Us5QiQEDSY
         Xx3K3Nbeow8zTh3PrQQIE8bgRDRycyMSplrh5HRPuu32zx/aqY48LL3JBTEGBMu7Tpvt
         Z3dYvs44VNKKKJvJpMMhiYnOKkXi3Ccs8h4Aw7a4UrSOTwkoxnxbj2V7Cu0n8HTs7uz6
         VeES1Uvx4TUTq6cKHv8fG+e3I2sG6NKM6E6a3R4X3OcGYfYE6fUAHcop52HXF2kA2Xky
         dGQWbP1LADc0MlD9x+v0+k60fvRRbGTMa5QJbAv2Sg/X6xF+nx5ROa9eY6673oVVMQzK
         zd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tZMoQgBRaDcm0BVnx6Ko8AEx/dDvq35dTWBByNiPaoo=;
        b=ohmjOp83RpB8ZwtPsp/FhdnXIBxdTjPWs52wfIutZQIA1e/9lfy9Mdur874E4ONmrh
         PRUXJFJAyg2wlRe8bIRHOqYa2Mt+vAoklD/nNbShbAGiQvXvRP5eoDyHgCNk/eVotOqa
         T+rxHiIWRgpfLgRv5EPfxpHeVE1Or2ezJ2hOCj+DSTDXFjpm/fKo6U6I3tdeYwSTT0XZ
         aHUki1WYEXPFHD85tAejRy2Ybxl/r4XMTeZPZyAbHQQBVmtP1nDYwN41FDhPwJdtNMuh
         jSIEfu0DFYn2ikhxmtFYLVQvwJx6PLH0IakX6RpJ3aIWmcfXxCihgifY1OraFjzvkzlE
         loKw==
X-Gm-Message-State: AOAM533DYsJUzo7qCt7Q0ySKjpQ0M0U0gw1j9+cNXkunl57Bd3hTp0bZ
	5aJV78pYnMDHnR2D5AtWQ88uxlPrLtVilw==
X-Google-Smtp-Source: ABdhPJy3nnlzoK7QedC6KpC0RmF/5RZQYywpjWvvXMlvt1xCzRwLTMbwodyF4kafx+GTiFd3nLR0eA==
X-Received: by 2002:a62:1890:0:b029:28e:1cac:9fff with SMTP id 138-20020a6218900000b029028e1cac9fffmr3794733pfy.8.1619891221997;
        Sat, 01 May 2021 10:47:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id h9sm5750098pgl.67.2021.05.01.10.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 10:47:01 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/4] m4: Do not use SIGSTKSZ
Date: Sat,  1 May 2021 10:46:55 -0700
Message-Id: <20210501174658.524270-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
../../m4-1.4.18/lib/c-stack.c:55:26: error: missing binary operator before token "("
   55 | #elif HAVE_LIBSIGSEGV && SIGSTKSZ < 16384
      |                          ^~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/m4/m4-1.4.18.inc        |  1 +
 .../m4/0001-c-stack-stop-using-SIGSTKSZ.patch | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-devtools/m4/m4/0001-c-stack-stop-using-SIGSTKSZ.patch

diff --git a/meta/recipes-devtools/m4/m4-1.4.18.inc b/meta/recipes-devtools/m4/m4-1.4.18.inc
index a9b63c1bf6..6475b02f8b 100644
--- a/meta/recipes-devtools/m4/m4-1.4.18.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.18.inc
@@ -9,6 +9,7 @@ inherit autotools texinfo ptest
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
            file://ac_config_links.patch \
            file://m4-1.4.18-glibc-change-work-around.patch \
+           file://0001-c-stack-stop-using-SIGSTKSZ.patch \
            "
 SRC_URI_append_class-target = " file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
                                 file://run-ptest \
diff --git a/meta/recipes-devtools/m4/m4/0001-c-stack-stop-using-SIGSTKSZ.patch b/meta/recipes-devtools/m4/m4/0001-c-stack-stop-using-SIGSTKSZ.patch
new file mode 100644
index 0000000000..883b8a2075
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4/0001-c-stack-stop-using-SIGSTKSZ.patch
@@ -0,0 +1,84 @@
+From 69238f15129f35eb4756ad8e2004e0d7907cb175 Mon Sep 17 00:00:00 2001
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
+index 5353c08..863f764 100644
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
+@@ -131,7 +132,8 @@ die (int signo)
+ /* Storage for the alternate signal stack.  */
+ static union
+ {
+-  char buffer[SIGSTKSZ];
++  /* allocate buffer with size from get_sigstksz() */
++  char *buffer;
+ 
+   /* These other members are for proper alignment.  There's no
+      standard way to guarantee stack alignment, but this seems enough
+@@ -203,10 +205,11 @@ c_stack_action (void (*action) (int))
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
+@@ -279,14 +282,15 @@ c_stack_action (void (*action) (int))
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
-- 
2.31.1

