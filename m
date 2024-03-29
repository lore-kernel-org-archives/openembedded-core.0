Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95688CD1283
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 16:17:56 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.412.1711729067031855502
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Mar 2024 09:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b248UToR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4149746f80aso14590685e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 09:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1711729065; x=1712333865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QfMpQ2YQ+12wyZbCebk5QYTyt5xwX2awFXoOgUjdKQ4=;
        b=b248UToR8vtYUAtevEUb9Vq3TugNNVAIw0iuOM5mkt+C+3vYJnCoF9hbCvuDSd7yoa
         j/QfvuvumDu/baUEpd+1JRkzDryqNSEFZ/U61KXOX8rvM8i26Yk7UtcDKzYuemEWNA/s
         +keNiJ5IfQYdPv3+99DktJV/zFrcwj80tgjYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711729065; x=1712333865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfMpQ2YQ+12wyZbCebk5QYTyt5xwX2awFXoOgUjdKQ4=;
        b=F28dvPzBttfdcT9kkrlEMcv7ZNypVUo1cw2Iv58g1GaxNNRKLGg8JYP6FX/s3uonhG
         Ajcv6RsETFZWtgKCuZH3EeL9c3015cVVhYFngWqYAXoWeiglmnWKgk678tqaMUozGzN+
         IpqnJeFfH6LwcfvbPfX2EIeAYNPeOmaWrKKDrbpcSiHaoBd/Xfmz5HuuHyFuSmp+g1Xn
         Vh4I1lGrEiccjXJiJO0Ws8OM5K6PoUcukAoBb1lsaUAlRN+XN105BSZIEmdOToD05IIy
         WKPjZXHafxt3neVk05V22WRpbWNj6qFhb9aNHKcuYxMGP/jxlgXCa86LBBoxlQq4wB+9
         RjAA==
X-Gm-Message-State: AOJu0Yzw25Y63mDZ/F9hb3De1Mw4vdseGM7dZkfSKixY8gzonrAA2xww
	wgTJbVHlhk7it73jmKBOdySNZ0hOLjmbORPe7qeg2UzeCtCLoSjuB5lKwrhLhbXBKYUoFhfaz66
	+
X-Google-Smtp-Source: AGHT+IGVXQQSMvQaNrPSu5s3C4ftL7vFD8Uw22LhIetA16hBk4xXJoOIVjdQ4lrZONXQk71mI6v9Yg==
X-Received: by 2002:a05:600c:5105:b0:414:8ab1:9bcb with SMTP id o5-20020a05600c510500b004148ab19bcbmr2056269wms.5.1711729064843;
        Fri, 29 Mar 2024 09:17:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fdd:6f2d:e3d5:9b0e])
        by smtp.gmail.com with ESMTPSA id g16-20020a05600c311000b004148670f9ecsm5954702wmo.23.2024.03.29.09.17.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 09:17:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] util-linux: Add fcntl-lock
Date: Fri, 29 Mar 2024 16:17:41 +0000
Message-Id: <20240329161742.910250-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240329161742.910250-1-richard.purdie@linuxfoundation.org>
References: <20240329161742.910250-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 16:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197641

Add a version of flock that uses the fnctl based lockf locking instead of
flock based locks. This allows us to take the same lock that opkg would
use from a shell script. The two different locking mechanisms operate
independently of each other.

Inserting this C file into the util-linux build seems like the easiest/best
place to insert the code. At this point it hasn't been discussed with upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../util-linux/util-linux/fcntl-lock.c        | 332 ++++++++++++++++++
 .../util-linux/util-linux_2.39.3.bb           |   7 +
 3 files changed, 340 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/fcntl-lock.c

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index d96f00fbab5..f4b547215e8 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -38,6 +38,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
            file://0001-login-utils-include-libgen.h-for-basename-API.patch \
+           file://fcntl-lock.c \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/fcntl-lock.c b/meta/recipes-core/util-linux/util-linux/fcntl-lock.c
new file mode 100644
index 00000000000..966d8c5ecb6
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/fcntl-lock.c
@@ -0,0 +1,332 @@
+// From https://github.com/magnumripper/fcntl-lock
+// SPDX-License-Identifier: MIT
+/* ----------------------------------------------------------------------- *
+ *
+ *   Copyright 2003-2005 H. Peter Anvin - All Rights Reserved
+ *   Copyright 2015 magnum (fcntl version)
+ *
+ *   Permission is hereby granted, free of charge, to any person
+ *   obtaining a copy of this software and associated documentation
+ *   files (the "Software"), to deal in the Software without
+ *   restriction, including without limitation the rights to use,
+ *   copy, modify, merge, publish, distribute, sublicense, and/or
+ *   sell copies of the Software, and to permit persons to whom
+ *   the Software is furnished to do so, subject to the following
+ *   conditions:
+ *
+ *   The above copyright notice and this permission notice shall
+ *   be included in all copies or substantial portions of the Software.
+ *
+ *   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *   OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *   NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *   HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *   WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *   FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *   OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * ----------------------------------------------------------------------- */
+
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <getopt.h>
+#include <signal.h>
+#include <ctype.h>
+#include <string.h>
+#include <paths.h>
+#include <sysexits.h>
+#include <sys/types.h>
+#include <sys/file.h>
+#include <sys/time.h>
+#include <sys/wait.h>
+
+#define PACKAGE_STRING "magnum"
+#define _(x) (x)
+
+static const struct option long_options[] = {
+  { "shared",       0, NULL, 's' },
+  { "exclusive",    0, NULL, 'x' },
+  { "unlock",       0, NULL, 'u' },
+  { "nonblocking",  0, NULL, 'n' },
+  { "nb",           0, NULL, 'n' },
+  { "timeout",      1, NULL, 'w' },
+  { "wait",         1, NULL, 'w' },
+  { "close",        0, NULL, 'o' },
+  { "help",         0, NULL, 'h' },
+  { "version",      0, NULL, 'V' },
+  { 0, 0, 0, 0 }
+};
+
+const char *program;
+
+static void usage(int ex)
+{
+  fputs("fcntl-lock (" PACKAGE_STRING ")\n", stderr);
+  fprintf(stderr,
+	_("Usage: %1$s [-sxun][-w #] fd#\n"
+	  "       %1$s [-sxon][-w #] file [-c] command...\n"
+	  "       %1$s [-sxon][-w #] directory [-c] command...\n"
+	  "  -s  --shared     Get a shared lock\n"
+	  "  -x  --exclusive  Get an exclusive lock\n"
+	  "  -u  --unlock     Remove a lock\n"
+	  "  -n  --nonblock   Fail rather than wait\n"
+	  "  -w  --timeout    Wait for a limited amount of time\n"
+	  "  -o  --close      Close file descriptor before running command\n"
+	  "  -c  --command    Run a single command string through the shell\n"
+	  "  -h  --help       Display this text\n"
+	  "  -V  --version    Display version\n"),
+	  program);
+  exit(ex);
+}
+
+
+static sig_atomic_t timeout_expired = 0;
+
+static void timeout_handler(int sig)
+{
+  (void)sig;
+
+  timeout_expired = 1;
+}
+
+
+static char * strtotimeval(const char *str, struct timeval *tv)
+{
+  char *s;
+  long fs;			/* Fractional seconds */
+  int i;
+
+  tv->tv_sec = strtol(str, &s, 10);
+  fs = 0;
+
+  if ( *s == '.' ) {
+    s++;
+
+    for ( i = 0 ; i < 6 ; i++ ) {
+      if ( !isdigit(*s) )
+	break;
+
+      fs *= 10;
+      fs += *s++ - '0';
+    }
+
+    for ( ; i < 6; i++ )
+      fs *= 10;
+
+    while ( isdigit(*s) )
+      s++;
+  }
+
+  tv->tv_usec = fs;
+  return s;
+}
+
+int main(int argc, char *argv[])
+{
+  struct itimerval timeout, old_timer;
+  int have_timeout = 0;
+  int type = F_WRLCK;
+  int block = F_SETLKW;
+  int fd = -1;
+  int opt, ix;
+  int do_close = 0;
+  int err;
+  int status;
+  char *eon;
+  char **cmd_argv = NULL, *sh_c_argv[4];
+  struct flock lock;
+  const char *filename = NULL;
+  struct sigaction sa, old_sa;
+
+  program = argv[0];
+
+  if ( argc < 2 )
+    usage(EX_USAGE);
+
+  memset(&timeout, 0, sizeof timeout);
+
+  optopt = 0;
+  while ( (opt = getopt_long(argc, argv, "+sexnouw:hV?", long_options, &ix)) != EOF ) {
+    switch(opt) {
+    case 's':
+      type = F_RDLCK;
+      break;
+    case 'e':
+    case 'x':
+      type = F_WRLCK;
+      break;
+    case 'u':
+      type = F_UNLCK;
+      break;
+    case 'o':
+      do_close = 1;
+      break;
+    case 'n':
+      block = F_SETLK;
+      break;
+    case 'w':
+      have_timeout = 1;
+      eon = strtotimeval(optarg, &timeout.it_value);
+      if ( *eon )
+	usage(EX_USAGE);
+      break;
+    case 'V':
+      printf("fcntl-lock (%s)\n", PACKAGE_STRING);
+      exit(0);
+    default:
+      /* optopt will be set if this was an unrecognized option, i.e. *not* 'h' or '?' */
+      usage(optopt ? EX_USAGE : 0);
+      break;
+    }
+  }
+
+  if ( argc > optind+1 ) {
+    /* Run command */
+
+    if ( !strcmp(argv[optind+1], "-c") ||
+	 !strcmp(argv[optind+1], "--command") ) {
+
+      if ( argc != optind+3 ) {
+	fprintf(stderr, _("%s: %s requires exactly one command argument\n"),
+		program, argv[optind+1]);
+	exit(EX_USAGE);
+      }
+
+      cmd_argv = sh_c_argv;
+
+      cmd_argv[0] = getenv("SHELL");
+      if ( !cmd_argv[0] || !*cmd_argv[0] )
+	cmd_argv[0] = _PATH_BSHELL;
+
+      cmd_argv[1] = "-c";
+      cmd_argv[2] = argv[optind+2];
+      cmd_argv[3] = 0;
+    } else {
+      cmd_argv = &argv[optind+1];
+    }
+
+    filename = argv[optind];
+    fd = open(filename, O_RDWR|O_NOCTTY|O_CREAT, 0666);
+    /* Linux doesn't like O_CREAT on a directory, even though it should be a
+       no-op */
+    if (fd < 0 && errno == EISDIR)
+        fd = open(filename, O_RDONLY|O_NOCTTY);
+
+    if ( fd < 0 ) {
+      err = errno;
+      fprintf(stderr, _("%s: cannot open lock file %s: %s\n"),
+	      program, argv[optind], strerror(err));
+      exit((err == ENOMEM||err == EMFILE||err == ENFILE) ? EX_OSERR :
+	   (err == EROFS||err == ENOSPC) ? EX_CANTCREAT :
+	   EX_NOINPUT);
+    }
+
+  } else if (optind < argc) {
+    /* Use provided file descriptor */
+
+    fd = (int)strtol(argv[optind], &eon, 10);
+    if ( *eon || !argv[optind] ) {
+      fprintf(stderr, _("%s: bad number: %s\n"), program, argv[optind]);
+      exit(EX_USAGE);
+    }
+
+  } else {
+    /* Bad options */
+
+    fprintf(stderr, _("%s: requires file descriptor, file or directory\n"),
+		program);
+    exit(EX_USAGE);
+  }
+
+
+  if ( have_timeout ) {
+    if ( timeout.it_value.tv_sec == 0 &&
+	 timeout.it_value.tv_usec == 0 ) {
+      /* -w 0 is equivalent to -n; this has to be special-cased
+	 because setting an itimer to zero means disabled! */
+
+      have_timeout = 0;
+      block = F_SETLK;
+    } else {
+      memset(&sa, 0, sizeof sa);
+
+      sa.sa_handler = timeout_handler;
+      sa.sa_flags   = SA_RESETHAND;
+      sigaction(SIGALRM, &sa, &old_sa);
+
+      setitimer(ITIMER_REAL, &timeout, &old_timer);
+    }
+  }
+
+  memset(&lock, 0, sizeof(lock));
+  lock.l_type = type;
+  while ( fcntl(fd, block, &lock) ) {
+    switch( (err = errno) ) {
+    case EAGAIN:		/* -n option set and failed to lock */
+    case EACCES:		/* -n option set and failed to lock */
+      exit(1);
+    case EINTR:			/* Signal received */
+      if ( timeout_expired )
+	exit(1);		/* -w option set and failed to lock */
+      continue;			/* otherwise try again */
+    default:			/* Other errors */
+      if ( filename )
+	fprintf(stderr, "%s: %s: %s\n", program, filename, strerror(err));
+      else
+	fprintf(stderr, "%s: %d: %s\n", program, fd, strerror(err));
+      exit((err == ENOLCK||err == ENOMEM) ? EX_OSERR : EX_DATAERR);
+    }
+  }
+
+  if ( have_timeout ) {
+    setitimer(ITIMER_REAL, &old_timer, NULL); /* Cancel itimer */
+    sigaction(SIGALRM, &old_sa, NULL); /* Cancel signal handler */
+  }
+
+  status = 0;
+
+  if ( cmd_argv ) {
+    pid_t w, f;
+
+    /* Clear any inherited settings */
+    signal(SIGCHLD, SIG_DFL);
+    f = fork();
+
+    if ( f < 0 ) {
+      err = errno;
+      fprintf(stderr, _("%s: fork failed: %s\n"), program, strerror(err));
+      exit(EX_OSERR);
+    } else if ( f == 0 ) {
+      if ( do_close )
+	close(fd);
+      err = errno;
+      execvp(cmd_argv[0], cmd_argv);
+      /* execvp() failed */
+      fprintf(stderr, "%s: %s: %s\n", program, cmd_argv[0], strerror(err));
+      _exit((err == ENOMEM) ? EX_OSERR: EX_UNAVAILABLE);
+    } else {
+      do {
+	w = waitpid(f, &status, 0);
+	if (w == -1 && errno != EINTR)
+	  break;
+      } while ( w != f );
+
+      if (w == -1) {
+	err = errno;
+	status = EXIT_FAILURE;
+	fprintf(stderr, "%s: waitpid failed: %s\n", program, strerror(err));
+      } else if ( WIFEXITED(status) )
+	status = WEXITSTATUS(status);
+      else if ( WIFSIGNALED(status) )
+	status = WTERMSIG(status) + 128;
+      else
+	status = EX_OSERR;	/* WTF? */
+    }
+  }
+
+  return status;
+}
diff --git a/meta/recipes-core/util-linux/util-linux_2.39.3.bb b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
index 3e87dcc2c2c..83b3f4e05b3 100644
--- a/meta/recipes-core/util-linux/util-linux_2.39.3.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
@@ -147,6 +147,11 @@ SYSTEMD_AUTO_ENABLE:${PN}-uuidd = "disable"
 SYSTEMD_SERVICE:${PN}-fstrim = "fstrim.timer fstrim.service"
 SYSTEMD_AUTO_ENABLE:${PN}-fstrim = "disable"
 
+do_compile:append () {
+	cp ${WORKDIR}/fcntl-lock.c ${S}/fcntl-lock.c
+	${CC} ${CFLAGS} ${LDFLAGS} ${S}/fcntl-lock.c -o ${B}/fcntl-lock
+}
+
 do_install () {
 	# with ccache the timestamps on compiled files may
 	# end up earlier than on their inputs, this allows
@@ -182,6 +187,8 @@ do_install () {
 	echo 'MOUNTALL="-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/default/mountall
 
 	rm -f ${D}${bindir}/chkdupexe
+
+	install -m 0755 ${B}/fcntl-lock ${D}${bindir}
 }
 
 do_install:append:class-target () {
-- 
2.40.1


