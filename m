Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D44C982D9
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:04 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1563.1789682876719439887
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Uz5d967Z;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so602475e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682875; x=1790287675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cDylMoEclDi8x5kxfF+n8L7uo5yiDeLtBinoj2RO3HQ=;
        b=Uz5d967Zrv4HPyDPoFp7LEnwobGgbskHGRaH1L0otinKhweurCLnRUlRlHazm8HnxE
         IFk6dVmVpIPuC1hZoM8h8WWtKuXkrFMxYUH7OaoJyb9EmQntLwRZtuBxC9u1KEYrP4PP
         I6H0GWvpflimb7oY9atmPUyWLYOXbmx21qPJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682875; x=1790287675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cDylMoEclDi8x5kxfF+n8L7uo5yiDeLtBinoj2RO3HQ=;
        b=m29scAEijCd36OuYfcflQ52S6mabZ76nrvh11V/8G/3Lha9K2AKAV4kX14Xs+dm4In
         NijWFusBjimqq504XjFm2b+wtf9vicLJjC6rUr6dqUZPDyX/o0TYqvwMOQLrZ2XFNlyZ
         S9kXy4JYuFfRHxeygMRhu7n2yq0/m/BRpp2txI6eS7QK7U3QVX4oLxr2LT//ca6qmYoH
         FOAwvN9QnvGxo9E1DbAZ61Ae8wrVpgzF122+fDohEzhOTLqCNoJQ4ZXQvgdDHSHwSfXm
         vPLXVAv9KD8Q3ThabW19la0J9rq5e6gtuW2ItfoFdeH/iI8sEUADunkzjo2I+51BTLt1
         P0aA==
X-Gm-Message-State: AFuF++k2pTBCUvmYOf9b/HrlBUjb2FgKegKESzoynDLL/l8OzRoMkImh
	64azrDW7UWoxuPdxPa3mGgJAnZfUIk00UoTPXxlXsqzv1CLCcq0t9VSR8EzXkiZt8+azrCNtkRA
	fykWDUps=
X-Gm-Gg: AYBFou3YAL3nm8RxZxzTuOUPo0q0AHprlu5rzthiZ7acvoWHHejMpiLTeGSzDD/8GYJ
	rNQBQMmb1/nVNKQZZ8UQ9x+rKeMZsOzHjOx7SNaT4JhNmxK4K4pUXNxRpW2e/hIn1u6HLad1YXD
	YLYkTrCQvg9JNgCk3RntQuMk/54GiIOjg+yC4V1LRlko9EQlQJ/VfOqsTIe8aSFbq7nKMk4ZHhl
	T+v+E17iibwV4b7P0jR+vhrOhYOFWkVcjMowiNepqzTHMN3TDa++Ym/YQ8fWSNsly0D9P3RbTMT
	e6DjPCHuGgNWoKf3XLxqs9ajfkQs+UfaNCp0oDrdCK84iNxXy0PCtNS2nt9RsHYeouu4yofnS0c
	4dbNt9fhT8bV8qX3tHBNDjMyB/OGhmwStvJeADLC1KfAnJQ8Kc31OEBv+li5Pc3gqEtEqP/9PBc
	3ZqRTyu4qPLVi6pC6z6m3VYuCt0QzxzzVuPlwMiIyuDOUapRZRr87AVgARFMkiIBxIU7EnhvoXq
	hh+zyEN+pB3lECud1kKFyJw4R9JDPHqRdSnzhiir8rbiWnozkub/AzWG9K8/d+AerSaEBmqihgf
	EUhKbO5SVA==
X-Received: by 2002:a05:600c:4ed4:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49fc5728f9amr2850985e9.16.1789682874887;
        Thu, 17 Sep 2026 15:07:54 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 10/79] kbd: Fix CVE-2026-72693
Date: Fri, 18 Sep 2026 00:05:55 +0200
Message-ID: <51db5b506929def353ffcf851a9c9d315d7ebf92.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246105

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-72693
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-72693
[3] https://access.redhat.com/security/cve/cve-2026-72693

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-core/kbd/kbd/CVE-2026-72693.patch | 155 ++++++++++++++++++
 meta/recipes-core/kbd/kbd_2.9.0.bb            |   1 +
 2 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-core/kbd/kbd/CVE-2026-72693.patch

diff --git a/meta/recipes-core/kbd/kbd/CVE-2026-72693.patch b/meta/recipes-core/kbd/kbd/CVE-2026-72693.patch
new file mode 100644
index 00000000000..06b8c195a5a
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
index 79b011e529d..06341ba8c04 100644
--- a/meta/recipes-core/kbd/kbd_2.9.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.9.0.bb
@@ -26,6 +26,7 @@ RCONFLICTS:${PN} = "console-tools"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            file://0001-Preserve-only-necessary-metadata-during-install.patch \
            file://0001-libkbdfile-Fix-problem-with-undeclared-sym_gzopen.patch \
+           file://CVE-2026-72693.patch \
            "
 
 SRC_URI[sha256sum] = "fb3197f17a99eb44d22a3a1a71f755f9622dd963e66acfdea1a45120951b02ed"

