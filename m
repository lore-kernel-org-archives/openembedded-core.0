Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837CEC61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:17:48 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7738.1787732267065408211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bgOwYjHv;
 spf=pass (domain: mvista.com, ip: 209.85.216.46, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so1442969a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 01:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787732266; x=1788337066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+TaiKgXYPFsX7t1Yn48NdNeWVwBxsGtBzwBim4wgkw0=;
        b=bgOwYjHvkl326i3OrrGQ4i7WfOq4IWWSm9HktYrp5r4h1KVPyQKH/SxDtgVQmwjTFA
         XZCsmDkJ6NaAas8G9zWqjMGPHEP8C7OgwXzLpSrFTA+v4mFNcaZuuCazME0izVLxuui4
         VlpKJDuxcAgsFt3XZvkz75kSSALmHlzd6PWIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732266; x=1788337066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+TaiKgXYPFsX7t1Yn48NdNeWVwBxsGtBzwBim4wgkw0=;
        b=iwFjZZ5WL7U54WKsTcSfJP2TnDGWB5XMyuyiYwV+wk9osmbEPpThMjBNG/dpJjTo/z
         iVQQDoTrKQVsyaNX2tbCj/sFoHmIEou95Qq1igExDsaYKAu18uRoQWR47DnpwVdMlybR
         4OaPR4a5A7YswP8+/8o/Sd7FXVcVl0kWaSAtdXzkUvTfvkREu3xdxnXXaE6FxBwFlZRP
         T+nK8G6M7EYr5hnSEVPwyBZTJWaMFW2mmmZzuWqeYOtk1ngt9nm7qhJNsjVWXMDAWorD
         dNTyOq1pd8UgN7D06u785Sh2zu6wrXWe7OzI8SPDqpeUkVybU+LAdk/UPdH76F5Gb6ca
         F//w==
X-Gm-Message-State: AFuF++lX3nEt0fuGrpk91hrcqMEaTwfyngOW41YvH3KwgWZ7b3ClLnui
	3thVAVs1ImBgO/RZcxx4vgl4qR4yYM5xvNMmnVFsIrhBtbjAWRQ5ICNeoI74cWjOUKI8h7CKM4B
	Fx7v8
X-Gm-Gg: AR+sD10/sreQUbQHKJKqMNM0Y0sN2LhFRZlgeOEK5UgqpUK0LJ66l960DR5JGVh9RXj
	w2lNE+pxee72hvuQ7k03o3/0r5nFk8EYja6svN3mBQyejAQYlHx6qrkDb5y08maUQL3dARz2xA3
	H7IgPLeG5dGKdHTqfiyRcWpL2N4zGkb/DohAUsWHQzELcAoDED5PJfLc9ysyh0zKM05Muz/ePm9
	LBV8PWgUn9rQ2Am26v4jXCAezNJk7a9QoLRyKVEA+/Tq/Uvx8FJfkOVRxX5SoAm9nie+HEHKrFE
	99KyVa/s/gElwjq7uMFXx2ckE4XasxQQQG+H0je9WPaD22RnvAHc+dBUN0gkA0ZTBetz5KTcgTY
	ij9vGW//2l3xx1kGZ4g5rxiGQecHsxXGguDTQJgyUX4bZHTYcloLEYqs54y4OHvApNdtanypWot
	A0Xe7JBaDkLOdVplfb4EakTQGTbzBBuVokDasqTM0uLCyRfTC4RQT7r301Tkecq+KDLCxdYERVM
	A==
X-Received: by 2002:a17:90b:1c83:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-3966d1a48b7mr9387499a91.6.1787732266269;
        Wed, 26 Aug 2026 01:17:46 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:8284:64ba:2c5:548:3b55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905b959sm5888354c88.13.2026.08.26.01.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:17:44 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch] kbd: Fix CVE-2026-72693
Date: Wed, 26 Aug 2026 13:47:35 +0530
Message-ID: <20260826081735.66164-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:17:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244348

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-72693
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-72693
[3] https://access.redhat.com/security/cve/cve-2026-72693

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../recipes-core/kbd/kbd/CVE-2026-72693.patch | 155 ++++++++++++++++++
 meta/recipes-core/kbd/kbd_2.6.4.bb            |   1 +
 2 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-core/kbd/kbd/CVE-2026-72693.patch

diff --git a/meta/recipes-core/kbd/kbd/CVE-2026-72693.patch b/meta/recipes-core/kbd/kbd/CVE-2026-72693.patch
new file mode 100644
index 0000000000..71cef126a6
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
+index 79bfe3f..074de96 100644
+--- a/docs/man/man1/openvt.1
++++ b/docs/man/man1/openvt.1
+@@ -36,6 +36,8 @@ will be made the new current VT.
+ .I "\-u, \-\-user"
+ Figure out the owner of the current VT, and run login as that user.
+ Suitable to be called by init. Shouldn't be used with \fI\-c\fR or \fI\-l\fR.
++This option refuses to pre-authenticate root and requires a process owned by
++the VT owner whose controlling terminal is the current VT.
+ .TP
+ .I "\-l, \-\-login"
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
+index 5980361..b8436fe 100644
+--- a/src/openvt.c
++++ b/src/openvt.c
+@@ -78,6 +78,51 @@ usage(int rc, const struct kbd_help *options)
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
+@@ -109,8 +154,7 @@ authenticate_user(int curvt)
+ 	DIR *dp;
+ 	struct dirent *dentp;
+ 	struct stat buf;
+-	dev_t console_dev;
+-	ino_t console_ino;
++	dev_t console_rdev;
+ 	uid_t console_uid;
+ 	char filename[NAME_MAX + 12];
+ 	struct passwd *pwnam;
+@@ -130,10 +174,12 @@ authenticate_user(int curvt)
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
+@@ -141,12 +187,16 @@ authenticate_user(int curvt)
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
diff --git a/meta/recipes-core/kbd/kbd_2.6.4.bb b/meta/recipes-core/kbd/kbd_2.6.4.bb
index 2331b51e59..489218a402 100644
--- a/meta/recipes-core/kbd/kbd_2.6.4.bb
+++ b/meta/recipes-core/kbd/kbd_2.6.4.bb
@@ -25,6 +25,7 @@ RCONFLICTS:${PN} = "console-tools"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            file://0001-Remove-non-free-Agafari-fonts.patch \
+           file://CVE-2026-72693.patch \
            "
 
 SRC_URI[sha256sum] = "519f8d087aecca7e0a33cd084bef92c066eb19731666653dcc70c9d71aa40926"
-- 
2.43.0


