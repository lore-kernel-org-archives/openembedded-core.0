Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF74DCFD2F6
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 22:40:52 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3733.1763937650085448305
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Nov 2025 14:40:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=iu/yQhjc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20251123224045335cd6b9ff000207b2-svwj_s@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20251123224045335cd6b9ff000207b2
        for <openembedded-core@lists.openembedded.org>;
        Sun, 23 Nov 2025 23:40:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=vpofn4OZJ8GE9BpnwxGVwi0bcmWdOA2YiFl/GTZTE48=;
 b=iu/yQhjclw9xibpPSeIV87TvTlu04+f9xAWdHxUS+2x0BlSQzpal/xSdr3vmJVZgccjjwS
 UWEhjPdbh7eoaesgv6gvwIHhVxZTeOjt+oiakkQGTcc5GP+sFndWmKki9D7SoUQE/Mrfn1P1
 17SHUQL8imqtNmRnhXLl2kljEeilTldXva2sEQFefTGG5r6jqqw0lRhXnl3gmbcBs6g7h9Ex
 mF9OODL1NKcKhMgDuF/zlXOtQW5qrT6DSnLHfJM8L+gEXjYdecDhEYgVT/Tie2AXT/4Ipeyk
 eQb+NbPp6vbU1DHg6xk4fvER+AW01V89E6LwLyMtBV4IKQyBxMgRz4qw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 1/3] libarchive: patch 3.8.3 security issue 1
Date: Sun, 23 Nov 2025 23:40:23 +0100
Message-Id: <20251123224025.1870566-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Nov 2025 22:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226730

From: Peter Marko <peter.marko@siemens.com>

Pick patch [2] as listed in [1].
To apply it cleanly, add three additional patches from branch patch/3.8.

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.3
[2] https://github.com/libarchive/libarchive/pull/2753

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...ax-path-length-metadata-writing-2243.patch |  30 +++
 ...request-2696-from-al3xtjames-mkstemp.patch |  28 +++
 ...st-2749-from-KlaraSystems-des-tempdi.patch | 183 +++++++++++++++++
 ...st-2753-from-KlaraSystems-des-temp-f.patch | 190 ++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |   4 +
 5 files changed, 435 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Fix-max-path-length-metadata-writing-2243.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2696-from-al3xtjames-mkstemp.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2749-from-KlaraSystems-des-tempdi.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2753-from-KlaraSystems-des-temp-f.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-Fix-max-path-length-metadata-writing-2243.patch b/meta/recipes-extended/libarchive/libarchive/0001-Fix-max-path-length-metadata-writing-2243.patch
new file mode 100644
index 00000000000..0f7dca2a40f
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-Fix-max-path-length-metadata-writing-2243.patch
@@ -0,0 +1,30 @@
+From 2e73ea3a7db1c3c743c28a0d2dd0456a43e96b96 Mon Sep 17 00:00:00 2001
+From: Sam Bingner <sam@bingner.com>
+Date: Fri, 5 Jul 2024 09:34:43 -1000
+Subject: [PATCH] Fix max path-length metadata writing (#2243)
+
+Previous code added `.XXXXXX` to the end of the filename to write the
+mac metadata. This is a problem if the filename is at or near the
+filesystem max path length. This reuses the same code used by
+create_tempdatafork to ensure that the filename is not too long.
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/2e73ea3a7db1c3c743c28a0d2dd0456a43e96b96]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libarchive/archive_write_disk_posix.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/libarchive/archive_write_disk_posix.c b/libarchive/archive_write_disk_posix.c
+index bac906d2..098a8fe4 100644
+--- a/libarchive/archive_write_disk_posix.c
++++ b/libarchive/archive_write_disk_posix.c
+@@ -4331,8 +4331,7 @@ set_mac_metadata(struct archive_write_disk *a, const char *pathname,
+ 	 * silly dance of writing the data to disk just so that
+ 	 * copyfile() can read it back in again. */
+ 	archive_string_init(&tmp);
+-	archive_strcpy(&tmp, pathname);
+-	archive_strcat(&tmp, ".XXXXXX");
++	archive_strcpy(&tmp, "tar.mmd.XXXXXX");
+ 	fd = mkstemp(tmp.s);
+ 
+ 	if (fd < 0) {
diff --git a/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2696-from-al3xtjames-mkstemp.patch b/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2696-from-al3xtjames-mkstemp.patch
new file mode 100644
index 00000000000..a4ccfd16b56
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
+@@ -365,7 +365,7 @@ setup_mac_metadata(struct archive_read_disk *a,
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
index 00000000000..0d69faa23b4
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2749-from-KlaraSystems-des-tempdi.patch
@@ -0,0 +1,183 @@
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
+ configure.ac                                  |  4 +-
+ libarchive/archive_private.h                  |  1 +
+ .../archive_read_disk_entry_from_file.c       | 14 +++----
+ libarchive/archive_read_disk_posix.c          |  3 --
+ libarchive/archive_util.c                     | 38 ++++++++++++++++---
+ 6 files changed, 48 insertions(+), 18 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f44adc77..fc9aca4e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1357,14 +1357,18 @@ CHECK_FUNCTION_EXISTS_GLIBC(ftruncate HAVE_FTRUNCATE)
+ CHECK_FUNCTION_EXISTS_GLIBC(futimens HAVE_FUTIMENS)
+ CHECK_FUNCTION_EXISTS_GLIBC(futimes HAVE_FUTIMES)
+ CHECK_FUNCTION_EXISTS_GLIBC(futimesat HAVE_FUTIMESAT)
++CHECK_FUNCTION_EXISTS_GLIBC(getegid HAVE_GETEGID)
+ CHECK_FUNCTION_EXISTS_GLIBC(geteuid HAVE_GETEUID)
+ CHECK_FUNCTION_EXISTS_GLIBC(getgrgid_r HAVE_GETGRGID_R)
+ CHECK_FUNCTION_EXISTS_GLIBC(getgrnam_r HAVE_GETGRNAM_R)
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
+@@ -677,7 +677,9 @@ AC_CHECK_FUNCS([fchdir fchflags fchmod fchown fcntl fdopendir fork])
+ AC_CHECK_FUNCS([fstat fstatat fstatfs fstatvfs ftruncate])
+ AC_CHECK_FUNCS([futimens futimes futimesat])
+ AC_CHECK_FUNCS([geteuid getpid getgrgid_r getgrnam_r])
+-AC_CHECK_FUNCS([getpwnam_r getpwuid_r getvfsbyname gmtime_r])
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
+@@ -156,6 +156,7 @@ int	__archive_check_magic(struct archive *, unsigned int magic,
+ void	__archive_errx(int retvalue, const char *msg) __LA_DEAD;
+ 
+ void	__archive_ensure_cloexec_flag(int fd);
++int	__archive_get_tempdir(struct archive_string *);
+ int	__archive_mktemp(const char *tmpdir);
+ #if defined(_WIN32) && !defined(__CYGWIN__)
+ int	__archive_mkstemp(wchar_t *template);
+diff --git a/libarchive/archive_read_disk_entry_from_file.c b/libarchive/archive_read_disk_entry_from_file.c
+index 87389642..42af4034 100644
+--- a/libarchive/archive_read_disk_entry_from_file.c
++++ b/libarchive/archive_read_disk_entry_from_file.c
+@@ -339,7 +339,7 @@ setup_mac_metadata(struct archive_read_disk *a,
+ 	int ret = ARCHIVE_OK;
+ 	void *buff = NULL;
+ 	int have_attrs;
+-	const char *name, *tempdir;
++	const char *name;
+ 	struct archive_string tempfile;
+ 
+ 	(void)fd; /* UNUSED */
+@@ -358,14 +358,12 @@ setup_mac_metadata(struct archive_read_disk *a,
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
+@@ -1579,9 +1579,6 @@ setup_current_filesystem(struct archive_read_disk *a)
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
+@@ -395,11 +395,39 @@ __archive_mkstemp(wchar_t *template)
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
+@@ -426,7 +454,7 @@ __archive_mktemp(const char *tmpdir)
+ 
+ 	archive_string_init(&temp_name);
+ 	if (tmpdir == NULL) {
+-		if (get_tempdir(&temp_name) != ARCHIVE_OK)
++		if (__archive_get_tempdir(&temp_name) != ARCHIVE_OK)
+ 			goto exit_tmpfile;
+ 	} else {
+ 		archive_strcpy(&temp_name, tmpdir);
+@@ -487,7 +515,7 @@ __archive_mktempx(const char *tmpdir, char *template)
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
index 00000000000..a5efb3da94e
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
+@@ -359,12 +359,10 @@ setup_mac_metadata(struct archive_read_disk *a,
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
+@@ -2012,6 +2012,26 @@ archive_strncat_l(struct archive_string *as, const void *_p, size_t n,
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
+@@ -195,6 +195,10 @@ void	archive_string_vsprintf(struct archive_string *, const char *,
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
+@@ -4251,8 +4253,10 @@ create_tempdatafork(struct archive_write_disk *a, const char *pathname)
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
+@@ -4331,8 +4335,10 @@ set_mac_metadata(struct archive_write_disk *a, const char *pathname,
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
+@@ -354,6 +354,43 @@ test_archive_string_sprintf(void)
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
+@@ -365,6 +402,7 @@ DEFINE_TEST(test_archive_string)
+ 	test_archive_string_concat();
+ 	test_archive_string_copy();
+ 	test_archive_string_sprintf();
++	test_archive_string_dirname();
+ }
+ 
+ static const char *strings[] =
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index 65b4649147c..e0b8b15df48 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -43,6 +43,10 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-Improve-lseek-handling-2564.patch \
            file://CVE-2025-5918-01.patch \
            file://CVE-2025-5918-02.patch \
+           file://0001-Fix-max-path-length-metadata-writing-2243.patch \
+           file://0001-Merge-pull-request-2696-from-al3xtjames-mkstemp.patch \
+           file://0001-Merge-pull-request-2749-from-KlaraSystems-des-tempdi.patch \
+           file://0001-Merge-pull-request-2753-from-KlaraSystems-des-temp-f.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 

