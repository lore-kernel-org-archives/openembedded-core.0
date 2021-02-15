Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.29.1613422331398946465
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 12:52:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VzyZLrNq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id x4so10529418wmi.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 12:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1xGKbMiLoI/MXmqjJMvU2Gd7eZ3/y88xAal9OZWYzx8=;
        b=VzyZLrNqQtMFb69mXn/G/oc9L0Wu1iAXX53TsBPIE1xIHMySJwApxjITbiXIwosRm0
         x6S1ewTzABBlpzkO1eWXYGfjcHXJ6kDcJIIYLsA7NUOAru+Qd6XCfgJbEsEUzXO40f2D
         Aq6kqXS4rBmq9JZqjZ5rVoE9VclGqg+nkFJmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1xGKbMiLoI/MXmqjJMvU2Gd7eZ3/y88xAal9OZWYzx8=;
        b=KyngxmFZvGruWRO5Dwtvna+cN1o766SAPIXumw1pX2yeK5SfW1rouwSJv2XYoiEhrx
         ugwYrMWUTAo4Ij6P6WgWw+X9RA4xQvqBqKIZt1A/tFYefJBVuJ9nmJcysJEBRY+hnv9/
         iRHi2Ao708zwBdCFLVw6g3SEQzOv6aGyh8b5yiiPxIdo5DWUTUwXmsxAWaWaNKeQkJWY
         4q8d75izTs1bRuyqsJRl/ZoR1awexrinNeU9MtehX1qp8vAldyi44R5iez2YLDD7YuJZ
         8Oi3lhwkaAvLnE8x4QrlzBI+/3HDV4FoaOrRkZ8zIqXQ6oaADF/t1ZKvP5DeAAwgXHof
         Ew2Q==
X-Gm-Message-State: AOAM532snx1VETlBnWpOZhnYbW7qwlyWtGa5FAYPR1eAPYph1E9o1b8c
	WuhXvNqMlyEdfKVaZk8YhtnIpfEO4nCaFw==
X-Google-Smtp-Source: ABdhPJz2ENj4A5EV9NLwlLYJ9J/tqTDKJphPF1TvoI+Lw0BShiLW9BjBssXj9KsGaS9q1Sg7L4JnEA==
X-Received: by 2002:a05:600c:4642:: with SMTP id n2mr561744wmo.49.1613422329731;
        Mon, 15 Feb 2021 12:52:09 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3015:c6e2:686f:34ff])
        by smtp.gmail.com with ESMTPSA id q2sm18706253wrx.79.2021.02.15.12.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 12:52:09 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH 1/2] ports/linux: Add wrapper for fstatat/fstatat64 in glibc 2.33
Date: Mon, 15 Feb 2021 20:52:07 +0000
Message-Id: <20210215205208.2001387-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ports/linux/guts/fstatat.c   | 15 +++++++++++++++
 ports/linux/guts/fstatat64.c | 15 +++++++++++++++
 ports/linux/wrapfuncs.in     |  2 ++
 3 files changed, 32 insertions(+)
 create mode 100644 ports/linux/guts/fstatat.c
 create mode 100644 ports/linux/guts/fstatat64.c

diff --git a/ports/linux/guts/fstatat.c b/ports/linux/guts/fstatat.c
new file mode 100644
index 0000000..3267641
--- /dev/null
+++ b/ports/linux/guts/fstatat.c
@@ -0,0 +1,15 @@
+/*
+ * Copyright (c) 2021 Linux Foundation; see
+ * guts/COPYRIGHT for information.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-only
+ *
+ * int fstatat(int dirfd, const char *path, struct stat *buf, int flags)
+ *	int rc = -1;
+ */
+
+	rc = wrap___fxstatat(_STAT_VER, dirfd, path, buf, flags);
+
+/*	return rc;
+ * }
+ */
diff --git a/ports/linux/guts/fstatat64.c b/ports/linux/guts/fstatat64.c
new file mode 100644
index 0000000..c981e14
--- /dev/null
+++ b/ports/linux/guts/fstatat64.c
@@ -0,0 +1,15 @@
+/*
+ * Copyright (c) 2021 Linux Foundation; see
+ * guts/COPYRIGHT for information.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-only
+ *
+ * int fstatat64(int dirfd, const char *path, struct stat64 *buf, int flags)
+ *	int rc = -1;
+ */
+
+	rc = wrap___fxstatat64(_STAT_VER, dirfd, path, buf, flags);
+
+/*	return rc;
+ * }
+ */
diff --git a/ports/linux/wrapfuncs.in b/ports/linux/wrapfuncs.in
index 80221fc..3824fd8 100644
--- a/ports/linux/wrapfuncs.in
+++ b/ports/linux/wrapfuncs.in
@@ -23,9 +23,11 @@ int creat64(const char *path, mode_t mode);
 int stat(const char *path, struct stat *buf); /* real_func=pseudo_stat */
 int lstat(const char *path, struct stat *buf); /* real_func=pseudo_lstat, flags=AT_SYMLINK_NOFOLLOW */
 int fstat(int fd, struct stat *buf); /* real_func=pseudo_fstat */
+int fstatat(int dirfd, const char *path, struct stat *buf, int flags);
 int stat64(const char *path, struct stat64 *buf); /* real_func=pseudo_stat64 */
 int lstat64(const char *path, struct stat64 *buf); /* real_func=pseudo_lstat64, flags=AT_SYMLINK_NOFOLLOW */
 int fstat64(int fd, struct stat64 *buf); /* real_func=pseudo_fstat64 */
+int fstatat64(int dirfd, const char *path, struct stat64 *buf, int flags);
 int __xstat64(int ver, const char *path, struct stat64 *buf);
 int __lxstat64(int ver, const char *path, struct stat64 *buf); /* flags=AT_SYMLINK_NOFOLLOW */
 int __fxstat64(int ver, int fd, struct stat64 *buf);
-- 
2.27.0

