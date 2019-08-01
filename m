Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A3F87F3E1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 20:37:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x71Kb0qp010798
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Aug 2019 13:37:10 -0700
Received: from fidler.wrs.com (128.224.56.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 1 Aug 2019 13:36:49 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Aug 2019 16:36:48 -0400
Message-ID: <20190801203648.14429-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] ptest-runner: update from 2.3.1 to 2.3.2
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
X-List-Received-Date: Thu, 01 Aug 2019 20:37:19 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

All local patches are now upstream so they have been dropped.
Other upstream commits make ptest-runner build using: clang -Weverything

$ git log --oneline b73bd54..7015e91
7015e91 (HEAD -> oe-core-master, tag: v2.3.2, origin/master, origin/HEAD, master) Fix additional warnings when using clang
dd1daa8 tests: fix clang warnings.
15fd131 main code: fix clang warnings
59381a6 utils: ensure child can be session leader
5fe2c0a utils: Ensure pipes are read after exit
79a9c27 use process groups when spawning
b73bd54 utils: Ensure stdout/stderr are flushed

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...ils-Ensure-stdout-stderr-are-flushed.patch |  45 ----
 ...002-use-process-groups-when-spawning.patch |  35 ---
 ...ils-Ensure-pipes-are-read-after-exit.patch |  76 -------
 ...s-ensure-child-can-be-session-leader.patch | 212 ------------------
 ...-runner_2.3.1.bb => ptest-runner_2.3.2.bb} |   8 +-
 5 files changed, 2 insertions(+), 374 deletions(-)
 delete mode 100644 meta/recipes-support/ptest-runner/ptest-runner/0001-utils-Ensure-stdout-stderr-are-flushed.patch
 delete mode 100644 meta/recipes-support/ptest-runner/ptest-runner/0002-use-process-groups-when-spawning.patch
 delete mode 100644 meta/recipes-support/ptest-runner/ptest-runner/0003-utils-Ensure-pipes-are-read-after-exit.patch
 delete mode 100644 meta/recipes-support/ptest-runner/ptest-runner/0004-utils-ensure-child-can-be-session-leader.patch
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.3.1.bb => ptest-runner_2.3.2.bb} (69%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner/0001-utils-Ensure-stdout-stderr-are-flushed.patch b/meta/recipes-support/ptest-runner/ptest-runner/0001-utils-Ensure-stdout-stderr-are-flushed.patch
deleted file mode 100644
index c9a9dd7cf4..0000000000
--- a/meta/recipes-support/ptest-runner/ptest-runner/0001-utils-Ensure-stdout-stderr-are-flushed.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 9b36993794c1de733c521b2477370c874c07b617 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 4 Apr 2019 14:18:55 +0100
-Subject: [PATCH 1/3] utils: Ensure stdout/stderr are flushed
-
-There is no guarantee that the data written with fwrite will be flushed to the
-buffer. If stdout and stderr are the same thing, this could lead to interleaved
-writes. The common case is stdout output so flush the output pipes when writing to
-stderr. Also flush stdout before the function returns.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending [code being tested]
----
- utils.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/utils.c b/utils.c
-index 504df0b..3ceb342 100644
---- a/utils.c
-+++ b/utils.c
-@@ -295,8 +295,11 @@ wait_child(const char *ptest_dir, const char *run_ptest, pid_t pid,
- 			}
- 
- 			if (pfds[1].revents != 0) {
--				while ((n = read(fds[1], buf, WAIT_CHILD_BUF_MAX_SIZE)) > 0)
-+				while ((n = read(fds[1], buf, WAIT_CHILD_BUF_MAX_SIZE)) > 0) {
-+					fflush(fps[0]);
- 					fwrite(buf, n, 1, fps[1]);
-+					fflush(fps[1]);
-+				}
- 			}
- 
- 			clock_gettime(clock, &sentinel);
-@@ -315,7 +318,7 @@ wait_child(const char *ptest_dir, const char *run_ptest, pid_t pid,
- 			break;
- 	}
- 
--
-+	fflush(fps[0]);
- 	return status;
- }
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-support/ptest-runner/ptest-runner/0002-use-process-groups-when-spawning.patch b/meta/recipes-support/ptest-runner/ptest-runner/0002-use-process-groups-when-spawning.patch
deleted file mode 100644
index 5436a3340c..0000000000
--- a/meta/recipes-support/ptest-runner/ptest-runner/0002-use-process-groups-when-spawning.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f0c42a65633341ad048718c7a6dbd035818e9eaf Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 4 Apr 2019 14:20:31 +0100
-Subject: [PATCH 2/3] use process groups when spawning
-
-Rather than just killing the process we've swawned, set the process group
-for spawned children and then kill the group of processes.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending [code being tested]
----
- utils.c | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/utils.c b/utils.c
-index 3ceb342..c5b3b8d 100644
---- a/utils.c
-+++ b/utils.c
-@@ -309,7 +309,7 @@ wait_child(const char *ptest_dir, const char *run_ptest, pid_t pid,
- 			clock_gettime(clock, &time);
- 			if ((time.tv_sec - sentinel.tv_sec) > timeout) {
- 				*timeouted = 1;
--				kill(pid, SIGKILL);
-+				kill(-pid, SIGKILL);
- 				waitflags = 0;
- 			}
- 		}
-@@ -371,6 +371,7 @@ run_ptests(struct ptest_list *head, const struct ptest_options opts,
- 				rc = -1;
- 				break;
- 			} else if (child == 0) {
-+				setsid();
- 				run_child(p->run_ptest, pipefd_stdout[1], pipefd_stderr[1]);
- 			} else {
- 				int status;
diff --git a/meta/recipes-support/ptest-runner/ptest-runner/0003-utils-Ensure-pipes-are-read-after-exit.patch b/meta/recipes-support/ptest-runner/ptest-runner/0003-utils-Ensure-pipes-are-read-after-exit.patch
deleted file mode 100644
index f7c3ebe6f2..0000000000
--- a/meta/recipes-support/ptest-runner/ptest-runner/0003-utils-Ensure-pipes-are-read-after-exit.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From e58e4e1a7f854953f823dc5135d35f728f253f31 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 4 Apr 2019 14:24:14 +0100
-Subject: [PATCH 3/3] utils: Ensure pipes are read after exit
-
-There was a race in the code where the pipes may not be read after the process has exited
-and data may be left behind in them. This change to ordering ensures the pipes are read
-after the exit code has been read meaning no data can be left behind and the logs should
-be complete.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending [code being tested]
----
- utils.c | 29 ++++++++++++++++-------------
- 1 file changed, 16 insertions(+), 13 deletions(-)
-
-diff --git a/utils.c b/utils.c
-index c5b3b8d..37e88ab 100644
---- a/utils.c
-+++ b/utils.c
-@@ -264,6 +264,7 @@ wait_child(const char *ptest_dir, const char *run_ptest, pid_t pid, pid_t group,
- 	struct pollfd pfds[2];
- 	struct timespec sentinel;
- 	clockid_t clock = CLOCK_MONOTONIC;
-+	int looping = 1;
- 	int r;
- 
- 	int status;
-@@ -281,9 +282,23 @@ wait_child(const char *ptest_dir, const char *run_ptest, pid_t pid, pid_t group,
- 
- 	*timeouted = 0;
- 
--	while (1) {
-+	while (looping) {
- 		waitflags = WNOHANG;
- 
-+		if (timeout >= 0) {
-+			struct timespec time;
-+
-+			clock_gettime(clock, &time);
-+			if ((time.tv_sec - sentinel.tv_sec) > timeout) {
-+				*timeouted = 1;
-+				kill(-pid, SIGKILL);
-+				waitflags = 0;
-+			}
-+		}
-+
-+		if (waitpid(pid, &status, waitflags) == pid)
-+			looping = 0;
-+
- 		r = poll(pfds, 2, WAIT_CHILD_POLL_TIMEOUT_MS);
- 		if (r > 0) {
- 			char buf[WAIT_CHILD_BUF_MAX_SIZE];
-@@ -303,19 +318,7 @@ wait_child(const char *ptest_dir, const char *run_ptest, pid_t pid, pid_t group,
- 			}
- 
- 			clock_gettime(clock, &sentinel);
--		} else if (timeout >= 0) {
--			struct timespec time;
--
--			clock_gettime(clock, &time);
--			if ((time.tv_sec - sentinel.tv_sec) > timeout) {
--				*timeouted = 1;
--				kill(-pid, SIGKILL);
--				waitflags = 0;
--			}
- 		}
--
--		if (waitpid(pid, &status, waitflags) == pid)
--			break;
- 	}
- 
- 	fflush(fps[0]);
--- 
-2.17.1
-
diff --git a/meta/recipes-support/ptest-runner/ptest-runner/0004-utils-ensure-child-can-be-session-leader.patch b/meta/recipes-support/ptest-runner/ptest-runner/0004-utils-ensure-child-can-be-session-leader.patch
deleted file mode 100644
index 13b4cbc7fb..0000000000
--- a/meta/recipes-support/ptest-runner/ptest-runner/0004-utils-ensure-child-can-be-session-leader.patch
+++ /dev/null
@@ -1,212 +0,0 @@
-From 79698d3205dedba887e0d2492de945d3079de029 Mon Sep 17 00:00:00 2001
-From: Randy MacLeod <Randy.MacLeod@windriver.com>
-Date: Thu, 6 Jun 2019 17:03:50 -0400
-Subject: [PATCH] utils: ensure child can be session leader
-
-When running the run-execscript bash ptest as a user rather than root, a warning:
-  bash: cannot set terminal process group (16036): Inappropriate ioctl for device
-  bash: no job control in this shell
-contaminates the bash log files causing the test to fail. This happens only
-when run under ptest-runner and not when interactively testing!
-
-The changes made to fix this include:
-1. Get the process group id (pgid) before forking,
-2. Set the pgid in both the parent and child to avoid a race,
-3. Find, open and set permission on the child tty, and
-4. Allow the child to attach to controlling tty.
-
-Also add '-lutil' to Makefile. This lib is from libc and provides openpty.
-
-Upstream-Status: Submitted [yocto@yoctoproject.org]
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
-Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
----
- Makefile |   2 +-
- utils.c  | 102 +++++++++++++++++++++++++++++++++++++++++++++++++------
- 2 files changed, 92 insertions(+), 12 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 1bde7be..439eb79 100644
---- a/Makefile
-+++ b/Makefile
-@@ -29,7 +29,7 @@ TEST_DATA=$(shell echo `pwd`/tests/data)
- all: $(SOURCES) $(EXECUTABLE)
- 
- $(EXECUTABLE): $(OBJECTS)
--	$(CC) $(LDFLAGS) $(OBJECTS) -o $@
-+	$(CC) $(LDFLAGS) $(OBJECTS) -lutil -o $@
- 
- tests: $(TEST_SOURCES) $(TEST_EXECUTABLE)
- 
-diff --git a/utils.c b/utils.c
-index ad737c2..f11ce39 100644
---- a/utils.c
-+++ b/utils.c
-@@ -1,5 +1,6 @@
- /**
-  * Copyright (c) 2016 Intel Corporation
-+ * Copyright (C) 2019 Wind River Systems, Inc.
-  *
-  * This program is free software; you can redistribute it and/or
-  * modify it under the terms of the GNU General Public License
-@@ -22,23 +23,27 @@
-  */
- 
- #define _GNU_SOURCE 
-+
- #include <stdio.h>
- 
-+#include <dirent.h>
-+#include <errno.h>
-+#include <fcntl.h>
-+#include <grp.h>
- #include <libgen.h>
--#include <signal.h>
- #include <poll.h>
--#include <fcntl.h>
-+#include <pty.h>
-+#include <signal.h>
-+#include <stdlib.h>
-+#include <string.h>
- #include <time.h>
--#include <dirent.h>
-+#include <unistd.h>
-+
-+#include <sys/ioctl.h>
- #include <sys/resource.h>
-+#include <sys/stat.h>
- #include <sys/types.h>
- #include <sys/wait.h>
--#include <sys/stat.h>
--#include <unistd.h>
--#include <string.h>
--#include <stdlib.h>
--
--#include <errno.h>
- 
- #include "ptest_list.h"
- #include "utils.h"
-@@ -346,6 +351,53 @@ wait_child(const char *ptest_dir, const char *run_ptest, pid_t pid,
- 	return status;
- }
- 
-+/* Returns an integer file descriptor.
-+ * If it returns < 0, an error has occurred.
-+ * Otherwise, it has returned the slave pty file descriptor.
-+ * fp should be writable, likely stdout/err.
-+ */
-+static int
-+setup_slave_pty(FILE *fp) { 
-+	int pty_master = -1;
-+	int pty_slave = -1;
-+	char pty_name[256];
-+	struct group *gptr;
-+	gid_t gid;
-+	int slave = -1;
-+
-+	if (openpty(&pty_master, &pty_slave, pty_name, NULL, NULL) < 0) {
-+		fprintf(fp, "ERROR: openpty() failed with: %s.\n", strerror(errno));
-+		return -1;
-+	}
-+
-+	if ((gptr = getgrnam(pty_name)) != 0) {
-+		gid = gptr->gr_gid;
-+	} else {
-+		/* If the tty group does not exist, don't change the
-+		 * group on the slave pty, only the owner
-+		 */
-+		gid = -1;
-+	}
-+
-+	/* chown/chmod the corresponding pty, if possible.
-+	 * This will only work if the process has root permissions.
-+	 */
-+	if (chown(pty_name, getuid(), gid) != 0) {
-+		fprintf(fp, "ERROR; chown() failed with: %s.\n", strerror(errno));
-+	}
-+
-+	/* Makes the slave read/writeable for the user. */
-+	if (chmod(pty_name, S_IRUSR|S_IWUSR) != 0) {
-+		fprintf(fp, "ERROR: chmod() failed with: %s.\n", strerror(errno));
-+	}
-+
-+	if ((slave = open(pty_name, O_RDWR)) == -1) {
-+		fprintf(fp, "ERROR: open() failed with: %s.\n", strerror(errno));
-+	}
-+	return (slave);
-+}
-+
-+
- int
- run_ptests(struct ptest_list *head, const struct ptest_options opts,
- 		const char *progname, FILE *fp, FILE *fp_stderr)
-@@ -362,6 +414,8 @@ run_ptests(struct ptest_list *head, const struct ptest_options opts,
- 	int timeouted;
- 	time_t sttime, entime;
- 	int duration;
-+	int slave;
-+	int pgid = -1;
- 
- 	if (opts.xml_filename) {
- 		xh = xml_create(ptest_list_length(head), opts.xml_filename);
-@@ -379,7 +433,6 @@ run_ptests(struct ptest_list *head, const struct ptest_options opts,
- 			close(pipefd_stdout[1]);
- 			break;
- 		}
--
- 		fprintf(fp, "START: %s\n", progname);
- 		PTEST_LIST_ITERATE_START(head, p);
- 			char *ptest_dir = strdup(p->run_ptest);
-@@ -388,6 +441,13 @@ run_ptests(struct ptest_list *head, const struct ptest_options opts,
- 				break;
- 			}
- 			dirname(ptest_dir);
-+			if (ioctl(0, TIOCNOTTY) == -1) {
-+				fprintf(fp, "ERROR: Unable to detach from controlling tty, %s\n", strerror(errno));
-+			}
-+
-+			if ((pgid = getpgid(0)) == -1) {
-+				fprintf(fp, "ERROR: getpgid() failed, %s\n", strerror(errno));
-+			}
- 
- 			child = fork();
- 			if (child == -1) {
-@@ -395,13 +455,33 @@ run_ptests(struct ptest_list *head, const struct ptest_options opts,
- 				rc = -1;
- 				break;
- 			} else if (child == 0) {
--				setsid();
-+				close(0);
-+				if ((slave = setup_slave_pty(fp)) < 0) {
-+					fprintf(fp, "ERROR: could not setup pty (%d).", slave);
-+				}
-+				if (setpgid(0,pgid) == -1) {
-+					fprintf(fp, "ERROR: setpgid() failed, %s\n", strerror(errno));
-+				}
-+
-+				if (setsid() ==  -1) {
-+					fprintf(fp, "ERROR: setsid() failed, %s\n", strerror(errno));
-+				}
-+
-+				if (ioctl(0, TIOCSCTTY, NULL) == -1) {
-+					fprintf(fp, "ERROR: Unable to attach to controlling tty, %s\n", strerror(errno));
-+				}
-+
- 				run_child(p->run_ptest, pipefd_stdout[1], pipefd_stderr[1]);
-+
- 			} else {
- 				int status;
- 				int fds[2]; fds[0] = pipefd_stdout[0]; fds[1] = pipefd_stderr[0];
- 				FILE *fps[2]; fps[0] = fp; fps[1] = fp_stderr;
- 
-+				if (setpgid(child, pgid) == -1) {
-+					fprintf(fp, "ERROR: setpgid() failed, %s\n", strerror(errno));
-+				}
-+
- 				sttime = time(NULL);
- 				fprintf(fp, "%s\n", get_stime(stime, GET_STIME_BUF_SIZE, sttime));
- 				fprintf(fp, "BEGIN: %s\n", ptest_dir);
--- 
-2.17.0
-
diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb
similarity index 69%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb
index dec60fcc9b..187f22df04 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb
@@ -7,14 +7,10 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "63d097cc46142157931682fed076b5407757a0bd"
-PV = "2.3.1+git${SRCPV}"
+SRCREV = "7015e9199ce748c0717addeebe7a8c47448bab03"
+PV = "2.3.2+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
- file://0001-utils-Ensure-stdout-stderr-are-flushed.patch \
- file://0002-use-process-groups-when-spawning.patch \
- file://0003-utils-Ensure-pipes-are-read-after-exit.patch \
- file://0004-utils-ensure-child-can-be-session-leader.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.22.0


