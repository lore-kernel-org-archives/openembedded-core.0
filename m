Return-Path: <msft.dantran@gmail.com>
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
	[209.85.222.177])
	by mail.openembedded.org (Postfix) with ESMTP id DB0047F260
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 22:04:00 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id h126so17296222qke.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 15:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=y7FY5Z6SSYdxHPT6yEavoPZg2BJPu6KF4aPiFJ8pqCw=;
	b=ALrW3EhI+y8n4/QEpt86vdTm5lcxofgZyUySP+ECWkHX7doGMfL1FcF/Z9WEtnoqgA
	XHBVgFMRulBFcsY2AMfj3gw7QLePoS1pU8h93BCNeRYheYFmkZQjGDGbVEBPj2tduET/
	rRLCl6kmtWoDWUUiU0aRfZXFQSWJmpk4hW4cfkJQBiTrbwS+GqSNmMbUx+z87wbgBRuE
	qOuMQK6O5+y1zq/M2/T8bt+HfH71y/crsst7ZcwoX6mc18/UXXiUH7jkj18lF6XdZG1l
	tv0oK/x7SHVA0c+fD9ceVzR7EoY2LqiTqKkbAlrFTbNIxvwGk6evTuiZS+F9Ui4VY/K6
	6owQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y7FY5Z6SSYdxHPT6yEavoPZg2BJPu6KF4aPiFJ8pqCw=;
	b=i9MM415TaquKQGxvNJjwlvBO2yCbXTFU7NTRhTcgpgP2OY89hzs2d58FmmYmQB9QZp
	pRPsaEmUOvbrjaHH5kaA2XzCVSFAocKBNop/dIXqJa447TC1FMXi6WdzaSbcNQqEUROp
	8wbRWI5b6Vs32AVOvGABJR7nYIo61eoVAXZRy52/F2CzjdJLiwYhsB9rs/cQRkbK9jvs
	yudA5M0oQ7BbiEZYfTomqTCu6o1QRqjjiPp/9jSneBpopSSd7oJF7HCzFZD5u6bxtLWt
	bBQik20Kw0N6byQ8SBSUwW9aAQvL5iaa2mY02VQLPi45Pqv/girCv9tHaGxdpgSkgi0o
	e+IQ==
X-Gm-Message-State: APjAAAXptQz9xi/fJSY19soPsrO66XQHHl2duSgZQ8oJdGH0HY1Kjsd2
	sZA2RySFvQ9NLpo6iCMheq9nhPOH
X-Google-Smtp-Source: APXvYqwWSCkyUdNXLcHrOlYO0gdFh77OJrVDUj/3rNHfgUpB7ilPWXDyDKz3u2UBqGkH5Pou8q5Eew==
X-Received: by 2002:a05:620a:21da:: with SMTP id
	h26mr20730004qka.58.1571090640721; 
	Mon, 14 Oct 2019 15:04:00 -0700 (PDT)
Received: from
	dantran-yocto-ubuntu18.4z1s34kka3euddhhn33gkqkz1e.cx.internal.cloudapp.net
	([52.167.220.70]) by smtp.gmail.com with ESMTPSA id
	w14sm8029734qki.73.2019.10.14.15.03.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Oct 2019 15:04:00 -0700 (PDT)
From: msft.dantran@gmail.com
X-Google-Original-From: dantran@microsoft.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2019 22:03:54 +0000
Message-Id: <20191014220354.61281-1-dantran@microsoft.com>
X-Mailer: git-send-email 2.17.1
Subject: [thud][PATCH] openssh: Fix three CVEs
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
X-List-Received-Date: Mon, 14 Oct 2019 22:04:01 -0000

From: Dan Tran <dantran@microsoft.com>

Signed-off-by: Dan Tran <dantran@microsoft.com>
---
 .../openssh/openssh/CVE-2018-20685.patch      |  42 +++
 .../openssh/openssh/CVE-2019-6109_p1.patch    | 278 ++++++++++++++
 .../openssh/openssh/CVE-2019-6109_p2.patch    | 125 ++++++
 .../openssh/openssh/CVE-2019-6111_p1.patch    | 189 ++++++++++
 .../openssh/openssh/CVE-2019-6111_p2.patch    | 357 ++++++++++++++++++
 .../openssh/openssh_7.8p1+git.bb              |   5 +
 6 files changed, 996 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2018-20685.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2019-6109_p1.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2019-6109_p2.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2019-6111_p1.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2019-6111_p2.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2018-20685.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2018-20685.patch
new file mode 100644
index 0000000000..2c1da37db8
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2018-20685.patch
@@ -0,0 +1,42 @@
+From af866e4233acb6b64cb37f7900fe8bff26e4653f Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport
+[https://github.com/openssh/openssh-portable/commit/6010c0303a422a9c5fa8860c061bf7105eb7f8b2]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ scp.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/scp.c b/scp.c
+index 60682c68..4f3fdcd3 100644
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
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2019-6109_p1.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2019-6109_p1.patch
new file mode 100644
index 0000000000..4c2528a146
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2019-6109_p1.patch
@@ -0,0 +1,278 @@
+From 8b46eb8465a3846a1ff27dc56a9b263dd00d9e00 Mon Sep 17 00:00:00 2001
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
+
+CVE: CVE-2019-6109
+Upstream-Status: Backport
+[https://github.com/openssh/openssh-portable/commit/8976f1c4b2721c26e878151f52bdf346dfe2d54c]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ atomicio.c      | 20 ++++++++++++++-----
+ progressmeter.c | 53 ++++++++++++++++++++++---------------------------
+ progressmeter.h |  3 ++-
+ scp.c           |  1 +
+ sftp-client.c   | 16 ++++++++-------
+ 5 files changed, 51 insertions(+), 42 deletions(-)
+
+diff --git a/atomicio.c b/atomicio.c
+index f854a06f..d91bd762 100644
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
+index fe9bf52e..add462dd 100644
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
+index bf179dca..8f667806 100644
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
+index 4f3fdcd3..4a342a63 100644
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
+index 4986d6d8..2bc698f8 100644
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
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2019-6109_p2.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2019-6109_p2.patch
new file mode 100644
index 0000000000..9deeaa47e5
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2019-6109_p2.patch
@@ -0,0 +1,125 @@
+From d54419dc1127c0515bda3d79c4dc71394cfba969 Mon Sep 17 00:00:00 2001
+From: "dtucker@openbsd.org" <dtucker@openbsd.org>
+Date: Thu, 24 Jan 2019 16:52:17 +0000
+Subject: [PATCH] upstream: Have progressmeter force an update at the beginning
+ and
+
+end of each transfer.  Fixes the problem recently introduces where very quick
+transfers do not display the progressmeter at all.  Spotted by naddy@
+
+OpenBSD-Commit-ID: 68dc46c259e8fdd4f5db3ec2a130f8e4590a7a9a
+
+CVE: CVE-2019-6109
+Upstream-Status: Backport
+[https://github.com/openssh/openssh-portable/commit/bdc6c63c80b55bcbaa66b5fde31c1cb1d09a41eb]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ progressmeter.c | 13 +++++--------
+ progressmeter.h |  4 ++--
+ scp.c           |  2 +-
+ sftp-client.c   |  2 +-
+ 4 files changed, 9 insertions(+), 12 deletions(-)
+
+diff --git a/progressmeter.c b/progressmeter.c
+index add462dd..e385c125 100644
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
+index 8f667806..1703ea75 100644
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
+index 4a342a63..0587cec3 100644
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
+index 2bc698f8..cf2887a4 100644
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
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2019-6111_p1.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2019-6111_p1.patch
new file mode 100644
index 0000000000..6c88d418cd
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2019-6111_p1.patch
@@ -0,0 +1,189 @@
+From 5f4583d2bc58c2b8c131acca9df6ada6a7129ee5 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport
+[https://github.com/openssh/openssh-portable/commit/391ffc4b9d31fa1f4ad566499fef9176ff8a07dc]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ scp.1 | 12 +++++++++++-
+ scp.c | 37 +++++++++++++++++++++++++++++--------
+ 2 files changed, 40 insertions(+), 9 deletions(-)
+
+diff --git a/scp.1 b/scp.1
+index 92abcaf0..4dca6003 100644
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
+@@ -207,6 +207,16 @@ to use for the encrypted connection.
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
+index 0587cec3..983bdf5a 100644
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
++	    "dfl:prtTvBCc:i:P:q12346S:o:F:J:")) != -1) {
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
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2019-6111_p2.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2019-6111_p2.patch
new file mode 100644
index 0000000000..4e2e1d48fa
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2019-6111_p2.patch
@@ -0,0 +1,357 @@
+From c6aa5d385bfa65ad6efe8a1ee417b153e4ee3ca0 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Sun, 10 Feb 2019 11:15:52 +0000
+Subject: [PATCH] upstream: when checking that filenames sent by the server
+ side
+
+match what the client requested, be prepared to handle shell-style brace
+alternations, e.g. "{foo,bar}".
+
+"looks good to me" millert@ + in snaps for the last week courtesy
+deraadt@
+
+OpenBSD-Commit-ID: 3b1ce7639b0b25b2248e3a30f561a548f6815f3e
+
+CVE: CVE-2019-6111
+Upstream-Status: Backport
+[https://github.com/openssh/openssh-portable/commit/3d896c157c722bc47adca51a58dca859225b5874]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ scp.c | 280 +++++++++++++++++++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 269 insertions(+), 11 deletions(-)
+
+diff --git a/scp.c b/scp.c
+index 983bdf5a..746bcdc8 100644
+--- a/scp.c
++++ b/scp.c
+@@ -627,6 +627,253 @@ parse_scp_uri(const char *uri, char **userp, char **hostp, int *portp,
+ 	return r;
+ }
+ 
++/* Appends a string to an array; returns 0 on success, -1 on alloc failure */
++static int
++append(char *cp, char ***ap, size_t *np)
++{
++	char **tmp;
++
++	if ((tmp = reallocarray(*ap, *np + 1, sizeof(*tmp))) == NULL)
++		return -1;
++	tmp[(*np)] = cp;
++	(*np)++;
++	*ap = tmp;
++	return 0;
++}
++
++/*
++ * Finds the start and end of the first brace pair in the pattern.
++ * returns 0 on success or -1 for invalid patterns.
++ */
++static int
++find_brace(const char *pattern, int *startp, int *endp)
++{
++	int i;
++	int in_bracket, brace_level;
++
++	*startp = *endp = -1;
++	in_bracket = brace_level = 0;
++	for (i = 0; i < INT_MAX && *endp < 0 && pattern[i] != '\0'; i++) {
++		switch (pattern[i]) {
++		case '\\':
++			/* skip next character */
++			if (pattern[i + 1] != '\0')
++				i++;
++			break;
++		case '[':
++			in_bracket = 1;
++			break;
++		case ']':
++			in_bracket = 0;
++			break;
++		case '{':
++			if (in_bracket)
++				break;
++			if (pattern[i + 1] == '}') {
++				/* Protect a single {}, for find(1), like csh */
++				i++; /* skip */
++				break;
++			}
++			if (*startp == -1)
++				*startp = i;
++			brace_level++;
++			break;
++		case '}':
++			if (in_bracket)
++				break;
++			if (*startp < 0) {
++				/* Unbalanced brace */
++				return -1;
++			}
++			if (--brace_level <= 0)
++				*endp = i;
++			break;
++		}
++	}
++	/* unbalanced brackets/braces */
++	if (*endp < 0 && (*startp >= 0 || in_bracket))
++		return -1;
++	return 0;
++}
++
++/*
++ * Assembles and records a successfully-expanded pattern, returns -1 on
++ * alloc failure.
++ */
++static int
++emit_expansion(const char *pattern, int brace_start, int brace_end,
++    int sel_start, int sel_end, char ***patternsp, size_t *npatternsp)
++{
++	char *cp;
++	int o = 0, tail_len = strlen(pattern + brace_end + 1);
++
++	if ((cp = malloc(brace_start + (sel_end - sel_start) +
++	    tail_len + 1)) == NULL)
++		return -1;
++
++	/* Pattern before initial brace */
++	if (brace_start > 0) {
++		memcpy(cp, pattern, brace_start);
++		o = brace_start;
++	}
++	/* Current braced selection */
++	if (sel_end - sel_start > 0) {
++		memcpy(cp + o, pattern + sel_start,
++		    sel_end - sel_start);
++		o += sel_end - sel_start;
++	}
++	/* Remainder of pattern after closing brace */
++	if (tail_len > 0) {
++		memcpy(cp + o, pattern + brace_end + 1, tail_len);
++		o += tail_len;
++	}
++	cp[o] = '\0';
++	if (append(cp, patternsp, npatternsp) != 0) {
++		free(cp);
++		return -1;
++	}
++	return 0;
++}
++
++/*
++ * Expand the first encountered brace in pattern, appending the expanded
++ * patterns it yielded to the *patternsp array.
++ *
++ * Returns 0 on success or -1 on allocation failure.
++ *
++ * Signals whether expansion was performed via *expanded and whether
++ * pattern was invalid via *invalid.
++ */
++static int
++brace_expand_one(const char *pattern, char ***patternsp, size_t *npatternsp,
++    int *expanded, int *invalid)
++{
++	int i;
++	int in_bracket, brace_start, brace_end, brace_level;
++	int sel_start, sel_end;
++
++	*invalid = *expanded = 0;
++
++	if (find_brace(pattern, &brace_start, &brace_end) != 0) {
++		*invalid = 1;
++		return 0;
++	} else if (brace_start == -1)
++		return 0;
++
++	in_bracket = brace_level = 0;
++	for (i = sel_start = brace_start + 1; i < brace_end; i++) {
++		switch (pattern[i]) {
++		case '{':
++			if (in_bracket)
++				break;
++			brace_level++;
++			break;
++		case '}':
++			if (in_bracket)
++				break;
++			brace_level--;
++			break;
++		case '[':
++			in_bracket = 1;
++			break;
++		case ']':
++			in_bracket = 0;
++			break;
++		case '\\':
++			if (i < brace_end - 1)
++				i++; /* skip */
++			break;
++		}
++		if (pattern[i] == ',' || i == brace_end - 1) {
++			if (in_bracket || brace_level > 0)
++				continue;
++			/* End of a selection, emit an expanded pattern */
++
++			/* Adjust end index for last selection */
++			sel_end = (i == brace_end - 1) ? brace_end : i;
++			if (emit_expansion(pattern, brace_start, brace_end,
++			    sel_start, sel_end, patternsp, npatternsp) != 0)
++				return -1;
++			/* move on to the next selection */
++			sel_start = i + 1;
++			continue;
++		}
++	}
++	if (in_bracket || brace_level > 0) {
++		*invalid = 1;
++		return 0;
++	}
++	/* success */
++	*expanded = 1;
++	return 0;
++}
++
++/* Expand braces from pattern. Returns 0 on success, -1 on failure */
++static int
++brace_expand(const char *pattern, char ***patternsp, size_t *npatternsp)
++{
++	char *cp, *cp2, **active = NULL, **done = NULL;
++	size_t i, nactive = 0, ndone = 0;
++	int ret = -1, invalid = 0, expanded = 0;
++
++	*patternsp = NULL;
++	*npatternsp = 0;
++
++	/* Start the worklist with the original pattern */
++	if ((cp = strdup(pattern)) == NULL)
++		return -1;
++	if (append(cp, &active, &nactive) != 0) {
++		free(cp);
++		return -1;
++	}
++	while (nactive > 0) {
++		cp = active[nactive - 1];
++		nactive--;
++		if (brace_expand_one(cp, &active, &nactive,
++		    &expanded, &invalid) == -1) {
++			free(cp);
++			goto fail;
++		}
++		if (invalid)
++			fatal("%s: invalid brace pattern \"%s\"", __func__, cp);
++		if (expanded) {
++			/*
++			 * Current entry expanded to new entries on the
++			 * active list; discard the progenitor pattern.
++			 */
++			free(cp);
++			continue;
++		}
++		/*
++		 * Pattern did not expand; append the finename component to
++		 * the completed list
++		 */
++		if ((cp2 = strrchr(cp, '/')) != NULL)
++			*cp2++ = '\0';
++		else
++			cp2 = cp;
++		if (append(xstrdup(cp2), &done, &ndone) != 0) {
++			free(cp);
++			goto fail;
++		}
++		free(cp);
++	}
++	/* success */
++	*patternsp = done;
++	*npatternsp = ndone;
++	done = NULL;
++	ndone = 0;
++	ret = 0;
++ fail:
++	for (i = 0; i < nactive; i++)
++		free(active[i]);
++	free(active);
++	for (i = 0; i < ndone; i++)
++		free(done[i]);
++	free(done);
++	return ret;
++}
++
+ void
+ toremote(int argc, char **argv)
+ {
+@@ -990,7 +1237,8 @@ sink(int argc, char **argv, const char *src)
+ 	unsigned long long ull;
+ 	int setimes, targisdir, wrerrno = 0;
+ 	char ch, *cp, *np, *targ, *why, *vect[1], buf[2048], visbuf[2048];
+-	char *src_copy = NULL, *restrict_pattern = NULL;
++	char **patterns = NULL;
++	size_t n, npatterns = 0;
+ 	struct timeval tv[2];
+ 
+ #define	atime	tv[0]
+@@ -1020,16 +1268,13 @@ sink(int argc, char **argv, const char *src)
+ 		 * Prepare to try to restrict incoming filenames to match
+ 		 * the requested destination file glob.
+ 		 */
+-		if ((src_copy = strdup(src)) == NULL)
+-			fatal("strdup failed");
+-		if ((restrict_pattern = strrchr(src_copy, '/')) != NULL) {
+-			*restrict_pattern++ = '\0';
+-		}
++		if (brace_expand(src, &patterns, &npatterns) != 0)
++			fatal("%s: could not expand pattern", __func__);
+ 	}
+ 	for (first = 1;; first = 0) {
+ 		cp = buf;
+ 		if (atomicio(read, remin, cp, 1) != 1)
+-			return;
++			goto done;
+ 		if (*cp++ == '\n')
+ 			SCREWUP("unexpected <newline>");
+ 		do {
+@@ -1055,7 +1300,7 @@ sink(int argc, char **argv, const char *src)
+ 		}
+ 		if (buf[0] == 'E') {
+ 			(void) atomicio(vwrite, remout, "", 1);
+-			return;
++			goto done;
+ 		}
+ 		if (ch == '\n')
+ 			*--cp = 0;
+@@ -1130,9 +1375,14 @@ sink(int argc, char **argv, const char *src)
+ 			run_err("error: unexpected filename: %s", cp);
+ 			exit(1);
+ 		}
+-		if (restrict_pattern != NULL &&
+-		    fnmatch(restrict_pattern, cp, 0) != 0)
+-			SCREWUP("filename does not match request");
++		if (npatterns > 0) {
++			for (n = 0; n < npatterns; n++) {
++				if (fnmatch(patterns[n], cp, 0) == 0)
++					break;
++			}
++			if (n >= npatterns)
++				SCREWUP("filename does not match request");
++		}
+ 		if (targisdir) {
+ 			static char *namebuf;
+ 			static size_t cursize;
+@@ -1291,7 +1541,15 @@ bad:			run_err("%s: %s", np, strerror(errno));
+ 			break;
+ 		}
+ 	}
++done:
++	for (n = 0; n < npatterns; n++)
++		free(patterns[n]);
++	free(patterns);
++	return;
+ screwup:
++	for (n = 0; n < npatterns; n++)
++		free(patterns[n]);
++	free(patterns);
+ 	run_err("protocol error: %s", why);
+ 	exit(1);
+ }
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb b/meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb
index f54dfb5de4..aa3ef5ea41 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.8p1+git.bb
@@ -24,6 +24,11 @@ SRC_URI = "git://github.com/openssh/openssh-portable;branch=master \
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://CVE-2018-20685.patch \
+           file://CVE-2019-6109_p1.patch \
+           file://CVE-2019-6109_p2.patch \
+           file://CVE-2019-6111_p1.patch \
+           file://CVE-2019-6111_p2.patch \
            "
 
 PAM_SRC_URI = "file://sshd"
-- 
2.17.1


