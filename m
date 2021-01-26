Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web09.12875.1611672179848515120
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:42:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=pFY11SSO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id n10so11546397pgl.10
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4tuP/a59Jaf6wKscwMOB/+brrjAJ6ErkBJPUFFA76GY=;
        b=pFY11SSO93csgBjPBLxEEbn2YXlsO2tOj+IAdQaLexPmhY/xTwBsyDMgoOg+16gr3v
         vNX+EPRRZV+lkmhrbe6V8Xr5DvXMQiaZBROOldIKJuoI1WNzupjYv1ZSuaJdc3X1ZWUg
         LNSJwH0LxGTJ0Sce10N+YtCBuSoNGfZeEiNwU5PlkCZTtC8ZE8v7W6bT9gonL7lSnakG
         qgmW/uz/VVAej1lUvADjdMVe1MDYbBCnfM+1i2gKDuGcE+oRNrNqhaXAlwHX2uxbU9Nd
         yo9SmMT+OxYJGbNeMRhQ/cMkTSXo4arh35NqExNSGTluwQbfkf83TQgGthi2ZY844hyu
         LsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4tuP/a59Jaf6wKscwMOB/+brrjAJ6ErkBJPUFFA76GY=;
        b=YfG0nrDAVb0c3t146HTPyhRqK8VVtp0ieCL9eq4snT82u0FjIUU5y17FHdAqPPZClP
         9Q/YxAY+ZL/O/UZwYVSPnc8Df+LoS/H2jBYuvnGGgLv9crBNeOb6eRLC7grKk6281/g1
         Ir+86TAdXlFTEpN04fPJzVZJ2UyVtlCQfJiweWGkHWSrjBXJS716PFUaH+RnDq52C1tl
         LqHQd3JLWcQxXMHnRUOIklQ6yAFIvFLiVdJq8yDwoug2zbexVNwxG6nrzwJIh/onINMI
         AkxMpAyXz/6RHQ/1BJLf1DZvJFeHVJb7DrbSyw9mS/bgUQ1Rmtjrk4MJXkNFs0ibHXmB
         7fQg==
X-Gm-Message-State: AOAM5303x7YL5GAT/2/nWxz2/9v5eaUNOy4PEeIJmdqvFDQ08JDYCvXJ
	hchMBXxN32jH81jxwUU1UqiMxv+NZ0xO77i6Syo=
X-Google-Smtp-Source: ABdhPJzdr/Kz41GHQMwPzyOIsbQT/38ZQEmu2Ybg70E+jNSQgfv84NrraP0So/LksGXXrgrQlQO0vw==
X-Received: by 2002:aa7:9a48:0:b029:1b7:bb17:38c9 with SMTP id x8-20020aa79a480000b02901b7bb1738c9mr5573145pfj.51.1611672178918;
        Tue, 26 Jan 2021 06:42:58 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.42.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:42:58 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 17/46] pseudo: Fix statx function usage
Date: Tue, 26 Jan 2021 04:41:28 -1000
Message-Id: <f13fe2e1598614209c9c71099637ad4a22d82419.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
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

