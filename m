Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id CAF837F990
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 20:04:45 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c17so3862831wmk.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 12:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WbkwybNdO+TAtk64V1OM+RE32Tfed8mHF0ACRsoSpA0=;
	b=VlyTIs31SPn1KzNJvxpi/0hJXIYpoVlos0VYmMsdDof2ojx4s6oDrlH+DzUhVTotAS
	ajSVZBlfo0UwVcjvPSGGo2Uy4QyvnPxzlk71kxpGmZ+IogtE3oSzBNmrcEgSFEf5VSx+
	Lgod9T4ugA662gnQiOTmZ567Ifi59mJb3tc4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WbkwybNdO+TAtk64V1OM+RE32Tfed8mHF0ACRsoSpA0=;
	b=OuKyP+QLSf+TibzkKKOUx+9IwiCLZcE9VuCF1Aa99u5ghSwFkBcpYGYGmCLkYvYL8R
	S6NrmggJ3VGLHqK5xyC3tXes3FJZAeMh8kWLxd07H7VcTv0pVgTPvNTxcVjh91TM5JVB
	NQFvPjiXtuhXv+PhUKf9c+HnsIKVPuinx+sKiwNm1X5aB4Z4agyDJwnlSaC2rbeukW82
	GXCl3hoyvIyiQBzWvPCBs1CzOR2xYQHEcdK2RdqwiAJcMo/o3ZhyVRQeHqeqWh9ms7mu
	xbpTZQbiIPDZ1q3dzhP8KANoaul6ghLqe6CD/prMIonC9+dYT11dk0Sa7iclAGzZLHaz
	TOHQ==
X-Gm-Message-State: APjAAAVOWReAxvPqOhv2rIoxJaHhGByPe1nmGLiGvzXsCH0la1n3COUA
	b8KktZ3Xs9XynHbrxYuUnVRAdbkMMAg=
X-Google-Smtp-Source: APXvYqxbKo2gKvyl2OQos7EtqCBRRW4qEe/EX4efPvxGrinLzLCwNDmr4epby89bcqcrCMO5qTDmCA==
X-Received: by 2002:a1c:7f94:: with SMTP id a142mr4522238wmd.33.1573157085864; 
	Thu, 07 Nov 2019 12:04:45 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g8sm3432056wmk.23.2019.11.07.12.04.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 12:04:45 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 20:04:44 +0000
Message-Id: <20191107200444.22913-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] pseudo: Add statx support to fix fedora30 issues
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
X-List-Received-Date: Thu, 07 Nov 2019 20:04:46 -0000
Content-Transfer-Encoding: 8bit

Modern distros (e.g. fedora30) are starting to use the new statx() syscall through
the newly exposed glibc wrapper function in software like coreutils (e.g. the ls
command). Add support to intercept this to pseudo.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pseudo/files/0001-Add-statx.patch         | 107 ++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   1 +
 2 files changed, 108 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-Add-statx.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-Add-statx.patch b/meta/recipes-devtools/pseudo/files/0001-Add-statx.patch
new file mode 100644
index 00000000000..49abc2e0277
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-Add-statx.patch
@@ -0,0 +1,107 @@
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
+@@ -0,0 +1,43 @@
++/*
++ * Copyright (c) 2019 Linux Foundation
++ * Author: Richard Purdie
++ *
++ * SPDX-License-Identifier: LGPL-2.1-only
++ *
++ * int
++ * statx(int dirfd, const char *pathname, int flags, unsigned int mask, struct statx *statxbuf) {
++ * wrap___fxstat64(int ver, int fd, struct stat64 *buf) {
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
index 78500e1cc6d..1f2df4a427e 100644
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
2.20.1


