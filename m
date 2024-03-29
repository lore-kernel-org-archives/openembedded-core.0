Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C30ACD1288
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 05:50:45 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.11056.1711691441695092879
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 22:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fZKA5WK1;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e0d8403257so14915945ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 22:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711691441; x=1712296241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcM27zp0VNSvDWGzmrSVXgPilzXdEYQupAekELqxiL8=;
        b=fZKA5WK1x9i1O6kXylmC9RROkZkOUOK1OoDomnyeSFt2fqiuxrOwn0/2MFJFBthOLM
         HqcNeALrV8/sLc7GDJ8+ApYTmzRBf23zaC578XJug8ZKwwugWWlxCipaNcv/w5jVePR4
         5KvdC0Ie7fXG33c/KF0JI56ZcVtoS6vmNQqjOUqW+/onr+AKLjQf/r1N+Aeerl2kqmGn
         1HlKj+uhP3sqH/bb5J0XcTakffm8UFmyQEP9TCSQBwGnSlFzP8ZWEWmIykpjYWA7azDD
         1EruPnGQN2qPmah60plWDNeTfFGl+1nzAwGpj8aycwxbIdoiTiPW4QrYmbFCMpPniW5f
         PcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711691441; x=1712296241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcM27zp0VNSvDWGzmrSVXgPilzXdEYQupAekELqxiL8=;
        b=Gigw1IbSxmhKzIdvWoYhmhtRdnSC6btE4CnjiHFZC/AhK55WRC6cDWRofkoXW4tvIH
         hgfoM+z/plfPzdpXPGpOTdvL6nThcDf2FfyMgJo8SuO+kl2birvwXSkDC9bXhXBdqjgI
         i+FI/kGxfOSbWAK+rseT4AwEpjL89pNI5fFDqGLBTJpJ7B/xUFGJW6RXvrg6Hu8NLxjq
         i1RyIWwzHnazWbNPVOADtzd862WPe2wAg+fBqATYKMRRKI2Q6gdqPae8BufGOUQE01M6
         idHQMzBtQEiiLblg+OT7FXMula6UhJyAccfUT28R65pAVbJHZ/F0SoIeowrzTW2jJlbI
         qv/A==
X-Gm-Message-State: AOJu0Yx8hCiDjVxHd8+8Ns2ZQeGOIjYZL44Vy6fdinI3Z6FGpqpx3/Wy
	B37m3DoRsYcOu4lPsmgmR13s1AyEd4kYkB92qMeHpwcJHpSpP4LihozFiLm7
X-Google-Smtp-Source: AGHT+IECdfBXGCe7+w2XLQYqPHMTtl/i6Iot0glcsoa+CIrhvUqEuLD7FHharyC/vJo+/sDTquaWRA==
X-Received: by 2002:a17:902:d510:b0:1e0:d9da:b126 with SMTP id b16-20020a170902d51000b001e0d9dab126mr1986249plg.15.1711691440528;
        Thu, 28 Mar 2024 22:50:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::dfbb])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001e088a9e2bcsm2611573plt.292.2024.03.28.22.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 22:50:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] readline: Apply patches from readline-8.2-patches
Date: Thu, 28 Mar 2024 22:50:34 -0700
Message-ID: <20240329055034.3942360-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329055034.3942360-1-raj.khem@gmail.com>
References: <20240329055034.3942360-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 05:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197625

These patches are submitted/backported to 8.2 release
and address issues reported by different distros.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../readline/readline/readline82-001.patch    |  45 ++++++++
 .../readline/readline/readline82-002.patch    |  51 +++++++++
 .../readline/readline/readline82-003.patch    |  46 ++++++++
 .../readline/readline/readline82-004.patch    |  68 ++++++++++++
 .../readline/readline/readline82-005.patch    |  53 +++++++++
 .../readline/readline/readline82-006.patch    | 102 ++++++++++++++++++
 .../readline/readline/readline82-007.patch    |  51 +++++++++
 .../readline/readline/readline82-008.patch    |  80 ++++++++++++++
 .../readline/readline/readline82-009.patch    |  76 +++++++++++++
 .../readline/readline/readline82-010.patch    |  70 ++++++++++++
 meta/recipes-core/readline/readline_8.2.bb    |  12 +++
 11 files changed, 654 insertions(+)
 create mode 100644 meta/recipes-core/readline/readline/readline82-001.patch
 create mode 100644 meta/recipes-core/readline/readline/readline82-002.patch
 create mode 100644 meta/recipes-core/readline/readline/readline82-003.patch
 create mode 100644 meta/recipes-core/readline/readline/readline82-004.patch
 create mode 100644 meta/recipes-core/readline/readline/readline82-005.patch
 create mode 100644 meta/recipes-core/readline/readline/readline82-006.patch
 create mode 100644 meta/recipes-core/readline/readline/readline82-007.patch
 create mode 100644 meta/recipes-core/readline/readline/readline82-008.patch
 create mode 100644 meta/recipes-core/readline/readline/readline82-009.patch
 create mode 100644 meta/recipes-core/readline/readline/readline82-010.patch

diff --git a/meta/recipes-core/readline/readline/readline82-001.patch b/meta/recipes-core/readline/readline/readline82-001.patch
new file mode 100644
index 00000000000..4e9839db9c8
--- /dev/null
+++ b/meta/recipes-core/readline/readline/readline82-001.patch
@@ -0,0 +1,45 @@
+			   READLINE PATCH REPORT
+			   =====================
+
+Readline-Release: 8.2
+Patch-ID: readline82-001
+
+Bug-Reported-by:	Kan-Ru Chen <koster@debian.org>
+Bug-Reference-ID:
+Bug-Reference-URL:	https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1021109
+
+Bug-Description:
+
+Starting a readline application with an invalid locale specification for
+LC_ALL/LANG/LC_CTYPE can cause it crash on the first call to readline.
+
+Patch (apply with `patch -p0'):
+
+Upstream-Status: Submitted [https://ftp.gnu.org/gnu/readline/readline-8.2-patches/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+*** ../readline-8.2-patched/nls.c	2022-08-15 09:38:51.000000000 -0400
+--- nls.c	2022-10-05 09:23:22.000000000 -0400
+***************
+*** 142,145 ****
+--- 142,149 ----
+      lspec = "";
+    ret = setlocale (LC_CTYPE, lspec);	/* ok, since it does not change locale */
++   if (ret == 0 || *ret == 0)
++     ret = setlocale (LC_CTYPE, (char *)NULL);
++   if (ret == 0 || *ret == 0)
++     ret = RL_DEFAULT_LOCALE;
+  #else
+    ret = (lspec == 0 || *lspec == 0) ? RL_DEFAULT_LOCALE : lspec;
+
+*** ../readline-8.2/patchlevel	2013-11-15 08:11:11.000000000 -0500
+--- patchlevel	2014-03-21 08:28:40.000000000 -0400
+***************
+*** 1,3 ****
+  # Do not edit -- exists only for use by patch
+  
+! 0
+--- 1,3 ----
+  # Do not edit -- exists only for use by patch
+  
+! 1
diff --git a/meta/recipes-core/readline/readline/readline82-002.patch b/meta/recipes-core/readline/readline/readline82-002.patch
new file mode 100644
index 00000000000..5629685dc1b
--- /dev/null
+++ b/meta/recipes-core/readline/readline/readline82-002.patch
@@ -0,0 +1,51 @@
+			   READLINE PATCH REPORT
+			   =====================
+
+Readline-Release: 8.2
+Patch-ID: readline82-002
+
+Bug-Reported-by:	srobertson@peratonlabs.com
+Bug-Reference-ID:
+Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2022-09/msg00049.html
+
+Bug-Description:
+
+It's possible for readline to try to zero out a line that's not null-
+terminated, leading to a memory fault.
+
+Patch (apply with `patch -p0'):
+
+Upstream-Status: Submitted [https://ftp.gnu.org/gnu/readline/readline-8.2-patches/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+*** ../readline-8.2-patched/display.c	2022-04-05 10:47:31.000000000 -0400
+--- display.c	2022-12-13 13:11:22.000000000 -0500
+***************
+*** 2684,2692 ****
+  
+    if (visible_line)
+!     {
+!       temp = visible_line;
+!       while (*temp)
+! 	*temp++ = '\0';
+!     }
+    rl_on_new_line ();
+    forced_display++;
+--- 2735,2740 ----
+  
+    if (visible_line)
+!     memset (visible_line, 0, line_size);
+! 
+    rl_on_new_line ();
+    forced_display++;
+*** ../readline-8.2/patchlevel	2013-11-15 08:11:11.000000000 -0500
+--- patchlevel	2014-03-21 08:28:40.000000000 -0400
+***************
+*** 1,3 ****
+  # Do not edit -- exists only for use by patch
+  
+! 1
+--- 1,3 ----
+  # Do not edit -- exists only for use by patch
+  
+! 2
diff --git a/meta/recipes-core/readline/readline/readline82-003.patch b/meta/recipes-core/readline/readline/readline82-003.patch
new file mode 100644
index 00000000000..61570bf4f41
--- /dev/null
+++ b/meta/recipes-core/readline/readline/readline82-003.patch
@@ -0,0 +1,46 @@
+			   READLINE PATCH REPORT
+			   =====================
+
+Readline-Release: 8.2
+Patch-ID: readline82-003
+
+Bug-Reported-by:	Stefan Klinger <readline-gnu.org@stefan-klinger.de>
+Bug-Reference-ID:
+Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-readline/2023-08/msg00018.html
+
+Bug-Description:
+
+Patch (apply with `patch -p0'):
+
+The custom color prefix that readline uses to color possible completions
+must have a leading `.'.
+
+Upstream-Status: Submitted [https://ftp.gnu.org/gnu/readline/readline-8.2-patches/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+*** ../readline-8.2-patched/colors.c	2021-12-08 11:38:25.000000000 -0500
+--- colors.c	2023-08-28 16:40:04.000000000 -0400
+***************
+*** 74,78 ****
+  static void restore_default_color (void);
+  
+! #define RL_COLOR_PREFIX_EXTENSION	"readline-colored-completion-prefix"
+  
+  COLOR_EXT_TYPE *_rl_color_ext_list = 0;
+--- 74,78 ----
+  static void restore_default_color (void);
+  
+! #define RL_COLOR_PREFIX_EXTENSION	".readline-colored-completion-prefix"
+  
+  COLOR_EXT_TYPE *_rl_color_ext_list = 0;
+*** ../readline-8.2/patchlevel	2013-11-15 08:11:11.000000000 -0500
+--- patchlevel	2014-03-21 08:28:40.000000000 -0400
+***************
+*** 1,3 ****
+  # Do not edit -- exists only for use by patch
+  
+! 2
+--- 1,3 ----
+  # Do not edit -- exists only for use by patch
+  
+! 3
diff --git a/meta/recipes-core/readline/readline/readline82-004.patch b/meta/recipes-core/readline/readline/readline82-004.patch
new file mode 100644
index 00000000000..cedc3d0fe44
--- /dev/null
+++ b/meta/recipes-core/readline/readline/readline82-004.patch
@@ -0,0 +1,68 @@
+			   READLINE PATCH REPORT
+			   =====================
+
+Readline-Release: 8.2
+Patch-ID: readline82-004
+
+Bug-Reported-by:	Henry Bent <henry.r.bent@gmail.com>
+Bug-Reference-ID:
+Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2022-11/msg00044.html
+
+Bug-Description:
+
+Patch (apply with `patch -p0'):
+
+There are systems that supply one of select or pselect, but not both.
+
+Upstream-Status: Submitted [https://ftp.gnu.org/gnu/readline/readline-8.2-patches/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+*** ../readline-8.2-patched/input.c	2022-04-08 15:43:24.000000000 -0400
+--- input.c	2022-11-28 09:41:08.000000000 -0500
+***************
+*** 152,156 ****
+--- 152,158 ----
+  int _rl_timeout_init (void);
+  int _rl_timeout_sigalrm_handler (void);
++ #if defined (RL_TIMEOUT_USE_SELECT)
+  int _rl_timeout_select (int, fd_set *, fd_set *, fd_set *, const struct timeval *, const sigset_t *);
++ #endif
+  
+  static void _rl_timeout_handle (void);
+***************
+*** 249,253 ****
+    int chars_avail, k;
+    char input;
+! #if defined(HAVE_SELECT)
+    fd_set readfds, exceptfds;
+    struct timeval timeout;
+--- 251,255 ----
+    int chars_avail, k;
+    char input;
+! #if defined (HAVE_PSELECT) || defined (HAVE_SELECT)
+    fd_set readfds, exceptfds;
+    struct timeval timeout;
+***************
+*** 806,810 ****
+    unsigned char c;
+    int fd;
+! #if defined (HAVE_PSELECT)
+    sigset_t empty_set;
+    fd_set readfds;
+--- 815,819 ----
+    unsigned char c;
+    int fd;
+! #if defined (HAVE_PSELECT) || defined (HAVE_SELECT)
+    sigset_t empty_set;
+    fd_set readfds;
+*** ../readline-8.2/patchlevel	2013-11-15 08:11:11.000000000 -0500
+--- patchlevel	2014-03-21 08:28:40.000000000 -0400
+***************
+*** 1,3 ****
+  # Do not edit -- exists only for use by patch
+  
+! 3
+--- 1,3 ----
+  # Do not edit -- exists only for use by patch
+  
+! 4
diff --git a/meta/recipes-core/readline/readline/readline82-005.patch b/meta/recipes-core/readline/readline/readline82-005.patch
new file mode 100644
index 00000000000..69c2e4f77a2
--- /dev/null
+++ b/meta/recipes-core/readline/readline/readline82-005.patch
@@ -0,0 +1,53 @@
+			   READLINE PATCH REPORT
+			   =====================
+
+Readline-Release: 8.2
+Patch-ID: readline82-005
+
+Bug-Reported-by:	Simon Marchi <simon.marchi@polymtl.ca>
+Bug-Reference-ID:
+Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-readline/2022-09/msg00005.html
+
+Bug-Description:
+
+If an application is using readline in callback mode, and a signal arrives
+after readline checks for it in rl_callback_read_char() but before it
+restores the application's signal handlers, it won't get processed until the
+next time the application calls rl_callback_read_char(). Readline needs to
+check for and resend any pending signals after restoring the application's
+signal handlers.
+
+Patch (apply with `patch -p0'):
+
+Upstream-Status: Submitted [https://ftp.gnu.org/gnu/readline/readline-8.2-patches/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+*** ../readline-8.2-patched/callback.c	2022-04-29 12:02:56.000000000 -0400
+--- callback.c	2022-10-11 10:59:06.000000000 -0400
+***************
+*** 116,120 ****
+    do { \
+      if (rl_persistent_signal_handlers == 0) \
+!       rl_clear_signals (); \
+      return; \
+    } while (0)
+--- 116,123 ----
+    do { \
+      if (rl_persistent_signal_handlers == 0) \
+!       { \
+!         rl_clear_signals (); \
+!         if (_rl_caught_signal) _rl_signal_handler (_rl_caught_signal); \
+!       } \
+      return; \
+    } while (0)
+*** ../readline-8.2/patchlevel	2013-11-15 08:11:11.000000000 -0500
+--- patchlevel	2014-03-21 08:28:40.000000000 -0400
+***************
+*** 1,3 ****
+  # Do not edit -- exists only for use by patch
+  
+! 4
+--- 1,3 ----
+  # Do not edit -- exists only for use by patch
+  
+! 5
diff --git a/meta/recipes-core/readline/readline/readline82-006.patch b/meta/recipes-core/readline/readline/readline82-006.patch
new file mode 100644
index 00000000000..d66afe82c9d
--- /dev/null
+++ b/meta/recipes-core/readline/readline/readline82-006.patch
@@ -0,0 +1,102 @@
+			   READLINE PATCH REPORT
+			   =====================
+
+Readline-Release: 8.2
+Patch-ID: readline82-006
+
+Bug-Reported-by:	Tom de Vries <tdevries@suse.de>
+Bug-Reference-ID:
+Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-readline/2022-09/msg00001.html
+
+Bug-Description:
+
+This is a variant of the same issue as the one fixed by patch 5. In this
+case, the signal arrives and is pending before readline calls rl_getc().
+When this happens, the pending signal will be handled by the loop, but may
+alter or destroy some state that the callback uses. Readline needs to treat
+this case the same way it would if a signal interrupts pselect/select, so
+compound operations like searches and reading numeric arguments get cleaned
+up properly.
+
+Patch (apply with `patch -p0'):
+
+Upstream-Status: Submitted [https://ftp.gnu.org/gnu/readline/readline-8.2-patches/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+*** ../readline-8.2-patched/input.c	2022-12-22 16:15:48.000000000 -0500
+--- input.c	2023-01-10 11:53:45.000000000 -0500
+***************
+*** 812,816 ****
+  rl_getc (FILE *stream)
+  {
+!   int result;
+    unsigned char c;
+    int fd;
+--- 812,816 ----
+  rl_getc (FILE *stream)
+  {
+!   int result, ostate, osig;
+    unsigned char c;
+    int fd;
+***************
+*** 823,828 ****
+--- 823,842 ----
+    while (1)
+      {
++       osig = _rl_caught_signal;
++       ostate = rl_readline_state;
++ 
+        RL_CHECK_SIGNALS ();
+  
++ #if defined (READLINE_CALLBACKS)
++       /* Do signal handling post-processing here, but just in callback mode
++ 	 for right now because the signal cleanup can change some of the
++ 	 callback state, and we need to either let the application have a
++ 	 chance to react or abort some current operation that gets cleaned
++ 	 up by rl_callback_sigcleanup(). If not, we'll just run through the
++ 	 loop again. */
++       if (osig != 0 && (ostate & RL_STATE_CALLBACK))
++ 	goto postproc_signal;
++ #endif
++ 
+        /* We know at this point that _rl_caught_signal == 0 */
+  
+***************
+*** 888,891 ****
+--- 902,908 ----
+  
+  handle_error:
++       osig = _rl_caught_signal;
++       ostate = rl_readline_state;
++ 
+        /* If the error that we received was EINTR, then try again,
+  	 this is simply an interrupted system call to read ().  We allow
+***************
+*** 928,933 ****
+--- 945,959 ----
+  #endif  /* SIGALRM */
+  
++ postproc_signal:
++       /* POSIX says read(2)/pselect(2)/select(2) don't return EINTR for any
++ 	 reason other than being interrupted by a signal, so we can safely
++ 	 call the application's signal event hook. */
+        if (rl_signal_event_hook)
+  	(*rl_signal_event_hook) ();
++ #if defined (READLINE_CALLBACKS)
++       else if (osig == SIGINT && (ostate & RL_STATE_CALLBACK) && (ostate & (RL_STATE_ISEARCH|RL_STATE_NSEARCH|RL_STATE_NUMERICARG)))
++         /* just these cases for now */
++         _rl_abort_internal ();
++ #endif
+      }
+  }
+*** ../readline-8.2/patchlevel	2013-11-15 08:11:11.000000000 -0500
+--- patchlevel	2014-03-21 08:28:40.000000000 -0400
+***************
+*** 1,3 ****
+  # Do not edit -- exists only for use by patch
+  
+! 5
+--- 1,3 ----
+  # Do not edit -- exists only for use by patch
+  
+! 6
diff --git a/meta/recipes-core/readline/readline/readline82-007.patch b/meta/recipes-core/readline/readline/readline82-007.patch
new file mode 100644
index 00000000000..9fa1ccb552e
--- /dev/null
+++ b/meta/recipes-core/readline/readline/readline82-007.patch
@@ -0,0 +1,51 @@
+			   READLINE PATCH REPORT
+			   =====================
+
+Readline-Release: 8.2
+Patch-ID: readline82-007
+
+Bug-Reported-by:	Kevin Pulo <kev@pulo.com.au>
+Bug-Reference-ID:
+Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-readline/2022-11/msg00002.html
+
+Bug-Description:
+
+If readline is called with no prompt, it should display a newline if return
+is typed on an empty line. It should still suppress the final newline if
+return is typed on the last (empty) line of a multi-line command.
+
+Patch (apply with `patch -p0'):
+
+Upstream-Status: Submitted [https://ftp.gnu.org/gnu/readline/readline-8.2-patches/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+*** ../readline-8.2-patched/display.c	2022-04-05 10:47:31.000000000 -0400
+--- display.c	2022-12-13 13:11:22.000000000 -0500
+***************
+*** 3342,3348 ****
+  		 &last_face[_rl_screenwidth - 1 + woff], 1);
+      }
+!   _rl_vis_botlin = 0;
+!   if (botline_length > 0 || _rl_last_c_pos > 0)
+      rl_crlf ();
+    fflush (rl_outstream);
+    rl_display_fixed++;
+--- 3394,3400 ----
+  		 &last_face[_rl_screenwidth - 1 + woff], 1);
+      }
+!   if ((_rl_vis_botlin == 0 && botline_length == 0) || botline_length > 0 || _rl_last_c_pos > 0)
+      rl_crlf ();
++   _rl_vis_botlin = 0;
+    fflush (rl_outstream);
+    rl_display_fixed++;
+*** ../readline-8.2/patchlevel	2013-11-15 08:11:11.000000000 -0500
+--- patchlevel	2014-03-21 08:28:40.000000000 -0400
+***************
+*** 1,3 ****
+  # Do not edit -- exists only for use by patch
+  
+! 6
+--- 1,3 ----
+  # Do not edit -- exists only for use by patch
+  
+! 7
diff --git a/meta/recipes-core/readline/readline/readline82-008.patch b/meta/recipes-core/readline/readline/readline82-008.patch
new file mode 100644
index 00000000000..660cb1e00bd
--- /dev/null
+++ b/meta/recipes-core/readline/readline/readline82-008.patch
@@ -0,0 +1,80 @@
+			   READLINE PATCH REPORT
+			   =====================
+
+Readline-Release: 8.2
+Patch-ID: readline82-008
+
+Bug-Reported-by:
+Bug-Reference-ID:
+Bug-Reference-URL:
+
+Bug-Description:
+
+Add missing prototypes for several function declarations.
+
+Patch (apply with `patch -p0'):
+
+Upstream-Status: Submitted [https://ftp.gnu.org/gnu/readline/readline-8.2-patches/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+*** ../readline-8.2-patched/text.c	Wed Oct 27 11:03:59 2021
+--- text.c	Thu Nov 16 16:24:58 2023
+***************
+*** 1765,1770 ****
+  #if defined (READLINE_CALLBACKS)
+  static int
+! _rl_char_search_callback (data)
+!      _rl_callback_generic_arg *data;
+  {
+    _rl_callback_func = 0;
+--- 1765,1769 ----
+  #if defined (READLINE_CALLBACKS)
+  static int
+! _rl_char_search_callback (_rl_callback_generic_arg *data)
+  {
+    _rl_callback_func = 0;
+*** ../readline-8.2-patched/bind.c	Wed Feb  9 11:02:22 2022
+--- bind.c	Thu Nov 16 16:25:17 2023
+***************
+*** 1168,1174 ****
+  
+  static int
+! parse_comparison_op (s, indp)
+!      const char *s;
+!      int *indp;
+  {
+    int i, peekc, op;
+--- 1168,1172 ----
+  
+  static int
+! parse_comparison_op (const char *s, int *indp)
+  {
+    int i, peekc, op;
+*** ../readline-8.2-patched/rltty.c	Fri Feb 18 11:14:22 2022
+--- rltty.c	Thu Nov 16 16:25:36 2023
+***************
+*** 81,86 ****
+     to get the tty settings. */
+  static void
+! set_winsize (tty)
+!      int tty;
+  {
+  #if defined (TIOCGWINSZ)
+--- 81,85 ----
+     to get the tty settings. */
+  static void
+! set_winsize (int tty)
+  {
+  #if defined (TIOCGWINSZ)
+
+*** ../readline-8.2/patchlevel	2013-11-15 08:11:11.000000000 -0500
+--- patchlevel	2014-03-21 08:28:40.000000000 -0400
+***************
+*** 1,3 ****
+  # Do not edit -- exists only for use by patch
+  
+! 7
+--- 1,3 ----
+  # Do not edit -- exists only for use by patch
+  
+! 8
diff --git a/meta/recipes-core/readline/readline/readline82-009.patch b/meta/recipes-core/readline/readline/readline82-009.patch
new file mode 100644
index 00000000000..1fcf7b3535b
--- /dev/null
+++ b/meta/recipes-core/readline/readline/readline82-009.patch
@@ -0,0 +1,76 @@
+			   READLINE PATCH REPORT
+			   =====================
+
+Readline-Release: 8.2
+Patch-ID: readline82-009
+
+Bug-Reported-by:	Stefan H. Holek <stefan@epy.co.at>
+Bug-Reference-ID:	<50F8DA45-B7F3-4DE1-AB94-19AE42649CDC@epy.co.at>
+Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-readline/2022-10/msg00021.html
+
+Bug-Description:
+
+Fix issue where the directory name portion of the word to be completed (the
+part that is passed to opendir()) requires both tilde expansion and dequoting.
+Readline only performed tilde expansion in this case, so filename completion
+would fail.
+
+Patch (apply with `patch -p0'):
+
+Upstream-Status: Submitted [https://ftp.gnu.org/gnu/readline/readline-8.2-patches/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+*** ../readline-8.2-patched/complete.c	2022-04-05 10:47:06.000000000 -0400
+--- complete.c	2022-10-26 15:08:51.000000000 -0400
+***************
+*** 2527,2531 ****
+  	  xfree (dirname);
+  	  dirname = temp;
+! 	  tilde_dirname = 1;
+  	}
+  
+--- 2527,2532 ----
+  	  xfree (dirname);
+  	  dirname = temp;
+! 	  if (*dirname != '~')
+! 	    tilde_dirname = 1;	/* indicate successful tilde expansion */
+  	}
+  
+***************
+*** 2546,2554 ****
+  	  users_dirname = savestring (dirname);
+  	}
+!       else if (tilde_dirname == 0 && rl_completion_found_quote && rl_filename_dequoting_function)
+  	{
+! 	  /* delete single and double quotes */
+  	  xfree (dirname);
+! 	  dirname = savestring (users_dirname);
+  	}
+        directory = opendir (dirname);
+--- 2547,2560 ----
+  	  users_dirname = savestring (dirname);
+  	}
+!       else if (rl_completion_found_quote && rl_filename_dequoting_function)
+  	{
+! 	  /* We already ran users_dirname through the dequoting function.
+! 	     If tilde_dirname == 1, we successfully performed tilde expansion
+! 	     on dirname. Now we need to reconcile those results. We either
+! 	     just copy the already-dequoted users_dirname or tilde expand it
+! 	     if we tilde-expanded dirname. */
+! 	  temp = tilde_dirname ? tilde_expand (users_dirname) : savestring (users_dirname);
+  	  xfree (dirname);
+! 	  dirname = temp;
+  	}
+        directory = opendir (dirname);
+
+*** ../readline-8.2/patchlevel	2013-11-15 08:11:11.000000000 -0500
+--- patchlevel	2014-03-21 08:28:40.000000000 -0400
+***************
+*** 1,3 ****
+  # Do not edit -- exists only for use by patch
+  
+! 8
+--- 1,3 ----
+  # Do not edit -- exists only for use by patch
+  
+! 9
diff --git a/meta/recipes-core/readline/readline/readline82-010.patch b/meta/recipes-core/readline/readline/readline82-010.patch
new file mode 100644
index 00000000000..6152953e913
--- /dev/null
+++ b/meta/recipes-core/readline/readline/readline82-010.patch
@@ -0,0 +1,70 @@
+			   READLINE PATCH REPORT
+			   =====================
+
+Readline-Release: 8.2
+Patch-ID: readline82-010
+
+Bug-Reported-by:	Martin Castillo <castilma@uni-bremen.de>
+Bug-Reference-ID:	<2d42153b-cf65-caba-dff1-cd3bc6268c7e@uni-bremen.de>
+Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-readline/2023-01/msg00000.html
+
+Bug-Description:
+
+Fix the case where text to be completed from the line buffer (quoted) is
+compared to the common prefix of the possible matches (unquoted) and the
+quoting makes the former appear to be longer than the latter. Readline
+assumes the match doesn't add any characters to the word and doesn't display
+multiple matches.
+
+Patch (apply with `patch -p0'):
+
+Upstream-Status: Submitted [https://ftp.gnu.org/gnu/readline/readline-8.2-patches/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+*** ../readline-8.2-patched/complete.c	Tue Apr  5 10:47:06 2022
+--- complete.c	Sat Jan  7 14:19:45 2023
+***************
+*** 2032,2038 ****
+    text = rl_copy_text (start, end);
+    matches = gen_completion_matches (text, start, end, our_func, found_quote, quote_char);
+    /* nontrivial_lcd is set if the common prefix adds something to the word
+       being completed. */
+!   nontrivial_lcd = matches && compare_match (text, matches[0]) != 0;
+    if (what_to_do == '!' || what_to_do == '@')
+      tlen = strlen (text);
+--- 2038,2060 ----
+    text = rl_copy_text (start, end);
+    matches = gen_completion_matches (text, start, end, our_func, found_quote, quote_char);
++   /* If TEXT contains quote characters, it will be dequoted as part of
++      generating the matches, and the matches will not contain any quote
++      characters. We need to dequote TEXT before performing the comparison.
++      Since compare_match performs the dequoting, and we only want to do it
++      once, we don't call compare_matches after dequoting TEXT; we call
++      strcmp directly. */
+    /* nontrivial_lcd is set if the common prefix adds something to the word
+       being completed. */
+!   if (rl_filename_completion_desired && rl_filename_quoting_desired &&
+!       rl_completion_found_quote && rl_filename_dequoting_function)
+!     {
+!       char *t;
+!       t = (*rl_filename_dequoting_function) (text, rl_completion_quote_character);
+!       xfree (text);
+!       text = t;
+!       nontrivial_lcd = matches && strcmp (text, matches[0]) != 0;
+!     }
+!   else
+!     nontrivial_lcd = matches && strcmp (text, matches[0]) != 0;
+    if (what_to_do == '!' || what_to_do == '@')
+      tlen = strlen (text);
+
+*** ../readline-8.2/patchlevel	2013-11-15 08:11:11.000000000 -0500
+--- patchlevel	2014-03-21 08:28:40.000000000 -0400
+***************
+*** 1,3 ****
+  # Do not edit -- exists only for use by patch
+  
+! 9
+--- 1,3 ----
+  # Do not edit -- exists only for use by patch
+  
+! 10
diff --git a/meta/recipes-core/readline/readline_8.2.bb b/meta/recipes-core/readline/readline_8.2.bb
index 3a47297fe19..f0dba31251f 100644
--- a/meta/recipes-core/readline/readline_8.2.bb
+++ b/meta/recipes-core/readline/readline_8.2.bb
@@ -2,4 +2,16 @@ require readline.inc
 
 SRC_URI += "  file://norpath.patch"
 
+SRC_URI += "file://readline82-001.patch;striplevel=0 \
+            file://readline82-002.patch;striplevel=0 \
+            file://readline82-003.patch;striplevel=0 \
+            file://readline82-004.patch;striplevel=0 \
+            file://readline82-005.patch;striplevel=0 \
+            file://readline82-006.patch;striplevel=0 \
+            file://readline82-007.patch;striplevel=0 \
+            file://readline82-008.patch;striplevel=0 \
+            file://readline82-009.patch;striplevel=0 \
+            file://readline82-010.patch;striplevel=0 \
+           "
+
 SRC_URI[archive.sha256sum] = "3feb7171f16a84ee82ca18a36d7b9be109a52c04f492a053331d7d1095007c35"
-- 
2.44.0


