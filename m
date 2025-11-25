Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546F8D0EE3E
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:59:10 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4286.1764104349000742144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:59:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HARfbrMf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-343774bd9b4so4539111a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 12:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764104348; x=1764709148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FP15iH1LVufL+LF4u9h+h/5I85U/PyC8qtbf63BqQpU=;
        b=HARfbrMfMPhKQriFXihgO5cMQVt/c8rXe+ljIBLnlb0o2AwzxzZOAIHidtuCrp0aZU
         VSLSex49+xEv2pgcbNhhskFep6jKhHzTFQ7Me9BZkAcurmJbPI8/KV2pTJLpQVAMHlsd
         xmKiW4flGOka3rJnXu18rVhqhRV8q7lL8Gz3U4b5+UppG1RY8yIzfaRzljm/YVH2ojxw
         YJSbwObKPyeAfdFPTfrenp2spJyuv27oTuSGmQUdp6Vk2hS8nlQSx0q4emWo1GCpDmx3
         SUnq4+UK6WzP4uo7Vi5DLzQaZy0UiVVCAwX4gjl1giu9ePDLajbfatdaxDlwB6OfmwFn
         Qk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104348; x=1764709148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FP15iH1LVufL+LF4u9h+h/5I85U/PyC8qtbf63BqQpU=;
        b=wzE0M7Sph9H0BdsYbKwOkKP43fJ0D22M5Dy8YcsmR5WXtRftAxv+i8EW79JcEAWX9L
         5XQmB9iNDS/gfFDvfRCW1sUhUTBI0IyAldaOSNVvOOGm9lXj3vjwE9+Ol0ecZm+wbkBP
         d6wYc2gU4dzfYzJ9BIXKqNpfvGIqRQ3FWbJ/oT0ef0SaXmKj+Bioc2XPDmK9nBt1UzbP
         O6irJA9fAN9x1f5ZMIsNZZh2W1zi9/lHYN5SzjUIglGqsPJqSbHkXUB0ajtctk9E+bRB
         XBgfd4g6KSmvUBHrFWVaWJIOSiTFXtSU5aUQ8zuZA0NprhRArJwi+Jr+o18VyoJul2Rh
         apIQ==
X-Gm-Message-State: AOJu0Yx4eaJUqUM8ueVBDNilM5SAA+lgK6IH1UHsGxGv4XFYXjbSliLZ
	UkJtnbmWfRki+kr7M83Z7pvG+sK6P048C3sGUnLS4hbVNrQeYBaoUHCSmz56uVV5/zT2kyoeqRa
	F0EwC
X-Gm-Gg: ASbGncspnBBqA8l9YXgP8Z4JamFnGHN29ajYAsPeR+2NmWAQWnjuOzvcecNrb3Qv/2t
	EJMCZ5lxTG2oNmkAYrxFo3jRVZ+mxfOEL93vveqd/EAbNphcxMcG+A/D+iS4K2vcKHXPykniRUU
	L7Bbj8QFRfbqfNlj5KFyyRXLYm8MNgsFH+6TQKHhG0WsNgrcgcCOJkiM1r3b6UXIVDYDPTETvC7
	mcEB5O7nMqIeEaq21Qbao4iHl2uXd6j1R1jgz9j3KVyeNEg18MhsPPucxpKeGob9/oEpqjqbivf
	3knHE24+OQt1LbjZ97XbaPg3CXkP4BKC263DWEGRXWY0iJ0nt91XbCLlSty7fAXSFCsKmfeZdsF
	x/XqC0gfDUW85KqGNjNynpKxhXAAc7iSDznwZD2+GG4JEysHpOWhIsop/CqKtwoq3tnJ5TcSxE5
	91/Q==
X-Google-Smtp-Source: AGHT+IHMCAEFRc4ZgphBikL/LYCeIRykCwHnyIWFprM70uO7HKSHQ5Kom2omHo+8TzhhftEBfEgebQ==
X-Received: by 2002:a17:90b:2cce:b0:343:a631:28a8 with SMTP id 98e67ed59e1d1-34733f5d400mr17399841a91.37.1764104347903;
        Tue, 25 Nov 2025 12:59:07 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6346sm17340755a12.4.2025.11.25.12.59.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:59:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/9] libarchive: patch 3.8.3 security issue 1
Date: Tue, 25 Nov 2025 12:58:45 -0800
Message-ID: <11f782c1ae9962a2faa98bff3566e49fbf6db017.1764104199.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764104199.git.steve@sakoman.com>
References: <cover.1764104199.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 20:59:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226792

From: Peter Marko <peter.marko@siemens.com>

Pick patch [2] as listed in [1].
To apply it cleanly, add two additional patches from branch patch/3.8.

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.3
[2] https://github.com/libarchive/libarchive/pull/2753

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...request-2696-from-al3xtjames-mkstemp.patch |  28 +++
 ...st-2749-from-KlaraSystems-des-tempdi.patch | 186 +++++++++++++++++
 ...st-2753-from-KlaraSystems-des-temp-f.patch | 190 ++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |   3 +
 4 files changed, 407 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2696-from-al3xtjames-mkstemp.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2749-from-KlaraSystems-des-tempdi.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2753-from-KlaraSystems-des-temp-f.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2696-from-al3xtjames-mkstemp.patch b/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2696-from-al3xtjames-mkstemp.patch
new file mode 100644
index 0000000000..c6a4c026d1
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2696-from-al3xtjames-mkstemp.patch
@@ -0,0 +1,28 @@
+From 53d2bc4f89fcbd7414b92bd242f6cdc901941f55 Mon Sep 17 00:00:00 2001
+From: Tim Kientzle <kientzle@acm.org>
+Date: Sat, 16 Aug 2025 10:27:11 -0600
+Subject: [PATCH] Merge pull request #2696 from al3xtjames/mkstemp
+
+Fix mkstemp path in setup_mac_metadata
+
+(cherry picked from commit 892f33145093d1c9b962b6521a6480dfea66ae00)
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/53d2bc4f89fcbd7414b92bd242f6cdc901941f55]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libarchive/archive_read_disk_entry_from_file.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_read_disk_entry_from_file.c b/libarchive/archive_read_disk_entry_from_file.c
+index 19d04977..87389642 100644
+--- a/libarchive/archive_read_disk_entry_from_file.c
++++ b/libarchive/archive_read_disk_entry_from_file.c
+@@ -364,7 +364,7 @@ setup_mac_metadata(struct archive_read_disk *a,
+ 		tempdir = _PATH_TMP;
+ 	archive_string_init(&tempfile);
+ 	archive_strcpy(&tempfile, tempdir);
+-	archive_strcat(&tempfile, "tar.md.XXXXXX");
++	archive_strcat(&tempfile, "/tar.md.XXXXXX");
+ 	tempfd = mkstemp(tempfile.s);
+ 	if (tempfd < 0) {
+ 		archive_set_error(&a->archive, errno,
diff --git a/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2749-from-KlaraSystems-des-tempdi.patch b/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2749-from-KlaraSystems-des-tempdi.patch
new file mode 100644
index 0000000000..cab8e5e651
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2749-from-KlaraSystems-des-tempdi.patch
@@ -0,0 +1,186 @@
+From 82e31ba4a9afcce0c7c19e591ccd8653196d84a0 Mon Sep 17 00:00:00 2001
+From: Tim Kientzle <kientzle@acm.org>
+Date: Mon, 13 Oct 2025 10:57:18 -0700
+Subject: [PATCH] Merge pull request #2749 from KlaraSystems/des/tempdir
+
+Unify temporary directory handling
+
+(cherry picked from commit d207d816d065c79dc2cb992008c3ba9721c6a276)
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/82e31ba4a9afcce0c7c19e591ccd8653196d84a0]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ CMakeLists.txt                                |  6 ++-
+ configure.ac                                  |  6 ++-
+ libarchive/archive_private.h                  |  1 +
+ .../archive_read_disk_entry_from_file.c       | 14 +++----
+ libarchive/archive_read_disk_posix.c          |  3 --
+ libarchive/archive_util.c                     | 38 ++++++++++++++++---
+ 6 files changed, 49 insertions(+), 19 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f44adc77..fc9aca4e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1455,15 +1455,19 @@ CHECK_FUNCTION_EXISTS_GLIBC(ftruncate HAVE_FTRUNCATE)
+ CHECK_FUNCTION_EXISTS_GLIBC(futimens HAVE_FUTIMENS)
+ CHECK_FUNCTION_EXISTS_GLIBC(futimes HAVE_FUTIMES)
+ CHECK_FUNCTION_EXISTS_GLIBC(futimesat HAVE_FUTIMESAT)
++CHECK_FUNCTION_EXISTS_GLIBC(getegid HAVE_GETEGID)
+ CHECK_FUNCTION_EXISTS_GLIBC(geteuid HAVE_GETEUID)
+ CHECK_FUNCTION_EXISTS_GLIBC(getgrgid_r HAVE_GETGRGID_R)
+ CHECK_FUNCTION_EXISTS_GLIBC(getgrnam_r HAVE_GETGRNAM_R)
+ CHECK_FUNCTION_EXISTS_GLIBC(getline HAVE_GETLINE)
++CHECK_FUNCTION_EXISTS_GLIBC(getpid HAVE_GETPID)
+ CHECK_FUNCTION_EXISTS_GLIBC(getpwnam_r HAVE_GETPWNAM_R)
+ CHECK_FUNCTION_EXISTS_GLIBC(getpwuid_r HAVE_GETPWUID_R)
+-CHECK_FUNCTION_EXISTS_GLIBC(getpid HAVE_GETPID)
++CHECK_FUNCTION_EXISTS_GLIBC(getresgid HAVE_GETRESGID)
++CHECK_FUNCTION_EXISTS_GLIBC(getresuid HAVE_GETRESUID)
+ CHECK_FUNCTION_EXISTS_GLIBC(getvfsbyname HAVE_GETVFSBYNAME)
+ CHECK_FUNCTION_EXISTS_GLIBC(gmtime_r HAVE_GMTIME_R)
++CHECK_FUNCTION_EXISTS_GLIBC(issetugid HAVE_ISSETUGID)
+ CHECK_FUNCTION_EXISTS_GLIBC(lchflags HAVE_LCHFLAGS)
+ CHECK_FUNCTION_EXISTS_GLIBC(lchmod HAVE_LCHMOD)
+ CHECK_FUNCTION_EXISTS_GLIBC(lchown HAVE_LCHOWN)
+diff --git a/configure.ac b/configure.ac
+index aae0f381..a1a8f380 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -810,8 +810,10 @@ AC_CHECK_FUNCS([arc4random_buf chflags chown chroot ctime_r])
+ AC_CHECK_FUNCS([fchdir fchflags fchmod fchown fcntl fdopendir fnmatch fork])
+ AC_CHECK_FUNCS([fstat fstatat fstatfs fstatvfs ftruncate])
+ AC_CHECK_FUNCS([futimens futimes futimesat])
+-AC_CHECK_FUNCS([geteuid getline getpid getgrgid_r getgrnam_r])
+-AC_CHECK_FUNCS([getpwnam_r getpwuid_r getvfsbyname gmtime_r])
++AC_CHECK_FUNCS([getegid geteuid getline getpid getresgid getresuid])
++AC_CHECK_FUNCS([getgrgid_r getgrnam_r getpwnam_r getpwuid_r])
++AC_CHECK_FUNCS([getvfsbyname gmtime_r])
++AC_CHECK_FUNCS([issetugid])
+ AC_CHECK_FUNCS([lchflags lchmod lchown link linkat localtime_r lstat lutimes])
+ AC_CHECK_FUNCS([mbrtowc memmove memset])
+ AC_CHECK_FUNCS([mkdir mkfifo mknod mkstemp])
+diff --git a/libarchive/archive_private.h b/libarchive/archive_private.h
+index 050fc63c..3a926c68 100644
+--- a/libarchive/archive_private.h
++++ b/libarchive/archive_private.h
+@@ -158,6 +158,7 @@ int	__archive_check_magic(struct archive *, unsigned int magic,
+ __LA_NORETURN void	__archive_errx(int retvalue, const char *msg);
+ 
+ void	__archive_ensure_cloexec_flag(int fd);
++int	__archive_get_tempdir(struct archive_string *);
+ int	__archive_mktemp(const char *tmpdir);
+ #if defined(_WIN32) && !defined(__CYGWIN__)
+ int	__archive_mkstemp(wchar_t *templates);
+diff --git a/libarchive/archive_read_disk_entry_from_file.c b/libarchive/archive_read_disk_entry_from_file.c
+index 87389642..42af4034 100644
+--- a/libarchive/archive_read_disk_entry_from_file.c
++++ b/libarchive/archive_read_disk_entry_from_file.c
+@@ -338,7 +338,7 @@ setup_mac_metadata(struct archive_read_disk *a,
+ 	int ret = ARCHIVE_OK;
+ 	void *buff = NULL;
+ 	int have_attrs;
+-	const char *name, *tempdir;
++	const char *name;
+ 	struct archive_string tempfile;
+ 
+ 	(void)fd; /* UNUSED */
+@@ -357,14 +357,12 @@ setup_mac_metadata(struct archive_read_disk *a,
+ 	if (have_attrs == 0)
+ 		return (ARCHIVE_OK);
+ 
+-	tempdir = NULL;
+-	if (issetugid() == 0)
+-		tempdir = getenv("TMPDIR");
+-	if (tempdir == NULL)
+-		tempdir = _PATH_TMP;
+ 	archive_string_init(&tempfile);
+-	archive_strcpy(&tempfile, tempdir);
+-	archive_strcat(&tempfile, "/tar.md.XXXXXX");
++	if (__archive_get_tempdir(&tempfile) != ARCHIVE_OK) {
++		ret = ARCHIVE_WARN;
++		goto cleanup;
++	}
++	archive_strcat(&tempfile, "tar.md.XXXXXX");
+ 	tempfd = mkstemp(tempfile.s);
+ 	if (tempfd < 0) {
+ 		archive_set_error(&a->archive, errno,
+diff --git a/libarchive/archive_read_disk_posix.c b/libarchive/archive_read_disk_posix.c
+index ba0046d7..54a8e661 100644
+--- a/libarchive/archive_read_disk_posix.c
++++ b/libarchive/archive_read_disk_posix.c
+@@ -1578,9 +1578,6 @@ setup_current_filesystem(struct archive_read_disk *a)
+ #  endif
+ #endif
+ 	int r, xr = 0;
+-#if !defined(HAVE_STRUCT_STATFS_F_NAMEMAX)
+-	long nm;
+-#endif
+ 
+ 	t->current_filesystem->synthetic = -1;
+ 	t->current_filesystem->remote = -1;
+diff --git a/libarchive/archive_util.c b/libarchive/archive_util.c
+index 900abd0c..d048bbc9 100644
+--- a/libarchive/archive_util.c
++++ b/libarchive/archive_util.c
+@@ -443,11 +443,39 @@ __archive_mkstemp(wchar_t *template)
+ #else
+ 
+ static int
+-get_tempdir(struct archive_string *temppath)
++__archive_issetugid(void)
+ {
+-	const char *tmp;
++#ifdef HAVE_ISSETUGID
++	return (issetugid());
++#elif HAVE_GETRESUID
++	uid_t ruid, euid, suid;
++	gid_t rgid, egid, sgid;
++	if (getresuid(&ruid, &euid, &suid) != 0)
++		return (-1);
++	if (ruid != euid || ruid != suid)
++		return (1);
++	if (getresgid(&ruid, &egid, &sgid) != 0)
++		return (-1);
++	if (rgid != egid || rgid != sgid)
++		return (1);
++#elif HAVE_GETEUID
++	if (geteuid() != getuid())
++		return (1);
++#if HAVE_GETEGID
++	if (getegid() != getgid())
++		return (1);
++#endif
++#endif
++	return (0);
++}
+ 
+-	tmp = getenv("TMPDIR");
++int
++__archive_get_tempdir(struct archive_string *temppath)
++{
++	const char *tmp = NULL;
++
++	if (__archive_issetugid() == 0)
++		tmp = getenv("TMPDIR");
+ 	if (tmp == NULL)
+ #ifdef _PATH_TMP
+ 		tmp = _PATH_TMP;
+@@ -474,7 +502,7 @@ __archive_mktemp(const char *tmpdir)
+ 
+ 	archive_string_init(&temp_name);
+ 	if (tmpdir == NULL) {
+-		if (get_tempdir(&temp_name) != ARCHIVE_OK)
++		if (__archive_get_tempdir(&temp_name) != ARCHIVE_OK)
+ 			goto exit_tmpfile;
+ 	} else {
+ 		archive_strcpy(&temp_name, tmpdir);
+@@ -536,7 +564,7 @@ __archive_mktempx(const char *tmpdir, char *template)
+ 	if (template == NULL) {
+ 		archive_string_init(&temp_name);
+ 		if (tmpdir == NULL) {
+-			if (get_tempdir(&temp_name) != ARCHIVE_OK)
++			if (__archive_get_tempdir(&temp_name) != ARCHIVE_OK)
+ 				goto exit_tmpfile;
+ 		} else
+ 			archive_strcpy(&temp_name, tmpdir);
diff --git a/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2753-from-KlaraSystems-des-temp-f.patch b/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2753-from-KlaraSystems-des-temp-f.patch
new file mode 100644
index 0000000000..a5e0595776
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2753-from-KlaraSystems-des-temp-f.patch
@@ -0,0 +1,190 @@
+From c3593848067cea3b41bc11eec15f391318675cb4 Mon Sep 17 00:00:00 2001
+From: Tim Kientzle <kientzle@acm.org>
+Date: Tue, 28 Oct 2025 17:13:18 -0700
+Subject: [PATCH] Merge pull request #2753 from KlaraSystems/des/temp-files
+
+Create temporary files in the target directory
+
+(cherry picked from commit d2e861769c25470427656b36a14b535f17d47d03)
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/c3593848067cea3b41bc11eec15f391318675cb4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ .../archive_read_disk_entry_from_file.c       | 10 ++---
+ libarchive/archive_string.c                   | 20 ++++++++++
+ libarchive/archive_string.h                   |  4 ++
+ libarchive/archive_write_disk_posix.c         | 20 ++++++----
+ libarchive/test/test_archive_string.c         | 38 +++++++++++++++++++
+ 5 files changed, 79 insertions(+), 13 deletions(-)
+
+diff --git a/libarchive/archive_read_disk_entry_from_file.c b/libarchive/archive_read_disk_entry_from_file.c
+index 42af4034..121af198 100644
+--- a/libarchive/archive_read_disk_entry_from_file.c
++++ b/libarchive/archive_read_disk_entry_from_file.c
+@@ -358,12 +358,10 @@ setup_mac_metadata(struct archive_read_disk *a,
+ 		return (ARCHIVE_OK);
+ 
+ 	archive_string_init(&tempfile);
+-	if (__archive_get_tempdir(&tempfile) != ARCHIVE_OK) {
+-		ret = ARCHIVE_WARN;
+-		goto cleanup;
+-	}
+-	archive_strcat(&tempfile, "tar.md.XXXXXX");
+-	tempfd = mkstemp(tempfile.s);
++	archive_strcpy(&tempfile, name);
++	archive_string_dirname(&tempfile);
++	archive_strcat(&tempfile, "/tar.XXXXXXXX");
++	tempfd = __archive_mkstemp(tempfile.s);
+ 	if (tempfd < 0) {
+ 		archive_set_error(&a->archive, errno,
+ 		    "Could not open extended attribute file");
+diff --git a/libarchive/archive_string.c b/libarchive/archive_string.c
+index 3bb97833..740308b6 100644
+--- a/libarchive/archive_string.c
++++ b/libarchive/archive_string.c
+@@ -2039,6 +2039,26 @@ archive_strncat_l(struct archive_string *as, const void *_p, size_t n,
+ 	return (r);
+ }
+ 
++struct archive_string *
++archive_string_dirname(struct archive_string *as)
++{
++	/* strip trailing separators */
++	while (as->length > 1 && as->s[as->length - 1] == '/')
++		as->length--;
++	/* strip final component */
++	while (as->length > 0 && as->s[as->length - 1] != '/')
++		as->length--;
++	/* empty path -> cwd */
++	if (as->length == 0)
++		return (archive_strcat(as, "."));
++	/* strip separator(s) */
++	while (as->length > 1 && as->s[as->length - 1] == '/')
++		as->length--;
++	/* terminate */
++	as->s[as->length] = '\0';
++	return (as);
++}
++
+ #if HAVE_ICONV
+ 
+ /*
+diff --git a/libarchive/archive_string.h b/libarchive/archive_string.h
+index e8987867..d5f5c03a 100644
+--- a/libarchive/archive_string.h
++++ b/libarchive/archive_string.h
+@@ -192,6 +192,10 @@ void	archive_string_vsprintf(struct archive_string *, const char *,
+ void	archive_string_sprintf(struct archive_string *, const char *, ...)
+ 	    __LA_PRINTF(2, 3);
+ 
++/* Equivalent to dirname(3) */
++struct archive_string *
++archive_string_dirname(struct archive_string *);
++
+ /* Translates from MBS to Unicode. */
+ /* Returns non-zero if conversion failed in any way. */
+ int archive_wstring_append_from_mbs(struct archive_wstring *dest,
+diff --git a/libarchive/archive_write_disk_posix.c b/libarchive/archive_write_disk_posix.c
+index 6fcf3929..cd256203 100644
+--- a/libarchive/archive_write_disk_posix.c
++++ b/libarchive/archive_write_disk_posix.c
+@@ -412,12 +412,14 @@ static ssize_t	_archive_write_disk_data_block(struct archive *, const void *,
+ static int
+ la_mktemp(struct archive_write_disk *a)
+ {
++	struct archive_string *tmp = &a->_tmpname_data;
+ 	int oerrno, fd;
+ 	mode_t mode;
+ 
+-	archive_string_empty(&a->_tmpname_data);
+-	archive_string_sprintf(&a->_tmpname_data, "%s.XXXXXX", a->name);
+-	a->tmpname = a->_tmpname_data.s;
++	archive_strcpy(tmp, a->name);
++	archive_string_dirname(tmp);
++	archive_strcat(tmp, "/tar.XXXXXXXX");
++	a->tmpname = tmp->s;
+ 
+ 	fd = __archive_mkstemp(a->tmpname);
+ 	if (fd == -1)
+@@ -4283,8 +4285,10 @@ create_tempdatafork(struct archive_write_disk *a, const char *pathname)
+ 	int tmpfd;
+ 
+ 	archive_string_init(&tmpdatafork);
+-	archive_strcpy(&tmpdatafork, "tar.md.XXXXXX");
+-	tmpfd = mkstemp(tmpdatafork.s);
++	archive_strcpy(&tmpdatafork, pathname);
++	archive_string_dirname(&tmpdatafork);
++	archive_strcat(&tmpdatafork, "/tar.XXXXXXXX");
++	tmpfd = __archive_mkstemp(tmpdatafork.s);
+ 	if (tmpfd < 0) {
+ 		archive_set_error(&a->archive, errno,
+ 		    "Failed to mkstemp");
+@@ -4363,8 +4367,10 @@ set_mac_metadata(struct archive_write_disk *a, const char *pathname,
+ 	 * silly dance of writing the data to disk just so that
+ 	 * copyfile() can read it back in again. */
+ 	archive_string_init(&tmp);
+-	archive_strcpy(&tmp, "tar.mmd.XXXXXX");
+-	fd = mkstemp(tmp.s);
++	archive_strcpy(&tmp, pathname);
++	archive_string_dirname(&tmp);
++	archive_strcat(&tmp, "/tar.XXXXXXXX");
++	fd = __archive_mkstemp(tmp.s);
+ 
+ 	if (fd < 0) {
+ 		archive_set_error(&a->archive, errno,
+diff --git a/libarchive/test/test_archive_string.c b/libarchive/test/test_archive_string.c
+index 30f7a800..bf822c0d 100644
+--- a/libarchive/test/test_archive_string.c
++++ b/libarchive/test/test_archive_string.c
+@@ -353,6 +353,43 @@ test_archive_string_sprintf(void)
+ 	archive_string_free(&s);
+ }
+ 
++static void
++test_archive_string_dirname(void)
++{
++	static struct pair { const char *str, *exp; } pairs[] = {
++		{ "",		"." },
++		{ "/",		"/" },
++		{ "//",		"/" },
++		{ "///",	"/" },
++		{ "./",		"." },
++		{ ".",		"." },
++		{ "..",		"." },
++		{ "foo",	"." },
++		{ "foo/",	"." },
++		{ "foo//",	"." },
++		{ "foo/bar",	"foo" },
++		{ "foo/bar/",	"foo" },
++		{ "foo/bar//",	"foo" },
++		{ "foo//bar",	"foo" },
++		{ "foo//bar/",	"foo" },
++		{ "foo//bar//",	"foo" },
++		{ "/foo",	"/" },
++		{ "//foo",	"/" },
++		{ "//foo/",	"/" },
++		{ "//foo//",	"/" },
++		{ 0 },
++	};
++	struct pair *pair;
++	struct archive_string s;
++
++	archive_string_init(&s);
++	for (pair = pairs; pair->str; pair++) {
++		archive_strcpy(&s, pair->str);
++		archive_string_dirname(&s);
++		assertEqualString(pair->exp, s.s);
++	}
++}
++
+ DEFINE_TEST(test_archive_string)
+ {
+ 	test_archive_string_ensure();
+@@ -364,6 +401,7 @@ DEFINE_TEST(test_archive_string)
+ 	test_archive_string_concat();
+ 	test_archive_string_copy();
+ 	test_archive_string_sprintf();
++	test_archive_string_dirname();
+ }
+ 
+ static const char *strings[] =
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index f4b1be2337..88e9fbf8e9 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -38,6 +38,9 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2025-5918-0001.patch \
            file://CVE-2025-5918-0002.patch \
            file://CVE-2025-5918-0003.patch \
+           file://0001-Merge-pull-request-2696-from-al3xtjames-mkstemp.patch \
+           file://0001-Merge-pull-request-2749-from-KlaraSystems-des-tempdi.patch \
+           file://0001-Merge-pull-request-2753-from-KlaraSystems-des-temp-f.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.43.0


