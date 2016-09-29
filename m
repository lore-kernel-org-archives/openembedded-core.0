Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E595B6FFA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 07:56:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8T7uGuW000162
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 00:56:16 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 29 Sep 2016 00:56:15 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1475128528.git.liezhi.yang@windriver.com>
	<c44a3f3eb02ab9e6482a1dc6f97511b64d4139d8.1475128528.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <15d34a42-bfe7-c8fc-b470-957872240c9c@windriver.com>
Date: Thu, 29 Sep 2016 15:56:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <c44a3f3eb02ab9e6482a1dc6f97511b64d4139d8.1475128528.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] pseudo: quiet diagnostics during startup for pseudo -d
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
X-List-Received-Date: Thu, 29 Sep 2016 07:56:17 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/29/2016 01:59 PM, Robert Yang wrote:
> When the client spawns a pseudo server, it starts out sending diagnostics
> to stderr. This can be spammy in some cases with races during startup;
> everything resolves, but we get scary-looking diagnostics. So shove
> those into a log file.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  ...t-diagnostics-during-startup-for-pseudo-d.patch | 54 ++++++++++++++
>  ...er.c-add-prefix-for-log-and-make-log-cons.patch | 83 ++++++++++++++++++++++

Sorry, added an unused patch which had made by me, removed it from the repo.

// Robert

>  .../files/0002-Use-correct-file-descriptor.patch   | 53 ++++++++++++++
>  meta/recipes-devtools/pseudo/pseudo_1.8.1.bb       |  2 +
>  4 files changed, 192 insertions(+)
>  create mode 100644 meta/recipes-devtools/pseudo/files/0001-Quiet-diagnostics-during-startup-for-pseudo-d.patch
>  create mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo_server.c-add-prefix-for-log-and-make-log-cons.patch
>  create mode 100644 meta/recipes-devtools/pseudo/files/0002-Use-correct-file-descriptor.patch
>
> diff --git a/meta/recipes-devtools/pseudo/files/0001-Quiet-diagnostics-during-startup-for-pseudo-d.patch b/meta/recipes-devtools/pseudo/files/0001-Quiet-diagnostics-during-startup-for-pseudo-d.patch
> new file mode 100644
> index 0000000..d4b9f6a
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/0001-Quiet-diagnostics-during-startup-for-pseudo-d.patch
> @@ -0,0 +1,54 @@
> +From eead8a505245a292c43f070c0e836cdfeb7bd7bd Mon Sep 17 00:00:00 2001
> +From: Seebs <seebs@seebs.net>
> +Date: Wed, 28 Sep 2016 17:05:17 -0500
> +Subject: [PATCH 1/2] Quiet diagnostics during startup for pseudo -d
> +
> +When the client spawns a pseudo server, it starts out sending diagnostics
> +to stderr. This can be spammy in some cases with races during startup;
> +everything resolves, but we get scary-looking diagnostics. So shove
> +those into a log file.
> +
> +Signed-off-by: Seebs <seebs@seebs.net>
> +
> +Upstream-Status: Backport
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + ChangeLog.txt   | 5 +++++
> + pseudo_server.c | 4 +++-
> + 2 files changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/ChangeLog.txt b/ChangeLog.txt
> +index d6359ca..4cc24de 100644
> +--- a/ChangeLog.txt
> ++++ b/ChangeLog.txt
> +@@ -1,3 +1,8 @@
> ++2016-09-28:
> ++	* (seebs) Send errors to log when daemonizing, but do that a lot
> ++	  sooner to prevent startup messages which can show up spuriously
> ++	  with multiple clients.
> ++
> + 2016-07-28:
> + 	* (seebs) Fix performance issue on deletion with xattr changes.
> +
> +diff --git a/pseudo_server.c b/pseudo_server.c
> +index 8731d20..7c2db2f 100644
> +--- a/pseudo_server.c
> ++++ b/pseudo_server.c
> +@@ -162,6 +162,9 @@ pseudo_server_start(int daemonize) {
> + 	 * SIGUSR1, or until too much time has passed. */
> + 	if (daemonize) {
> + 		int child;
> ++
> ++		/* make startup messages go away when invoked-as-daemon */
> ++		pseudo_debug_logfile(PSEUDO_LOGFILE, 2);
> + 		child = fork();
> + 		if (child == -1) {
> + 			pseudo_diag("Couldn't fork child process: %s\n",
> +@@ -231,7 +234,6 @@ pseudo_server_start(int daemonize) {
> + 			setsid();
> + 			fclose(stdin);
> + 			fclose(stdout);
> +-			pseudo_debug_logfile(PSEUDO_LOGFILE, 2);
> + 			/* and then just execute the server code normally.  */
> + 			/* Any logging will presumably go to logfile, but
> + 			 * exit status will make it back to the parent for
> diff --git a/meta/recipes-devtools/pseudo/files/0001-pseudo_server.c-add-prefix-for-log-and-make-log-cons.patch b/meta/recipes-devtools/pseudo/files/0001-pseudo_server.c-add-prefix-for-log-and-make-log-cons.patch
> new file mode 100644
> index 0000000..e9cf3ba
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/0001-pseudo_server.c-add-prefix-for-log-and-make-log-cons.patch
> @@ -0,0 +1,83 @@
> +From 505ea70ff63da3645243a7f3e4359432b11c3dd9 Mon Sep 17 00:00:00 2001
> +From: Robert Yang <liezhi.yang@windriver.com>
> +Date: Tue, 27 Sep 2016 19:39:03 -0700
> +Subject: [PATCH] pseudo_server.c: add prefix for log and make log consistent
> +
> +The log messages might not be consistent when the same error happens,
> +part of the log messages go to terminial, and part of them go to
> +pseudo.log, and these code use multiprocesses, which makes it very hard
> +to understand, for example:
> +$ kill -9 `ps aux | grep /usr/bin/pseud | awk '{print $2}'`
> +$ /path/to/usr/bin/pseudo & /path/to/usr/bin/pseudo
> +
> +Messages printed to terminal:
> +  Child process exit status 4: lock_held
> +Messages printed to pseudo.log:
> +  pseudo: lock already held by existing pid 34028.
> +  pseudo: Couldn't obtain lock: Resource temporarily unavailable.
> +
> +They are messages for one error, so that they should be consistent, this
> +patch fixes the problem, they will go into pseudo.log now.
> +
> +This patch also adds log prefix "pseudo: " for the message to show where
> +they are from.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + pseudo_server.c | 9 ++++++---
> + pseudo_util.c   | 3 +++
> + 2 files changed, 9 insertions(+), 3 deletions(-)
> +
> +diff --git a/pseudo_server.c b/pseudo_server.c
> +index 8731d20..31e7b0a 100644
> +--- a/pseudo_server.c
> ++++ b/pseudo_server.c
> +@@ -168,6 +168,12 @@ pseudo_server_start(int daemonize) {
> + 				strerror(errno));
> + 			exit(PSEUDO_EXIT_FORK_FAILED);
> + 		}
> ++
> ++		/* log messages will go into pseudo.log from here */
> ++		fclose(stdin);
> ++		fclose(stdout);
> ++		pseudo_debug_logfile(PSEUDO_LOGFILE, 2);
> ++
> + 		if (child) {
> + 			int status;
> + 			int rc;
> +@@ -229,9 +235,6 @@ pseudo_server_start(int daemonize) {
> + 		} else {
> + 			/* detach from parent session */
> + 			setsid();
> +-			fclose(stdin);
> +-			fclose(stdout);
> +-			pseudo_debug_logfile(PSEUDO_LOGFILE, 2);
> + 			/* and then just execute the server code normally.  */
> + 			/* Any logging will presumably go to logfile, but
> + 			 * exit status will make it back to the parent for
> +diff --git a/pseudo_util.c b/pseudo_util.c
> +index 0c156cf..3948c93 100644
> +--- a/pseudo_util.c
> ++++ b/pseudo_util.c
> +@@ -494,6 +494,8 @@ pseudo_diag(char *fmt, ...) {
> + 	va_list ap;
> + 	char debuff[8192];
> + 	int len;
> ++	/* log prefix */
> ++	char *pseudo_log_prefix = "pseudo: ";
> + 	/* gcc on Ubuntu 8.10 requires that you examine the return from
> + 	 * write(), and won't let you cast it to void.  Of course, if you
> + 	 * can't print error messages, there's nothing to do.
> +@@ -507,6 +509,7 @@ pseudo_diag(char *fmt, ...) {
> + 	if (len > 8192)
> + 		len = 8192;
> +
> ++	wrote += write(pseudo_util_debug_fd, pseudo_log_prefix, strlen(pseudo_log_prefix));
> + 	if (debugged_newline && (pseudo_util_debug_flags & PDBGF_PID)) {
> + 		wrote += write(pseudo_util_debug_fd, pid_text, pid_len);
> + 	}
> +--
> +2.9.0
> +
> diff --git a/meta/recipes-devtools/pseudo/files/0002-Use-correct-file-descriptor.patch b/meta/recipes-devtools/pseudo/files/0002-Use-correct-file-descriptor.patch
> new file mode 100644
> index 0000000..dd6fd87
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/0002-Use-correct-file-descriptor.patch
> @@ -0,0 +1,53 @@
> +From 7a0632cad851826d804db0540d9a59773e6bf29c Mon Sep 17 00:00:00 2001
> +From: Seebs <seebs@seebs.net>
> +Date: Wed, 28 Sep 2016 22:12:29 -0500
> +Subject: [PATCH 2/2] Use correct file descriptor
> +
> +So it turns out that pseudo_logfile() was returning 0 or -1, and
> +pseudo_debug_logfile() was expecting it to be the correct file descriptor
> +to use. And it's basically a mystery that any of that ever worked.
> +
> +Signed-off-by: Seebs <seebs@seebs.net>
> +
> +Upstream-Status: Backport
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + ChangeLog.txt | 3 +++
> + pseudo_util.c | 3 ++-
> + 2 files changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/ChangeLog.txt b/ChangeLog.txt
> +index 4cc24de..49a6c36 100644
> +--- a/ChangeLog.txt
> ++++ b/ChangeLog.txt
> +@@ -2,6 +2,9 @@
> + 	* (seebs) Send errors to log when daemonizing, but do that a lot
> + 	  sooner to prevent startup messages which can show up spuriously
> + 	  with multiple clients.
> ++	* (seebs) return file descriptor from pseudo_logfile, so we set
> ++	  pseudo_util_debug_fd to the right value instead of to stdin.
> ++	  Nice bug.
> +
> + 2016-07-28:
> + 	* (seebs) Fix performance issue on deletion with xattr changes.
> +diff --git a/pseudo_util.c b/pseudo_util.c
> +index 0c156cf..a60c74b 100644
> +--- a/pseudo_util.c
> ++++ b/pseudo_util.c
> +@@ -1569,7 +1569,7 @@ pseudo_logfile(char *filename, char *defname, int prefer_fd) {
> + 	if (fd == -1)
> + 		return -1;
> + 	else
> +-		return 0;
> ++		return fd;
> + }
> +
> + int
> +@@ -1579,6 +1579,7 @@ pseudo_debug_logfile(char *defname, int prefer_fd) {
> +
> + 	fd = pseudo_logfile(filename, defname, prefer_fd);
> + 	if (fd > -1) {
> ++		pseudo_diag("debug_logfile: fd %d\n", fd);
> + 		pseudo_util_debug_fd = fd;
> + 		return 0;
> + 	}
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
> index cec2149..67eb298 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
> @@ -7,6 +7,8 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz
>             file://moreretries.patch \
>             file://Fix-xattr-performance.patch \
>             file://0001-Don-t-send-SIGUSR1-to-init.patch \
> +           file://0001-Quiet-diagnostics-during-startup-for-pseudo-d.patch \
> +           file://0002-Use-correct-file-descriptor.patch \
>             "
>
>  SRC_URI[md5sum] = "ee38e4fb62ff88ad067b1a5a3825bac7"
>

