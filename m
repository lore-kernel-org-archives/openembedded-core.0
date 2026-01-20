Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0506FD2ED18
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:25 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5023.1768910959320155816
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WT+Wc7tW;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so61610715e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910957; x=1769515757; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WtIwrkAXe8ujFzMM9E7VPDYLbfHd62lldi4kDIDHTm8=;
        b=WT+Wc7tW/6Y1bM9aMMHeAIHSxf0+KUcj9n+278QbrGDHBvVdvuy5L7rlzN4mlsonCr
         T8TN6za/xUKqWguXCAMdJAo2KjZhyuX5UXmB+lrd5VXwMzNBgO7kbpfoXgzRNR6MiDf9
         EnU1PqfGm39GcdH+uD1QnLrDqyWlE+/aYfeuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910957; x=1769515757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WtIwrkAXe8ujFzMM9E7VPDYLbfHd62lldi4kDIDHTm8=;
        b=Kvq2bgdYOTo83DZDcMqb1NO2OnUESUWUViTe3y5aETE7IvIXNCob3LVEs2QYa2ogli
         CeDnqq65ZRBZrc/QlB4DgqrXiX45buaVsXRYd7XiCiyEoKOVjFZt8zsPkC8pl0Pcb5dB
         D3/S+zVWEOSVNfVINUbBYJLAjErDXxyL47jknS+HKEwuohW8ITunl/67Hp4KbWiaFN/7
         XLt2cko2aXPtu9iw+ujKUyIc56A+KkzmXGHROKyG44akKxDPndTOtpXJbFZJS7UpjmQi
         oe8RF25+atDzwGVg1lSCWh3adJEvHsUyJcRKA9c/ygNZXqafLS+JQvqRL0bJhKeTRsz8
         Qzvw==
X-Gm-Message-State: AOJu0YwncyU4nZTBV9guUQqlNfXsvZyZ15l48X+bC34LmETVKsaZsRRV
	psBzeljuxmZjtyL2JF7MWdsyE2yDFa8TbyPKVNP68WKN5xod+5UiRAavPEtQZmRKMZ2+FJItqGY
	CYak/
X-Gm-Gg: AZuq6aJTjiAwc5wi3nd18e1Wzd+Zs7IQhkRy3zZYGdCkg+q0tCf8KqKTdikaSV7jg9S
	IWjV8xB7x9LDYfAw8KOKdCe60A1jFHJemf13zHARnCBkfa9FwlUEim1d/zS+BTjI+ifvGwPf1hR
	wBam1YkpWihCJWAKUQql4LKQRK6RHXVGrVcWKdOg2zuQjjGhnH8iGcffjmZsWhI6o/iHsn2Xz6k
	j7T25C2Xn3bQ2qVMNMj3RsR0Jpaavk0YEf17003XgRd6TGH1oRlgAa65FKwYJuIH7FLBfjJOYLK
	jewwEr1mtkncVcVqmehyb28BH+gViZA9Pz/h4Irr2VqY6PtR/spW7MU+Tzo+tVdeMEx0bVHGV2e
	wdMCrzR3nTq1CqfnYzzDSIcMntqjiK1Oi0R3cfY5Uddoj28hSkf6Kj4jGekrFGWiMj81ZOhhO+N
	bGPsFThzIREWmFf3TUXTEQn666hKT0cVqwcziXdOSAaEj6YmK657z1S6fJp7WP8RF6MuOVoJYqJ
	1++ERBMK5qtSn/eFw5ATQ==
X-Received: by 2002:adf:ea4a:0:b0:435:96b7:e0db with SMTP id ffacd0b85a97d-43596b7e1f5mr7181f8f.17.1768910957338;
        Tue, 20 Jan 2026 04:09:17 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:17 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/22] dropbear: patch CVE-2019-6111
Date: Tue, 20 Jan 2026 13:08:22 +0100
Message-ID: <da7fc2977d0ac82306d43bb318643e3ba37fd0f9.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229686

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioning this CVE number.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dropbear/dropbear/CVE-2019-6111.patch     | 157 ++++++++++++++++++
 .../recipes-core/dropbear/dropbear_2022.83.bb |   1 +
 2 files changed, 158 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111.patch

diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2019-6111.patch b/meta/recipes-core/dropbear/dropbear/CVE-2019-6111.patch
new file mode 100644
index 0000000000..f488ff92c0
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
+ scp.c | 38 +++++++++++++++++++++++++++++---------
+ 1 file changed, 29 insertions(+), 9 deletions(-)
+
+diff --git a/scp.c b/scp.c
+index 384f2cb..bf98986 100644
+--- a/scp.c
++++ b/scp.c
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
diff --git a/meta/recipes-core/dropbear/dropbear_2022.83.bb b/meta/recipes-core/dropbear/dropbear_2022.83.bb
index 2ed8d2c2a1..93563aa3b4 100644
--- a/meta/recipes-core/dropbear/dropbear_2022.83.bb
+++ b/meta/recipes-core/dropbear/dropbear_2022.83.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://0001-cli-runopts.c-add-missing-DROPBEAR_CLI_PUBKEY_AUTH.patch \
            file://0001-Avoid-unused-variable-with-DROPBEAR_CLI_PUBKEY_AUTH-.patch \
            file://CVE-2025-47203.patch \
+           file://CVE-2019-6111.patch \
            "
 
 SRC_URI[sha256sum] = "bc5a121ffbc94b5171ad5ebe01be42746d50aa797c9549a4639894a16749443b"

