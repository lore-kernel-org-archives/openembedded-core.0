Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63613C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 09:56:07 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.83973.1754042154027082866
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 02:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TK7kT+dc;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3322d1dded6so16954651fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 02:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754042152; x=1754646952; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbB6mCEgLyF5iefxKV7GCngwyEtj0G9tYdEJlQbTcXA=;
        b=TK7kT+dcuPDU6T4JrO9bNWzq8uIzX1g1LY5jR2n+juSZ0TXh7sJnfChyQtEF998MdR
         o7kbg6W43hWOJWnPKJXKAhLFJMSYHWCy1kVSw0gVX8Wr0IsiJZuQM5+P4yOmNYskssun
         xO7l4SDhRIldTNR12T+WTQeiTYox7LUhjrJfXJdyO80drmiaoxGhSH8sZ/JkspZWdm0P
         CWvcKMAyfupuxgkAyBA4m5GIGpJcUpjaELo/l4jLK0WHnDmtOz9NTOBmE2ZL2SPojoVS
         lCfhkVgVA4lbkgt6f5YjZ1yQDrHGkTBnRcONr0h0NKu0100Cq0/aMmyG7iIvnz56EHt1
         K1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754042152; x=1754646952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbB6mCEgLyF5iefxKV7GCngwyEtj0G9tYdEJlQbTcXA=;
        b=lz4oo8tjxr8ydad9riwvA4bYx5ba51CyiLCXnm3+ebv2FXrGxU9c5fGRPrrZd8mGO8
         dUk6RLsWKe3KSXqPIflI6vf+12UseMjvsiHFPHrApp7+LyPGUzH3GI1DF9ACUyu5xApr
         0dddcao7AKe9jb81wa7iI8cSr4220PLqaZDL1NwnfLoJ9k3/0Pp8N+fCM0mQbzFjT87m
         /f+4SbjOBTVa2Oz0mLrGe9QFHGsFqH4Lt1JthpoSGovD9INwHgJdjdYBNrWuArglacuC
         8DpMT9hca1zn/85Grvc4w5t00ZPnRgHJACF1wPvD14805/wIN0ZKA2LiZPZhZJ26ePWg
         96ig==
X-Gm-Message-State: AOJu0Ywe0OuSkbINu5J5eV8i647+tBhv5Yy23jAJjxuXbv+vh8uv2/Hf
	yGL3Zh7W5UvGoexqBGCaMfWbI34FXAcRu+RM9lcYTAZ9yn1WPOOJ4mEsc2qksRM53PEkPxnahJI
	zdf0dEATGj9N6OOB8t3XcjgLtMf4t0Wg=
X-Gm-Gg: ASbGncsn1p1P/BC55nI7pGp2h4uwvLMw2HPW0JRxA5sh39fsnPNCOMxjYZ5yti09mOh
	Lz93zwRyzuZy7SPdjhXTOJI+mA/GEKV8WpIgteYBqehTh6rMjj2h9SAxWHRJlri3QHDa3+f15FF
	oyGsRPnSW7Xs4CkFEfyLmodWmsPLY2krilnXuKD7eCa65oWOQAnerbs9ZXExcayHztyl+LPKY4A
	ohGiQdm6Q==
X-Google-Smtp-Source: AGHT+IETA+lPRBDAEOliuyYGWN6fM57r/4rOFtHbGj21U3vkPHBH90mbr4hsf52VUpoZ545vdGXh3Ikl35LzQ5JwzWY=
X-Received: by 2002:a05:651c:1b8d:b0:32b:3b53:6548 with SMTP id
 38308e7fff4ca-33224ba1250mr28354761fa.23.1754042150642; Fri, 01 Aug 2025
 02:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753468892.git.steve@sakoman.com> <dd5bbac75b1d8f7ebd83d5c9945bd860e397ba07.1753468892.git.steve@sakoman.com>
In-Reply-To: <dd5bbac75b1d8f7ebd83d5c9945bd860e397ba07.1753468892.git.steve@sakoman.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 1 Aug 2025 11:55:45 +0200
X-Gm-Features: Ac12FXxs62JxcJ9VHTqbfVsFMUOES0SJMvrrHISFoY4UbDhhT6Mzeo85zdtfjDQ
Message-ID: <CA+chaQcuqYkmz8cb0NbWTxMq1vj+9oxS0tLzps6J2Tq_GbhwRg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap V2 08/16] libpam: fix CVE-2025-6020
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 09:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221224

This seems to introduce:

../../../Linux-PAM-1.5.3/modules/pam_namespace/pam_namespace.c:326:11:
error: call to undeclared function 'dirname'; ISO C99 and later do not
support implicit function declarations
[-Wimplicit-function-declaration]
  326 |         parent =3D dirname(buf);
      |                  ^
../../../Linux-PAM-1.5.3/modules/pam_namespace/pam_namespace.c:326:9:
error: incompatible integer to pointer conversion assigning to 'char
*' from 'int' [-Wint-conversion]
  326 |         parent =3D dirname(buf);
      |                ^ ~~~~~~~~~~~~

because pam_namespace.h wasn't updated to include libgen.h as in the
original commit
https://github.com/linux-pam/linux-pam/commit/475bd60c552b98c7eddb3270b0b41=
96847c0072e#diff-05f443e6acbe32a148a45648148739bf6f02f13acc5c20c6037bf93322=
3d4d77

will send a fix later.

On Fri, Jul 25, 2025 at 8:44=E2=80=AFPM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> From: Hitendra Prajapati <hprajapati@mvista.com>
>
> Upstream-Status: Backport from https://github.com/linux-pam/linux-pam/com=
mit/475bd60c552b98c7eddb3270b0b4196847c0072e && https://github.com/linux-pa=
m/linux-pam/commit/592d84e1265d04c3104acee815a503856db503a1 && https://gith=
ub.com/linux-pam/linux-pam/commit/976c20079358d133514568fc7fd95c02df8b5773
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../libpam/0001-pam-inline-pam-asprintf.patch |  101 ++
>  .../libpam/0002-pam-namespace-rebase.patch    |  750 +++++++++++
>  .../pam/libpam/CVE-2025-6020-01.patch         | 1128 +++++++++++++++++
>  .../pam/libpam/CVE-2025-6020-02.patch         |  187 +++
>  .../pam/libpam/CVE-2025-6020-03.patch         |   35 +
>  meta/recipes-extended/pam/libpam_1.5.3.bb     |    5 +
>  6 files changed, 2206 insertions(+)
>  create mode 100644 meta/recipes-extended/pam/libpam/0001-pam-inline-pam-=
asprintf.patch
>  create mode 100644 meta/recipes-extended/pam/libpam/0002-pam-namespace-r=
ebase.patch
>  create mode 100644 meta/recipes-extended/pam/libpam/CVE-2025-6020-01.pat=
ch
>  create mode 100644 meta/recipes-extended/pam/libpam/CVE-2025-6020-02.pat=
ch
>  create mode 100644 meta/recipes-extended/pam/libpam/CVE-2025-6020-03.pat=
ch
>
> diff --git a/meta/recipes-extended/pam/libpam/0001-pam-inline-pam-asprint=
f.patch b/meta/recipes-extended/pam/libpam/0001-pam-inline-pam-asprintf.pat=
ch
> new file mode 100644
> index 0000000000..9d1a0223df
> --- /dev/null
> +++ b/meta/recipes-extended/pam/libpam/0001-pam-inline-pam-asprintf.patch
> @@ -0,0 +1,101 @@
> +From 10b80543807e3fc5af5f8bcfd8bb6e219bb3cecc Mon Sep 17 00:00:00 2001
> +From: "Dmitry V. Levin" <ldv@strace.io>
> +Date: Tue, 18 Feb 2025 08:00:00 +0000
> +Subject: [PATCH] pam_inline: introduce pam_asprintf(), pam_snprintf(), a=
nd
> + pam_sprintf()
> +
> +pam_asprintf() is essentially asprintf() with the following semantic
> +difference: it returns the string itself instead of its length.
> +
> +pam_snprintf() is essentially snprintf() with the following semantic
> +difference: it returns -1 in case of truncation.
> +
> +pam_sprintf() is essentially snprintf() but with a check that the buffer
> +is an array, and with an automatically calculated buffer size.
> +
> +Use of these helpers would make error checking simpler.
> +
> +(cherry picked from commit 10b80543807e3fc5af5f8bcfd8bb6e219bb3cecc)
> +Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> +
> +Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit=
/10b80543807e3fc5af5f8bcfd8bb6e219bb3cecc]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + libpam/include/pam_cc_compat.h |  6 ++++++
> + libpam/include/pam_inline.h    | 36 ++++++++++++++++++++++++++++++++++
> + 2 files changed, 42 insertions(+)
> +
> +diff --git a/libpam/include/pam_cc_compat.h b/libpam/include/pam_cc_comp=
at.h
> +index 0a6e32d..af05428 100644
> +--- a/libpam/include/pam_cc_compat.h
> ++++ b/libpam/include/pam_cc_compat.h
> +@@ -21,6 +21,12 @@
> + # define PAM_ATTRIBUTE_ALIGNED(arg)   /* empty */
> + #endif
> +
> ++#if PAM_GNUC_PREREQ(3, 0)
> ++# define PAM_ATTRIBUTE_MALLOC         __attribute__((__malloc__))
> ++#else
> ++# define PAM_ATTRIBUTE_MALLOC         /* empty */
> ++#endif
> ++
> + #if PAM_GNUC_PREREQ(4, 6)
> + # define DIAG_PUSH_IGNORE_CAST_QUAL                                   \
> +       _Pragma("GCC diagnostic push");                                 \
> +diff --git a/libpam/include/pam_inline.h b/libpam/include/pam_inline.h
> +index 7721c0b..ec0497c 100644
> +--- a/libpam/include/pam_inline.h
> ++++ b/libpam/include/pam_inline.h
> +@@ -9,6 +9,8 @@
> + #define PAM_INLINE_H
> +
> + #include "pam_cc_compat.h"
> ++#include <stdarg.h>
> ++#include <stdio.h>
> + #include <stdlib.h>
> + #include <string.h>
> + #include <unistd.h>
> +@@ -126,6 +128,40 @@ pam_drop_response(struct pam_response *reply, int r=
eplies)
> + }
> +
> +
> ++static inline char * PAM_FORMAT((printf, 1, 2)) PAM_NONNULL((1)) PAM_AT=
TRIBUTE_MALLOC
> ++pam_asprintf(const char *fmt, ...)
> ++{
> ++      int rc;
> ++      char *res;
> ++      va_list ap;
> ++
> ++      va_start(ap, fmt);
> ++      rc =3D vasprintf(&res, fmt, ap);
> ++      va_end(ap);
> ++
> ++      return rc < 0 ? NULL : res;
> ++}
> ++
> ++static inline int PAM_FORMAT((printf, 3, 4)) PAM_NONNULL((3))
> ++pam_snprintf(char *str, size_t size, const char *fmt, ...)
> ++{
> ++      int rc;
> ++      va_list ap;
> ++
> ++      va_start(ap, fmt);
> ++      rc =3D vsnprintf(str, size, fmt, ap);
> ++      va_end(ap);
> ++
> ++      if (rc < 0 || (unsigned int) rc >=3D size)
> ++              return -1;
> ++      return rc;
> ++}
> ++
> ++#define pam_sprintf(str_, fmt_, ...)                                   =
       \
> ++      pam_snprintf((str_), sizeof(str_) + PAM_MUST_BE_ARRAY(str_), (fmt=
_),    \
> ++                   ##__VA_ARGS__)
> ++
> ++
> + static inline int
> + pam_read_passwords(int fd, int npass, char **passwords)
> + {
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-extended/pam/libpam/0002-pam-namespace-rebase.p=
atch b/meta/recipes-extended/pam/libpam/0002-pam-namespace-rebase.patch
> new file mode 100644
> index 0000000000..ff5a8a4946
> --- /dev/null
> +++ b/meta/recipes-extended/pam/libpam/0002-pam-namespace-rebase.patch
> @@ -0,0 +1,750 @@
> +From df1dab1a1a7900650ad4be157fea1a002048cc49 Mon Sep 17 00:00:00 2001
> +From: Olivier Bal-Petre <olivier.bal-petre@ssi.gouv.fr>
> +Date: Tue, 4 Mar 2025 14:37:02 +0100
> +Subject: [PATCH ] pam-namespace-rebase
> +
> +Refresh the pam-namespace.
> +
> +Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit=
/a8b4dce7b53d73de372e150028c970ee0a2a2e97]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + modules/pam_namespace/pam_namespace.c | 444 +++++++++++++-------------
> + modules/pam_namespace/pam_namespace.h |   7 +-
> + 2 files changed, 224 insertions(+), 227 deletions(-)
> +
> +diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_namespa=
ce/pam_namespace.c
> +index b026861..166bfce 100644
> +--- a/modules/pam_namespace/pam_namespace.c
> ++++ b/modules/pam_namespace/pam_namespace.c
> +@@ -41,7 +41,7 @@
> + #include "pam_namespace.h"
> + #include "argv_parse.h"
> +
> +-/* --- evaluting all files in VENDORDIR/security/namespace.d and /etc/s=
ecurity/namespace.d --- */
> ++/* --- evaluating all files in VENDORDIR/security/namespace.d and /etc/=
security/namespace.d --- */
> + static const char *base_name(const char *path)
> + {
> +     const char *base =3D strrchr(path, '/');
> +@@ -55,6 +55,155 @@ compare_filename(const void *a, const void *b)
> +                     base_name(* (char * const *) b));
> + }
> +
> ++static void close_fds_pre_exec(struct instance_data *idata)
> ++{
> ++      if (pam_modutil_sanitize_helper_fds(idata->pamh, PAM_MODUTIL_IGNO=
RE_FD,
> ++                      PAM_MODUTIL_IGNORE_FD, PAM_MODUTIL_IGNORE_FD) < 0=
) {
> ++              _exit(1);
> ++      }
> ++}
> ++
> ++static void
> ++strip_trailing_slashes(char *str)
> ++{
> ++      char *p =3D str + strlen(str);
> ++
> ++      while (--p > str && *p =3D=3D '/')
> ++              *p =3D '\0';
> ++}
> ++
> ++static int protect_mount(int dfd, const char *path, struct instance_dat=
a *idata)
> ++{
> ++      struct protect_dir_s *dir =3D idata->protect_dirs;
> ++      char tmpbuf[64];
> ++
> ++      while (dir !=3D NULL) {
> ++              if (strcmp(path, dir->dir) =3D=3D 0) {
> ++                      return 0;
> ++              }
> ++              dir =3D dir->next;
> ++      }
> ++
> ++      if (pam_sprintf(tmpbuf, "/proc/self/fd/%d", dfd) < 0)
> ++              return -1;
> ++
> ++      dir =3D calloc(1, sizeof(*dir));
> ++
> ++      if (dir =3D=3D NULL) {
> ++              return -1;
> ++      }
> ++
> ++      dir->dir =3D strdup(path);
> ++
> ++      if (dir->dir =3D=3D NULL) {
> ++              free(dir);
> ++              return -1;
> ++      }
> ++
> ++      if (idata->flags & PAMNS_DEBUG) {
> ++              pam_syslog(idata->pamh, LOG_INFO,
> ++                      "Protect mount of %s over itself", path);
> ++      }
> ++
> ++      if (mount(tmpbuf, tmpbuf, NULL, MS_BIND, NULL) !=3D 0) {
> ++              int save_errno =3D errno;
> ++              pam_syslog(idata->pamh, LOG_ERR,
> ++                      "Protect mount of %s failed: %m", tmpbuf);
> ++              free(dir->dir);
> ++              free(dir);
> ++              errno =3D save_errno;
> ++              return -1;
> ++      }
> ++
> ++      dir->next =3D idata->protect_dirs;
> ++      idata->protect_dirs =3D dir;
> ++
> ++      return 0;
> ++}
> ++
> ++static int protect_dir(const char *path, mode_t mode, int do_mkdir,
> ++      struct instance_data *idata)
> ++{
> ++      char *p =3D strdup(path);
> ++      char *d;
> ++      char *dir =3D p;
> ++      int dfd =3D AT_FDCWD;
> ++      int dfd_next;
> ++      int save_errno;
> ++      int flags =3D O_RDONLY | O_DIRECTORY;
> ++      int rv =3D -1;
> ++      struct stat st;
> ++
> ++      if (p =3D=3D NULL) {
> ++              return -1;
> ++      }
> ++
> ++      if (*dir =3D=3D '/') {
> ++              dfd =3D open("/", flags);
> ++              if (dfd =3D=3D -1) {
> ++                      goto error;
> ++              }
> ++              dir++;  /* assume / is safe */
> ++      }
> ++
> ++      while ((d=3Dstrchr(dir, '/')) !=3D NULL) {
> ++              *d =3D '\0';
> ++              dfd_next =3D openat(dfd, dir, flags);
> ++              if (dfd_next =3D=3D -1) {
> ++                      goto error;
> ++              }
> ++
> ++              if (dfd !=3D AT_FDCWD)
> ++                      close(dfd);
> ++              dfd =3D dfd_next;
> ++
> ++              if (fstat(dfd, &st) !=3D 0) {
> ++                      goto error;
> ++              }
> ++
> ++              if (flags & O_NOFOLLOW) {
> ++                      /* we are inside user-owned dir - protect */
> ++                      if (protect_mount(dfd, p, idata) =3D=3D -1)
> ++                              goto error;
> ++              } else if (st.st_uid !=3D 0 || st.st_gid !=3D 0 ||
> ++                      (st.st_mode & S_IWOTH)) {
> ++                      /* do not follow symlinks on subdirectories */
> ++                      flags |=3D O_NOFOLLOW;
> ++              }
> ++
> ++              *d =3D '/';
> ++              dir =3D d + 1;
> ++      }
> ++
> ++      rv =3D openat(dfd, dir, flags);
> ++
> ++      if (rv =3D=3D -1) {
> ++              if (!do_mkdir || mkdirat(dfd, dir, mode) !=3D 0) {
> ++                      goto error;
> ++              }
> ++              rv =3D openat(dfd, dir, flags);
> ++      }
> ++
> ++      if (flags & O_NOFOLLOW) {
> ++              /* we are inside user-owned dir - protect */
> ++              if (protect_mount(rv, p, idata) =3D=3D -1) {
> ++                      save_errno =3D errno;
> ++                      close(rv);
> ++                      rv =3D -1;
> ++                      errno =3D save_errno;
> ++              }
> ++      }
> ++
> ++error:
> ++      save_errno =3D errno;
> ++      free(p);
> ++      if (dfd !=3D AT_FDCWD && dfd >=3D 0)
> ++              close(dfd);
> ++      errno =3D save_errno;
> ++
> ++      return rv;
> ++}
> ++
> + /* Evaluating a list of files which have to be parsed in the right orde=
r:
> +  *
> +  * - If etc/security/namespace.d/@filename@.conf exists, then
> +@@ -129,6 +278,7 @@ static char **read_namespace_dir(struct instance_dat=
a *idata)
> +       return file_list;
> + }
> +
> ++
> + /*
> +  * Adds an entry for a polyinstantiated directory to the linked list of
> +  * polyinstantiated directories. It is called from process_line() while
> +@@ -198,7 +348,7 @@ static void cleanup_protect_data(pam_handle_t *pamh =
UNUSED , void *data, int err
> +       unprotect_dirs(data);
> + }
> +
> +-static char *expand_variables(const char *orig, const char *var_names[]=
, const char *var_values[])
> ++static char *expand_variables(const char *orig, const char *const var_n=
ames[], const char *var_values[])
> + {
> +       const char *src =3D orig;
> +       char *dst;
> +@@ -209,7 +359,7 @@ static char *expand_variables(const char *orig, cons=
t char *var_names[], const c
> +               if (*src =3D=3D '$') {
> +                       int i;
> +                       for (i =3D 0; var_names[i]; i++) {
> +-                              int namelen =3D strlen(var_names[i]);
> ++                              size_t namelen =3D strlen(var_names[i]);
> +                               if (strncmp(var_names[i], src+1, namelen)=
 =3D=3D 0) {
> +                                       dstlen +=3D strlen(var_values[i])=
 - 1; /* $ */
> +                                       src +=3D namelen;
> +@@ -227,7 +377,7 @@ static char *expand_variables(const char *orig, cons=
t char *var_names[], const c
> +               if (c =3D=3D '$') {
> +                       int i;
> +                       for (i =3D 0; var_names[i]; i++) {
> +-                              int namelen =3D strlen(var_names[i]);
> ++                              size_t namelen =3D strlen(var_names[i]);
> +                               if (strncmp(var_names[i], src+1, namelen)=
 =3D=3D 0) {
> +                                       dst =3D stpcpy(dst, var_values[i]=
);
> +                                       --dst;
> +@@ -311,8 +461,7 @@ static int parse_iscript_params(char *params, struct=
 polydir_s *poly)
> +
> +     if (*params !=3D '\0') {
> +       if (*params !=3D '/') { /* path is relative to NAMESPACE_D_DIR */
> +-              if (asprintf(&poly->init_script, "%s%s", NAMESPACE_D_DIR,=
 params) =3D=3D -1)
> +-                      return -1;
> ++              poly->init_script =3D pam_asprintf("%s%s", NAMESPACE_D_DI=
R, params);
> +       } else {
> +               poly->init_script =3D strdup(params);
> +       }
> +@@ -394,9 +543,9 @@ static int parse_method(char *method, struct polydir=
_s *poly,
> + {
> +     enum polymethod pm;
> +     char *sptr =3D NULL;
> +-    static const char *method_names[] =3D { "user", "context", "level",=
 "tmpdir",
> ++    static const char *const method_names[] =3D { "user", "context", "l=
evel", "tmpdir",
> +       "tmpfs", NULL };
> +-    static const char *flag_names[] =3D { "create", "noinit", "iscript"=
,
> ++    static const char *const flag_names[] =3D { "create", "noinit", "is=
cript",
> +       "shared", "mntopts", NULL };
> +     static const unsigned int flag_values[] =3D { POLYDIR_CREATE, POLYD=
IR_NOINIT,
> +       POLYDIR_ISCRIPT, POLYDIR_SHARED, POLYDIR_MNTOPTS };
> +@@ -421,7 +570,7 @@ static int parse_method(char *method, struct polydir=
_s *poly,
> +
> +     while ((flag=3Dstrtok_r(NULL, ":", &sptr)) !=3D NULL) {
> +       for (i =3D 0; flag_names[i]; i++) {
> +-              int namelen =3D strlen(flag_names[i]);
> ++              size_t namelen =3D strlen(flag_names[i]);
> +
> +               if (strncmp(flag, flag_names[i], namelen) =3D=3D 0) {
> +                       poly->flags |=3D flag_values[i];
> +@@ -467,27 +616,27 @@ static int parse_method(char *method, struct polyd=
ir_s *poly,
> +  * of the namespace configuration file. It skips over comments and inco=
mplete
> +  * or malformed lines. It processes a valid line with information on
> +  * polyinstantiating a directory by populating appropriate fields of a
> +- * polyinstatiated directory structure and then calling add_polydir_ent=
ry to
> ++ * polyinstantiated directory structure and then calling add_polydir_en=
try to
> +  * add that entry to the linked list of polyinstantiated directories.
> +  */
> + static int process_line(char *line, const char *home, const char *rhome=
,
> +                       struct instance_data *idata)
> + {
> +     char *dir =3D NULL, *instance_prefix =3D NULL, *rdir =3D NULL;
> ++    const char *config_dir, *config_instance_prefix;
> +     char *method, *uids;
> +     char *tptr;
> +     struct polydir_s *poly;
> +     int retval =3D 0;
> +     char **config_options =3D NULL;
> +-    static const char *var_names[] =3D {"HOME", "USER", NULL};
> ++    static const char *const var_names[] =3D {"HOME", "USER", NULL};
> +     const char *var_values[] =3D {home, idata->user};
> +     const char *rvar_values[] =3D {rhome, idata->ruser};
> +-    int len;
> +
> +     /*
> +      * skip the leading white space
> +      */
> +-    while (*line && isspace(*line))
> ++    while (*line && isspace((unsigned char)*line))
> +         line++;
> +
> +     /*
> +@@ -523,22 +672,19 @@ static int process_line(char *line, const char *ho=
me, const char *rhome,
> +         goto erralloc;
> +     }
> +
> +-    dir =3D config_options[0];
> +-    if (dir =3D=3D NULL) {
> ++    config_dir =3D config_options[0];
> ++    if (config_dir =3D=3D NULL) {
> +         pam_syslog(idata->pamh, LOG_NOTICE, "Invalid line missing polyd=
ir");
> +         goto skipping;
> +     }
> +-    instance_prefix =3D config_options[1];
> +-    if (instance_prefix =3D=3D NULL) {
> ++    config_instance_prefix =3D config_options[1];
> ++    if (config_instance_prefix =3D=3D NULL) {
> +         pam_syslog(idata->pamh, LOG_NOTICE, "Invalid line missing insta=
nce_prefix");
> +-        instance_prefix =3D NULL;
> +         goto skipping;
> +     }
> +     method =3D config_options[2];
> +     if (method =3D=3D NULL) {
> +         pam_syslog(idata->pamh, LOG_NOTICE, "Invalid line missing metho=
d");
> +-        instance_prefix =3D NULL;
> +-        dir =3D NULL;
> +         goto skipping;
> +     }
> +
> +@@ -553,19 +699,16 @@ static int process_line(char *line, const char *ho=
me, const char *rhome,
> +     /*
> +      * Expand $HOME and $USER in poly dir and instance dir prefix
> +      */
> +-    if ((rdir=3Dexpand_variables(dir, var_names, rvar_values)) =3D=3D N=
ULL) {
> +-          instance_prefix =3D NULL;
> +-          dir =3D NULL;
> ++    if ((rdir =3D expand_variables(config_dir, var_names, rvar_values))=
 =3D=3D NULL) {
> +           goto erralloc;
> +     }
> +
> +-    if ((dir=3Dexpand_variables(dir, var_names, var_values)) =3D=3D NUL=
L) {
> +-          instance_prefix =3D NULL;
> ++    if ((dir =3D expand_variables(config_dir, var_names, var_values)) =
=3D=3D NULL) {
> +           goto erralloc;
> +     }
> +
> +-    if ((instance_prefix=3Dexpand_variables(instance_prefix, var_names,=
 var_values))
> +-          =3D=3D NULL) {
> ++    if ((instance_prefix =3D expand_variables(config_instance_prefix,
> ++                                          var_names, var_values)) =3D=
=3D NULL) {
> +           goto erralloc;
> +     }
> +
> +@@ -575,15 +718,8 @@ static int process_line(char *line, const char *hom=
e, const char *rhome,
> +           pam_syslog(idata->pamh, LOG_DEBUG, "Expanded instance prefix:=
 '%s'", instance_prefix);
> +     }
> +
> +-    len =3D strlen(dir);
> +-    if (len > 0 && dir[len-1] =3D=3D '/') {
> +-          dir[len-1] =3D '\0';
> +-    }
> +-
> +-    len =3D strlen(rdir);
> +-    if (len > 0 && rdir[len-1] =3D=3D '/') {
> +-          rdir[len-1] =3D '\0';
> +-    }
> ++    strip_trailing_slashes(dir);
> ++    strip_trailing_slashes(rdir);
> +
> +     if (dir[0] =3D=3D '\0' || rdir[0] =3D=3D '\0') {
> +           pam_syslog(idata->pamh, LOG_NOTICE, "Invalid polydir");
> +@@ -594,26 +730,19 @@ static int process_line(char *line, const char *ho=
me, const char *rhome,
> +      * Populate polyinstantiated directory structure with appropriate
> +      * pathnames and the method with which to polyinstantiate.
> +      */
> +-    if (strlen(dir) >=3D sizeof(poly->dir)
> +-        || strlen(rdir) >=3D sizeof(poly->rdir)
> +-      || strlen(instance_prefix) >=3D sizeof(poly->instance_prefix)) {
> +-      pam_syslog(idata->pamh, LOG_NOTICE, "Pathnames too long");
> +-      goto skipping;
> +-    }
> +-    strcpy(poly->dir, dir);
> +-    strcpy(poly->rdir, rdir);
> +-    strcpy(poly->instance_prefix, instance_prefix);
> +-
> +     if (parse_method(method, poly, idata) !=3D 0) {
> +           goto skipping;
> +     }
> +
> +-    if (poly->method =3D=3D TMPDIR) {
> +-      if (sizeof(poly->instance_prefix) - strlen(poly->instance_prefix)=
 < 7) {
> +-              pam_syslog(idata->pamh, LOG_NOTICE, "Pathnames too long")=
;
> +-              goto skipping;
> +-      }
> +-      strcat(poly->instance_prefix, "XXXXXX");
> ++#define COPY_STR(dst, src, apd)                                \
> ++      pam_sprintf((dst), "%s%s", (src), (apd))
> ++
> ++    if (COPY_STR(poly->dir, dir, "") < 0
> ++      || COPY_STR(poly->rdir, rdir, "") < 0
> ++      || COPY_STR(poly->instance_prefix, instance_prefix,
> ++                  poly->method =3D=3D TMPDIR ? "XXXXXX" : "") < 0) {
> ++      pam_syslog(idata->pamh, LOG_NOTICE, "Pathnames too long");
> ++      goto skipping;
> +     }
> +
> +     /*
> +@@ -637,7 +766,7 @@ static int process_line(char *line, const char *home=
, const char *rhome,
> +     if (uids) {
> +         uid_t *uidptr;
> +         const char *ustr, *sstr;
> +-        int count, i;
> ++        size_t count, i;
> +
> +       if (*uids =3D=3D '~') {
> +               poly->flags |=3D POLYDIR_EXCLUSIVE;
> +@@ -646,8 +775,13 @@ static int process_line(char *line, const char *hom=
e, const char *rhome,
> +         for (count =3D 0, ustr =3D sstr =3D uids; sstr; ustr =3D sstr +=
 1, count++)
> +            sstr =3D strchr(ustr, ',');
> +
> ++        if (count > UINT_MAX || count > SIZE_MAX / sizeof(uid_t)) {
> ++            pam_syslog(idata->pamh, LOG_ERR, "Too many uids encountered=
 in configuration");
> ++            goto skipping;
> ++        }
> ++
> +         poly->num_uids =3D count;
> +-        poly->uid =3D (uid_t *) malloc(count * sizeof (uid_t));
> ++        poly->uid =3D malloc(count * sizeof (uid_t));
> +         uidptr =3D poly->uid;
> +         if (uidptr =3D=3D NULL) {
> +             goto erralloc;
> +@@ -996,6 +1130,7 @@ static int form_context(const struct polydir_s *pol=
yptr,
> +               return rc;
> +       }
> +       /* Should never get here */
> ++      freecon(scon);
> +       return PAM_SUCCESS;
> + }
> + #endif
> +@@ -1057,10 +1192,8 @@ static int poly_name(const struct polydir_s *poly=
ptr, char **i_name,
> +
> +     switch (pm) {
> +         case USER:
> +-          if (asprintf(i_name, "%s", idata->user) < 0) {
> +-              *i_name =3D NULL;
> ++          if ((*i_name =3D strdup(idata->user)) =3D=3D NULL)
> +               goto fail;
> +-          }
> +           break;
> +
> + #ifdef WITH_SELINUX
> +@@ -1070,17 +1203,12 @@ static int poly_name(const struct polydir_s *pol=
yptr, char **i_name,
> +               pam_syslog(idata->pamh, LOG_ERR, "Error translating direc=
tory context");
> +               goto fail;
> +           }
> +-          if (polyptr->flags & POLYDIR_SHARED) {
> +-              if (asprintf(i_name, "%s", rawcon) < 0) {
> +-                      *i_name =3D NULL;
> +-                      goto fail;
> +-              }
> +-          } else {
> +-              if (asprintf(i_name, "%s_%s", rawcon, idata->user) < 0) {
> +-                      *i_name =3D NULL;
> +-                      goto fail;
> +-              }
> +-          }
> ++          if (polyptr->flags & POLYDIR_SHARED)
> ++              *i_name =3D strdup(rawcon);
> ++          else
> ++              *i_name =3D pam_asprintf("%s_%s", rawcon, idata->user);
> ++          if (*i_name =3D=3D NULL)
> ++              goto fail;
> +           break;
> +
> + #endif /* WITH_SELINUX */
> +@@ -1110,11 +1238,12 @@ static int poly_name(const struct polydir_s *pol=
yptr, char **i_name,
> +           *i_name =3D hash;
> +           hash =3D NULL;
> +         } else {
> +-          char *newname;
> +-          if (asprintf(&newname, "%.*s_%s", NAMESPACE_MAX_DIR_LEN-1-(in=
t)strlen(hash),
> +-              *i_name, hash) < 0) {
> ++          char *newname =3D
> ++              pam_asprintf("%.*s_%s",
> ++                           NAMESPACE_MAX_DIR_LEN - 1 - (int)strlen(hash=
),
> ++                           *i_name, hash);
> ++          if (newname =3D=3D NULL)
> +               goto fail;
> +-          }
> +           free(*i_name);
> +           *i_name =3D newname;
> +         }
> +@@ -1139,137 +1268,6 @@ fail:
> +     return rc;
> + }
> +
> +-static int protect_mount(int dfd, const char *path, struct instance_dat=
a *idata)
> +-{
> +-      struct protect_dir_s *dir =3D idata->protect_dirs;
> +-      char tmpbuf[64];
> +-
> +-      while (dir !=3D NULL) {
> +-              if (strcmp(path, dir->dir) =3D=3D 0) {
> +-                      return 0;
> +-              }
> +-              dir =3D dir->next;
> +-      }
> +-
> +-      dir =3D calloc(1, sizeof(*dir));
> +-
> +-      if (dir =3D=3D NULL) {
> +-              return -1;
> +-      }
> +-
> +-      dir->dir =3D strdup(path);
> +-
> +-      if (dir->dir =3D=3D NULL) {
> +-              free(dir);
> +-              return -1;
> +-      }
> +-
> +-      snprintf(tmpbuf, sizeof(tmpbuf), "/proc/self/fd/%d", dfd);
> +-
> +-      if (idata->flags & PAMNS_DEBUG) {
> +-              pam_syslog(idata->pamh, LOG_INFO,
> +-                      "Protect mount of %s over itself", path);
> +-      }
> +-
> +-      if (mount(tmpbuf, tmpbuf, NULL, MS_BIND, NULL) !=3D 0) {
> +-              int save_errno =3D errno;
> +-              pam_syslog(idata->pamh, LOG_ERR,
> +-                      "Protect mount of %s failed: %m", tmpbuf);
> +-              free(dir->dir);
> +-              free(dir);
> +-              errno =3D save_errno;
> +-              return -1;
> +-      }
> +-
> +-      dir->next =3D idata->protect_dirs;
> +-      idata->protect_dirs =3D dir;
> +-
> +-      return 0;
> +-}
> +-
> +-static int protect_dir(const char *path, mode_t mode, int do_mkdir,
> +-      struct instance_data *idata)
> +-{
> +-      char *p =3D strdup(path);
> +-      char *d;
> +-      char *dir =3D p;
> +-      int dfd =3D AT_FDCWD;
> +-      int dfd_next;
> +-      int save_errno;
> +-      int flags =3D O_RDONLY | O_DIRECTORY;
> +-      int rv =3D -1;
> +-      struct stat st;
> +-
> +-      if (p =3D=3D NULL) {
> +-              goto error;
> +-      }
> +-
> +-      if (*dir =3D=3D '/') {
> +-              dfd =3D open("/", flags);
> +-              if (dfd =3D=3D -1) {
> +-                      goto error;
> +-              }
> +-              dir++;  /* assume / is safe */
> +-      }
> +-
> +-      while ((d=3Dstrchr(dir, '/')) !=3D NULL) {
> +-              *d =3D '\0';
> +-              dfd_next =3D openat(dfd, dir, flags);
> +-              if (dfd_next =3D=3D -1) {
> +-                      goto error;
> +-              }
> +-
> +-              if (dfd !=3D AT_FDCWD)
> +-                      close(dfd);
> +-              dfd =3D dfd_next;
> +-
> +-              if (fstat(dfd, &st) !=3D 0) {
> +-                      goto error;
> +-              }
> +-
> +-              if (flags & O_NOFOLLOW) {
> +-                      /* we are inside user-owned dir - protect */
> +-                      if (protect_mount(dfd, p, idata) =3D=3D -1)
> +-                              goto error;
> +-              } else if (st.st_uid !=3D 0 || st.st_gid !=3D 0 ||
> +-                      (st.st_mode & S_IWOTH)) {
> +-                      /* do not follow symlinks on subdirectories */
> +-                      flags |=3D O_NOFOLLOW;
> +-              }
> +-
> +-              *d =3D '/';
> +-              dir =3D d + 1;
> +-      }
> +-
> +-      rv =3D openat(dfd, dir, flags);
> +-
> +-      if (rv =3D=3D -1) {
> +-              if (!do_mkdir || mkdirat(dfd, dir, mode) !=3D 0) {
> +-                      goto error;
> +-              }
> +-              rv =3D openat(dfd, dir, flags);
> +-      }
> +-
> +-      if (flags & O_NOFOLLOW) {
> +-              /* we are inside user-owned dir - protect */
> +-              if (protect_mount(rv, p, idata) =3D=3D -1) {
> +-                      save_errno =3D errno;
> +-                      close(rv);
> +-                      rv =3D -1;
> +-                      errno =3D save_errno;
> +-              }
> +-      }
> +-
> +-error:
> +-      save_errno =3D errno;
> +-      free(p);
> +-      if (dfd !=3D AT_FDCWD && dfd >=3D 0)
> +-              close(dfd);
> +-      errno =3D save_errno;
> +-
> +-      return rv;
> +-}
> +-
> + static int check_inst_parent(char *ipath, struct instance_data *idata)
> + {
> +       struct stat instpbuf;
> +@@ -1281,13 +1279,12 @@ static int check_inst_parent(char *ipath, struct=
 instance_data *idata)
> +        * admin explicitly instructs to ignore the instance parent
> +        * mode by the "ignore_instance_parent_mode" argument).
> +        */
> +-      inst_parent =3D (char *) malloc(strlen(ipath)+1);
> ++      inst_parent =3D strdup(ipath);
> +       if (!inst_parent) {
> +               pam_syslog(idata->pamh, LOG_CRIT, "Error allocating pathn=
ame string");
> +               return PAM_SESSION_ERR;
> +       }
> +
> +-      strcpy(inst_parent, ipath);
> +       trailing_slash =3D strrchr(inst_parent, '/');
> +       if (trailing_slash)
> +               *trailing_slash =3D '\0';
> +@@ -1371,9 +1368,10 @@ static int inst_init(const struct polydir_s *poly=
ptr, const char *ipath,
> +                               if (setuid(geteuid()) < 0) {
> +                                       /* ignore failures, they don't ma=
tter */
> +                               }
> ++                              close_fds_pre_exec(idata);
> +
> +-                              if (execle(init_script, init_script,
> +-                                      polyptr->dir, ipath, newdir?"1":"=
0", idata->user, NULL, envp) < 0)
> ++                              execle(init_script, init_script,
> ++                                      polyptr->dir, ipath, newdir?"1":"=
0", idata->user, NULL, envp);
> +                                       _exit(1);
> +                       } else if (pid > 0) {
> +                               while (((rc =3D waitpid(pid, &status, 0))=
 =3D=3D (pid_t)-1) &&
> +@@ -1424,7 +1422,9 @@ static int create_polydir(struct polydir_s *polypt=
r,
> +
> + #ifdef WITH_SELINUX
> +     if (idata->flags & PAMNS_SELINUX_ENABLED) {
> +-      getfscreatecon_raw(&oldcon_raw);
> ++      if (getfscreatecon_raw(&oldcon_raw) !=3D 0)
> ++          pam_syslog(idata->pamh, LOG_NOTICE,
> ++                     "Error retrieving fs create context: %m");
> +
> +       label_handle =3D selabel_open(SELABEL_CTX_FILE, NULL, 0);
> +       if (!label_handle) {
> +@@ -1453,6 +1453,9 @@ static int create_polydir(struct polydir_s *polypt=
r,
> +     if (rc =3D=3D -1) {
> +             pam_syslog(idata->pamh, LOG_ERR,
> +                        "Error creating directory %s: %m", dir);
> ++#ifdef WITH_SELINUX
> ++            freecon(oldcon_raw);
> ++#endif
> +             return PAM_SESSION_ERR;
> +     }
> +
> +@@ -1640,16 +1643,14 @@ static int ns_setup(struct polydir_s *polyptr,
> +
> +     retval =3D protect_dir(polyptr->dir, 0, 0, idata);
> +
> +-    if (retval < 0 && errno !=3D ENOENT) {
> +-      pam_syslog(idata->pamh, LOG_ERR, "Polydir %s access error: %m",
> +-              polyptr->dir);
> +-      return PAM_SESSION_ERR;
> +-    }
> +-
> +     if (retval < 0) {
> +-      if ((polyptr->flags & POLYDIR_CREATE) &&
> +-              create_polydir(polyptr, idata) !=3D PAM_SUCCESS)
> +-              return PAM_SESSION_ERR;
> ++        if (errno !=3D ENOENT || !(polyptr->flags & POLYDIR_CREATE)) {
> ++            pam_syslog(idata->pamh, LOG_ERR, "Polydir %s access error: =
%m",
> ++                    polyptr->dir);
> ++            return PAM_SESSION_ERR;
> ++        }
> ++        if (create_polydir(polyptr, idata) !=3D PAM_SUCCESS)
> ++            return PAM_SESSION_ERR;
> +     } else {
> +       close(retval);
> +     }
> +@@ -1698,7 +1699,7 @@ static int ns_setup(struct polydir_s *polyptr,
> + #endif
> +     }
> +
> +-    if (asprintf(&inst_dir, "%s%s", polyptr->instance_prefix, instname)=
 < 0)
> ++    if ((inst_dir =3D pam_asprintf("%s%s", polyptr->instance_prefix, in=
stname)) =3D=3D NULL)
> +       goto error_out;
> +
> +     if (idata->flags & PAMNS_DEBUG)
> +@@ -1810,8 +1811,9 @@ static int cleanup_tmpdirs(struct instance_data *i=
data)
> +                       _exit(1);
> +               }
> + #endif
> +-              if (execle("/bin/rm", "/bin/rm", "-rf", pptr->instance_pr=
efix, NULL, envp) < 0)
> +-                      _exit(1);
> ++              close_fds_pre_exec(idata);
> ++              execle("/bin/rm", "/bin/rm", "-rf", pptr->instance_prefix=
, NULL, envp);
> ++              _exit(1);
> +           } else if (pid > 0) {
> +               while (((rc =3D waitpid(pid, &status, 0)) =3D=3D (pid_t)-=
1) &&
> +                   (errno =3D=3D EINTR));
> +@@ -1826,7 +1828,7 @@ static int cleanup_tmpdirs(struct instance_data *i=
data)
> +               }
> +           } else if (pid < 0) {
> +               pam_syslog(idata->pamh, LOG_ERR,
> +-                      "Cannot fork to run namespace init script, %m");
> ++                      "Cannot fork to cleanup temporary directory, %m")=
;
> +               rc =3D PAM_SESSION_ERR;
> +               goto out;
> +           }
> +diff --git a/modules/pam_namespace/pam_namespace.h b/modules/pam_namespa=
ce/pam_namespace.h
> +index a991b4c..180e042 100644
> +--- a/modules/pam_namespace/pam_namespace.h
> ++++ b/modules/pam_namespace/pam_namespace.h
> +@@ -44,21 +44,16 @@
> + #include <stdlib.h>
> + #include <errno.h>
> + #include <syslog.h>
> +-#include <dlfcn.h>
> +-#include <stdarg.h>
> + #include <pwd.h>
> + #include <grp.h>
> + #include <limits.h>
> + #include <sys/types.h>
> + #include <sys/stat.h>
> +-#include <sys/resource.h>
> + #include <sys/mount.h>
> + #include <sys/wait.h>
> +-#include <libgen.h>
> + #include <fcntl.h>
> + #include <sched.h>
> + #include <glob.h>
> +-#include <locale.h>
> + #include "security/pam_modules.h"
> + #include "security/pam_modutil.h"
> + #include "security/pam_ext.h"
> +@@ -114,7 +109,7 @@
> + #define PAMNS_MOUNT_PRIVATE   0x00080000 /* Make the polydir mounts pri=
vate */
> +
> + /* polydir flags */
> +-#define POLYDIR_EXCLUSIVE     0x00000001 /* polyinstatiate exclusively =
for override uids */
> ++#define POLYDIR_EXCLUSIVE     0x00000001 /* polyinstantiate exclusively=
 for override uids */
> + #define POLYDIR_CREATE        0x00000002 /* create the polydir */
> + #define POLYDIR_NOINIT        0x00000004 /* no init script */
> + #define POLYDIR_SHARED        0x00000008 /* share context/level instanc=
es among users */
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-extended/pam/libpam/CVE-2025-6020-01.patch b/me=
ta/recipes-extended/pam/libpam/CVE-2025-6020-01.patch
> new file mode 100644
> index 0000000000..ff0331aa38
> --- /dev/null
> +++ b/meta/recipes-extended/pam/libpam/CVE-2025-6020-01.patch
> @@ -0,0 +1,1128 @@
> +From 475bd60c552b98c7eddb3270b0b4196847c0072e Mon Sep 17 00:00:00 2001
> +From: Olivier Bal-Petre <olivier.bal-petre@ssi.gouv.fr>
> +Date: Tue, 4 Mar 2025 14:37:02 +0100
> +Subject: [PATCH] pam_namespace: fix potential privilege escalation
> +
> +Existing protection provided by protect_dir() and protect_mount() were
> +bind mounting on themselves all directories part of the to-be-secured
> +paths. However, this works *only* against attacks executed by processes
> +in the same mount namespace as the one the mountpoint was created in.
> +Therefore, a user with an out-of-mount-namespace access, or multiple
> +users colluding, could exploit multiple race conditions, and, for
> +instance, elevate their privileges to root.
> +
> +This commit keeps the existing protection as a defense in depth
> +measure, and to keep the existing behavior of the module. However,
> +it converts all the needed function calls to operate on file
> +descriptors instead of absolute paths to protect against race
> +conditions globally.
> +
> +Signed-off-by: Olivier Bal-Petre <olivier.bal-petre@ssi.gouv.fr>
> +Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> +
> +Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit=
/475bd60c552b98c7eddb3270b0b4196847c0072e]
> +CVE: CVE-2025-6020
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + modules/pam_namespace/pam_namespace.c | 637 ++++++++++++++++++--------
> + modules/pam_namespace/pam_namespace.h |  10 +
> + 2 files changed, 457 insertions(+), 190 deletions(-)
> +
> +diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_namespa=
ce/pam_namespace.c
> +index 166bfce..9d993d4 100644
> +--- a/modules/pam_namespace/pam_namespace.c
> ++++ b/modules/pam_namespace/pam_namespace.c
> +@@ -41,6 +41,8 @@
> + #include "pam_namespace.h"
> + #include "argv_parse.h"
> +
> ++#define MAGIC_LNK_FD_SIZE 64
> ++
> + /* --- evaluating all files in VENDORDIR/security/namespace.d and /etc/=
security/namespace.d --- */
> + static const char *base_name(const char *path)
> + {
> +@@ -75,7 +77,7 @@ strip_trailing_slashes(char *str)
> + static int protect_mount(int dfd, const char *path, struct instance_dat=
a *idata)
> + {
> +       struct protect_dir_s *dir =3D idata->protect_dirs;
> +-      char tmpbuf[64];
> ++      char tmpbuf[MAGIC_LNK_FD_SIZE];
> +
> +       while (dir !=3D NULL) {
> +               if (strcmp(path, dir->dir) =3D=3D 0) {
> +@@ -121,56 +123,107 @@ static int protect_mount(int dfd, const char *pat=
h, struct instance_data *idata)
> +       return 0;
> + }
> +
> +-static int protect_dir(const char *path, mode_t mode, int do_mkdir,
> ++/*
> ++ * Returns a fd to the given absolute path, acquired securely. This mea=
ns:
> ++ * - iterating on each segment of the path,
> ++ * - not following user symlinks,
> ++ * - using race-free operations.
> ++ *
> ++ * Takes a bit mask to specify the operation mode:
> ++ * - SECURE_OPENDIR_PROTECT: call protect_mount() on each unsafe segmen=
t of path
> ++ * - SECURE_OPENDIR_MKDIR: create last segment of path if does not exis=
t
> ++ * - SECURE_OPENDIR_FULL_FD: open the directory with O_RDONLY instead o=
f O_PATH,
> ++ *     allowing more operations to be done with the returned fd
> ++ *
> ++ * Be aware that using SECURE_OPENDIR_PROTECT:
> ++ * - will modify some external state (global structure...) and should n=
ot be
> ++ *   called in cleanup code paths. See wrapper secure_opendir_stateless=
()
> ++ * - need a non-NULL idata to call protect_mount()
> ++ */
> ++static int secure_opendir(const char *path, int opm, mode_t mode,
> +       struct instance_data *idata)
> + {
> +-      char *p =3D strdup(path);
> ++      char *p;
> +       char *d;
> +-      char *dir =3D p;
> +-      int dfd =3D AT_FDCWD;
> ++      char *dir;
> ++      int dfd =3D -1;
> +       int dfd_next;
> +       int save_errno;
> +-      int flags =3D O_RDONLY | O_DIRECTORY;
> ++      int flags =3D O_DIRECTORY | O_CLOEXEC;
> +       int rv =3D -1;
> +       struct stat st;
> +
> +-      if (p =3D=3D NULL) {
> ++      if (opm & SECURE_OPENDIR_FULL_FD)
> ++              flags |=3D O_RDONLY;
> ++      else
> ++              flags |=3D O_PATH;
> ++
> ++      /* Check for args consistency */
> ++      if ((opm & SECURE_OPENDIR_PROTECT) && idata =3D=3D NULL)
> +               return -1;
> +-      }
> +
> +-      if (*dir =3D=3D '/') {
> +-              dfd =3D open("/", flags);
> +-              if (dfd =3D=3D -1) {
> +-                      goto error;
> +-              }
> +-              dir++;  /* assume / is safe */
> ++      /* Accept only absolute paths */
> ++      if (*path !=3D '/')
> ++              return -1;
> ++
> ++      dir =3D p =3D strdup(path);
> ++      if (p =3D=3D NULL)
> ++              return -1;
> ++
> ++      /* Assume '/' is safe */
> ++      dfd =3D open("/", flags);
> ++      if (dfd =3D=3D -1)
> ++              goto error;
> ++
> ++      /* Needed to not loop too far and call openat() on NULL */
> ++      strip_trailing_slashes(p);
> ++
> ++      dir++;
> ++
> ++      /* In case path is '/' */
> ++      if (*dir =3D=3D '\0') {
> ++              free(p);
> ++              return dfd;
> +       }
> +
> +       while ((d=3Dstrchr(dir, '/')) !=3D NULL) {
> +               *d =3D '\0';
> ++
> +               dfd_next =3D openat(dfd, dir, flags);
> +-              if (dfd_next =3D=3D -1) {
> ++              if (dfd_next =3D=3D -1)
> +                       goto error;
> +-              }
> +-
> +-              if (dfd !=3D AT_FDCWD)
> +-                      close(dfd);
> +-              dfd =3D dfd_next;
> +
> +-              if (fstat(dfd, &st) !=3D 0) {
> ++              if (fstat(dfd_next, &st) !=3D 0) {
> ++                      close(dfd_next);
> +                       goto error;
> +               }
> +
> +-              if (flags & O_NOFOLLOW) {
> ++              if ((flags & O_NOFOLLOW) && (opm & SECURE_OPENDIR_PROTECT=
)) {
> +                       /* we are inside user-owned dir - protect */
> +-                      if (protect_mount(dfd, p, idata) =3D=3D -1)
> ++                      if (protect_mount(dfd_next, p, idata) =3D=3D -1) =
{
> ++                              close(dfd_next);
> ++                              goto error;
> ++                      }
> ++                      /*
> ++                       * Reopen the directory to obtain a new descripto=
r
> ++                       * after protect_mount(), this is necessary in ca=
ses
> ++                       * when another directory is going to be mounted =
over
> ++                       * the given path.
> ++                       */
> ++                      close(dfd_next);
> ++                      dfd_next =3D openat(dfd, dir, flags);
> ++                      if (dfd_next =3D=3D -1)
> +                               goto error;
> +-              } else if (st.st_uid !=3D 0 || st.st_gid !=3D 0 ||
> +-                      (st.st_mode & S_IWOTH)) {
> ++              } else if (st.st_uid !=3D 0
> ++                         || (st.st_gid !=3D 0 && (st.st_mode & S_IWGRP)=
)
> ++                         || (st.st_mode & S_IWOTH)) {
> +                       /* do not follow symlinks on subdirectories */
> +                       flags |=3D O_NOFOLLOW;
> +               }
> +
> ++              close(dfd);
> ++              dfd =3D dfd_next;
> ++
> +               *d =3D '/';
> +               dir =3D d + 1;
> +       }
> +@@ -178,13 +231,14 @@ static int protect_dir(const char *path, mode_t mo=
de, int do_mkdir,
> +       rv =3D openat(dfd, dir, flags);
> +
> +       if (rv =3D=3D -1) {
> +-              if (!do_mkdir || mkdirat(dfd, dir, mode) !=3D 0) {
> ++              if ((opm & SECURE_OPENDIR_MKDIR) && mkdirat(dfd, dir, mod=
e) =3D=3D 0)
> ++                      rv =3D openat(dfd, dir, flags);
> ++
> ++              if (rv =3D=3D -1)
> +                       goto error;
> +-              }
> +-              rv =3D openat(dfd, dir, flags);
> +       }
> +
> +-      if (flags & O_NOFOLLOW) {
> ++      if ((flags & O_NOFOLLOW) && (opm & SECURE_OPENDIR_PROTECT)) {
> +               /* we are inside user-owned dir - protect */
> +               if (protect_mount(rv, p, idata) =3D=3D -1) {
> +                       save_errno =3D errno;
> +@@ -192,18 +246,95 @@ static int protect_dir(const char *path, mode_t mo=
de, int do_mkdir,
> +                       rv =3D -1;
> +                       errno =3D save_errno;
> +               }
> ++              /*
> ++               * Reopen the directory to obtain a new descriptor after
> ++               * protect_mount(), this is necessary in cases when anoth=
er
> ++               * directory is going to be mounted over the given path.
> ++               */
> ++              close(rv);
> ++              rv =3D openat(dfd, dir, flags);
> +       }
> +
> + error:
> +       save_errno =3D errno;
> +       free(p);
> +-      if (dfd !=3D AT_FDCWD && dfd >=3D 0)
> ++      if (dfd >=3D 0)
> +               close(dfd);
> +       errno =3D save_errno;
> +
> +       return rv;
> + }
> +
> ++/*
> ++ * Returns a fd to the given path, acquired securely.
> ++ * It can be called in all situations, including in cleanup code paths,=
 as
> ++ * it does not modify external state (no access to global structures...=
).
> ++ */
> ++static int secure_opendir_stateless(const char *path)
> ++{
> ++      return secure_opendir(path, 0, 0, NULL);
> ++}
> ++
> ++/*
> ++ * Umount securely the given path, even if the directories along
> ++ * the path are under user control. It should protect against
> ++ * symlinks attacks and race conditions.
> ++ */
> ++static int secure_umount(const char *path)
> ++{
> ++      int save_errno;
> ++      int rv =3D -1;
> ++      int dfd =3D -1;
> ++      char s_path[MAGIC_LNK_FD_SIZE];
> ++
> ++      dfd =3D secure_opendir_stateless(path);
> ++      if (dfd =3D=3D -1)
> ++              return rv;
> ++
> ++      if (pam_sprintf(s_path, "/proc/self/fd/%d", dfd) < 0)
> ++              goto error;
> ++
> ++      /*
> ++      * We still have a fd open to path itself,
> ++      * so we need to do a lazy umount.
> ++      */
> ++      rv =3D umount2(s_path, MNT_DETACH);
> ++
> ++error:
> ++      save_errno =3D errno;
> ++      close(dfd);
> ++      errno =3D save_errno;
> ++      return rv;
> ++}
> ++
> ++/*
> ++ * Rmdir the given path securely, protecting against symlinks attacks
> ++ * and race conditions.
> ++ * This function is currently called only in cleanup code paths where
> ++ * any errors returned are not handled, so do not handle them either.
> ++ * Basically, try to rmdir the path on a best-effort basis.
> ++ */
> ++static void secure_try_rmdir(const char *path)
> ++{
> ++      int dfd;
> ++      char *buf;
> ++      char *parent;
> ++
> ++      buf =3D strdup(path);
> ++      if (buf =3D=3D NULL)
> ++              return;
> ++
> ++      parent =3D dirname(buf);
> ++
> ++      dfd =3D secure_opendir_stateless(parent);
> ++      if (dfd >=3D 0) {
> ++              unlinkat(dfd, base_name(path), AT_REMOVEDIR);
> ++              close(dfd);
> ++      }
> ++
> ++      free(buf);
> ++}
> ++
> + /* Evaluating a list of files which have to be parsed in the right orde=
r:
> +  *
> +  * - If etc/security/namespace.d/@filename@.conf exists, then
> +@@ -330,7 +461,7 @@ static void unprotect_dirs(struct protect_dir_s *dir=
)
> +       struct protect_dir_s *next;
> +
> +       while (dir !=3D NULL) {
> +-              umount(dir->dir);
> ++              secure_umount(dir->dir);
> +               free(dir->dir);
> +               next =3D dir->next;
> +               free(dir);
> +@@ -734,13 +865,9 @@ static int process_line(char *line, const char *hom=
e, const char *rhome,
> +           goto skipping;
> +     }
> +
> +-#define COPY_STR(dst, src, apd)                                \
> +-      pam_sprintf((dst), "%s%s", (src), (apd))
> +-
> +-    if (COPY_STR(poly->dir, dir, "") < 0
> +-      || COPY_STR(poly->rdir, rdir, "") < 0
> +-      || COPY_STR(poly->instance_prefix, instance_prefix,
> +-                  poly->method =3D=3D TMPDIR ? "XXXXXX" : "") < 0) {
> ++    if (pam_sprintf(poly->dir, "%s", dir) < 0
> ++      || pam_sprintf(poly->rdir, "%s", rdir) < 0
> ++      || pam_sprintf(poly->instance_prefix, "%s", instance_prefix) < 0)=
 {
> +       pam_syslog(idata->pamh, LOG_NOTICE, "Pathnames too long");
> +       goto skipping;
> +     }
> +@@ -1023,6 +1150,23 @@ static char *md5hash(const char *instname, struct=
 instance_data *idata)
> + }
> +
> + #ifdef WITH_SELINUX
> ++static char *secure_getfilecon(pam_handle_t *pamh, const char *dir)
> ++{
> ++      char *ctx =3D NULL;
> ++      int dfd =3D secure_opendir(dir, SECURE_OPENDIR_FULL_FD, 0, NULL);
> ++      if (dfd < 0) {
> ++              pam_syslog(pamh, LOG_ERR, "Error getting fd to %s: %m", d=
ir);
> ++              return NULL;
> ++      }
> ++      if (fgetfilecon(dfd, &ctx) < 0)
> ++              ctx =3D NULL;
> ++      if (ctx =3D=3D NULL)
> ++              pam_syslog(pamh, LOG_ERR,
> ++                         "Error getting poly dir context for %s: %m", d=
ir);
> ++      close(dfd);
> ++      return ctx;
> ++}
> ++
> + static int form_context(const struct polydir_s *polyptr,
> +               char **i_context, char **origcon,
> +               struct instance_data *idata)
> +@@ -1034,12 +1178,9 @@ static int form_context(const struct polydir_s *p=
olyptr,
> +       /*
> +        * Get the security context of the directory to polyinstantiate.
> +        */
> +-      rc =3D getfilecon(polyptr->dir, origcon);
> +-      if (rc < 0 || *origcon =3D=3D NULL) {
> +-              pam_syslog(idata->pamh, LOG_ERR,
> +-                              "Error getting poly dir context, %m");
> ++      *origcon =3D secure_getfilecon(idata->pamh, polyptr->dir);
> ++      if (*origcon =3D=3D NULL)
> +               return PAM_SESSION_ERR;
> +-      }
> +
> +       if (polyptr->method =3D=3D USER) return PAM_SUCCESS;
> +
> +@@ -1136,29 +1277,52 @@ static int form_context(const struct polydir_s *=
polyptr,
> + #endif
> +
> + /*
> +- * poly_name returns the name of the polyinstantiated instance director=
y
> ++ * From the instance differentiation string, set in the polyptr structu=
re:
> ++ * - the absolute path to the instance dir,
> ++ * - the absolute path to the previous dir (parent),
> ++ * - the instance name (may be different than the instance differentiat=
ion string)
> ++ */
> ++static int set_polydir_paths(struct polydir_s *polyptr, const char *ins=
t_differentiation)
> ++{
> ++      char *tmp;
> ++
> ++      if (pam_sprintf(polyptr->instance_absolute, "%s%s",
> ++                      polyptr->instance_prefix, inst_differentiation) <=
 0)
> ++              return -1;
> ++
> ++      polyptr->instname =3D strrchr(polyptr->instance_absolute, '/') + =
1;
> ++
> ++      if (pam_sprintf(polyptr->instance_parent, "%s", polyptr->instance=
_absolute) < 0)
> ++              return -1;
> ++
> ++      tmp =3D strrchr(polyptr->instance_parent, '/') + 1;
> ++      *tmp =3D '\0';
> ++
> ++      return 0;
> ++}
> ++
> ++/*
> ++ * Set the name of the polyinstantiated instance directory
> +  * based on the method used for polyinstantiation (user, context or lev=
el)
> +  * In addition, the function also returns the security contexts of the
> +  * original directory to polyinstantiate and the polyinstantiated insta=
nce
> +  * directory.
> +  */
> + #ifdef WITH_SELINUX
> +-static int poly_name(const struct polydir_s *polyptr, char **i_name,
> +-      char **i_context, char **origcon,
> +-        struct instance_data *idata)
> ++static int poly_name(struct polydir_s *polyptr, char **i_context,
> ++        char **origcon, struct instance_data *idata)
> + #else
> +-static int poly_name(const struct polydir_s *polyptr, char **i_name,
> +-      struct instance_data *idata)
> ++static int poly_name(struct polydir_s *polyptr, struct instance_data *i=
data)
> + #endif
> + {
> +     int rc;
> ++    char *inst_differentiation =3D NULL;
> +     char *hash =3D NULL;
> +     enum polymethod pm;
> + #ifdef WITH_SELINUX
> +     char *rawcon =3D NULL;
> + #endif
> +
> +-    *i_name =3D NULL;
> + #ifdef WITH_SELINUX
> +     *i_context =3D NULL;
> +     *origcon =3D NULL;
> +@@ -1192,7 +1356,7 @@ static int poly_name(const struct polydir_s *polyp=
tr, char **i_name,
> +
> +     switch (pm) {
> +         case USER:
> +-          if ((*i_name =3D strdup(idata->user)) =3D=3D NULL)
> ++          if ((inst_differentiation =3D strdup(idata->user)) =3D=3D NUL=
L)
> +               goto fail;
> +           break;
> +
> +@@ -1204,20 +1368,24 @@ static int poly_name(const struct polydir_s *pol=
yptr, char **i_name,
> +               goto fail;
> +           }
> +           if (polyptr->flags & POLYDIR_SHARED)
> +-              *i_name =3D strdup(rawcon);
> ++              inst_differentiation =3D strdup(rawcon);
> +           else
> +-              *i_name =3D pam_asprintf("%s_%s", rawcon, idata->user);
> +-          if (*i_name =3D=3D NULL)
> ++              inst_differentiation =3D pam_asprintf("%s_%s", rawcon, id=
ata->user);
> ++          if (inst_differentiation =3D=3D NULL)
> +               goto fail;
> +           break;
> +
> + #endif /* WITH_SELINUX */
> +
> +       case TMPDIR:
> ++          if ((inst_differentiation =3D strdup("XXXXXX")) =3D=3D NULL)
> ++              goto fail;
> ++          goto success;
> ++
> +       case TMPFS:
> +-          if ((*i_name=3Dstrdup("")) =3D=3D NULL)
> ++          if ((inst_differentiation=3Dstrdup("")) =3D=3D NULL)
> +               goto fail;
> +-          return PAM_SUCCESS;
> ++          goto success;
> +
> +       default:
> +           if (idata->flags & PAMNS_DEBUG)
> +@@ -1226,32 +1394,37 @@ static int poly_name(const struct polydir_s *pol=
yptr, char **i_name,
> +     }
> +
> +     if (idata->flags & PAMNS_DEBUG)
> +-        pam_syslog(idata->pamh, LOG_DEBUG, "poly_name %s", *i_name);
> ++        pam_syslog(idata->pamh, LOG_DEBUG, "poly_name %s", inst_differe=
ntiation);
> +
> +-    if ((idata->flags & PAMNS_GEN_HASH) || strlen(*i_name) > NAMESPACE_=
MAX_DIR_LEN) {
> +-        hash =3D md5hash(*i_name, idata);
> ++    if ((idata->flags & PAMNS_GEN_HASH) || strlen(inst_differentiation)=
 > NAMESPACE_MAX_DIR_LEN) {
> ++        hash =3D md5hash(inst_differentiation, idata);
> +         if (hash =3D=3D NULL) {
> +           goto fail;
> +         }
> +         if (idata->flags & PAMNS_GEN_HASH) {
> +-          free(*i_name);
> +-          *i_name =3D hash;
> ++          free(inst_differentiation);
> ++          inst_differentiation =3D hash;
> +           hash =3D NULL;
> +         } else {
> +           char *newname =3D
> +               pam_asprintf("%.*s_%s",
> +                            NAMESPACE_MAX_DIR_LEN - 1 - (int)strlen(hash=
),
> +-                           *i_name, hash);
> ++                           inst_differentiation, hash);
> +           if (newname =3D=3D NULL)
> +               goto fail;
> +-          free(*i_name);
> +-          *i_name =3D newname;
> ++          free(inst_differentiation);
> ++          inst_differentiation =3D newname;
> +         }
> +     }
> +-    rc =3D PAM_SUCCESS;
> +
> ++success:
> ++    if (set_polydir_paths(polyptr, inst_differentiation) =3D=3D -1)
> ++        goto fail;
> ++
> ++    rc =3D PAM_SUCCESS;
> + fail:
> +     free(hash);
> ++    free(inst_differentiation);
> + #ifdef WITH_SELINUX
> +     freecon(rawcon);
> + #endif
> +@@ -1262,55 +1435,35 @@ fail:
> +       freecon(*origcon);
> +       *origcon =3D NULL;
> + #endif
> +-      free(*i_name);
> +-      *i_name =3D NULL;
> +     }
> +     return rc;
> + }
> +
> +-static int check_inst_parent(char *ipath, struct instance_data *idata)
> ++static int check_inst_parent(int dfd, struct instance_data *idata)
> + {
> +       struct stat instpbuf;
> +-      char *inst_parent, *trailing_slash;
> +-      int dfd;
> ++
> +       /*
> +-       * stat the instance parent path to make sure it exists
> +-       * and is a directory. Check that its mode is 000 (unless the
> +-       * admin explicitly instructs to ignore the instance parent
> +-       * mode by the "ignore_instance_parent_mode" argument).
> ++       * Stat the instance parent directory to make sure it's writable =
by
> ++       * root only (unless the admin explicitly instructs to ignore the
> ++       * instance parent mode by the "ignore_instance_parent_mode" argu=
ment).
> +        */
> +-      inst_parent =3D strdup(ipath);
> +-      if (!inst_parent) {
> +-              pam_syslog(idata->pamh, LOG_CRIT, "Error allocating pathn=
ame string");
> +-              return PAM_SESSION_ERR;
> +-      }
> +
> +-      trailing_slash =3D strrchr(inst_parent, '/');
> +-      if (trailing_slash)
> +-              *trailing_slash =3D '\0';
> +-
> +-      dfd =3D protect_dir(inst_parent, 0, 1, idata);
> ++      if (idata->flags & PAMNS_IGN_INST_PARENT_MODE)
> ++              return PAM_SUCCESS;
> +
> +-      if (dfd =3D=3D -1 || fstat(dfd, &instpbuf) < 0) {
> ++      if (fstat(dfd, &instpbuf) < 0) {
> +               pam_syslog(idata->pamh, LOG_ERR,
> +-                      "Error creating or accessing instance parent %s, =
%m", inst_parent);
> +-              if (dfd !=3D -1)
> +-                      close(dfd);
> +-              free(inst_parent);
> ++                      "Error accessing instance parent, %m");
> +               return PAM_SESSION_ERR;
> +       }
> +
> +-      if ((idata->flags & PAMNS_IGN_INST_PARENT_MODE) =3D=3D 0) {
> +-              if ((instpbuf.st_mode & (S_IRWXU|S_IRWXG|S_IRWXO)) || ins=
tpbuf.st_uid !=3D 0) {
> +-                      pam_syslog(idata->pamh, LOG_ERR, "Mode of inst pa=
rent %s not 000 or owner not root",
> +-                                      inst_parent);
> +-                      close(dfd);
> +-                      free(inst_parent);
> +-                      return PAM_SESSION_ERR;
> +-              }
> ++      if ((instpbuf.st_mode & (S_IRWXU|S_IRWXG|S_IRWXO)) || instpbuf.st=
_uid !=3D 0) {
> ++              pam_syslog(idata->pamh, LOG_ERR,
> ++                      "Mode of inst parent not 000 or owner not root");
> ++              return PAM_SESSION_ERR;
> +       }
> +-      close(dfd);
> +-      free(inst_parent);
> ++
> +       return PAM_SUCCESS;
> + }
> +
> +@@ -1449,14 +1602,16 @@ static int create_polydir(struct polydir_s *poly=
ptr,
> +     }
> + #endif
> +
> +-    rc =3D protect_dir(dir, mode, 1, idata);
> ++    rc =3D secure_opendir(dir,
> ++            SECURE_OPENDIR_PROTECT | SECURE_OPENDIR_MKDIR | SECURE_OPEN=
DIR_FULL_FD,
> ++            mode, idata);
> +     if (rc =3D=3D -1) {
> +             pam_syslog(idata->pamh, LOG_ERR,
> +                        "Error creating directory %s: %m", dir);
> + #ifdef WITH_SELINUX
> +             freecon(oldcon_raw);
> + #endif
> +-            return PAM_SESSION_ERR;
> ++            return -1;
> +     }
> +
> + #ifdef WITH_SELINUX
> +@@ -1477,9 +1632,9 @@ static int create_polydir(struct polydir_s *polypt=
r,
> +               pam_syslog(idata->pamh, LOG_ERR,
> +                          "Error changing mode of directory %s: %m", dir=
);
> +                 close(rc);
> +-                umount(dir); /* undo the eventual protection bind mount=
 */
> +-              rmdir(dir);
> +-              return PAM_SESSION_ERR;
> ++              secure_umount(dir); /* undo the eventual protection bind =
mount */
> ++              secure_try_rmdir(dir);
> ++              return -1;
> +       }
> +     }
> +
> +@@ -1497,41 +1652,37 @@ static int create_polydir(struct polydir_s *poly=
ptr,
> +         pam_syslog(idata->pamh, LOG_ERR,
> +                    "Unable to change owner on directory %s: %m", dir);
> +         close(rc);
> +-        umount(dir); /* undo the eventual protection bind mount */
> +-      rmdir(dir);
> +-      return PAM_SESSION_ERR;
> ++      secure_umount(dir); /* undo the eventual protection bind mount */
> ++      secure_try_rmdir(dir);
> ++      return -1;
> +     }
> +
> +-    close(rc);
> +-
> +     if (idata->flags & PAMNS_DEBUG)
> +       pam_syslog(idata->pamh, LOG_DEBUG,
> +                  "Polydir owner %u group %u", uid, gid);
> +
> +-    return PAM_SUCCESS;
> ++    return rc;
> + }
> +
> + /*
> +- * Create polyinstantiated instance directory (ipath).
> ++ * Create polyinstantiated instance directory.
> ++ * To protect against races, changes are done on a fd to the parent of =
the
> ++ * instance directory (dfd_iparent) and a relative path (polyptr->instn=
ame).
> ++ * The absolute path (polyptr->instance_absolute) is only updated when =
creating
> ++ * a tmpdir and used for logging purposes.
> +  */
> + #ifdef WITH_SELINUX
> +-static int create_instance(struct polydir_s *polyptr, char *ipath, stru=
ct stat *statbuf,
> +-        const char *icontext, const char *ocontext,
> +-      struct instance_data *idata)
> ++static int create_instance(struct polydir_s *polyptr, int dfd_iparent,
> ++        struct stat *statbuf, const char *icontext, const char *ocontex=
t,
> ++        struct instance_data *idata)
> + #else
> +-static int create_instance(struct polydir_s *polyptr, char *ipath, stru=
ct stat *statbuf,
> +-      struct instance_data *idata)
> ++static int create_instance(struct polydir_s *polyptr, int dfd_iparent,
> ++        struct stat *statbuf, struct instance_data *idata)
> + #endif
> + {
> +     struct stat newstatbuf;
> +     int fd;
> +
> +-    /*
> +-     * Check to make sure instance parent is valid.
> +-     */
> +-    if (check_inst_parent(ipath, idata))
> +-      return PAM_SESSION_ERR;
> +-
> +     /*
> +      * Create instance directory and set its security context to the co=
ntext
> +      * returned by the security policy. Set its mode and ownership
> +@@ -1540,29 +1691,39 @@ static int create_instance(struct polydir_s *pol=
yptr, char *ipath, struct stat *
> +      */
> +
> +     if (polyptr->method =3D=3D TMPDIR) {
> +-      if (mkdtemp(polyptr->instance_prefix) =3D=3D NULL) {
> +-            pam_syslog(idata->pamh, LOG_ERR, "Error creating temporary =
instance %s, %m",
> +-                      polyptr->instance_prefix);
> +-          polyptr->method =3D NONE; /* do not clean up! */
> +-          return PAM_SESSION_ERR;
> +-      }
> +-      /* copy the actual directory name to ipath */
> +-      strcpy(ipath, polyptr->instance_prefix);
> +-    } else if (mkdir(ipath, S_IRUSR) < 0) {
> ++        char s_path[PATH_MAX];
> ++        /*
> ++         * Create the template for mkdtemp() as a magic link based on
> ++         * our existing fd to avoid symlink attacks and races.
> ++         */
> ++        if (pam_sprintf(s_path, "/proc/self/fd/%d/%s", dfd_iparent, pol=
yptr->instname) < 0
> ++            || mkdtemp(s_path) =3D=3D NULL) {
> ++            pam_syslog(idata->pamh, LOG_ERR,
> ++                       "Error creating temporary instance dir %s, %m",
> ++                       polyptr->instance_absolute);
> ++            polyptr->method =3D NONE; /* do not clean up! */
> ++            return PAM_SESSION_ERR;
> ++        }
> ++
> ++        /* Copy the actual directory name to polyptr->instname */
> ++        strcpy(polyptr->instname, base_name(s_path));
> ++    } else if (mkdirat(dfd_iparent, polyptr->instname, S_IRUSR) < 0) {
> +         if (errno =3D=3D EEXIST)
> +             return PAM_IGNORE;
> +         else {
> +             pam_syslog(idata->pamh, LOG_ERR, "Error creating %s, %m",
> +-                      ipath);
> ++                       polyptr->instance_absolute);
> +             return PAM_SESSION_ERR;
> +         }
> +     }
> +
> +-    /* Open a descriptor to it to prevent races */
> +-    fd =3D open(ipath, O_DIRECTORY | O_RDONLY);
> ++    /* Open a descriptor to prevent races, based on our existing fd. */
> ++    fd =3D openat(dfd_iparent, polyptr->instname,
> ++            O_RDONLY | O_DIRECTORY | O_NOFOLLOW | O_CLOEXEC);
> +     if (fd < 0) {
> +-      pam_syslog(idata->pamh, LOG_ERR, "Error opening %s, %m", ipath);
> +-      rmdir(ipath);
> ++      pam_syslog(idata->pamh, LOG_ERR, "Error opening %s, %m",
> ++                polyptr->instance_absolute);
> ++      unlinkat(dfd_iparent, polyptr->instname, AT_REMOVEDIR);
> +       return PAM_SESSION_ERR;
> +     }
> + #ifdef WITH_SELINUX
> +@@ -1572,17 +1733,19 @@ static int create_instance(struct polydir_s *pol=
yptr, char *ipath, struct stat *
> +         if (icontext) {
> +             if (fsetfilecon(fd, icontext) < 0) {
> +                 pam_syslog(idata->pamh, LOG_ERR,
> +-                      "Error setting context of %s to %s", ipath, icont=
ext);
> ++                      "Error setting context of %s to %s",
> ++                        polyptr->instance_absolute, icontext);
> +                 close(fd);
> +-              rmdir(ipath);
> ++                unlinkat(dfd_iparent, polyptr->instname, AT_REMOVEDIR);
> +                 return PAM_SESSION_ERR;
> +             }
> +         } else {
> +             if (fsetfilecon(fd, ocontext) < 0) {
> +                 pam_syslog(idata->pamh, LOG_ERR,
> +-                      "Error setting context of %s to %s", ipath, ocont=
ext);
> ++                      "Error setting context of %s to %s",
> ++                        polyptr->instance_absolute, ocontext);
> +               close(fd);
> +-              rmdir(ipath);
> ++                unlinkat(dfd_iparent, polyptr->instname, AT_REMOVEDIR);
> +                 return PAM_SESSION_ERR;
> +             }
> +         }
> +@@ -1590,9 +1753,9 @@ static int create_instance(struct polydir_s *polyp=
tr, char *ipath, struct stat *
> + #endif
> +     if (fstat(fd, &newstatbuf) < 0) {
> +         pam_syslog(idata->pamh, LOG_ERR, "Error stating %s, %m",
> +-              ipath);
> ++              polyptr->instance_absolute);
> +       close(fd);
> +-      rmdir(ipath);
> ++        unlinkat(dfd_iparent, polyptr->instname, AT_REMOVEDIR);
> +         return PAM_SESSION_ERR;
> +     }
> +     if (newstatbuf.st_uid !=3D statbuf->st_uid ||
> +@@ -1600,17 +1763,17 @@ static int create_instance(struct polydir_s *pol=
yptr, char *ipath, struct stat *
> +         if (fchown(fd, statbuf->st_uid, statbuf->st_gid) < 0) {
> +             pam_syslog(idata->pamh, LOG_ERR,
> +                       "Error changing owner for %s, %m",
> +-                      ipath);
> ++                      polyptr->instance_absolute);
> +           close(fd);
> +-          rmdir(ipath);
> ++            unlinkat(dfd_iparent, polyptr->instname, AT_REMOVEDIR);
> +             return PAM_SESSION_ERR;
> +         }
> +     }
> +     if (fchmod(fd, statbuf->st_mode & 07777) < 0) {
> +         pam_syslog(idata->pamh, LOG_ERR, "Error changing mode for %s, %=
m",
> +-                      ipath);
> ++                      polyptr->instance_absolute);
> +       close(fd);
> +-      rmdir(ipath);
> ++        unlinkat(dfd_iparent, polyptr->instname, AT_REMOVEDIR);
> +         return PAM_SESSION_ERR;
> +     }
> +     close(fd);
> +@@ -1629,9 +1792,12 @@ static int ns_setup(struct polydir_s *polyptr,
> +       struct instance_data *idata)
> + {
> +     int retval;
> ++    int dfd_iparent =3D -1;
> ++    int dfd_ipath =3D -1;
> ++    int dfd_pptrdir =3D -1;
> +     int newdir =3D 1;
> +-    char *inst_dir =3D NULL;
> +-    char *instname =3D NULL;
> ++    char s_ipath[MAGIC_LNK_FD_SIZE];
> ++    char s_pptrdir[MAGIC_LNK_FD_SIZE];
> +     struct stat statbuf;
> + #ifdef WITH_SELINUX
> +     char *instcontext =3D NULL, *origcontext =3D NULL;
> +@@ -1641,37 +1807,48 @@ static int ns_setup(struct polydir_s *polyptr,
> +         pam_syslog(idata->pamh, LOG_DEBUG,
> +                "Set namespace for directory %s", polyptr->dir);
> +
> +-    retval =3D protect_dir(polyptr->dir, 0, 0, idata);
> ++    dfd_pptrdir =3D secure_opendir(polyptr->dir, SECURE_OPENDIR_PROTECT=
, 0, idata);
> +
> +-    if (retval < 0) {
> ++    if (dfd_pptrdir < 0) {
> +         if (errno !=3D ENOENT || !(polyptr->flags & POLYDIR_CREATE)) {
> +             pam_syslog(idata->pamh, LOG_ERR, "Polydir %s access error: =
%m",
> +                     polyptr->dir);
> +             return PAM_SESSION_ERR;
> +         }
> +-        if (create_polydir(polyptr, idata) !=3D PAM_SUCCESS)
> ++        dfd_pptrdir =3D create_polydir(polyptr, idata);
> ++        if (dfd_pptrdir < 0)
> +             return PAM_SESSION_ERR;
> +-    } else {
> +-      close(retval);
> +     }
> +
> +     if (polyptr->method =3D=3D TMPFS) {
> +-      if (mount("tmpfs", polyptr->dir, "tmpfs", polyptr->mount_flags, p=
olyptr->mount_opts) < 0) {
> +-          pam_syslog(idata->pamh, LOG_ERR, "Error mounting tmpfs on %s,=
 %m",
> +-              polyptr->dir);
> +-            return PAM_SESSION_ERR;
> +-      }
> ++        /*
> ++         * There is no function mount() that operate on a fd, so instea=
d, we
> ++         * get the magic link corresponding to the fd and give it to mo=
unt().
> ++         * This protects against potential races exploitable by an unpr=
iv user.
> ++         */
> ++        if (pam_sprintf(s_pptrdir, "/proc/self/fd/%d", dfd_pptrdir) < 0=
) {
> ++            pam_syslog(idata->pamh, LOG_ERR, "Error pam_sprintf s_pptrd=
ir");
> ++            goto error_out;
> ++        }
> +
> +-      if (polyptr->flags & POLYDIR_NOINIT)
> +-          return PAM_SUCCESS;
> ++        if (mount("tmpfs", s_pptrdir, "tmpfs", polyptr->mount_flags, po=
lyptr->mount_opts) < 0) {
> ++            pam_syslog(idata->pamh, LOG_ERR, "Error mounting tmpfs on %=
s, %m",
> ++                       polyptr->dir);
> ++            goto error_out;
> ++        }
> ++
> ++        if (polyptr->flags & POLYDIR_NOINIT) {
> ++            retval =3D PAM_SUCCESS;
> ++            goto cleanup;
> ++        }
> +
> +-      return inst_init(polyptr, "tmpfs", idata, 1);
> ++        retval =3D inst_init(polyptr, "tmpfs", idata, 1);
> ++        goto cleanup;
> +     }
> +
> +-    if (stat(polyptr->dir, &statbuf) < 0) {
> +-      pam_syslog(idata->pamh, LOG_ERR, "Error stating %s: %m",
> +-              polyptr->dir);
> +-        return PAM_SESSION_ERR;
> ++    if (fstat(dfd_pptrdir, &statbuf) < 0) {
> ++        pam_syslog(idata->pamh, LOG_ERR, "Error stating %s: %m", polypt=
r->dir);
> ++        goto error_out;
> +     }
> +
> +     /*
> +@@ -1680,15 +1857,16 @@ static int ns_setup(struct polydir_s *polyptr,
> +      * security policy.
> +      */
> + #ifdef WITH_SELINUX
> +-    retval =3D poly_name(polyptr, &instname, &instcontext,
> +-                      &origcontext, idata);
> ++    retval =3D poly_name(polyptr, &instcontext, &origcontext, idata);
> + #else
> +-    retval =3D poly_name(polyptr, &instname, idata);
> ++    retval =3D poly_name(polyptr, idata);
> + #endif
> +
> +     if (retval !=3D PAM_SUCCESS) {
> +-      if (retval !=3D PAM_IGNORE)
> ++      if (retval !=3D PAM_IGNORE) {
> +               pam_syslog(idata->pamh, LOG_ERR, "Error getting instance =
name");
> ++                goto error_out;
> ++        }
> +         goto cleanup;
> +     } else {
> + #ifdef WITH_SELINUX
> +@@ -1699,22 +1877,33 @@ static int ns_setup(struct polydir_s *polyptr,
> + #endif
> +     }
> +
> +-    if ((inst_dir =3D pam_asprintf("%s%s", polyptr->instance_prefix, in=
stname)) =3D=3D NULL)
> +-      goto error_out;
> +-
> +-    if (idata->flags & PAMNS_DEBUG)
> +-        pam_syslog(idata->pamh, LOG_DEBUG, "instance_dir %s",
> +-              inst_dir);
> ++    /*
> ++     * Gets a fd in a secure manner (we may be operating on a path unde=
r
> ++     * user control), and check it's compliant.
> ++     * Then, we should *always* operate on *this* fd and a relative pat=
h
> ++     * to be protected against race conditions.
> ++     */
> ++    dfd_iparent =3D secure_opendir(polyptr->instance_parent,
> ++            SECURE_OPENDIR_PROTECT | SECURE_OPENDIR_MKDIR, 0, idata);
> ++    if (dfd_iparent =3D=3D -1) {
> ++      pam_syslog(idata->pamh, LOG_ERR,
> ++                "polyptr->instance_parent %s access error",
> ++                polyptr->instance_parent);
> ++        goto error_out;
> ++    }
> ++    if (check_inst_parent(dfd_iparent, idata)) {
> ++        goto error_out;
> ++    }
> +
> +     /*
> +      * Create instance directory with appropriate security
> +      * contexts, owner, group and mode bits.
> +      */
> + #ifdef WITH_SELINUX
> +-    retval =3D create_instance(polyptr, inst_dir, &statbuf, instcontext=
,
> +-                       origcontext, idata);
> ++    retval =3D create_instance(polyptr, dfd_iparent, &statbuf, instcont=
ext,
> ++                             origcontext, idata);
> + #else
> +-    retval =3D create_instance(polyptr, inst_dir, &statbuf, idata);
> ++    retval =3D create_instance(polyptr, dfd_iparent, &statbuf, idata);
> + #endif
> +
> +     if (retval =3D=3D PAM_IGNORE) {
> +@@ -1726,19 +1915,48 @@ static int ns_setup(struct polydir_s *polyptr,
> +         goto error_out;
> +     }
> +
> ++    /*
> ++     * Instead of getting a new secure fd, we reuse the fd opened on di=
rectory
> ++     * polyptr->instance_parent to ensure we are working on the same di=
r as
> ++     * previously, and thus ensure that previous checks (e.g. check_ins=
t_parent())
> ++     * are still relevant.
> ++     */
> ++    dfd_ipath =3D openat(dfd_iparent, polyptr->instname,
> ++            O_PATH | O_DIRECTORY | O_NOFOLLOW | O_CLOEXEC);
> ++    if (dfd_ipath =3D=3D -1) {
> ++        pam_syslog(idata->pamh, LOG_ERR, "Error openat on %s, %m",
> ++                polyptr->instname);
> ++        goto error_out;
> ++    }
> ++
> ++    if (pam_sprintf(s_ipath, "/proc/self/fd/%d", dfd_ipath) < 0) {
> ++        pam_syslog(idata->pamh, LOG_ERR, "Error pam_sprintf s_ipath");
> ++        goto error_out;
> ++    }
> ++
> ++    if (pam_sprintf(s_pptrdir, "/proc/self/fd/%d", dfd_pptrdir) < 0) {
> ++        pam_syslog(idata->pamh, LOG_ERR, "Error pam_sprintf s_pptrdir")=
;
> ++        goto error_out;
> ++    }
> ++
> +     /*
> +      * Bind mount instance directory on top of the polyinstantiated
> +      * directory to provide an instance of polyinstantiated directory
> +      * based on polyinstantiated method.
> ++     *
> ++     * Operates on magic links created from two fd obtained securely
> ++     * to protect against race conditions and symlink attacks. Indeed,
> ++     * the source and destination can be in a user controled path.
> +      */
> +-    if (mount(inst_dir, polyptr->dir, NULL, MS_BIND, NULL) < 0) {
> +-        pam_syslog(idata->pamh, LOG_ERR, "Error mounting %s on %s, %m",
> +-                   inst_dir, polyptr->dir);
> ++    if(mount(s_ipath, s_pptrdir, NULL, MS_BIND, NULL) < 0) {
> ++        pam_syslog(idata->pamh, LOG_ERR,
> ++                "Error mounting %s on %s (%s on %s), %m",
> ++                   s_ipath, s_pptrdir, polyptr->instance_absolute, poly=
ptr->dir);
> +         goto error_out;
> +     }
> +
> +     if (!(polyptr->flags & POLYDIR_NOINIT))
> +-      retval =3D inst_init(polyptr, inst_dir, idata, newdir);
> ++      retval =3D inst_init(polyptr, polyptr->instance_absolute, idata, =
newdir);
> +
> +     goto cleanup;
> +
> +@@ -1750,8 +1968,12 @@ error_out:
> +     retval =3D PAM_SESSION_ERR;
> +
> + cleanup:
> +-    free(inst_dir);
> +-    free(instname);
> ++    if (dfd_iparent !=3D -1)
> ++        close(dfd_iparent);
> ++    if (dfd_ipath !=3D -1)
> ++        close(dfd_ipath);
> ++    if (dfd_pptrdir !=3D -1)
> ++        close(dfd_pptrdir);
> + #ifdef WITH_SELINUX
> +     freecon(instcontext);
> +     freecon(origcontext);
> +@@ -1790,6 +2012,7 @@ static int cleanup_tmpdirs(struct instance_data *i=
data)
> + {
> +     struct polydir_s *pptr;
> +     pid_t rc, pid;
> ++    int dfd =3D -1;
> +     struct sigaction newsa, oldsa;
> +     int status;
> +
> +@@ -1801,7 +2024,17 @@ static int cleanup_tmpdirs(struct instance_data *=
idata)
> +     }
> +
> +     for (pptr =3D idata->polydirs_ptr; pptr; pptr =3D pptr->next) {
> +-      if (pptr->method =3D=3D TMPDIR && access(pptr->instance_prefix, F=
_OK) =3D=3D 0) {
> ++      if (pptr->method =3D=3D TMPDIR) {
> ++
> ++            dfd =3D secure_opendir_stateless(pptr->instance_parent);
> ++            if (dfd =3D=3D -1)
> ++                continue;
> ++
> ++            if (faccessat(dfd, pptr->instname, F_OK, AT_SYMLINK_NOFOLLO=
W) !=3D 0) {
> ++                close(dfd);
> ++                continue;
> ++            }
> ++
> +           pid =3D fork();
> +           if (pid =3D=3D 0) {
> +               static char *envp[] =3D { NULL };
> +@@ -1811,10 +2044,21 @@ static int cleanup_tmpdirs(struct instance_data =
*idata)
> +                       _exit(1);
> +               }
> + #endif
> ++                if (fchdir(dfd) =3D=3D -1) {
> ++                    pam_syslog(idata->pamh, LOG_ERR, "Failed fchdir to =
%s: %m",
> ++                            pptr->instance_absolute);
> ++                    _exit(1);
> ++                }
> ++
> +               close_fds_pre_exec(idata);
> +-              execle("/bin/rm", "/bin/rm", "-rf", pptr->instance_prefix=
, NULL, envp);
> ++
> ++              execle("/bin/rm", "/bin/rm", "-rf", pptr->instname, NULL,=
 envp);
> +               _exit(1);
> +           } else if (pid > 0) {
> ++
> ++                if (dfd !=3D -1)
> ++                    close(dfd);
> ++
> +               while (((rc =3D waitpid(pid, &status, 0)) =3D=3D (pid_t)-=
1) &&
> +                   (errno =3D=3D EINTR));
> +               if (rc =3D=3D (pid_t)-1) {
> +@@ -1827,6 +2071,10 @@ static int cleanup_tmpdirs(struct instance_data *=
idata)
> +                       "Error removing %s", pptr->instance_prefix);
> +               }
> +           } else if (pid < 0) {
> ++
> ++                if (dfd !=3D -1)
> ++                    close(dfd);
> ++
> +               pam_syslog(idata->pamh, LOG_ERR,
> +                       "Cannot fork to cleanup temporary directory, %m")=
;
> +               rc =3D PAM_SESSION_ERR;
> +@@ -1850,6 +2098,7 @@ out:
> + static int setup_namespace(struct instance_data *idata, enum unmnt_op u=
nmnt)
> + {
> +     int retval =3D 0, need_poly =3D 0, changing_dir =3D 0;
> ++    int dfd =3D -1;
> +     char *cptr, *fptr, poly_parent[PATH_MAX];
> +     struct polydir_s *pptr;
> +
> +@@ -1965,13 +2214,21 @@ static int setup_namespace(struct instance_data =
*idata, enum unmnt_op unmnt)
> +                       strcpy(poly_parent, "/");
> +                   else if (cptr)
> +                       *cptr =3D '\0';
> +-                    if (chdir(poly_parent) < 0) {
> ++
> ++                    dfd =3D secure_opendir_stateless(poly_parent);
> ++                    if (dfd =3D=3D -1) {
> ++                        pam_syslog(idata->pamh, LOG_ERR,
> ++                            "Failed opening %s to fchdir: %m", poly_par=
ent);
> ++                    }
> ++                    else if (fchdir(dfd) =3D=3D -1) {
> +                         pam_syslog(idata->pamh, LOG_ERR,
> +-                              "Can't chdir to %s, %m", poly_parent);
> ++                            "Failed fchdir to %s: %m", poly_parent);
> +                     }
> ++                    if (dfd !=3D -1)
> ++                        close(dfd);
> +                 }
> +
> +-                if (umount(pptr->rdir) < 0) {
> ++            if (secure_umount(pptr->rdir) < 0) {
> +                   int saved_errno =3D errno;
> +                   pam_syslog(idata->pamh, LOG_ERR, "Unmount of %s faile=
d, %m",
> +                       pptr->rdir);
> +@@ -2041,7 +2298,7 @@ static int orig_namespace(struct instance_data *id=
ata)
> +                       "Unmounting instance dir for user %d & dir %s",
> +                        idata->uid, pptr->dir);
> +
> +-            if (umount(pptr->dir) < 0) {
> ++            if (secure_umount(pptr->dir) < 0) {
> +                 pam_syslog(idata->pamh, LOG_ERR, "Unmount of %s failed,=
 %m",
> +                        pptr->dir);
> +                 return PAM_SESSION_ERR;
> +diff --git a/modules/pam_namespace/pam_namespace.h b/modules/pam_namespa=
ce/pam_namespace.h
> +index 180e042..721d39a 100644
> +--- a/modules/pam_namespace/pam_namespace.h
> ++++ b/modules/pam_namespace/pam_namespace.h
> +@@ -121,6 +121,13 @@
> + #define NAMESPACE_POLYDIR_DATA "pam_namespace:polydir_data"
> + #define NAMESPACE_PROTECT_DATA "pam_namespace:protect_data"
> +
> ++/*
> ++ * Operation mode for function secure_opendir()
> ++ */
> ++#define SECURE_OPENDIR_PROTECT     0x00000001
> ++#define SECURE_OPENDIR_MKDIR       0x00000002
> ++#define SECURE_OPENDIR_FULL_FD     0x00000004
> ++
> + /*
> +  * Polyinstantiation method options, based on user, security context
> +  * or both
> +@@ -158,6 +165,9 @@ struct polydir_s {
> +     char dir[PATH_MAX];               /* directory to polyinstantiate *=
/
> +     char rdir[PATH_MAX];              /* directory to unmount (based on=
 RUSER) */
> +     char instance_prefix[PATH_MAX];   /* prefix for instance dir path n=
ame */
> ++    char instance_absolute[PATH_MAX]; /* absolute path to the instance =
dir (instance_parent + instname) */
> ++    char instance_parent[PATH_MAX];   /* parent dir of the instance dir=
 */
> ++    char *instname;                   /* last segment of the path to th=
e instance dir */
> +     enum polymethod method;           /* method used to polyinstantiate=
 */
> +     unsigned int num_uids;            /* number of override uids */
> +     uid_t *uid;                               /* list of override uids =
*/
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-extended/pam/libpam/CVE-2025-6020-02.patch b/me=
ta/recipes-extended/pam/libpam/CVE-2025-6020-02.patch
> new file mode 100644
> index 0000000000..18c2a82fb4
> --- /dev/null
> +++ b/meta/recipes-extended/pam/libpam/CVE-2025-6020-02.patch
> @@ -0,0 +1,187 @@
> +From 592d84e1265d04c3104acee815a503856db503a1 Mon Sep 17 00:00:00 2001
> +From: Olivier Bal-Petre <olivier.bal-petre@ssi.gouv.fr>
> +Date: Tue, 4 Mar 2025 14:37:02 +0100
> +Subject: [PATCH] pam_namespace: add flags to indicate path safety
> +
> +Add two flags in the script to indicate if the paths to the polydir
> +and the instance directories are safe (root owned and writable by
> +root only).
> +
> +Signed-off-by: Olivier Bal-Petre <olivier.bal-petre@ssi.gouv.fr>
> +Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> +
> +Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit=
/592d84e1265d04c3104acee815a503856db503a1]
> +CVE: CVE-2025-6020
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + modules/pam_namespace/namespace.init  | 56 ++++++++++++-------
> + modules/pam_namespace/pam_namespace.c | 79 ++++++++++++++++++++++++++-
> + 2 files changed, 115 insertions(+), 20 deletions(-)
> +
> +diff --git a/modules/pam_namespace/namespace.init b/modules/pam_namespac=
e/namespace.init
> +index d9053a1..8782178 100755
> +--- a/modules/pam_namespace/namespace.init
> ++++ b/modules/pam_namespace/namespace.init
> +@@ -1,25 +1,43 @@
> + #!/bin/sh
> +-# It receives polydir path as $1, the instance path as $2,
> +-# a flag whether the instance dir was newly created (0 - no, 1 - yes) i=
n $3,
> +-# and user name in $4.
> ++# It receives as arguments:
> ++# - $1 polydir path (see WARNING below)
> ++# - $2 instance path (see WARNING below)
> ++# - $3 flag whether the instance dir was newly created (0 - no, 1 - yes=
)
> ++# - $4 user name
> ++# - $5 flag whether the polydir path ($1) is safe (0 - unsafe, 1 -safe)
> ++# - $6 flag whether the instance path ($2) is safe (0 - unsafe, 1 - saf=
e)
> ++#
> ++# WARNING: This script is invoked with full root privileges. Accessing
> ++# the polydir ($1) and the instance ($2) directories in this context ma=
y be
> ++# extremely dangerous as those can be under user control. The flags $5 =
and $6
> ++# are provided to let you know if all the segments part of the path (ex=
cept the
> ++# last one) are owned by root and are writable by root only. If the pat=
h does
> ++# not meet these criteria, you expose yourself to possible symlink atta=
cks when
> ++# accessing these path.
> ++# However, even if the path components are safe, the content of the
> ++# directories may still be owned/writable by a user, so care must be ta=
ken!
> + #
> + # The following section will copy the contents of /etc/skel if this is =
a
> + # newly created home directory.
> +-if [ "$3" =3D 1 ]; then
> +-        # This line will fix the labeling on all newly created director=
ies
> +-        [ -x /sbin/restorecon ] && /sbin/restorecon "$1"
> +-        user=3D"$4"
> +-        passwd=3D$(getent passwd "$user")
> +-        homedir=3D$(echo "$passwd" | cut -f6 -d":")
> +-        if [ "$1" =3D "$homedir" ]; then
> +-                gid=3D$(echo "$passwd" | cut -f4 -d":")
> +-                cp -rT /etc/skel "$homedir"
> +-                chown -R "$user":"$gid" "$homedir"
> +-                mask=3D$(awk '/^UMASK/{gsub("#.*$", "", $2); print $2; =
exit}' /etc/login.defs)
> +-                mode=3D$(printf "%o" $((0777 & ~mask)))
> +-                chmod ${mode:-700} "$homedir"
> +-                [ -x /sbin/restorecon ] && /sbin/restorecon -R "$homedi=
r"
> +-        fi
> +-fi
> +
> ++# Executes only if the polydir path is safe
> ++if [ "$5" =3D 1 ]; then
> ++
> ++    if [ "$3" =3D 1 ]; then
> ++            # This line will fix the labeling on all newly created dire=
ctories
> ++            [ -x /sbin/restorecon ] && /sbin/restorecon "$1"
> ++            user=3D"$4"
> ++            passwd=3D$(getent passwd "$user")
> ++            homedir=3D$(echo "$passwd" | cut -f6 -d":")
> ++            if [ "$1" =3D "$homedir" ]; then
> ++                    gid=3D$(echo "$passwd" | cut -f4 -d":")
> ++                    cp -rT /etc/skel "$homedir"
> ++                    chown -R "$user":"$gid" "$homedir"
> ++                    mask=3D$(sed -E -n 's/^UMASK[[:space:]]+([^#[:space=
:]]+).*/\1/p' /etc/login.defs)
> ++                    mode=3D$(printf "%o" $((0777 & ~mask)))
> ++                    chmod ${mode:-700} "$homedir"
> ++                    [ -x /sbin/restorecon ] && /sbin/restorecon -R "$ho=
medir"
> ++            fi
> ++    fi
> ++fi
> + exit 0
> +diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_namespa=
ce/pam_namespace.c
> +index 9d993d4..4c8153b 100644
> +--- a/modules/pam_namespace/pam_namespace.c
> ++++ b/modules/pam_namespace/pam_namespace.c
> +@@ -1467,6 +1467,79 @@ static int check_inst_parent(int dfd, struct inst=
ance_data *idata)
> +       return PAM_SUCCESS;
> + }
> +
> ++/*
> ++ * Check for a given absolute path that all segments except the last on=
e are:
> ++ * 1. a directory owned by root and not writable by group or others
> ++ * 2. a symlink owned by root and referencing a directory respecting 1.
> ++ * Returns 0 if safe, -1 is unsafe.
> ++ * If the path is not accessible (does not exist, hidden under a mount.=
..),
> ++ * returns -1 (unsafe).
> ++ */
> ++static int check_safe_path(const char *path, struct instance_data *idat=
a)
> ++{
> ++    char *p =3D strdup(path);
> ++    char *d;
> ++    char *dir =3D p;
> ++    struct stat st;
> ++
> ++    if (p =3D=3D NULL)
> ++        return -1;
> ++
> ++    /* Check path is absolute */
> ++    if (p[0] !=3D '/')
> ++        goto error;
> ++
> ++    strip_trailing_slashes(p);
> ++
> ++    /* Last segment of the path may be owned by the user */
> ++    if ((d =3D strrchr(dir, '/')) !=3D NULL)
> ++        *d =3D '\0';
> ++
> ++    while ((d=3Dstrrchr(dir, '/')) !=3D NULL) {
> ++
> ++        /* Do not follow symlinks */
> ++        if (lstat(dir, &st) !=3D 0)
> ++            goto error;
> ++
> ++        if (S_ISLNK(st.st_mode)) {
> ++            if (st.st_uid !=3D 0) {
> ++                if (idata->flags & PAMNS_DEBUG)
> ++                    pam_syslog(idata->pamh, LOG_DEBUG,
> ++                            "Path deemed unsafe: Symlink %s should be o=
wned by root", dir);
> ++                goto error;
> ++            }
> ++
> ++            /* Follow symlinks */
> ++            if (stat(dir, &st) !=3D 0)
> ++                goto error;
> ++        }
> ++
> ++        if (!S_ISDIR(st.st_mode)) {
> ++                if (idata->flags & PAMNS_DEBUG)
> ++                    pam_syslog(idata->pamh, LOG_DEBUG,
> ++                        "Path deemed unsafe: %s is expected to be a dir=
ectory", dir);
> ++            goto error;
> ++        }
> ++
> ++        if (st.st_uid !=3D 0 ||
> ++            ((st.st_mode & (S_IWGRP|S_IWOTH)) && !(st.st_mode & S_ISVTX=
))) {
> ++                if (idata->flags & PAMNS_DEBUG)
> ++                    pam_syslog(idata->pamh, LOG_DEBUG,
> ++                        "Path deemed unsafe: %s should be owned by root=
, and not be writable by group or others", dir);
> ++            goto error;
> ++        }
> ++
> ++        *d =3D '\0';
> ++    }
> ++
> ++    free(p);
> ++    return 0;
> ++
> ++error:
> ++    free(p);
> ++    return -1;
> ++}
> ++
> + /*
> + * Check to see if there is a namespace initialization script in
> + * the /etc/security directory. If such a script exists
> +@@ -1524,7 +1597,11 @@ static int inst_init(const struct polydir_s *poly=
ptr, const char *ipath,
> +                               close_fds_pre_exec(idata);
> +
> +                               execle(init_script, init_script,
> +-                                      polyptr->dir, ipath, newdir?"1":"=
0", idata->user, NULL, envp);
> ++                                      polyptr->dir, ipath,
> ++                                      newdir ? "1":"0", idata->user,
> ++                                      (check_safe_path(polyptr->dir, id=
ata) =3D=3D -1) ? "0":"1",
> ++                                      (check_safe_path(ipath, idata) =
=3D=3D -1) ? "0":"1",
> ++                                      NULL, envp);
> +                                       _exit(1);
> +                       } else if (pid > 0) {
> +                               while (((rc =3D waitpid(pid, &status, 0))=
 =3D=3D (pid_t)-1) &&
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-extended/pam/libpam/CVE-2025-6020-03.patch b/me=
ta/recipes-extended/pam/libpam/CVE-2025-6020-03.patch
> new file mode 100644
> index 0000000000..238bef47ec
> --- /dev/null
> +++ b/meta/recipes-extended/pam/libpam/CVE-2025-6020-03.patch
> @@ -0,0 +1,35 @@
> +From 976c20079358d133514568fc7fd95c02df8b5773 Mon Sep 17 00:00:00 2001
> +From: "Dmitry V. Levin" <ldv@strace.io>
> +Date: Tue, 27 May 2025 08:00:00 +0000
> +Subject: [PATCH] pam_namespace: secure_opendir: do not look at the group
> + ownership
> +
> +When the directory is not group-writable, the group ownership does
> +not matter, and when it is group-writable, there should not be any
> +exceptions for the root group as there is no guarantee that the root
> +group does not include non-root users.
> +
> +Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit=
/976c20079358d133514568fc7fd95c02df8b5773]
> +CVE: CVE-2025-6020
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + modules/pam_namespace/pam_namespace.c | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_namespa=
ce/pam_namespace.c
> +index 4c8153b..791dd07 100644
> +--- a/modules/pam_namespace/pam_namespace.c
> ++++ b/modules/pam_namespace/pam_namespace.c
> +@@ -215,8 +215,7 @@ static int secure_opendir(const char *path, int opm,=
 mode_t mode,
> +                       if (dfd_next =3D=3D -1)
> +                               goto error;
> +               } else if (st.st_uid !=3D 0
> +-                         || (st.st_gid !=3D 0 && (st.st_mode & S_IWGRP)=
)
> +-                         || (st.st_mode & S_IWOTH)) {
> ++                         || (st.st_mode & (S_IWGRP|S_IWOTH))) {
> +                       /* do not follow symlinks on subdirectories */
> +                       flags |=3D O_NOFOLLOW;
> +               }
> +--
> +2.49.0
> +
> diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-ext=
ended/pam/libpam_1.5.3.bb
> index 714cdb6552..815085cc82 100644
> --- a/meta/recipes-extended/pam/libpam_1.5.3.bb
> +++ b/meta/recipes-extended/pam/libpam_1.5.3.bb
> @@ -29,6 +29,11 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/Linux-=
PAM-${PV}.tar.xz \
>             file://CVE-2024-22365.patch \
>             file://CVE-2024-10041-1.patch \
>             file://CVE-2024-10041-2.patch \
> +           file://0001-pam-inline-pam-asprintf.patch \
> +           file://0002-pam-namespace-rebase.patch \
> +           file://CVE-2025-6020-01.patch \
> +           file://CVE-2025-6020-02.patch \
> +           file://CVE-2025-6020-03.patch \
>             "
>
>  SRC_URI[sha256sum] =3D "7ac4b50feee004a9fa88f1dfd2d2fa738a82896763050cd7=
73b3c54b0a818283"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220925): https://lists.openembedded.org/g/openembedde=
d-core/message/220925
> Mute This Topic: https://lists.openembedded.org/mt/114342651/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

