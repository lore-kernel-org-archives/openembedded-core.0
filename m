Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.10834.1602240552628254513
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 03:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XxoUTAkx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id e18so9773883wrw.9
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 03:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r3q2ZN0VKsJ0jFYftGml2ae5By3T5mgaTwOY0gmTLHI=;
        b=XxoUTAkxWn0gX4Lk5xh16XkBRy55ADOsET3L1MMe3B3P3b0mBTgnvsO6QVD/gjYwRI
         EkAOFzj8d2M0a4uMmptROPRiYQEITP692XhRNuFf+XtUAKDjmSTN8vUdQDT3wI7T3f1a
         zM0iMmczWZ4gPxda2r7v+dUeVG36cHcdY0CSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r3q2ZN0VKsJ0jFYftGml2ae5By3T5mgaTwOY0gmTLHI=;
        b=jP0nNKpKgYWcMZVjI4/FXfpv4ZlWzmo/Yf9qSU2ac8PHe/0rF/ez/S5OhbxNSxXhVX
         2Z6GBlhpO5+zKVVk6qfHOJ66nGTbnueIStun5IaGPny/Z1xGYevV7Ve3uvByq7PATE8D
         gmy9TqJRnsXG2E+OzB3I4EzKqU2GtHDjgK+FrfzGCKqzmGpqg3q28sXbLNQY37lk4+Sb
         Ht7IuoUHQznsV+zG61ay3nH+AfsizyYKE4Uc4+8LsxsHrzWIm83gkfm/SQXG7ABMUQa2
         lfqvRgrSSqdXKSgTsFIQsNctVqvxjRZxDsoaFBP9bkwEPbLE53s5UyzZLyYE7MSk8iAy
         648g==
X-Gm-Message-State: AOAM530R4ugzoINJV3H1QT+vCslH1DRe8UvBJPitlZNzwCr+9/FSgeg/
	c4BWaVVxZPNSvk8I0SGlLFKVEN7N+KK5aA==
X-Google-Smtp-Source: ABdhPJxJfFgjNycWL8baOmC7MyxOoQUQT8/I5PyFvpRuNnPpG0J2fVruefgGwgy0OZw/1IxxwEj+mQ==
X-Received: by 2002:adf:9361:: with SMTP id 88mr13730297wro.37.1602240550715;
        Fri, 09 Oct 2020 03:49:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2c3e:e14:4ba7:4660])
        by smtp.gmail.com with ESMTPSA id w7sm10987526wmc.43.2020.10.09.03.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 03:49:10 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH][pseudo] ports/linux: Add mksotemp64 wrapper
Date: Fri,  9 Oct 2020 11:49:09 +0100
Message-Id: <20201009104909.3279761-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to mkstemp64 when oflags=0, therefore move the wrapper and call
from mkstemp64. Note that some glibc versions would have one but not the other
so ensure fall back to the real function is correct on those versions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ports/linux/guts/mkostemp64.c | 53 +++++++++++++++++++++++++++++++++++
 ports/linux/guts/mkstemp64.c  | 37 ++----------------------
 ports/linux/wrapfuncs.in      |  1 +
 3 files changed, 56 insertions(+), 35 deletions(-)
 create mode 100644 ports/linux/guts/mkostemp64.c

diff --git a/ports/linux/guts/mkostemp64.c b/ports/linux/guts/mkostemp64.c
new file mode 100644
index 0000000..502211b
--- /dev/null
+++ b/ports/linux/guts/mkostemp64.c
@@ -0,0 +1,53 @@
+/* 
+ * Copyright (c) 2010 Wind River Systems; see
+ * guts/COPYRIGHT for information.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-only
+ *
+ * static int
+ * wrap_mkstemp64(char *template, int oflags) {
+ *	int rc = -1;
+ */
+	struct stat64 buf;
+ 	int save_errno;
+	size_t len;
+	char *tmp_template;
+
+	if (!template) {
+		errno = EFAULT;
+		return 0;
+	}
+
+	len = strlen(template);
+	tmp_template = PSEUDO_ROOT_PATH(AT_FDCWD, template, AT_SYMLINK_NOFOLLOW);
+
+	if (!tmp_template) {
+		errno = ENOENT;
+		return -1;
+	}
+
+	/* mkstemp64 wrapper uses this code and mkostemp64 not present in some glibc versions */
+	if (oflags == 0)
+		rc = real_mkstemp64(tmp_template);
+	else
+		rc = real_mkostemp64(tmp_template, oflags);
+
+	if (rc != -1) {
+		save_errno = errno;
+
+		if (real___fxstat64(_STAT_VER, rc, &buf) != -1) {
+			real_fchmod(rc, PSEUDO_FS_MODE(0600, 0));
+			pseudo_client_op(OP_CREAT, 0, -1, -1, tmp_template, &buf);
+			pseudo_client_op(OP_OPEN, PSA_READ | PSA_WRITE, rc, -1, tmp_template, &buf);
+		} else {
+			pseudo_debug(PDBGF_CONSISTENCY, "mkstemp (fd %d) succeeded, but fstat failed (%s).\n",
+				rc, strerror(errno));
+			pseudo_client_op(OP_OPEN, PSA_READ | PSA_WRITE, rc, -1, tmp_template, 0);
+		}
+		errno = save_errno;
+	}
+	/* mkstemp only changes the XXXXXX at the end. */
+	memcpy(template + len - 6, tmp_template + strlen(tmp_template) - 6, 6);
+/*	return rc;
+ * }
+ */
diff --git a/ports/linux/guts/mkstemp64.c b/ports/linux/guts/mkstemp64.c
index aa7bb58..487f256 100644
--- a/ports/linux/guts/mkstemp64.c
+++ b/ports/linux/guts/mkstemp64.c
@@ -8,42 +8,9 @@
  * wrap_mkstemp64(char *template) {
  *	int rc = -1;
  */
-	struct stat64 buf;
- 	int save_errno;
-	size_t len;
-	char *tmp_template;
+	/* mkstemp64() is just like mkostemp64() with no flags */
+	rc = wrap_mkostemp64(template, 0);
 
-	if (!template) {
-		errno = EFAULT;
-		return 0;
-	}
-
-	len = strlen(template);
-	tmp_template = PSEUDO_ROOT_PATH(AT_FDCWD, template, AT_SYMLINK_NOFOLLOW);
-
-	if (!tmp_template) {
-		errno = ENOENT;
-		return -1;
-	}
-
-	rc = real_mkstemp64(tmp_template);
-
-	if (rc != -1) {
-		save_errno = errno;
-
-		if (real___fxstat64(_STAT_VER, rc, &buf) != -1) {
-			real_fchmod(rc, PSEUDO_FS_MODE(0600, 0));
-			pseudo_client_op(OP_CREAT, 0, -1, -1, tmp_template, &buf);
-			pseudo_client_op(OP_OPEN, PSA_READ | PSA_WRITE, rc, -1, tmp_template, &buf);
-		} else {
-			pseudo_debug(PDBGF_CONSISTENCY, "mkstemp (fd %d) succeeded, but fstat failed (%s).\n",
-				rc, strerror(errno));
-			pseudo_client_op(OP_OPEN, PSA_READ | PSA_WRITE, rc, -1, tmp_template, 0);
-		}
-		errno = save_errno;
-	}
-	/* mkstemp only changes the XXXXXX at the end. */
-	memcpy(template + len - 6, tmp_template + strlen(tmp_template) - 6, 6);
 /*	return rc;
  * }
  */
diff --git a/ports/linux/wrapfuncs.in b/ports/linux/wrapfuncs.in
index 5cc6791..8bc476d 100644
--- a/ports/linux/wrapfuncs.in
+++ b/ports/linux/wrapfuncs.in
@@ -36,6 +36,7 @@ int ftw64(const char *path, int (*fn)(const char *, const struct stat64 *, int),
 int glob64(const char *pattern, int flags, int (*errfunc)(const char *, int), glob64_t *pglob);
 int scandir64(const char *path, struct dirent64 ***namelist, int (*filter)(const struct dirent64 *), int (*compar)());
 int truncate64(const char *path, off64_t length);
+int mkostemp64(char *template, int oflags); /* flags=AT_SYMLINK_NOFOLLOW */
 int mkstemp64(char *template); /* flags=AT_SYMLINK_NOFOLLOW */
 int getgrouplist(const char *user, gid_t group, gid_t *groups, int *ngroups);
 int setgroups(size_t size, const gid_t *list);
-- 
2.25.1

