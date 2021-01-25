Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.347.1611586352675965893
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:52:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VQBM9GDE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id j12so8495684pfj.12
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4tuP/a59Jaf6wKscwMOB/+brrjAJ6ErkBJPUFFA76GY=;
        b=VQBM9GDE8taMCDZrvzfSbYcQWBm4aj5rf/pPdJjU6EdQVL9+CO3gBDa2OJpH44T7Te
         HZ3cpNROIhk4Ho8WGnJPWjK6X1RH8WxQp/vIJG8ApGNDefatd2nbzoNZfW0fL0J0YNd2
         N7f+kzW7HrLAhLLrU5Oh+elAKUFEMf0gBcqngftvbbVaIFSbukQehjeLVMo+jT5NVA5y
         fPRGCFtmKymdqScjuz6qG3bVQ07xPOtZMelfyXbF05W8bZsLZZhh8bQWxTItCm/axhGF
         nHcJ/R5qPhg8oRagjXPyGvzFZYv+qQXlh8wUNGNH4M5VvjA3MWshQzisp9/Qybrczmu0
         CBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4tuP/a59Jaf6wKscwMOB/+brrjAJ6ErkBJPUFFA76GY=;
        b=G+mCUtYEZ1mOyOVzfr8XwTB8pQintvHmTUjl+x7h2gUdIzFmh22bEUyd/BViqYd5ne
         LfwHB7AIu5Sth2a1wpb6YJdIohKTruYYHly2kUkO9N8fLwC9TNEst+0BsG8/MTCt/ex/
         5UyjP4hlGbiH/AyGSsLKakIuqT/7S/skZFxg4385sz7Jn0nvkk/4LAl6vEkmvCdJ1lhZ
         2dprvimSokoDHe7jJgXeZaPFmh7GK/NKOsoCfl9PGk85W2/3b6fXWdEIBj/0ozS1Zn2Z
         BgIi6yMVyxVPXphG8ES3tnqBSVJKhY1oU/1OpLyL7EuVAzoK7Fe++EXWYMBkOcsNrWTo
         kRpA==
X-Gm-Message-State: AOAM531EL2h6CHxeY3qnC7DY8vmQqP2ykbDqBRMslbWGjQvlsxYzphIf
	yFMAYZidDxxy/yl1BkXHyp/wRfEBt7M/gG882QM=
X-Google-Smtp-Source: ABdhPJyPl4QB+4MMX24BRHGT94UjEtrTDu/2OSZiGgA8OVloTIbhipUlIq5qDg7wu/pdQZw9aOQNpg==
X-Received: by 2002:aa7:842b:0:b029:1bf:3390:5c82 with SMTP id q11-20020aa7842b0000b02901bf33905c82mr804928pfn.36.1611586351742;
        Mon, 25 Jan 2021 06:52:31 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.52.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:52:31 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/47] pseudo: Fix statx function usage
Date: Mon, 25 Jan 2021 04:50:50 -1000
Message-Id: <1b9737bf9ae8a621ebe018710c3dba2d058e2207.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There is magic in the posts where specific variable names have specific
magic. For that magic to work, "path" needs to be used not "pathname" as
is currently there. Fix this, which fixes path issues on systems using
statx (Ubuntu 20.04 in particular).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f9ae80aee98a7bb59c83ac9ebf9d317302507cec)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pseudo/files/statxfix.patch               | 56 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/statxfix.patch

diff --git a/meta/recipes-devtools/pseudo/files/statxfix.patch b/meta/recipes-devtools/pseudo/files/statxfix.patch
new file mode 100644
index 0000000000..c47ff27f9f
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/statxfix.patch
@@ -0,0 +1,56 @@
+There is magic in the posts where specific variable names have specific
+magic. For that magic to work, "path" needs to be used not "pathname" as
+is currently there. Fix this, which fixes path issues on systems using 
+statx (Ubuntu 20.04 in particular).
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: git/ports/linux/statx/guts/statx.c
+===================================================================
+--- git.orig/ports/linux/statx/guts/statx.c
++++ git/ports/linux/statx/guts/statx.c
+@@ -5,14 +5,14 @@
+  * SPDX-License-Identifier: LGPL-2.1-only
+  *
+  * int
+- * statx(int dirfd, const char *pathname, int flags, unsigned int mask, struct statx *statxbuf) {
++ * statx(int dirfd, const char *path, int flags, unsigned int mask, struct statx *statxbuf) {
+  *	int rc = -1;
+  */
+ 	pseudo_msg_t *msg;
+ 	PSEUDO_STATBUF buf;
+ 	int save_errno;
+ 
+-	rc = real_statx(dirfd, pathname, flags, mask, statxbuf);
++	rc = real_statx(dirfd, path, flags, mask, statxbuf);
+ 	save_errno = errno;
+ 	if (rc == -1) {
+ 		return rc;
+@@ -25,16 +25,16 @@
+ 	buf.st_mode = statxbuf->stx_mode;
+ 	buf.st_rdev = makedev(statxbuf->stx_rdev_major, statxbuf->stx_rdev_minor);
+ 	buf.st_nlink = statxbuf->stx_nlink;
+-	msg = pseudo_client_op(OP_STAT, 0, -1, dirfd, pathname, &buf);
++	msg = pseudo_client_op(OP_STAT, 0, -1, dirfd, path, &buf);
+ 	if (msg && msg->result == RESULT_SUCCEED) {
+-		pseudo_debug(PDBGF_FILE, "statx(path %s), flags %o, stat rc %d, stat uid %o\n", pathname, flags, rc, statxbuf->stx_uid);
++		pseudo_debug(PDBGF_FILE, "statx(path %s), flags %o, stat rc %d, stat uid %o\n", path, flags, rc, statxbuf->stx_uid);
+ 		statxbuf->stx_uid = msg->uid;
+ 		statxbuf->stx_gid = msg->gid;
+ 		statxbuf->stx_mode = msg->mode;
+ 		statxbuf->stx_rdev_major = major(msg->rdev);
+ 		statxbuf->stx_rdev_minor = minor(msg->rdev);
+ 	} else {
+-		pseudo_debug(PDBGF_FILE, "statx(path %s) failed, flags %o, stat rc %d, stat uid %o\n", pathname, flags, rc, statxbuf->stx_uid);
++		pseudo_debug(PDBGF_FILE, "statx(path %s) failed, flags %o, stat rc %d, stat uid %o\n", path, flags, rc, statxbuf->stx_uid);
+ 	}
+ 	errno = save_errno;
+ /*	return rc;
+Index: git/ports/linux/statx/wrapfuncs.in
+===================================================================
+--- git.orig/ports/linux/statx/wrapfuncs.in
++++ git/ports/linux/statx/wrapfuncs.in
+@@ -1 +1 @@
+-int statx(int dirfd, const char *pathname, int flags, unsigned int mask, struct statx *statxbuf);
++int statx(int dirfd, const char *path, int flags, unsigned int mask, struct statx *statxbuf);
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index bc20a2f134..c79fe92bc3 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://xattr_fix.patch \
            file://mayunlink.patch \
            file://pathfix.patch \
+           file://statxfix.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.25.1

