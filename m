Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 901A57FAA8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 18:30:27 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id n13so11254047pff.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9ZIN5XDhzhdHK3s1LUFHmv1PieLVs/qbm5IjeS276XI=;
	b=srxqMQz9TJUzJXNv3hOHSsHpcHso+2CoFVe3ScvoXoiw0bmZbQlr1sIqN0su0WWqnO
	Fw3T3yA2ethUYtmQAISyWZVWuL8vh6FpYt9DAAEyWBa7DS+YMEsaB+VdQFH+eKW4wgbK
	HWYH2gR65VvjyGTvor0oifMM5xgePaDgBhLjj1uyw8EiR8DqtyEpMyJ3BkxliAAh7lEy
	q6oZtHa64UIQGpUdLNhI+BSvt+VsXW25WYXrMjP9hgjMcO2FkFnoQ57X9uMUcxHZzbhd
	262MlZ7rb2uH1LLnPhFNWcgmgVN13qELQnZuoMtZeR+CzI/4lMCGL1zSMZkln+++1zDT
	mmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9ZIN5XDhzhdHK3s1LUFHmv1PieLVs/qbm5IjeS276XI=;
	b=NBxzMESblyw3XwKpsIecrOluQiR0kkJcPt/Pex+mouq+b9hnBw0tHHv9Wm2xQNLNcy
	IN9Wxqvxuo7S2iHeg3WHcIVqu1E/21YG+/XrS0+jXijeHrF53nyfzjLMKCOnvSvpTmGq
	FaJk1FNXIvfMY3nU9X8vdfesr20qDEhnizZOwbrjn6sJlSWHOd9DJfGsCaMahl1p6wCj
	hJlbuw4LDrfnY4w7GJTebrJeKZO2d9XSkzBOSQQ/U+UUYumBoZTvSuldKM10pgwvXGUn
	9BQV5BVhQoCHRuIZ8/cec2skxEVNcfYyoQQBNmr5wkv5USei9875xH+WbkV6BuOXpWhR
	t5CQ==
X-Gm-Message-State: APjAAAWCcjDZ9hv0FvAb9Rdz6M8bQEulzf2/hhaNU6gsJrPAMEfXMx1f
	YmBB25fAuwPT4s80zd6LZZmn93wR
X-Google-Smtp-Source: APXvYqzqEs/exXTecAbYnYFZX9RkG4vJ8yK6CtTGZH/Mix3bSX6TIQh1PufbVJeSlGNRT9n2BGkMLg==
X-Received: by 2002:a63:c746:: with SMTP id v6mr13534699pgg.76.1573497028416; 
	Mon, 11 Nov 2019 10:30:28 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	l62sm17731698pgl.24.2019.11.11.10.30.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 10:30:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 10:30:03 -0800
Message-Id: <f47017ff7f1ae1731412524768af372791068689.1573496794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573496794.git.akuster808@gmail.com>
References: <cover.1573496794.git.akuster808@gmail.com>
Subject: [zeus 21/21] pseudo: Add statx support to fix fedora30 issues
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
X-List-Received-Date: Mon, 11 Nov 2019 18:30:27 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Modern distros (e.g. fedora30) are starting to use the new statx() syscall through
the newly exposed glibc wrapper function in software like coreutils (e.g. the ls
command). Add support to intercept this to pseudo.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../pseudo/files/0001-Add-statx.patch              | 106 +++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb         |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-Add-statx.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-Add-statx.patch b/meta/recipes-devtools/pseudo/files/0001-Add-statx.patch
new file mode 100644
index 0000000..f01e699
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-Add-statx.patch
@@ -0,0 +1,106 @@
+From 4e41a05de1f34ba00a68ca4f20fb49c4d1cbd2d0 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 6 Nov 2019 12:17:46 +0000
+Subject: [PATCH] Add statx glibc/syscall support
+
+Modern distros (e.g. fedora30) are starting to use the new statx() syscall through
+the newly exposed glibc wrapper function in software like coreutils (e.g. the ls
+command). Add support to intercept this to pseudo.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Submitted [Emailed to seebs]
+---
+ ports/linux/guts/statx.c | 48 ++++++++++++++++++++++++++++++++++++++++
+ ports/linux/portdefs.h   |  1 +
+ ports/linux/wrapfuncs.in |  1 +
+ 3 files changed, 50 insertions(+)
+ create mode 100644 ports/linux/guts/statx.c
+
+diff --git a/ports/linux/statx/guts/statx.c b/ports/linux/statx/guts/statx.c
+new file mode 100644
+index 0000000..a3259c4
+--- /dev/null
++++ b/ports/linux/statx/guts/statx.c
+@@ -0,0 +1,42 @@
++/*
++ * Copyright (c) 2019 Linux Foundation
++ * Author: Richard Purdie
++ *
++ * SPDX-License-Identifier: LGPL-2.1-only
++ *
++ * int
++ * statx(int dirfd, const char *pathname, int flags, unsigned int mask, struct statx *statxbuf) {
++ *	int rc = -1;
++ */
++	pseudo_msg_t *msg;
++	PSEUDO_STATBUF buf;
++	int save_errno;
++
++	rc = real_statx(dirfd, pathname, flags, mask, statxbuf);
++	save_errno = errno;
++	if (rc == -1) {
++		return rc;
++	}
++
++	buf.st_uid = statxbuf->stx_uid;
++	buf.st_gid = statxbuf->stx_gid;
++	buf.st_dev = makedev(statxbuf->stx_dev_major, statxbuf->stx_dev_minor);
++	buf.st_ino = statxbuf->stx_ino;
++	buf.st_mode = statxbuf->stx_mode;
++	buf.st_rdev = makedev(statxbuf->stx_rdev_major, statxbuf->stx_rdev_minor);
++	buf.st_nlink = statxbuf->stx_nlink;
++	msg = pseudo_client_op(OP_STAT, 0, -1, dirfd, pathname, &buf);
++	if (msg && msg->result == RESULT_SUCCEED) {
++		pseudo_debug(PDBGF_FILE, "statx(path %s), flags %o, stat rc %d, stat uid %o\n", pathname, flags, rc, statxbuf->stx_uid);
++		statxbuf->stx_uid = msg->uid;
++		statxbuf->stx_gid = msg->gid;
++		statxbuf->stx_mode = msg->mode;
++		statxbuf->stx_rdev_major = major(msg->rdev);
++		statxbuf->stx_rdev_minor = minor(msg->rdev);
++	} else {
++		pseudo_debug(PDBGF_FILE, "statx(path %s) failed, flags %o, stat rc %d, stat uid %o\n", pathname, flags, rc, statxbuf->stx_uid);
++	}
++	errno = save_errno;
++/*	return rc;
++ * }
++ */
+diff --git a/ports/linux/statx/portdefs.h b/ports/linux/statx/portdefs.h
+new file mode 100644
+index 0000000..bf934dc
+--- /dev/null
++++ b/ports/linux/statx/portdefs.h
+@@ -0,0 +1,6 @@
++/*
++ * SPDX-License-Identifier: LGPL-2.1-only
++ *
++ */
++#include <sys/stat.h>
++#include <sys/sysmacros.h>
+diff --git a/ports/linux/statx/wrapfuncs.in b/ports/linux/statx/wrapfuncs.in
+new file mode 100644
+index 0000000..c9cd4c3
+--- /dev/null
++++ b/ports/linux/statx/wrapfuncs.in
+@@ -0,0 +1 @@
++int statx(int dirfd, const char *pathname, int flags, unsigned int mask, struct statx *statxbuf);
+diff --git a/ports/linux/subports b/ports/linux/subports
+index a29044a..49081bf 100755
+--- a/ports/linux/subports
++++ b/ports/linux/subports
+@@ -54,3 +54,13 @@ else
+ fi
+ rm -f dummy.c dummy.o
+ 
++cat > dummy.c <<EOF
++#define _GNU_SOURCE
++#include <sys/stat.h>
++struct statx x;
++EOF
++if ${CC} -c -o dummy.o dummy.c >/dev/null 2>&1; then
++	echo "linux/statx"
++fi
++rm -f dummy.c dummy.o
++
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 78500e1..1f2df4a 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -7,6 +7,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://moreretries.patch \
            file://toomanyfiles.patch \
            file://0001-maketables-wrappers-use-Python-3.patch \
+           file://0001-Add-statx.patch \
            "
 
 SRCREV = "060058bb29f70b244e685b3c704eb0641b736f73"
-- 
2.7.4


