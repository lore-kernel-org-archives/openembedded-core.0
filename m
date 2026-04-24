Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF366FF8845
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:13 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32611.1777064230206687266
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EwVnZCxJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488ba840146so74042075e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064228; x=1777669028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJMU8WLKktppuZaGXmmEnjVwOd7SXV91NW1SwgfV/ho=;
        b=EwVnZCxJvyoNv+YRyEm68XWPxOj/IDxWj2tf+sXkKTUhS5l6r666xKgDsyxNQwoBYu
         IMA0QfPN5E9Z4dHcKZY0c+eHjQRSsxTTUry2FwwJ4qb0LOKc7MXYxBrie55StjiF+Lu3
         p4G98/mtNGKw36g5wsTi8pKdTHyDfMbg+8WTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064228; x=1777669028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UJMU8WLKktppuZaGXmmEnjVwOd7SXV91NW1SwgfV/ho=;
        b=EMa72XOLX/RzT2GvPrG5C1hxh3qARQ5eo2H3I49LSx9eEt4jlBRYoncALpPU9X9ihh
         ovYnF7TQ7sR18HAQVaOP8ZYYcvHvrXC9ET8r8cD5HnWS9JgnVTKx2CxIq9yOSmR2gO/6
         15xHrAKg04vPBgl5hgOzxwpyLFK3gfWfNCSr5bgMZc+agLwUxk0pS6TWrM3QS1y1E4bM
         7DsFoq/iOUSWK9Sh/ryNkpbufFJJsufBn6xI3I1NvdBp1VKhqEUxKSgwm8797RxiniQV
         gXx9ua6lPNECMSzEZSs/XU9Q0wqBBYCorwEG1eNk8FEsGpNOdNB7cbNqSns1Qlt2xw7c
         W1dg==
X-Gm-Message-State: AOJu0YwyXRWllRAZycQJlMqh7Z8hRohfKGEgmrWb1KxzzdFj7B2B0X0+
	1v2GS+b7danOI0QXFZuwTEDi/vVN3nOoCJgeEybNn5Qm39+dh/adRutng01Dz36zTV5TnsMSrKN
	9kbKhX6OrTkV7
X-Gm-Gg: AeBDievIcUZYTXMc/rIEqavmljJxxFJwzsaHPFgn9MGfh4SWVk368naEIML990lY8js
	6IvDhve5GUqByiS6SVAvBTorYgxq2r9v8TkzJ6QiXBeyQv4MNqmlvram3dZH7ap53J2lo6Ufm9+
	EUaD/Y19Dzz2OVGRx/9Sxq/5ybZaKZtXpC7zz1rmRdPDeCpikQMe5MzO7BActXbI9X9euYAp27H
	zxwIUXODVQo4fB3UquKYZTZvBcWmj49BF4BJAdQ2ptHqrht+16NM/QMzeOs7alfAZjQpraccxBk
	gH7aU2Mj2BXh46Z2m5GZjHB4K4PGVh24tQwssi3g23E47Bqi6xTDUas8MWU8sKcKyIpODnrjEHB
	Gy2Bz+JCuWDI1qxHH7IGbSh2jj2/8PpMwBteUwKbGDwjzCimZZpISeJSzxF6zolbs0dgg9qY+uc
	tiOo4sH9E/OlXUVNWkimx650oStug64e+WgZ8/+VENKElg8XoVVv32zDxS6GkajTPagsoXbTNib
	GANhzNYjNK3/fX+N73n8FdDWSWpbTZyDu+4pQ==
X-Received: by 2002:a05:600c:348d:b0:48a:674d:e756 with SMTP id 5b1f17b1804b1-48a677401c7mr38503545e9.20.1777064228091;
        Fri, 24 Apr 2026 13:57:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 54/66] texinfo: Backport patches for hosts with newer GCC
Date: Fri, 24 Apr 2026 22:55:53 +0200
Message-ID: <d80f41a4d02b81fdfcb21956f81c9918caab2dad.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235927

From: Yoann Congal <yoann.congal@smile.fr>

On Ubuntu 26.04 (Gcc 15.2), texinfo-native fails to build.
Note: it is usually ASSUME_PROVIDED via bitbake.conf.
Backport patches (all included in texinfo-7.3, OE-Core's version) to fix
these errors:
| ../../texinfo-7.0.3/system.h:69:14: error: conflicting types for ‘strerror’; have ‘char *(void)’
|    69 | extern char *strerror ();
|       |              ^~~~~~~~
| In file included from ../gnulib/lib/string.h:41,
|                  from ../../texinfo-7.0.3/system.h:34:
| /usr/include/string.h:451:14: note: previous declaration of ‘strerror’ with type ‘char *(int)’
|   451 | extern char *strerror (int __errnum) __THROW;
|       |              ^~~~~~~~
========================================================
| ../../../../../../../workspace/sources/texinfo-native/info/echo-area.c:176:12: error: too many arguments to function ‘cmd’; expected 0, have 2
|   176 |           (*cmd) (the_echo_area, count);
|       |           ~^~~~~  ~~~~~~~~~~~~~
========================================================
| ../../../../../../../workspace/sources/texinfo-native/info/m-x.c:140:8: error: too many arguments to function ‘command->func’; expected 0, have 3
|   140 |       (*command->func) (active_window, count, 0);
|       |       ~^~~~~~~~~~~~~~~  ~~~~~~~~~~~~~
========================================================

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...strerror-definition-the-prototype-lo.patch |  27 +++
 ...tion-CFunction-Remove-unused-typedef.patch |  27 +++
 ...prototype-for-Info-command-functions.patch | 194 ++++++++++++++++
 .../texinfo/0004-Remove-VFunction.patch       | 217 ++++++++++++++++++
 .../recipes-extended/texinfo/texinfo_7.0.3.bb |   4 +
 5 files changed, 469 insertions(+)
 create mode 100644 meta/recipes-extended/texinfo/texinfo/0001-system.h-remove-strerror-definition-the-prototype-lo.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo/0002-info-info.h-Function-CFunction-Remove-unused-typedef.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo/0003-Use-explicit-prototype-for-Info-command-functions.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo/0004-Remove-VFunction.patch

diff --git a/meta/recipes-extended/texinfo/texinfo/0001-system.h-remove-strerror-definition-the-prototype-lo.patch b/meta/recipes-extended/texinfo/texinfo/0001-system.h-remove-strerror-definition-the-prototype-lo.patch
new file mode 100644
index 00000000000..1a31b321486
--- /dev/null
+++ b/meta/recipes-extended/texinfo/texinfo/0001-system.h-remove-strerror-definition-the-prototype-lo.patch
@@ -0,0 +1,27 @@
+From 3d202924c8ddd96029129bb745772cb2918a5f10 Mon Sep 17 00:00:00 2001
+From: Patrice Dumas <pertusus@free.fr>
+Date: Sun, 16 Jun 2024 15:10:22 +0200
+Subject: * system.h: remove strerror definition, the prototype looks wrong and
+ the conditional is not set anywhere.
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/texinfo.git/commit/?id=3d202924c8ddd96029129bb745772cb2918a5f10]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ system.h | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/system.h b/system.h
+index e32937f16e..7694d85a45 100644
+--- a/system.h
++++ b/system.h
+@@ -65,10 +65,6 @@ extern int errno;
+ #include <perror.h>
+ #endif
+ 
+-#ifndef HAVE_DECL_STRERROR
+-extern char *strerror ();
+-#endif
+-
+ #include <limits.h>
+ 
+ #ifndef PATH_MAX
diff --git a/meta/recipes-extended/texinfo/texinfo/0002-info-info.h-Function-CFunction-Remove-unused-typedef.patch b/meta/recipes-extended/texinfo/texinfo/0002-info-info.h-Function-CFunction-Remove-unused-typedef.patch
new file mode 100644
index 00000000000..9ed97b12ffe
--- /dev/null
+++ b/meta/recipes-extended/texinfo/texinfo/0002-info-info.h-Function-CFunction-Remove-unused-typedef.patch
@@ -0,0 +1,27 @@
+From 5e06e9846c44cb5d7b1c937728ba701b4a9d9523 Mon Sep 17 00:00:00 2001
+From: Gavin Smith <gavinsmith0123@gmail.com>
+Date: Sun, 28 Jan 2024 15:45:25 +0000
+Subject: * info/info.h (Function, CFunction): Remove unused typedefs.
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/texinfo.git/commit/?id=5e06e9846c44cb5d7b1c937728ba701b4a9d9523]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ info/info.h | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/info/info.h b/info/info.h
+index 8082725146..b1274ef7a4 100644
+--- a/info/info.h
++++ b/info/info.h
+@@ -23,10 +23,8 @@
+ /* System dependencies.  */
+ #include "system.h"
+ 
+-/* Some of our other include files use these.  */
+-typedef int Function ();
++/* Some of our other include files use this.  */
+ typedef void VFunction ();
+-typedef char *CFunction ();
+ 
+ #include "string.h"
+ #include "mbiter.h"
diff --git a/meta/recipes-extended/texinfo/texinfo/0003-Use-explicit-prototype-for-Info-command-functions.patch b/meta/recipes-extended/texinfo/texinfo/0003-Use-explicit-prototype-for-Info-command-functions.patch
new file mode 100644
index 00000000000..f955661d520
--- /dev/null
+++ b/meta/recipes-extended/texinfo/texinfo/0003-Use-explicit-prototype-for-Info-command-functions.patch
@@ -0,0 +1,194 @@
+From deb7fb40bcaeaa537b14e0690f0fa78081844481 Mon Sep 17 00:00:00 2001
+From: Patrice Dumas <pertusus@free.fr>
+Date: Mon, 17 Jun 2024 19:26:32 +0200
+Subject: [PATCH] Use explicit prototype for Info command functions
+
+* info/m-x.c (info_execute_command): call command function with two
+arguments only, window and count.
+
+* info/doc.h (InfoCommand), info/echo-area.c
+(read_and_dispatch_in_echo_area, ea_yank_pop)
+(ea_possible_completions), info/info.h (COMMAND_FUNCTION),
+info/makedoc.c (process_one_file), info/session.c
+(info_read_and_dispatch, read_key_sequence), info/terminal.h
+(VFunction): add a function type COMMAND_FUNCTION for pointers on info
+commands function and replace the VFunction untyped generic function
+type.  Move VFunction definition to terminal.h.
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/texinfo.git/commit/?id=2e62ec97bad667f1dd91f1a396f5c0376aef1c03]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ info/doc.h       |  2 +-
+ info/echo-area.c | 10 +++++-----
+ info/info.h      |  4 ++--
+ info/m-x.c       |  2 +-
+ info/makedoc.c   |  2 +-
+ info/session.c   |  8 ++++----
+ info/session.h   |  4 ++--
+ info/terminal.h  |  2 +-
+ 8 files changed, 17 insertions(+), 17 deletions(-)
+
+diff --git a/info/doc.h b/info/doc.h
+index 26ed41f80c..e9cc2ced0e 100644
+--- a/info/doc.h
++++ b/info/doc.h
+@@ -44,7 +44,7 @@ typedef struct function_keyseq
+ /* Structure describing an Info command. */
+ typedef struct
+ {
+-  VFunction *func;        /* Pointer to function implementing command. */
++  COMMAND_FUNCTION *func; /* Pointer to function implementing command. */
+   char *func_name;        /* Name of this command. */
+   FUNCTION_KEYSEQ *keys;  /* Key sequences that could invoke this command. */
+   char *doc;              /* Documentation string. */
+diff --git a/info/echo-area.c b/info/echo-area.c
+index f485e43f76..375c66a560 100644
+--- a/info/echo-area.c
++++ b/info/echo-area.c
+@@ -31,7 +31,7 @@ int info_aborted_echo_area = 0;
+ int echo_area_is_active = 0;
+ 
+ /* The address of the last command executed in the echo area. */
+-static VFunction *ea_last_executed_command = NULL;
++static COMMAND_FUNCTION *ea_last_executed_command = NULL;
+ 
+ /* Non-zero means that the last command executed while reading input
+    killed some text. */
+@@ -158,7 +158,7 @@ read_and_dispatch_in_echo_area (void)
+   while (1)
+     {
+       int count;
+-      VFunction *cmd;
++      COMMAND_FUNCTION *cmd;
+       int lk = 0;
+ 
+       lk = echo_area_last_command_was_kill;
+@@ -669,8 +669,8 @@ DECLARE_INFO_COMMAND (ea_yank_pop, _("Yank back a previous kill"))
+ {
+   register int len;
+ 
+-  if (((ea_last_executed_command != (VFunction *) ea_yank) &&
+-       (ea_last_executed_command != (VFunction *) ea_yank_pop)) ||
++  if (((ea_last_executed_command != ea_yank) &&
++       (ea_last_executed_command != ea_yank_pop)) ||
+       (kill_ring_index == 0))
+     return;
+ 
+@@ -1166,7 +1166,7 @@ DECLARE_INFO_COMMAND (ea_possible_completions, _("List possible completions"))
+ 
+ DECLARE_INFO_COMMAND (ea_complete, _("Insert completion"))
+ {
+-  if (ea_last_executed_command == (VFunction *) ea_complete)
++  if (ea_last_executed_command == ea_complete)
+     {
+       ea_possible_completions (window, count);
+       return;
+diff --git a/info/info.h b/info/info.h
+index b1274ef7a4..401b0543d3 100644
+--- a/info/info.h
++++ b/info/info.h
+@@ -23,8 +23,8 @@
+ /* System dependencies.  */
+ #include "system.h"
+ 
+-/* Some of our other include files use this.  */
+-typedef void VFunction ();
++struct window_struct;
++typedef void COMMAND_FUNCTION (struct window_struct *window, int count);
+ 
+ #include "string.h"
+ #include "mbiter.h"
+diff --git a/info/m-x.c b/info/m-x.c
+index 669d999738..9a194a1e28 100644
+--- a/info/m-x.c
++++ b/info/m-x.c
+@@ -137,7 +137,7 @@ DECLARE_INFO_COMMAND (info_execute_command,
+     free (line);
+ 
+     if (command && command->func)
+-      (*command->func) (active_window, count, 0);
++      (*command->func) (active_window, count);
+   }
+ }
+ 
+diff --git a/info/makedoc.c b/info/makedoc.c
+index e7d98d64f9..84ea419d4d 100644
+--- a/info/makedoc.c
++++ b/info/makedoc.c
+@@ -436,7 +436,7 @@ process_one_file (char *filename, FILE *doc_stream, FILE *funs_stream)
+       doc[offset - point] = '\0';
+ 
+       fprintf (doc_stream,
+-          "   { (VFunction *)%s, \"%s\", (FUNCTION_KEYSEQ *)0, %s },\n",
++          "   { %s, \"%s\", (FUNCTION_KEYSEQ *)0, %s },\n",
+           func, func_name, doc);
+ 
+       free (func_name);
+diff --git a/info/session.c b/info/session.c
+index 499857ef13..2cb4414326 100644
+--- a/info/session.c
++++ b/info/session.c
+@@ -229,7 +229,7 @@ static int info_keyseq_displayed_p;
+ void
+ info_read_and_dispatch (void)
+ {
+-  VFunction *cmd;
++  COMMAND_FUNCTION *cmd;
+   int count;
+ 
+   for (quit_info_immediately = 0; !quit_info_immediately; )
+@@ -5018,7 +5018,7 @@ incremental_search (WINDOW *window, int count)
+ 
+   while (isearch_is_active)
+     {
+-      VFunction *func = NULL;
++      COMMAND_FUNCTION *func = NULL;
+       int quoted = 0;
+ 
+       /* Show the search string in the echo area. */
+@@ -5546,7 +5546,7 @@ void info_add_digit_to_numeric_arg (WINDOW *, int count);
+ 
+    If INSERT, call ea_insert if a printable character was input.
+  */
+-VFunction *
++COMMAND_FUNCTION *
+ read_key_sequence (Keymap map, int menu, int mouse,
+                    int insert, int *count)
+ {
+@@ -5554,7 +5554,7 @@ read_key_sequence (Keymap map, int menu, int mouse,
+   int reading_universal_argument = 0;
+ 
+   int numeric_arg = 1, numeric_arg_sign = 1, *which_explicit_arg;
+-  VFunction *func;
++  COMMAND_FUNCTION *func;
+ 
+   /* Process the right numeric argument. */
+   if (!echo_area_is_active)
+diff --git a/info/session.h b/info/session.h
+index 4606d0a519..94b4935ef0 100644
+--- a/info/session.h
++++ b/info/session.h
+@@ -58,8 +58,8 @@ extern int scroll_last_node;
+ int get_input_key (void);
+ int get_another_input_key (void);
+ 
+-VFunction *read_key_sequence (Keymap map, int menu, int mouse,
+-                              int insert, int *count);
++COMMAND_FUNCTION *read_key_sequence (Keymap map, int menu, int mouse,
++                                     int insert, int *count);
+ unsigned char info_input_pending_p (void);
+ void info_set_node_of_window (WINDOW *window, NODE *node);
+ void info_set_node_of_window_fast (WINDOW *window, NODE *node);
+diff --git a/info/terminal.h b/info/terminal.h
+index 8108b6b6b5..ee881a8bb1 100644
+--- a/info/terminal.h
++++ b/info/terminal.h
+@@ -20,7 +20,7 @@
+ #if !defined (TERMINAL_H)
+ #define TERMINAL_H
+ 
+-#include "info.h"
++typedef void VFunction ();
+ 
+ /* For almost every function externally visible from terminal.c, there is
+    a corresponding "hook" function which can be bound in order to replace
diff --git a/meta/recipes-extended/texinfo/texinfo/0004-Remove-VFunction.patch b/meta/recipes-extended/texinfo/texinfo/0004-Remove-VFunction.patch
new file mode 100644
index 00000000000..eb9957c3dcf
--- /dev/null
+++ b/meta/recipes-extended/texinfo/texinfo/0004-Remove-VFunction.patch
@@ -0,0 +1,217 @@
+From 7e8d0093b411729c8c570b25280bef6b55415594 Mon Sep 17 00:00:00 2001
+From: Gavin Smith <gavinsmith0123@gmail.com>
+Date: Fri, 9 Aug 2024 11:05:08 +0100
+Subject: [PATCH] Remove VFunction.
+
+* info/terminal.c, info/terminal.h
+(terminal_begin_blink_hook, terminal_begin_bold_hook)
+(terminal_begin_inverse_hook, terminal_begin_standout_hook)
+(terminal_begin_underline_hook, terminal_clear_screen_hook)
+(terminal_clear_to_eol_hook, terminal_default_colour_hook)
+(terminal_down_line_hook, terminal_end_all_modes_hook)
+(terminal_end_inverse_hook, terminal_end_standout_hook)
+(terminal_end_underline_hook, terminal_get_screen_size_hook)
+(terminal_goto_xy_hook, terminal_initialize_terminal_hook)
+(terminal_new_terminal_hook, terminal_prep_terminal_hook)
+(terminal_put_text_hook, terminal_ring_bell_hook)
+(terminal_scroll_terminal_hook, terminal_set_bgcolour_hook,)
+(terminal_set_colour_hook, terminal_unprep_terminal_hook,)
+(terminal_up_line_hook, terminal_write_chars_hook):
+Declare with explicit variable list.
+(VFunction): Remove.
+
+C23 does not allow a variable list to be left undefined as ().
+Report from Jeffrey Cliff <jeffrey.cliff@gmail.com>.
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/texinfo.git/commit/?id=7e8d0093b411729c8c570b25280bef6b55415594]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ info/terminal.c | 53 +++++++++++++++++++++++++------------------------
+ info/terminal.h | 42 +++++++++++++++++++--------------------
+ 2 files changed, 47 insertions(+), 48 deletions(-)
+
+diff --git a/info/terminal.c b/info/terminal.c
+index 7a9793befc..b6f59ff5c5 100644
+--- a/info/terminal.c
++++ b/info/terminal.c
+@@ -53,32 +53,33 @@ extern int tputs ();
+    function is called when appropriate instead of its namesake.  Your
+    function is called with exactly the same arguments that were passed
+    to the namesake function. */
+-VFunction *terminal_begin_inverse_hook = NULL;
+-VFunction *terminal_end_inverse_hook = NULL;
+-VFunction *terminal_begin_standout_hook = NULL;
+-VFunction *terminal_end_standout_hook = NULL;
+-VFunction *terminal_begin_underline_hook = NULL;
+-VFunction *terminal_end_underline_hook = NULL;
+-VFunction *terminal_begin_bold_hook = NULL;
+-VFunction *terminal_begin_blink_hook = NULL;
+-VFunction *terminal_end_all_modes_hook = NULL;
+-VFunction *terminal_default_colour_hook = NULL;
+-VFunction *terminal_set_colour_hook = NULL;
+-VFunction *terminal_set_bgcolour_hook = NULL;
+-VFunction *terminal_prep_terminal_hook = NULL;
+-VFunction *terminal_unprep_terminal_hook = NULL;
+-VFunction *terminal_up_line_hook = NULL;
+-VFunction *terminal_down_line_hook = NULL;
+-VFunction *terminal_clear_screen_hook = NULL;
+-VFunction *terminal_clear_to_eol_hook = NULL;
+-VFunction *terminal_get_screen_size_hook = NULL;
+-VFunction *terminal_goto_xy_hook = NULL;
+-VFunction *terminal_initialize_terminal_hook = NULL;
+-VFunction *terminal_new_terminal_hook = NULL;
+-VFunction *terminal_put_text_hook = NULL;
+-VFunction *terminal_ring_bell_hook = NULL;
+-VFunction *terminal_write_chars_hook = NULL;
+-VFunction *terminal_scroll_terminal_hook = NULL;
++
++void (*terminal_initialize_terminal_hook) (char *terminal_name) = NULL;
++void (*terminal_get_screen_size_hook) (void) = NULL;
++int (*terminal_prep_terminal_hook) (void) = NULL;
++void (*terminal_unprep_terminal_hook) (void) = NULL;
++void (*terminal_new_terminal_hook) (char *terminal_name) = NULL;
++void (*terminal_goto_xy_hook) (int x, int y) = NULL;
++void (*terminal_put_text_hook) (char *string) = NULL;
++void (*terminal_write_chars_hook) (char *string, int nchars) = NULL;
++void (*terminal_clear_to_eol_hook) (void) = NULL;
++void (*terminal_clear_screen_hook) (void) = NULL;
++void (*terminal_up_line_hook) (void) = NULL;
++void (*terminal_down_line_hook) (void) = NULL;
++void (*terminal_begin_inverse_hook) (void) = NULL;
++void (*terminal_end_inverse_hook) (void) = NULL;
++void (*terminal_begin_standout_hook) (void) = NULL;
++void (*terminal_end_standout_hook) (void) = NULL;
++void (*terminal_begin_underline_hook) (void) = NULL;
++void (*terminal_end_underline_hook) (void) = NULL;
++void (*terminal_scroll_terminal_hook) (int start, int end, int amount) = NULL;
++void (*terminal_ring_bell_hook) (void) = NULL;
++void (*terminal_begin_bold_hook) (void) = NULL;
++void (*terminal_begin_blink_hook) (void) = NULL;
++void (*terminal_default_colour_hook) (void) = NULL;
++void (*terminal_set_colour_hook) (int) = NULL;
++void (*terminal_set_bgcolour_hook) (int) = NULL;
++void (*terminal_end_all_modes_hook) (void) = NULL;
+ 
+ /* User variable 'mouse'.  Values can be MP_* constants in terminal.h. */
+ int mouse_protocol = MP_NONE;
+diff --git a/info/terminal.h b/info/terminal.h
+index ee881a8bb1..718d0844a6 100644
+--- a/info/terminal.h
++++ b/info/terminal.h
+@@ -20,8 +20,6 @@
+ #if !defined (TERMINAL_H)
+ #define TERMINAL_H
+ 
+-typedef void VFunction ();
+-
+ /* For almost every function externally visible from terminal.c, there is
+    a corresponding "hook" function which can be bound in order to replace
+    the functionality of the one found in terminal.c.  This is how we go
+@@ -50,87 +48,87 @@ extern int terminal_can_scroll_region;
+    The variables SCREENHEIGHT and SCREENWIDTH are set to the dimensions that
+    this terminal actually has. */
+ extern void terminal_initialize_terminal (char *terminal_name);
+-extern VFunction *terminal_initialize_terminal_hook;
++extern void (*terminal_initialize_terminal_hook) (char *terminal_name);
+ 
+ /* Return the current screen width and height in the variables
+    SCREENWIDTH and SCREENHEIGHT. */
+ extern void terminal_get_screen_size (void);
+-extern VFunction *terminal_get_screen_size_hook;
++extern void (*terminal_get_screen_size_hook) (void);
+ 
+ /* Save and restore tty settings. */
+ extern int terminal_prep_terminal (void);
+ extern void terminal_unprep_terminal (void);
+ 
+-extern VFunction *terminal_prep_terminal_hook;
+-extern VFunction *terminal_unprep_terminal_hook;
++extern int (*terminal_prep_terminal_hook) (void);
++extern void (*terminal_unprep_terminal_hook) (void);
+ 
+ /* Re-initialize the terminal to TERMINAL_NAME. */
+ extern void terminal_new_terminal (char *terminal_name);
+-extern VFunction *terminal_new_terminal_hook;
++extern void (*terminal_new_terminal_hook) (char *terminal_name);
+ 
+ /* Move the cursor to the terminal location of X and Y. */
+ extern void terminal_goto_xy (int x, int y);
+-extern VFunction *terminal_goto_xy_hook;
++extern void (*terminal_goto_xy_hook) (int x, int y);
+ 
+ /* Print STRING to the terminal at the current position. */
+ extern void terminal_put_text (char *string);
+-extern VFunction *terminal_put_text_hook;
++extern void (*terminal_put_text_hook) (char *string);
+ 
+ /* Print NCHARS from STRING to the terminal at the current position. */
+ extern void terminal_write_chars (char *string, int nchars);
+-extern VFunction *terminal_write_chars_hook;
++extern void (*terminal_write_chars_hook) (char *string, int nchars);
+ 
+ /* Clear from the current position of the cursor to the end of the line. */
+ extern void terminal_clear_to_eol (void);
+-extern VFunction *terminal_clear_to_eol_hook;
++extern void (*terminal_clear_to_eol_hook) (void);
+ 
+ /* Clear the entire terminal screen. */
+ extern void terminal_clear_screen (void);
+-extern VFunction *terminal_clear_screen_hook;
++extern void (*terminal_clear_screen_hook) (void);
+ 
+ /* Move the cursor up one line. */
+ extern void terminal_up_line (void);
+-extern VFunction *terminal_up_line_hook;
++extern void (*terminal_up_line_hook) (void);
+ 
+ /* Move the cursor down one line. */
+ extern void terminal_down_line (void);
+-extern VFunction *terminal_down_line_hook;
++extern void (*terminal_down_line_hook) (void);
+ 
+ /* Turn on reverse video if possible. */
+ extern void terminal_begin_inverse (void);
+-extern VFunction *terminal_begin_inverse_hook;
++extern void (*terminal_begin_inverse_hook) (void);
+ 
+ /* Turn off reverse video if possible. */
+ extern void terminal_end_inverse (void);
+-extern VFunction *terminal_end_inverse_hook;
++extern void (*terminal_end_inverse_hook) (void);
+ 
+ /* Turn on standout mode if possible. */
+ extern void terminal_begin_standout (void);
+-extern VFunction *terminal_begin_standout_hook;
++extern void (*terminal_begin_standout_hook) (void);
+ 
+ /* Turn off standout mode if possible. */
+ extern void terminal_end_standout (void);
+-extern VFunction *terminal_end_standout_hook;
++extern void (*terminal_end_standout_hook) (void);
+ 
+ /* Turn on and off underline mode if possible. */
+ void terminal_begin_underline (void);
+-extern VFunction *terminal_begin_underline_hook;
++extern void (*terminal_begin_underline_hook) (void);
+ void terminal_end_underline (void);
+-extern VFunction *terminal_end_underline_hook;
++extern void (*terminal_end_underline_hook) (void);
+ 
+ /* Scroll an area of the terminal, starting with the region from START
+    to END, AMOUNT lines.  If AMOUNT is negative, the lines are scrolled
+    towards the top of the screen, else they are scrolled towards the
+    bottom of the screen. */
+ extern void terminal_scroll_terminal (int start, int end, int amount);
+-extern VFunction *terminal_scroll_terminal_hook;
++extern void (*terminal_scroll_terminal_hook) (int start, int end, int amount);
+ 
+ extern void terminal_scroll_region (int start, int end, int amount);
+ 
+ /* Ring the terminal bell.  The bell is run visibly if it both has one and
+    terminal_use_visible_bell_p is non-zero. */
+ extern void terminal_ring_bell (void);
+-extern VFunction *terminal_ring_bell_hook;
++extern void (*terminal_ring_bell_hook) (void);
+ 
+ /* The key sequences output by special keys, if this terminal has any. */
+ extern char *term_ku, *term_kd, *term_kr, *term_kl;
diff --git a/meta/recipes-extended/texinfo/texinfo_7.0.3.bb b/meta/recipes-extended/texinfo/texinfo_7.0.3.bb
index b149177b72d..849dca433b9 100644
--- a/meta/recipes-extended/texinfo/texinfo_7.0.3.bb
+++ b/meta/recipes-extended/texinfo/texinfo_7.0.3.bb
@@ -33,6 +33,10 @@ SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
            file://link-zip.patch \
            file://dont-depend-on-help2man.patch \
            ${TARGET_PATCH} \
+           file://0001-system.h-remove-strerror-definition-the-prototype-lo.patch \
+           file://0002-info-info.h-Function-CFunction-Remove-unused-typedef.patch \
+           file://0003-Use-explicit-prototype-for-Info-command-functions.patch \
+           file://0004-Remove-VFunction.patch \
            "
 
 SRC_URI[sha256sum] = "3cc5706fb086b895e1dc2b407aade9f95a3a233ff856273e2b659b089f117683"

