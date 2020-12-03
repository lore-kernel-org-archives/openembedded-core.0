Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.11383.1607008167948582434
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vw7bog+K;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id o7so1278312pjj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=f6kJU4px/6szsYV+XksmbiemiA/W7WwMGQDQzCPTz88=;
        b=vw7bog+K39BuFdvmtIQnxrEHBg+DTRfvzngdLdiTqSx0Ux5WH9DEjB6jJokjD3oIWa
         R8X1yJbpeWYig2naj9eI91x80ntJkhi4RNsq3MpoM3qeZd3aTBHAtIxfeKqMT+xNljzY
         HWUjNxjp5eHt2bS8y6pZ93OwbJYu/7MJqEUl5CxivhC8jUHYraxji2uzVqPnwLZkxGyC
         davsjdZZdTiun/sKEj04oM10/vjOLdh9OrRfqHid3dNvrPZdWP0HPQTl6+BKRGLqxYdk
         JxSbzvMXjmix+55zMsQtLmt31KKqS2Xn9oyQJqdfahQ0SThWBt5Xh2UNIT6IHk+FBl5i
         vHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=f6kJU4px/6szsYV+XksmbiemiA/W7WwMGQDQzCPTz88=;
        b=mE+m3fWNQaJbagT7W/5GJiIGPKmIB+qJAlbeWdr/xpvgZjdlNdq5RNMoFxpt89Tcg+
         Bs+vidZxfgsE9Pdv68cAINVBj9dGImfqEqO12HoFlEgyIv82hz0hppa3j6q9KQi8I1ie
         azAUW6CTJWoza6xVaBuI0dIL4SlnJAhTq8bB2BOeOAIuGz4kFIr+M1Rb+88B5Kxvw2qW
         62yzBsJB/PoLGlr+SzAzS8VrNyNNUaAjIr+E9xyNBHwiaMiMJJIu6UrrtEdkCWQNw8+S
         CvqMh3WLgT6vkIkmO5jxQ4IUskZV2u/YXKoBAlrU0bsHOO9U3x8sG4otYEKuvU7dsf0X
         0A9w==
X-Gm-Message-State: AOAM533cLHYhnhP5vGyPLzOkOrpQJpgV6wDWlFnCCsNMiElBpsCU7nm2
	TGMxIHsZ5UsMKvE6AapYVLn0Uom4IpCZ6Bj6
X-Google-Smtp-Source: ABdhPJyTugNa3BmW/qmAf+5x64x0euWMgl+mTFmU6Dvu6sMGElPeGilouNPZm/writr/Yq8yn+6Big==
X-Received: by 2002:a17:90a:dd46:: with SMTP id u6mr3452225pjv.162.1607008165982;
        Thu, 03 Dec 2020 07:09:25 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.09.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:09:24 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/28] pseudo: Fix statx function usage
Date: Thu,  3 Dec 2020 05:08:08 -1000
Message-Id: <52bff16a4f2b1a0a6fadeafc078e22feb45f2d9a.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

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
2.17.1

