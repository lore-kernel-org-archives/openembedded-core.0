Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278E6D2ED18
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:16 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6471.1768916291538859239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3glzAVC4;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so62781495e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916290; x=1769521090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NDGt7pcwg+CwOEegK1tOLmV8jBqcQqJJcXmNG7fKnU=;
        b=3glzAVC4aRU5hStcaI3r98jYG3f6NAyKxt5ZTlk+rDk3IFPrjVmVIE5fP5oprDL2U1
         RGt9sZ2KurJCZ1opSSINp6dkMtXwz+qsq1L9n3W+RgVp8YKqBkqQF2Xn2GYpWMN59kLg
         6Ewtf0yJR0zAB5vl0Ttmox9vnGxUjtUY0hCqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916290; x=1769521090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2NDGt7pcwg+CwOEegK1tOLmV8jBqcQqJJcXmNG7fKnU=;
        b=VFA0hqjuOiZZE0VYKa909qkrBB5Vp10+LoYLzltsNTpoIMd1xtoPHydWRkbL/DurLr
         eW9hXGRgfGmWG0w5a3SARtH5dVIyqc0e1kdi3BwcQfu1zYNbWRrF+2wVIVQsqoKTPf/J
         M1y2Uj3qp6DxCnK/n8ZN6fLp9fJ2nAk+Dfrr+hH3n1fGLdDc+4AYbhnHQ/VkdDDA6yWd
         TcwtNYwmgDPgJ2wADcAbK+jDRkeQ38n7dw8Igkj9l7/P6oRPuohidQ7XQ9dDNKfTrOTD
         gr4T4j9ctuq+Ivy58tXAipKqePec+QGYmjwQHFjUM4Ml9N6J0y6jXEZb7KSDZ9Bl2Zpm
         psog==
X-Gm-Message-State: AOJu0Ywa/FwI1lEWCloLRzPMgjVxAdiVV06CTXuLeURATGZowEoLrR9n
	HsmkE5IWyXGbwPfjltqvlTHqh495u5lCp7Lw1eP9/jhjyddUztQxNGppBOJxMiGoAh0fXrNHBzf
	W306m
X-Gm-Gg: AY/fxX4g6400OwWR6E8I/K05e4sV3EB7h1igWau3tFFD6ztnycSAmvKGRXjyBmPhpH5
	wQrHEZ7WuJMSYhPSfK23Lfqn1XaGksNYcVlBvwOsGsf9Cn/2TSDXxoljeT68YG/NBz8qXfKC0bH
	9pCKd67P5KeI8ugmlZwIk4sAbNY8UqHE8br6EWTFjuI0R7x4kyHDwtwFyEtmmQc5cSAmR8QvZO6
	zRda0OtE5kJfNxq24+Qf/jQq/ufZccqYulRVBs9R2rP7QvXFWPeFHHnIF9JpFG98ZWQYBaBdg9j
	J/gP7k6phYdQoTMEtQ+2dAgTwPI/Nmg2igUAgqdI+rB64EP6VhGyRyYQUYv/SicblK4G3eWfj/N
	E7JIBjzC/4Lr5Xw8tRzl/ewgXYew3oy5KZziFdtoIxMUCSn4NX2ikHyocbbWSuN8Vl/sj3Zy3n9
	O8WQA8mYcRmC+W7wocwX770EgO4mC5D9fwklu6ct+ElxLaseyIY1EEz61oRuZbmSGin7obvrTdV
	wGzcsN6pNTWh3F5sdrOSQ==
X-Received: by 2002:a05:600c:620e:b0:47d:73a4:45a7 with SMTP id 5b1f17b1804b1-4803e7e7d75mr25697965e9.24.1768916289585;
        Tue, 20 Jan 2026 05:38:09 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:09 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/26] dropbear: patch CVE-2019-6111
Date: Tue, 20 Jan 2026 14:37:31 +0100
Message-ID: <ef55bbbb8d0f375b65b60cee5b1aa7996cd1e476.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229715

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioning this CVE number.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/dropbear/dropbear.inc       |   1 +
 .../dropbear/dropbear/CVE-2019-6111.patch     | 157 ++++++++++++++++++
 2 files changed, 158 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 94059df258..cebb1e49c9 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -34,6 +34,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://0001-Add-m_snprintf-that-won-t-return-negative.patch \
            file://0001-Handle-arbitrary-length-paths-and-commands-in-multih.patch \
            file://CVE-2025-47203.patch \
+           file://CVE-2019-6111.patch \
 	   "
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2019-6111.patch b/meta/recipes-core/dropbear/dropbear/CVE-2019-6111.patch
new file mode 100644
index 0000000000..84224a5f57
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
+@@ -590,7 +595,7 @@ tolocal(int argc, char **argv)
+ 			continue;
+ 		}
+ 		xfree(bp);
+-		sink(1, argv + argc - 1);
++		sink(1, argv + argc - 1, src);
+ 		(void) close(remin);
+ 		remin = remout = -1;
+ 	}
+@@ -823,7 +828,7 @@ bwlimit(int amount)
+ }
+ 
+ void
+-sink(int argc, char **argv)
++sink(int argc, char **argv, const char *src)
+ {
+ 	static BUF buffer;
+ 	struct stat stb;
+@@ -837,6 +842,7 @@ sink(int argc, char **argv)
+ 	off_t size, statbytes;
+ 	int setimes, targisdir, wrerrno = 0;
+ 	char ch, *cp, *np, *targ, *why, *vect[1], buf[2048];
++	char *src_copy = NULL, *restrict_pattern = NULL;
+ 	struct timeval tv[2];
+ 
+ #define	atime	tv[0]
+@@ -858,6 +864,17 @@ sink(int argc, char **argv)
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
+@@ -940,6 +957,9 @@ sink(int argc, char **argv)
+ 			run_err("error: unexpected filename: %s", cp);
+ 			exit(1);
+ 		}
++		if (restrict_pattern != NULL &&
++		    fnmatch(restrict_pattern, cp, 0) != 0)
++			SCREWUP("filename does not match request");
+ 		if (targisdir) {
+ 			static char *namebuf = NULL;
+ 			static size_t cursize = 0;
+@@ -978,7 +998,7 @@ sink(int argc, char **argv)
+ 					goto bad;
+ 			}
+ 			vect[0] = xstrdup(np);
+-			sink(1, vect);
++			sink(1, vect, src);
+ 			if (setimes) {
+ 				setimes = 0;
+ 				if (utimes(vect[0], tv) < 0)

