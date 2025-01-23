Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5C6C0218E
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 03:00:27 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.3133.1737601219752013012
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 19:00:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=D4BtOx0o;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so696682a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 19:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737601219; x=1738206019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Efpi1VehyAEcBGzQOxmSWtug7ck03PD5IgCNQgQA78I=;
        b=D4BtOx0oQVrDZzRE9dtmYGQq4EcLFwHFDZZ+0gk3JeZHWbBxYzlnsH8ii2MxKoa1r3
         UnKkomRk8uqgJDMk0gISfoxt79ige3ep9XAiaxckQSnyC+Tf5O29eaRHgM9MFIIvGl0Q
         wulat7gvCVeGPDFLYsNCJK/i5q21VXtHTkJEu/AYFO0cQZ4d2Biw6dkvM9cxKggDDIOp
         4l07cH/fz/KqyWqlHqA57OS/DWp8If722hm9Js3DYpQ6zCFypHryfalYuvq2QMyG5glo
         lat9LTxvaIoMJADVd43BX5lax6XpexiJOAuKBQKLNVyCMN8PWEpRk29E7Dm1VlMHCA49
         k0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737601219; x=1738206019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Efpi1VehyAEcBGzQOxmSWtug7ck03PD5IgCNQgQA78I=;
        b=mG45fzUbW0TkLfGnM0l02FurgU1UnNPVNg1kO+PifzMi9g6WtAQHOYe7j1c/LFKy34
         QI2Fe6R+GrOhka2G7Ab+tGGYHO+xe7dW+Rzd1DY3Wn21/ymto+y8S0oQE3u8gGakukoy
         tru+g5+LlQBKHw4FVb66YtH3Ebb6RytJaO8+KMxps169bx5wGE21Kxl2DxrOr6PpFUSS
         8uxNeZ3ww3E4oXY5pWP19n1gsiCesGXRyMSdw0BfgwdM1Eddjd+ILHSXOnvdql4W1Umh
         jmMydpLfZWuM+BsRxzsTQ7ic0KplQdDdp99EVIUk2kqcgpQ9LtUGEzzy+Hl3MN3Nr2Hb
         IQ3A==
X-Gm-Message-State: AOJu0Yz11ld+PAZoJwuWpXxa4wnPt5Me/l8lvgFdi3rIe/PpHdSeXSsb
	Kfmz7hj8Gav4UvACbqhC2yfDTQ1XszajUjzSS3l1eUvuE2lsC1NozeU0eQNC1+r+A/SH7HMwjT8
	qpa0=
X-Gm-Gg: ASbGncsRXYfvppGmqw6hPjSRxCy3J8pxMenS4QZH8a/tlAft5qPgqCu3M5/a6+y1lkc
	xpcLkdEJN6Xi1Y3uXNjoHFzFBefLJiRe+fqp7ERYMH5LGnKSx0kf+Yhq8R1P4gW5UpRRpl3qN9B
	s49ll4cENkp49XLXH58E9ShU1rcLaTbIWJYlY7imhmc+wsVZS5hdsEqqTgzcexJNSyYGNr9+MpB
	F0jemp7+4PviXP+rcZSO/TRhThJiC2N2hphrgnExPYhy9facrJz7wglv17Wi6SDChBx/A==
X-Google-Smtp-Source: AGHT+IHJwqy3TggVCO8qNz7xMUre/v7x+SS1KeHKtJp0BfXsorejFdVn5XMm0Wh2Bm7pQhIOYgddkA==
X-Received: by 2002:a05:6a00:428d:b0:71e:4786:98ee with SMTP id d2e1a72fcca58-72dafae88b0mr33123524b3a.21.1737601218900;
        Wed, 22 Jan 2025 19:00:18 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab816accsm12048389b3a.69.2025.01.22.19.00.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 19:00:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/8] rsync: fix CVE-2024-12747
Date: Wed, 22 Jan 2025 18:59:56 -0800
Message-ID: <e85beb88add5e94567d7221e00cabfb3d5010be7.1737601063.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737601063.git.steve@sakoman.com>
References: <cover.1737601063.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 03:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210171

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
index 169650fe91..d0796d3c12 100644
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


