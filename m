Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.11991.1613064156493650361
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 09:22:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aCiaIQLM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id v15so4947807wrx.4
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 09:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tu2Xv4phJQRTiJm2Kor4U+fMtEtAjhsvjTjN7DBQR6I=;
        b=aCiaIQLM7rc1YTNEvqre2OJhHvGDyYsTqYU+jSFkecMX/uPuVBxwvXyhuuxXc27pXI
         +8glwNTjJFmWXP71hgpBowCp7jwdhAUDo/+QFrFsrH2VqcCoh+0H/Py0m6uidKm4IZb9
         QZuKXB8Msdao91IAkvkV609QuITuacuJkhtj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tu2Xv4phJQRTiJm2Kor4U+fMtEtAjhsvjTjN7DBQR6I=;
        b=muPlnZ07WZCW0/fCgOK0tM3EFB3ywpLc/Yyg4/17kvLhQIB0pg4z2Dbdc/22Sa1Ggf
         gQ9ObYC2sZyXwT+1Va5IXR/3kG6LMeNwZqm7GTTTyVKmAMELBU2yzIWhAYnqKB2Idb7L
         rRwXvPRIckcuQgta8O1mo0rcrbUXi11iuif1NiyENSbDHFBeghjfIaDgNUNqPyXmEozj
         NW+fDXVmaf3/BeaTO9bynscRQ8/q8ptItAnCSNDljs1exbo03DdVNzobHKI36AW3Q+ZB
         dX6e6CEfhE1AzSKS5cznrol0D5akfFCP6iZKCske5cWN2iIiV5hCTF/+RQzDkxyK8Wou
         z13A==
X-Gm-Message-State: AOAM531Nhf47WNo1Jhc8NppYOVDZ87hV631uLtkwdbonqyGaq344UkLR
	lQ46qC8VxIvbgZeimqVgeJiGn1KCZw0XWA==
X-Google-Smtp-Source: ABdhPJxIQvQdfAXPz/Dmqtfte6ztEFnrc+htcgKSWn7w30hxWHE11si3A65vkHNObVIWUOb9z8lEkg==
X-Received: by 2002:a05:6000:152:: with SMTP id r18mr6602840wrx.226.1613064154983;
        Thu, 11 Feb 2021 09:22:34 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1f44:6379:818:1e61])
        by smtp.gmail.com with ESMTPSA id 36sm6727836wrj.97.2021.02.11.09.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 09:22:34 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH 2/3] ports/unix: Add faccessat and faccessat2
Date: Thu, 11 Feb 2021 17:22:32 +0000
Message-Id: <20210211172233.1887023-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210211172233.1887023-1-richard.purdie@linuxfoundation.org>
References: <20210211172233.1887023-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add wrappers for the faccessat and faccessat2 glibc functions matching
the way access.c works. faccessat2 was added in glibc 2.33.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ports/unix/guts/faccessat.c  | 15 ++++++++++++
 ports/unix/guts/faccessat2.c | 46 ++++++++++++++++++++++++++++++++++++
 ports/unix/wrapfuncs.in      |  2 ++
 3 files changed, 63 insertions(+)
 create mode 100644 ports/unix/guts/faccessat.c
 create mode 100644 ports/unix/guts/faccessat2.c

diff --git a/ports/unix/guts/faccessat.c b/ports/unix/guts/faccessat.c
new file mode 100644
index 0000000..02515ee
--- /dev/null
+++ b/ports/unix/guts/faccessat.c
@@ -0,0 +1,15 @@
+/* 
+ * Copyright (c) 2021, Linux Foundation; see
+ * guts/COPYRIGHT for information.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-only
+ *
+ * static int
+ * wrap_fsaccessat(int dirfd, const char *path, int mode, int flags) {
+ *	int rc = -1;
+ */
+	rc = wrap_faccessat2(dirfd, path, mode, flags);
+
+/*	return rc;
+ * }
+ */
diff --git a/ports/unix/guts/faccessat2.c b/ports/unix/guts/faccessat2.c
new file mode 100644
index 0000000..1283cc6
--- /dev/null
+++ b/ports/unix/guts/faccessat2.c
@@ -0,0 +1,46 @@
+/* 
+ * Copyright (c) 2021, Linux Foundation; see
+ * guts/COPYRIGHT for information.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-only
+ *
+ * static int
+ * wrap_fsaccessat2(int dirfd, const char *path, int mode, int flags) {
+ *	int rc = -1;
+ */
+	PSEUDO_STATBUF buf;
+
+#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
+	if (dirfd != AT_FDCWD) {
+		errno = ENOSYS;
+		return -1;
+	}
+	if (flags & AT_SYMLINK_NOFOLLOW) {
+		rc = base_lstat(path, &buf);
+	} else {
+		rc = base_stat(path, &buf);
+	}
+#else
+	rc = base_fstatat(dirfd, path, &buf, flags & AT_SYMLINK_NOFOLLOW);
+#endif
+	if (rc == -1)
+		return rc;
+
+	/* note:  no attempt to handle the case where user isn't
+	 * root.
+	 */
+
+	if (mode & X_OK) {
+		if (buf.st_mode & 0111) {
+			return 0;
+		} else {
+			errno = EACCES;
+			return -1;
+		}
+	} else {
+		return 0;
+	}
+
+/*	return rc;
+ * }
+ */
diff --git a/ports/unix/wrapfuncs.in b/ports/unix/wrapfuncs.in
index bd2706f..7724fc7 100644
--- a/ports/unix/wrapfuncs.in
+++ b/ports/unix/wrapfuncs.in
@@ -10,6 +10,8 @@ int dup(int fd); /* noignore_path=1 */
 int chdir(const char *path); /* noignore_path=1 */
 int fchdir(int dirfd); /* noignore_path=1 */
 int access(const char *path, int mode);
+int faccessat(int dirfd, const char *path, int mode, int flags);
+int faccessat2(int dirfd, const char *path, int mode, int flags);
 FTS *fts_open(char * const *path_argv, int options, int (*compar)(const FTSENT **, const FTSENT **)); /* inode64=1 */
 int ftw(const char *path, int (*fn)(const char *, const struct stat *, int), int nopenfd);
 int nftw(const char *path, int (*fn)(const char *, const struct stat *, int, struct FTW *), int nopenfd, int flag);
-- 
2.27.0

