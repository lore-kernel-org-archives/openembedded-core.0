Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.8442.1585953284654084157
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 15:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S5+UXRMH;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id x16so7876294qts.11
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 15:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d6myF1a2d0NNI5vWEThfdxomrFx8W1Bg59FUpr8y0VM=;
        b=S5+UXRMHWhjpCrCv1rnClJF+Is5/lO7b1BifeVIbXJ2ZCvRcjE2odYC+VSMsfFcigW
         6BBX87EyqlwmItqIhKJpfrrrEZXD0oWdhYfsEXjnjZLTe8V+W5E44RBz+mJiplX1Xahe
         cuOxcA4w4Q4vuJps4RqxtjnyUA+9hz03HoJzG+pcTo7wCI1Sl4KAynXDj2HR2weFEyXQ
         gqcaEgn8bDQT6o94BFXgV7tjXJ+9DMXW/m/oI0cqxBBj1YeY0GHEqGk8A862IUYOUeBI
         pStwJjvrZ33P87IYDq3d+5BfDHCsZIII2WilxBjfKRCS0SPWQWQxSPtHXCF6/fnp2cPW
         PJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d6myF1a2d0NNI5vWEThfdxomrFx8W1Bg59FUpr8y0VM=;
        b=TLP1iCV35KEzLcmbbuDw3t6eNmQA2oU5l37qvtxaef8P4snC0+UhQcMUCaSs4zGTO9
         Eym3azFusG9K2/81di0nxd3ilrbgVWfiaRFRuXfEHolaQKr5T8PkNjDs8yuqgKmzQ/r/
         gLITv/k9OrJiJxFcFddHZU8eULHQKPfVH+5GbZJXP6psahxYo4995ZpGxWuM1IlX8/GE
         oyN9IWzg5aqq6KZyhYH/g4TtY33nJP0XFQNiMEAnwV0ijYteK3OfdWNFWCnZdjtRiEbM
         r+Zjx3qtNKngEP/8OmUPrk1atI5DNolBxLSn37DuqtrtsKoZnGCsuaw5ittXo9IvGVIz
         v2zA==
X-Gm-Message-State: AGi0PubpoJ38xi0kxs+LmEbrSnNZNxpdr4eXNRWmgLP9L2iKDlFguf0g
	gO78Y/qUhuYerpT364zFzCxOpc8wG7tOTATUqL8=
X-Google-Smtp-Source: APiQypIFVMUkNOCplqhuvzAJpOhoAxVBE0PjNvckIctfNW79IvjS9FJflB0ABLaK1b5iQ8pQ1teQUWuUOHJOZDnXeTY=
X-Received: by 2002:ac8:2fe6:: with SMTP id m35mr10115385qta.316.1585953283570;
 Fri, 03 Apr 2020 15:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200403215938.175657-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200403215938.175657-1-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 3 Apr 2020 15:34:17 -0700
Message-ID: <CAMKF1sqrHwS9RZGER=m+DfEgNsfp7EYLLR6VO+Po-rCO5Wdq_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pseudo: Force seccomp to return success when in fact doing nothing
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
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

This patch seems to be sailing smoothly on my setup.

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
> ++       * guess about the number of args; the docs discuss calling conventions
> ++       * up to 4, so let's try that?
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
