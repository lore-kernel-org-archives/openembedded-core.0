Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F973C9830D
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:34 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2911.1790154685470973260
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MGpAYJ+5;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso5032495e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154684; x=1790759484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EvDdPMtNQZQuVuFq59fxR6gufSP2ih6aK8F18UrRyLg=;
        b=MGpAYJ+5i44ApLkEhZhN0LZxT+ClGkKeWiEodNv9PrwJX+qwFb8PoUkGY6Jjb6tMBR
         IAKYzVKc9EezDdbAeVjl+0nmMxDE7IpvMG0cNBRyg3TWQi3rfxdOJPYFAlrWA0JOWk47
         383RAsG9RhmUdMm5IXdmyT/1lOnv4z/hvRHDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154684; x=1790759484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EvDdPMtNQZQuVuFq59fxR6gufSP2ih6aK8F18UrRyLg=;
        b=yhbyeZ7zv8pVR9eE0NL3RpmrP/NsG9GJcH39r5MLs+r/KfJZwLvbmbsAq28E/lrGlB
         5kmfSnsSesOqAuMPMGVfEVOr3+05cC7rhBt5ONMudd61YcHxqCbyI5ZiXd/oapKnPvoO
         d7YzDmFBv+dBzLUkh//sKlRu6mj2Ib9RE99XHij2S7UVBTELJ+l+3TzK09WITH2+SGoW
         lE+qpNIixjfQCF0FL0rTab816rIQAnrSxVSpKeugRCIIl33wQGg7UWaYSycOLqjQWYYm
         gjC6TcxIfM8uCf4y6nxgPb7Gl6HS1DIZOkkv/+vACcoTqrYIfRCZAjIwDR5tNs98Xvj6
         1RJw==
X-Gm-Message-State: AFuF++mg+1hA1bUOtI+RwCKrGAWiH4zlYaTo0RZBjFZ8CLIglwSACQP/
	xSt/gpUzF0xwXHRLWPy4IRolAaiiR7PRd90LSp9dFMB+KwFZ91mr7cdkYKXGj2BnZjbAmDmPpk6
	g0xhHTqM=
X-Gm-Gg: AYBFou1X50WesTKTJ43iQi3fFNm5dYSXP7aX8CnPDRel9o4AHg+/5eAmABcejO+K2D0
	4tw088akFVVcRQlulKNtwtVoy+WXcyyYBg1ZOHl9fH3E04yPHva+Auk6E7w9ztWvth9+iRFD9dz
	E/NWqCLk58jeYQrPdYfR9cZY/jFWmibvQf94kw1rQJsLW2m+8n5e1iv95Yy28kqUZxP1Ad5kVHi
	kFS3f+eSnrhK1QQUWygp/eCo2DfEPySa0M61dskpvGE3Zd0zWQQf19uhFQ5RFUdeXkysiG3jZYA
	Qm00sTxNv3sdzGsQ6/H/rqhpHWkMc4MjDYbTv00sDxuCLIx1r7103NZoxedtRJax2VWNg1+xbMD
	2HkJbeMaGvxYoVqe+wR+V0MG5kWb6S9/CmoOTyM/uHsyiETIbSFS0CLZbsoKJR4wtbtdofTLHHj
	t7WAF81k1VR7Po0Wx05xZzdXSZHEXA8rVE4TpFatUHoBhonkcEvWgVoU77Wx07mnKov0Xr2XBUi
	+1+NVIr2BAiupqebNhFvnKuhevDIslfqrkq42bQLeyX6G7Hm2Ds6G7qpTziSBd7P5gcT6NZjMix
	Ip7IXco=
X-Received: by 2002:a05:600d:444f:10b0:49c:fa21:e73c with SMTP id 5b1f17b1804b1-49fdf35725amr15822335e9.18.1790154683689;
        Wed, 23 Sep 2026 02:11:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/48] kbd: Fix CVE-2026-72693
Date: Wed, 23 Sep 2026 11:10:08 +0200
Message-ID: <fab830015133862bad09efe0f572a27e7a7a2343.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246468

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-72693
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-72693
[3] https://access.redhat.com/security/cve/cve-2026-72693

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-core/kbd/kbd/CVE-2026-72693.patch | 155 ++++++++++++++++++
 meta/recipes-core/kbd/kbd_2.6.4.bb            |   1 +
 2 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-core/kbd/kbd/CVE-2026-72693.patch

diff --git a/meta/recipes-core/kbd/kbd/CVE-2026-72693.patch b/meta/recipes-core/kbd/kbd/CVE-2026-72693.patch
new file mode 100644
index 00000000000..71cef126a6e
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
index 2331b51e595..489218a4029 100644
--- a/meta/recipes-core/kbd/kbd_2.6.4.bb
+++ b/meta/recipes-core/kbd/kbd_2.6.4.bb
@@ -25,6 +25,7 @@ RCONFLICTS:${PN} = "console-tools"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            file://0001-Remove-non-free-Agafari-fonts.patch \
+           file://CVE-2026-72693.patch \
            "
 
 SRC_URI[sha256sum] = "519f8d087aecca7e0a33cd084bef92c066eb19731666653dcc70c9d71aa40926"

