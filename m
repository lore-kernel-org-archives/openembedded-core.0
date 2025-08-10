Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 407DFC87FCF
	for <webhook@archiver.kernel.org>; Sun, 10 Aug 2025 10:52:08 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.23878.1754823121601477736
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 03:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=IwIOwLLP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250810105156ef778c6454d3bb36c8-gpfw7w@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250810105156ef778c6454d3bb36c8
        for <openembedded-core@lists.openembedded.org>;
        Sun, 10 Aug 2025 12:51:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=uNGisA5EuzwpzqGVHUAqN8GhG94CvF0H8Yhfb1nS/xM=;
 b=IwIOwLLPr4I7VO7pb7yKpM4FQUvs+MbhrZSQHxEVZwkDMSjxffpt9/91uCBiqCl1qfQPeS
 0w64mI3ekiNvFHvU6WuzO0LOji7v69bvmscyYht0Y8RZz5xR7fBDmq5+dgBmn8WVr/M60kEA
 JIZyPZDTfFUU4HYU7XxIZ7tn6uWnUIWF1Y/QJJ1OGuhJ5GLwTb1GU/JGh+yQran1vKfGxAvk
 sbJU70LFhX+1ppl2ioCyBvBLgWcV1yI7hQoSpDPbFO2zrQ5wVHNFlLOgBaT2KDG+x3gtWPj2
 fHk7zfkABJyeTHLjDzzwkTozsenm9VXL0UBjor4GUzlNfGC3yem/aCuA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] libarchive: patch CVE-2025-5918
Date: Sun, 10 Aug 2025 12:51:09 +0200
Message-Id: <20250810105109.2734059-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 10:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221696

From: Peter Marko <peter.marko@siemens.com>

Pick 2 commits as in scarthgap branch plus one additional precondition
to apply those.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../0001-FILE-seeking-support-2539.patch      | 190 +++++++++++
 .../0001-Improve-lseek-handling-2564.patch    | 320 ++++++++++++++++++
 .../libarchive/libarchive/CVE-2025-5918.patch | 217 ++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |   3 +
 4 files changed, 730 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-FILE-seeking-support-2539.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Improve-lseek-handling-2564.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5918.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-FILE-seeking-support-2539.patch b/meta/recipes-extended/libarchive/libarchive/0001-FILE-seeking-support-2539.patch
new file mode 100644
index 0000000000..2126fcf058
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-FILE-seeking-support-2539.patch
@@ -0,0 +1,190 @@
+From 09a2ed4853cd177264076a88c98e525e892a0d0b Mon Sep 17 00:00:00 2001
+From: ljdarj <ljd@luigiscorner.mu>
+Date: Sat, 15 Mar 2025 19:17:27 +0100
+Subject: [PATCH] FILE* seeking support (#2539)
+
+Adding a seeker function to archive_read_open_FILE().
+
+Fixes #437.
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/09a2ed4853cd177264076a88c98e525e892a0d0b]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libarchive/archive_read_open_file.c | 82 +++++++++++++++++++++++------
+ libarchive/test/test_open_file.c    |  9 ++--
+ 2 files changed, 71 insertions(+), 20 deletions(-)
+
+diff --git a/libarchive/archive_read_open_file.c b/libarchive/archive_read_open_file.c
+index cf49ebd8..ecd56dce 100644
+--- a/libarchive/archive_read_open_file.c
++++ b/libarchive/archive_read_open_file.c
+@@ -57,9 +57,10 @@ struct read_FILE_data {
+ 	char	 can_skip;
+ };
+ 
+-static int	file_close(struct archive *, void *);
+-static ssize_t	file_read(struct archive *, void *, const void **buff);
+-static int64_t	file_skip(struct archive *, void *, int64_t request);
++static int	FILE_close(struct archive *, void *);
++static ssize_t	FILE_read(struct archive *, void *, const void **buff);
++static int64_t	FILE_seek(struct archive *, void *, int64_t, int);
++static int64_t	FILE_skip(struct archive *, void *, int64_t);
+ 
+ int
+ archive_read_open_FILE(struct archive *a, FILE *f)
+@@ -70,7 +71,7 @@ archive_read_open_FILE(struct archive *a, FILE *f)
+ 	void *b;
+ 
+ 	archive_clear_error(a);
+-	mine = (struct read_FILE_data *)malloc(sizeof(*mine));
++	mine = (struct read_FILE_data *)calloc(1, sizeof(*mine));
+ 	b = malloc(block_size);
+ 	if (mine == NULL || b == NULL) {
+ 		archive_set_error(a, ENOMEM, "No memory");
+@@ -91,22 +92,22 @@ archive_read_open_FILE(struct archive *a, FILE *f)
+ 		archive_read_extract_set_skip_file(a, st.st_dev, st.st_ino);
+ 		/* Enable the seek optimization only for regular files. */
+ 		mine->can_skip = 1;
+-	} else
+-		mine->can_skip = 0;
++	}
+ 
+ #if defined(__CYGWIN__) || defined(_WIN32)
+ 	setmode(fileno(mine->f), O_BINARY);
+ #endif
+ 
+-	archive_read_set_read_callback(a, file_read);
+-	archive_read_set_skip_callback(a, file_skip);
+-	archive_read_set_close_callback(a, file_close);
++	archive_read_set_read_callback(a, FILE_read);
++	archive_read_set_skip_callback(a, FILE_skip);
++	archive_read_set_seek_callback(a, FILE_seek);
++	archive_read_set_close_callback(a, FILE_close);
+ 	archive_read_set_callback_data(a, mine);
+ 	return (archive_read_open1(a));
+ }
+ 
+ static ssize_t
+-file_read(struct archive *a, void *client_data, const void **buff)
++FILE_read(struct archive *a, void *client_data, const void **buff)
+ {
+ 	struct read_FILE_data *mine = (struct read_FILE_data *)client_data;
+ 	size_t bytes_read;
+@@ -120,13 +121,13 @@ file_read(struct archive *a, void *client_data, const void **buff)
+ }
+ 
+ static int64_t
+-file_skip(struct archive *a, void *client_data, int64_t request)
++FILE_skip(struct archive *a, void *client_data, int64_t request)
+ {
+ 	struct read_FILE_data *mine = (struct read_FILE_data *)client_data;
+-#if HAVE_FSEEKO
+-	off_t skip = (off_t)request;
+-#elif HAVE__FSEEKI64
++#if HAVE__FSEEKI64
+ 	int64_t skip = request;
++#elif HAVE_FSEEKO
++	off_t skip = (off_t)request;
+ #else
+ 	long skip = (long)request;
+ #endif
+@@ -168,8 +169,57 @@ file_skip(struct archive *a, void *client_data, int64_t request)
+ 	return (request);
+ }
+ 
++/*
++ * TODO: Store the offset and use it in the read callback.
++ */
++static int64_t
++FILE_seek(struct archive *a, void *client_data, int64_t request, int whence)
++{
++	struct read_FILE_data *mine = (struct read_FILE_data *)client_data;
++#if HAVE__FSEEKI64
++	int64_t skip = request;
++#elif HAVE_FSEEKO
++	off_t skip = (off_t)request;
++#else
++	long skip = (long)request;
++#endif
++	int skip_bits = sizeof(skip) * 8 - 1;
++	(void)a; /* UNUSED */
++
++	/* If request is too big for a long or an off_t, reduce it. */
++	if (sizeof(request) > sizeof(skip)) {
++		int64_t max_skip =
++		    (((int64_t)1 << (skip_bits - 1)) - 1) * 2 + 1;
++		if (request > max_skip)
++			skip = max_skip;
++	}
++
++#ifdef __ANDROID__
++	/* Newer Android versions have fseeko...to meditate. */
++	int64_t ret = lseek(fileno(mine->f), skip, whence);
++	if (ret >= 0) {
++		return ret;
++	}
++#elif HAVE__FSEEKI64
++	if (_fseeki64(mine->f, skip, whence) == 0) {
++		return _ftelli64(mine->f);
++	}
++#elif HAVE_FSEEKO
++	if (fseeko(mine->f, skip, whence) == 0) {
++		return ftello(mine->f);
++	}
++#else
++	if (fseek(mine->f, skip, whence) == 0) {
++		return ftell(mine->f);
++	}
++#endif
++	/* If we arrive here, the input is corrupted or truncated so fail. */
++	archive_set_error(a, errno, "Error seeking in FILE* pointer");
++	return (ARCHIVE_FATAL);
++}
++
+ static int
+-file_close(struct archive *a, void *client_data)
++FILE_close(struct archive *a, void *client_data)
+ {
+ 	struct read_FILE_data *mine = (struct read_FILE_data *)client_data;
+ 
+@@ -177,4 +227,4 @@ file_close(struct archive *a, void *client_data)
+ 	free(mine->buffer);
+ 	free(mine);
+ 	return (ARCHIVE_OK);
+-}
++}
+\ No newline at end of file
+diff --git a/libarchive/test/test_open_file.c b/libarchive/test/test_open_file.c
+index f4ca82bb..cc6b04d0 100644
+--- a/libarchive/test/test_open_file.c
++++ b/libarchive/test/test_open_file.c
+@@ -32,14 +32,14 @@ DEFINE_TEST(test_open_file)
+ 	struct archive *a;
+ 	FILE *f;
+ 
+-	f = fopen("test.tar", "wb");
++	f = fopen("test.7z", "wb");
+ 	assert(f != NULL);
+ 	if (f == NULL)
+ 		return;
+ 
+ 	/* Write an archive through this FILE *. */
+ 	assert((a = archive_write_new()) != NULL);
+-	assertEqualIntA(a, ARCHIVE_OK, archive_write_set_format_ustar(a));
++	assertEqualIntA(a, ARCHIVE_OK, archive_write_set_format_7zip(a));
+ 	assertEqualIntA(a, ARCHIVE_OK, archive_write_add_filter_none(a));
+ 	assertEqualIntA(a, ARCHIVE_OK, archive_write_open_FILE(a, f));
+ 
+@@ -71,9 +71,10 @@ DEFINE_TEST(test_open_file)
+ 	fclose(f);
+ 
+ 	/*
+-	 * Now, read the data back.
++	 * Now, read the data back. 7z requiring seeking, that also
++	 * tests that the seeking support works.
+ 	 */
+-	f = fopen("test.tar", "rb");
++	f = fopen("test.7z", "rb");
+ 	assert(f != NULL);
+ 	if (f == NULL)
+ 		return;
diff --git a/meta/recipes-extended/libarchive/libarchive/0001-Improve-lseek-handling-2564.patch b/meta/recipes-extended/libarchive/libarchive/0001-Improve-lseek-handling-2564.patch
new file mode 100644
index 0000000000..a00674f5dc
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-Improve-lseek-handling-2564.patch
@@ -0,0 +1,320 @@
+From 89b8c35ff4b5addc08a85bf5df02b407f8af1f6c Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <stoeckmann@users.noreply.github.com>
+Date: Sun, 6 Apr 2025 22:34:37 +0200
+Subject: [PATCH] Improve lseek handling (#2564)
+
+The skip functions are limited to 1 GB for cases in which libarchive
+runs on a system with an off_t or long with 32 bits. This has negative
+impact on 64 bit systems.
+
+Instead, make sure that _all_ subsequent functions truncate properly.
+Some of them already did and some had regressions for over 10 years.
+
+Tests pass on Debian 12 i686 configured with --disable-largefile, i.e.
+running with an off_t with 32 bits.
+
+Casts added where needed to still pass MSVC builds.
+
+---------
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/89b8c35ff4b5addc08a85bf5df02b407f8af1f6c]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libarchive/archive_read.c               |  6 ----
+ libarchive/archive_read_disk_posix.c    |  3 +-
+ libarchive/archive_read_open_fd.c       | 29 +++++++++++++------
+ libarchive/archive_read_open_file.c     | 35 ++++++++++++-----------
+ libarchive/archive_read_open_filename.c | 37 ++++++++++++++++++-------
+ libarchive/test/read_open_memory.c      |  2 +-
+ libarchive/test/test_sparse_basic.c     |  6 ++--
+ libarchive/test/test_tar_large.c        |  2 +-
+ 8 files changed, 75 insertions(+), 45 deletions(-)
+
+diff --git a/libarchive/archive_read.c b/libarchive/archive_read.c
+index 822c534b..50db8701 100644
+--- a/libarchive/archive_read.c
++++ b/libarchive/archive_read.c
+@@ -177,15 +177,9 @@ client_skip_proxy(struct archive_read_filter *self, int64_t request)
+ 		return 0;
+ 
+ 	if (self->archive->client.skipper != NULL) {
+-		/* Seek requests over 1GiB are broken down into
+-		 * multiple seeks.  This avoids overflows when the
+-		 * requests get passed through 32-bit arguments. */
+-		int64_t skip_limit = (int64_t)1 << 30;
+ 		int64_t total = 0;
+ 		for (;;) {
+ 			int64_t get, ask = request;
+-			if (ask > skip_limit)
+-				ask = skip_limit;
+ 			get = (self->archive->client.skipper)
+ 				(&self->archive->archive, self->data, ask);
+ 			total += get;
+diff --git a/libarchive/archive_read_disk_posix.c b/libarchive/archive_read_disk_posix.c
+index 09965eb9..4839d62b 100644
+--- a/libarchive/archive_read_disk_posix.c
++++ b/libarchive/archive_read_disk_posix.c
+@@ -779,7 +779,8 @@ _archive_read_data_block(struct archive *_a, const void **buff,
+ 	 */
+ 	if (t->current_sparse->offset > t->entry_total) {
+ 		if (lseek(t->entry_fd,
+-		    (off_t)t->current_sparse->offset, SEEK_SET) < 0) {
++		    (off_t)t->current_sparse->offset, SEEK_SET) !=
++		    t->current_sparse->offset) {
+ 			archive_set_error(&a->archive, errno, "Seek error");
+ 			r = ARCHIVE_FATAL;
+ 			a->archive.state = ARCHIVE_STATE_FATAL;
+diff --git a/libarchive/archive_read_open_fd.c b/libarchive/archive_read_open_fd.c
+index debfde20..3fd536d5 100644
+--- a/libarchive/archive_read_open_fd.c
++++ b/libarchive/archive_read_open_fd.c
+@@ -132,7 +132,7 @@ static int64_t
+ file_skip(struct archive *a, void *client_data, int64_t request)
+ {
+ 	struct read_fd_data *mine = (struct read_fd_data *)client_data;
+-	int64_t skip = request;
++	off_t skip = (off_t)request;
+ 	int64_t old_offset, new_offset;
+ 	int skip_bits = sizeof(skip) * 8 - 1;  /* off_t is a signed type. */
+ 
+@@ -141,15 +141,15 @@ file_skip(struct archive *a, void *client_data, int64_t request)
+ 
+ 	/* Reduce a request that would overflow the 'skip' variable. */
+ 	if (sizeof(request) > sizeof(skip)) {
+-		int64_t max_skip =
++		const int64_t max_skip =
+ 		    (((int64_t)1 << (skip_bits - 1)) - 1) * 2 + 1;
+ 		if (request > max_skip)
+-			skip = max_skip;
++			skip = (off_t)max_skip;
+ 	}
+ 
+-	/* Reduce request to the next smallest multiple of block_size */
+-	request = (request / mine->block_size) * mine->block_size;
+-	if (request == 0)
++	/* Reduce 'skip' to the next smallest multiple of block_size */
++	skip = (off_t)(((int64_t)skip / mine->block_size) * mine->block_size);
++	if (skip == 0)
+ 		return (0);
+ 
+ 	if (((old_offset = lseek(mine->fd, 0, SEEK_CUR)) >= 0) &&
+@@ -179,11 +179,24 @@ static int64_t
+ file_seek(struct archive *a, void *client_data, int64_t request, int whence)
+ {
+ 	struct read_fd_data *mine = (struct read_fd_data *)client_data;
++	off_t seek = (off_t)request;
+ 	int64_t r;
++	int seek_bits = sizeof(seek) * 8 - 1;  /* off_t is a signed type. */
+ 
+ 	/* We use off_t here because lseek() is declared that way. */
+-	/* See above for notes about when off_t is less than 64 bits. */
+-	r = lseek(mine->fd, request, whence);
++
++	/* Reduce a request that would overflow the 'seek' variable. */
++	if (sizeof(request) > sizeof(seek)) {
++		const int64_t max_seek =
++		    (((int64_t)1 << (seek_bits - 1)) - 1) * 2 + 1;
++		const int64_t min_seek = ~max_seek;
++		if (request > max_seek)
++			seek = (off_t)max_seek;
++		else if (request < min_seek)
++			seek = (off_t)min_seek;
++	}
++
++	r = lseek(mine->fd, seek, whence);
+ 	if (r >= 0)
+ 		return r;
+ 
+diff --git a/libarchive/archive_read_open_file.c b/libarchive/archive_read_open_file.c
+index ecd56dce..2829b9a5 100644
+--- a/libarchive/archive_read_open_file.c
++++ b/libarchive/archive_read_open_file.c
+@@ -146,7 +146,7 @@ FILE_skip(struct archive *a, void *client_data, int64_t request)
+ 
+ 	/* If request is too big for a long or an off_t, reduce it. */
+ 	if (sizeof(request) > sizeof(skip)) {
+-		int64_t max_skip =
++		const int64_t max_skip =
+ 		    (((int64_t)1 << (skip_bits - 1)) - 1) * 2 + 1;
+ 		if (request > max_skip)
+ 			skip = max_skip;
+@@ -177,39 +177,42 @@ FILE_seek(struct archive *a, void *client_data, int64_t request, int whence)
+ {
+ 	struct read_FILE_data *mine = (struct read_FILE_data *)client_data;
+ #if HAVE__FSEEKI64
+-	int64_t skip = request;
++	int64_t seek = request;
+ #elif HAVE_FSEEKO
+-	off_t skip = (off_t)request;
++	off_t seek = (off_t)request;
+ #else
+-	long skip = (long)request;
++	long seek = (long)request;
+ #endif
+-	int skip_bits = sizeof(skip) * 8 - 1;
++	int seek_bits = sizeof(seek) * 8 - 1;
+ 	(void)a; /* UNUSED */
+ 
+-	/* If request is too big for a long or an off_t, reduce it. */
+-	if (sizeof(request) > sizeof(skip)) {
+-		int64_t max_skip =
+-		    (((int64_t)1 << (skip_bits - 1)) - 1) * 2 + 1;
+-		if (request > max_skip)
+-			skip = max_skip;
++	/* Reduce a request that would overflow the 'seek' variable. */
++	if (sizeof(request) > sizeof(seek)) {
++		const int64_t max_seek =
++		    (((int64_t)1 << (seek_bits - 1)) - 1) * 2 + 1;
++		const int64_t min_seek = ~max_seek;
++		if (request > max_seek)
++			seek = max_seek;
++		else if (request < min_seek)
++			seek = min_seek;
+ 	}
+ 
+ #ifdef __ANDROID__
+ 	/* Newer Android versions have fseeko...to meditate. */
+-	int64_t ret = lseek(fileno(mine->f), skip, whence);
++	int64_t ret = lseek(fileno(mine->f), seek, whence);
+ 	if (ret >= 0) {
+ 		return ret;
+ 	}
+ #elif HAVE__FSEEKI64
+-	if (_fseeki64(mine->f, skip, whence) == 0) {
++	if (_fseeki64(mine->f, seek, whence) == 0) {
+ 		return _ftelli64(mine->f);
+ 	}
+ #elif HAVE_FSEEKO
+-	if (fseeko(mine->f, skip, whence) == 0) {
++	if (fseeko(mine->f, seek, whence) == 0) {
+ 		return ftello(mine->f);
+ 	}
+ #else
+-	if (fseek(mine->f, skip, whence) == 0) {
++	if (fseek(mine->f, seek, whence) == 0) {
+ 		return ftell(mine->f);
+ 	}
+ #endif
+@@ -227,4 +230,4 @@ FILE_close(struct archive *a, void *client_data)
+ 	free(mine->buffer);
+ 	free(mine);
+ 	return (ARCHIVE_OK);
+-}
+\ No newline at end of file
++}
+diff --git a/libarchive/archive_read_open_filename.c b/libarchive/archive_read_open_filename.c
+index 05f0ffbd..3894b15c 100644
+--- a/libarchive/archive_read_open_filename.c
++++ b/libarchive/archive_read_open_filename.c
+@@ -449,20 +449,24 @@ file_skip_lseek(struct archive *a, void *client_data, int64_t request)
+ 	struct read_file_data *mine = (struct read_file_data *)client_data;
+ #if defined(_WIN32) && !defined(__CYGWIN__)
+ 	/* We use _lseeki64() on Windows. */
+-	int64_t old_offset, new_offset;
++	int64_t old_offset, new_offset, skip = request;
+ #else
+-	off_t old_offset, new_offset;
++	off_t old_offset, new_offset, skip = (off_t)request;
+ #endif
++	int skip_bits = sizeof(skip) * 8 - 1;
+ 
+ 	/* We use off_t here because lseek() is declared that way. */
+ 
+-	/* TODO: Deal with case where off_t isn't 64 bits.
+-	 * This shouldn't be a problem on Linux or other POSIX
+-	 * systems, since the configuration logic for libarchive
+-	 * tries to obtain a 64-bit off_t.
+-	 */
++	/* Reduce a request that would overflow the 'skip' variable. */
++	if (sizeof(request) > sizeof(skip)) {
++		const int64_t max_skip =
++		    (((int64_t)1 << (skip_bits - 1)) - 1) * 2 + 1;
++		if (request > max_skip)
++			skip = max_skip;
++	}
++
+ 	if ((old_offset = lseek(mine->fd, 0, SEEK_CUR)) >= 0 &&
+-	    (new_offset = lseek(mine->fd, request, SEEK_CUR)) >= 0)
++	    (new_offset = lseek(mine->fd, skip, SEEK_CUR)) >= 0)
+ 		return (new_offset - old_offset);
+ 
+ 	/* If lseek() fails, don't bother trying again. */
+@@ -510,11 +514,24 @@ static int64_t
+ file_seek(struct archive *a, void *client_data, int64_t request, int whence)
+ {
+ 	struct read_file_data *mine = (struct read_file_data *)client_data;
++	off_t seek = (off_t)request;
+ 	int64_t r;
++	int seek_bits = sizeof(seek) * 8 - 1;
+ 
+ 	/* We use off_t here because lseek() is declared that way. */
+-	/* See above for notes about when off_t is less than 64 bits. */
+-	r = lseek(mine->fd, request, whence);
++
++	/* Reduce a request that would overflow the 'seek' variable. */
++	if (sizeof(request) > sizeof(seek)) {
++		const int64_t max_seek =
++		    (((int64_t)1 << (seek_bits - 1)) - 1) * 2 + 1;
++		const int64_t min_seek = ~max_seek;
++		if (request > max_seek)
++			seek = (off_t)max_seek;
++		else if (request < min_seek)
++			seek = (off_t)min_seek;
++	}
++
++	r = lseek(mine->fd, seek, whence);
+ 	if (r >= 0)
+ 		return r;
+ 
+diff --git a/libarchive/test/read_open_memory.c b/libarchive/test/read_open_memory.c
+index 6d2468cd..9262ab9d 100644
+--- a/libarchive/test/read_open_memory.c
++++ b/libarchive/test/read_open_memory.c
+@@ -168,7 +168,7 @@ memory_read_skip(struct archive *a, void *client_data, int64_t skip)
+ 
+ 	(void)a; /* UNUSED */
+ 	/* We can't skip by more than is available. */
+-	if ((off_t)skip > (off_t)(mine->end - mine->p))
++	if (skip > mine->end - mine->p)
+ 		skip = mine->end - mine->p;
+ 	/* Always do small skips by prime amounts. */
+ 	if (skip > 71)
+diff --git a/libarchive/test/test_sparse_basic.c b/libarchive/test/test_sparse_basic.c
+index 23cde567..93710cb6 100644
+--- a/libarchive/test/test_sparse_basic.c
++++ b/libarchive/test/test_sparse_basic.c
+@@ -606,7 +606,8 @@ DEFINE_TEST(test_sparse_basic)
+ 	verify_sparse_file(a, "file2", sparse_file2, 20);
+ 	/* Encoded non sparse; expect a data block but no sparse entries. */
+ 	verify_sparse_file(a, "file3", sparse_file3, 0);
+-	verify_sparse_file(a, "file4", sparse_file4, 2);
++	if (sizeof(off_t) > 4)
++		verify_sparse_file(a, "file4", sparse_file4, 2);
+ 
+ 	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
+ 
+@@ -633,7 +634,8 @@ DEFINE_TEST(test_sparse_basic)
+ 	verify_sparse_file(a, "file1", sparse_file1, 0);
+ 	verify_sparse_file(a, "file2", sparse_file2, 0);
+ 	verify_sparse_file(a, "file3", sparse_file3, 0);
+-	verify_sparse_file(a, "file4", sparse_file4, 0);
++	if (sizeof(off_t) > 4)
++		verify_sparse_file(a, "file4", sparse_file4, 0);
+ 
+ 	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
+ 
+diff --git a/libarchive/test/test_tar_large.c b/libarchive/test/test_tar_large.c
+index c1f37916..1cde3218 100644
+--- a/libarchive/test/test_tar_large.c
++++ b/libarchive/test/test_tar_large.c
+@@ -176,7 +176,7 @@ memory_read_skip(struct archive *a, void *_private, int64_t skip)
+ 	}
+ 	if (private->filebytes > 0) {
+ 		if (private->filebytes < skip)
+-			skip = (off_t)private->filebytes;
++			skip = private->filebytes;
+ 		private->filebytes -= skip;
+ 	} else {
+ 		skip = 0;
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918.patch
new file mode 100644
index 0000000000..6ca6f6678c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918.patch
@@ -0,0 +1,217 @@
+From dcbf1e0ededa95849f098d154a25876ed5754bcf Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <stoeckmann@users.noreply.github.com>
+Date: Tue, 15 Apr 2025 06:02:17 +0200
+Subject: [PATCH] Do not skip past EOF while reading (#2584)
+
+Make sure to not skip past end of file for better error messages. One
+such example is now visible with rar testsuite. You can see the
+difference already by an actually not useless use of cat:
+
+```
+$ cat .../test_read_format_rar_ppmd_use_after_free.rar | bsdtar -t
+bsdtar: Archive entry has empty or unreadable filename ... skipping.
+bsdtar: Archive entry has empty or unreadable filename ... skipping.
+bsdtar: Truncated input file (needed 119 bytes, only 0 available)
+bsdtar: Error exit delayed from previous errors.
+```
+
+compared to
+
+```
+$ bsdtar -tf .../test_read_format_rar_ppmd_use_after_free.rar
+bsdtar: Archive entry has empty or unreadable filename ... skipping.
+bsdtar: Archive entry has empty or unreadable filename ... skipping.
+bsdtar: Error exit delayed from previous errors.
+```
+
+Since the former cannot lseek, the error is a different one
+(ARCHIVE_FATAL vs ARCHIVE_EOF). The piped version states explicitly that
+truncation occurred, while the latter states EOF because the skip past
+the end of file was successful.
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+
+CVE: CVE-2025-5918
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/dcbf1e0ededa95849f098d154a25876ed5754bcf]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libarchive/archive_read_open_fd.c       | 13 +++++++---
+ libarchive/archive_read_open_file.c     | 33 +++++++++++++++++++------
+ libarchive/archive_read_open_filename.c | 16 +++++++++---
+ libarchive/test/test_read_format_rar.c  |  6 ++---
+ 4 files changed, 50 insertions(+), 18 deletions(-)
+
+diff --git a/libarchive/archive_read_open_fd.c b/libarchive/archive_read_open_fd.c
+index 3fd536d5..dc7c9e52 100644
+--- a/libarchive/archive_read_open_fd.c
++++ b/libarchive/archive_read_open_fd.c
+@@ -53,6 +53,7 @@ __FBSDID("$FreeBSD: head/lib/libarchive/archive_read_open_fd.c 201103 2009-12-28
+ struct read_fd_data {
+ 	int	 fd;
+ 	size_t	 block_size;
++	int64_t	 size;
+ 	char	 use_lseek;
+ 	void	*buffer;
+ };
+@@ -96,6 +97,7 @@ archive_read_open_fd(struct archive *a, int fd, size_t block_size)
+ 	if (S_ISREG(st.st_mode)) {
+ 		archive_read_extract_set_skip_file(a, st.st_dev, st.st_ino);
+ 		mine->use_lseek = 1;
++		mine->size = st.st_size;
+ 	}
+ #if defined(__CYGWIN__) || defined(_WIN32)
+ 	setmode(mine->fd, O_BINARY);
+@@ -152,9 +154,14 @@ file_skip(struct archive *a, void *client_data, int64_t request)
+ 	if (skip == 0)
+ 		return (0);
+ 
+-	if (((old_offset = lseek(mine->fd, 0, SEEK_CUR)) >= 0) &&
+-	    ((new_offset = lseek(mine->fd, skip, SEEK_CUR)) >= 0))
+-		return (new_offset - old_offset);
++	if ((old_offset = lseek(mine->fd, 0, SEEK_CUR)) >= 0) {
++		if (old_offset >= mine->size ||
++		    skip > mine->size - old_offset) {
++			/* Do not seek past end of file. */
++			errno = ESPIPE;
++		} else if ((new_offset = lseek(mine->fd, skip, SEEK_CUR)) >= 0)
++			return (new_offset - old_offset);
++	}
+ 
+ 	/* If seek failed once, it will probably fail again. */
+ 	mine->use_lseek = 0;
+diff --git a/libarchive/archive_read_open_file.c b/libarchive/archive_read_open_file.c
+index 2829b9a5..6ed18a0c 100644
+--- a/libarchive/archive_read_open_file.c
++++ b/libarchive/archive_read_open_file.c
+@@ -53,6 +53,7 @@ __FBSDID("$FreeBSD: head/lib/libarchive/archive_read_open_file.c 201093 2009-12-
+ struct read_FILE_data {
+ 	FILE    *f;
+ 	size_t	 block_size;
++	int64_t	 size;
+ 	void	*buffer;
+ 	char	 can_skip;
+ };
+@@ -92,6 +93,7 @@ archive_read_open_FILE(struct archive *a, FILE *f)
+ 		archive_read_extract_set_skip_file(a, st.st_dev, st.st_ino);
+ 		/* Enable the seek optimization only for regular files. */
+ 		mine->can_skip = 1;
++		mine->size = st.st_size;
+ 	}
+ 
+ #if defined(__CYGWIN__) || defined(_WIN32)
+@@ -131,6 +133,7 @@ FILE_skip(struct archive *a, void *client_data, int64_t request)
+ #else
+ 	long skip = (long)request;
+ #endif
++	int64_t old_offset, new_offset;
+ 	int skip_bits = sizeof(skip) * 8 - 1;
+ 
+ 	(void)a; /* UNUSED */
+@@ -154,19 +157,33 @@ FILE_skip(struct archive *a, void *client_data, int64_t request)
+ 
+ #ifdef __ANDROID__
+         /* fileno() isn't safe on all platforms ... see above. */
+-	if (lseek(fileno(mine->f), skip, SEEK_CUR) < 0)
++	old_offset = lseek(fileno(mine->f), 0, SEEK_CUR);
+ #elif HAVE_FSEEKO
+-	if (fseeko(mine->f, skip, SEEK_CUR) != 0)
++	old_offset = ftello(mine->f);
+ #elif HAVE__FSEEKI64
+-	if (_fseeki64(mine->f, skip, SEEK_CUR) != 0)
++	old_offset = _ftelli64(mine->f);
+ #else
+-	if (fseek(mine->f, skip, SEEK_CUR) != 0)
++	old_offset = ftell(mine->f);
+ #endif
+-	{
+-		mine->can_skip = 0;
+-		return (0);
++	if (old_offset >= 0) {
++		if (old_offset < mine->size &&
++		    skip <= mine->size - old_offset) {
++#ifdef __ANDROID__
++			new_offset = lseek(fileno(mine->f), skip, SEEK_CUR);
++#elif HAVE__FSEEKI64
++			new_offset = _fseeki64(mine->f, skip, SEEK_CUR);
++#elif HAVE_FSEEKO
++			new_offset = fseeko(mine->f, skip, SEEK_CUR);
++#else
++			new_offset = fseek(mine->f, skip, SEEK_CUR);
++#endif
++			if (new_offset >= 0)
++				return (new_offset - old_offset);
++		}
+ 	}
+-	return (request);
++
++	mine->can_skip = 0;
++	return (0);
+ }
+ 
+ /*
+diff --git a/libarchive/archive_read_open_filename.c b/libarchive/archive_read_open_filename.c
+index 3894b15c..5f5b3f1f 100644
+--- a/libarchive/archive_read_open_filename.c
++++ b/libarchive/archive_read_open_filename.c
+@@ -75,6 +75,7 @@ struct read_file_data {
+ 	size_t	 block_size;
+ 	void	*buffer;
+ 	mode_t	 st_mode;  /* Mode bits for opened file. */
++	int64_t	 size;
+ 	char	 use_lseek;
+ 	enum fnt_e { FNT_STDIN, FNT_MBS, FNT_WCS } filename_type;
+ 	union {
+@@ -370,8 +371,10 @@ file_open(struct archive *a, void *client_data)
+ 	mine->st_mode = st.st_mode;
+ 
+ 	/* Disk-like inputs can use lseek(). */
+-	if (is_disk_like)
++	if (is_disk_like) {
+ 		mine->use_lseek = 1;
++		mine->size = st.st_size;
++	}
+ 
+ 	return (ARCHIVE_OK);
+ fail:
+@@ -465,9 +468,14 @@ file_skip_lseek(struct archive *a, void *client_data, int64_t request)
+ 			skip = max_skip;
+ 	}
+ 
+-	if ((old_offset = lseek(mine->fd, 0, SEEK_CUR)) >= 0 &&
+-	    (new_offset = lseek(mine->fd, skip, SEEK_CUR)) >= 0)
+-		return (new_offset - old_offset);
++	if ((old_offset = lseek(mine->fd, 0, SEEK_CUR)) >= 0) {
++		if (old_offset >= mine->size ||
++		    skip > mine->size - old_offset) {
++			/* Do not seek past end of file. */
++			errno = ESPIPE;
++		} else if ((new_offset = lseek(mine->fd, skip, SEEK_CUR)) >= 0)
++			return (new_offset - old_offset);
++	}
+ 
+ 	/* If lseek() fails, don't bother trying again. */
+ 	mine->use_lseek = 0;
+diff --git a/libarchive/test/test_read_format_rar.c b/libarchive/test/test_read_format_rar.c
+index dce567af..fce44a9d 100644
+--- a/libarchive/test/test_read_format_rar.c
++++ b/libarchive/test/test_read_format_rar.c
+@@ -3776,8 +3776,8 @@ DEFINE_TEST(test_read_format_rar_ppmd_use_after_free)
+   assertA(ARCHIVE_OK == archive_read_next_header(a, &ae));
+   assertA(archive_read_data(a, buf, sizeof(buf)) <= 0);
+ 
+-  /* Test EOF */
+-  assertA(1 == archive_read_next_header(a, &ae));
++  /* Test for truncation */
++  assertA(ARCHIVE_FATAL == archive_read_next_header(a, &ae));
+ 
+   assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
+   assertEqualInt(ARCHIVE_OK, archive_read_free(a));
+@@ -3803,7 +3803,7 @@ DEFINE_TEST(test_read_format_rar_ppmd_use_after_free2)
+   assertA(archive_read_data(a, buf, sizeof(buf)) <= 0);
+ 
+   /* Test EOF */
+-  assertA(1 == archive_read_next_header(a, &ae));
++  assertA(ARCHIVE_FATAL == archive_read_next_header(a, &ae));
+ 
+   assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
+   assertEqualInt(ARCHIVE_OK, archive_read_free(a));
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index 3937bfb82d..bfd4df8ad1 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -39,6 +39,9 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2025-5915.patch \
            file://CVE-2025-5916.patch \
            file://CVE-2025-5917.patch \
+           file://0001-FILE-seeking-support-2539.patch \
+           file://0001-Improve-lseek-handling-2564.patch \
+           file://CVE-2025-5918.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 

