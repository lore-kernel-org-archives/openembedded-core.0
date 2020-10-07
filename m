Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.921.1602087621539526740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 09:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CffHY07C;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id n18so2899860wrs.5
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 09:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i/lknbSDue4+k0IvOOAdu1vYkq+ZTf9sbYdF2cVl1rM=;
        b=CffHY07CTF2SHNl7y7SbbK7vIwd0ZLrjgIgTrns2w81gzTfzMgRwGARycEhQikwUO2
         HlHb0yu7QeGzOhNPlvTXGTNrCmXdO+riaShv3AP+tqTPT2hSP/kHp4S9EVsd1OTvzcG6
         LfGvUnrzbn/H6catMHl5LJFQNyxV8T8mjtXOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i/lknbSDue4+k0IvOOAdu1vYkq+ZTf9sbYdF2cVl1rM=;
        b=XyJ/LKsnKJRJscF4bvkTKZyzlhPryiWHouq2H/kpOmyT674nNPBJVSh6DHv/RxAQ4z
         oTTVI7yjhE6tStcliYEKq2xNQ/UBmuKb3kEprR9RBcJNA7943r2J8BNXslcU7CoDDW3P
         hu30d2N7BWLveyOLr7L5h1ZteTgvvm68FY4grl17ADIp4ntWmQVU/zHUkVxPR/TmMEW1
         ExzGXwLo1jCiV+GPSffn3wDF2OlbOaiaDLJrQsdOW3XnfsaKcr1CV0vqt9RuE/xgzeK3
         EidxvRhFCrL9R9mk86lE8w6TugE+9EEBC8zOfFY9km5cuG+TNNlfqxpaRWLnt/kljM9C
         oehg==
X-Gm-Message-State: AOAM5318eAtsZ5gfZXs5WYaVVvkyScR1uyqHkGOLjkVYC3a74D8zabmG
	yrVtdMlAAMEWE7+qNW6bglo+fWZKkhNdXw==
X-Google-Smtp-Source: ABdhPJxSqJSuAlhdckncCrqGk0bU2nSpAeBz0ntM0k13Iclk9Vun/iYUD8hFUi4Y+SsGcBkJCappZQ==
X-Received: by 2002:a5d:5702:: with SMTP id a2mr4376489wrv.284.1602087619737;
        Wed, 07 Oct 2020 09:20:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id d23sm3299827wmb.6.2020.10.07.09.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 09:20:19 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH 2/2] pseudo: Fix statx function usage
Date: Wed,  7 Oct 2020 17:20:18 +0100
Message-Id: <20201007162018.3187947-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201007162018.3187947-1-richard.purdie@linuxfoundation.org>
References: <20201007162018.3187947-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is magic in the posts where specific variable names have specific
magic. For that magic to work, "path" needs to be used not "pathname" as
is currently there. Fix this, which fixes path issues on systems using
statx (Ubuntu 20.04 in particular).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pseudo/files/statxfix.patch               | 56 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/statxfix.patch

diff --git a/meta/recipes-devtools/pseudo/files/statxfix.patch b/meta/recipes-devtools/pseudo/files/statxfix.patch
new file mode 100644
index 00000000000..c47ff27f9f4
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
index 90f5cb0bcf2..626e658f65d 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://mayunlink.patch \
            file://pathfix.patch \
            file://proc.patch \
+           file://statxfix.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.25.1

