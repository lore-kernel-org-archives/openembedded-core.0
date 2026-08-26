Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF74BC61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:13:47 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7701.1787732020976524715
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=O2zTw7xX;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2caed617615so7837545ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 01:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787732020; x=1788336820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3z+kVgUq57HE3Wo53jNdTZ247pCK44sgIE4XlD0DYU=;
        b=O2zTw7xXihdevQJOUw9CX2Nl1iKQaaDXIXPLYcyI6xMTAJrvD9CMVGurpVCZzGXoWO
         zBAUXKvGjAuU5l1FduCtfKnJMDO4/s9tB563mZEGHAgng/muScs7TelAVXd+1M5z7KZ/
         wQZfyIbPxanECJ8r6t0mNU1L/zINKSVI0rnTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732020; x=1788336820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3z+kVgUq57HE3Wo53jNdTZ247pCK44sgIE4XlD0DYU=;
        b=b/r8tu8DGFaCNanwN3Jj3J67Bvk6fb5Mp2OZxZhHX42h/A2l6bZSyRjAjwbmZcic8W
         F7bmdx2M7pkrR7yD1edY5dFZy+9SFNLnXubn5xSyexEwfS/psyY4U39ToXemTXDd6nhR
         yiw1gz2yJKP81wc065b3KCzcQuM9VJnE/lAX2PF/FjihXSoyRWPBUXm6EbqFMTbLb/uV
         AYR55ze/DtnVjxWAzcely259R+nR54/hic2tIiqoC0+LKJ6h4DS7aq+/iCgnDwlJj/XD
         qHM6QcVPpGs/ZszVhfaA1O4tbModfM4tloJX8t98KXY7BtK5ResmefiLtBRFPIFjT2md
         CQiw==
X-Gm-Message-State: AFuF++lqAe4/fKlhoL5C0bigNhXKieOGn356oWI/WWQmaKkd2s1Fx4pH
	BjidVSJ2C8m7lv5GT5RmVkG37/nUOPuMHy0kF53uvlI7cmeXnhRj6X/qGv+og2ehNm8UqZIV6/6
	OMGP2
X-Gm-Gg: AR+sD13USbP1Mpjtw3RRiS4eJ8kOWzFHoKdCZSi1M8Oqsd0RHuF4/GsvxopC76Re+EV
	z1Ubwuly9pWfcDupmosy+t8bJ3fVxkP+QpcYsmpDN5a7+b3zbq1Nq2CbZFYvxao04Z4qc4xbC3E
	lkECS1X0GVMj5KQRgpKhwnIdNGCX4CnsFgJmG5bKO4JNgq2bhZRWJWZsRRXPF9hVrEN4Py8bgRD
	hhIhbkzPRpgxRYuCUtr3xMzdaGjPoPWttrUbpO0Un6FIgrfsORiQr9IlrHE3USbqpij4UiCangS
	isuYRUiZs5QKLBNalg2jCYPuDJCy/j2Pvxir7QXg7qej2UpTH0FFZk0tZmbyuuvzhlXdOHSwxbO
	rLmGhT5f0U0QIdEXwiGKEvDVpwqraiBHA5x/9ZPeIn8jwLXxLA9FCi3XibIH4fo7Nn3oJbPj23U
	A+mxuJGi4Rw9pvYsu2ZI+pUYn0oaWkcf0CNgowabmYOOs/8QLG9SVve3SqjP718pCzVjHuEgXgR
	+g=
X-Received: by 2002:a17:903:1b44:b0:2d6:ccc5:a3dd with SMTP id d9443c01a7336-2d707a71485mr94817395ad.4.1787732020252;
        Wed, 26 Aug 2026 01:13:40 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:8284:64ba:2c5:548:3b55])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d886256sm7337482eec.16.2026.08.26.01.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:13:37 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch] kbd: Fix CVE-2026-72693
Date: Wed, 26 Aug 2026 13:43:24 +0530
Message-ID: <20260826081324.65559-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244339

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-72693
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-72693
[3] https://access.redhat.com/security/cve/cve-2026-72693

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../recipes-core/kbd/kbd/CVE-2026-72693.patch | 155 ++++++++++++++++++
 meta/recipes-core/kbd/kbd_2.9.0.bb            |   1 +
 2 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-core/kbd/kbd/CVE-2026-72693.patch

diff --git a/meta/recipes-core/kbd/kbd/CVE-2026-72693.patch b/meta/recipes-core/kbd/kbd/CVE-2026-72693.patch
new file mode 100644
index 0000000000..06b8c195a5
--- /dev/null
+++ b/meta/recipes-core/kbd/kbd/CVE-2026-72693.patch
@@ -0,0 +1,155 @@
+From 78d5ae119742e87baa7dbe0f5c4107e7533fd698 Mon Sep 17 00:00:00 2001
+From: Alexey Gladkov <legion@kernel.org>
+Date: Tue, 12 May 2026 10:20:50 +0200
+Subject: [PATCH] openvt: make -u process matching more conservative
+
+The -u mode relies on the current VT owner to decide which user should
+be used for the new login session. Make that check stricter by requiring
+a matching process owner and controlling terminal instead of relying on
+the ownership of an inherited file descriptor.
+
+Also reject root as a pre-authenticated target and document the tighter
+behavior in the man page.
+
+Signed-off-by: Alexey Gladkov <legion@kernel.org>
+
+Upstream-Status: Backport [https://github.com/legionus/kbd/commit/78d5ae119742e87baa7dbe0f5c4107e7533fd698]
+CVE: CVE-2026-72693
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ docs/man/man1/openvt.1 | 10 +++++++
+ src/openvt.c           | 64 +++++++++++++++++++++++++++++++++++++-----
+ 2 files changed, 67 insertions(+), 7 deletions(-)
+
+diff --git a/docs/man/man1/openvt.1 b/docs/man/man1/openvt.1
+index 8f1244f..404e4a0 100644
+--- a/docs/man/man1/openvt.1
++++ b/docs/man/man1/openvt.1
+@@ -36,6 +36,8 @@ will be made the new current VT.
+ \fB\-u\fR, \fB\-\-user\fR
+ Figure out the owner of the current VT, and run login as that user.
+ Suitable to be called by init. Shouldn't be used with \fI\-c\fR or \fI\-l\fR.
++This option refuses to pre-authenticate root and requires a process owned by
++the VT owner whose controlling terminal is the current VT.
+ .TP
+ \fB\-l\fR, \fB\-\-login\fR
+ Make the command a login shell. A \- is prepended to the name of the command
+@@ -64,6 +66,14 @@ If
+ is compiled with a getopt_long() and you wish to set
+ options to the command to be run, then you must supply
+ the end of options \-\- flag before the command.
++.PP
++The
++.B \-u
++option uses
++.BR "login -f"
++and therefore bypasses normal password authentication for the detected user.
++It is intended only for controlled init or keyboard-request configurations.
++Use a normal authenticated login command when authentication is required.
+ .SH EXAMPLES
+ .B openvt
+ can be used to start a shell on the next free VT, by using the command:
+diff --git a/src/openvt.c b/src/openvt.c
+index a94392b..ddd9239 100644
+--- a/src/openvt.c
++++ b/src/openvt.c
+@@ -57,6 +57,51 @@ usage(int rc, const struct kbd_help *options)
+ 	exit(rc);
+ }
+ 
++static int
++proc_pid_stat(const char *pid, uid_t *uid, dev_t *tty)
++{
++	char filename[NAME_MAX + 12];
++	char line[BUFSIZ];
++	char *lp, *rp;
++	FILE *fp;
++	struct stat st;
++	long tty_nr;
++
++	snprintf(filename, sizeof(filename), "/proc/%s/stat", pid);
++	fp = fopen(filename, "r");
++	if (!fp)
++		return -1;
++
++	if (fstat(fileno(fp), &st)) {
++		fclose(fp);
++		return -1;
++	}
++
++	if (!fgets(line, sizeof(line), fp)) {
++		fclose(fp);
++		return -1;
++	}
++	fclose(fp);
++
++	rp = strrchr(line, ')');
++	if (!rp)
++		return -1;
++
++	/*
++	 * /proc/<pid>/stat fields after comm are:
++	 * state ppid pgrp session tty_nr ...
++	 */
++	if (!rp || sscanf(rp + 1, " %*c %*d %*d %*d %ld", &tty_nr) != 1)
++		return -1;
++
++	if (tty_nr <= 0)
++		return -1;
++
++	*uid = st.st_uid;
++	*tty = (dev_t) tty_nr;
++	return 0;
++}
++
+ /*
+  * Support for Spawn_Console: openvt running from init
+  * added by Joshua Spoerri, Thu Jul 18 21:13:16 EDT 1996
+@@ -88,8 +133,7 @@ authenticate_user(int curvt)
+ 	DIR *dp;
+ 	struct dirent *dentp;
+ 	struct stat buf;
+-	dev_t console_dev;
+-	ino_t console_ino;
++	dev_t console_rdev;
+ 	uid_t console_uid;
+ 	char filename[NAME_MAX + 12];
+ 	struct passwd *pwnam;
+@@ -109,10 +153,12 @@ authenticate_user(int curvt)
+ 			kbd_error(EXIT_FAILURE, errsv, "%s", filename);
+ 		}
+ 	}
+-	console_dev = buf.st_dev;
+-	console_ino = buf.st_ino;
++	console_rdev = buf.st_rdev;
+ 	console_uid = buf.st_uid;
+ 
++	if (console_uid == 0)
++		kbd_error(EXIT_FAILURE, 0, _("Refusing to pre-authenticate root on current tty."));
++
+ 	/* get the owner of current tty */
+ 	if (!(pwnam = getpwuid(console_uid)))
+ 		kbd_error(EXIT_FAILURE, errno, "getpwuid");
+@@ -120,12 +166,16 @@ authenticate_user(int curvt)
+ 	/* check to make sure that user has a process on that tty */
+ 	/* this will fail for example when X is running on the tty */
+ 	while ((dentp = readdir(dp))) {
+-		sprintf(filename, "/proc/%s/fd/0", dentp->d_name);
++		uid_t proc_uid;
++		dev_t proc_tty;
++
++		if (dentp->d_name[0] < '0' || dentp->d_name[0] > '9')
++			continue;
+ 
+-		if (stat(filename, &buf))
++		if (proc_pid_stat(dentp->d_name, &proc_uid, &proc_tty) < 0)
+ 			continue;
+ 
+-		if (buf.st_dev == console_dev && buf.st_ino == console_ino && buf.st_uid == console_uid)
++		if (proc_uid == console_uid && proc_tty == console_rdev)
+ 			goto got_a_process;
+ 	}
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/kbd/kbd_2.9.0.bb b/meta/recipes-core/kbd/kbd_2.9.0.bb
index 79b011e529..06341ba8c0 100644
--- a/meta/recipes-core/kbd/kbd_2.9.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.9.0.bb
@@ -26,6 +26,7 @@ RCONFLICTS:${PN} = "console-tools"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            file://0001-Preserve-only-necessary-metadata-during-install.patch \
            file://0001-libkbdfile-Fix-problem-with-undeclared-sym_gzopen.patch \
+           file://CVE-2026-72693.patch \
            "
 
 SRC_URI[sha256sum] = "fb3197f17a99eb44d22a3a1a71f755f9622dd963e66acfdea1a45120951b02ed"
-- 
2.43.0


