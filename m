Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF23C3F6B0
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 03:30:15 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.11503.1660620613907395542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 20:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QWTnT+vm;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id 130so8011670pfy.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 20:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=8ZIM7jBKLSUoxuhilUvdfiqkKQBVfrVnTEPtSOw0gyU=;
        b=QWTnT+vm0On/yDieHnvKtTQFP+Sal876YNewp3EybVY3sSGdOsjkv+p13+cPUjKsoQ
         defW13bczH7ERmiCFRWAO0V61dx4MC0s9wy+LvjhVsQDiOmu3/LfOyJF+fB0od5FqKjC
         xkH/Tm9I5A7QGVm9p6WlFSm2bUjF2BBuX5KGGgvISiyjHVCjZKD0cFXqbl2Hq3dTlI8O
         SAeJLQDy6xVVD7syGA2z1Am1F3rUl6BX20awSYvLFct2tCs46D5ZAb3jdgAvs21E28XF
         uL+19HHxowG2cBLGjNgXVNcQE8i1KXv4FOMZXYN3JAuE4V415mDZAggRMjd2b/Qq/Yx6
         /WTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=8ZIM7jBKLSUoxuhilUvdfiqkKQBVfrVnTEPtSOw0gyU=;
        b=WPMm39yQTwuxSCP8izxoykqEU9ZqysO0yQmpqyWtiug1kA5hFI9u4rgWHp8EDTNsgq
         NbabaeLOBH1xwG7hLE2WdW7AMqXjTbgXQQ36DYjglK8BmTkEWG5Aexw+0KrzAJuiTE/X
         eAF7xV0FV+wNWR9faBK0yM/Pr3BDsxCZP0yebKQxqiruyJShD0HwS10ydkbOiLXETDUC
         SN1EYVsBWjxS/l7A9MszrfqPS1fi5pqBCJd5RUMu3gSMV2C2yNm4lj8E+SIm+mzRSk1S
         2ckY5TunwUPvJ5psIxf1yMQqINpAHxcsBMSi58HbIj5Hl2ZAj+WpeTgNaEwEwGn2bLgJ
         WcyA==
X-Gm-Message-State: ACgBeo28Wq8Jmdiih/s6CJ7mk+HytdDOcnheL3j8E+T9NbB0rQ79RDtc
	vur4ooZ+W6/EMfyb6sdF/aFcHM7X0jqVcA==
X-Google-Smtp-Source: 
 AA6agR7yK6AWTrm10tt2lyH2p6oBYq8sE+oRm8QrOsDRLcz42CcBAtTwfBYv2IPJU1OosiDzie805A==
X-Received: by 2002:a63:68c2:0:b0:421:9e8f:35c4 with SMTP id
 d185-20020a6368c2000000b004219e8f35c4mr16184496pgc.363.1660620612803;
        Mon, 15 Aug 2022 20:30:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 b190-20020a621bc7000000b0052d87b76d12sm7218807pfb.68.2022.08.15.20.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 20:30:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/6] expect: Fix implicit-function-declaration warnings
Date: Mon, 15 Aug 2022 20:30:03 -0700
Message-Id: <20220816033005.2700801-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816033005.2700801-1-raj.khem@gmail.com>
References: <20220816033005.2700801-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 03:30:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169418

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...dd-prototype-to-function-definitions.patch | 113 ++++++++++++++++++
 meta/recipes-devtools/expect/expect_5.45.4.bb |   3 +-
 2 files changed, 115 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/expect/expect/0001-Add-prototype-to-function-definitions.patch

diff --git a/meta/recipes-devtools/expect/expect/0001-Add-prototype-to-function-definitions.patch b/meta/recipes-devtools/expect/expect/0001-Add-prototype-to-function-definitions.patch
new file mode 100644
index 00000000000..7d211b3dff6
--- /dev/null
+++ b/meta/recipes-devtools/expect/expect/0001-Add-prototype-to-function-definitions.patch
@@ -0,0 +1,113 @@
+From 904c7cf6647594939ce1e398468bca3c885f0622 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 15 Aug 2022 18:25:23 -0700
+Subject: [PATCH] Add prototype to function definitions
+
+Compilers like clang has started erroring out on implicit-function-declaration
+therefore arrange the relevant include files where needed.
+
+Upstream-Status: Submitted [https://sourceforge.net/p/expect/patches/24/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ exp_chan.c     | 5 +++--
+ exp_clib.c     | 4 +++-
+ exp_main_sub.c | 5 +++++
+ pty_termios.c  | 4 ++++
+ 4 files changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/exp_chan.c b/exp_chan.c
+index 79f486c..50375d3 100644
+--- a/exp_chan.c
++++ b/exp_chan.c
+@@ -35,6 +35,7 @@
+ #include "exp_prog.h"
+ #include "exp_command.h"
+ #include "exp_log.h"
++#include "exp_event.h" /* exp_background_channelhandler */
+ #include "tcldbg.h" /* Dbg_StdinMode */
+ 
+ extern int		expSetBlockModeProc _ANSI_ARGS_((int fd, int mode));
+@@ -631,7 +632,7 @@ expWaitOnOne() {
+ }
+ 
+ void
+-exp_background_channelhandlers_run_all()
++exp_background_channelhandlers_run_all(void)
+ {
+     ThreadSpecificData *tsdPtr = TCL_TSD_INIT(&dataKey);
+     ExpState *esPtr;
+@@ -760,7 +761,7 @@ expCreateChannel(interp,fdin,fdout,pid)
+ }
+ 
+ void
+-expChannelInit() {
++expChannelInit(void) {
+     ThreadSpecificData *tsdPtr = TCL_TSD_INIT(&dataKey);
+ 
+     tsdPtr->channelCount = 0;
+diff --git a/exp_clib.c b/exp_clib.c
+index b21fb5d..8f31fc3 100644
+--- a/exp_clib.c
++++ b/exp_clib.c
+@@ -9,13 +9,14 @@ would appreciate credit if this program or parts of it are used.
+ 
+ #include "expect_cf.h"
+ #include <stdio.h>
++#include <unistd.h>
+ #include <setjmp.h>
+ #ifdef HAVE_INTTYPES_H
+ #  include <inttypes.h>
+ #endif
+ #include <sys/types.h>
+ #include <sys/ioctl.h>
+-
++#include <sys/wait.h>
+ #ifdef TIME_WITH_SYS_TIME
+ # include <sys/time.h>
+ # include <time.h>
+@@ -1738,6 +1739,7 @@ int exp_getptyslave();
+ #define sysreturn(x)	return(errno = x, -1)
+ 
+ void exp_init_pty();
++void exp_init_tty();
+ 
+ /*
+    The following functions are linked from the Tcl library.  They
+diff --git a/exp_main_sub.c b/exp_main_sub.c
+index bf6c4be..f53b89e 100644
+--- a/exp_main_sub.c
++++ b/exp_main_sub.c
+@@ -61,6 +61,11 @@ int exp_cmdlinecmds = FALSE;
+ int exp_interactive =  FALSE;
+ int exp_buffer_command_input = FALSE;/* read in entire cmdfile at once */
+ int exp_fgets();
++int exp_tty_cooked_echo(
++    Tcl_Interp *interp,
++    exp_tty *tty_old,
++    int *was_raw,
++    int *was_echo);
+ 
+ Tcl_Interp *exp_interp;	/* for use by signal handlers who can't figure out */
+ 			/* the interpreter directly */
+diff --git a/pty_termios.c b/pty_termios.c
+index c605b23..80ed5e7 100644
+--- a/pty_termios.c
++++ b/pty_termios.c
+@@ -7,6 +7,7 @@ would appreciate credit if you use this file or parts of it.
+ 
+ */
+ 
++#include <pty.h> /* openpty */
+ #include <stdio.h>
+ #include <signal.h>
+ 
+@@ -15,6 +16,9 @@ would appreciate credit if you use this file or parts of it.
+ #endif
+ 
+ #include "expect_cf.h"
++#include "tclInt.h"
++
++extern char * expErrnoMsg    _ANSI_ARGS_((int));
+ 
+ /*
+    The following functions are linked from the Tcl library.  They
diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index e22fa140d52..6cb46f334cf 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -26,7 +26,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
            file://0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch \
            file://0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch \
            file://0001-fixline1-fix-line-1.patch \
-          "
+           file://0001-Add-prototype-to-function-definitions.patch \
+           "
 SRC_URI[md5sum] = "00fce8de158422f5ccd2666512329bd2"
 SRC_URI[sha256sum] = "49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c4781f89caf760b92c34"
 
-- 
2.37.2


