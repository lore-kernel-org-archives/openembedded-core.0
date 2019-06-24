Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 73DF37E4FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:54:29 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id p10so6368743pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 20:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TGwZ6GAe99JPiwHAsKGVpNIRFoL7pbqXenq0IBFO1Ew=;
	b=GlPuJAQUAGvzrHMeAtaxNSYx/ZC/IyF0LQdIUEPk8s9chlhMDFNt28+ys7nB94t5bB
	q5VZwIrQml+EQHnP7QAv6yb+c/oYDZWcXBhS1JiShyCaNyG3dcd5/NpTGf0sbCqBiupN
	+0j9H6l39ygkkotLbdXwx0AsO42djlrlFe7ST3s2UgPRd55brNnjNBL/ts8A7L/XXlIp
	dIxOaJozBDv3I4WgoN1QDYmz4UzgnSCOqqOSmOFSZSgoRzT5GMxBYyLT3ASFWWMjaB0M
	+7fyTcUgImDxxkMP0zmyAijM1JComArInVvHVUInwhSCJOfDmZy+PZtHluOKdDQOAkPi
	1S6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TGwZ6GAe99JPiwHAsKGVpNIRFoL7pbqXenq0IBFO1Ew=;
	b=HJ+lT442YSYQIapz7ZDWqiCWVqQCuDR4zimL0g1/OzL5e1/jN030VJda4ZfUpI9Ojw
	696kFZevj3y934uo3DlrLbC3b4Ho79phYNxnJeSsqmmREubbcpxoz6NC/GqtdWoIQ80I
	zydjt1ryNd+Y8JyoQKDudp0Sa2mF2tHkK2wbqOVVU0oetBtd50Y4Fm66t5+JRtlk1kBs
	OosJM0//LuFr8pdLWbvfFK1nA4ZFx+lnUl9dlBu7DGstsf4NK/bi1B+pGb4VMOgx3F+p
	2jx7GcuMpw71tad51oeSOlHuq7wtXO5GwkbGEG6tSu7cZATPe4aRS5qfbxB4jVt/U9gy
	d8nA==
X-Gm-Message-State: APjAAAWE+zu1Idoy0Z0T00KuqggupM0vcb3Bj9gNHzaPT9tK5d4uNlvq
	ntWamNl5ONWC+Lb7XE6KEjF2vdBd9Vs=
X-Google-Smtp-Source: APXvYqwzpZ5+zsHZpibkd4HN9zvGNpEKYapuyNYupTadl3K0SaDrY3vCQh0QDfj9ObUWFyOXNCcG+Q==
X-Received: by 2002:a65:45c1:: with SMTP id m1mr7761512pgr.260.1561348470197; 
	Sun, 23 Jun 2019 20:54:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:202:4180:c33:4917:1686:82c6:892f])
	by smtp.gmail.com with ESMTPSA id
	w132sm9837202pfd.78.2019.06.23.20.54.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jun 2019 20:54:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2019 20:54:07 -0700
Message-Id: <2855c23dcb7401022d15e9954af13bfe2f64969e.1561348290.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561348290.git.akuster808@gmail.com>
References: <cover.1561348290.git.akuster808@gmail.com>
Subject: [Warrior][ 08/19] ptest-runner: enable child procs as session leader
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Jun 2019 03:54:29 -0000

From: Randy MacLeod <Randy.MacLeod@windriver.com>

When running the run-execscript bash ptest as a user rather than root, a warning:
  bash: cannot set terminal process group (16036): Inappropriate ioctl for device
  bash: no job control in this shell
contaminates the bash log files causing the test to fail. This happens only
when run under ptest-runner and not when interactively testing!

The changes made to fix this include:
1. Get the process group id (pgid) before forking,
2. Set the pgid in both the parent and child to avoid a race,
3. Find, open and set permission on the child tty, and
4. Allow the child to attach to controlling tty.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-utils-ensure-child-can-be-session-leader.patch | 212 +++++++++++++++++++++
 .../ptest-runner/ptest-runner_2.3.1.bb             |   4 +-
 2 files changed, 215 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/ptest-runner/ptest-runner/0004-utils-ensure-child-can-be-session-leader.patch

diff --git a/meta/recipes-support/ptest-runner/ptest-runner/0004-utils-ensure-child-can-be-session-leader.patch b/meta/recipes-support/ptest-runner/ptest-runner/0004-utils-ensure-child-can-be-session-leader.patch
new file mode 100644
index 0000000..13b4cbc
--- /dev/null
+++ b/meta/recipes-support/ptest-runner/ptest-runner/0004-utils-ensure-child-can-be-session-leader.patch
@@ -0,0 +1,212 @@
+From 79698d3205dedba887e0d2492de945d3079de029 Mon Sep 17 00:00:00 2001
+From: Randy MacLeod <Randy.MacLeod@windriver.com>
+Date: Thu, 6 Jun 2019 17:03:50 -0400
+Subject: [PATCH] utils: ensure child can be session leader
+
+When running the run-execscript bash ptest as a user rather than root, a warning:
+  bash: cannot set terminal process group (16036): Inappropriate ioctl for device
+  bash: no job control in this shell
+contaminates the bash log files causing the test to fail. This happens only
+when run under ptest-runner and not when interactively testing!
+
+The changes made to fix this include:
+1. Get the process group id (pgid) before forking,
+2. Set the pgid in both the parent and child to avoid a race,
+3. Find, open and set permission on the child tty, and
+4. Allow the child to attach to controlling tty.
+
+Also add '-lutil' to Makefile. This lib is from libc and provides openpty.
+
+Upstream-Status: Submitted [yocto@yoctoproject.org]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+---
+ Makefile |   2 +-
+ utils.c  | 102 +++++++++++++++++++++++++++++++++++++++++++++++++------
+ 2 files changed, 92 insertions(+), 12 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 1bde7be..439eb79 100644
+--- a/Makefile
++++ b/Makefile
+@@ -29,7 +29,7 @@ TEST_DATA=$(shell echo `pwd`/tests/data)
+ all: $(SOURCES) $(EXECUTABLE)
+ 
+ $(EXECUTABLE): $(OBJECTS)
+-	$(CC) $(LDFLAGS) $(OBJECTS) -o $@
++	$(CC) $(LDFLAGS) $(OBJECTS) -lutil -o $@
+ 
+ tests: $(TEST_SOURCES) $(TEST_EXECUTABLE)
+ 
+diff --git a/utils.c b/utils.c
+index ad737c2..f11ce39 100644
+--- a/utils.c
++++ b/utils.c
+@@ -1,5 +1,6 @@
+ /**
+  * Copyright (c) 2016 Intel Corporation
++ * Copyright (C) 2019 Wind River Systems, Inc.
+  *
+  * This program is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU General Public License
+@@ -22,23 +23,27 @@
+  */
+ 
+ #define _GNU_SOURCE 
++
+ #include <stdio.h>
+ 
++#include <dirent.h>
++#include <errno.h>
++#include <fcntl.h>
++#include <grp.h>
+ #include <libgen.h>
+-#include <signal.h>
+ #include <poll.h>
+-#include <fcntl.h>
++#include <pty.h>
++#include <signal.h>
++#include <stdlib.h>
++#include <string.h>
+ #include <time.h>
+-#include <dirent.h>
++#include <unistd.h>
++
++#include <sys/ioctl.h>
+ #include <sys/resource.h>
++#include <sys/stat.h>
+ #include <sys/types.h>
+ #include <sys/wait.h>
+-#include <sys/stat.h>
+-#include <unistd.h>
+-#include <string.h>
+-#include <stdlib.h>
+-
+-#include <errno.h>
+ 
+ #include "ptest_list.h"
+ #include "utils.h"
+@@ -346,6 +351,53 @@ wait_child(const char *ptest_dir, const char *run_ptest, pid_t pid,
+ 	return status;
+ }
+ 
++/* Returns an integer file descriptor.
++ * If it returns < 0, an error has occurred.
++ * Otherwise, it has returned the slave pty file descriptor.
++ * fp should be writable, likely stdout/err.
++ */
++static int
++setup_slave_pty(FILE *fp) { 
++	int pty_master = -1;
++	int pty_slave = -1;
++	char pty_name[256];
++	struct group *gptr;
++	gid_t gid;
++	int slave = -1;
++
++	if (openpty(&pty_master, &pty_slave, pty_name, NULL, NULL) < 0) {
++		fprintf(fp, "ERROR: openpty() failed with: %s.\n", strerror(errno));
++		return -1;
++	}
++
++	if ((gptr = getgrnam(pty_name)) != 0) {
++		gid = gptr->gr_gid;
++	} else {
++		/* If the tty group does not exist, don't change the
++		 * group on the slave pty, only the owner
++		 */
++		gid = -1;
++	}
++
++	/* chown/chmod the corresponding pty, if possible.
++	 * This will only work if the process has root permissions.
++	 */
++	if (chown(pty_name, getuid(), gid) != 0) {
++		fprintf(fp, "ERROR; chown() failed with: %s.\n", strerror(errno));
++	}
++
++	/* Makes the slave read/writeable for the user. */
++	if (chmod(pty_name, S_IRUSR|S_IWUSR) != 0) {
++		fprintf(fp, "ERROR: chmod() failed with: %s.\n", strerror(errno));
++	}
++
++	if ((slave = open(pty_name, O_RDWR)) == -1) {
++		fprintf(fp, "ERROR: open() failed with: %s.\n", strerror(errno));
++	}
++	return (slave);
++}
++
++
+ int
+ run_ptests(struct ptest_list *head, const struct ptest_options opts,
+ 		const char *progname, FILE *fp, FILE *fp_stderr)
+@@ -362,6 +414,8 @@ run_ptests(struct ptest_list *head, const struct ptest_options opts,
+ 	int timeouted;
+ 	time_t sttime, entime;
+ 	int duration;
++	int slave;
++	int pgid = -1;
+ 
+ 	if (opts.xml_filename) {
+ 		xh = xml_create(ptest_list_length(head), opts.xml_filename);
+@@ -379,7 +433,6 @@ run_ptests(struct ptest_list *head, const struct ptest_options opts,
+ 			close(pipefd_stdout[1]);
+ 			break;
+ 		}
+-
+ 		fprintf(fp, "START: %s\n", progname);
+ 		PTEST_LIST_ITERATE_START(head, p);
+ 			char *ptest_dir = strdup(p->run_ptest);
+@@ -388,6 +441,13 @@ run_ptests(struct ptest_list *head, const struct ptest_options opts,
+ 				break;
+ 			}
+ 			dirname(ptest_dir);
++			if (ioctl(0, TIOCNOTTY) == -1) {
++				fprintf(fp, "ERROR: Unable to detach from controlling tty, %s\n", strerror(errno));
++			}
++
++			if ((pgid = getpgid(0)) == -1) {
++				fprintf(fp, "ERROR: getpgid() failed, %s\n", strerror(errno));
++			}
+ 
+ 			child = fork();
+ 			if (child == -1) {
+@@ -395,13 +455,33 @@ run_ptests(struct ptest_list *head, const struct ptest_options opts,
+ 				rc = -1;
+ 				break;
+ 			} else if (child == 0) {
+-				setsid();
++				close(0);
++				if ((slave = setup_slave_pty(fp)) < 0) {
++					fprintf(fp, "ERROR: could not setup pty (%d).", slave);
++				}
++				if (setpgid(0,pgid) == -1) {
++					fprintf(fp, "ERROR: setpgid() failed, %s\n", strerror(errno));
++				}
++
++				if (setsid() ==  -1) {
++					fprintf(fp, "ERROR: setsid() failed, %s\n", strerror(errno));
++				}
++
++				if (ioctl(0, TIOCSCTTY, NULL) == -1) {
++					fprintf(fp, "ERROR: Unable to attach to controlling tty, %s\n", strerror(errno));
++				}
++
+ 				run_child(p->run_ptest, pipefd_stdout[1], pipefd_stderr[1]);
++
+ 			} else {
+ 				int status;
+ 				int fds[2]; fds[0] = pipefd_stdout[0]; fds[1] = pipefd_stderr[0];
+ 				FILE *fps[2]; fps[0] = fp; fps[1] = fp_stderr;
+ 
++				if (setpgid(child, pgid) == -1) {
++					fprintf(fp, "ERROR: setpgid() failed, %s\n", strerror(errno));
++				}
++
+ 				sttime = time(NULL);
+ 				fprintf(fp, "%s\n", get_stime(stime, GET_STIME_BUF_SIZE, sttime));
+ 				fprintf(fp, "BEGIN: %s\n", ptest_dir);
+-- 
+2.17.0
+
diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
index 0450e18..dec60fc 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
@@ -13,7 +13,9 @@ PV = "2.3.1+git${SRCPV}"
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
  file://0001-utils-Ensure-stdout-stderr-are-flushed.patch \
  file://0002-use-process-groups-when-spawning.patch \
- file://0003-utils-Ensure-pipes-are-read-after-exit.patch"
+ file://0003-utils-Ensure-pipes-are-read-after-exit.patch \
+ file://0004-utils-ensure-child-can-be-session-leader.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


