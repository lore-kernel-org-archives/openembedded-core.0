Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 55BF97DA91
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 06:26:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Apr 2019 23:26:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,408,1549958400"; d="scan'208";a="146681155"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.129])
	by fmsmga007.fm.intel.com with ESMTP; 28 Apr 2019 23:26:42 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2019 14:26:36 +0800
Message-Id: <20190429062636.2338-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190429062636.2338-1-anuj.mittal@intel.com>
References: <20190429062636.2338-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] openssh: fix CVE-2018-20685, CVE-2019-6109, CVE-2019-6111
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
X-List-Received-Date: Mon, 29 Apr 2019 06:26:42 -0000
Content-Transfer-Encoding: 8bit

Also backport a patch to fix issues introduced by fix for CVE-2019-6109.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ogressmeter-force-an-update-at-the-b.patch | 121 ++++++++
 .../openssh/openssh/CVE-2018-20685.patch      |  40 +++
 .../openssh/openssh/CVE-2019-6109.patch       | 275 ++++++++++++++++++
 .../openssh/openssh/CVE-2019-6111.patch       | 187 ++++++++++++
 .../openssh/openssh_7.9p1.bb                  |   4 +
 5 files changed, 627 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-upstream-Have-progressmeter-force-an-update-at-the-b.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2018-20685.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2019-6109.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2019-6111.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-upstream-Have-progressmeter-force-an-update-at-the-b.patch b/meta/recipes-connectivity/openssh/openssh/0001-upstream-Have-progressmeter-force-an-update-at-the-b.patch
new file mode 100644
index 0000000000..2fb57da635
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-upstream-Have-progressmeter-force-an-update-at-the-b.patch
@@ -0,0 +1,121 @@
+From 5df934e2279e8ed1f07b990f4b2b3baf6470f7e5 Mon Sep 17 00:00:00 2001
+From: "dtucker@openbsd.org" <dtucker@openbsd.org>
+Date: Thu, 24 Jan 2019 16:52:17 +0000
+Subject: [PATCH] upstream: Have progressmeter force an update at the beginning
+ and
+
+end of each transfer.  Fixes the problem recently introduces where very quick
+transfers do not display the progressmeter at all.  Spotted by naddy@
+
+OpenBSD-Commit-ID: 68dc46c259e8fdd4f5db3ec2a130f8e4590a7a9a
+Ustream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ progressmeter.c | 13 +++++--------
+ progressmeter.h |  4 ++--
+ scp.c           |  2 +-
+ sftp-client.c   |  2 +-
+ 4 files changed, 9 insertions(+), 12 deletions(-)
+
+diff --git a/progressmeter.c b/progressmeter.c
+index add462d..e385c12 100644
+--- a/progressmeter.c
++++ b/progressmeter.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: progressmeter.c,v 1.46 2019/01/23 08:01:46 dtucker Exp $ */
++/* $OpenBSD: progressmeter.c,v 1.47 2019/01/24 16:52:17 dtucker Exp $ */
+ /*
+  * Copyright (c) 2003 Nils Nordman.  All rights reserved.
+  *
+@@ -59,9 +59,6 @@ static void format_rate(char *, int, off_t);
+ static void sig_winch(int);
+ static void setscreensize(void);
+ 
+-/* updates the progressmeter to reflect the current state of the transfer */
+-void refresh_progress_meter(void);
+-
+ /* signal handler for updating the progress meter */
+ static void sig_alarm(int);
+ 
+@@ -120,7 +117,7 @@ format_size(char *buf, int size, off_t bytes)
+ }
+ 
+ void
+-refresh_progress_meter(void)
++refresh_progress_meter(int force_update)
+ {
+ 	char buf[MAX_WINSIZE + 1];
+ 	off_t transferred;
+@@ -131,7 +128,7 @@ refresh_progress_meter(void)
+ 	int hours, minutes, seconds;
+ 	int file_len;
+ 
+-	if ((!alarm_fired && !win_resized) || !can_output())
++	if ((!force_update && !alarm_fired && !win_resized) || !can_output())
+ 		return;
+ 	alarm_fired = 0;
+ 
+@@ -254,7 +251,7 @@ start_progress_meter(const char *f, off_t filesize, off_t *ctr)
+ 	bytes_per_second = 0;
+ 
+ 	setscreensize();
+-	refresh_progress_meter();
++	refresh_progress_meter(1);
+ 
+ 	signal(SIGALRM, sig_alarm);
+ 	signal(SIGWINCH, sig_winch);
+@@ -271,7 +268,7 @@ stop_progress_meter(void)
+ 
+ 	/* Ensure we complete the progress */
+ 	if (cur_pos != end_pos)
+-		refresh_progress_meter();
++		refresh_progress_meter(1);
+ 
+ 	atomicio(vwrite, STDOUT_FILENO, "\n", 1);
+ }
+diff --git a/progressmeter.h b/progressmeter.h
+index 8f66780..1703ea7 100644
+--- a/progressmeter.h
++++ b/progressmeter.h
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: progressmeter.h,v 1.4 2019/01/23 08:01:46 dtucker Exp $ */
++/* $OpenBSD: progressmeter.h,v 1.5 2019/01/24 16:52:17 dtucker Exp $ */
+ /*
+  * Copyright (c) 2002 Nils Nordman.  All rights reserved.
+  *
+@@ -24,5 +24,5 @@
+  */
+ 
+ void	start_progress_meter(const char *, off_t, off_t *);
+-void	refresh_progress_meter(void);
++void	refresh_progress_meter(int);
+ void	stop_progress_meter(void);
+diff --git a/scp.c b/scp.c
+index 4a342a6..0587cec 100644
+--- a/scp.c
++++ b/scp.c
+@@ -585,7 +585,7 @@ scpio(void *_cnt, size_t s)
+ 	off_t *cnt = (off_t *)_cnt;
+ 
+ 	*cnt += s;
+-	refresh_progress_meter();
++	refresh_progress_meter(0);
+ 	if (limit_kbps > 0)
+ 		bandwidth_limit(&bwlimit, s);
+ 	return 0;
+diff --git a/sftp-client.c b/sftp-client.c
+index 2bc698f..cf2887a 100644
+--- a/sftp-client.c
++++ b/sftp-client.c
+@@ -101,7 +101,7 @@ sftpio(void *_bwlimit, size_t amount)
+ {
+ 	struct bwlimit *bwlimit = (struct bwlimit *)_bwlimit;
+ 
+-	refresh_progress_meter();
++	refresh_progress_meter(0);
+ 	if (bwlimit != NULL)
+ 		bandwidth_limit(bwlimit, amount);
+ 	return 0;
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2018-20685.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2018-20685.patch
new file mode 100644
index 0000000000..e2fc607ff8
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2018-20685.patch
@@ -0,0 +1,40 @@
+From 6010c0303a422a9c5fa8860c061bf7105eb7f8b2 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Fri, 16 Nov 2018 03:03:10 +0000
+Subject: [PATCH] upstream: disallow empty incoming filename or ones that refer
+ to the
+
+current directory; based on report/patch from Harry Sintonen
+
+OpenBSD-Commit-ID: f27651b30eaee2df49540ab68d030865c04f6de9
+
+CVE: CVE-2018-20685
+Ustream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ scp.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/scp.c b/scp.c
+index 60682c6..4f3fdcd 100644
+--- a/scp.c
++++ b/scp.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: scp.c,v 1.197 2018/06/01 04:31:48 dtucker Exp $ */
++/* $OpenBSD: scp.c,v 1.198 2018/11/16 03:03:10 djm Exp $ */
+ /*
+  * scp - secure remote copy.  This is basically patched BSD rcp which
+  * uses ssh to do the data transfer (instead of using rcmd).
+@@ -1106,7 +1106,8 @@ sink(int argc, char **argv)
+ 			SCREWUP("size out of range");
+ 		size = (off_t)ull;
+ 
+-		if ((strchr(cp, '/') != NULL) || (strcmp(cp, "..") == 0)) {
++		if (*cp == '\0' || strchr(cp, '/') != NULL ||
++		    strcmp(cp, ".") == 0 || strcmp(cp, "..") == 0) {
+ 			run_err("error: unexpected filename: %s", cp);
+ 			exit(1);
+ 		}
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2019-6109.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2019-6109.patch
new file mode 100644
index 0000000000..dabe4a6c97
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2019-6109.patch
@@ -0,0 +1,275 @@
+From 15d47c3bd8551521240bc459fc004c280daef817 Mon Sep 17 00:00:00 2001
+From: "dtucker@openbsd.org" <dtucker@openbsd.org>
+Date: Wed, 23 Jan 2019 08:01:46 +0000
+Subject: [PATCH] upstream: Sanitize scp filenames via snmprintf. To do this we
+ move
+
+the progressmeter formatting outside of signal handler context and have the
+atomicio callback called for EINTR too.  bz#2434 with contributions from djm
+and jjelen at redhat.com, ok djm@
+
+OpenBSD-Commit-ID: 1af61c1f70e4f3bd8ab140b9f1fa699481db57d8
+CVE: CVE-2019-6109
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ atomicio.c      | 20 +++++++++++++++-----
+ progressmeter.c | 53 ++++++++++++++++++++++++-----------------------------
+ progressmeter.h |  3 ++-
+ scp.c           |  1 +
+ sftp-client.c   | 16 +++++++++-------
+ 5 files changed, 51 insertions(+), 42 deletions(-)
+
+diff --git a/atomicio.c b/atomicio.c
+index f854a06..d91bd76 100644
+--- a/atomicio.c
++++ b/atomicio.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: atomicio.c,v 1.28 2016/07/27 23:18:12 djm Exp $ */
++/* $OpenBSD: atomicio.c,v 1.29 2019/01/23 08:01:46 dtucker Exp $ */
+ /*
+  * Copyright (c) 2006 Damien Miller. All rights reserved.
+  * Copyright (c) 2005 Anil Madhavapeddy. All rights reserved.
+@@ -65,9 +65,14 @@ atomicio6(ssize_t (*f) (int, void *, size_t), int fd, void *_s, size_t n,
+ 		res = (f) (fd, s + pos, n - pos);
+ 		switch (res) {
+ 		case -1:
+-			if (errno == EINTR)
++			if (errno == EINTR) {
++				/* possible SIGALARM, update callback */
++				if (cb != NULL && cb(cb_arg, 0) == -1) {
++					errno = EINTR;
++					return pos;
++				}
+ 				continue;
+-			if (errno == EAGAIN || errno == EWOULDBLOCK) {
++			} else if (errno == EAGAIN || errno == EWOULDBLOCK) {
+ #ifndef BROKEN_READ_COMPARISON
+ 				(void)poll(&pfd, 1, -1);
+ #endif
+@@ -122,9 +127,14 @@ atomiciov6(ssize_t (*f) (int, const struct iovec *, int), int fd,
+ 		res = (f) (fd, iov, iovcnt);
+ 		switch (res) {
+ 		case -1:
+-			if (errno == EINTR)
++			if (errno == EINTR) {
++				/* possible SIGALARM, update callback */
++				if (cb != NULL && cb(cb_arg, 0) == -1) {
++					errno = EINTR;
++					return pos;
++				}
+ 				continue;
+-			if (errno == EAGAIN || errno == EWOULDBLOCK) {
++			} else if (errno == EAGAIN || errno == EWOULDBLOCK) {
+ #ifndef BROKEN_READV_COMPARISON
+ 				(void)poll(&pfd, 1, -1);
+ #endif
+diff --git a/progressmeter.c b/progressmeter.c
+index fe9bf52..add462d 100644
+--- a/progressmeter.c
++++ b/progressmeter.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: progressmeter.c,v 1.45 2016/06/30 05:17:05 dtucker Exp $ */
++/* $OpenBSD: progressmeter.c,v 1.46 2019/01/23 08:01:46 dtucker Exp $ */
+ /*
+  * Copyright (c) 2003 Nils Nordman.  All rights reserved.
+  *
+@@ -31,6 +31,7 @@
+ 
+ #include <errno.h>
+ #include <signal.h>
++#include <stdarg.h>
+ #include <stdio.h>
+ #include <string.h>
+ #include <time.h>
+@@ -39,6 +40,7 @@
+ #include "progressmeter.h"
+ #include "atomicio.h"
+ #include "misc.h"
++#include "utf8.h"
+ 
+ #define DEFAULT_WINSIZE 80
+ #define MAX_WINSIZE 512
+@@ -61,7 +63,7 @@ static void setscreensize(void);
+ void refresh_progress_meter(void);
+ 
+ /* signal handler for updating the progress meter */
+-static void update_progress_meter(int);
++static void sig_alarm(int);
+ 
+ static double start;		/* start progress */
+ static double last_update;	/* last progress update */
+@@ -74,6 +76,7 @@ static long stalled;		/* how long we have been stalled */
+ static int bytes_per_second;	/* current speed in bytes per second */
+ static int win_size;		/* terminal window size */
+ static volatile sig_atomic_t win_resized; /* for window resizing */
++static volatile sig_atomic_t alarm_fired;
+ 
+ /* units for format_size */
+ static const char unit[] = " KMGT";
+@@ -126,9 +129,17 @@ refresh_progress_meter(void)
+ 	off_t bytes_left;
+ 	int cur_speed;
+ 	int hours, minutes, seconds;
+-	int i, len;
+ 	int file_len;
+ 
++	if ((!alarm_fired && !win_resized) || !can_output())
++		return;
++	alarm_fired = 0;
++
++	if (win_resized) {
++		setscreensize();
++		win_resized = 0;
++	}
++
+ 	transferred = *counter - (cur_pos ? cur_pos : start_pos);
+ 	cur_pos = *counter;
+ 	now = monotime_double();
+@@ -158,16 +169,11 @@ refresh_progress_meter(void)
+ 
+ 	/* filename */
+ 	buf[0] = '\0';
+-	file_len = win_size - 35;
++	file_len = win_size - 36;
+ 	if (file_len > 0) {
+-		len = snprintf(buf, file_len + 1, "\r%s", file);
+-		if (len < 0)
+-			len = 0;
+-		if (len >= file_len + 1)
+-			len = file_len;
+-		for (i = len; i < file_len; i++)
+-			buf[i] = ' ';
+-		buf[file_len] = '\0';
++		buf[0] = '\r';
++		snmprintf(buf+1, sizeof(buf)-1 , &file_len, "%*s",
++		    file_len * -1, file);
+ 	}
+ 
+ 	/* percent of transfer done */
+@@ -228,22 +234,11 @@ refresh_progress_meter(void)
+ 
+ /*ARGSUSED*/
+ static void
+-update_progress_meter(int ignore)
++sig_alarm(int ignore)
+ {
+-	int save_errno;
+-
+-	save_errno = errno;
+-
+-	if (win_resized) {
+-		setscreensize();
+-		win_resized = 0;
+-	}
+-	if (can_output())
+-		refresh_progress_meter();
+-
+-	signal(SIGALRM, update_progress_meter);
++	signal(SIGALRM, sig_alarm);
++	alarm_fired = 1;
+ 	alarm(UPDATE_INTERVAL);
+-	errno = save_errno;
+ }
+ 
+ void
+@@ -259,10 +254,9 @@ start_progress_meter(const char *f, off_t filesize, off_t *ctr)
+ 	bytes_per_second = 0;
+ 
+ 	setscreensize();
+-	if (can_output())
+-		refresh_progress_meter();
++	refresh_progress_meter();
+ 
+-	signal(SIGALRM, update_progress_meter);
++	signal(SIGALRM, sig_alarm);
+ 	signal(SIGWINCH, sig_winch);
+ 	alarm(UPDATE_INTERVAL);
+ }
+@@ -286,6 +280,7 @@ stop_progress_meter(void)
+ static void
+ sig_winch(int sig)
+ {
++	signal(SIGWINCH, sig_winch);
+ 	win_resized = 1;
+ }
+ 
+diff --git a/progressmeter.h b/progressmeter.h
+index bf179dc..8f66780 100644
+--- a/progressmeter.h
++++ b/progressmeter.h
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: progressmeter.h,v 1.3 2015/01/14 13:54:13 djm Exp $ */
++/* $OpenBSD: progressmeter.h,v 1.4 2019/01/23 08:01:46 dtucker Exp $ */
+ /*
+  * Copyright (c) 2002 Nils Nordman.  All rights reserved.
+  *
+@@ -24,4 +24,5 @@
+  */
+ 
+ void	start_progress_meter(const char *, off_t, off_t *);
++void	refresh_progress_meter(void);
+ void	stop_progress_meter(void);
+diff --git a/scp.c b/scp.c
+index 4f3fdcd..4a342a6 100644
+--- a/scp.c
++++ b/scp.c
+@@ -585,6 +585,7 @@ scpio(void *_cnt, size_t s)
+ 	off_t *cnt = (off_t *)_cnt;
+ 
+ 	*cnt += s;
++	refresh_progress_meter();
+ 	if (limit_kbps > 0)
+ 		bandwidth_limit(&bwlimit, s);
+ 	return 0;
+diff --git a/sftp-client.c b/sftp-client.c
+index 4986d6d..2bc698f 100644
+--- a/sftp-client.c
++++ b/sftp-client.c
+@@ -101,7 +101,9 @@ sftpio(void *_bwlimit, size_t amount)
+ {
+ 	struct bwlimit *bwlimit = (struct bwlimit *)_bwlimit;
+ 
+-	bandwidth_limit(bwlimit, amount);
++	refresh_progress_meter();
++	if (bwlimit != NULL)
++		bandwidth_limit(bwlimit, amount);
+ 	return 0;
+ }
+ 
+@@ -121,8 +123,8 @@ send_msg(struct sftp_conn *conn, struct sshbuf *m)
+ 	iov[1].iov_base = (u_char *)sshbuf_ptr(m);
+ 	iov[1].iov_len = sshbuf_len(m);
+ 
+-	if (atomiciov6(writev, conn->fd_out, iov, 2,
+-	    conn->limit_kbps > 0 ? sftpio : NULL, &conn->bwlimit_out) !=
++	if (atomiciov6(writev, conn->fd_out, iov, 2, sftpio,
++	    conn->limit_kbps > 0 ? &conn->bwlimit_out : NULL) !=
+ 	    sshbuf_len(m) + sizeof(mlen))
+ 		fatal("Couldn't send packet: %s", strerror(errno));
+ 
+@@ -138,8 +140,8 @@ get_msg_extended(struct sftp_conn *conn, struct sshbuf *m, int initial)
+ 
+ 	if ((r = sshbuf_reserve(m, 4, &p)) != 0)
+ 		fatal("%s: buffer error: %s", __func__, ssh_err(r));
+-	if (atomicio6(read, conn->fd_in, p, 4,
+-	    conn->limit_kbps > 0 ? sftpio : NULL, &conn->bwlimit_in) != 4) {
++	if (atomicio6(read, conn->fd_in, p, 4, sftpio,
++	    conn->limit_kbps > 0 ? &conn->bwlimit_in : NULL) != 4) {
+ 		if (errno == EPIPE || errno == ECONNRESET)
+ 			fatal("Connection closed");
+ 		else
+@@ -157,8 +159,8 @@ get_msg_extended(struct sftp_conn *conn, struct sshbuf *m, int initial)
+ 
+ 	if ((r = sshbuf_reserve(m, msg_len, &p)) != 0)
+ 		fatal("%s: buffer error: %s", __func__, ssh_err(r));
+-	if (atomicio6(read, conn->fd_in, p, msg_len,
+-	    conn->limit_kbps > 0 ? sftpio : NULL, &conn->bwlimit_in)
++	if (atomicio6(read, conn->fd_in, p, msg_len, sftpio,
++	    conn->limit_kbps > 0 ? &conn->bwlimit_in : NULL)
+ 	    != msg_len) {
+ 		if (errno == EPIPE)
+ 			fatal("Connection closed");
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2019-6111.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2019-6111.patch
new file mode 100644
index 0000000000..80cf39b923
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2019-6111.patch
@@ -0,0 +1,187 @@
+From 15cc3497367d2e9729353b3df75518548e845c82 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Sat, 26 Jan 2019 22:41:28 +0000
+Subject: [PATCH] upstream: check in scp client that filenames sent during
+
+remote->local directory copies satisfy the wildcard specified by the user.
+
+This checking provides some protection against a malicious server
+sending unexpected filenames, but it comes at a risk of rejecting wanted
+files due to differences between client and server wildcard expansion rules.
+
+For this reason, this also adds a new -T flag to disable the check.
+
+reported by Harry Sintonen
+fix approach suggested by markus@;
+has been in snaps for ~1wk courtesy deraadt@
+
+OpenBSD-Commit-ID: 00f44b50d2be8e321973f3c6d014260f8f7a8eda
+
+CVE: CVE-2019-6111
+Ustream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ scp.1 | 12 +++++++++++-
+ scp.c | 37 +++++++++++++++++++++++++++++--------
+ 2 files changed, 40 insertions(+), 9 deletions(-)
+
+diff --git a/scp.1 b/scp.1
+index 0e5cc1b..397e770 100644
+--- a/scp.1
++++ b/scp.1
+@@ -18,7 +18,7 @@
+ .Nd secure copy (remote file copy program)
+ .Sh SYNOPSIS
+ .Nm scp
+-.Op Fl 346BCpqrv
++.Op Fl 346BCpqrTv
+ .Op Fl c Ar cipher
+ .Op Fl F Ar ssh_config
+ .Op Fl i Ar identity_file
+@@ -208,6 +208,16 @@ to use for the encrypted connection.
+ The program must understand
+ .Xr ssh 1
+ options.
++.It Fl T
++Disable strict filename checking.
++By default when copying files from a remote host to a local directory
++.Nm
++checks that the received filenames match those requested on the command-line
++to prevent the remote end from sending unexpected or unwanted files.
++Because of differences in how various operating systems and shells interpret
++filename wildcards, these checks may cause wanted files to be rejected.
++This option disables these checks at the expense of fully trusting that
++the server will not send unexpected filenames.
+ .It Fl v
+ Verbose mode.
+ Causes
+diff --git a/scp.c b/scp.c
+index 0587cec..b2d331e 100644
+--- a/scp.c
++++ b/scp.c
+@@ -94,6 +94,7 @@
+ #include <dirent.h>
+ #include <errno.h>
+ #include <fcntl.h>
++#include <fnmatch.h>
+ #include <limits.h>
+ #include <locale.h>
+ #include <pwd.h>
+@@ -375,14 +376,14 @@ void verifydir(char *);
+ struct passwd *pwd;
+ uid_t userid;
+ int errs, remin, remout;
+-int pflag, iamremote, iamrecursive, targetshouldbedirectory;
++int Tflag, pflag, iamremote, iamrecursive, targetshouldbedirectory;
+ 
+ #define	CMDNEEDS	64
+ char cmd[CMDNEEDS];		/* must hold "rcp -r -p -d\0" */
+ 
+ int response(void);
+ void rsource(char *, struct stat *);
+-void sink(int, char *[]);
++void sink(int, char *[], const char *);
+ void source(int, char *[]);
+ void tolocal(int, char *[]);
+ void toremote(int, char *[]);
+@@ -421,8 +422,9 @@ main(int argc, char **argv)
+ 	addargs(&args, "-oRemoteCommand=none");
+ 	addargs(&args, "-oRequestTTY=no");
+ 
+-	fflag = tflag = 0;
+-	while ((ch = getopt(argc, argv, "dfl:prtvBCc:i:P:q12346S:o:F:")) != -1)
++	fflag = Tflag = tflag = 0;
++	while ((ch = getopt(argc, argv,
++	    "dfl:prtTvBCc:i:P:q12346S:o:F:")) != -1) {
+ 		switch (ch) {
+ 		/* User-visible flags. */
+ 		case '1':
+@@ -501,9 +503,13 @@ main(int argc, char **argv)
+ 			setmode(0, O_BINARY);
+ #endif
+ 			break;
++		case 'T':
++			Tflag = 1;
++			break;
+ 		default:
+ 			usage();
+ 		}
++	}
+ 	argc -= optind;
+ 	argv += optind;
+ 
+@@ -534,7 +540,7 @@ main(int argc, char **argv)
+ 	}
+ 	if (tflag) {
+ 		/* Receive data. */
+-		sink(argc, argv);
++		sink(argc, argv, NULL);
+ 		exit(errs != 0);
+ 	}
+ 	if (argc < 2)
+@@ -792,7 +798,7 @@ tolocal(int argc, char **argv)
+ 			continue;
+ 		}
+ 		free(bp);
+-		sink(1, argv + argc - 1);
++		sink(1, argv + argc - 1, src);
+ 		(void) close(remin);
+ 		remin = remout = -1;
+ 	}
+@@ -968,7 +974,7 @@ rsource(char *name, struct stat *statp)
+ 	 (sizeof(type) != 4 && sizeof(type) != 8))
+ 
+ void
+-sink(int argc, char **argv)
++sink(int argc, char **argv, const char *src)
+ {
+ 	static BUF buffer;
+ 	struct stat stb;
+@@ -984,6 +990,7 @@ sink(int argc, char **argv)
+ 	unsigned long long ull;
+ 	int setimes, targisdir, wrerrno = 0;
+ 	char ch, *cp, *np, *targ, *why, *vect[1], buf[2048], visbuf[2048];
++	char *src_copy = NULL, *restrict_pattern = NULL;
+ 	struct timeval tv[2];
+ 
+ #define	atime	tv[0]
+@@ -1008,6 +1015,17 @@ sink(int argc, char **argv)
+ 	(void) atomicio(vwrite, remout, "", 1);
+ 	if (stat(targ, &stb) == 0 && S_ISDIR(stb.st_mode))
+ 		targisdir = 1;
++	if (src != NULL && !iamrecursive && !Tflag) {
++		/*
++		 * Prepare to try to restrict incoming filenames to match
++		 * the requested destination file glob.
++		 */
++		if ((src_copy = strdup(src)) == NULL)
++			fatal("strdup failed");
++		if ((restrict_pattern = strrchr(src_copy, '/')) != NULL) {
++			*restrict_pattern++ = '\0';
++		}
++	}
+ 	for (first = 1;; first = 0) {
+ 		cp = buf;
+ 		if (atomicio(read, remin, cp, 1) != 1)
+@@ -1112,6 +1130,9 @@ sink(int argc, char **argv)
+ 			run_err("error: unexpected filename: %s", cp);
+ 			exit(1);
+ 		}
++		if (restrict_pattern != NULL &&
++		    fnmatch(restrict_pattern, cp, 0) != 0)
++			SCREWUP("filename does not match request");
+ 		if (targisdir) {
+ 			static char *namebuf;
+ 			static size_t cursize;
+@@ -1149,7 +1170,7 @@ sink(int argc, char **argv)
+ 					goto bad;
+ 			}
+ 			vect[0] = xstrdup(np);
+-			sink(1, vect);
++			sink(1, vect, src);
+ 			if (setimes) {
+ 				setimes = 0;
+ 				if (utimes(vect[0], tv) < 0)
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
index 6260135d5b..b971b2b1e8 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
@@ -24,6 +24,10 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://CVE-2018-20685.patch \
+           file://CVE-2019-6109.patch \
+           file://0001-upstream-Have-progressmeter-force-an-update-at-the-b.patch \
+           file://CVE-2019-6111.patch \
            "
 SRC_URI[md5sum] = "c6af50b7a474d04726a5aa747a5dce8f"
 SRC_URI[sha256sum] = "6b4b3ba2253d84ed3771c8050728d597c91cfce898713beb7b64a305b6f11aad"
-- 
2.20.1


