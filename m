Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB64C0218C
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 17:51:35 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.42252.1737395487540887087
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 09:51:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QV+2/ii3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2164b1f05caso85817035ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 09:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737395487; x=1738000287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMZlwOEpUnjmaA+u19KbEtXQ7GcA9wYP2kjgXfyxSUQ=;
        b=QV+2/ii3yETQzfJcmvA5IKnGDGX8NLC9yIwP//mEXKFfB1Fz/acuBt4fBtbmIgv8pE
         6sYkKk/wD6ctNPSZVaW8Fi/qvz9DCEvFRWgbEmby5HV9kMTe1z/A4FhwdgvFwSTBJ6kp
         cdc5Nwx2+A3BLcNIEZmSrFaY+hN3bH+1euR3sUflwWR79qz3tJ+AZ5sQfQblhCNS+1Rp
         KgJcionGl+TTomfwsGZMnRLE5GZhmFrQFXZXWsXT1oYnSu1+Cyfrz/ScutoQEs1ci0KB
         Eo/fjKkTAwI8wgCYPO9UFvJh1e17exSa9CnCMS6C5tvhkpShc9b4mFQMzpNTDOa717Gr
         VpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737395487; x=1738000287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMZlwOEpUnjmaA+u19KbEtXQ7GcA9wYP2kjgXfyxSUQ=;
        b=rjAeeTjui5rAEX0iz+mTmrcl0cNXVHTaGk54im6eH/HjsoKvsJp4z5RsIohmXUPOyu
         LNrTk1EaS0hZjPqxwWblBny+GjyLnithMP3COFQw+CriEBO/haboxmZjD1M6/vicxEHV
         9NrHwRz3w87fMBoDH2ppnDSXxZ8bTrV38qLAfq6ej3ZeYWJDdkCCZlB9QG4+37YodNYy
         fZwSIQE7+rui0UqEijEA8/ElsQEg0O4YR+jwHv6jLqFfAtV0OhjBDs7zJlHM/TbROL+O
         EIX4IKpxD0RIOsuBvkspj0aEYBGsdc9NxOq89DK1+hD0dcLz4US0k+d0kI6gKBTZyfpl
         S1Wg==
X-Gm-Message-State: AOJu0Yx+bofYv28rlfViV9s7LMaxAGfK8/6+K7KyjwdppyYkf/4YO1yG
	9nVX4ra7Uee34P+mEFpRgXEGF05h3pmVH1f1NCDRVhQ0dov9/XEnhXvn9KkPbpk0v9sViES5SWO
	XGU0=
X-Gm-Gg: ASbGncv6bikqkbdm1583ZNVCyN5QdBsQDXProrVb9Q5Keop+v08P5zIpIcVuWk4N+aj
	LbftEY2VoMa7cczIklDqzr16iHqydiI3iTMpfy7LlnBcjtw54qbwYHaIYxNQezHFDhUIBvEZZxy
	fWOPALrj8NCSQh/lRpUCbd9cnjizjB8j2Pey4HVZJ03hwnMSjDP5WxxcDliA9LDqQSzglurCU9Z
	+BOJTi1uZ7lsw+gpMXw9aBFIhObi7h1MBX0Gdfi+88bGFwZfygp2x6PJNM=
X-Google-Smtp-Source: AGHT+IEx8rauFBS8nXTxBYURiVu3wUWdX7z/q50AmRe/LIrreoc1Iq0llG4MYRVvqQae3QiG4qI6kg==
X-Received: by 2002:a05:6a20:7491:b0:1e3:cf57:5f5f with SMTP id adf61e73a8af0-1eb21568535mr21562463637.27.1737395486775;
        Mon, 20 Jan 2025 09:51:26 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcdcf643esm6155565a12.38.2025.01.20.09.51.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:51:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/16] rsync: fix CVE-2024-12747
Date: Mon, 20 Jan 2025 09:50:56 -0800
Message-ID: <c0905ffb2f1aa3bc4c6187ff4860dcc8d3dbfb01.1737395091.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737395091.git.steve@sakoman.com>
References: <cover.1737395091.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 17:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210056

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in rsync. This vulnerability arises from a race condition during
rsync's handling of symbolic links. Rsync's default behavior when encountering
symbolic links is to skip them. If an attacker replaced a regular file with a
symbolic link at the right time, it was possible to bypass the default behavior
and traverse symbolic links. Depending on the privileges of the rsync process,
an attacker could leak sensitive information, potentially leading to privilege escalation.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../rsync/files/CVE-2024-12747.patch          | 192 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   1 +
 2 files changed, 193 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12747.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12747.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12747.patch
new file mode 100644
index 0000000000..b1dd0a03b9
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12747.patch
@@ -0,0 +1,192 @@
+From 0590b09d9a34ae72741b91ec0708a820650198b0 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Wed, 18 Dec 2024 08:59:42 +1100
+Subject: [PATCH] fixed symlink race condition in sender
+
+when we open a file that we don't expect to be a symlink use
+O_NOFOLLOW to prevent a race condition where an attacker could change
+a file between being a normal file and a symlink
+
+CVE: CVE-2024-12747
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=0590b09d9a34ae72741b91ec0708a820650198b0]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ checksum.c  |  2 +-
+ flist.c     |  2 +-
+ generator.c |  4 ++--
+ receiver.c  |  2 +-
+ sender.c    |  2 +-
+ syscall.c   | 20 ++++++++++++++++++++
+ t_unsafe.c  |  3 +++
+ tls.c       |  3 +++
+ trimslash.c |  2 ++
+ util1.c     |  2 +-
+ 10 files changed, 35 insertions(+), 7 deletions(-)
+
+diff --git a/checksum.c b/checksum.c
+index cb21882c..66e80896 100644
+--- a/checksum.c
++++ b/checksum.c
+@@ -406,7 +406,7 @@ void file_checksum(const char *fname, const STRUCT_STAT *st_p, char *sum)
+	int32 remainder;
+	int fd;
+
+-	fd = do_open(fname, O_RDONLY, 0);
++	fd = do_open_checklinks(fname);
+	if (fd == -1) {
+		memset(sum, 0, file_sum_len);
+		return;
+diff --git a/flist.c b/flist.c
+index 087f9da6..17832533 100644
+--- a/flist.c
++++ b/flist.c
+@@ -1390,7 +1390,7 @@ struct file_struct *make_file(const char *fname, struct file_list *flist,
+
+	if (copy_devices && am_sender && IS_DEVICE(st.st_mode)) {
+		if (st.st_size == 0) {
+-			int fd = do_open(fname, O_RDONLY, 0);
++			int fd = do_open_checklinks(fname);
+			if (fd >= 0) {
+				st.st_size = get_device_size(fd, fname);
+				close(fd);
+diff --git a/generator.c b/generator.c
+index 110db28f..3f13bb95 100644
+--- a/generator.c
++++ b/generator.c
+@@ -1798,7 +1798,7 @@ static void recv_generator(char *fname, struct file_struct *file, int ndx,
+
+	if (write_devices && IS_DEVICE(sx.st.st_mode) && sx.st.st_size == 0) {
+		/* This early open into fd skips the regular open below. */
+-		if ((fd = do_open(fnamecmp, O_RDONLY, 0)) >= 0)
++		if ((fd = do_open_nofollow(fnamecmp, O_RDONLY)) >= 0)
+			real_sx.st.st_size = sx.st.st_size = get_device_size(fd, fnamecmp);
+	}
+
+@@ -1867,7 +1867,7 @@ static void recv_generator(char *fname, struct file_struct *file, int ndx,
+	}
+
+	/* open the file */
+-	if (fd < 0 && (fd = do_open(fnamecmp, O_RDONLY, 0)) < 0) {
++	if (fd < 0 && (fd = do_open_checklinks(fnamecmp)) < 0) {
+		rsyserr(FERROR, errno, "failed to open %s, continuing",
+			full_fname(fnamecmp));
+	  pretend_missing:
+diff --git a/receiver.c b/receiver.c
+index 8031b8f4..edfbb210 100644
+--- a/receiver.c
++++ b/receiver.c
+@@ -775,7 +775,7 @@ int recv_files(int f_in, int f_out, char *local_name)
+			if (fnamecmp != fname) {
+				fnamecmp = fname;
+				fnamecmp_type = FNAMECMP_FNAME;
+-				fd1 = do_open(fnamecmp, O_RDONLY, 0);
++				fd1 = do_open_nofollow(fnamecmp, O_RDONLY);
+			}
+
+			if (fd1 == -1 && basis_dir[0]) {
+diff --git a/sender.c b/sender.c
+index 2bbff2fa..a4d46c39 100644
+--- a/sender.c
++++ b/sender.c
+@@ -350,7 +350,7 @@ void send_files(int f_in, int f_out)
+			exit_cleanup(RERR_PROTOCOL);
+		}
+
+-		fd = do_open(fname, O_RDONLY, 0);
++		fd = do_open_checklinks(fname);
+		if (fd == -1) {
+			if (errno == ENOENT) {
+				enum logcode c = am_daemon && protocol_version < 28 ? FERROR : FWARNING;
+diff --git a/syscall.c b/syscall.c
+index 081357bb..8cea2900 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -45,6 +45,8 @@ extern int preallocate_files;
+ extern int preserve_perms;
+ extern int preserve_executability;
+ extern int open_noatime;
++extern int copy_links;
++extern int copy_unsafe_links;
+
+ #ifndef S_BLKSIZE
+ # if defined hpux || defined __hpux__ || defined __hpux
+@@ -788,3 +790,21 @@ cleanup:
+	return retfd;
+ #endif // O_NOFOLLOW, O_DIRECTORY
+ }
++
++/*
++  varient of do_open/do_open_nofollow which does do_open() if the
++  copy_links or copy_unsafe_links options are set and does
++  do_open_nofollow() otherwise
++
++  This is used to prevent a race condition where an attacker could be
++  switching a file between being a symlink and being a normal file
++
++  The open is always done with O_RDONLY flags
++ */
++int do_open_checklinks(const char *pathname)
++{
++	if (copy_links || copy_unsafe_links) {
++		return do_open(pathname, O_RDONLY, 0);
++	}
++	return do_open_nofollow(pathname, O_RDONLY);
++}
+diff --git a/t_unsafe.c b/t_unsafe.c
+index 010cac50..e10619a2 100644
+--- a/t_unsafe.c
++++ b/t_unsafe.c
+@@ -28,6 +28,9 @@ int am_root = 0;
+ int am_sender = 1;
+ int read_only = 0;
+ int list_only = 0;
++int copy_links = 0;
++int copy_unsafe_links = 0;
++
+ short info_levels[COUNT_INFO], debug_levels[COUNT_DEBUG];
+
+ int
+diff --git a/tls.c b/tls.c
+index e6b0708a..858f8f10 100644
+--- a/tls.c
++++ b/tls.c
+@@ -49,6 +49,9 @@ int list_only = 0;
+ int link_times = 0;
+ int link_owner = 0;
+ int nsec_times = 0;
++int safe_symlinks = 0;
++int copy_links = 0;
++int copy_unsafe_links = 0;
+
+ #ifdef SUPPORT_XATTRS
+
+diff --git a/trimslash.c b/trimslash.c
+index 1ec928ca..f2774cd7 100644
+--- a/trimslash.c
++++ b/trimslash.c
+@@ -26,6 +26,8 @@ int am_root = 0;
+ int am_sender = 1;
+ int read_only = 1;
+ int list_only = 0;
++int copy_links = 0;
++int copy_unsafe_links = 0;
+
+ int
+ main(int argc, char **argv)
+diff --git a/util1.c b/util1.c
+index f260d398..d84bc414 100644
+--- a/util1.c
++++ b/util1.c
+@@ -365,7 +365,7 @@ int copy_file(const char *source, const char *dest, int tmpfilefd, mode_t mode)
+	int len;   /* Number of bytes read into `buf'. */
+	OFF_T prealloc_len = 0, offset = 0;
+
+-	if ((ifd = do_open(source, O_RDONLY, 0)) < 0) {
++	if ((ifd = do_open_nofollow(source, O_RDONLY)) < 0) {
+		int save_errno = errno;
+		rsyserr(FERROR_XFER, errno, "open %s", full_fname(source));
+		errno = save_errno;
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index df3627ed53..37e79e1e56 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2024-12087-0002.patch \
            file://CVE-2024-12087-0003.patch \
            file://CVE-2024-12088.patch \
+           file://CVE-2024-12747.patch \
            "
 
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
-- 
2.43.0


