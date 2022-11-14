Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC988C43217
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 19:01:26 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.756.1668452477705667751
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 11:01:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HCbbgb7D;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5so8151531wmo.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 11:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvb9UTQZNYjJLmiodshYO9I4tUlJAFFVAplMK4KsC/Y=;
        b=HCbbgb7DuogAKAl3wG02sPY0FpNW7eA7hIjCQlg/Ay7sfcIdm9V5lRvaIWwtTtz7AG
         bBgC6Lei7wCiqO2HlFG/0toc28qQdeq7JQzVt0XxkWQeZhNCVnDSfSYcRJ8D9mwGknb4
         W85hn+qn3fL5G3oKN0e+9KdXQJqkHX/7kAqfWjaxaMaFWp2hSpnxvJ6zy2AXM4HvAqoW
         WbZQ9d+PkjsxpWG4QuciH0oT714xuhzfCQ2l+PQOVkUMXZJuoVkmcRgum81WF2mhQzLq
         jyqCvN92dKzAPxFsFejmwBpoogqM6iFdFljeI4Po04q8uCiIALNsij052UaCb9kGW6pA
         IyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvb9UTQZNYjJLmiodshYO9I4tUlJAFFVAplMK4KsC/Y=;
        b=BCzjWK4YxjY4yA5l3G1HuOcFUwS1ekfCsrmzty2gir7cnXJqgeDRYojasuXkv+rRRH
         Pbv9v3T12WOGBv0s/lO/iWL1OjObbSboZHnLhwRmg1KW9jmXu1OCiTcxKoVZ/waN/wcv
         HTwKa5BvMw1tcyBCWawEivSbZW3O70a4qSq+CkyMrLYK2/JRk90KDsPE168xWPygKu0y
         JNW5Mjxi2mp68PW9vngTtUABFhgKe/p3FJ4kf35MIJjIdhNd6HK+cQenCWRrUy6aZWTX
         +62l4pk61XMTWz/O+PBh3Svdh/vuNsq7VLgpTsoWoeMKo2PViLXLAfLKD8SYaC8CIs9U
         GGAw==
X-Gm-Message-State: ANoB5pkziYkKypacLv/qWTuO/xOuermnvPO8vP4HsUtrYPR1pswn5g1w
	rzL7lKDcBWFJXlW1Yowh+jNkyMF/AuE=
X-Google-Smtp-Source: AA0mqf4nj64j7jqeTgK+p6HSRVb0yPQtfIIBTp20K34pBrP6PDi07rrgCRZKRA//jmhhYXDSZoG22A==
X-Received: by 2002:a05:600c:ac9:b0:3cf:cab4:a42b with SMTP id c9-20020a05600c0ac900b003cfcab4a42bmr9047914wmr.36.1668452476027;
        Mon, 14 Nov 2022 11:01:16 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id c7-20020a1c3507000000b003c6f1732f65sm18091811wma.38.2022.11.14.11.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 11:01:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/8] readline: update 8.1.2 -> 8.2
Date: Mon, 14 Nov 2022 20:00:52 +0100
Message-Id: <20221114190056.2612669-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221114190056.2612669-1-alex@linutronix.de>
References: <20221114190056.2612669-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 19:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173257

Replace configure-fix.patch with --with-shared-termcap-library

Backport a compatibility fix for gdb.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/readline/readline.inc       |  2 +-
 .../readline/readline/configure-fix.patch     | 35 -----------------
 meta/recipes-core/readline/readline_8.1.2.bb  |  7 ----
 meta/recipes-core/readline/readline_8.2.bb    |  5 +++
 meta/recipes-devtools/gdb/gdb.inc             |  1 +
 .../gdb/gdb/readline-8.2.patch                | 39 +++++++++++++++++++
 6 files changed, 46 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-core/readline/readline/configure-fix.patch
 delete mode 100644 meta/recipes-core/readline/readline_8.1.2.bb
 create mode 100644 meta/recipes-core/readline/readline_8.2.bb
 create mode 100644 meta/recipes-devtools/gdb/gdb/readline-8.2.patch

diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index 7f2f1a092b..4aefc5636d 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -18,7 +18,7 @@ SRC_URI += "file://inputrc"
 inherit autotools texinfo
 
 EXTRA_AUTORECONF += "--exclude=autoheader"
-EXTRA_OECONF += "bash_cv_termcap_lib=ncurses"
+EXTRA_OECONF += "bash_cv_termcap_lib=ncurses --with-shared-termcap-library"
 
 LEAD_SONAME = "libreadline.so"
 
diff --git a/meta/recipes-core/readline/readline/configure-fix.patch b/meta/recipes-core/readline/readline/configure-fix.patch
deleted file mode 100644
index ef3104f8a6..0000000000
--- a/meta/recipes-core/readline/readline/configure-fix.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Pending
-
-Without this it fails to link against libtermcap causing various missing
-symbols issues.
-
-RP - 8/10/08
-
-Support 6.3 which uses configure.ac rather than configure.in.
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- configure.ac | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index cea8f91..9075b8f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -218,10 +218,10 @@ if test -f ${srcdir}/support/shobj-conf; then
-         AC_MSG_CHECKING(configuration for building shared libraries)
-         eval `TERMCAP_LIB=$TERMCAP_LIB ${CONFIG_SHELL-/bin/sh} ${srcdir}/support/shobj-conf -C "${CC}" -c ${host_cpu} -o ${host_os} -v ${host_vendor}`
- 
--#	case "$SHLIB_LIBS" in
--#	*curses*|*termcap*|*termlib*)	;;
--#	*)			SHLIB_LIBS="$SHLIB_LIBS $TERMCAP_LIB" ;;
--#	esac
-+	case "$SHLIB_LIBS" in
-+	*curses*|*termcap*|*termlib*)	;;
-+	*)			SHLIB_LIBS="$SHLIB_LIBS $TERMCAP_LIB" ;;
-+	esac
- 	
-         AC_SUBST(SHOBJ_CC)
-         AC_SUBST(SHOBJ_CFLAGS)
--- 
-1.8.1.2
-
diff --git a/meta/recipes-core/readline/readline_8.1.2.bb b/meta/recipes-core/readline/readline_8.1.2.bb
deleted file mode 100644
index 787f7e734a..0000000000
--- a/meta/recipes-core/readline/readline_8.1.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require readline.inc
-
-SRC_URI += "file://configure-fix.patch \
-           file://norpath.patch \
-           "
-
-SRC_URI[archive.sha256sum] = "7589a2381a8419e68654a47623ce7dfcb756815c8fee726b98f90bf668af7bc6"
diff --git a/meta/recipes-core/readline/readline_8.2.bb b/meta/recipes-core/readline/readline_8.2.bb
new file mode 100644
index 0000000000..3a47297fe1
--- /dev/null
+++ b/meta/recipes-core/readline/readline_8.2.bb
@@ -0,0 +1,5 @@
+require readline.inc
+
+SRC_URI += "  file://norpath.patch"
+
+SRC_URI[archive.sha256sum] = "3feb7171f16a84ee82ca18a36d7b9be109a52c04f492a053331d7d1095007c35"
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 3b569fd40e..5a9fe271b9 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -14,5 +14,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0007-resolve-restrict-keyword-conflict.patch \
            file://0008-Fix-invalid-sigprocmask-call.patch \
            file://0009-gdbserver-ctrl-c-handling.patch \
+           file://readline-8.2.patch \
            "
 SRC_URI[sha256sum] = "0e1793bf8f2b54d53f46dea84ccfd446f48f81b297b28c4f7fc017b818d69fed"
diff --git a/meta/recipes-devtools/gdb/gdb/readline-8.2.patch b/meta/recipes-devtools/gdb/gdb/readline-8.2.patch
new file mode 100644
index 0000000000..c2db4c0d79
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/readline-8.2.patch
@@ -0,0 +1,39 @@
+From 1add37b567a7dee39d99f37b37802034c3fce9c4 Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@linux-m68k.org>
+Date: Sun, 20 Mar 2022 14:01:54 +0100
+Subject: [PATCH] Add support for readline 8.2
+
+In readline 8.2 the type of rl_completer_word_break_characters changed to
+include const.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=1add37b567a7dee39d99f37b37802034c3fce9c4]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ gdb/completer.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gdb/completer.c b/gdb/completer.c
+index d3900ae2014..a51c16ac7f8 100644
+--- a/gdb/completer.c
++++ b/gdb/completer.c
+@@ -36,7 +36,7 @@
+    calling a hook instead so we eliminate the CLI dependency.  */
+ #include "gdbcmd.h"
+ 
+-/* Needed for rl_completer_word_break_characters() and for
++/* Needed for rl_completer_word_break_characters and for
+    rl_filename_completion_function.  */
+ #include "readline/readline.h"
+ 
+@@ -2011,7 +2011,7 @@ gdb_completion_word_break_characters_throw ()
+       rl_basic_quote_characters = NULL;
+     }
+ 
+-  return rl_completer_word_break_characters;
++  return (char *) rl_completer_word_break_characters;
+ }
+ 
+ char *
+-- 
+2.31.1
+
-- 
2.30.2


