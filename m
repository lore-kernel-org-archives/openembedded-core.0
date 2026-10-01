Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CE0CA5FD4
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 15:37:11 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14339.1790869029944142539
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 08:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UQJ98eqZ;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a024e16179so3223895e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 08:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790869028; x=1791473828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BxCEE1ZX4qzGDvo/aXKRkToEo8vBUi7TxFVfAMmBx1U=;
        b=UQJ98eqZMVsnKF51a/4+KvAY2JM8Mmfq0ivCCVRWxYai2jfEtgVVq9CU8ORmsllXyq
         cHDkpZnR6FUA+/1oU9wIEKnvBMKB07pwHNnzVxL2uDt3ahOhhChB1D08EHbDtFUHfXZa
         yq16FgMjD83mPnPzjOGUuSslQY2wds7IwJtVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869028; x=1791473828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BxCEE1ZX4qzGDvo/aXKRkToEo8vBUi7TxFVfAMmBx1U=;
        b=23MkT8qhYq10tFa6M5pq6li11NRsnk//fdXO+/HENFlY9SwMBza/tOf8JOvdHhooJy
         DDDNBQ2fjJT+HxCNahjCWapLyKzX7/ZuohfoO8G0RT1nuZpUgOAiLtElic9m64hL/J6J
         NyyqfY92JMJMy+Y2R/wTO6Ldg2x5Th53AXtKGpF+GQ5tHLMyUL8CuOI9x224cGZXSOSB
         PjlLb2mfDPTsPC661GdC+H9ZdIVgoFqFh6tp7Gb8aRNTbPhuqVRJEdiEF9/KKZksB70B
         jll2JvK2ksiDlHIeRimWLjU90ELEWHKtbdvEIjsEykY3pND1dgJDw0FMl3VCv1LDALn8
         DrwQ==
X-Gm-Message-State: AFuF++lQ+ulyT+Fibb/IAdscjRw03dJ3qkAfGRLvQtNQFMdPo0IBNtDG
	TfNrgiReQy3Ia3ZAJFkpdUMYw0GBxrMyjK/4dG7+0bmN+bxB/DI5m2Q00HXOtag76v+yrk4kdU4
	5N7m9TG4=
X-Gm-Gg: AYBFou3vOH8zwW3iR5h938spJ4g70kUYNJfqX715zm+hUIDAENS6Gw/9DlD5IgpiHkB
	tkqahwAeRwlD+770nKUN3at7n9tz2CbSetOyxWAcn1WH4hRXcUqrtgW05UGVaFj10XjjezSKSNj
	WFQ4EqU52yu+25bXrl2LiB4qfEl2bgF8uK6Io/awDOfVZ3ilb5TFiEVoTSedKJmgdgcDXpm+7sA
	Q39iFNCp6GcHNWrZZhuV9iQ0spDUTmeygpzbGj1D5dfXvEBOSArmc8mP+3cuJPOum4gEGZLAK3r
	J77mnef0r2L7Ts2rvlWUQ3m5ghYCruYEbhvebXOETYiqTY0Oek4A40EiygtQOwb51iLTU92K467
	/ILXIm0rwkAyyLrJvSgFxAXaRY+lkb315VeCiVl5bWc1p3ziWZHp4l+PgXAiF+E2sQHd/BGvOxH
	P4JHn0+Sk6sjT7JaG63/cGwI5YzfFUSgKVOJVKLvmjwEhieV2mFFQXZLp1wT4VO9L/2ebn137+K
	KCbmqNVeOlr+jlF8k9Sp/sNxFU=
X-Received: by 2002:a05:600c:4f81:b0:4a0:1ebb:bd0b with SMTP id 5b1f17b1804b1-4a02755f840mr117355e9.8.1790869027714;
        Thu, 01 Oct 2026 08:37:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:97e5:70fa:8dd4:c479])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f900c23sm46951995e9.1.2026.10.01.08.37.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:37:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] coreutils: Backport printenv fix
Date: Thu,  1 Oct 2026 16:37:04 +0100
Message-ID: <20261001153704.2633029-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 15:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247041

This fix was recommended by upstream and committed just after release,
backport it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...1e5bc2090212273bb731dceee2cc2a071e54.patch | 208 ++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.12.bb |   1 +
 2 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/782a1e5bc2090212273bb731dceee2cc2a071e54.patch

diff --git a/meta/recipes-core/coreutils/coreutils/782a1e5bc2090212273bb731dceee2cc2a071e54.patch b/meta/recipes-core/coreutils/coreutils/782a1e5bc2090212273bb731dceee2cc2a071e54.patch
new file mode 100644
index 00000000000..06d8e62b11d
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/782a1e5bc2090212273bb731dceee2cc2a071e54.patch
@@ -0,0 +1,208 @@
+From 782a1e5bc2090212273bb731dceee2cc2a071e54 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
+Date: Tue, 15 Sep 2026 20:26:28 +0100
+Subject: [PATCH] env,printenv: only quote when outputting to terminals
+
+To support albeit non-robust but existing use cases like:
+
+  env | grep SPARK_JAVA_OPT_ | sort -t_ -k4 -n |
+   sed 's/[^=]*=\(.*\)/\1/g' > java_opts.txt
+  readarray -t SPARK_EXECUTOR_JAVA_OPTS < java_opts.txt
+  ...
+  CMD=("${JAVA_HOME}/bin/java" "${SPARK_EXECUTOR_JAVA_OPTS[@]}" ...)
+
+* src/env.c (main): Restrict quoting to terminals.
+* src/printenv.c (main): Likewise.
+* tests/env/env.sh: Adjust accordingly.
+* tests/misc/printenv.sh: Likewise.
+* doc/coreutils.texi: Likewise.
+
+Link: https://github.com/coreutils/coreutils/issues/355
+
+Upstream-Status: Backport [https://github.com/coreutils/coreutils/commit/782a1e5bc2090212273bb731dceee2cc2a071e54.patch]
+---
+ doc/coreutils.texi     | 16 ++++++----------
+ src/env.c              |  2 +-
+ src/printenv.c         |  2 +-
+ tests/env/env.sh       | 31 +++++++------------------------
+ tests/misc/printenv.sh | 40 ++++------------------------------------
+ 5 files changed, 19 insertions(+), 72 deletions(-)
+
+diff --git a/doc/coreutils.texi b/doc/coreutils.texi
+index b769e64c17..9d78885112 100644
+--- a/doc/coreutils.texi
++++ b/doc/coreutils.texi
+@@ -15519,13 +15519,9 @@ The program accepts the following option.  Also see @ref{Common options}.
+ 
+ @end table
+ 
+-If no @var{variable}s are specified, @command{printenv} quotes
++If standard output is a terminal @command{printenv} quotes
+ environment variables and their values using the @samp{shell-escape}
+-style.  If @var{variable}s are specified, @command{printenv} only quotes
+-their values using the @samp{shell-escape} style if standard output is a
+-terminal.
+-
+-The environment variable @env{QUOTING_STYLE}
++style by default. The environment variable @env{QUOTING_STYLE}
+ specifies the quoting style.  Valid quoting styles are:
+ @quotingStyles
+ 
+@@ -17497,10 +17493,10 @@ If no command name is specified following the environment
+ specifications, the resulting environment is printed.  This is like
+ specifying the @command{printenv} program.
+ 
+-The printed environment variables and their values are quoted using the
+-@samp{shell-escape} style.   The environment variable
+-@env{QUOTING_STYLE} specifies the quoting style.  Valid quoting styles
+-are:
++If standard output is a terminal, the printed environment variables
++and their values are quoted using the @samp{shell-escape} style by default.
++The environment variable @env{QUOTING_STYLE} specifies the quoting style.
++Valid quoting styles are:
+ @quotingStyles
+ 
+ For some examples, suppose the environment passed to @command{env}
+diff --git a/src/env.c b/src/env.c
+index e646cba96d..8fff89e72f 100644
+--- a/src/env.c
++++ b/src/env.c
+@@ -1113,7 +1113,7 @@ main (int argc, char **argv)
+ 
+   /* Get the value from QUOTING_STYLE before unsetting environment
+      variables.  */
+-  if (!opt_nul_terminate_output)
++  if (!opt_nul_terminate_output && isatty (STDOUT_FILENO))
+     {
+       int qs = getenv_quoting_style ();
+       if (qs < 0)
+diff --git a/src/printenv.c b/src/printenv.c
+index dba87f373f..00ca29f55b 100644
+--- a/src/printenv.c
++++ b/src/printenv.c
+@@ -113,7 +113,7 @@ main (int argc, char **argv)
+   bool quote_output = false;
+   idx_t const n_args = argc - optind;
+ 
+-  if (!opt_nul_terminate_output && (n_args <= 0 || isatty (STDOUT_FILENO)))
++  if (!opt_nul_terminate_output && isatty (STDOUT_FILENO))
+     {
+       int qs = getenv_quoting_style ();
+       if (qs < 0)
+diff --git a/tests/env/env.sh b/tests/env/env.sh
+index be822e3460..8853e01633 100755
+--- a/tests/env/env.sh
++++ b/tests/env/env.sh
+@@ -91,18 +91,14 @@ EOF
+ compare exp out || fail=1
+ 
+ # env shouldn't care what encoding name or value is
+-cat <<\EOF >exp || framework_failure_
+-NON_UTF8_TEST=''$'\240'
+-EOF
++printf 'NON_UTF8_TEST=\240\n' > exp || framework_failure_
+ env $(printf 'NON_UTF8_TEST=\240') env > all || fail=1
+ grep '^NON_UTF8_TEST' all | LC_ALL=C sort > out || framework_failure_
+ compare exp out || fail=1
+ 
+-cat <<\EOF >exp || framework_failure_
+-'NON_UTF8_TEST'$'\240'=1
+-EOF
++printf 'NON_UTF8_TEST\240=1\n' > exp || framework_failure_
+ env $(printf 'NON_UTF8_TEST\240=1') env > all || fail=1
+-grep "^'NON_UTF8_TEST" all | LC_ALL=C sort > out || framework_failure_
++grep "^NON_UTF8_TEST" all | LC_ALL=C sort > out || framework_failure_
+ compare exp out || fail=1
+ 
+ # PATH modifications affect exec.
+@@ -193,29 +189,16 @@ EOF
+ compare err_exp err || fail=1
+ done
+ 
+-# QUOTING_STYLE affects redirected output.
+-cat <<\EOF >exp-noargs-literal || framework_failure_
+-a b=c d
+-EOF
+-cat <<\EOF >exp-noargs-shell || framework_failure_
+-'a b'='c d'
+-EOF
+-tr "'" '"' <exp-noargs-shell >exp-noargs-c || framework_failure_
+-for qs in literal shell c; do
++# QUOTING_STYLE does not affect redirected output.
++printf '%s\n' 'a b=c d' > exp || framework_failure_
++for qs in literal shell-always invalid; do
+   env -i PATH="$PATH" QUOTING_STYLE=$qs 'a b'='c d' \
+     env >out-t 2>err || fail=1
+   grep -vE '^["'"'"']?'\
+ '(__CF_USER_TEXT_ENCODING|QUOTING_STYLE|(LD_ORIGIN_)?PATH)["'"'"']?=' \
+     out-t >out || framework_failure_
+-  compare exp-noargs-$qs out || fail=1
++  compare exp out || fail=1
+   compare /dev/null err || fail=1
+ done
+ 
+-# Check the behavior with an invalid value for QUOTING_STYLE.
+-printf 'env: ignoring invalid value of environment variable %s\n' \
+-  "QUOTING_STYLE: 'invalid'" >exp || framework_failure_
+-env QUOTING_STYLE=invalid env >out 2>err || fail=1
+-grep '^QUOTING_STYLE=invalid$' out || fail=1
+-compare exp err || fail=1
+-
+ Exit $fail
+diff --git a/tests/misc/printenv.sh b/tests/misc/printenv.sh
+index b8c3696c40..33ad6cc51f 100755
+--- a/tests/misc/printenv.sh
++++ b/tests/misc/printenv.sh
+@@ -80,48 +80,16 @@ compare exp out || fail=1
+ returns_ 1 env a=b=c printenv a=b > out || fail=1
+ compare /dev/null out || fail=1
+ 
+-# QUOTING_STYLE affects redirected output.
+-cat <<\EOF >exp-noargs-literal || framework_failure_
+-a b=c d
+-EOF
+-cat <<\EOF >exp-arg-literal || framework_failure_
+-c d
+-EOF
+-cat <<\EOF >exp-args-literal || framework_failure_
+-c d
+-c d
+-EOF
+-cat <<\EOF >exp-noargs-shell || framework_failure_
+-'a b'='c d'
+-EOF
+-cp exp-arg-literal exp-arg-shell &&
+-cp exp-args-literal exp-args-shell || framework_failure_
+-for t in noargs arg args; do
+-  tr "'" '"' <exp-$t-shell >exp-$t-c || framework_failure_
+-done
+-for qs in literal shell c; do
++# QUOTING_STYLE does not affect redirected output.
++printf '%s\n' 'a b=c d' > exp || framework_failure_
++for qs in literal shell-always invalid; do
+   env -i PATH="$PATH" QUOTING_STYLE=$qs 'a b'='c d' \
+     printenv >out-t 2>err || fail=1
+   grep -vE '^["'"'"']?'\
+ '(__CF_USER_TEXT_ENCODING|QUOTING_STYLE|(LD_ORIGIN_)?PATH)["'"'"']?=' \
+     out-t >out || framework_failure_
+-  compare exp-noargs-$qs out || fail=1
+-  compare /dev/null err || fail=1
+-  env -i PATH="$PATH" QUOTING_STYLE=$qs 'a b'='c d' \
+-    printenv 'a b' >out 2>err || fail=1
+-  compare exp-arg-$qs out || fail=1
+-  compare /dev/null err || fail=1
+-  env -i PATH="$PATH" QUOTING_STYLE=$qs 'a b'='c d' \
+-    printenv 'a b' 'a b' >out 2>err || fail=1
+-  compare exp-args-$qs out || fail=1
++  compare exp out || fail=1
+   compare /dev/null err || fail=1
+ done
+ 
+-# Check the behavior with an invalid value for QUOTING_STYLE.
+-printf 'printenv: ignoring invalid value of environment variable %s\n' \
+-  "QUOTING_STYLE: 'invalid'" >exp || framework_failure_
+-env QUOTING_STYLE=invalid printenv >out 2>err || fail=1
+-grep '^QUOTING_STYLE=invalid$' out || fail=1
+-compare exp err || fail=1
+-
+ Exit $fail
diff --git a/meta/recipes-core/coreutils/coreutils_9.12.bb b/meta/recipes-core/coreutils/coreutils_9.12.bb
index bdad62c455c..6686021341e 100644
--- a/meta/recipes-core/coreutils/coreutils_9.12.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.12.bb
@@ -14,6 +14,7 @@ DEPENDS:class-native = ""
 inherit autotools gettext texinfo
 
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
+           file://782a1e5bc2090212273bb731dceee2cc2a071e54.patch \
            file://remove-usr-local-lib-from-m4.patch \
            file://run-ptest \
            "

