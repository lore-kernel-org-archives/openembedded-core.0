Return-Path: <seebs@seebs.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BEAC77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 03:18:49 +0000 (UTC)
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web10.5415.1685503124666569063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 20:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seebs.net header.s=mail header.b=TeGvPI8F;
 spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 416022E8936;
	Tue, 30 May 2023 22:18:43 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=seebs.net; s=mail;
	t=1685503123; bh=mUDk/Z3CqxSEC/KWCGdSIPK9l3hqVshPq8v2kGtCpvo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TeGvPI8FwbQqsTW/mD7GnhYvYEZB8diwrAjy67Pjo2IBnIXVVKQMAlStYn4YJNRO6
	 Lc0A19N/3WmEdETHRa8Ql+9dsHuxG7/1iLLbsWUcZ+rQMj43yUloMhdsZcSWkJW8Gb
	 qSrkIGEM0npEhAH54ssWQNXX9kthb3s+GXBqzcmuvF+yAKBMiMDzvM3kRs3v0U0/Lx
	 jdKui6Z0HYmuqzSzP8rE4tE/q35nmbK+B8ywRc/NiWAlmhPykeQ9ua7UCklcTtm59c
	 QgFrLS2IMc64kg/Yki/ToACuaDhML9gbRFMzuQTY0cKVH6TlftMfAJdJT9hJPD0a6B
	 qoGkpRVzI8Yvw==
Date: Tue, 30 May 2023 22:18:39 -0500
From: Seebs <seebs@seebs.net>
To: Mark Hatle <mark.hatle@amd.com>
Cc: <openembedded-core@lists.openembedded.org>, <zhangjialing@loongson.cn>
Subject: Re: [PATCH][pseudo] Move __*xstat* and __xmknod functions to new
 subport 'old__x'
Message-ID: <20230530221839.2dfa7775@seebsdell>
In-Reply-To: <20230531025441.5395-1-mark.hatle@amd.com>
References: <20230531025441.5395-1-mark.hatle@amd.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 03:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181985

On Tue, 30 May 2023 19:54:41 -0700
Mark Hatle <mark.hatle@amd.com> wrote:

> -	int existed = (real___xstat64(_STAT_VER, path, &buf) != -1);
> +	int existed = (base_stat64(path, &buf) != -1);

Honestly, with the benefit of hindsight, I actually can't even think
why I ever thought I should be using those directly instead of through
the base_foo wrappers. Probably for a reason.

... Just in case, definitely don't merge this before testing it in
case there's some insane reason for which the base_* wrappers didn't
work here.

 
>  	rc = real_fopen64(path, mode);
>  	save_errno = errno;
> @@ -20,7 +20,7 @@
>  		int fd = fileno(rc);
>  
>  		pseudo_debug(PDBGF_FILE, "fopen64 '%s': fd %d <FILE
> %p>\n", path, fd, (void *) rc);
> -		if (real___fxstat64(_STAT_VER, fd, &buf) != -1) {
> +		if (base_fstat64(fd, &buf) != -1) {
>  			if (!existed) {
>  				real_fchmod(fd, PSEUDO_FS_MODE(0666
> & ~pseudo_umask, 0)); pseudo_client_op(OP_CREAT, 0, -1, -1, path,
> &buf); diff --git a/ports/linux/guts/freopen64.c
> b/ports/linux/guts/freopen64.c index 5fc9073..9bcc06a 100644
> --- a/ports/linux/guts/freopen64.c
> +++ b/ports/linux/guts/freopen64.c
> @@ -10,7 +10,7 @@
>   */
>   	struct stat64 buf;
>  	int save_errno;
> -	int existed = (real___xstat64(_STAT_VER, path, &buf) != -1);
> +	int existed = (base_stat64(path, &buf) != -1);
>  
>  	rc = real_freopen64(path, mode, stream);
>  	save_errno = errno;
> @@ -19,7 +19,7 @@
>  		int fd = fileno(rc);
>  
>  		pseudo_debug(PDBGF_FILE, "freopen64 '%s': fd %d\n",
> path, fd);
> -		if (real___fxstat64(_STAT_VER, fd, &buf) != -1) {
> +		if (base_fstat64(fd, &buf) != -1) {
>  			if (!existed) {
>  				real_fchmod(fd, PSEUDO_FS_MODE(0666
> & ~pseudo_umask, 0)); pseudo_client_op(OP_CREAT, 0, -1, -1, path,
> &buf); diff --git a/ports/linux/guts/fstat.c
> b/ports/linux/guts/fstat.c index b089b15..80933e2 100644
> --- a/ports/linux/guts/fstat.c
> +++ b/ports/linux/guts/fstat.c
> @@ -8,7 +8,13 @@
>   *	int rc = -1;
>   */
>  
> -	rc = wrap___fxstat(_STAT_VER, fd, buf);
> +	struct stat64 buf64;
> +	/* populate buffer with complete data */
> +	real_fstat(fd, buf);
> +	/* obtain fake data */
> +	rc = wrap_fstat64(fd, &buf64);
> +	/* overwrite */
> +	pseudo_stat32_from64(buf, &buf64);
>  
>  /*	return rc;
>   * }
> diff --git a/ports/linux/guts/fstat64.c b/ports/linux/guts/fstat64.c
> index 6dd97da..22d46a9 100644
> --- a/ports/linux/guts/fstat64.c
> +++ b/ports/linux/guts/fstat64.c
> @@ -8,8 +8,20 @@
>   *	int rc = -1;
>   */
>  
> -	rc = wrap___fxstat64(_STAT_VER, fd, buf);
> +	pseudo_msg_t *msg;
> +	int save_errno;
>  
> +	rc = real_fstat64(fd, buf);
> +	save_errno = errno;
> +	if (rc == -1) {
> +		return rc;
> +	}
> +	msg = pseudo_client_op(OP_FSTAT, 0, fd, -1, 0, buf);
> +	if (msg && msg->result == RESULT_SUCCEED) {
> +		pseudo_stat_msg(buf, msg);
> +	}
> +
> +	errno = save_errno;
>  /*	return rc;
>   * }
>   */
> diff --git a/ports/linux/guts/fstatat.c b/ports/linux/guts/fstatat.c
> index 3267641..7b9652d 100644
> --- a/ports/linux/guts/fstatat.c
> +++ b/ports/linux/guts/fstatat.c
> @@ -1,4 +1,5 @@
>  /*
> + * Copyright (c) 2008-2010 Wind River Systems; see
>   * Copyright (c) 2021 Linux Foundation; see
>   * guts/COPYRIGHT for information.
>   *
> @@ -8,7 +9,13 @@
>   *	int rc = -1;
>   */
>  
> -	rc = wrap___fxstatat(_STAT_VER, dirfd, path, buf, flags);
> +	struct stat64 buf64;
> +	/* populate buffer with complete data */
> +	real_fstatat(dirfd, path, buf, flags);
> +	/* obtain fake data */
> +	rc = wrap_fstatat64(dirfd, path, &buf64, flags);
> +	/* overwrite */
> +	pseudo_stat32_from64(buf, &buf64);
>  
>  /*	return rc;
>   * }
> diff --git a/ports/linux/guts/fstatat64.c
> b/ports/linux/guts/fstatat64.c index c981e14..13c1143 100644
> --- a/ports/linux/guts/fstatat64.c
> +++ b/ports/linux/guts/fstatat64.c
> @@ -1,4 +1,5 @@
>  /*
> + * Copyright (c) 2008-2010 Wind River Systems;
>   * Copyright (c) 2021 Linux Foundation; see
>   * guts/COPYRIGHT for information.
>   *
> @@ -8,7 +9,46 @@
>   *	int rc = -1;
>   */
>  
> -	rc = wrap___fxstatat64(_STAT_VER, dirfd, path, buf, flags);
> +	pseudo_msg_t *msg;
> +	int save_errno;
> +
> +#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> +	if (dirfd != AT_FDCWD) {
> +		errno = ENOSYS;
> +		return -1;
> +	}
> +#endif
> +	if (flags & AT_SYMLINK_NOFOLLOW) {
> +#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> +		rc = real_lstat64(path, buf);
> +#else
> +		rc = real_fstatat64(dirfd, path, buf, flags);
> +#endif
> +		if (rc == -1) {
> +			return rc;
> +		}
> +	} else {
> +#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> +		rc = real_stat64(path, buf);
> +#else
> +		rc = real_fstatat64(dirfd, path, buf, flags);
> +#endif
> +		if (rc == -1) {
> +			return rc;
> +		}
> +	}
> +	save_errno = errno;
> +
> +	/* query database
> +	 * note that symlink canonicalizing is now automatic, so we
> +	 * don't need to check for a symlink on this end
> +	 */
> +	msg = pseudo_client_op(OP_STAT, 0, -1, dirfd, path, buf);
> +	if (msg && msg->result == RESULT_SUCCEED) {
> +		pseudo_stat_msg(buf, msg);
> +	}
> +
> +	errno = save_errno;
>  
>  /*	return rc;
>   * }
> diff --git a/ports/linux/guts/lstat.c b/ports/linux/guts/lstat.c
> index d2c4d50..0bc9362 100644
> --- a/ports/linux/guts/lstat.c
> +++ b/ports/linux/guts/lstat.c
> @@ -8,7 +8,7 @@
>   *	int rc = -1;
>   */
>  
> -	rc = wrap___fxstatat(_STAT_VER, AT_FDCWD, path, buf,
> AT_SYMLINK_NOFOLLOW);
> +	rc = wrap_fstatat(AT_FDCWD, path, buf, AT_SYMLINK_NOFOLLOW);
>  
>  /*	return rc;
>   * }
> diff --git a/ports/linux/guts/lstat64.c b/ports/linux/guts/lstat64.c
> index 43d0ce1..9e0ff19 100644
> --- a/ports/linux/guts/lstat64.c
> +++ b/ports/linux/guts/lstat64.c
> @@ -8,7 +8,7 @@
>   *	int rc = -1;
>   */
>  
> -	rc = wrap___fxstatat64(_STAT_VER, AT_FDCWD, path, buf,
> AT_SYMLINK_NOFOLLOW);
> +	rc = wrap_fstatat64(AT_FDCWD, path, buf,
> AT_SYMLINK_NOFOLLOW); 
>  /*	return rc;
>   * }
> diff --git a/ports/linux/guts/mknod.c b/ports/linux/guts/mknod.c
> index 61fd320..66787c0 100644
> --- a/ports/linux/guts/mknod.c
> +++ b/ports/linux/guts/mknod.c
> @@ -8,7 +8,7 @@
>   *	int rc = -1;
>   */
>  
> -	rc = wrap___xmknod(_MKNOD_VER, path, mode, &dev);
> +	rc = wrap_mknodat(AT_FDCWD, path, mode, dev);
>  
>  /*	return rc;
>   * }
> diff --git a/ports/linux/guts/mknodat.c b/ports/linux/guts/mknodat.c
> index a7e4293..c51a82d 100644
> --- a/ports/linux/guts/mknodat.c
> +++ b/ports/linux/guts/mknodat.c
> @@ -1,4 +1,5 @@
>  /*
> + * Copyright (c) 2008-2010 Wind River Systems; see
>   * Copyright (c) 2016 Wind River Systems; see
>   * guts/COPYRIGHT for information.
>   *
> @@ -8,7 +9,75 @@
>   *	int rc = -1;
>   */
>  
> -	rc = wrap___xmknodat(_MKNOD_VER, dirfd, path, mode, &dev);
> +	pseudo_msg_t *msg;
> +	struct stat64 buf;
> +
> +	/* mask out mode bits appropriately */
> +	mode = mode & ~pseudo_umask;
> +        /* if you don't specify a type, assume regular file */
> +        if (!(mode & S_IFMT)) {
> +                mode |= S_IFREG;
> +        }
> +        pseudo_debug(PDBGF_FILE, "mknodat creating '%s', mode 0%o\n",
> +                path ? path : "<no name>", (int) mode);
> +
> +#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> +	if (dirfd != AT_FDCWD) {
> +		errno = ENOSYS;
> +		return -1;
> +	}
> +	rc = real_stat64(path, &buf);
> +#else
> +	rc = real_fstatat64(dirfd, path, &buf, AT_SYMLINK_NOFOLLOW);
> +#endif
> +	if (rc != -1) {
> +		/* if we can stat the file, you can't mknod it */
> +		errno = EEXIST;
> +		return -1;
> +	}
> +	if (!dev) {
> +		errno = EINVAL;
> +		return -1;
> +	}
> +#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> +	rc = real_open(path, O_CREAT | O_WRONLY | O_EXCL,
> +		PSEUDO_FS_MODE(mode, 0));
> +#else
> +	rc = real_openat(dirfd, path, O_CREAT | O_WRONLY | O_EXCL,
> +		PSEUDO_FS_MODE(mode, 0));
> +#endif
> +	if (rc == -1) {
> +		return -1;
> +	}
> +	real_fchmod(rc, PSEUDO_FS_MODE(mode, 0));
> +	real_fstat64(rc, &buf);
> +	/* mknod does not really open the file.  We don't have
> +	 * to use wrap_close because we've never exposed this file
> +	 * descriptor to the client code.
> +	 */
> +	real_close(rc);
> +
> +	/* mask in the mode type bits again */
> +	buf.st_mode = (PSEUDO_DB_MODE(buf.st_mode, mode) & 07777) |
> +			(mode & ~07777);
> +	buf.st_rdev = dev;
> +	msg = pseudo_client_op(OP_MKNOD, 0, -1, dirfd, path, &buf);
> +	if (msg && msg->result != RESULT_SUCCEED) {
> +		errno = EPERM;
> +		rc = -1;
> +	} else {
> +		/* just pretend we worked */
> +		rc = 0;
> +	}
> +	if (rc == -1) {
> +		int save_errno = errno;
> +#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
> +		real_unlink(path);
> +#else
> +		real_unlinkat(dirfd, path, AT_SYMLINK_NOFOLLOW);
> +#endif
> +		errno = save_errno;
> +	}
>  
>  /*	return rc;
>   * }
> diff --git a/ports/linux/guts/mkostemp64.c
> b/ports/linux/guts/mkostemp64.c index 502211b..694070b 100644
> --- a/ports/linux/guts/mkostemp64.c
> +++ b/ports/linux/guts/mkostemp64.c
> @@ -35,7 +35,7 @@
>  	if (rc != -1) {
>  		save_errno = errno;
>  
> -		if (real___fxstat64(_STAT_VER, rc, &buf) != -1) {
> +		if (base_fstat64(rc, &buf) != -1) {
>  			real_fchmod(rc, PSEUDO_FS_MODE(0600, 0));
>  			pseudo_client_op(OP_CREAT, 0, -1, -1,
> tmp_template, &buf); pseudo_client_op(OP_OPEN, PSA_READ | PSA_WRITE,
> rc, -1, tmp_template, &buf); diff --git a/ports/linux/guts/openat.c
> b/ports/linux/guts/openat.c index 656ac2b..d027154 100644
> --- a/ports/linux/guts/openat.c
> +++ b/ports/linux/guts/openat.c
> @@ -56,12 +56,12 @@
>  		save_errno = errno;
>  #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
>  		if (flags & O_NOFOLLOW) {
> -			rc = real___lxstat64(_STAT_VER, path, &buf);
> +			rc = base_lstat64(path, &buf);
>  		} else {
> -			rc = real___xstat64(_STAT_VER, path, &buf);
> +			rc = base_stat64(path, &buf);
>  		}
>  #else
> -		rc = real___fxstatat64(_STAT_VER, dirfd, path, &buf,
> (flags & O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0);
> +		rc = base_fstatat64(dirfd, path, &buf, (flags &
> O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0); #endif
>  		existed = (rc != -1);
>  		if (!existed)
> @@ -77,12 +77,12 @@
>  		save_errno = errno;
>  #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
>  		if (flags & O_NOFOLLOW) {
> -			rc = real___lxstat64(_STAT_VER, path, &buf);
> +			rc = base_lstat64(path, &buf);
>  		} else {
> -			rc = real___xstat64(_STAT_VER, path, &buf);
> +			rc = base_stat64(path, &buf);
>  		}
>  #else
> -		rc = real___fxstatat64(_STAT_VER, dirfd, path, &buf,
> (flags & O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0);
> +		rc = base_fstatat64(dirfd, path, &buf, (flags &
> O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0); #endif
>  		if (rc != -1 && S_ISFIFO(buf.st_mode)) {
>  			overly_magic_nonblocking = 1;
> @@ -135,12 +135,12 @@
>  #endif
>  #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
>  		if (flags & O_NOFOLLOW) {
> -			stat_rc = real___lxstat64(_STAT_VER, path,
> &buf);
> +			stat_rc = base_lstat64(path, &buf);
>  		} else {
> -			stat_rc = real___xstat64(_STAT_VER, path,
> &buf);
> +			stat_rc = base_xstat64(path, &buf);
>  		}
>  #else
> -		stat_rc = real___fxstatat64(_STAT_VER, dirfd, path,
> &buf, (flags & O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0);
> +		stat_rc = base_fstatat64(dirfd, path, &buf, (flags &
> O_NOFOLLOW) ? AT_SYMLINK_NOFOLLOW : 0); #endif
>  
>  		pseudo_debug(PDBGF_FILE, "openat(path %s), flags %o,
> stat rc %d, stat mode %o\n", diff --git a/ports/linux/guts/stat.c
> b/ports/linux/guts/stat.c index f8c73f7..ccd00db 100644
> --- a/ports/linux/guts/stat.c
> +++ b/ports/linux/guts/stat.c
> @@ -8,7 +8,7 @@
>   *	int rc = -1;
>   */
>  
> -	rc = wrap___fxstatat(_STAT_VER, AT_FDCWD, path, buf, 0);
> +	rc = wrap_fstatat(AT_FDCWD, path, buf, 0);
>  
>  /*	return rc;
>   * }
> diff --git a/ports/linux/guts/stat64.c b/ports/linux/guts/stat64.c
> index d8b3f36..391a73f 100644
> --- a/ports/linux/guts/stat64.c
> +++ b/ports/linux/guts/stat64.c
> @@ -8,7 +8,7 @@
>   *	int rc = -1;
>   */
>  
> -	rc = wrap___fxstatat64(_STAT_VER, AT_FDCWD, path, buf, 0);
> +	rc = wrap_fstatat64(AT_FDCWD, path, buf, 0);
>  
>  /*	return rc;
>   * }
> diff --git a/ports/linux/old__x/README b/ports/linux/old__x/README
> new file mode 100644
> index 0000000..c94413f
> --- /dev/null
> +++ b/ports/linux/old__x/README
> @@ -0,0 +1,28 @@
> +Older glibcs contain stat functions such as:
> +
> +__fxstat
> +__fxstatat
> +__lxstat
> +__xstat
> +
> +__fxstat64
> +__fxstatat64
> +__lxstat64
> +__xstat64
> +
> +The format of these functions use the _STAT_VER defintion.  New
> glibc no +longer define or utilize these functions, so neither can we.
> +
> +We only use this subport when the functions are present, this is
> checked +by with the existence of _STAT_VER.

"by with the existence"? Looks like a typo.

Anyway, looks reasonable to me, thanks!

-s

