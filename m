Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE992CF6C0D
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 08:09:32 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1453.1767773363479994316
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 00:09:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=r+0b6Fsn;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso19132635e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 00:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767773362; x=1768378162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2h3m2Rku7a5s3v2e8aONDlqWcxyMQ4RH1rnZ71qmzY=;
        b=r+0b6FsnPuVQfXvfg54+JJpDJsgg7ZPpioDZkvpjVJssGEHHUtxrP1+DnkdK0+IoE3
         GnS6hMhUSsSuy6HUumCDZPtXqjCR0uxOroDOVuEnXyOx+HTrc02kOSFkjAD8Y74B2cga
         sWEtImRT8SQrhUDN3NJldtmbXfnQwW8GwHQJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773362; x=1768378162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W2h3m2Rku7a5s3v2e8aONDlqWcxyMQ4RH1rnZ71qmzY=;
        b=gftAKZCrLSNcGqEwLegfZV9Cv+/wZjehES1tqa4dGMGEQMyOdXVeg62AHFlYbYWj0R
         3zR4BgtjAvs8gctEYCT72jMDM9ThLcAB7nqlkCNMI96JToalnb9ZGBQXTJ/UV4JNeWtw
         nObp1VUmnok4nntvQhb+JrTwy0W0QfBIuJ+QZ2sn8t30D4kpFgp1jiYVTj//IuHzCDA/
         HYlO3yAdeQikkef9IM9EPTjqVI7RYjw1XtBnKGFmRv2N+9ITvVJ3+ojEW8F9Yb2R43KZ
         BOyGdO7EhxOk6zR/J57q/g8mzOumDHmFDFggqrtKXOaSNgNqqAmiu4H67PTwKwtYyMLA
         ozlg==
X-Gm-Message-State: AOJu0YwaE5/Xg/of2AwUqaQcMni2lenDaOSZkuQ/ym6xRztO74zFDxXD
	CAW5687AELYCdYeVKPrfNzDhzBLPsgIarqfq2RizENcKCU/DSYF5cDprXq7oHoOCY3eWzKuUYIy
	yFfmI
X-Gm-Gg: AY/fxX5o1pwARwl9BGpBvNkVQGdbNuiJMO06rkareLQZ82kZCBQqNs0b19KsH05C4ME
	YRpuZ+1xvj3s2MW8zVsq5Olhw5jK0M5rDTUR96aB4RnxtpN79icyZ4XEhAq5y4/uEa19I3ax0p1
	9lAAy6eSfzPCHorplBw57mVqAMx5tD+ZAEXA5DP8z8JfEV9FpOh1kJ9P+7fagDoAx8TAvySnIiQ
	5/CtuEgew9Ec/mEBspZV9GnUfFZOpBA/Wqe9qQS81h0yB+6lll1wy4/Vxa8kWof0InZ1tdqmODd
	j/Xnh9nj9FjAb2APTNWMmIvvtv0TwZkMuF9usj46X+mSyAAb3uJT6lwDS0I7BZrCPvjrCL23k5g
	yO/bEN43m1gwwtcUwkMgrE+H70s93/kKZMDFyXjVRTIR88AY3ZaEpcC6vupkyREAwcff6J/uHZf
	w552AYdUNmP5tYOzml6M+dFtCxt2wefZBA8m6BBFVtIgQR3lrLELx8KmTc5tZ3k9sm3LB3smxGD
	XM3ucOaTVIbtW8=
X-Google-Smtp-Source: AGHT+IE2ch1jK03rwQQVt4H7AFAHU5jqrD4jxAgFSWaVxCopjiQV/Ex4gn0wuYQ9LsxbidqIMCu5VQ==
X-Received: by 2002:a05:600c:3b15:b0:477:c71:1fc1 with SMTP id 5b1f17b1804b1-47d84b33ba2mr14393185e9.19.1767773361524;
        Wed, 07 Jan 2026 00:09:21 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8715b5f7sm6093485e9.4.2026.01.07.00.09.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:09:21 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 01/11] dropbear: patch CVE-2019-6111
Date: Wed,  7 Jan 2026 09:08:50 +0100
Message-ID: <e69f69e24d1be93d85d079d03463df958337823b.1767772757.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1767772757.git.yoann.congal@smile.fr>
References: <cover.1767772757.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 08:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228948

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

