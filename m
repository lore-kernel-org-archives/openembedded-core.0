Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id D24167F8AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:55 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d7so1221357pls.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9ZIN5XDhzhdHK3s1LUFHmv1PieLVs/qbm5IjeS276XI=;
	b=aNt528fAqueUT3h/rOi1dD2cVHZ0NaPTPx58m/RE4AxPJou5G0ziKhw8zpb7UVSDPL
	LJw7HPYa5ISYQDb8oOY8IJJNsRXDXn/NVk7fBmQsN+WV8MtQ9NmG24SsUN5cbIKpjrb0
	diyxq1lSVFg9fQhfTJI6XHv+JmiBFHmFBtVRpytsVo91GBu82seV9YQq1+zw8xx9yEvd
	7QW0nPuRk+lxushoeThSKuOL5oErk06rW+zErEYKtkyUWbQ2PhKABHD5oYNVCKVaYLhN
	YD0kmY65vyOv2K2xK0uDehsF1/cSauiSzmo+lX2ijUBthBNFpxU7z2QhGktFgZoxKvMB
	FYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9ZIN5XDhzhdHK3s1LUFHmv1PieLVs/qbm5IjeS276XI=;
	b=o7GKR/dx3tXEXgc+E7vVfPGRrg37d1YCl5boIDhY76o7Wl2vVETBdPzioD+IJLDWPe
	W/BEcaumfsF8Aw5AgUV3kT041DgEDMaVd7G0EjijOmtxjosP8oG+hMG7YRTFEp0bGleD
	SH1y/x5Lyz+JHZuFbW9lM+kQcWDekvsdCmPUpcfekm8pjCLPro+AWQ7w49IW+VIzdjBh
	rZeqQW95Q66Ba0XeLjtMKYoL2sI7TlNC7lnJd3Zj6CR32MrwzfJg+MMrAeTZXhaZdzXm
	7MJHFMxWNdUkAgVLO+KwtdFsfcZHCZOZdotz3ynCIr7vx9YcC7QWse8zOyys4nE/p+3c
	dS1Q==
X-Gm-Message-State: APjAAAUo48VZ7wOOsR24Up7eGQCMdUQ76nhHRXSMrxVqslySLiEPxeNp
	K8JH7xMb4wFFQqMuVS64OkWmQ8xl
X-Google-Smtp-Source: APXvYqzMVd7xneYJgXlSDF6nQFkwkiHpeErD8mZfIXYJ2InKo2U60tqgy9FI5j7g5IQAQ4KrqdfZuA==
X-Received: by 2002:a17:902:ff06:: with SMTP id
	f6mr4338404plj.65.1573659176624; 
	Wed, 13 Nov 2019 07:32:56 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:32:13 -0800
Message-Id: <f47017ff7f1ae1731412524768af372791068689.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 31/31] pseudo: Add statx support to fix fedora30 issues
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:56 -0000

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


