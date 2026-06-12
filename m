Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C350CD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 12:15:30 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69132.1781266523103137882
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 05:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IEhevZtt;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=16958; q=dns/txt;
  s=iport01; t=1781266523; x=1782476123;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3M2CKGK8Jwg+wFlZqSve07XpkbO5lAFnYEW3nAbpOO4=;
  b=IEhevZttdQGvaN2LR2x96O9ZDY9+BWF9RUVZEKY8xlqAqKWU7eCm9k5A
   YmVRx9VrsnxYpZYIn2HrEmQGJKXpg4V+Esd1/M6fq+bHUTw0p5dMVgNvy
   b3AchqDUn6Mx/m5R8QQAP0UFAx4avslAkLrfzIIrLFbIeucRd7/hwyfN4
   jEFvefmgf3xsKwZJUzC9Z7zK25QUVvsdgtEHqFuOM4g6EImxWZsSi96gl
   RNSyeUjqsWAS+6yuhWCl9tCxCutJIHhLUDEXNUqbELqjpQSsfsRbVf8rB
   lBIfr24WOYz3wzT1/29RysXEooLX0zabupLDq2pjv4ZuqGDn5fIqZ7W6T
   g==;
X-CSE-ConnectionGUID: 4qTfFN6PQGqkqFJy/mRkVg==
X-CSE-MsgGUID: mBsIkyBPR6io2wZ8fhmYeQ==
X-IPAS-Result: =?us-ascii?q?A0AmAADn9itq/5D/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0X0JJjHOJWIEWnQiBfg8BAQEPRA0EAQGFBo1CAiY0CQ4BAgQDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAgEqCwEYAS0sAwECWiMhgwIBg?=
 =?us-ascii?q?nMCARGyPRo3gXkzgQGDKAE/AkNQ2ywBCxQBBYEzAYU+iB9bGAGEfCcbG4Fyg?=
 =?us-ascii?q?RWBO4E4doEFgVwCAgEXgQ2GfgSCInoSgVsCHo5rSIEeA1ksAVUTDQoLBwWBZ?=
 =?us-ascii?q?gM1EioVbjIdgSM+F4EMGwcFgUqBK2qBA4UNIx8DOX+BdIEoZ2kVMDWBAQERE?=
 =?us-ascii?q?gMLGA1IESw3FBsEPm4HjEIXD4I+ASxHBxMBExh/EggqFCEvU5JgCQE4kgaBN?=
 =?us-ascii?q?Z9aCiiDdYwhj0KFeBozhASUF5JRC5h9jgqVNIEchGiBaDyBRA4HcBWDIglKG?=
 =?us-ascii?q?Q+OCx8DCwuDYIUTwnwkNQIJMgEBBwIHDgMLgWiQAAImB4FOAQE?=
IronPort-Data: A9a23:EpCb3qqmQBF313IZ2Y70klss091eBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmOaa6KYmfyKN4laY3n/B5Qv5HRm4RrT1dlrXhhECxD+ePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgPNNwJcaDpOtfrd8Uk35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0rpuPW9g0
 6IgER8UbQmtpfPxxYi4dOY506zPLOGzVG8ekmtrwTecCbMtRorOBv2Vo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVPrSn8/w7pX7WzRDsFuPoKMty2PS1wd2lrPqNbI5f/TWFJ4KzxbD+
 z+uE2LRBzsBFd+O4wK/rHOr3PD9zS37XbMfLejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZN5ottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:pVxP1KAeAijm0m7lHemA55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoWpPhfZq0z/cciuMs1NyZMjUO1lHFEGhK1/qH/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:0Wp7d2O4OK46De5DBDBb+mAyRPgcXWTe1VnyMgi9M2VXR+jA
X-Talos-MUID: 9a23:qZiTMQj5FJ1/pTh1gw/OwMMpMe1zwqe/Ing3z5QB4da2ZSJwPgaQtWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,200,1774310400"; 
   d="scan'208";a="493798355"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Jun 2026 12:15:22 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id C7A5C1800023E;
	Fri, 12 Jun 2026 12:15:21 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 4B45FCC1611; Fri, 12 Jun 2026 05:15:21 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-29518
Date: Fri, 12 Jun 2026 05:13:29 -0700
Message-ID: <20260612121514.2282121-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 12:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238607

From: Ashishkumar Parmar <asparmar@cisco.com>

Pick the upstream backport [1] for CVE-2026-29518 as mentioned in [3],
where a non-chrooted rsync daemon could be exposed to a parent path
TOCTOU race that allowed file access outside the module.

Also include the dependent upstream fix that followed the CVE fix:
- CVE-2026-29518_p2.patch [2] secures sender read-path opens by
  opening files from the module root, closing the same race on the
  read side.

[1] https://github.com/RsyncProject/rsync/commit/1a5ad81add1004354a3d8ba841b94ffe19cd2505
[2] https://github.com/RsyncProject/rsync/commit/99b36291d06ca66229942c7a525a1f5566f10c85
[3] https://www.cve.org/CVERecord?id=CVE-2026-29518

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../rsync/files/CVE-2026-29518_p1.patch       | 330 ++++++++++++++++++
 .../rsync/files/CVE-2026-29518_p2.patch       |  73 ++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   2 +
 3 files changed, 405 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.patch b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.patch
new file mode 100644
index 0000000000..227ca56dd3
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.patch
@@ -0,0 +1,330 @@
+From c5192e125999130b7e15c621989839da31b15a05 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Wed, 31 Dec 2025 10:01:23 +1100
+Subject: [PATCH] syscall+clientserver: am_chrooted and use_secure_symlinks for
+ daemon-no-chroot (CVE-2026-29518)
+
+CVE-2026-29518: an rsync daemon configured with "use chroot = no"
+is exposed to a TOCTOU race on parent path components. A local
+attacker with write access to a module can replace a parent
+directory component with a symlink between the receiver's check
+and its open(), redirecting reads (basis-file disclosure) and
+writes (file overwrite) outside the module. Under elevated daemon
+privilege this allows privilege escalation. Default
+"use chroot = yes" is not exposed.
+
+Add secure_relative_open() in syscall.c. It walks the parent
+components under RESOLVE_BENEATH (Linux 5.6+) /
+O_RESOLVE_BENEATH (FreeBSD 13+, macOS 15+) / per-component
+O_NOFOLLOW elsewhere, anchored at a trusted dirfd, so a parent-
+symlink swap is rejected by the kernel. Route the receiver's
+basis-file open in receiver.c through it when use_secure_symlinks
+is set in clientserver.c rsync_module().
+
+Reporters: Nullx3D (Batuhan SANCAK); Damien Neil; Michael Stapelberg.
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-29518
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/1a5ad81add1004354a3d8ba841b94ffe19cd2505]
+
+(cherry picked from commit 1a5ad81add1004354a3d8ba841b94ffe19cd2505)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ clientserver.c |  25 +++++++++
+ options.c      |   9 ++++
+ receiver.c     |  22 ++++++--
+ syscall.c      | 139 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 192 insertions(+), 3 deletions(-)
+
+diff --git a/clientserver.c b/clientserver.c
+index 7c897abc..b6eba098 100644
+--- a/clientserver.c
++++ b/clientserver.c
+@@ -30,6 +30,7 @@ extern int list_only;
+ extern int am_sender;
+ extern int am_server;
+ extern int am_daemon;
++extern int am_chrooted;
+ extern int am_root;
+ extern int msgs2stderr;
+ extern int rsync_port;
+@@ -38,6 +39,7 @@ extern int ignore_errors;
+ extern int preserve_xattrs;
+ extern int kluge_around_eof;
+ extern int munge_symlinks;
++extern int use_secure_symlinks;
+ extern int open_noatime;
+ extern int sanitize_paths;
+ extern int numeric_ids;
+@@ -981,6 +983,7 @@ static int rsync_module(int f_in, int f_out, int i, const char *addr, const char
+ 			io_printf(f_out, "@ERROR: chroot failed\n");
+ 			return -1;
+ 		}
++		am_chrooted = 1;
+ 		module_chdir = module_dir;
+ 	}
+ 
+@@ -1003,6 +1006,15 @@ static int rsync_module(int f_in, int f_out, int i, const char *addr, const char
+ 		}
+ 	}
+ 
++	/* Enable secure symlink handling for any non-chrooted daemon module.
++	 * This prevents TOCTOU race attacks where an attacker could switch a
++	 * directory to a symlink between path validation and file open.
++	 * Match the gate used by the do_*_at() wrappers in syscall.c
++	 * (am_daemon && !am_chrooted) -- the protection has nothing to do
++	 * with symlink munging, so a module configured with
++	 * "munge symlinks = false" must still get the secure-open path. */
++	use_secure_symlinks = am_daemon && !am_chrooted;
++
+ 	if (gid_list.count) {
+ 		gid_t *gid_array = gid_list.items;
+ 		if (setgid(gid_array[0])) {
+@@ -1305,6 +1317,19 @@ int start_daemon(int f_in, int f_out)
+ 			rsyserr(FLOG, errno, "daemon chroot(\"%s\") failed", p);
+ 			return -1;
+ 		}
++		/* Deliberately do NOT set am_chrooted here.  am_chrooted
++		 * gates the per-module symlink-race defenses
++		 * (secure_relative_open() and the do_*_at() wrappers in
++		 * syscall.c) and means "the kernel is enforcing path
++		 * confinement at the module boundary".  The daemon chroot
++		 * confines path resolution to the daemon-chroot directory,
++		 * not to any individual module path -- modules sharing the
++		 * daemon chroot are still distinguishable filesystem
++		 * subtrees and a sender-controlled symlink in module A
++		 * could redirect a syscall to module B (or to other files
++		 * inside the daemon chroot) without the per-module
++		 * defenses.  Leave am_chrooted=0 here so secure_relative_open()
++		 * still fires for "use chroot = no" modules. */
+ 		if (chdir("/") < 0) {
+ 			rsyserr(FLOG, errno, "daemon chdir(\"/\") failed");
+ 			return -1;
+diff --git a/options.c b/options.c
+index d38bbe8d..d4ca5396 100644
+--- a/options.c
++++ b/options.c
+@@ -113,11 +113,20 @@ int mkpath_dest_arg = 0;
+ int allow_inc_recurse = 1;
+ int xfer_dirs = -1;
+ int am_daemon = 0;
++/* Set after a successful per-module chroot ("use chroot = yes") in
++ * clientserver.c. NOT set for the daemon-level "daemon chroot = /X"
++ * chroot: that confines path resolution to /X, but module paths
++ * /X/modA, /X/modB, etc. are not chroot boundaries, so the per-module
++ * symlink-race defenses (secure_relative_open() / do_*_at() in
++ * syscall.c, gated by `am_daemon && !am_chrooted`) must still fire
++ * even when the daemon is inside a daemon chroot. */
++int am_chrooted = 0;
+ int connect_timeout = 0;
+ int keep_partial = 0;
+ int safe_symlinks = 0;
+ int copy_unsafe_links = 0;
+ int munge_symlinks = 0;
++int use_secure_symlinks = 0;
+ int size_only = 0;
+ int daemon_bwlimit = 0;
+ int bwlimit = 0;
+diff --git a/receiver.c b/receiver.c
+index 77de8697..cbe18196 100644
+--- a/receiver.c
++++ b/receiver.c
+@@ -70,6 +70,7 @@ extern int fuzzy_basis;
+ 
+ extern struct name_num_item *xfer_sum_nni;
+ extern int xfer_sum_len;
++extern int use_secure_symlinks;
+ 
+ static struct bitbag *delayed_bits = NULL;
+ static int phase = 0, redoing = 0;
+@@ -214,7 +215,12 @@ int open_tmpfile(char *fnametmp, const char *fname, struct file_struct *file)
+ 	 * access to ensure that there is no race condition.  They will be
+ 	 * correctly updated after the right owner and group info is set.
+ 	 * (Thanks to snabb@epipe.fi for pointing this out.) */
+-	fd = do_mkstemp(fnametmp, (file->mode|added_perms) & INITACCESSPERMS);
++	/* When use_secure_symlinks is on (non-chroot daemon with munge_symlinks),
++	 * use secure_mkstemp to prevent symlink race attacks on parent directories. */
++	if (use_secure_symlinks)
++		fd = secure_mkstemp(fnametmp, (file->mode|added_perms) & INITACCESSPERMS);
++	else
++		fd = do_mkstemp(fnametmp, (file->mode|added_perms) & INITACCESSPERMS);
+ 
+ #if 0
+ 	/* In most cases parent directories will already exist because their
+@@ -854,11 +860,21 @@ int recv_files(int f_in, int f_out, char *local_name)
+ 		/* We now check to see if we are writing the file "inplace" */
+ 		if (inplace || one_inplace)  {
+ 			fnametmp = one_inplace ? partialptr : fname;
+-			fd2 = do_open(fnametmp, O_WRONLY|O_CREAT, 0600);
++			/* When use_secure_symlinks is on (non-chroot daemon),
++			 * use secure open to prevent symlink race attacks where an
++			 * attacker could switch a directory to a symlink between
++			 * path validation and file open. */
++			if (use_secure_symlinks)
++				fd2 = secure_relative_open(NULL, fnametmp, O_WRONLY|O_CREAT, 0600);
++			else
++				fd2 = do_open(fnametmp, O_WRONLY|O_CREAT, 0600);
+ #ifdef linux
+ 			if (fd2 == -1 && errno == EACCES) {
+ 				/* Maybe the error was due to protected_regular setting? */
+-				fd2 = do_open(fname, O_WRONLY, 0600);
++				if (use_secure_symlinks)
++					fd2 = secure_relative_open(NULL, fname, O_WRONLY, 0600);
++				else
++					fd2 = do_open(fname, O_WRONLY, 0600);
+ 			}
+ #endif
+ 			if (fd2 == -1) {
+diff --git a/syscall.c b/syscall.c
+index 8aab2cc0..8b39a6e2 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -882,6 +882,145 @@ cleanup:
+ #endif // O_NOFOLLOW, O_DIRECTORY
+ }
+ 
++/* Fill buf with len random bytes.  Prefers /dev/urandom for cryptographic
++ * quality; falls back to rand() if /dev/urandom cannot be opened or read
++ * (e.g. inside a chroot or container without /dev populated). */
++static void rand_bytes(unsigned char *buf, size_t len)
++{
++#ifndef O_CLOEXEC
++#define O_CLOEXEC 0
++#endif
++	int fd = open("/dev/urandom", O_RDONLY | O_CLOEXEC);
++	if (fd >= 0) {
++		ssize_t n = read(fd, buf, len);
++		close(fd);
++		if (n == (ssize_t)len) {
++			return;
++		}
++	}
++	for (size_t i = 0; i < len; i++) {
++		buf[i] = (unsigned char)rand();
++	}
++}
++
++/*
++  Secure version of mkstemp that prevents symlink attacks on parent directories.
++  Like secure_relative_open(), this walks the path checking each component
++  with O_NOFOLLOW to prevent TOCTOU race conditions.
++
++  The template may be relative or absolute, but must not contain ../ components.
++  Returns fd on success, -1 on error.
++*/
++int secure_mkstemp(char *template, mode_t perms)
++{
++#if !defined(O_NOFOLLOW) || !defined(O_DIRECTORY) || !defined(AT_FDCWD)
++	/* Fall back to regular mkstemp on old systems */
++	return do_mkstemp(template, perms);
++#else
++	char *lastslash;
++	int dirfd = AT_FDCWD;
++	int fd = -1;
++
++	if (!template) {
++		errno = EINVAL;
++		return -1;
++	}
++	if (strncmp(template, "../", 3) == 0 || strstr(template, "/../")) {
++		errno = EINVAL;
++		return -1;
++	}
++
++	/* For absolute paths, start the secure walk from "/" rather than CWD. */
++	if (template[0] == '/') {
++		dirfd = open("/", O_RDONLY | O_DIRECTORY | O_NOFOLLOW);
++		if (dirfd < 0)
++			return -1;
++	}
++
++	/* Find the last slash to separate directory from filename */
++	lastslash = strrchr(template, '/');
++	if (lastslash) {
++		char *path_copy = my_strdup(template, __FILE__, __LINE__);
++		if (!path_copy)
++			return -1;
++
++		/* Null-terminate at the last slash to get directory part */
++		path_copy[lastslash - template] = '\0';
++
++		/* Walk the directory path securely */
++		for (const char *part = strtok(path_copy, "/");
++		     part != NULL;
++		     part = strtok(NULL, "/"))
++		{
++			int next_fd = openat(dirfd, part, O_RDONLY | O_DIRECTORY | O_NOFOLLOW);
++			if (next_fd == -1) {
++				int save_errno = errno;
++				free(path_copy);
++				if (dirfd != AT_FDCWD) close(dirfd);
++				errno = (save_errno == ELOOP) ? ELOOP : save_errno;
++				return -1;
++			}
++			if (dirfd != AT_FDCWD) close(dirfd);
++			dirfd = next_fd;
++		}
++		free(path_copy);
++	}
++
++	/* Now create the temp file in the securely-opened directory */
++	perms |= S_IWUSR;
++
++	/* Generate unique filename - we need to modify the template in place */
++	char *filename = lastslash ? lastslash + 1 : template;
++	size_t filename_len = strlen(filename);
++
++	if (filename_len < 6) {
++		if (dirfd != AT_FDCWD) close(dirfd);
++		errno = EINVAL;
++		return -1;
++	}
++	char *suffix = filename + filename_len - 6; /* Points to XXXXXX */
++	if (strcmp(suffix, "XXXXXX") != 0) {
++		if (dirfd != AT_FDCWD) close(dirfd);
++		errno = EINVAL;
++		return -1;
++	}
++
++	/* Try random suffixes until we find one that works */
++	static const char letters[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
++	for (int tries = 0; tries < 100; tries++) {
++		unsigned char rbytes[6];
++		rand_bytes(rbytes, sizeof(rbytes));
++		for (int i = 0; i < 6; i++)
++			suffix[i] = letters[rbytes[i] % (sizeof(letters) - 1)];
++
++		fd = openat(dirfd, filename, O_RDWR | O_CREAT | O_EXCL | O_NOFOLLOW, perms);
++		if (fd >= 0)
++			break;
++		if (errno != EEXIST) {
++			if (dirfd != AT_FDCWD) close(dirfd);
++			return -1;
++		}
++	}
++
++	if (fd >= 0) {
++		if (fchmod(fd, perms) != 0 && preserve_perms) {
++			int errno_save = errno;
++			close(fd);
++			unlinkat(dirfd, filename, 0);
++			if (dirfd != AT_FDCWD) close(dirfd);
++			errno = errno_save;
++			return -1;
++		}
++#if defined HAVE_SETMODE && O_BINARY
++		setmode(fd, O_BINARY);
++#endif
++	}
++
++	if (dirfd != AT_FDCWD) close(dirfd);
++	return fd;
++#endif
++}
++
+ /*
+   varient of do_open/do_open_nofollow which does do_open() if the
+   copy_links or copy_unsafe_links options are set and does
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.patch b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.patch
new file mode 100644
index 0000000000..4ce3d03248
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.patch
@@ -0,0 +1,73 @@
+From 37d459f837868cf5dc6a3f4962c8c9d9bcd2d4b8 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Sun, 1 Mar 2026 09:28:40 +1100
+Subject: [PATCH] sender: fix read-path TOCTOU by opening from module root
+ (CVE-2026-29518)
+
+The sender's file open was vulnerable to the same TOCTOU symlink
+race as the receiver-side basis-file open. change_pathname() calls
+chdir() into subdirectories, which follows symlinks; an attacker
+could race to swap a directory for a symlink between the chdir and
+the file open, allowing reads of privileged files through the
+daemon.
+
+Reconstruct the full relative path (F_PATHNAME + fname) and open
+via secure_relative_open() from the trusted module_dir, which
+walks each path component without following symlinks. This is
+independent of CWD, so the chdir race is neutralised.
+
+CVE-2026-29518.
+
+Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
+
+CVE: CVE-2026-29518
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/99b36291d06ca66229942c7a525a1f5566f10c85]
+
+(cherry picked from commit 99b36291d06ca66229942c7a525a1f5566f10c85)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ sender.c | 22 +++++++++++++++++++++-
+ 1 file changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/sender.c b/sender.c
+index b1588b70..99f431fe 100644
+--- a/sender.c
++++ b/sender.c
+@@ -48,6 +48,8 @@ extern int make_backups;
+ extern int inplace;
+ extern int inplace_partial;
+ extern int batch_fd;
++extern int use_secure_symlinks;
++extern char *module_dir;
+ extern int write_batch;
+ extern int file_old_total;
+ extern BOOL want_progress_now;
+@@ -352,7 +354,25 @@ void send_files(int f_in, int f_out)
+ 			exit_cleanup(RERR_PROTOCOL);
+ 		}
+ 
+-		fd = do_open_checklinks(fname);
++		if (use_secure_symlinks) {
++			/* Open from module root to prevent TOCTOU race where
++			 * change_pathname's chdir follows a directory symlink.
++			 * Reconstruct the full path relative to module_dir
++			 * from F_PATHNAME (path) and f_name (fname). */
++			char secure_path[MAXPATHLEN];
++			int slen = snprintf(secure_path, sizeof secure_path, "%s%s%s", path, slash, fname);
++			if (slen >= (int)sizeof secure_path) {
++				io_error |= IOERR_GENERAL;
++				rprintf(FERROR_XFER, "path too long: %s%s%s\n", path, slash, fname);
++				free_sums(s);
++				if (protocol_version >= 30)
++					send_msg_int(MSG_NO_SEND, ndx);
++				continue;
++			}
++			fd = secure_relative_open(module_dir, secure_path, O_RDONLY, 0);
++		} else {
++			fd = do_open_checklinks(fname);
++		}
+ 		if (fd == -1) {
+ 			if (errno == ENOENT) {
+ 				enum logcode c = am_daemon && protocol_version < 28 ? FERROR : FWARNING;
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index 2a1c3d9d56..fdbee387e3 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -29,6 +29,8 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2024-12747.patch \
            file://CVE-2025-10158.patch \
            file://CVE-2026-41035.patch \
+           file://CVE-2026-29518_p1.patch \
+           file://CVE-2026-29518_p2.patch \
            "
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
 
-- 
2.44.1


