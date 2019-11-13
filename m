Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 431527F43D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:20:08 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id p26so1866913pfq.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fJbYuqd4bNUjDoumyybIf4rd0vi2vpQPAkgcdvpSVlc=;
	b=bhsbxBEfjz0KzuFxy7X7LAMZ1WzxaJaUCP6NTDZUD6dWWebcAm2yU2046Al2lD9yra
	4Jx00IUaBfTp7yJAQuwRggQBdQ74vF0UEz3UXNywzfilo/l5JCysgjZQrVg9iQh8JTZE
	OfHDsMDwNumrvuV1Quo9LV16CuQU57pITwUfAdMTpurit9C/DI7+awMnAZQBpxP9LNvK
	CSTO+/gfJ5aAtEs/kN+2AAJ3A+YUd4PA43nBwEAfNLXV3WAf1C1tsEV7FA1G+oK2zpc9
	I3gtQEWCgAD9V9ueQlPTS2RPG2Yzd5NvAEArMV0WxUxgV/WwcJvMQKiz6uWps+LTAt9c
	Li4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fJbYuqd4bNUjDoumyybIf4rd0vi2vpQPAkgcdvpSVlc=;
	b=CxShkl06onMLUVKJhJZN7r5GyHzZbCSWSnORTzYT71/jGT0/taAG3sQ38wSRV6pc+E
	yC3Q1Jf1Qr2i/7sxLmZ+rMqoa2rVTIM2QQGxD8CtHi2IsmG7OOq8VKyQaDhCXQrI7YG1
	X3RlAWRnPp1qNcTamydKjoMIXI3lDr1zd+IeW5jctg/Nh8cJsJ2TU3rd3ayIbWO7S2FZ
	6HGkeuMF6pEgG3GIrX6hd+59ckADH8WNjqUiGBc3s451a6m+XlAjjQN0u4SoSNyWc99S
	IToWVVsC4tatuq19y18Ot+bAg8E8yi8KCOUu/ii+WO+2x2YYf9pmWnm7YeH2mVUoFzSc
	H/QA==
X-Gm-Message-State: APjAAAVRWbiEYoOC/ipvyZEutV+ZyqrzDQJAT9W01XmGSLGytCppZJph
	sSNZuPPz7nRBp0RamL23keUTv9jx
X-Google-Smtp-Source: APXvYqx8/lR0dMyO4bJBlJ1pLCDTMJqyF9le9KyL+tqTyxzlpXpvD49HlG9zbJBpdDU94FIp4mcG7w==
X-Received: by 2002:a17:90a:fa96:: with SMTP id
	cu22mr5634406pjb.121.1573658409081; 
	Wed, 13 Nov 2019 07:20:09 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.20.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:20:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:26 -0800
Message-Id: <1c09e45f966d553f1fea3795ef9122dd9957be67.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 23/25] pseudo: Add statx support to fix fedora30 issues
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
X-List-Received-Date: Wed, 13 Nov 2019 15:20:08 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Modern distros (e.g. fedora30) are starting to use the new statx() syscall through
the newly exposed glibc wrapper function in software like coreutils (e.g. the ls
command). Add support to intercept this to pseudo.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Fixup for warrior context]
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
index 6cf711e..7db5baf 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,6 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
            file://fallback-group \
            file://moreretries.patch \
            file://toomanyfiles.patch \
+           file://0001-Add-statx.patch \
            "
 
 SRCREV = "060058bb29f70b244e685b3c704eb0641b736f73"
-- 
2.7.4


