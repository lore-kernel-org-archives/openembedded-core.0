Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web10.8479.1585953554366259333
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 15:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=up6Ep8Wy;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id y138so6044254vsy.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 15:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z4nknzCNXcYlq73p4xUmMNVgECkFHxVErYrR6h8BJHA=;
        b=up6Ep8WyxEtzLMsdXJgYcuZfwFSXzBk3IzkxelNecSsVoOAvNXkCr+gqspEHmTUBfY
         t/jNc6rU2K/O8MUb3DN8OjxbI4qX7p0ccfEPXI0rwJE1CJlWHJaPYhVOL4s/1p4ruIr6
         RJG/q5LdhjpEu6nfvKJ3B9tZLsgW1H2Im8NZpHmftmGtDYGHRyN7am56Zc+D8Mn13SEc
         VKhr0zEdWBg7m9pcmp+XHFPoxe3Lm2W4PrdNYYbvqVzkA1d38u/rpMXccrcGvue9Tp4v
         IJh07lj2AZ+fmywSq9c+JaskfA6pcJoVsK+9EsKkRht7q8vvKOpsqGbDMlCjKmW9jY3/
         MMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z4nknzCNXcYlq73p4xUmMNVgECkFHxVErYrR6h8BJHA=;
        b=tsW4gvolVP+xmu8gaoJ64WWLGXHCgGmh7pjXyDG526176PcNIZIheuPDOA+5VS+mFa
         c+T/C26ZsvHytZ471dnDj95WMi2RdGvXRddauqvAViK/lZtwKFz4+PygXL7YtqOQvquV
         Tjk2SdgKbadK26erlc16AqoUcIcExrja5OjQ4JUp2MjR1ME0KVMyLiLRoJ5ufoACcHh1
         415yStuDAjQOta6MEmKZj9uB5WbP1oV5tt9JaQ5CotZy8otz6mSBP2jfQQjGj1/brcHL
         E4K9Na3BsHzQHuKXmxhQm0Vu+RkuXYhpxhHFDPEDSkzV8u/jUxZIUod1712P28GoZ8IX
         qBvA==
X-Gm-Message-State: AGi0PuYt48IpmmeGNepDWA0JGo7cyzBO4n1Jot8onSOcskMrKKD4j6bh
	Ifzs6n8MPr3pEYAeM/c07TLwF9fGMdg2iZpSOpU=
X-Google-Smtp-Source: APiQypLJAAjAaHQOzHSaqtoO7HDU6Mp7I5GMiKRwwHYXepGphSSPN819UXK2lgFAbe1PBaYvDKE9Whlkor71j6kuTcM=
X-Received: by 2002:a67:80d6:: with SMTP id b205mr8013725vsd.137.1585953553243;
 Fri, 03 Apr 2020 15:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200403215938.175657-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200403215938.175657-1-richard.purdie@linuxfoundation.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 3 Apr 2020 15:39:04 -0700
Message-ID: <CAJ86T=XabPQEn6xFeCwU9MLTPx50N86o6-HAyAAgu1r6UYWwCQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pseudo: Force seccomp to return success when in fact doing nothing
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 3, 2020 at 2:59 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Pseudo changes the syscall access patterns which makes it incompatible with
> seccomp. Therefore intercept the seccomp syscall and alter it, pretending that
> seccomp was setup when in fact we do nothing. If we error as unsupported,
> utilities like file will exit with errors so we can't just disable it.
>
> This works around issues on platforms where seccomp is enabled in file
> (e.g. archlinux).
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../pseudo/files/seccomp.patch                | 124 ++++++++++++++++++
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |   1 +
>  2 files changed, 125 insertions(+)
>  create mode 100644 meta/recipes-devtools/pseudo/files/seccomp.patch
>
> diff --git a/meta/recipes-devtools/pseudo/files/seccomp.patch b/meta/recipes-devtools/pseudo/files/seccomp.patch
> new file mode 100644
> index 00000000000..dd4ba666a90
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/seccomp.patch
> @@ -0,0 +1,124 @@
> +Pseudo changes the syscall access patterns which makes it incompatible with
> +seccomp. Therefore intercept the seccomp syscall and alter it, pretending that
> +seccomp was setup when in fact we do nothing. If we error as unsupported,
> +utilities like file will exit with errors so we can't just disable it.
> +
> +Upstream-Status: Pending
> +RP 2020/4/3
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +Index: git/ports/linux/pseudo_wrappers.c
> +===================================================================
> +--- git.orig/ports/linux/pseudo_wrappers.c
> ++++ git/ports/linux/pseudo_wrappers.c
> +@@ -57,6 +57,7 @@ int pseudo_capset(cap_user_header_t hdrp
> + long
> + syscall(long number, ...) {
> +       long rc = -1;
> ++      va_list ap;
> +
> +       if (!pseudo_check_wrappers() || !real_syscall) {
> +               /* rc was initialized to the "failure" value */
> +@@ -77,6 +78,20 @@ syscall(long number, ...) {
> +       (void) number;
> + #endif
> +
> ++#ifdef SYS_seccomp
> ++      /* pseudo and seccomp are incompatible as pseudo uses different syscalls
> ++       * so pretend to enable seccomp but really do nothing */
> ++      if (number == SYS_seccomp) {
> ++              unsigned long cmd;
> ++              va_start(ap, number);
> ++              cmd = va_arg(ap, unsigned long);
> ++              va_end(ap);
> ++              if (cmd == SECCOMP_SET_MODE_FILTER) {
> ++                  return 0;
> ++              }
> ++      }
> ++#endif
> ++
> +       /* gcc magic to attempt to just pass these args to syscall. we have to
> +        * guess about the number of args; the docs discuss calling conventions
> +        * up to 7, so let's try that?
> +@@ -92,3 +108,42 @@ static long wrap_syscall(long nr, va_lis
> +       (void) ap;
> +       return -1;
> + }
> ++
> ++int
> ++prctl(int option, ...) {
> ++      int rc = -1;
> ++      va_list ap;
> ++
> ++      if (!pseudo_check_wrappers() || !real_syscall) {
> ++              /* rc was initialized to the "failure" value */
> ++              pseudo_enosys("prctl");
> ++              return rc;
> ++      }
> ++
> ++      /* pseudo and seccomp are incompatible as pseudo uses different syscalls
> ++       * so pretend to enable seccomp but really do nothing */
> ++      if (option == PR_SET_SECCOMP) {
> ++              unsigned long cmd;
> ++              va_start(ap, option);
> ++              cmd = va_arg(ap, unsigned long);
> ++              va_end(ap);
> ++              if (cmd == SECCOMP_SET_MODE_FILTER) {
> ++                  return 0;
> ++              }
> ++      }
> ++
> ++      /* gcc magic to attempt to just pass these args to syscall. we have to

Comment needs updating - you are calling prctl() here, not syscall().

> ++       * guess about the number of args; the docs discuss calling conventions
> ++       * up to 4, so let's try that?

The args for prctl() are option plus 4 additional arguments, so a
total of 5, not 4.


> ++       */
> ++      void *res = __builtin_apply((void (*)()) real_prctl, __builtin_apply_args(), sizeof(long) * 4);
> ++      __builtin_return(res);
> ++}
> ++
> ++/* unused.
> ++ */
> ++static int wrap_prctl(int option, va_list ap) {
> ++      (void) option;
> ++      (void) ap;
> ++      return -1;
> ++}
> +Index: git/ports/linux/guts/prctl.c
> +===================================================================
> +--- /dev/null
> ++++ git/ports/linux/guts/prctl.c
> +@@ -0,0 +1,15 @@
> ++/*
> ++ * Copyright (c) 2020 Richard Purdie
> ++ *
> ++ * SPDX-License-Identifier: LGPL-2.1-only
> ++ *
> ++ * int prctl(int option, ...)
> ++ *    int rc = -1;
> ++ */
> ++
> ++      /* we should never get here, prctl is hand-wrapped */
> ++      rc = -1;
> ++
> ++/*    return rc;
> ++ * }
> ++ */
> +Index: git/ports/linux/portdefs.h
> +===================================================================
> +--- git.orig/ports/linux/portdefs.h
> ++++ git/ports/linux/portdefs.h
> +@@ -32,3 +32,5 @@ GLIBC_COMPAT_SYMBOL(memcpy,2.0);
> +
> + #include <linux/capability.h>
> + #include <sys/syscall.h>
> ++#include <sys/prctl.h>
> ++#include <linux/seccomp.h>
> +Index: git/ports/linux/wrapfuncs.in
> +===================================================================
> +--- git.orig/ports/linux/wrapfuncs.in
> ++++ git/ports/linux/wrapfuncs.in
> +@@ -56,3 +56,4 @@ int getgrent_r(struct group *gbuf, char
> + int capset(cap_user_header_t hdrp, const cap_user_data_t datap); /* real_func=pseudo_capset */
> + long syscall(long nr, ...); /* hand_wrapped=1 */
> + int renameat2(int olddirfd, const char *oldpath, int newdirfd, const char *newpath, unsigned int flags); /* flags=AT_SYMLINK_NOFOLLOW */
> ++int prctl(int option, ...); /* hand_wrapped=1 */
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index d921d85a05c..89e43c59969 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -10,6 +10,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
>             file://0001-Add-statx.patch \
>             file://0001-realpath.c-Remove-trailing-slashes.patch \
>             file://0006-xattr-adjust-for-attr-2.4.48-release.patch \
> +           file://seccomp.patch \
>             "
>
>  SRCREV = "060058bb29f70b244e685b3c704eb0641b736f73"
> --
> 2.25.1
>
> 
