Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3A66F78322
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 22:43:38 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u11so416608wri.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 15:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1bF2VKEhan9WcWz5mn+mNNOhUfnNkWfUjd8sDukQ9X4=;
	b=BwRCjKI4wFo3j6naxtTCacsqTrlMQ+I/ThHMOUgVD6/tPxKPKgST8N0CDtTGWTSJ60
	3MYTaYTbVChz7s99GOHmvMT3D2HZzDZ4mdMRvd7ZBJQlQKFCXbkaSL+zJZ0rpVi0R2kW
	BTR1rzKkNqPmTSmoMjX+KABmRgiNOBMwe3pzBBvhfa0kKX3VdR7pFuC9KU0/0ZqJT5cq
	oq2DDq+5xnw6Y0tEzPaByY2aMyySXuQHFRrS3A3Ta4fDv+ZmU8OBo18Uq12ffCVss4v0
	VvDS4qKbVsxpUGQCPcjqF0owlX9Q1TYaR81VRqpyyOZIGpguiIQ9Ge+SAw7WUjhoQQ1C
	o0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1bF2VKEhan9WcWz5mn+mNNOhUfnNkWfUjd8sDukQ9X4=;
	b=g7lI/z7bB6Kf3gccqcbY3z7Xxc8ZW9jsEYpIJ9n2midq4VttE2yjA7maAi/2A4N00I
	0frw1INSxA3Yke0oS0xliHtBXky10E/qFcRNo1Dqd6tOfCYicwT9JWivGLhOgzgZteP2
	r4fN+shdxvICs0VIr5+OJBcy2DuF7MwyBy5ymErT1Hpumnvd8efygP7odEq8Bmw3CIyn
	weDChEqE5pSjlZNSY73hD1DeZNLx5awzSfEotx+z8txgb3nRqt5l2GOmZbh7UqjdA/wD
	xGVYHj3D0UcExh/tmYKWoyxHvCQxrQpYhKo4mLn5ZDKPZiMLUT//LQpBJ8qYxfV7QCe0
	UKFQ==
X-Gm-Message-State: AElRT7HpUAh31EWMfP8G7dJWFSQ0vcSAgBAotq4M4y9f63eqctKvtPCv
	qp60woy5QtBDIBWKmK2vQm0k/OT5EpscNFDyqsc=
X-Google-Smtp-Source: AIpwx48DuTDntcl5sZwvinyvrYDpgiMjv757xWfyHtCtPBNp/10ZO4WDAsYEKLDqj18wiWpR7rvCsRug3U/80SaLDg8=
X-Received: by 10.223.182.132 with SMTP id j4mr908656wre.66.1522190619742;
	Tue, 27 Mar 2018 15:43:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Tue, 27 Mar 2018 15:43:39 -0700 (PDT)
In-Reply-To: <20180327154802.14611-1-ross.burton@intel.com>
References: <20180327154802.14611-1-ross.burton@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 27 Mar 2018 15:43:39 -0700
Message-ID: <CAJ86T=WCAKWoQhxM+2ako7cYJH2RieuGyuLMXcmjNETBidbsaA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] pseudo: intercept syscall() and return ENOTSUP for renameat2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2018 22:43:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 27, 2018 at 8:48 AM, Ross Burton <ross.burton@intel.com> wrote:
> coreutils is now using renameat2() in mv(1) but as this syscall isn't in most
> glibc headers yet it falls back to directly calling syscall(), which pseudo
> doesn't intercept.  This results in permission problems as files mysteriously
> move without pseudo knowing.
>
> This patch intercepts syscall() and returns ENOTSUP if renameat2() is being
> called.  Thanks to Andre McCurdy for the proof-of-concept that this patch is
> based on.

Tested-by: Andre McCurdy <armccurdy@gmail.com>

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/pseudo/files/renameat2.patch | 63 ++++++++++++++++++++++
>  meta/recipes-devtools/pseudo/pseudo_git.bb         |  1 +
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta/recipes-devtools/pseudo/files/renameat2.patch
>
> diff --git a/meta/recipes-devtools/pseudo/files/renameat2.patch b/meta/recipes-devtools/pseudo/files/renameat2.patch
> new file mode 100644
> index 00000000000..467b0b3e79f
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/renameat2.patch
> @@ -0,0 +1,63 @@
> +commit 3a4c536817dce4d0cbaa8f4efe30e722108357dd
> +Author: Ross Burton <ross.burton@intel.com>
> +Date:   Tue Mar 27 14:02:10 2018 +0100
> +
> +    HACK syscall
> +
> +diff --git a/ports/linux/guts/syscall.c b/ports/linux/guts/syscall.c
> +new file mode 100644
> +index 0000000..4ed38ed
> +--- /dev/null
> ++++ b/ports/linux/guts/syscall.c
> +@@ -0,0 +1,30 @@
> ++/*
> ++ * Copyright (c) 2018 Wind River Systems; see
> ++ * guts/COPYRIGHT for information.
> ++ *
> ++ * long syscall(long number, ...)
> ++ *    long rc = -1;
> ++ */
> ++      typedef long syscall_arg_t;
> ++      syscall_arg_t a,b,c,d,e,f;
> ++
> ++      //va_start (ap, number);

Without knowing anything about pseudo, commenting this out looks odd?

> ++      a = va_arg (ap, syscall_arg_t);
> ++      b = va_arg (ap, syscall_arg_t);
> ++      c = va_arg (ap, syscall_arg_t);
> ++      d = va_arg (ap, syscall_arg_t);
> ++      e = va_arg (ap, syscall_arg_t);
> ++      f = va_arg (ap, syscall_arg_t);
> ++      va_end (ap);
> ++
> ++      if ((number == SYS_renameat2)) {
> ++                      errno = ENOTSUP;

I think ENOTSUP is intended to indicate that the failing syscall may
succeed in another context (e.g. fails on a file but may succeed on a
socket, etc ?).

In this case, it may be better to return ENOSYS, which indicates the
syscall is never expected to work on this system. It's the error
returned by a kernel which is too old to support renameat2 and so
anything trying to use renameat2 is likely to check for it.

gnulib checks for both though, so either is going to work for the
current problem with coreutils mv.

> ++                      rc = -1;
> ++      }
> ++      else {
> ++                      rc = real_syscall (number, a, b, c, d, e, f);
> ++      }
> ++
> ++/*    return rc;
> ++ * }
> ++ */
> +diff --git a/ports/linux/wrapfuncs.in b/ports/linux/wrapfuncs.in
> +index fca5b50..137612c 100644
> +--- a/ports/linux/wrapfuncs.in
> ++++ b/ports/linux/wrapfuncs.in
> +@@ -54,3 +54,4 @@ int getpw(uid_t uid, char *buf);
> + int getpwent_r(struct passwd *pwbuf, char *buf, size_t buflen, struct passwd **pwbufp);
> + int getgrent_r(struct group *gbuf, char *buf, size_t buflen, struct group **gbufp);
> + int capset(cap_user_header_t hdrp, const cap_user_data_t datap); /* real_func=pseudo_capset */
> ++long syscall(long number, ...);
> +diff --git a/pseudo_wrappers.c b/pseudo_wrappers.c
> +index e05f73a..b7225d7 100644
> +--- a/pseudo_wrappers.c
> ++++ b/pseudo_wrappers.c
> +@@ -36,6 +36,7 @@
> + #include <sys/time.h>
> + #include <sys/wait.h>
> + #include <dlfcn.h>
> ++#include <sys/syscall.h>
> +
> + /* include this to get PSEUDO_PORT_* definitions */
> + #include "pseudo.h"
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index 66da1cc53b8..44343c3bc57 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -6,6 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
>             file://fallback-group \
>             file://moreretries.patch \
>             file://toomanyfiles.patch \
> +           file://renameat2.patch \
>             "
>
>  SRCREV = "d7c31a25e4b02af0c64e6be0b4b0a9ac4ffc9da2"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

