Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E503EED60B
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 14:16:12 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.104895.1767276962701106180
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 06:16:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Bmeappm6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260101141559887a4393b10002078e-9gquul@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260101141559887a4393b10002078e
        for <openembedded-core@lists.openembedded.org>;
        Thu, 01 Jan 2026 15:15:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=W2h3m2Rku7a5s3v2e8aONDlqWcxyMQ4RH1rnZ71qmzY=;
 b=Bmeappm6QYZ1AxEobuXnuXOgMi5s1RCPoB9QrdGF8fdCrFRTC5qMmDfQqUjnFjSCUju78a
 klsiR29h/GJqqwTeliSrdsZBVe1LFhhXF0LiGUZUwpJblop7xJRJJz15LZI5idu7StQDZNKr
 R/dtYsKjEbpscTgPgyeMWfye1hj8S8K6u60mDU8Vews7AN4CvnLxYq+FdA0DuXlY9S702Ftb
 d7lqtCDu8ou3y4G0OO5vk7GSYjNYsvZG/R7pYFCJEF/NiES1F65l1eIu82bUPDMgKdKJmeXt
 CXreK6JuOTEVxYZAodlg5Jazyo3VIZ8jnD0WipQr9Mi3T2X0ppYGFWLw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH] dropbear: patch CVE-2019-6111
Date: Thu,  1 Jan 2026 15:15:54 +0100
Message-Id: <20260101141554.113806-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 14:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228821

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioning this CVE number.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../dropbear/dropbear/CVE-2019-6111.patch     | 157 ++++++++++++++++++
 .../recipes-core/dropbear/dropbear_2025.88.bb |   1 +
 2 files changed, 158 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111.patch

diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2019-6111.patch b/meta/recipes-core/dropbear/dropbear/CVE-2019-6111.patch
new file mode 100644
index 0000000000..3ad968aa78
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2019-6111.patch
@@ -0,0 +1,157 @@
+From 48a17cff6aa104b8e806ddb2191f83f1024060f1 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Tue, 9 Dec 2025 22:59:19 +0900
+Subject: [PATCH] scp CVE-2019-6111 fix
+
+Cherry-pick from OpenSSH portable
+
+391ffc4b9d31 ("upstream: check in scp client that filenames sent during")
+
+upstream: check in scp client that filenames sent during
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
+CVE: CVE-2019-6111
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/48a17cff6aa104b8e806ddb2191f83f1024060f1]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/scp.c | 38 +++++++++++++++++++++++++++++---------
+ 1 file changed, 29 insertions(+), 9 deletions(-)
+
+diff --git a/src/scp.c b/src/scp.c
+index 384f2cb..bf98986 100644
+--- a/src/scp.c
++++ b/src/scp.c
+@@ -76,6 +76,8 @@
+ #include "includes.h"
+ /*RCSID("$OpenBSD: scp.c,v 1.130 2006/01/31 10:35:43 djm Exp $");*/
+ 
++#include <fnmatch.h>
++
+ #include "atomicio.h"
+ #include "compat.h"
+ #include "scpmisc.h"
+@@ -291,14 +293,14 @@ void verifydir(char *);
+ 
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
+ void toremote(char *, int, char *[]);
+@@ -325,8 +327,8 @@ main(int argc, char **argv)
+ 	args.list = NULL;
+ 	addargs(&args, "%s", ssh_program);
+ 
+-	fflag = tflag = 0;
+-	while ((ch = getopt(argc, argv, "dfl:prtvBCc:i:P:q1246S:o:F:")) != -1)
++	fflag = Tflag = tflag = 0;
++	while ((ch = getopt(argc, argv, "dfl:prtTvBCc:i:P:q1246S:o:F:")) != -1)
+ 		switch (ch) {
+ 		/* User-visible flags. */
+ 		case '1':
+@@ -389,9 +391,12 @@ main(int argc, char **argv)
+ 			setmode(0, O_BINARY);
+ #endif
+ 			break;
++		case 'T':
++			Tflag = 1;
++			break;
+ 		default:
+ 			usage();
+-		}
++	}
+ 	argc -= optind;
+ 	argv += optind;
+ 
+@@ -409,7 +414,7 @@ main(int argc, char **argv)
+ 	}
+ 	if (tflag) {
+ 		/* Receive data. */
+-		sink(argc, argv);
++		sink(argc, argv, NULL);
+ 		exit(errs != 0);
+ 	}
+ 	if (argc < 2)
+@@ -589,7 +594,7 @@ tolocal(int argc, char **argv)
+ 			continue;
+ 		}
+ 		xfree(bp);
+-		sink(1, argv + argc - 1);
++		sink(1, argv + argc - 1, src);
+ 		(void) close(remin);
+ 		remin = remout = -1;
+ 	}
+@@ -822,7 +827,7 @@ bwlimit(int amount)
+ }
+ 
+ void
+-sink(int argc, char **argv)
++sink(int argc, char **argv, const char *src)
+ {
+ 	static BUF buffer;
+ 	struct stat stb;
+@@ -836,6 +841,7 @@ sink(int argc, char **argv)
+ 	off_t size, statbytes;
+ 	int setimes, targisdir, wrerrno = 0;
+ 	char ch, *cp, *np, *targ, *why, *vect[1], buf[2048];
++	char *src_copy = NULL, *restrict_pattern = NULL;
+ 	struct timeval tv[2];
+ 
+ #define	atime	tv[0]
+@@ -857,6 +863,17 @@ sink(int argc, char **argv)
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
+@@ -939,6 +956,9 @@ sink(int argc, char **argv)
+ 			run_err("error: unexpected filename: %s", cp);
+ 			exit(1);
+ 		}
++		if (restrict_pattern != NULL &&
++		    fnmatch(restrict_pattern, cp, 0) != 0)
++			SCREWUP("filename does not match request");
+ 		if (targisdir) {
+ 			static char *namebuf = NULL;
+ 			static size_t cursize = 0;
+@@ -977,7 +997,7 @@ sink(int argc, char **argv)
+ 					goto bad;
+ 			}
+ 			vect[0] = xstrdup(np);
+-			sink(1, vect);
++			sink(1, vect, src);
+ 			if (setimes) {
+ 				setimes = 0;
+ 				if (utimes(vect[0], tv) < 0)
diff --git a/meta/recipes-core/dropbear/dropbear_2025.88.bb b/meta/recipes-core/dropbear/dropbear_2025.88.bb
index 72a886d907..05af557b21 100644
--- a/meta/recipes-core/dropbear/dropbear_2025.88.bb
+++ b/meta/recipes-core/dropbear/dropbear_2025.88.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://dropbear.default \
            file://0001-Fix-proxycmd-without-netcat.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           file://CVE-2019-6111.patch \
            "
 
 SRC_URI[sha256sum] = "783f50ea27b17c16da89578fafdb6decfa44bb8f6590e5698a4e4d3672dc53d4"

