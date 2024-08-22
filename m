Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B06C5321E
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:30 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.9500.1724319329407884130
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RFf2YR/g;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5bed05c0a2fso844369a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319328; x=1724924128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAWJU6BLzTEhBwKrevH2R9wHeaAY/l7OhVVpTbgNClk=;
        b=RFf2YR/g+WIaf/QG3Rzg17qBkrVSYwiSw4l+Odhj6HB6ru9C9BrWfK1U3CcKfXhP9c
         O7j272ldCRwiPkcUMdKwJltV2TEZxTwTAQ8vT0sI+mvZvl6iwFZD9Fl4fud6pCpzyXt5
         Ws45rVnmltf20ynnlH2oUvlW10ZASA67n2YJbAfDZD40R4JQkYLUnDk8qZ+M2uAccKax
         EyqUhz1IvQx5Ntec6UERJcTS/rQMglj1wP1t1iHFirVyUgPT0useDtGWwomLjb5a+3wh
         Yzk+CMm8AGJ3ITGe7/uXwLuugBMEdxN4QYSXNWdT/xDDDpEOBs94yKrcg5+4krUBXU2C
         LK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319328; x=1724924128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAWJU6BLzTEhBwKrevH2R9wHeaAY/l7OhVVpTbgNClk=;
        b=meLIL2pQ1304XXAggbyEOezATt/N/NvFIlpP/M/5uxlOd0mG8RngHkkbp+S7b5x701
         46PUAc5DGPtSGtIEuvg3Is+aUYObguj9d20doI5yZqd+cont/aua2cp4BmV+c51Prmjy
         Whuu8pRtFn9OC0FL0EuFL2XTYcdsoukik1ya7rv4LKoXUNWAWEbNmrFMwqXu9wjIncOk
         XUjA6GdALLSlAWCFs2OF5vXiF4fpC9OUg+efJkDYHwC1+1XlJMpeLwbmui1q18R8y1mM
         xut6Z7I0HQTfw3/JIuW/Toi7WWC3+QDmIB4plSV5n4Hi6gSJ4JRrTX3ElBF+G0N/5+Yb
         BGKQ==
X-Gm-Message-State: AOJu0YxiiNMbktRrVuVx1Snpj3T7wDIkFWKiP71VzFyyVcId9b8NWzS5
	27TDGD0OEcesWIpixpuWqWKhcx/xhNvLw0dyYLOe7CVY7Zwdi7dUcuZ4Ig==
X-Google-Smtp-Source: AGHT+IGMWJ9eT+9q8lfFE0wIdVrXeBaLdH3qLKe22Jx86oIAMssdISvrK/JstFf06qLGKDWnRqk/jQ==
X-Received: by 2002:a05:6402:278e:b0:5bf:9c3:8dd4 with SMTP id 4fb4d7f45d1cf-5bf1f289a5amr3581062a12.34.1724319327207;
        Thu, 22 Aug 2024 02:35:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/32] bash: upgrade 5.2.21 -> 5.2.32
Date: Thu, 22 Aug 2024 11:34:52 +0200
Message-Id: <20240822093521.36790-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203618

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...T-handler-while-waiting-for-a-child-.patch | 21 ++++++++-----------
 .../bash/bash/0001-fix-c99.patch              |  2 +-
 .../bash/bash/build-tests.patch               |  7 +++----
 .../bash/bash/fix-filesubst-errexit.patch     |  7 ++-----
 .../bash/bash/fix-run-builtins.patch          |  9 +++-----
 .../bash/bash/mkbuiltins_have_stringize.patch | 18 ++++++++++++----
 .../bash/bash/test-output.patch               | 11 ++++------
 .../bash/bash/use_aclocal.patch               |  3 +--
 .../bash/{bash_5.2.21.bb => bash_5.2.32.bb}   |  2 +-
 9 files changed, 38 insertions(+), 42 deletions(-)
 rename meta/recipes-extended/bash/{bash_5.2.21.bb => bash_5.2.32.bb} (90%)

diff --git a/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch b/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
index 77d770b3647..4e73edb9b3d 100644
--- a/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
+++ b/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
@@ -1,4 +1,4 @@
-From 721d5be99eb37d31e48bd66d61808a66a4c5ab84 Mon Sep 17 00:00:00 2001
+From e4b9493ae4923595ec3ca67f85322129fb3056cf Mon Sep 17 00:00:00 2001
 From: Chet Ramey <chet.ramey@case.edu>
 Date: Mon, 30 Oct 2023 12:16:07 -0400
 Subject: [PATCH] changes to SIGINT handler while waiting for a child; skip
@@ -20,10 +20,10 @@ Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
  6 files changed, 43 insertions(+), 32 deletions(-)
 
 diff --git a/general.c b/general.c
-index 85c5a8b6..65e2ee06 100644
+index bda39f4..94a5339 100644
 --- a/general.c
 +++ b/general.c
-@@ -262,8 +262,9 @@ legal_number (string, result)
+@@ -264,8 +264,9 @@ legal_number (string, result)
    if (errno || ep == string)
      return 0;	/* errno is set on overflow or underflow */
  
@@ -36,7 +36,7 @@ index 85c5a8b6..65e2ee06 100644
  
    /* If *string is not '\0' but *ep is '\0' on return, the entire string
 diff --git a/jobs.c b/jobs.c
-index 6b986ed7..262d78de 100644
+index d3e4ab0..903cf9c 100644
 --- a/jobs.c
 +++ b/jobs.c
 @@ -2718,6 +2718,10 @@ wait_for_background_pids (ps)
@@ -96,7 +96,7 @@ index 6b986ed7..262d78de 100644
        waiting_for_child = 0;
        if (old_sigint_handler == SIG_IGN)
  	set_signal_handler (SIGINT, old_sigint_handler);
-@@ -4136,7 +4144,7 @@ set_job_status_and_cleanup (job)
+@@ -4141,7 +4149,7 @@ set_job_status_and_cleanup (job)
  		 SIGINT (if we reset the sighandler to the default).
  		 In this case, we have to fix things up.  What a crock. */
  	      if (temp_handler == trap_handler && signal_is_trapped (SIGINT) == 0)
@@ -106,7 +106,7 @@ index 6b986ed7..262d78de 100644
  	      if (temp_handler == SIG_DFL)
  		termsig_handler (SIGINT);	/* XXX */
 diff --git a/tests/redir.right b/tests/redir.right
-index 8db10414..9e1403c8 100644
+index 8db1041..9e1403c 100644
 --- a/tests/redir.right
 +++ b/tests/redir.right
 @@ -154,10 +154,10 @@ foo
@@ -123,7 +123,7 @@ index 8db10414..9e1403c8 100644
 +./redir11.sub: line 77: 42: No such file or directory
  42
 diff --git a/tests/redir11.sub b/tests/redir11.sub
-index d417cdb6..ca9854cd 100644
+index d417cdb..ca9854c 100644
 --- a/tests/redir11.sub
 +++ b/tests/redir11.sub
 @@ -34,6 +34,8 @@ a=4 b=7 ss=4 declare -i ss
@@ -136,7 +136,7 @@ index d417cdb6..ca9854cd 100644
  a=4 echo foo 2>&1 >&$(foo) | { grep -q 'Bad file' || echo 'redir11 bad 3'; }
  a=1 echo foo 2>&1 >&$(foo) | { grep -q 'Bad file' || echo 'redir11 bad 4'; }
 diff --git a/tests/type.right b/tests/type.right
-index bbc228e8..e0a66745 100644
+index bbc228e..c0c1c8b 100644
 --- a/tests/type.right
 +++ b/tests/type.right
 @@ -24,15 +24,15 @@ func ()
@@ -164,7 +164,7 @@ index bbc228e8..e0a66745 100644
  builtin is a shell builtin
  /bin/sh
 diff --git a/tests/type.tests b/tests/type.tests
-index fd39c18a..ddc15407 100644
+index fd39c18..ddc1540 100644
 --- a/tests/type.tests
 +++ b/tests/type.tests
 @@ -25,8 +25,6 @@ type -r ${THIS_SH}
@@ -221,6 +221,3 @@ index fd39c18a..ddc15407 100644
  type m
  
  hash -r
--- 
-2.35.5
-
diff --git a/meta/recipes-extended/bash/bash/0001-fix-c99.patch b/meta/recipes-extended/bash/bash/0001-fix-c99.patch
index aa810f7d4e6..abd83d09af3 100644
--- a/meta/recipes-extended/bash/bash/0001-fix-c99.patch
+++ b/meta/recipes-extended/bash/bash/0001-fix-c99.patch
@@ -1,4 +1,4 @@
-From e9ed388e760ec33dcf9e72c639946c0d0abeec26 Mon Sep 17 00:00:00 2001
+From e8ec2d75a52bdc93c83a679a71a68f4033033b8b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 19 Jun 2024 12:57:39 +0000
 Subject: [PATCH] Fix C99 problems
diff --git a/meta/recipes-extended/bash/bash/build-tests.patch b/meta/recipes-extended/bash/bash/build-tests.patch
index c1b9b8261f0..4cce1ba993f 100644
--- a/meta/recipes-extended/bash/bash/build-tests.patch
+++ b/meta/recipes-extended/bash/bash/build-tests.patch
@@ -1,4 +1,4 @@
-From 318b762837c2ad25319caeaf0320eff613b64daf Mon Sep 17 00:00:00 2001
+From c3f58f8b4f7a359b9d9dd97a45bcaab50a89d224 Mon Sep 17 00:00:00 2001
 From: Anders Roxell <anders.roxell@enea.com>
 Date: Wed, 19 Dec 2012 17:18:31 +0100
 Subject: [PATCH] Add 'ptest' target to Makefile, to run tests without checking
@@ -9,16 +9,15 @@ Signed-off-by: Anders Roxell <anders.roxell@enea.com>
 
 Rebase to 5.0
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  Makefile.in | 24 +++++++++++++++++++-----
  1 file changed, 19 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index bc97049..937ce39 100644
+index 0b4df73..7e2a34e 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -943,20 +943,34 @@ maybe-clean:
+@@ -958,20 +958,34 @@ maybe-clean:
  	fi
  
  recho$(EXEEXT):		$(SUPPORT_SRC)recho.c
diff --git a/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch b/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
index 60f1852316e..c5082ee3558 100644
--- a/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
+++ b/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
@@ -1,4 +1,4 @@
-From 59ddfda14e3c9aa6286bb4c4c0748f7c1324a65a Mon Sep 17 00:00:00 2001
+From 16951b74971c7fd38fd036dac1410a9e53cbe736 Mon Sep 17 00:00:00 2001
 From: Chet Ramey <chet.ramey@case.edu>
 Date: Fri, 7 Apr 2023 00:28:46 -0700
 Subject: [PATCH] $(<nosuchfile) is no longer a fatal error with errexit
@@ -17,7 +17,7 @@ Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/builtins/evalstring.c b/builtins/evalstring.c
-index df3dd68e2a7e..6612081cd646 100644
+index 53a7c0b..c5075cc 100644
 --- a/builtins/evalstring.c
 +++ b/builtins/evalstring.c
 @@ -753,7 +753,7 @@ open_redir_file (r, fnp)
@@ -29,6 +29,3 @@ index df3dd68e2a7e..6612081cd646 100644
        free (fn);
        if (fnp)
  	*fnp = 0;
--- 
-2.40.0
-
diff --git a/meta/recipes-extended/bash/bash/fix-run-builtins.patch b/meta/recipes-extended/bash/bash/fix-run-builtins.patch
index 2fa388302e2..05d08598213 100644
--- a/meta/recipes-extended/bash/bash/fix-run-builtins.patch
+++ b/meta/recipes-extended/bash/bash/fix-run-builtins.patch
@@ -1,4 +1,4 @@
-From 0c4cab9594c96c2dc435a8d9724605824bcbf917 Mon Sep 17 00:00:00 2001
+From 15601c71b073a604ccda25c7f14f0bb12e9a3b28 Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Tue, 19 Apr 2016 02:57:45 -0400
 Subject: [PATCH] fix run-builtins failed
@@ -16,10 +16,10 @@ Signed-off-by: Dengke Du <dengke.du@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/builtins.tests b/tests/builtins.tests
-index 9d77520..63f3af8 100644
+index 8eee43e..71c9eee 100644
 --- a/tests/builtins.tests
 +++ b/tests/builtins.tests
-@@ -109,7 +109,7 @@ esac
+@@ -124,7 +124,7 @@ esac
  
  # test options to exec
  (exec -a specialname ${THIS_SH} -c 'echo $0' )
@@ -28,6 +28,3 @@ index 9d77520..63f3af8 100644
  # test `clean' environment.  if /bin/sh is bash, and the script version of
  # printenv is run, there will be variables in the environment that bash
  # sets on startup.  Also test code that prefixes argv[0] with a dash.
--- 
-2.8.1
-
diff --git a/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch b/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
index a9391d6cacb..eb29e7d836d 100644
--- a/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
+++ b/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
@@ -1,3 +1,8 @@
+From d11685286144c2e5630545e435d11387b2908fd0 Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Wed, 14 Nov 2012 07:55:09 -0700
+Subject: [PATCH] bash: fix mkbuiltins build failure
+
 On hosts with FORTIFY_SOURCES, stringize support is required, as it's used by
 the macros to wrap functions (e.g. read and open in unistd.h). Those wrappers
 use the STRING() macro from unistd.h. A header in the bash sources overrides
@@ -13,14 +18,19 @@ stringize support, or to not define STRING() at all when FORTIFY_SOURCES is
 defined, letting the unistd.h one be used, instead.
 
 Upstream-Status: Pending
+---
+ builtins/mkbuiltins.c | 1 +
+ 1 file changed, 1 insertion(+)
 
---- bash-4.2.orig/builtins/mkbuiltins.c
-+++ bash-4.2/builtins/mkbuiltins.c
+diff --git a/builtins/mkbuiltins.c b/builtins/mkbuiltins.c
+index f505ebd..b5b2eed 100644
+--- a/builtins/mkbuiltins.c
++++ b/builtins/mkbuiltins.c
 @@ -28,6 +28,7 @@
  #  define HAVE_STDLIB_H
-
+ 
  #  define HAVE_RENAME
 +#  define HAVE_STRINGIZE
  #endif /* CROSS_COMPILING */
-
+ 
  #if defined (HAVE_UNISTD_H)
diff --git a/meta/recipes-extended/bash/bash/test-output.patch b/meta/recipes-extended/bash/bash/test-output.patch
index 0ffcc24587c..3225907b661 100644
--- a/meta/recipes-extended/bash/bash/test-output.patch
+++ b/meta/recipes-extended/bash/bash/test-output.patch
@@ -1,7 +1,7 @@
-From 28eb06047ebd2deaa8c7cd2bf6655ef6a469dc14 Mon Sep 17 00:00:00 2001
+From f5cbd5a4954b89857c9e397cacceda552484f5d5 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 10:01:56 +0800
-Subject: [PATCH 1/2] Add FAIL/PASS output to test output.
+Subject: [PATCH] Add FAIL/PASS output to test output.
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -16,10 +16,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 10 insertions(+), 1 deletion(-)
 
 diff --git a/tests/run-all b/tests/run-all
-index 2882fe0..e21d026 100644
+index 1f74923..ba36a1f 100644
 --- a/tests/run-all
 +++ b/tests/run-all
-@@ -33,7 +33,16 @@ do
+@@ -57,7 +57,16 @@ do
  	case $x in
  	$0|run-minimal|run-gprof)	;;
  	*.orig|*~) ;;
@@ -37,6 +37,3 @@ index 2882fe0..e21d026 100644
  	esac
  done
  
--- 
-1.8.3.1
-
diff --git a/meta/recipes-extended/bash/bash/use_aclocal.patch b/meta/recipes-extended/bash/bash/use_aclocal.patch
index bd6870b3861..e966b037a27 100644
--- a/meta/recipes-extended/bash/bash/use_aclocal.patch
+++ b/meta/recipes-extended/bash/bash/use_aclocal.patch
@@ -1,4 +1,4 @@
-From d1bf23817afffd5917b74da6946e0c3b7e63e336 Mon Sep 17 00:00:00 2001
+From b3a64702fa1978463c01bd5d9fe711e4628aba1e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 28 Dec 2020 21:04:27 +0100
 Subject: [PATCH] bash: update 5.0 -> 5.1
@@ -9,7 +9,6 @@ as needed instead making it work like other autotools based projects.
 
 Upstream-Status: Inappropriate [OE configuration specific]
 RP 2021/1/20
-
 ---
  configure.ac | 43 -------------------------------------------
  1 file changed, 43 deletions(-)
diff --git a/meta/recipes-extended/bash/bash_5.2.21.bb b/meta/recipes-extended/bash/bash_5.2.32.bb
similarity index 90%
rename from meta/recipes-extended/bash/bash_5.2.21.bb
rename to meta/recipes-extended/bash/bash_5.2.32.bb
index ccfe5c47a7e..b159c0232f8 100644
--- a/meta/recipes-extended/bash/bash_5.2.21.bb
+++ b/meta/recipes-extended/bash/bash_5.2.32.bb
@@ -17,7 +17,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://0001-fix-c99.patch \
            "
 
-SRC_URI[tarball.sha256sum] = "c8e31bdc59b69aaffc5b36509905ba3e5cbb12747091d27b4b977f078560d5b8"
+SRC_URI[tarball.sha256sum] = "d3ef80d2b67d8cbbe4d3265c63a72c46f9b278ead6e0e06d61801b58f23f50b5"
 
 DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-- 
2.39.2


