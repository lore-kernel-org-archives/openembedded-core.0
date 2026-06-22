Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99B6CDB471
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 11:31:37 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40904.1782127888114148047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 04:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NZ2M4Qw2;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4923139e940so24845705e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 04:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782127886; x=1782732686; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pejgqSbED2OINheXT4f2o3zDK/PQ3LNAuU+Cgx+3HbI=;
        b=NZ2M4Qw20VQ5eeJv4mg83K2T86nk5F/t2cBM4Mtf8l7GP+psfBieRhEDFk0MnMO62E
         L9jjj+cVPZYLN1gazQzSt7Jn9MWrdT9HhyBiWENLCNOkD+skv1XgmiGjkPZrxOYc4m6r
         iixoYzZtmDqcVS4SkA468jFGiESHls09uMTIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782127886; x=1782732686;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pejgqSbED2OINheXT4f2o3zDK/PQ3LNAuU+Cgx+3HbI=;
        b=Pf/nQ0eoxl8gy9jKCw20H/7Ijv6Adf9cW1h5wxbsePVVwNjNSWc52TgS3DYVtOhdlE
         D51tbluEwG+Q07oFYWaolqfJn6HrV3GX+HB7Nw7kidNy/XxJtsGE9xlKh4IHsmvN1nch
         e/kUC0EaJDBI5+MK4xTeyY8/lRfswA4c6QE62xVYqiGEM0RmtaLhfTM27omI6TV+q4R7
         cnC5ab3z2XXA6hSBpEimKA2Df0o9khS/1MHVPo5XGrenVi2uB5t/ZGPU2W+RIiN+UoG2
         xHmSlboH2KWdsVL43hQuTPHX6ei/YPFncIXv+THeTStD10uQPj13Dqfaz1YyrTwKzhbO
         XTLA==
X-Forwarded-Encrypted: i=1; AFNElJ87CoCrB4pb3uRE8kqbRbUcbGhTgdEGnHBDOmHVMcpEmlqEIf3HjDSlpbVUBj+jSq9Mi8Hyv6Tuhr+NTfLi6p8FTA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyWHXStIgMB8OxaS85ixIc5HAzUd84iB56rVwcSRBkcHeg8ZZn6
	w7sAnGEMsaYH6ndGXPu2fwFRMdK5mz4JhHuS5GSw64+WVnMgj8TptZ3IBdsxLL74ujs=
X-Gm-Gg: AfdE7cm0bT+LhG5d3aQRHLIB/TiPaOcyUHVzoc/Yf0E/XgzmpG2ZV1RqccNWrHa88IG
	PFxBA6biFNCRNiFDMlVogRkQ3ZlFSo+VMTCxU8+NWMJ5rp6WARJNXR6wSBbFeA6uQHWiWUztUXr
	NxREAte4hWERrKFEhur1eOYToJg94ZgPHgiyAdiqM7mnG8HqtWUsaORo2FueFB3dJHftIcFul5V
	tUbfVFpJoz9LqKGSBd50ze4KNBVNciTAgyrQLl/nTCdr+RJ2ggEqKD/UhBRxDsBEDK5GF2efjjA
	/3CEV9f9yaWj+05wc558EhA1awrsVFDjPGQYdtPFRkk4QdTV/FSSSInufOwtl8CXmIrvyiAW0U1
	1gAkvKGvY9iz3ZkLKd6FEcEzXN8k1BVoo5GRcnftbccx29FIMmXz330Rc4K289xltAeWzK9o6H1
	pYTNBbHSQ04mXNZs5z9T1u9kxu497CeD7YzjRHXSPQ1BDi1SjFrI8qsqVd6u7vsOE69VE3Jb1SZ
	KjB
X-Received: by 2002:a05:600c:3516:b0:490:c2a2:e91c with SMTP id 5b1f17b1804b1-4924258fbbdmr212027205e9.34.1782127885685;
        Mon, 22 Jun 2026 04:31:25 -0700 (PDT)
Received: from localhost (2a01cb001331aa00ae343d7f26e6048e.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:ae34:3d7f:26e6:48e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249238bfbsm219014435e9.5.2026.06.22.04.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 04:31:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 13:31:24 +0200
Message-Id: <DJFJLZY26OV8.76VQNOV5VDTV@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-29518
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <asparmar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260612121514.2282121-1-asparmar@cisco.com>
In-Reply-To: <20260612121514.2282121-1-asparmar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 11:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239281

On Fri Jun 12, 2026 at 2:13 PM CEST, Ashishkumar Parmar X (asparmar - E INF=
OCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Ashishkumar Parmar <asparmar@cisco.com>
>
> Pick the upstream backport [1] for CVE-2026-29518 as mentioned in [3],
> where a non-chrooted rsync daemon could be exposed to a parent path
> TOCTOU race that allowed file access outside the module.
>
> Also include the dependent upstream fix that followed the CVE fix:
> - CVE-2026-29518_p2.patch [2] secures sender read-path opens by
>   opening files from the module root, closing the same race on the
>   read side.
>
> [1] https://github.com/RsyncProject/rsync/commit/1a5ad81add1004354a3d8ba8=
41b94ffe19cd2505
> [2] https://github.com/RsyncProject/rsync/commit/99b36291d06ca66229942c7a=
525a1f5566f10c85
> [3] https://www.cve.org/CVERecord?id=3DCVE-2026-29518
>
> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
> ---

Hello,

It looks like this whole series is needed for wrynose (rsync 3.4.1).
Can you send fixes there first, and, then, ping here?

Thanks!

>  .../rsync/files/CVE-2026-29518_p1.patch       | 330 ++++++++++++++++++
>  .../rsync/files/CVE-2026-29518_p2.patch       |  73 ++++
>  meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   2 +
>  3 files changed, 405 insertions(+)
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.p=
atch
>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.p=
atch
>
> diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.patch b/=
meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.patch
> new file mode 100644
> index 0000000000..227ca56dd3
> --- /dev/null
> +++ b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.patch
> @@ -0,0 +1,330 @@
> +From c5192e125999130b7e15c621989839da31b15a05 Mon Sep 17 00:00:00 2001
> +From: Andrew Tridgell <andrew@tridgell.net>
> +Date: Wed, 31 Dec 2025 10:01:23 +1100
> +Subject: [PATCH] syscall+clientserver: am_chrooted and use_secure_symlin=
ks for
> + daemon-no-chroot (CVE-2026-29518)
> +
> +CVE-2026-29518: an rsync daemon configured with "use chroot =3D no"
> +is exposed to a TOCTOU race on parent path components. A local
> +attacker with write access to a module can replace a parent
> +directory component with a symlink between the receiver's check
> +and its open(), redirecting reads (basis-file disclosure) and
> +writes (file overwrite) outside the module. Under elevated daemon
> +privilege this allows privilege escalation. Default
> +"use chroot =3D yes" is not exposed.
> +
> +Add secure_relative_open() in syscall.c. It walks the parent
> +components under RESOLVE_BENEATH (Linux 5.6+) /
> +O_RESOLVE_BENEATH (FreeBSD 13+, macOS 15+) / per-component
> +O_NOFOLLOW elsewhere, anchored at a trusted dirfd, so a parent-
> +symlink swap is rejected by the kernel. Route the receiver's
> +basis-file open in receiver.c through it when use_secure_symlinks
> +is set in clientserver.c rsync_module().
> +
> +Reporters: Nullx3D (Batuhan SANCAK); Damien Neil; Michael Stapelberg.
> +
> +Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
> +
> +CVE: CVE-2026-29518
> +Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/=
1a5ad81add1004354a3d8ba841b94ffe19cd2505]
> +
> +(cherry picked from commit 1a5ad81add1004354a3d8ba841b94ffe19cd2505)
> +Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
> +---
> + clientserver.c |  25 +++++++++
> + options.c      |   9 ++++
> + receiver.c     |  22 ++++++--
> + syscall.c      | 139 +++++++++++++++++++++++++++++++++++++++++++++++++
> + 4 files changed, 192 insertions(+), 3 deletions(-)
> +
> +diff --git a/clientserver.c b/clientserver.c
> +index 7c897abc..b6eba098 100644
> +--- a/clientserver.c
> ++++ b/clientserver.c
> +@@ -30,6 +30,7 @@ extern int list_only;
> + extern int am_sender;
> + extern int am_server;
> + extern int am_daemon;
> ++extern int am_chrooted;
> + extern int am_root;
> + extern int msgs2stderr;
> + extern int rsync_port;
> +@@ -38,6 +39,7 @@ extern int ignore_errors;
> + extern int preserve_xattrs;
> + extern int kluge_around_eof;
> + extern int munge_symlinks;
> ++extern int use_secure_symlinks;
> + extern int open_noatime;
> + extern int sanitize_paths;
> + extern int numeric_ids;
> +@@ -981,6 +983,7 @@ static int rsync_module(int f_in, int f_out, int i, =
const char *addr, const char
> + 			io_printf(f_out, "@ERROR: chroot failed\n");
> + 			return -1;
> + 		}
> ++		am_chrooted =3D 1;
> + 		module_chdir =3D module_dir;
> + 	}
> +=20
> +@@ -1003,6 +1006,15 @@ static int rsync_module(int f_in, int f_out, int =
i, const char *addr, const char
> + 		}
> + 	}
> +=20
> ++	/* Enable secure symlink handling for any non-chrooted daemon module.
> ++	 * This prevents TOCTOU race attacks where an attacker could switch a
> ++	 * directory to a symlink between path validation and file open.
> ++	 * Match the gate used by the do_*_at() wrappers in syscall.c
> ++	 * (am_daemon && !am_chrooted) -- the protection has nothing to do
> ++	 * with symlink munging, so a module configured with
> ++	 * "munge symlinks =3D false" must still get the secure-open path. */
> ++	use_secure_symlinks =3D am_daemon && !am_chrooted;
> ++
> + 	if (gid_list.count) {
> + 		gid_t *gid_array =3D gid_list.items;
> + 		if (setgid(gid_array[0])) {
> +@@ -1305,6 +1317,19 @@ int start_daemon(int f_in, int f_out)
> + 			rsyserr(FLOG, errno, "daemon chroot(\"%s\") failed", p);
> + 			return -1;
> + 		}
> ++		/* Deliberately do NOT set am_chrooted here.  am_chrooted
> ++		 * gates the per-module symlink-race defenses
> ++		 * (secure_relative_open() and the do_*_at() wrappers in
> ++		 * syscall.c) and means "the kernel is enforcing path
> ++		 * confinement at the module boundary".  The daemon chroot
> ++		 * confines path resolution to the daemon-chroot directory,
> ++		 * not to any individual module path -- modules sharing the
> ++		 * daemon chroot are still distinguishable filesystem
> ++		 * subtrees and a sender-controlled symlink in module A
> ++		 * could redirect a syscall to module B (or to other files
> ++		 * inside the daemon chroot) without the per-module
> ++		 * defenses.  Leave am_chrooted=3D0 here so secure_relative_open()
> ++		 * still fires for "use chroot =3D no" modules. */
> + 		if (chdir("/") < 0) {
> + 			rsyserr(FLOG, errno, "daemon chdir(\"/\") failed");
> + 			return -1;
> +diff --git a/options.c b/options.c
> +index d38bbe8d..d4ca5396 100644
> +--- a/options.c
> ++++ b/options.c
> +@@ -113,11 +113,20 @@ int mkpath_dest_arg =3D 0;
> + int allow_inc_recurse =3D 1;
> + int xfer_dirs =3D -1;
> + int am_daemon =3D 0;
> ++/* Set after a successful per-module chroot ("use chroot =3D yes") in
> ++ * clientserver.c. NOT set for the daemon-level "daemon chroot =3D /X"
> ++ * chroot: that confines path resolution to /X, but module paths
> ++ * /X/modA, /X/modB, etc. are not chroot boundaries, so the per-module
> ++ * symlink-race defenses (secure_relative_open() / do_*_at() in
> ++ * syscall.c, gated by `am_daemon && !am_chrooted`) must still fire
> ++ * even when the daemon is inside a daemon chroot. */
> ++int am_chrooted =3D 0;
> + int connect_timeout =3D 0;
> + int keep_partial =3D 0;
> + int safe_symlinks =3D 0;
> + int copy_unsafe_links =3D 0;
> + int munge_symlinks =3D 0;
> ++int use_secure_symlinks =3D 0;
> + int size_only =3D 0;
> + int daemon_bwlimit =3D 0;
> + int bwlimit =3D 0;
> +diff --git a/receiver.c b/receiver.c
> +index 77de8697..cbe18196 100644
> +--- a/receiver.c
> ++++ b/receiver.c
> +@@ -70,6 +70,7 @@ extern int fuzzy_basis;
> +=20
> + extern struct name_num_item *xfer_sum_nni;
> + extern int xfer_sum_len;
> ++extern int use_secure_symlinks;
> +=20
> + static struct bitbag *delayed_bits =3D NULL;
> + static int phase =3D 0, redoing =3D 0;
> +@@ -214,7 +215,12 @@ int open_tmpfile(char *fnametmp, const char *fname,=
 struct file_struct *file)
> + 	 * access to ensure that there is no race condition.  They will be
> + 	 * correctly updated after the right owner and group info is set.
> + 	 * (Thanks to snabb@epipe.fi for pointing this out.) */
> +-	fd =3D do_mkstemp(fnametmp, (file->mode|added_perms) & INITACCESSPERMS=
);
> ++	/* When use_secure_symlinks is on (non-chroot daemon with munge_symlin=
ks),
> ++	 * use secure_mkstemp to prevent symlink race attacks on parent direct=
ories. */
> ++	if (use_secure_symlinks)
> ++		fd =3D secure_mkstemp(fnametmp, (file->mode|added_perms) & INITACCESS=
PERMS);
> ++	else
> ++		fd =3D do_mkstemp(fnametmp, (file->mode|added_perms) & INITACCESSPERM=
S);
> +=20
> + #if 0
> + 	/* In most cases parent directories will already exist because their
> +@@ -854,11 +860,21 @@ int recv_files(int f_in, int f_out, char *local_na=
me)
> + 		/* We now check to see if we are writing the file "inplace" */
> + 		if (inplace || one_inplace)  {
> + 			fnametmp =3D one_inplace ? partialptr : fname;
> +-			fd2 =3D do_open(fnametmp, O_WRONLY|O_CREAT, 0600);
> ++			/* When use_secure_symlinks is on (non-chroot daemon),
> ++			 * use secure open to prevent symlink race attacks where an
> ++			 * attacker could switch a directory to a symlink between
> ++			 * path validation and file open. */
> ++			if (use_secure_symlinks)
> ++				fd2 =3D secure_relative_open(NULL, fnametmp, O_WRONLY|O_CREAT, 0600=
);
> ++			else
> ++				fd2 =3D do_open(fnametmp, O_WRONLY|O_CREAT, 0600);
> + #ifdef linux
> + 			if (fd2 =3D=3D -1 && errno =3D=3D EACCES) {
> + 				/* Maybe the error was due to protected_regular setting? */
> +-				fd2 =3D do_open(fname, O_WRONLY, 0600);
> ++				if (use_secure_symlinks)
> ++					fd2 =3D secure_relative_open(NULL, fname, O_WRONLY, 0600);
> ++				else
> ++					fd2 =3D do_open(fname, O_WRONLY, 0600);
> + 			}
> + #endif
> + 			if (fd2 =3D=3D -1) {
> +diff --git a/syscall.c b/syscall.c
> +index 8aab2cc0..8b39a6e2 100644
> +--- a/syscall.c
> ++++ b/syscall.c
> +@@ -882,6 +882,145 @@ cleanup:
> + #endif // O_NOFOLLOW, O_DIRECTORY
> + }
> +=20
> ++/* Fill buf with len random bytes.  Prefers /dev/urandom for cryptograp=
hic
> ++ * quality; falls back to rand() if /dev/urandom cannot be opened or re=
ad
> ++ * (e.g. inside a chroot or container without /dev populated). */
> ++static void rand_bytes(unsigned char *buf, size_t len)
> ++{
> ++#ifndef O_CLOEXEC
> ++#define O_CLOEXEC 0
> ++#endif
> ++	int fd =3D open("/dev/urandom", O_RDONLY | O_CLOEXEC);
> ++	if (fd >=3D 0) {
> ++		ssize_t n =3D read(fd, buf, len);
> ++		close(fd);
> ++		if (n =3D=3D (ssize_t)len) {
> ++			return;
> ++		}
> ++	}
> ++	for (size_t i =3D 0; i < len; i++) {
> ++		buf[i] =3D (unsigned char)rand();
> ++	}
> ++}
> ++
> ++/*
> ++  Secure version of mkstemp that prevents symlink attacks on parent dir=
ectories.
> ++  Like secure_relative_open(), this walks the path checking each compon=
ent
> ++  with O_NOFOLLOW to prevent TOCTOU race conditions.
> ++
> ++  The template may be relative or absolute, but must not contain ../ co=
mponents.
> ++  Returns fd on success, -1 on error.
> ++*/
> ++int secure_mkstemp(char *template, mode_t perms)
> ++{
> ++#if !defined(O_NOFOLLOW) || !defined(O_DIRECTORY) || !defined(AT_FDCWD)
> ++	/* Fall back to regular mkstemp on old systems */
> ++	return do_mkstemp(template, perms);
> ++#else
> ++	char *lastslash;
> ++	int dirfd =3D AT_FDCWD;
> ++	int fd =3D -1;
> ++
> ++	if (!template) {
> ++		errno =3D EINVAL;
> ++		return -1;
> ++	}
> ++	if (strncmp(template, "../", 3) =3D=3D 0 || strstr(template, "/../")) =
{
> ++		errno =3D EINVAL;
> ++		return -1;
> ++	}
> ++
> ++	/* For absolute paths, start the secure walk from "/" rather than CWD.=
 */
> ++	if (template[0] =3D=3D '/') {
> ++		dirfd =3D open("/", O_RDONLY | O_DIRECTORY | O_NOFOLLOW);
> ++		if (dirfd < 0)
> ++			return -1;
> ++	}
> ++
> ++	/* Find the last slash to separate directory from filename */
> ++	lastslash =3D strrchr(template, '/');
> ++	if (lastslash) {
> ++		char *path_copy =3D my_strdup(template, __FILE__, __LINE__);
> ++		if (!path_copy)
> ++			return -1;
> ++
> ++		/* Null-terminate at the last slash to get directory part */
> ++		path_copy[lastslash - template] =3D '\0';
> ++
> ++		/* Walk the directory path securely */
> ++		for (const char *part =3D strtok(path_copy, "/");
> ++		     part !=3D NULL;
> ++		     part =3D strtok(NULL, "/"))
> ++		{
> ++			int next_fd =3D openat(dirfd, part, O_RDONLY | O_DIRECTORY | O_NOFOL=
LOW);
> ++			if (next_fd =3D=3D -1) {
> ++				int save_errno =3D errno;
> ++				free(path_copy);
> ++				if (dirfd !=3D AT_FDCWD) close(dirfd);
> ++				errno =3D (save_errno =3D=3D ELOOP) ? ELOOP : save_errno;
> ++				return -1;
> ++			}
> ++			if (dirfd !=3D AT_FDCWD) close(dirfd);
> ++			dirfd =3D next_fd;
> ++		}
> ++		free(path_copy);
> ++	}
> ++
> ++	/* Now create the temp file in the securely-opened directory */
> ++	perms |=3D S_IWUSR;
> ++
> ++	/* Generate unique filename - we need to modify the template in place =
*/
> ++	char *filename =3D lastslash ? lastslash + 1 : template;
> ++	size_t filename_len =3D strlen(filename);
> ++
> ++	if (filename_len < 6) {
> ++		if (dirfd !=3D AT_FDCWD) close(dirfd);
> ++		errno =3D EINVAL;
> ++		return -1;
> ++	}
> ++	char *suffix =3D filename + filename_len - 6; /* Points to XXXXXX */
> ++	if (strcmp(suffix, "XXXXXX") !=3D 0) {
> ++		if (dirfd !=3D AT_FDCWD) close(dirfd);
> ++		errno =3D EINVAL;
> ++		return -1;
> ++	}
> ++
> ++	/* Try random suffixes until we find one that works */
> ++	static const char letters[] =3D "abcdefghijklmnopqrstuvwxyzABCDEFGHIJK=
LMNOPQRSTUVWXYZ0123456789";
> ++	for (int tries =3D 0; tries < 100; tries++) {
> ++		unsigned char rbytes[6];
> ++		rand_bytes(rbytes, sizeof(rbytes));
> ++		for (int i =3D 0; i < 6; i++)
> ++			suffix[i] =3D letters[rbytes[i] % (sizeof(letters) - 1)];
> ++
> ++		fd =3D openat(dirfd, filename, O_RDWR | O_CREAT | O_EXCL | O_NOFOLLOW=
, perms);
> ++		if (fd >=3D 0)
> ++			break;
> ++		if (errno !=3D EEXIST) {
> ++			if (dirfd !=3D AT_FDCWD) close(dirfd);
> ++			return -1;
> ++		}
> ++	}
> ++
> ++	if (fd >=3D 0) {
> ++		if (fchmod(fd, perms) !=3D 0 && preserve_perms) {
> ++			int errno_save =3D errno;
> ++			close(fd);
> ++			unlinkat(dirfd, filename, 0);
> ++			if (dirfd !=3D AT_FDCWD) close(dirfd);
> ++			errno =3D errno_save;
> ++			return -1;
> ++		}
> ++#if defined HAVE_SETMODE && O_BINARY
> ++		setmode(fd, O_BINARY);
> ++#endif
> ++	}
> ++
> ++	if (dirfd !=3D AT_FDCWD) close(dirfd);
> ++	return fd;
> ++#endif
> ++}
> ++
> + /*
> +   varient of do_open/do_open_nofollow which does do_open() if the
> +   copy_links or copy_unsafe_links options are set and does
> +--=20
> +2.35.6
> diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.patch b/=
meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.patch
> new file mode 100644
> index 0000000000..4ce3d03248
> --- /dev/null
> +++ b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.patch
> @@ -0,0 +1,73 @@
> +From 37d459f837868cf5dc6a3f4962c8c9d9bcd2d4b8 Mon Sep 17 00:00:00 2001
> +From: Andrew Tridgell <andrew@tridgell.net>
> +Date: Sun, 1 Mar 2026 09:28:40 +1100
> +Subject: [PATCH] sender: fix read-path TOCTOU by opening from module roo=
t
> + (CVE-2026-29518)
> +
> +The sender's file open was vulnerable to the same TOCTOU symlink
> +race as the receiver-side basis-file open. change_pathname() calls
> +chdir() into subdirectories, which follows symlinks; an attacker
> +could race to swap a directory for a symlink between the chdir and
> +the file open, allowing reads of privileged files through the
> +daemon.
> +
> +Reconstruct the full relative path (F_PATHNAME + fname) and open
> +via secure_relative_open() from the trusted module_dir, which
> +walks each path component without following symlinks. This is
> +independent of CWD, so the chdir race is neutralised.
> +
> +CVE-2026-29518.
> +
> +Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
> +
> +CVE: CVE-2026-29518
> +Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/=
99b36291d06ca66229942c7a525a1f5566f10c85]
> +
> +(cherry picked from commit 99b36291d06ca66229942c7a525a1f5566f10c85)
> +Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
> +---
> + sender.c | 22 +++++++++++++++++++++-
> + 1 file changed, 21 insertions(+), 1 deletion(-)
> +
> +diff --git a/sender.c b/sender.c
> +index b1588b70..99f431fe 100644
> +--- a/sender.c
> ++++ b/sender.c
> +@@ -48,6 +48,8 @@ extern int make_backups;
> + extern int inplace;
> + extern int inplace_partial;
> + extern int batch_fd;
> ++extern int use_secure_symlinks;
> ++extern char *module_dir;
> + extern int write_batch;
> + extern int file_old_total;
> + extern BOOL want_progress_now;
> +@@ -352,7 +354,25 @@ void send_files(int f_in, int f_out)
> + 			exit_cleanup(RERR_PROTOCOL);
> + 		}
> +=20
> +-		fd =3D do_open_checklinks(fname);
> ++		if (use_secure_symlinks) {
> ++			/* Open from module root to prevent TOCTOU race where
> ++			 * change_pathname's chdir follows a directory symlink.
> ++			 * Reconstruct the full path relative to module_dir
> ++			 * from F_PATHNAME (path) and f_name (fname). */
> ++			char secure_path[MAXPATHLEN];
> ++			int slen =3D snprintf(secure_path, sizeof secure_path, "%s%s%s", pat=
h, slash, fname);
> ++			if (slen >=3D (int)sizeof secure_path) {
> ++				io_error |=3D IOERR_GENERAL;
> ++				rprintf(FERROR_XFER, "path too long: %s%s%s\n", path, slash, fname)=
;
> ++				free_sums(s);
> ++				if (protocol_version >=3D 30)
> ++					send_msg_int(MSG_NO_SEND, ndx);
> ++				continue;
> ++			}
> ++			fd =3D secure_relative_open(module_dir, secure_path, O_RDONLY, 0);
> ++		} else {
> ++			fd =3D do_open_checklinks(fname);
> ++		}
> + 		if (fd =3D=3D -1) {
> + 			if (errno =3D=3D ENOENT) {
> + 				enum logcode c =3D am_daemon && protocol_version < 28 ? FERROR : FW=
ARNING;
> +--=20
> +2.35.6
> diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-de=
vtools/rsync/rsync_3.2.7.bb
> index 2a1c3d9d56..fdbee387e3 100644
> --- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
> +++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
> @@ -29,6 +29,8 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/src/=
${BP}.tar.gz \
>             file://CVE-2024-12747.patch \
>             file://CVE-2025-10158.patch \
>             file://CVE-2026-41035.patch \
> +           file://CVE-2026-29518_p1.patch \
> +           file://CVE-2026-29518_p2.patch \
>             "
>  SRC_URI[sha256sum] =3D "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e4=
88fb2dc41346f2bb"
> =20


--=20
Yoann Congal
Smile ECS


