Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B40AC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:54:53 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.15520.1634673292307253053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jJ1pN0cG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id 21so14442030plo.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Y+ACSc7cYWsdQYNbAYnSDPgplsleUmLAl5+YFjlXCIE=;
        b=jJ1pN0cG9UZAxZ9MxQsp5x+FrScSS6gEEFX91WvBXOgJHPD4jvm2SmootYKGBv5Igb
         /9rB1oxgtq+slStSAQhim+5LpE4+h9u/byGMRhVAyovL2j1CqDYKj1YyNYfndyyXYn1R
         l79R5QaoIK5FMOm8tGGKKFQcLRuTVNAOt0pFIn4CtWkxqrd651+dv4CHpObPh/UwdqzQ
         9gstq3WV7tmoY1zj2feft/Lkhcta/T06B8Fb8L97QPeYBpsPCHq5CM7KKTHGCqnh0lju
         cW2MtS1uuN/t1iq0jAm4ZQtGOPEZ5LlORsT4Zfm9AlVix6XVk+/7URxTvUX2SX/ExUd0
         ZqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y+ACSc7cYWsdQYNbAYnSDPgplsleUmLAl5+YFjlXCIE=;
        b=ONuOblrljnMCwKAlWeA5bru1JV/QxRxKa6hKk7TbBgnqFWtPllEvQgfnd/x8RZn2a1
         2O1PESflUJyzuxFIDa/SArVpT7j4IkiXk0FVR7TVUfqUxH82h3PSTVxoq9DJpcinWV4h
         ijH+lXNByzHEOkmbfkFfylMk+dyrC8/SzGxZiHNXaA6FHW+ahA8r3ilwlPpGlv/USPTH
         CZuBtaWJQODDAEngdZ8aqn5VB7904RjdLjfR0didmXcr5Q51fLIVyfa9OAI6us3MiS/2
         bE+xfbkTMpu14sJ/dLITwXUeETtf57rN6UCkfBSXwXPdpuNsuqyxZAJ6eD7CNsN8aAfC
         EzeA==
X-Gm-Message-State: AOAM531zHJIrJccZHcbIwj5IGFU0UkS0qQX1r1OhspQX1BWSbbIyT0Ra
	pyq2Djkpv1DodlswbBs2OF51IqVf1zPHRW/+pQs=
X-Google-Smtp-Source: 
 ABdhPJytqwq0vpDcsqhOy/gv3C4xnrU1ObdOloYlYSqRuFYS7xzw5UB3q08bXzY1ngTCTe6NKSHaqw==
X-Received: by 2002:a17:902:cec3:b0:13f:2176:5ce5 with SMTP id
 d3-20020a170902cec300b0013f21765ce5mr34741561plg.13.1634673291273;
        Tue, 19 Oct 2021 12:54:51 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.54.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:54:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/38] m4: Do not use SIGSTKSZ
Date: Tue, 19 Oct 2021 09:53:29 -1000
Message-Id: 
 <6417148072640000b119a59aeb70e904ffa5e5d7.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:54:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157223

From: Khem Raj <raj.khem@gmail.com>

Fixes
../../m4-1.4.18/lib/c-stack.c:55:26: error: missing binary operator before token "("
   55 | #elif HAVE_LIBSIGSEGV && SIGSTKSZ < 16384
      |                          ^~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 44ca8edd622782733d507e20a3d5ee9e44eb8be4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


