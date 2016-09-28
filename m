Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8AE9B6E650
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 06:22:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8S6MQv4012940
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 23:22:26 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 27 Sep 2016 23:22:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Sep 2016 23:22:24 -0700
Message-ID: <1ffa505be8ae2274b7d143ab7c6a6137f316b3cf.1475043600.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1475043600.git.liezhi.yang@windriver.com>
References: <cover.1475043600.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pseudo: add prefix for log and make log consistent
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
X-List-Received-Date: Wed, 28 Sep 2016 06:22:25 -0000
Content-Type: text/plain

The log messages might not be consistent when the same error happens,
part of the log messages go to terminial, and part of them go to
pseudo.log, and these code use multiprocesses, which makes it very hard
to understand, for example:
$ kill -9 `ps aux | grep /usr/bin/pseud | awk '{print $2}'`
$ /path/to/usr/bin/pseudo & /path/to/usr/bin/pseudo

Messages printed to terminal:
  Child process exit status 4: lock_held
Messages printed to pseudo.log:
  pseudo: lock already held by existing pid 34028.
  pseudo: Couldn't obtain lock: Resource temporarily unavailable.

They are messages for one error, so that they should be consistent, this
patch fixes the problem, they will go into pseudo.log now.

This patch also adds log prefix "pseudo: " for the message to show where
they are from.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...er.c-add-prefix-for-log-and-make-log-cons.patch | 83 ++++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.8.1.bb       |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo_server.c-add-prefix-for-log-and-make-log-cons.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-pseudo_server.c-add-prefix-for-log-and-make-log-cons.patch b/meta/recipes-devtools/pseudo/files/0001-pseudo_server.c-add-prefix-for-log-and-make-log-cons.patch
new file mode 100644
index 0000000..e9cf3ba
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-pseudo_server.c-add-prefix-for-log-and-make-log-cons.patch
@@ -0,0 +1,83 @@
+From 505ea70ff63da3645243a7f3e4359432b11c3dd9 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 27 Sep 2016 19:39:03 -0700
+Subject: [PATCH] pseudo_server.c: add prefix for log and make log consistent
+
+The log messages might not be consistent when the same error happens,
+part of the log messages go to terminial, and part of them go to
+pseudo.log, and these code use multiprocesses, which makes it very hard
+to understand, for example:
+$ kill -9 `ps aux | grep /usr/bin/pseud | awk '{print $2}'`
+$ /path/to/usr/bin/pseudo & /path/to/usr/bin/pseudo
+
+Messages printed to terminal:
+  Child process exit status 4: lock_held
+Messages printed to pseudo.log:
+  pseudo: lock already held by existing pid 34028.
+  pseudo: Couldn't obtain lock: Resource temporarily unavailable.
+
+They are messages for one error, so that they should be consistent, this
+patch fixes the problem, they will go into pseudo.log now.
+
+This patch also adds log prefix "pseudo: " for the message to show where
+they are from.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ pseudo_server.c | 9 ++++++---
+ pseudo_util.c   | 3 +++
+ 2 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/pseudo_server.c b/pseudo_server.c
+index 8731d20..31e7b0a 100644
+--- a/pseudo_server.c
++++ b/pseudo_server.c
+@@ -168,6 +168,12 @@ pseudo_server_start(int daemonize) {
+ 				strerror(errno));
+ 			exit(PSEUDO_EXIT_FORK_FAILED);
+ 		}
++
++		/* log messages will go into pseudo.log from here */
++		fclose(stdin);
++		fclose(stdout);
++		pseudo_debug_logfile(PSEUDO_LOGFILE, 2);
++
+ 		if (child) {
+ 			int status;
+ 			int rc;
+@@ -229,9 +235,6 @@ pseudo_server_start(int daemonize) {
+ 		} else {
+ 			/* detach from parent session */
+ 			setsid();
+-			fclose(stdin);
+-			fclose(stdout);
+-			pseudo_debug_logfile(PSEUDO_LOGFILE, 2);
+ 			/* and then just execute the server code normally.  */
+ 			/* Any logging will presumably go to logfile, but
+ 			 * exit status will make it back to the parent for
+diff --git a/pseudo_util.c b/pseudo_util.c
+index 0c156cf..3948c93 100644
+--- a/pseudo_util.c
++++ b/pseudo_util.c
+@@ -494,6 +494,8 @@ pseudo_diag(char *fmt, ...) {
+ 	va_list ap;
+ 	char debuff[8192];
+ 	int len;
++	/* log prefix */
++	char *pseudo_log_prefix = "pseudo: ";
+ 	/* gcc on Ubuntu 8.10 requires that you examine the return from
+ 	 * write(), and won't let you cast it to void.  Of course, if you
+ 	 * can't print error messages, there's nothing to do.
+@@ -507,6 +509,7 @@ pseudo_diag(char *fmt, ...) {
+ 	if (len > 8192)
+ 		len = 8192;
+ 
++	wrote += write(pseudo_util_debug_fd, pseudo_log_prefix, strlen(pseudo_log_prefix));
+ 	if (debugged_newline && (pseudo_util_debug_flags & PDBGF_PID)) {
+ 		wrote += write(pseudo_util_debug_fd, pid_text, pid_len);
+ 	}
+-- 
+2.9.0
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
index cec2149..fa614cd 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz
            file://moreretries.patch \
            file://Fix-xattr-performance.patch \
            file://0001-Don-t-send-SIGUSR1-to-init.patch \
+           file://0001-pseudo_server.c-add-prefix-for-log-and-make-log-cons.patch \
            "
 
 SRC_URI[md5sum] = "ee38e4fb62ff88ad067b1a5a3825bac7"
-- 
2.9.0


