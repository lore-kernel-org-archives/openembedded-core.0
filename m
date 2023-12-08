Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9EAC46CA3
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 02:33:59 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.11168.1702002832085840696
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 18:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=myH6qpVz;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5c230c79c0bso1197986a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 18:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702002831; x=1702607631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vciU/I6JpB6/VKpIAHbE9zj2GA34sjHpL0dG9BPSI98=;
        b=myH6qpVz6tD5YPAu1RMtt5oo5R1eh1448N6AMkqt6yMDL99ZPiTGfOQpQlMeDTr9Pu
         E/bmVyHJiq/bzBjrXZoRi2Y6/Rk7+V5mpKuCNaAqpMuhG1fk6Q5oOX27UK3Rz50lf7wo
         PsfE95Q1djwf7kuJxgR8GImpieP+zw8KYVfHKo65baW/AawQ4YtfWZGxXlyKpvUgXSLe
         t1yE+mxCzZRn0VxaXROSJmq1WXfiXaQEVe5TmizpJJoXMwr/+qJOABeybHeF//CGP8ez
         Bg6UkTx3IJdH5D5REybXdKH9G4nEVpTfHAcaeLqhiQmyLoeTTUyDA6TGF+v3xwrS+duY
         Ergg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702002831; x=1702607631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vciU/I6JpB6/VKpIAHbE9zj2GA34sjHpL0dG9BPSI98=;
        b=djVA3BzogREijO0ojLaKptWK8Jeeeg+kHZWarq1tRR3nl9uOz4O7WgWlk0PMHznUt9
         VKKE9WmRPimHjaZ9Lv9hHK6dnUMnI8d7X8S2DpwmDa/vzMKEuzb9+0l4JS5RwHWhXv8z
         stiO9OT3S45a+6mvAFPtDipmYs0fWmAZ+8kIs8RUPFqGJK5b68ICCNR+2MwpUYvW/JZ4
         WJidbNtKcwa+K8RsE7QeH8jUq4lq+/Zh5r2yoNMch6ACeKg0SHjGXP+NUTStX9bqBqXz
         3DkSqSUOEUSNLGAo/nj9OGJJPiyRlIfnD9kxq8G8d+0auz784A/+qwvVGg31d9z+1gc6
         3QSQ==
X-Gm-Message-State: AOJu0YwJZ5RxozwNuzKn/LgjtXa4eSCpq1Sk+p+oyU+KrT4wPPc3KdSD
	jgintJ+wvM5wJF6RDV8ux4QjVvATeLvAwo9Eotk=
X-Google-Smtp-Source: AGHT+IGnBLKHSzEZkh7p/KE3ZMZgWOAglTJOvJWv/kVe8hhAZZNKux+Eue91eafwsUTi00TPhheRXw==
X-Received: by 2002:a05:6a20:a087:b0:18f:97c:ba1c with SMTP id r7-20020a056a20a08700b0018f097cba1cmr2582419pzj.118.1702002830759;
        Thu, 07 Dec 2023 18:33:50 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id i11-20020a170902c94b00b001c9bc811d4dsm499752pla.295.2023.12.07.18.33.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 18:33:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/15] bash: changes to SIGINT handler while waiting for a child
Date: Thu,  7 Dec 2023 16:33:15 -1000
Message-Id: <a351d62ca7deff548542c849a6fa696280b5533a.1702002667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702002667.git.steve@sakoman.com>
References: <cover.1702002667.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192001

From: Wenlin Kang <wenlin.kang@windriver.com>

It rarely observes the problem while running shell script aborting
test repeatedly, at the problem, the test shell script never returns
to shell

Steps to reproduce:
1. Run test script and ctrl-c repeatedly
2. Observe whether returns to shell after ctrl-c

Fixed issue:
https://lists.gnu.org/archive/html/bug-bash/2023-10/msg00131.html

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...T-handler-while-waiting-for-a-child-.patch | 229 ++++++++++++++++++
 meta/recipes-extended/bash/bash_5.1.16.bb     |   1 +
 2 files changed, 230 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch

diff --git a/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch b/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
new file mode 100644
index 0000000000..c12b4b7766
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
@@ -0,0 +1,229 @@
+From 7e84276e07c0835a8729d6fe1265e70eedb2a7f7 Mon Sep 17 00:00:00 2001
+From: Chet Ramey <chet.ramey@case.edu>
+Date: Mon, 30 Oct 2023 12:16:07 -0400
+Subject: [PATCH] changes to SIGINT handler while waiting for a child; skip
+ vertical whitespace after translating an integer
+
+Upstream-Status: Backport
+https://git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=fe24a6a55e8850298b496c5b9d82f1866eba190e
+
+[Adjust and drop some codes to be applicable the tree]
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ general.c         |  5 +++--
+ jobs.c            | 26 ++++++++++++++++----------
+ tests/redir.right |  4 ++--
+ tests/redir11.sub |  2 ++
+ tests/type.right  | 16 ++++++++--------
+ tests/type.tests  | 24 ++++++++++++------------
+ 6 files changed, 43 insertions(+), 34 deletions(-)
+
+diff --git a/general.c b/general.c
+index 50d5216..68987e2 100644
+--- a/general.c
++++ b/general.c
+@@ -262,8 +262,9 @@ legal_number (string, result)
+   if (errno || ep == string)
+     return 0;	/* errno is set on overflow or underflow */
+ 
+-  /* Skip any trailing whitespace, since strtoimax does not. */
+-  while (whitespace (*ep))
++  /* Skip any trailing whitespace, since strtoimax does not, using the same
++     test that strtoimax uses for leading whitespace. */
++  while (isspace ((unsigned char) *ep))
+     ep++;
+ 
+   /* If *string is not '\0' but *ep is '\0' on return, the entire string
+diff --git a/jobs.c b/jobs.c
+index 7c3b6e8..84dab4d 100644
+--- a/jobs.c
++++ b/jobs.c
+@@ -2727,6 +2727,10 @@ wait_for_background_pids (ps)
+ #define INVALID_SIGNAL_HANDLER (SigHandler *)wait_for_background_pids
+ static SigHandler *old_sigint_handler = INVALID_SIGNAL_HANDLER;
+ 
++/* The current SIGINT handler as set by restore_sigint_handler. Only valid
++   immediately after restore_sigint_handler, used for continuations. */
++static SigHandler *cur_sigint_handler = INVALID_SIGNAL_HANDLER;   
++
+ static int wait_sigint_received;
+ static int child_caught_sigint;
+ 
+@@ -2743,6 +2747,7 @@ wait_sigint_cleanup ()
+ static void
+ restore_sigint_handler ()
+ {
++  cur_sigint_handler = old_sigint_handler;
+   if (old_sigint_handler != INVALID_SIGNAL_HANDLER)
+     {
+       set_signal_handler (SIGINT, old_sigint_handler);
+@@ -2766,8 +2771,7 @@ wait_sigint_handler (sig)
+       restore_sigint_handler ();
+       /* If we got a SIGINT while in `wait', and SIGINT is trapped, do
+ 	 what POSIX.2 says (see builtins/wait.def for more info). */
+-      if (this_shell_builtin && this_shell_builtin == wait_builtin &&
+-	  signal_is_trapped (SIGINT) &&
++	if (signal_is_trapped (SIGINT) &&
+ 	  ((sigint_handler = trap_to_sighandler (SIGINT)) == trap_handler))
+ 	{
+ 	  trap_handler (SIGINT);	/* set pending_traps[SIGINT] */
+@@ -2792,6 +2796,8 @@ wait_sigint_handler (sig)
+     {
+       set_exit_status (128+SIGINT);
+       restore_sigint_handler ();
++      if (cur_sigint_handler == INVALID_SIGNAL_HANDLER)
++		set_sigint_handler ();		/* XXX - only do this in one place */
+       kill (getpid (), SIGINT);
+     }
+ 
+@@ -2934,15 +2940,15 @@ wait_for (pid, flags)
+     {
+       SigHandler *temp_sigint_handler;
+ 
+-      temp_sigint_handler = set_signal_handler (SIGINT, wait_sigint_handler);
+-      if (temp_sigint_handler == wait_sigint_handler)
+-	{
++      temp_sigint_handler = old_sigint_handler;
++      old_sigint_handler = set_signal_handler (SIGINT, wait_sigint_handler);
++      if (old_sigint_handler == wait_sigint_handler)
++		{
+ #if defined (DEBUG)
+-	  internal_warning ("wait_for: recursively setting old_sigint_handler to wait_sigint_handler: running_trap = %d", running_trap);
++			internal_debug ("wait_for: recursively setting old_sigint_handler to wait_sigint_handler: running_trap = %d", running_trap);
+ #endif
+-	}
+-      else
+-	old_sigint_handler = temp_sigint_handler;
++			old_sigint_handler = temp_sigint_handler;
++		}
+       waiting_for_child = 0;
+       if (old_sigint_handler == SIG_IGN)
+ 	set_signal_handler (SIGINT, old_sigint_handler);
+@@ -4148,7 +4154,7 @@ set_job_status_and_cleanup (job)
+ 		 SIGINT (if we reset the sighandler to the default).
+ 		 In this case, we have to fix things up.  What a crock. */
+ 	      if (temp_handler == trap_handler && signal_is_trapped (SIGINT) == 0)
+-		  temp_handler = trap_to_sighandler (SIGINT);
++		temp_handler = trap_to_sighandler (SIGINT);
+ 	      restore_sigint_handler ();
+ 	      if (temp_handler == SIG_DFL)
+ 		termsig_handler (SIGINT);	/* XXX */
+diff --git a/tests/redir.right b/tests/redir.right
+index 8db1041..9e1403c 100644
+--- a/tests/redir.right
++++ b/tests/redir.right
+@@ -154,10 +154,10 @@ foo
+ 1
+ 7
+ after: 42
+-./redir11.sub: line 53: $(ss= declare -i ss): ambiguous redirect
++./redir11.sub: line 55: $(ss= declare -i ss): ambiguous redirect
+ after: 42
+ a+=3
+ foo
+ foo
+-./redir11.sub: line 75: 42: No such file or directory
++./redir11.sub: line 77: 42: No such file or directory
+ 42
+diff --git a/tests/redir11.sub b/tests/redir11.sub
+index d417cdb..2a9f2b8 100644
+--- a/tests/redir11.sub
++++ b/tests/redir11.sub
+@@ -56,6 +56,8 @@ foo()
+ a=4 b=7 foo
+ echo after: $a
+ 
++exec 7>&- 4>&-
++
+ unset a
+ typeset -i a
+ a=4 eval echo $(echo a+=3)
+diff --git a/tests/type.right b/tests/type.right
+index f876715..c09ab73 100644
+--- a/tests/type.right
++++ b/tests/type.right
+@@ -24,15 +24,15 @@ func ()
+ }
+ while
+ while is a shell keyword
+-./type.tests: line 56: type: m: not found
+-alias m='more'
+-alias m='more'
+-m is aliased to `more'
++./type.tests: line 56: type: morealias: not found
++alias morealias='more'
++alias morealias='more'
++morealias is aliased to `more'
+ alias
+-alias m='more'
+-alias m='more'
+-alias m='more'
+-m is aliased to `more'
++alias morealias='more'
++alias morealias='more'
++alias morealias='more'
++morealias is aliased to `more'
+ builtin
+ builtin is a shell builtin
+ /bin/sh
+diff --git a/tests/type.tests b/tests/type.tests
+index fd39c18..ddc1540 100644
+--- a/tests/type.tests
++++ b/tests/type.tests
+@@ -25,8 +25,6 @@ type -r ${THIS_SH}
+ type notthere
+ command -v notthere
+ 
+-alias m=more
+-
+ unset -f func 2>/dev/null
+ func() { echo this is func; }
+ 
+@@ -49,24 +47,26 @@ command -V func
+ command -v while
+ command -V while
+ 
++alias morealias=more
++
+ # the following two lines should produce the same output
+ # post-3.0 patch makes command -v silent, as posix specifies
+ # first test with alias expansion off (should all fail or produce no output)
+-type -t m
+-type m
+-command -v m
++type -t morealias
++type morealias
++command -v morealias
+ alias -p
+-alias m
++alias morealias
+ 
+ # then test with alias expansion on 
+ shopt -s expand_aliases
+-type m
+-type -t m
+-command -v m
++type morealias
++type -t morealias
++command -v morealias
+ alias -p
+-alias m
++alias morealias
+ 
+-command -V m
++command -V morealias
+ shopt -u expand_aliases
+ 
+ command -v builtin
+@@ -76,7 +76,7 @@ command -V /bin/sh
+ 
+ unset -f func
+ type func
+-unalias m
++unalias morealias
+ type m
+ 
+ hash -r
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/bash/bash_5.1.16.bb b/meta/recipes-extended/bash/bash_5.1.16.bb
index 11c2314fbf..ab1ecffb3d 100644
--- a/meta/recipes-extended/bash/bash_5.1.16.bb
+++ b/meta/recipes-extended/bash/bash_5.1.16.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://makerace.patch \
            file://makerace2.patch \
            file://CVE-2022-3715.patch \
+           file://0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch \
            "
 
 SRC_URI[tarball.sha256sum] = "5bac17218d3911834520dad13cd1f85ab944e1c09ae1aba55906be1f8192f558"
-- 
2.34.1


