Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE56C83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 21:07:31 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.1421.1753304842397593574
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 14:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=L9RWw9Jn;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.170, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e8d707b9bc2so243478276.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 14:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753304841; x=1753909641; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjeuNz6Xaecx8WkUhJDHPgpmB8WtK3UxxSXjA/OkWUQ=;
        b=L9RWw9JnE6Slg9yHlWzPHuFZGWEGB2l6788I0/Ya3HF6iMAaZ6xkAyEjBnYcGV8Pbb
         qQbvb1ZfDXU4Sp71Tp+brA248Z9OIZFv5dviZ0D3NDzpONsvJPboOgHLy1H+IeI+wrgn
         G4oViu6SDRfbhbGhhKxSfFVTgsCQ8bjjffuDdwSsbW85WbG2044jvR3ly0JP96enXuHt
         oGapFTHA6ibnP8KXMaAMlUSHiM4pQ4VQnHxzv68Rtz12C79s5ZAv4c+zX5H0FX/4pNcw
         Toqvdt1KhDHTITGXKtf5aAIgiax2jLuZy6UAneFxUy15Ym2EjiAxu79YlYA2zHh5FOvB
         P1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753304841; x=1753909641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjeuNz6Xaecx8WkUhJDHPgpmB8WtK3UxxSXjA/OkWUQ=;
        b=UWU3+hibDouPVfna1DjlC98dYWSeoocLHLXlmin1lOd2sXyrLj0uywwUHzw6mDVFGV
         DfRCBHwUaSnRWSRazIQElueg5+d3C2fNqT8KOQrJZOeHVWASNYJN2JpSefURUo6NKw5H
         a2pBD+Rwx5NMa4M+8Ty+Vh0InEdVLf7XZdqtC2ml28hSH9nQHsPRBtJV75S8qFzBimcP
         EvcrZdxjOhPZ+P8LXLomzlt8tehjQriouq5s0AD9sNwPUB0lVLslKHekd9TK7WXAGMeX
         oQ/rZ3uHEqOQSWrxJm6iGFQOLg+MHusI5Erq+0eJc4YF6chUnvTI0JQ2SImuDTml59N8
         LG3g==
X-Gm-Message-State: AOJu0YxTOrHypWEe8TbyOa2IUwX3AqOvKQp4eGmwdlIx2GH6LR45jcnh
	+vSTVn/DpWUCcKtnyCPXvS+AQv2ysDpDdhnB0PfeUSHh+z/j2ts3uQ4bwjonLQt4fGMKdwT7uuI
	2uQm8vKf1ULi3F+THSiJbI3sZb2H67A4EFMoYcU8N0yuPHZIorjLq
X-Gm-Gg: ASbGncuQOYR/3dhJSQNHrie6gOBfNaR+YrT9tWFXlgF5vBtuBIxs5rl00RZoYn0yw4I
	ddP32oaQVd0u14B/XXivcqgkTiq9HjfjKLpe/MF3JqP/s2aDHRU+DkF8Ttb+NdBkpvC9SQPGOSp
	pkCrovXvELTH2KqhLZ9kddT9W8F3uLxxvu+itXlYAaQ+s0Cnb26GDjxXKl6bKs1Y0E1QKTehX/P
	Avsu7Gj8zKfVEw8IQ75szcNDhajZT90DWIJf6wsQ2i0vAvQ
X-Google-Smtp-Source: AGHT+IFCbPup4KC9xdompv1owlolSJQytZUfb5O5raajrPrqBVcp3I+H3n+zyDuC+7k9bhKAMiwRsWlFDNvDcozhHyo=
X-Received: by 2002:a05:690c:296:b0:716:5986:e4c7 with SMTP id
 00721157ae682-719b422f495mr50816037b3.11.1753304840849; Wed, 23 Jul 2025
 14:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250723060124.86663-1-hprajapati@mvista.com> <1854FAE2ADC81AB2.7619@lists.openembedded.org>
In-Reply-To: <1854FAE2ADC81AB2.7619@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 23 Jul 2025 14:07:09 -0700
X-Gm-Features: Ac12FXwhUIaHDOw58BV4X8dN1_sfQXy5lh-ZwGN_j9Hw3Ped7pU6FjxwsMQtpMk
Message-ID: <CAOSpxdb0GCcWFB+w+REnDuzpjV8a0C8aOXhZPq582RsSUPn1nw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] libpam: fix CVE-2025-6020
To: hprajapati@mvista.com
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 21:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220813

FWIW, your scarthgap version of this patch doesn't seem to have the issue.

Steve

On Wed, Jul 23, 2025 at 1:20=E2=80=AFPM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> I'm getting errors on all of the builds with DISTRO =3D poky-altcfg
>
> Here's a sample log:
>
> https://errors.yoctoproject.org/Errors/Details/872983/
>
> Steve
>
> On Tue, Jul 22, 2025 at 11:01=E2=80=AFPM Hitendra Prajapati via
> lists.openembedded.org <hprajapati=3Dmvista.com@lists.openembedded.org>
> wrote:
> >
> > Upstream-Status: Backport from https://github.com/linux-pam/linux-pam/c=
ommit/475bd60c552b98c7eddb3270b0b4196847c0072e && https://github.com/linux-=
pam/linux-pam/commit/592d84e1265d04c3104acee815a503856db503a1 && https://gi=
thub.com/linux-pam/linux-pam/commit/976c20079358d133514568fc7fd95c02df8b577=
3
> >
> > Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > ---
> >  ...001-pam_inline-introduce-pam_asprint.patch |  102 +
> >  .../pam/libpam/CVE-2025-6020-01.patch         | 1662 +++++++++++++++++
> >  .../pam/libpam/CVE-2025-6020-02.patch         |  187 ++
> >  .../pam/libpam/CVE-2025-6020-03.patch         |   35 +
> >  meta/recipes-extended/pam/libpam_1.5.2.bb     |    4 +
> >  5 files changed, 1990 insertions(+)
> >  create mode 100644 meta/recipes-extended/pam/libpam/0001-pam_inline-in=
troduce-pam_asprint.patch
> >  create mode 100644 meta/recipes-extended/pam/libpam/CVE-2025-6020-01.p=
atch
> >  create mode 100644 meta/recipes-extended/pam/libpam/CVE-2025-6020-02.p=
atch
> >  create mode 100644 meta/recipes-extended/pam/libpam/CVE-2025-6020-03.p=
atch
> >
> > diff --git a/meta/recipes-extended/pam/libpam/0001-pam_inline-introduce=
-pam_asprint.patch b/meta/recipes-extended/pam/libpam/0001-pam_inline-intro=
duce-pam_asprint.patch
> > new file mode 100644
> > index 0000000000..48e8b255f2
> > --- /dev/null
> > +++ b/meta/recipes-extended/pam/libpam/0001-pam_inline-introduce-pam_as=
print.patch
> > @@ -0,0 +1,102 @@
> > +From 10b80543807e3fc5af5f8bcfd8bb6e219bb3cecc Mon Sep 17 00:00:00 2001
> > +From: "Dmitry V. Levin" <ldv@strace.io>
> > +Date: Tue, 18 Feb 2025 08:00:00 +0000
> > +Subject: [PATCH] pam_inline: introduce pam_asprintf(), pam_snprintf(),=
 and
> > + pam_sprintf()
> > +
> > +pam_asprintf() is essentially asprintf() with the following semantic
> > +difference: it returns the string itself instead of its length.
> > +
> > +pam_snprintf() is essentially snprintf() with the following semantic
> > +difference: it returns -1 in case of truncation.
> > +
> > +pam_sprintf() is essentially snprintf() but with a check that the buff=
er
> > +is an array, and with an automatically calculated buffer size.
> > +
> > +Use of these helpers would make error checking simpler.
> > +
> > +(cherry picked from commit 10b80543807e3fc5af5f8bcfd8bb6e219bb3cecc)
> > +Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> > +
> > +Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/comm=
it/10b80543807e3fc5af5f8bcfd8bb6e219bb3cecc]
> > +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > +---
> > + libpam/include/pam_cc_compat.h |  6 ++++++
> > + libpam/include/pam_inline.h    | 37 +++++++++++++++++++++++++++++++++=
+
> > + 2 files changed, 43 insertions(+)
> > +
> > +diff --git a/libpam/include/pam_cc_compat.h b/libpam/include/pam_cc_co=
mpat.h
> > +index 6919036..45c74b5 100644
> > +--- a/libpam/include/pam_cc_compat.h
> > ++++ b/libpam/include/pam_cc_compat.h
> > +@@ -21,6 +21,12 @@
> > + # define PAM_ATTRIBUTE_ALIGNED(arg)   /* empty */
> > + #endif
> > +
> > ++#if PAM_GNUC_PREREQ(3, 0)
> > ++# define PAM_ATTRIBUTE_MALLOC         __attribute__((__malloc__))
> > ++#else
> > ++# define PAM_ATTRIBUTE_MALLOC         /* empty */
> > ++#endif
> > ++
> > + #if PAM_GNUC_PREREQ(4, 6)
> > + # define DIAG_PUSH_IGNORE_CAST_QUAL                                  =
 \
> > +       _Pragma("GCC diagnostic push");                                =
 \
> > +diff --git a/libpam/include/pam_inline.h b/libpam/include/pam_inline.h
> > +index ec2f3bf..666a028 100644
> > +--- a/libpam/include/pam_inline.h
> > ++++ b/libpam/include/pam_inline.h
> > +@@ -9,6 +9,9 @@
> > + #define PAM_INLINE_H
> > +
> > + #include "pam_cc_compat.h"
> > ++#include <stdarg.h>
> > ++#include <stdio.h>
> > ++#include <stdlib.h>
> > + #include <string.h>
> > + #include <unistd.h>
> > + #include <errno.h>
> > +@@ -66,6 +69,40 @@ pam_str_skip_icase_prefix_len(const char *str, cons=
t char *prefix, size_t prefix
> > + #define pam_str_skip_icase_prefix(str_, prefix_)      \
> > +       pam_str_skip_icase_prefix_len((str_), (prefix_), sizeof(prefix_=
) - 1 + PAM_MUST_BE_ARRAY(prefix_))
> > +
> > ++static inline char * PAM_FORMAT((printf, 1, 2)) PAM_NONNULL((1)) PAM_=
ATTRIBUTE_MALLOC
> > ++pam_asprintf(const char *fmt, ...)
> > ++{
> > ++      int rc;
> > ++      char *res;
> > ++      va_list ap;
> > ++
> > ++      va_start(ap, fmt);
> > ++      rc =3D vasprintf(&res, fmt, ap);
> > ++      va_end(ap);
> > ++
> > ++      return rc < 0 ? NULL : res;
> > ++}
> > ++
> > ++static inline int PAM_FORMAT((printf, 3, 4)) PAM_NONNULL((3))
> > ++pam_snprintf(char *str, size_t size, const char *fmt, ...)
> > ++{
> > ++      int rc;
> > ++      va_list ap;
> > ++
> > ++      va_start(ap, fmt);
> > ++      rc =3D vsnprintf(str, size, fmt, ap);
> > ++      va_end(ap);
> > ++
> > ++      if (rc < 0 || (unsigned int) rc >=3D size)
> > ++              return -1;
> > ++      return rc;
> > ++}
> > ++
> > ++#define pam_sprintf(str_, fmt_, ...)                                 =
         \
> > ++      pam_snprintf((str_), sizeof(str_) + PAM_MUST_BE_ARRAY(str_), (f=
mt_),    \
> > ++                   ##__VA_ARGS__)
> > ++
> > ++
> > + static inline int
> > + pam_read_passwords(int fd, int npass, char **passwords)
> > + {
> > +--
> > +2.50.1
> > +
> > diff --git a/meta/recipes-extended/pam/libpam/CVE-2025-6020-01.patch b/=
meta/recipes-extended/pam/libpam/CVE-2025-6020-01.patch
> > new file mode 100644
> > index 0000000000..2beebf85f2
> > --- /dev/null
> > +++ b/meta/recipes-extended/pam/libpam/CVE-2025-6020-01.patch
> > @@ -0,0 +1,1662 @@
> > +From 475bd60c552b98c7eddb3270b0b4196847c0072e Mon Sep 17 00:00:00 2001
> > +From: Olivier Bal-Petre <olivier.bal-petre@ssi.gouv.fr>
> > +Date: Tue, 4 Mar 2025 14:37:02 +0100
> > +Subject: [PATCH] pam_namespace: fix potential privilege escalation
> > +
> > +Existing protection provided by protect_dir() and protect_mount() were
> > +bind mounting on themselves all directories part of the to-be-secured
> > +paths. However, this works *only* against attacks executed by processe=
s
> > +in the same mount namespace as the one the mountpoint was created in.
> > +Therefore, a user with an out-of-mount-namespace access, or multiple
> > +users colluding, could exploit multiple race conditions, and, for
> > +instance, elevate their privileges to root.
> > +
> > +This commit keeps the existing protection as a defense in depth
> > +measure, and to keep the existing behavior of the module. However,
> > +it converts all the needed function calls to operate on file
> > +descriptors instead of absolute paths to protect against race
> > +conditions globally.
> > +
> > +Signed-off-by: Olivier Bal-Petre <olivier.bal-petre@ssi.gouv.fr>
> > +Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> > +
> > +Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/comm=
it/475bd60c552b98c7eddb3270b0b4196847c0072e]
> > +CVE: CVE-2025-6020
> > +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > +---
> > + modules/pam_namespace/pam_namespace.c | 1073 ++++++++++++++++--------=
-
> > + modules/pam_namespace/pam_namespace.h |   17 +-
> > + 2 files changed, 721 insertions(+), 369 deletions(-)
> > +
> > +diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_names=
pace/pam_namespace.c
> > +index d6b1d3c..fcd78fd 100644
> > +--- a/modules/pam_namespace/pam_namespace.c
> > ++++ b/modules/pam_namespace/pam_namespace.c
> > +@@ -39,6 +39,374 @@
> > + #include "pam_namespace.h"
> > + #include "argv_parse.h"
> > +
> > ++#define MAGIC_LNK_FD_SIZE 64
> > ++
> > ++/* --- evaluating all files in VENDORDIR/security/namespace.d and /et=
c/security/namespace.d --- */
> > ++static const char *base_name(const char *path)
> > ++{
> > ++    const char *base =3D strrchr(path, '/');
> > ++    return base ? base+1 : path;
> > ++}
> > ++
> > ++static int
> > ++compare_filename(const void *a, const void *b)
> > ++{
> > ++      return strcmp(base_name(* (char * const *) a),
> > ++                    base_name(* (char * const *) b));
> > ++}
> > ++
> > ++static void close_fds_pre_exec(struct instance_data *idata)
> > ++{
> > ++      if (pam_modutil_sanitize_helper_fds(idata->pamh, PAM_MODUTIL_IG=
NORE_FD,
> > ++                      PAM_MODUTIL_IGNORE_FD, PAM_MODUTIL_IGNORE_FD) <=
 0) {
> > ++              _exit(1);
> > ++      }
> > ++}
> > ++
> > ++static void
> > ++strip_trailing_slashes(char *str)
> > ++{
> > ++      char *p =3D str + strlen(str);
> > ++
> > ++      while (--p > str && *p =3D=3D '/')
> > ++              *p =3D '\0';
> > ++}
> > ++
> > ++static int protect_mount(int dfd, const char *path, struct instance_d=
ata *idata)
> > ++{
> > ++      struct protect_dir_s *dir =3D idata->protect_dirs;
> > ++      char tmpbuf[MAGIC_LNK_FD_SIZE];
> > ++
> > ++      while (dir !=3D NULL) {
> > ++              if (strcmp(path, dir->dir) =3D=3D 0) {
> > ++                      return 0;
> > ++              }
> > ++              dir =3D dir->next;
> > ++      }
> > ++
> > ++      if (pam_sprintf(tmpbuf, "/proc/self/fd/%d", dfd) < 0)
> > ++              return -1;
> > ++
> > ++      dir =3D calloc(1, sizeof(*dir));
> > ++
> > ++      if (dir =3D=3D NULL) {
> > ++              return -1;
> > ++      }
> > ++
> > ++      dir->dir =3D strdup(path);
> > ++
> > ++      if (dir->dir =3D=3D NULL) {
> > ++              free(dir);
> > ++              return -1;
> > ++      }
> > ++
> > ++      if (idata->flags & PAMNS_DEBUG) {
> > ++              pam_syslog(idata->pamh, LOG_INFO,
> > ++                      "Protect mount of %s over itself", path);
> > ++      }
> > ++
> > ++      if (mount(tmpbuf, tmpbuf, NULL, MS_BIND, NULL) !=3D 0) {
> > ++              int save_errno =3D errno;
> > ++              pam_syslog(idata->pamh, LOG_ERR,
> > ++                      "Protect mount of %s failed: %m", tmpbuf);
> > ++              free(dir->dir);
> > ++              free(dir);
> > ++              errno =3D save_errno;
> > ++              return -1;
> > ++      }
> > ++
> > ++      dir->next =3D idata->protect_dirs;
> > ++      idata->protect_dirs =3D dir;
> > ++
> > ++      return 0;
> > ++}
> > ++
> > ++/*
> > ++ * Returns a fd to the given absolute path, acquired securely. This m=
eans:
> > ++ * - iterating on each segment of the path,
> > ++ * - not following user symlinks,
> > ++ * - using race-free operations.
> > ++ *
> > ++ * Takes a bit mask to specify the operation mode:
> > ++ * - SECURE_OPENDIR_PROTECT: call protect_mount() on each unsafe segm=
ent of path
> > ++ * - SECURE_OPENDIR_MKDIR: create last segment of path if does not ex=
ist
> > ++ * - SECURE_OPENDIR_FULL_FD: open the directory with O_RDONLY instead=
 of O_PATH,
> > ++ *     allowing more operations to be done with the returned fd
> > ++ *
> > ++ * Be aware that using SECURE_OPENDIR_PROTECT:
> > ++ * - will modify some external state (global structure...) and should=
 not be
> > ++ *   called in cleanup code paths. See wrapper secure_opendir_statele=
ss()
> > ++ * - need a non-NULL idata to call protect_mount()
> > ++ */
> > ++static int secure_opendir(const char *path, int opm, mode_t mode,
> > ++      struct instance_data *idata)
> > ++{
> > ++      char *p;
> > ++      char *d;
> > ++      char *dir;
> > ++      int dfd =3D -1;
> > ++      int dfd_next;
> > ++      int save_errno;
> > ++      int flags =3D O_DIRECTORY | O_CLOEXEC;
> > ++      int rv =3D -1;
> > ++      struct stat st;
> > ++
> > ++      if (opm & SECURE_OPENDIR_FULL_FD)
> > ++              flags |=3D O_RDONLY;
> > ++      else
> > ++              flags |=3D O_PATH;
> > ++
> > ++      /* Check for args consistency */
> > ++      if ((opm & SECURE_OPENDIR_PROTECT) && idata =3D=3D NULL)
> > ++              return -1;
> > ++
> > ++      /* Accept only absolute paths */
> > ++      if (*path !=3D '/')
> > ++              return -1;
> > ++
> > ++      dir =3D p =3D strdup(path);
> > ++      if (p =3D=3D NULL)
> > ++              return -1;
> > ++
> > ++      /* Assume '/' is safe */
> > ++      dfd =3D open("/", flags);
> > ++      if (dfd =3D=3D -1)
> > ++              goto error;
> > ++
> > ++      /* Needed to not loop too far and call openat() on NULL */
> > ++      strip_trailing_slashes(p);
> > ++
> > ++      dir++;
> > ++
> > ++      /* In case path is '/' */
> > ++      if (*dir =3D=3D '\0') {
> > ++              free(p);
> > ++              return dfd;
> > ++      }
> > ++
> > ++      while ((d=3Dstrchr(dir, '/')) !=3D NULL) {
> > ++              *d =3D '\0';
> > ++
> > ++              dfd_next =3D openat(dfd, dir, flags);
> > ++              if (dfd_next =3D=3D -1)
> > ++                      goto error;
> > ++
> > ++              if (fstat(dfd_next, &st) !=3D 0) {
> > ++                      close(dfd_next);
> > ++                      goto error;
> > ++              }
> > ++
> > ++              if ((flags & O_NOFOLLOW) && (opm & SECURE_OPENDIR_PROTE=
CT)) {
> > ++                      /* we are inside user-owned dir - protect */
> > ++                      if (protect_mount(dfd_next, p, idata) =3D=3D -1=
) {
> > ++                              close(dfd_next);
> > ++                              goto error;
> > ++                      }
> > ++                      /*
> > ++                       * Reopen the directory to obtain a new descrip=
tor
> > ++                       * after protect_mount(), this is necessary in =
cases
> > ++                       * when another directory is going to be mounte=
d over
> > ++                       * the given path.
> > ++                       */
> > ++                      close(dfd_next);
> > ++                      dfd_next =3D openat(dfd, dir, flags);
> > ++                      if (dfd_next =3D=3D -1)
> > ++                              goto error;
> > ++              } else if (st.st_uid !=3D 0
> > ++                         || (st.st_gid !=3D 0 && (st.st_mode & S_IWGR=
P))
> > ++                         || (st.st_mode & S_IWOTH)) {
> > ++                      /* do not follow symlinks on subdirectories */
> > ++                      flags |=3D O_NOFOLLOW;
> > ++              }
> > ++
> > ++              close(dfd);
> > ++              dfd =3D dfd_next;
> > ++
> > ++              *d =3D '/';
> > ++              dir =3D d + 1;
> > ++      }
> > ++
> > ++      rv =3D openat(dfd, dir, flags);
> > ++
> > ++      if (rv =3D=3D -1) {
> > ++              if ((opm & SECURE_OPENDIR_MKDIR) && mkdirat(dfd, dir, m=
ode) =3D=3D 0)
> > ++                      rv =3D openat(dfd, dir, flags);
> > ++
> > ++              if (rv =3D=3D -1)
> > ++                      goto error;
> > ++      }
> > ++
> > ++      if ((flags & O_NOFOLLOW) && (opm & SECURE_OPENDIR_PROTECT)) {
> > ++              /* we are inside user-owned dir - protect */
> > ++              if (protect_mount(rv, p, idata) =3D=3D -1) {
> > ++                      save_errno =3D errno;
> > ++                      close(rv);
> > ++                      rv =3D -1;
> > ++                      errno =3D save_errno;
> > ++              }
> > ++              /*
> > ++               * Reopen the directory to obtain a new descriptor afte=
r
> > ++               * protect_mount(), this is necessary in cases when ano=
ther
> > ++               * directory is going to be mounted over the given path=
.
> > ++               */
> > ++              close(rv);
> > ++              rv =3D openat(dfd, dir, flags);
> > ++      }
> > ++
> > ++error:
> > ++      save_errno =3D errno;
> > ++      free(p);
> > ++      if (dfd >=3D 0)
> > ++              close(dfd);
> > ++      errno =3D save_errno;
> > ++
> > ++      return rv;
> > ++}
> > ++
> > ++/*
> > ++ * Returns a fd to the given path, acquired securely.
> > ++ * It can be called in all situations, including in cleanup code path=
s, as
> > ++ * it does not modify external state (no access to global structures.=
..).
> > ++ */
> > ++static int secure_opendir_stateless(const char *path)
> > ++{
> > ++      return secure_opendir(path, 0, 0, NULL);
> > ++}
> > ++
> > ++/*
> > ++ * Umount securely the given path, even if the directories along
> > ++ * the path are under user control. It should protect against
> > ++ * symlinks attacks and race conditions.
> > ++ */
> > ++static int secure_umount(const char *path)
> > ++{
> > ++      int save_errno;
> > ++      int rv =3D -1;
> > ++      int dfd =3D -1;
> > ++      char s_path[MAGIC_LNK_FD_SIZE];
> > ++
> > ++      dfd =3D secure_opendir_stateless(path);
> > ++      if (dfd =3D=3D -1)
> > ++              return rv;
> > ++
> > ++      if (pam_sprintf(s_path, "/proc/self/fd/%d", dfd) < 0)
> > ++              goto error;
> > ++
> > ++      /*
> > ++      * We still have a fd open to path itself,
> > ++      * so we need to do a lazy umount.
> > ++      */
> > ++      rv =3D umount2(s_path, MNT_DETACH);
> > ++
> > ++error:
> > ++      save_errno =3D errno;
> > ++      close(dfd);
> > ++      errno =3D save_errno;
> > ++      return rv;
> > ++}
> > ++
> > ++/*
> > ++ * Rmdir the given path securely, protecting against symlinks attacks
> > ++ * and race conditions.
> > ++ * This function is currently called only in cleanup code paths where
> > ++ * any errors returned are not handled, so do not handle them either.
> > ++ * Basically, try to rmdir the path on a best-effort basis.
> > ++ */
> > ++static void secure_try_rmdir(const char *path)
> > ++{
> > ++      int dfd;
> > ++      char *buf;
> > ++      char *parent;
> > ++
> > ++      buf =3D strdup(path);
> > ++      if (buf =3D=3D NULL)
> > ++              return;
> > ++
> > ++      parent =3D dirname(buf);
> > ++
> > ++      dfd =3D secure_opendir_stateless(parent);
> > ++      if (dfd >=3D 0) {
> > ++              unlinkat(dfd, base_name(path), AT_REMOVEDIR);
> > ++              close(dfd);
> > ++      }
> > ++
> > ++      free(buf);
> > ++}
> > ++
> > ++/* Evaluating a list of files which have to be parsed in the right or=
der:
> > ++ *
> > ++ * - If etc/security/namespace.d/@filename@.conf exists, then
> > ++ *   %vendordir%/security/namespace.d/@filename@.conf should not be u=
sed.
> > ++ * - All files in both namespace.d directories are sorted by their @f=
ilename@.conf in
> > ++ *   lexicographic order regardless of which of the directories they =
reside in. */
> > ++static char **read_namespace_dir(struct instance_data *idata)
> > ++{
> > ++      glob_t globbuf;
> > ++      size_t i=3D0;
> > ++      int glob_rv =3D glob(NAMESPACE_D_GLOB, GLOB_ERR | GLOB_NOSORT, =
NULL, &globbuf);
> > ++      char **file_list;
> > ++      size_t file_list_size =3D glob_rv =3D=3D 0 ? globbuf.gl_pathc :=
 0;
> > ++
> > ++#ifdef VENDOR_NAMESPACE_D_GLOB
> > ++      glob_t globbuf_vendor;
> > ++      int glob_rv_vendor =3D glob(VENDOR_NAMESPACE_D_GLOB, GLOB_ERR |=
 GLOB_NOSORT, NULL, &globbuf_vendor);
> > ++      if (glob_rv_vendor =3D=3D 0)
> > ++          file_list_size +=3D globbuf_vendor.gl_pathc;
> > ++#endif
> > ++      file_list =3D malloc((file_list_size + 1) * sizeof(char*));
> > ++      if (file_list =3D=3D NULL) {
> > ++          pam_syslog(idata->pamh, LOG_ERR, "Cannot allocate memory fo=
r file list: %m");
> > ++#ifdef VENDOR_NAMESPACE_D_GLOB
> > ++          if (glob_rv_vendor =3D=3D 0)
> > ++              globfree(&globbuf_vendor);
> > ++#endif
> > ++          if (glob_rv =3D=3D 0)
> > ++              globfree(&globbuf);
> > ++          return NULL;
> > ++      }
> > ++
> > ++      if (glob_rv =3D=3D 0) {
> > ++          for (i =3D 0; i < globbuf.gl_pathc; i++) {
> > ++              file_list[i] =3D strdup(globbuf.gl_pathv[i]);
> > ++              if (file_list[i] =3D=3D NULL) {
> > ++                  pam_syslog(idata->pamh, LOG_ERR, "strdup failed: %m=
");
> > ++                  break;
> > ++              }
> > ++          }
> > ++      }
> > ++#ifdef VENDOR_NAMESPACE_D_GLOB
> > ++      if (glob_rv_vendor =3D=3D 0) {
> > ++          for (size_t j =3D 0; j < globbuf_vendor.gl_pathc; j++) {
> > ++              if (glob_rv =3D=3D 0 && globbuf.gl_pathc > 0) {
> > ++                  int double_found =3D 0;
> > ++                  for (size_t k =3D 0; k < globbuf.gl_pathc; k++) {
> > ++                      if (strcmp(base_name(globbuf.gl_pathv[k]),
> > ++                                 base_name(globbuf_vendor.gl_pathv[j]=
)) =3D=3D 0) {
> > ++                              double_found =3D 1;
> > ++                              break;
> > ++                      }
> > ++                  }
> > ++                  if (double_found)
> > ++                      continue;
> > ++              }
> > ++              file_list[i] =3D strdup(globbuf_vendor.gl_pathv[j]);
> > ++              if (file_list[i] =3D=3D NULL) {
> > ++                  pam_syslog(idata->pamh, LOG_ERR, "strdup failed: %m=
");
> > ++                  break;
> > ++              }
> > ++              i++;
> > ++          }
> > ++          globfree(&globbuf_vendor);
> > ++      }
> > ++#endif
> > ++      file_list[i] =3D NULL;
> > ++      qsort(file_list, i, sizeof(char *), compare_filename);
> > ++      if (glob_rv =3D=3D 0)
> > ++          globfree(&globbuf);
> > ++
> > ++      return file_list;
> > ++}
> > ++
> > + /*
> > +  * Adds an entry for a polyinstantiated directory to the linked list =
of
> > +  * polyinstantiated directories. It is called from process_line() whi=
le
> > +@@ -71,6 +439,7 @@ static void del_polydir(struct polydir_s *poly)
> > +       }
> > + }
> > +
> > ++
> > + /*
> > +  * Deletes all the entries in the linked list.
> > +  */
> > +@@ -90,7 +459,7 @@ static void unprotect_dirs(struct protect_dir_s *di=
r)
> > +       struct protect_dir_s *next;
> > +
> > +       while (dir !=3D NULL) {
> > +-              umount(dir->dir);
> > ++              secure_umount(dir->dir);
> > +               free(dir->dir);
> > +               next =3D dir->next;
> > +               free(dir);
> > +@@ -108,7 +477,7 @@ static void cleanup_protect_data(pam_handle_t *pam=
h UNUSED , void *data, int err
> > +       unprotect_dirs(data);
> > + }
> > +
> > +-static char *expand_variables(const char *orig, const char *var_names=
[], const char *var_values[])
> > ++static char *expand_variables(const char *orig, const char *const var=
_names[], const char *var_values[])
> > + {
> > +       const char *src =3D orig;
> > +       char *dst;
> > +@@ -119,7 +488,7 @@ static char *expand_variables(const char *orig, co=
nst char *var_names[], const c
> > +               if (*src =3D=3D '$') {
> > +                       int i;
> > +                       for (i =3D 0; var_names[i]; i++) {
> > +-                              int namelen =3D strlen(var_names[i]);
> > ++                              size_t namelen =3D strlen(var_names[i])=
;
> > +                               if (strncmp(var_names[i], src+1, namele=
n) =3D=3D 0) {
> > +                                       dstlen +=3D strlen(var_values[i=
]) - 1; /* $ */
> > +                                       src +=3D namelen;
> > +@@ -137,7 +506,7 @@ static char *expand_variables(const char *orig, co=
nst char *var_names[], const c
> > +               if (c =3D=3D '$') {
> > +                       int i;
> > +                       for (i =3D 0; var_names[i]; i++) {
> > +-                              int namelen =3D strlen(var_names[i]);
> > ++                              size_t namelen =3D strlen(var_names[i])=
;
> > +                               if (strncmp(var_names[i], src+1, namele=
n) =3D=3D 0) {
> > +                                       dst =3D stpcpy(dst, var_values[=
i]);
> > +                                       --dst;
> > +@@ -221,8 +590,7 @@ static int parse_iscript_params(char *params, stru=
ct polydir_s *poly)
> > +
> > +     if (*params !=3D '\0') {
> > +       if (*params !=3D '/') { /* path is relative to NAMESPACE_D_DIR =
*/
> > +-              if (asprintf(&poly->init_script, "%s%s", NAMESPACE_D_DI=
R, params) =3D=3D -1)
> > +-                      return -1;
> > ++              poly->init_script =3D pam_asprintf("%s%s", NAMESPACE_D_=
DIR, params);
> > +       } else {
> > +               poly->init_script =3D strdup(params);
> > +       }
> > +@@ -304,9 +672,9 @@ static int parse_method(char *method, struct polyd=
ir_s *poly,
> > + {
> > +     enum polymethod pm;
> > +     char *sptr =3D NULL;
> > +-    static const char *method_names[] =3D { "user", "context", "level=
", "tmpdir",
> > ++    static const char *const method_names[] =3D { "user", "context", =
"level", "tmpdir",
> > +       "tmpfs", NULL };
> > +-    static const char *flag_names[] =3D { "create", "noinit", "iscrip=
t",
> > ++    static const char *const flag_names[] =3D { "create", "noinit", "=
iscript",
> > +       "shared", "mntopts", NULL };
> > +     static const unsigned int flag_values[] =3D { POLYDIR_CREATE, POL=
YDIR_NOINIT,
> > +       POLYDIR_ISCRIPT, POLYDIR_SHARED, POLYDIR_MNTOPTS };
> > +@@ -331,7 +699,7 @@ static int parse_method(char *method, struct polyd=
ir_s *poly,
> > +
> > +     while ((flag=3Dstrtok_r(NULL, ":", &sptr)) !=3D NULL) {
> > +       for (i =3D 0; flag_names[i]; i++) {
> > +-              int namelen =3D strlen(flag_names[i]);
> > ++              size_t namelen =3D strlen(flag_names[i]);
> > +
> > +               if (strncmp(flag, flag_names[i], namelen) =3D=3D 0) {
> > +                       poly->flags |=3D flag_values[i];
> > +@@ -377,27 +745,27 @@ static int parse_method(char *method, struct pol=
ydir_s *poly,
> > +  * of the namespace configuration file. It skips over comments and in=
complete
> > +  * or malformed lines. It processes a valid line with information on
> > +  * polyinstantiating a directory by populating appropriate fields of =
a
> > +- * polyinstatiated directory structure and then calling add_polydir_e=
ntry to
> > ++ * polyinstantiated directory structure and then calling add_polydir_=
entry to
> > +  * add that entry to the linked list of polyinstantiated directories.
> > +  */
> > + static int process_line(char *line, const char *home, const char *rho=
me,
> > +                       struct instance_data *idata)
> > + {
> > +     char *dir =3D NULL, *instance_prefix =3D NULL, *rdir =3D NULL;
> > ++    const char *config_dir, *config_instance_prefix;
> > +     char *method, *uids;
> > +     char *tptr;
> > +     struct polydir_s *poly;
> > +     int retval =3D 0;
> > +     char **config_options =3D NULL;
> > +-    static const char *var_names[] =3D {"HOME", "USER", NULL};
> > ++    static const char *const var_names[] =3D {"HOME", "USER", NULL};
> > +     const char *var_values[] =3D {home, idata->user};
> > +     const char *rvar_values[] =3D {rhome, idata->ruser};
> > +-    int len;
> > +
> > +     /*
> > +      * skip the leading white space
> > +      */
> > +-    while (*line && isspace(*line))
> > ++    while (*line && isspace((unsigned char)*line))
> > +         line++;
> > +
> > +     /*
> > +@@ -433,22 +801,19 @@ static int process_line(char *line, const char *=
home, const char *rhome,
> > +         goto erralloc;
> > +     }
> > +
> > +-    dir =3D config_options[0];
> > +-    if (dir =3D=3D NULL) {
> > ++    config_dir =3D config_options[0];
> > ++    if (config_dir =3D=3D NULL) {
> > +         pam_syslog(idata->pamh, LOG_NOTICE, "Invalid line missing pol=
ydir");
> > +         goto skipping;
> > +     }
> > +-    instance_prefix =3D config_options[1];
> > +-    if (instance_prefix =3D=3D NULL) {
> > ++    config_instance_prefix =3D config_options[1];
> > ++    if (config_instance_prefix =3D=3D NULL) {
> > +         pam_syslog(idata->pamh, LOG_NOTICE, "Invalid line missing ins=
tance_prefix");
> > +-        instance_prefix =3D NULL;
> > +         goto skipping;
> > +     }
> > +     method =3D config_options[2];
> > +     if (method =3D=3D NULL) {
> > +         pam_syslog(idata->pamh, LOG_NOTICE, "Invalid line missing met=
hod");
> > +-        instance_prefix =3D NULL;
> > +-        dir =3D NULL;
> > +         goto skipping;
> > +     }
> > +
> > +@@ -463,19 +828,16 @@ static int process_line(char *line, const char *=
home, const char *rhome,
> > +     /*
> > +      * Expand $HOME and $USER in poly dir and instance dir prefix
> > +      */
> > +-    if ((rdir=3Dexpand_variables(dir, var_names, rvar_values)) =3D=3D=
 NULL) {
> > +-          instance_prefix =3D NULL;
> > +-          dir =3D NULL;
> > ++    if ((rdir =3D expand_variables(config_dir, var_names, rvar_values=
)) =3D=3D NULL) {
> > +           goto erralloc;
> > +     }
> > +
> > +-    if ((dir=3Dexpand_variables(dir, var_names, var_values)) =3D=3D N=
ULL) {
> > +-          instance_prefix =3D NULL;
> > ++    if ((dir =3D expand_variables(config_dir, var_names, var_values))=
 =3D=3D NULL) {
> > +           goto erralloc;
> > +     }
> > +
> > +-    if ((instance_prefix=3Dexpand_variables(instance_prefix, var_name=
s, var_values))
> > +-          =3D=3D NULL) {
> > ++    if ((instance_prefix =3D expand_variables(config_instance_prefix,
> > ++                                          var_names, var_values)) =3D=
=3D NULL) {
> > +           goto erralloc;
> > +     }
> > +
> > +@@ -485,15 +847,8 @@ static int process_line(char *line, const char *h=
ome, const char *rhome,
> > +           pam_syslog(idata->pamh, LOG_DEBUG, "Expanded instance prefi=
x: '%s'", instance_prefix);
> > +     }
> > +
> > +-    len =3D strlen(dir);
> > +-    if (len > 0 && dir[len-1] =3D=3D '/') {
> > +-          dir[len-1] =3D '\0';
> > +-    }
> > +-
> > +-    len =3D strlen(rdir);
> > +-    if (len > 0 && rdir[len-1] =3D=3D '/') {
> > +-          rdir[len-1] =3D '\0';
> > +-    }
> > ++    strip_trailing_slashes(dir);
> > ++    strip_trailing_slashes(rdir);
> > +
> > +     if (dir[0] =3D=3D '\0' || rdir[0] =3D=3D '\0') {
> > +           pam_syslog(idata->pamh, LOG_NOTICE, "Invalid polydir");
> > +@@ -504,26 +859,15 @@ static int process_line(char *line, const char *=
home, const char *rhome,
> > +      * Populate polyinstantiated directory structure with appropriate
> > +      * pathnames and the method with which to polyinstantiate.
> > +      */
> > +-    if (strlen(dir) >=3D sizeof(poly->dir)
> > +-        || strlen(rdir) >=3D sizeof(poly->rdir)
> > +-      || strlen(instance_prefix) >=3D sizeof(poly->instance_prefix)) =
{
> > +-      pam_syslog(idata->pamh, LOG_NOTICE, "Pathnames too long");
> > +-      goto skipping;
> > +-    }
> > +-    strcpy(poly->dir, dir);
> > +-    strcpy(poly->rdir, rdir);
> > +-    strcpy(poly->instance_prefix, instance_prefix);
> > +-
> > +     if (parse_method(method, poly, idata) !=3D 0) {
> > +           goto skipping;
> > +     }
> > +
> > +-    if (poly->method =3D=3D TMPDIR) {
> > +-      if (sizeof(poly->instance_prefix) - strlen(poly->instance_prefi=
x) < 7) {
> > +-              pam_syslog(idata->pamh, LOG_NOTICE, "Pathnames too long=
");
> > +-              goto skipping;
> > +-      }
> > +-      strcat(poly->instance_prefix, "XXXXXX");
> > ++    if (pam_sprintf(poly->dir, "%s", dir) < 0
> > ++      || pam_sprintf(poly->rdir, "%s", rdir) < 0
> > ++      || pam_sprintf(poly->instance_prefix, "%s", instance_prefix) < =
0) {
> > ++      pam_syslog(idata->pamh, LOG_NOTICE, "Pathnames too long");
> > ++      goto skipping;
> > +     }
> > +
> > +     /*
> > +@@ -547,7 +891,7 @@ static int process_line(char *line, const char *ho=
me, const char *rhome,
> > +     if (uids) {
> > +         uid_t *uidptr;
> > +         const char *ustr, *sstr;
> > +-        int count, i;
> > ++        size_t count, i;
> > +
> > +       if (*uids =3D=3D '~') {
> > +               poly->flags |=3D POLYDIR_EXCLUSIVE;
> > +@@ -556,8 +900,13 @@ static int process_line(char *line, const char *h=
ome, const char *rhome,
> > +         for (count =3D 0, ustr =3D sstr =3D uids; sstr; ustr =3D sstr=
 + 1, count++)
> > +            sstr =3D strchr(ustr, ',');
> > +
> > ++        if (count > UINT_MAX || count > SIZE_MAX / sizeof(uid_t)) {
> > ++            pam_syslog(idata->pamh, LOG_ERR, "Too many uids encounter=
ed in configuration");
> > ++            goto skipping;
> > ++        }
> > ++
> > +         poly->num_uids =3D count;
> > +-        poly->uid =3D (uid_t *) malloc(count * sizeof (uid_t));
> > ++        poly->uid =3D malloc(count * sizeof (uid_t));
> > +         uidptr =3D poly->uid;
> > +         if (uidptr =3D=3D NULL) {
> > +             goto erralloc;
> > +@@ -796,6 +1145,23 @@ static char *md5hash(const char *instname, struc=
t instance_data *idata)
> > + }
> > +
> > + #ifdef WITH_SELINUX
> > ++static char *secure_getfilecon(pam_handle_t *pamh, const char *dir)
> > ++{
> > ++      char *ctx =3D NULL;
> > ++      int dfd =3D secure_opendir(dir, SECURE_OPENDIR_FULL_FD, 0, NULL=
);
> > ++      if (dfd < 0) {
> > ++              pam_syslog(pamh, LOG_ERR, "Error getting fd to %s: %m",=
 dir);
> > ++              return NULL;
> > ++      }
> > ++      if (fgetfilecon(dfd, &ctx) < 0)
> > ++              ctx =3D NULL;
> > ++      if (ctx =3D=3D NULL)
> > ++              pam_syslog(pamh, LOG_ERR,
> > ++                         "Error getting poly dir context for %s: %m",=
 dir);
> > ++      close(dfd);
> > ++      return ctx;
> > ++}
> > ++
> > + static int form_context(const struct polydir_s *polyptr,
> > +               char **i_context, char **origcon,
> > +               struct instance_data *idata)
> > +@@ -807,12 +1173,9 @@ static int form_context(const struct polydir_s *=
polyptr,
> > +       /*
> > +        * Get the security context of the directory to polyinstantiate=
.
> > +        */
> > +-      rc =3D getfilecon(polyptr->dir, origcon);
> > +-      if (rc < 0 || *origcon =3D=3D NULL) {
> > +-              pam_syslog(idata->pamh, LOG_ERR,
> > +-                              "Error getting poly dir context, %m");
> > ++      *origcon =3D secure_getfilecon(idata->pamh, polyptr->dir);
> > ++      if (*origcon =3D=3D NULL)
> > +               return PAM_SESSION_ERR;
> > +-      }
> > +
> > +       if (polyptr->method =3D=3D USER) return PAM_SUCCESS;
> > +
> > +@@ -903,34 +1266,58 @@ static int form_context(const struct polydir_s =
*polyptr,
> > +               return rc;
> > +       }
> > +       /* Should never get here */
> > ++      freecon(scon);
> > +       return PAM_SUCCESS;
> > + }
> > + #endif
> > +
> > + /*
> > +- * poly_name returns the name of the polyinstantiated instance direct=
ory
> > ++ * From the instance differentiation string, set in the polyptr struc=
ture:
> > ++ * - the absolute path to the instance dir,
> > ++ * - the absolute path to the previous dir (parent),
> > ++ * - the instance name (may be different than the instance differenti=
ation string)
> > ++ */
> > ++static int set_polydir_paths(struct polydir_s *polyptr, const char *i=
nst_differentiation)
> > ++{
> > ++      char *tmp;
> > ++
> > ++      if (pam_sprintf(polyptr->instance_absolute, "%s%s",
> > ++                      polyptr->instance_prefix, inst_differentiation)=
 < 0)
> > ++              return -1;
> > ++
> > ++      polyptr->instname =3D strrchr(polyptr->instance_absolute, '/') =
+ 1;
> > ++
> > ++      if (pam_sprintf(polyptr->instance_parent, "%s", polyptr->instan=
ce_absolute) < 0)
> > ++              return -1;
> > ++
> > ++      tmp =3D strrchr(polyptr->instance_parent, '/') + 1;
> > ++      *tmp =3D '\0';
> > ++
> > ++      return 0;
> > ++}
> > ++
> > ++/*
> > ++ * Set the name of the polyinstantiated instance directory
> > +  * based on the method used for polyinstantiation (user, context or l=
evel)
> > +  * In addition, the function also returns the security contexts of th=
e
> > +  * original directory to polyinstantiate and the polyinstantiated ins=
tance
> > +  * directory.
> > +  */
> > + #ifdef WITH_SELINUX
> > +-static int poly_name(const struct polydir_s *polyptr, char **i_name,
> > +-      char **i_context, char **origcon,
> > +-        struct instance_data *idata)
> > ++static int poly_name(struct polydir_s *polyptr, char **i_context,
> > ++        char **origcon, struct instance_data *idata)
> > + #else
> > +-static int poly_name(const struct polydir_s *polyptr, char **i_name,
> > +-      struct instance_data *idata)
> > ++static int poly_name(struct polydir_s *polyptr, struct instance_data =
*idata)
> > + #endif
> > + {
> > +     int rc;
> > ++    char *inst_differentiation =3D NULL;
> > +     char *hash =3D NULL;
> > +     enum polymethod pm;
> > + #ifdef WITH_SELINUX
> > +     char *rawcon =3D NULL;
> > + #endif
> > +
> > +-    *i_name =3D NULL;
> > + #ifdef WITH_SELINUX
> > +     *i_context =3D NULL;
> > +     *origcon =3D NULL;
> > +@@ -964,10 +1351,8 @@ static int poly_name(const struct polydir_s *pol=
yptr, char **i_name,
> > +
> > +     switch (pm) {
> > +         case USER:
> > +-          if (asprintf(i_name, "%s", idata->user) < 0) {
> > +-              *i_name =3D NULL;
> > ++          if ((inst_differentiation =3D strdup(idata->user)) =3D=3D N=
ULL)
> > +               goto fail;
> > +-          }
> > +           break;
> > +
> > + #ifdef WITH_SELINUX
> > +@@ -977,26 +1362,25 @@ static int poly_name(const struct polydir_s *po=
lyptr, char **i_name,
> > +               pam_syslog(idata->pamh, LOG_ERR, "Error translating dir=
ectory context");
> > +               goto fail;
> > +           }
> > +-          if (polyptr->flags & POLYDIR_SHARED) {
> > +-              if (asprintf(i_name, "%s", rawcon) < 0) {
> > +-                      *i_name =3D NULL;
> > +-                      goto fail;
> > +-              }
> > +-          } else {
> > +-              if (asprintf(i_name, "%s_%s", rawcon, idata->user) < 0)=
 {
> > +-                      *i_name =3D NULL;
> > +-                      goto fail;
> > +-              }
> > +-          }
> > ++          if (polyptr->flags & POLYDIR_SHARED)
> > ++              inst_differentiation =3D strdup(rawcon);
> > ++          else
> > ++              inst_differentiation =3D pam_asprintf("%s_%s", rawcon, =
idata->user);
> > ++          if (inst_differentiation =3D=3D NULL)
> > ++              goto fail;
> > +           break;
> > +
> > + #endif /* WITH_SELINUX */
> > +
> > +       case TMPDIR:
> > ++          if ((inst_differentiation =3D strdup("XXXXXX")) =3D=3D NULL=
)
> > ++              goto fail;
> > ++          goto success;
> > ++
> > +       case TMPFS:
> > +-          if ((*i_name=3Dstrdup("")) =3D=3D NULL)
> > ++          if ((inst_differentiation=3Dstrdup("")) =3D=3D NULL)
> > +               goto fail;
> > +-          return PAM_SUCCESS;
> > ++          goto success;
> > +
> > +       default:
> > +           if (idata->flags & PAMNS_DEBUG)
> > +@@ -1005,31 +1389,37 @@ static int poly_name(const struct polydir_s *p=
olyptr, char **i_name,
> > +     }
> > +
> > +     if (idata->flags & PAMNS_DEBUG)
> > +-        pam_syslog(idata->pamh, LOG_DEBUG, "poly_name %s", *i_name);
> > ++        pam_syslog(idata->pamh, LOG_DEBUG, "poly_name %s", inst_diffe=
rentiation);
> > +
> > +-    if ((idata->flags & PAMNS_GEN_HASH) || strlen(*i_name) > NAMESPAC=
E_MAX_DIR_LEN) {
> > +-        hash =3D md5hash(*i_name, idata);
> > ++    if ((idata->flags & PAMNS_GEN_HASH) || strlen(inst_differentiatio=
n) > NAMESPACE_MAX_DIR_LEN) {
> > ++        hash =3D md5hash(inst_differentiation, idata);
> > +         if (hash =3D=3D NULL) {
> > +           goto fail;
> > +         }
> > +         if (idata->flags & PAMNS_GEN_HASH) {
> > +-          free(*i_name);
> > +-          *i_name =3D hash;
> > ++          free(inst_differentiation);
> > ++          inst_differentiation =3D hash;
> > +           hash =3D NULL;
> > +         } else {
> > +-          char *newname;
> > +-          if (asprintf(&newname, "%.*s_%s", NAMESPACE_MAX_DIR_LEN-1-(=
int)strlen(hash),
> > +-              *i_name, hash) < 0) {
> > ++          char *newname =3D
> > ++              pam_asprintf("%.*s_%s",
> > ++                           NAMESPACE_MAX_DIR_LEN - 1 - (int)strlen(ha=
sh),
> > ++                           inst_differentiation, hash);
> > ++          if (newname =3D=3D NULL)
> > +               goto fail;
> > +-          }
> > +-          free(*i_name);
> > +-          *i_name =3D newname;
> > ++          free(inst_differentiation);
> > ++          inst_differentiation =3D newname;
> > +         }
> > +     }
> > +-    rc =3D PAM_SUCCESS;
> > +
> > ++success:
> > ++    if (set_polydir_paths(polyptr, inst_differentiation) =3D=3D -1)
> > ++        goto fail;
> > ++
> > ++    rc =3D PAM_SUCCESS;
> > + fail:
> > +     free(hash);
> > ++    free(inst_differentiation);
> > + #ifdef WITH_SELINUX
> > +     freecon(rawcon);
> > + #endif
> > +@@ -1040,187 +1430,35 @@ fail:
> > +       freecon(*origcon);
> > +       *origcon =3D NULL;
> > + #endif
> > +-      free(*i_name);
> > +-      *i_name =3D NULL;
> > +     }
> > +     return rc;
> > + }
> > +
> > +-static int protect_mount(int dfd, const char *path, struct instance_d=
ata *idata)
> > ++static int check_inst_parent(int dfd, struct instance_data *idata)
> > + {
> > +-      struct protect_dir_s *dir =3D idata->protect_dirs;
> > +-      char tmpbuf[64];
> > +-
> > +-      while (dir !=3D NULL) {
> > +-              if (strcmp(path, dir->dir) =3D=3D 0) {
> > +-                      return 0;
> > +-              }
> > +-              dir =3D dir->next;
> > +-      }
> > +-
> > +-      dir =3D calloc(1, sizeof(*dir));
> > +-
> > +-      if (dir =3D=3D NULL) {
> > +-              return -1;
> > +-      }
> > +-
> > +-      dir->dir =3D strdup(path);
> > +-
> > +-      if (dir->dir =3D=3D NULL) {
> > +-              free(dir);
> > +-              return -1;
> > +-      }
> > ++      struct stat instpbuf;
> > +
> > +-      snprintf(tmpbuf, sizeof(tmpbuf), "/proc/self/fd/%d", dfd);
> > ++      /*
> > ++       * Stat the instance parent directory to make sure it's writabl=
e by
> > ++       * root only (unless the admin explicitly instructs to ignore t=
he
> > ++       * instance parent mode by the "ignore_instance_parent_mode" ar=
gument).
> > ++       */
> > +
> > +-      if (idata->flags & PAMNS_DEBUG) {
> > +-              pam_syslog(idata->pamh, LOG_INFO,
> > +-                      "Protect mount of %s over itself", path);
> > +-      }
> > ++      if (idata->flags & PAMNS_IGN_INST_PARENT_MODE)
> > ++              return PAM_SUCCESS;
> > +
> > +-      if (mount(tmpbuf, tmpbuf, NULL, MS_BIND, NULL) !=3D 0) {
> > +-              int save_errno =3D errno;
> > ++      if (fstat(dfd, &instpbuf) < 0) {
> > +               pam_syslog(idata->pamh, LOG_ERR,
> > +-                      "Protect mount of %s failed: %m", tmpbuf);
> > +-              free(dir->dir);
> > +-              free(dir);
> > +-              errno =3D save_errno;
> > +-              return -1;
> > +-      }
> > +-
> > +-      dir->next =3D idata->protect_dirs;
> > +-      idata->protect_dirs =3D dir;
> > +-
> > +-      return 0;
> > +-}
> > +-
> > +-static int protect_dir(const char *path, mode_t mode, int do_mkdir,
> > +-      struct instance_data *idata)
> > +-{
> > +-      char *p =3D strdup(path);
> > +-      char *d;
> > +-      char *dir =3D p;
> > +-      int dfd =3D AT_FDCWD;
> > +-      int dfd_next;
> > +-      int save_errno;
> > +-      int flags =3D O_RDONLY | O_DIRECTORY;
> > +-      int rv =3D -1;
> > +-      struct stat st;
> > +-
> > +-      if (p =3D=3D NULL) {
> > +-              goto error;
> > +-      }
> > +-
> > +-      if (*dir =3D=3D '/') {
> > +-              dfd =3D open("/", flags);
> > +-              if (dfd =3D=3D -1) {
> > +-                      goto error;
> > +-              }
> > +-              dir++;  /* assume / is safe */
> > +-      }
> > +-
> > +-      while ((d=3Dstrchr(dir, '/')) !=3D NULL) {
> > +-              *d =3D '\0';
> > +-              dfd_next =3D openat(dfd, dir, flags);
> > +-              if (dfd_next =3D=3D -1) {
> > +-                      goto error;
> > +-              }
> > +-
> > +-              if (dfd !=3D AT_FDCWD)
> > +-                      close(dfd);
> > +-              dfd =3D dfd_next;
> > +-
> > +-              if (fstat(dfd, &st) !=3D 0) {
> > +-                      goto error;
> > +-              }
> > +-
> > +-              if (flags & O_NOFOLLOW) {
> > +-                      /* we are inside user-owned dir - protect */
> > +-                      if (protect_mount(dfd, p, idata) =3D=3D -1)
> > +-                              goto error;
> > +-              } else if (st.st_uid !=3D 0 || st.st_gid !=3D 0 ||
> > +-                      (st.st_mode & S_IWOTH)) {
> > +-                      /* do not follow symlinks on subdirectories */
> > +-                      flags |=3D O_NOFOLLOW;
> > +-              }
> > +-
> > +-              *d =3D '/';
> > +-              dir =3D d + 1;
> > +-      }
> > +-
> > +-      rv =3D openat(dfd, dir, flags);
> > +-
> > +-      if (rv =3D=3D -1) {
> > +-              if (!do_mkdir || mkdirat(dfd, dir, mode) !=3D 0) {
> > +-                      goto error;
> > +-              }
> > +-              rv =3D openat(dfd, dir, flags);
> > +-      }
> > +-
> > +-      if (flags & O_NOFOLLOW) {
> > +-              /* we are inside user-owned dir - protect */
> > +-              if (protect_mount(rv, p, idata) =3D=3D -1) {
> > +-                      save_errno =3D errno;
> > +-                      close(rv);
> > +-                      rv =3D -1;
> > +-                      errno =3D save_errno;
> > +-              }
> > +-      }
> > +-
> > +-error:
> > +-      save_errno =3D errno;
> > +-      free(p);
> > +-      if (dfd !=3D AT_FDCWD && dfd >=3D 0)
> > +-              close(dfd);
> > +-      errno =3D save_errno;
> > +-
> > +-      return rv;
> > +-}
> > +-
> > +-static int check_inst_parent(char *ipath, struct instance_data *idata=
)
> > +-{
> > +-      struct stat instpbuf;
> > +-      char *inst_parent, *trailing_slash;
> > +-      int dfd;
> > +-      /*
> > +-       * stat the instance parent path to make sure it exists
> > +-       * and is a directory. Check that its mode is 000 (unless the
> > +-       * admin explicitly instructs to ignore the instance parent
> > +-       * mode by the "ignore_instance_parent_mode" argument).
> > +-       */
> > +-      inst_parent =3D (char *) malloc(strlen(ipath)+1);
> > +-      if (!inst_parent) {
> > +-              pam_syslog(idata->pamh, LOG_CRIT, "Error allocating pat=
hname string");
> > ++                      "Error accessing instance parent, %m");
> > +               return PAM_SESSION_ERR;
> > +       }
> > +
> > +-      strcpy(inst_parent, ipath);
> > +-      trailing_slash =3D strrchr(inst_parent, '/');
> > +-      if (trailing_slash)
> > +-              *trailing_slash =3D '\0';
> > +-
> > +-      dfd =3D protect_dir(inst_parent, 0, 1, idata);
> > +-
> > +-      if (dfd =3D=3D -1 || fstat(dfd, &instpbuf) < 0) {
> > ++      if ((instpbuf.st_mode & (S_IRWXU|S_IRWXG|S_IRWXO)) || instpbuf.=
st_uid !=3D 0) {
> > +               pam_syslog(idata->pamh, LOG_ERR,
> > +-                      "Error creating or accessing instance parent %s=
, %m", inst_parent);
> > +-              if (dfd !=3D -1)
> > +-                      close(dfd);
> > +-              free(inst_parent);
> > ++                      "Mode of inst parent not 000 or owner not root"=
);
> > +               return PAM_SESSION_ERR;
> > +       }
> > +
> > +-      if ((idata->flags & PAMNS_IGN_INST_PARENT_MODE) =3D=3D 0) {
> > +-              if ((instpbuf.st_mode & (S_IRWXU|S_IRWXG|S_IRWXO)) || i=
nstpbuf.st_uid !=3D 0) {
> > +-                      pam_syslog(idata->pamh, LOG_ERR, "Mode of inst =
parent %s not 000 or owner not root",
> > +-                                      inst_parent);
> > +-                      close(dfd);
> > +-                      free(inst_parent);
> > +-                      return PAM_SESSION_ERR;
> > +-              }
> > +-      }
> > +-      close(dfd);
> > +-      free(inst_parent);
> > +       return PAM_SUCCESS;
> > + }
> > +
> > +@@ -1269,9 +1507,10 @@ static int inst_init(const struct polydir_s *po=
lyptr, const char *ipath,
> > +                               if (setuid(geteuid()) < 0) {
> > +                                       /* ignore failures, they don't =
matter */
> > +                               }
> > ++                              close_fds_pre_exec(idata);
> > +
> > +-                              if (execle(init_script, init_script,
> > +-                                      polyptr->dir, ipath, newdir?"1"=
:"0", idata->user, NULL, envp) < 0)
> > ++                              execle(init_script, init_script,
> > ++                                      polyptr->dir, ipath, newdir?"1"=
:"0", idata->user, NULL, envp);
> > +                                       _exit(1);
> > +                       } else if (pid > 0) {
> > +                               while (((rc =3D waitpid(pid, &status, 0=
)) =3D=3D (pid_t)-1) &&
> > +@@ -1322,7 +1561,9 @@ static int create_polydir(struct polydir_s *poly=
ptr,
> > +
> > + #ifdef WITH_SELINUX
> > +     if (idata->flags & PAMNS_SELINUX_ENABLED) {
> > +-      getfscreatecon_raw(&oldcon_raw);
> > ++      if (getfscreatecon_raw(&oldcon_raw) !=3D 0)
> > ++          pam_syslog(idata->pamh, LOG_NOTICE,
> > ++                     "Error retrieving fs create context: %m");
> > +
> > +       label_handle =3D selabel_open(SELABEL_CTX_FILE, NULL, 0);
> > +       if (!label_handle) {
> > +@@ -1347,11 +1588,16 @@ static int create_polydir(struct polydir_s *po=
lyptr,
> > +     }
> > + #endif
> > +
> > +-    rc =3D protect_dir(dir, mode, 1, idata);
> > ++    rc =3D secure_opendir(dir,
> > ++            SECURE_OPENDIR_PROTECT | SECURE_OPENDIR_MKDIR | SECURE_OP=
ENDIR_FULL_FD,
> > ++            mode, idata);
> > +     if (rc =3D=3D -1) {
> > +             pam_syslog(idata->pamh, LOG_ERR,
> > +                        "Error creating directory %s: %m", dir);
> > +-            return PAM_SESSION_ERR;
> > ++#ifdef WITH_SELINUX
> > ++            freecon(oldcon_raw);
> > ++#endif
> > ++            return -1;
> > +     }
> > +
> > + #ifdef WITH_SELINUX
> > +@@ -1372,9 +1618,9 @@ static int create_polydir(struct polydir_s *poly=
ptr,
> > +               pam_syslog(idata->pamh, LOG_ERR,
> > +                          "Error changing mode of directory %s: %m", d=
ir);
> > +                 close(rc);
> > +-                umount(dir); /* undo the eventual protection bind mou=
nt */
> > +-              rmdir(dir);
> > +-              return PAM_SESSION_ERR;
> > ++              secure_umount(dir); /* undo the eventual protection bin=
d mount */
> > ++              secure_try_rmdir(dir);
> > ++              return -1;
> > +       }
> > +     }
> > +
> > +@@ -1392,41 +1638,37 @@ static int create_polydir(struct polydir_s *po=
lyptr,
> > +         pam_syslog(idata->pamh, LOG_ERR,
> > +                    "Unable to change owner on directory %s: %m", dir)=
;
> > +         close(rc);
> > +-        umount(dir); /* undo the eventual protection bind mount */
> > +-      rmdir(dir);
> > +-      return PAM_SESSION_ERR;
> > ++      secure_umount(dir); /* undo the eventual protection bind mount =
*/
> > ++      secure_try_rmdir(dir);
> > ++      return -1;
> > +     }
> > +
> > +-    close(rc);
> > +-
> > +     if (idata->flags & PAMNS_DEBUG)
> > +       pam_syslog(idata->pamh, LOG_DEBUG,
> > +                  "Polydir owner %u group %u", uid, gid);
> > +
> > +-    return PAM_SUCCESS;
> > ++    return rc;
> > + }
> > +
> > + /*
> > +- * Create polyinstantiated instance directory (ipath).
> > ++ * Create polyinstantiated instance directory.
> > ++ * To protect against races, changes are done on a fd to the parent o=
f the
> > ++ * instance directory (dfd_iparent) and a relative path (polyptr->ins=
tname).
> > ++ * The absolute path (polyptr->instance_absolute) is only updated whe=
n creating
> > ++ * a tmpdir and used for logging purposes.
> > +  */
> > + #ifdef WITH_SELINUX
> > +-static int create_instance(struct polydir_s *polyptr, char *ipath, st=
ruct stat *statbuf,
> > +-        const char *icontext, const char *ocontext,
> > +-      struct instance_data *idata)
> > ++static int create_instance(struct polydir_s *polyptr, int dfd_iparent=
,
> > ++        struct stat *statbuf, const char *icontext, const char *ocont=
ext,
> > ++        struct instance_data *idata)
> > + #else
> > +-static int create_instance(struct polydir_s *polyptr, char *ipath, st=
ruct stat *statbuf,
> > +-      struct instance_data *idata)
> > ++static int create_instance(struct polydir_s *polyptr, int dfd_iparent=
,
> > ++        struct stat *statbuf, struct instance_data *idata)
> > + #endif
> > + {
> > +     struct stat newstatbuf;
> > +     int fd;
> > +
> > +-    /*
> > +-     * Check to make sure instance parent is valid.
> > +-     */
> > +-    if (check_inst_parent(ipath, idata))
> > +-      return PAM_SESSION_ERR;
> > +-
> > +     /*
> > +      * Create instance directory and set its security context to the =
context
> > +      * returned by the security policy. Set its mode and ownership
> > +@@ -1435,29 +1677,39 @@ static int create_instance(struct polydir_s *p=
olyptr, char *ipath, struct stat *
> > +      */
> > +
> > +     if (polyptr->method =3D=3D TMPDIR) {
> > +-      if (mkdtemp(polyptr->instance_prefix) =3D=3D NULL) {
> > +-            pam_syslog(idata->pamh, LOG_ERR, "Error creating temporar=
y instance %s, %m",
> > +-                      polyptr->instance_prefix);
> > +-          polyptr->method =3D NONE; /* do not clean up! */
> > +-          return PAM_SESSION_ERR;
> > +-      }
> > +-      /* copy the actual directory name to ipath */
> > +-      strcpy(ipath, polyptr->instance_prefix);
> > +-    } else if (mkdir(ipath, S_IRUSR) < 0) {
> > ++        char s_path[PATH_MAX];
> > ++        /*
> > ++         * Create the template for mkdtemp() as a magic link based on
> > ++         * our existing fd to avoid symlink attacks and races.
> > ++         */
> > ++        if (pam_sprintf(s_path, "/proc/self/fd/%d/%s", dfd_iparent, p=
olyptr->instname) < 0
> > ++            || mkdtemp(s_path) =3D=3D NULL) {
> > ++            pam_syslog(idata->pamh, LOG_ERR,
> > ++                       "Error creating temporary instance dir %s, %m"=
,
> > ++                       polyptr->instance_absolute);
> > ++            polyptr->method =3D NONE; /* do not clean up! */
> > ++            return PAM_SESSION_ERR;
> > ++        }
> > ++
> > ++        /* Copy the actual directory name to polyptr->instname */
> > ++        strcpy(polyptr->instname, base_name(s_path));
> > ++    } else if (mkdirat(dfd_iparent, polyptr->instname, S_IRUSR) < 0) =
{
> > +         if (errno =3D=3D EEXIST)
> > +             return PAM_IGNORE;
> > +         else {
> > +             pam_syslog(idata->pamh, LOG_ERR, "Error creating %s, %m",
> > +-                      ipath);
> > ++                       polyptr->instance_absolute);
> > +             return PAM_SESSION_ERR;
> > +         }
> > +     }
> > +
> > +-    /* Open a descriptor to it to prevent races */
> > +-    fd =3D open(ipath, O_DIRECTORY | O_RDONLY);
> > ++    /* Open a descriptor to prevent races, based on our existing fd. =
*/
> > ++    fd =3D openat(dfd_iparent, polyptr->instname,
> > ++            O_RDONLY | O_DIRECTORY | O_NOFOLLOW | O_CLOEXEC);
> > +     if (fd < 0) {
> > +-      pam_syslog(idata->pamh, LOG_ERR, "Error opening %s, %m", ipath)=
;
> > +-      rmdir(ipath);
> > ++      pam_syslog(idata->pamh, LOG_ERR, "Error opening %s, %m",
> > ++                polyptr->instance_absolute);
> > ++      unlinkat(dfd_iparent, polyptr->instname, AT_REMOVEDIR);
> > +       return PAM_SESSION_ERR;
> > +     }
> > + #ifdef WITH_SELINUX
> > +@@ -1467,17 +1719,19 @@ static int create_instance(struct polydir_s *p=
olyptr, char *ipath, struct stat *
> > +         if (icontext) {
> > +             if (fsetfilecon(fd, icontext) < 0) {
> > +                 pam_syslog(idata->pamh, LOG_ERR,
> > +-                      "Error setting context of %s to %s", ipath, ico=
ntext);
> > ++                      "Error setting context of %s to %s",
> > ++                        polyptr->instance_absolute, icontext);
> > +                 close(fd);
> > +-              rmdir(ipath);
> > ++                unlinkat(dfd_iparent, polyptr->instname, AT_REMOVEDIR=
);
> > +                 return PAM_SESSION_ERR;
> > +             }
> > +         } else {
> > +             if (fsetfilecon(fd, ocontext) < 0) {
> > +                 pam_syslog(idata->pamh, LOG_ERR,
> > +-                      "Error setting context of %s to %s", ipath, oco=
ntext);
> > ++                      "Error setting context of %s to %s",
> > ++                        polyptr->instance_absolute, ocontext);
> > +               close(fd);
> > +-              rmdir(ipath);
> > ++                unlinkat(dfd_iparent, polyptr->instname, AT_REMOVEDIR=
);
> > +                 return PAM_SESSION_ERR;
> > +             }
> > +         }
> > +@@ -1485,9 +1739,9 @@ static int create_instance(struct polydir_s *pol=
yptr, char *ipath, struct stat *
> > + #endif
> > +     if (fstat(fd, &newstatbuf) < 0) {
> > +         pam_syslog(idata->pamh, LOG_ERR, "Error stating %s, %m",
> > +-              ipath);
> > ++              polyptr->instance_absolute);
> > +       close(fd);
> > +-      rmdir(ipath);
> > ++        unlinkat(dfd_iparent, polyptr->instname, AT_REMOVEDIR);
> > +         return PAM_SESSION_ERR;
> > +     }
> > +     if (newstatbuf.st_uid !=3D statbuf->st_uid ||
> > +@@ -1495,17 +1749,17 @@ static int create_instance(struct polydir_s *p=
olyptr, char *ipath, struct stat *
> > +         if (fchown(fd, statbuf->st_uid, statbuf->st_gid) < 0) {
> > +             pam_syslog(idata->pamh, LOG_ERR,
> > +                       "Error changing owner for %s, %m",
> > +-                      ipath);
> > ++                      polyptr->instance_absolute);
> > +           close(fd);
> > +-          rmdir(ipath);
> > ++            unlinkat(dfd_iparent, polyptr->instname, AT_REMOVEDIR);
> > +             return PAM_SESSION_ERR;
> > +         }
> > +     }
> > +     if (fchmod(fd, statbuf->st_mode & 07777) < 0) {
> > +         pam_syslog(idata->pamh, LOG_ERR, "Error changing mode for %s,=
 %m",
> > +-                      ipath);
> > ++                      polyptr->instance_absolute);
> > +       close(fd);
> > +-      rmdir(ipath);
> > ++        unlinkat(dfd_iparent, polyptr->instname, AT_REMOVEDIR);
> > +         return PAM_SESSION_ERR;
> > +     }
> > +     close(fd);
> > +@@ -1524,9 +1778,12 @@ static int ns_setup(struct polydir_s *polyptr,
> > +       struct instance_data *idata)
> > + {
> > +     int retval;
> > ++    int dfd_iparent =3D -1;
> > ++    int dfd_ipath =3D -1;
> > ++    int dfd_pptrdir =3D -1;
> > +     int newdir =3D 1;
> > +-    char *inst_dir =3D NULL;
> > +-    char *instname =3D NULL;
> > ++    char s_ipath[MAGIC_LNK_FD_SIZE];
> > ++    char s_pptrdir[MAGIC_LNK_FD_SIZE];
> > +     struct stat statbuf;
> > + #ifdef WITH_SELINUX
> > +     char *instcontext =3D NULL, *origcontext =3D NULL;
> > +@@ -1536,39 +1793,48 @@ static int ns_setup(struct polydir_s *polyptr,
> > +         pam_syslog(idata->pamh, LOG_DEBUG,
> > +                "Set namespace for directory %s", polyptr->dir);
> > +
> > +-    retval =3D protect_dir(polyptr->dir, 0, 0, idata);
> > ++    dfd_pptrdir =3D secure_opendir(polyptr->dir, SECURE_OPENDIR_PROTE=
CT, 0, idata);
> > +
> > +-    if (retval < 0 && errno !=3D ENOENT) {
> > +-      pam_syslog(idata->pamh, LOG_ERR, "Polydir %s access error: %m",
> > +-              polyptr->dir);
> > +-      return PAM_SESSION_ERR;
> > +-    }
> > +-
> > +-    if (retval < 0) {
> > +-      if ((polyptr->flags & POLYDIR_CREATE) &&
> > +-              create_polydir(polyptr, idata) !=3D PAM_SUCCESS)
> > +-              return PAM_SESSION_ERR;
> > +-    } else {
> > +-      close(retval);
> > ++    if (dfd_pptrdir < 0) {
> > ++        if (errno !=3D ENOENT || !(polyptr->flags & POLYDIR_CREATE)) =
{
> > ++            pam_syslog(idata->pamh, LOG_ERR, "Polydir %s access error=
: %m",
> > ++                    polyptr->dir);
> > ++            return PAM_SESSION_ERR;
> > ++        }
> > ++        dfd_pptrdir =3D create_polydir(polyptr, idata);
> > ++        if (dfd_pptrdir < 0)
> > ++            return PAM_SESSION_ERR;
> > +     }
> > +
> > +     if (polyptr->method =3D=3D TMPFS) {
> > +-      if (mount("tmpfs", polyptr->dir, "tmpfs", polyptr->mount_flags,=
 polyptr->mount_opts) < 0) {
> > +-          pam_syslog(idata->pamh, LOG_ERR, "Error mounting tmpfs on %=
s, %m",
> > +-              polyptr->dir);
> > +-            return PAM_SESSION_ERR;
> > +-      }
> > ++        /*
> > ++         * There is no function mount() that operate on a fd, so inst=
ead, we
> > ++         * get the magic link corresponding to the fd and give it to =
mount().
> > ++         * This protects against potential races exploitable by an un=
priv user.
> > ++         */
> > ++        if (pam_sprintf(s_pptrdir, "/proc/self/fd/%d", dfd_pptrdir) <=
 0) {
> > ++            pam_syslog(idata->pamh, LOG_ERR, "Error pam_sprintf s_ppt=
rdir");
> > ++            goto error_out;
> > ++        }
> > +
> > +-      if (polyptr->flags & POLYDIR_NOINIT)
> > +-          return PAM_SUCCESS;
> > ++        if (mount("tmpfs", s_pptrdir, "tmpfs", polyptr->mount_flags, =
polyptr->mount_opts) < 0) {
> > ++            pam_syslog(idata->pamh, LOG_ERR, "Error mounting tmpfs on=
 %s, %m",
> > ++                       polyptr->dir);
> > ++            goto error_out;
> > ++        }
> > ++
> > ++        if (polyptr->flags & POLYDIR_NOINIT) {
> > ++            retval =3D PAM_SUCCESS;
> > ++            goto cleanup;
> > ++        }
> > +
> > +-      return inst_init(polyptr, "tmpfs", idata, 1);
> > ++        retval =3D inst_init(polyptr, "tmpfs", idata, 1);
> > ++        goto cleanup;
> > +     }
> > +
> > +-    if (stat(polyptr->dir, &statbuf) < 0) {
> > +-      pam_syslog(idata->pamh, LOG_ERR, "Error stating %s: %m",
> > +-              polyptr->dir);
> > +-        return PAM_SESSION_ERR;
> > ++    if (fstat(dfd_pptrdir, &statbuf) < 0) {
> > ++        pam_syslog(idata->pamh, LOG_ERR, "Error stating %s: %m", poly=
ptr->dir);
> > ++        goto error_out;
> > +     }
> > +
> > +     /*
> > +@@ -1577,15 +1843,16 @@ static int ns_setup(struct polydir_s *polyptr,
> > +      * security policy.
> > +      */
> > + #ifdef WITH_SELINUX
> > +-    retval =3D poly_name(polyptr, &instname, &instcontext,
> > +-                      &origcontext, idata);
> > ++    retval =3D poly_name(polyptr, &instcontext, &origcontext, idata);
> > + #else
> > +-    retval =3D poly_name(polyptr, &instname, idata);
> > ++    retval =3D poly_name(polyptr, idata);
> > + #endif
> > +
> > +     if (retval !=3D PAM_SUCCESS) {
> > +-      if (retval !=3D PAM_IGNORE)
> > ++      if (retval !=3D PAM_IGNORE) {
> > +               pam_syslog(idata->pamh, LOG_ERR, "Error getting instanc=
e name");
> > ++                goto error_out;
> > ++        }
> > +         goto cleanup;
> > +     } else {
> > + #ifdef WITH_SELINUX
> > +@@ -1596,22 +1863,33 @@ static int ns_setup(struct polydir_s *polyptr,
> > + #endif
> > +     }
> > +
> > +-    if (asprintf(&inst_dir, "%s%s", polyptr->instance_prefix, instnam=
e) < 0)
> > +-      goto error_out;
> > +-
> > +-    if (idata->flags & PAMNS_DEBUG)
> > +-        pam_syslog(idata->pamh, LOG_DEBUG, "instance_dir %s",
> > +-              inst_dir);
> > ++    /*
> > ++     * Gets a fd in a secure manner (we may be operating on a path un=
der
> > ++     * user control), and check it's compliant.
> > ++     * Then, we should *always* operate on *this* fd and a relative p=
ath
> > ++     * to be protected against race conditions.
> > ++     */
> > ++    dfd_iparent =3D secure_opendir(polyptr->instance_parent,
> > ++            SECURE_OPENDIR_PROTECT | SECURE_OPENDIR_MKDIR, 0, idata);
> > ++    if (dfd_iparent =3D=3D -1) {
> > ++      pam_syslog(idata->pamh, LOG_ERR,
> > ++                "polyptr->instance_parent %s access error",
> > ++                polyptr->instance_parent);
> > ++        goto error_out;
> > ++    }
> > ++    if (check_inst_parent(dfd_iparent, idata)) {
> > ++        goto error_out;
> > ++    }
> > +
> > +     /*
> > +      * Create instance directory with appropriate security
> > +      * contexts, owner, group and mode bits.
> > +      */
> > + #ifdef WITH_SELINUX
> > +-    retval =3D create_instance(polyptr, inst_dir, &statbuf, instconte=
xt,
> > +-                       origcontext, idata);
> > ++    retval =3D create_instance(polyptr, dfd_iparent, &statbuf, instco=
ntext,
> > ++                             origcontext, idata);
> > + #else
> > +-    retval =3D create_instance(polyptr, inst_dir, &statbuf, idata);
> > ++    retval =3D create_instance(polyptr, dfd_iparent, &statbuf, idata)=
;
> > + #endif
> > +
> > +     if (retval =3D=3D PAM_IGNORE) {
> > +@@ -1623,19 +1901,48 @@ static int ns_setup(struct polydir_s *polyptr,
> > +         goto error_out;
> > +     }
> > +
> > ++    /*
> > ++     * Instead of getting a new secure fd, we reuse the fd opened on =
directory
> > ++     * polyptr->instance_parent to ensure we are working on the same =
dir as
> > ++     * previously, and thus ensure that previous checks (e.g. check_i=
nst_parent())
> > ++     * are still relevant.
> > ++     */
> > ++    dfd_ipath =3D openat(dfd_iparent, polyptr->instname,
> > ++            O_PATH | O_DIRECTORY | O_NOFOLLOW | O_CLOEXEC);
> > ++    if (dfd_ipath =3D=3D -1) {
> > ++        pam_syslog(idata->pamh, LOG_ERR, "Error openat on %s, %m",
> > ++                polyptr->instname);
> > ++        goto error_out;
> > ++    }
> > ++
> > ++    if (pam_sprintf(s_ipath, "/proc/self/fd/%d", dfd_ipath) < 0) {
> > ++        pam_syslog(idata->pamh, LOG_ERR, "Error pam_sprintf s_ipath")=
;
> > ++        goto error_out;
> > ++    }
> > ++
> > ++    if (pam_sprintf(s_pptrdir, "/proc/self/fd/%d", dfd_pptrdir) < 0) =
{
> > ++        pam_syslog(idata->pamh, LOG_ERR, "Error pam_sprintf s_pptrdir=
");
> > ++        goto error_out;
> > ++    }
> > ++
> > +     /*
> > +      * Bind mount instance directory on top of the polyinstantiated
> > +      * directory to provide an instance of polyinstantiated directory
> > +      * based on polyinstantiated method.
> > ++     *
> > ++     * Operates on magic links created from two fd obtained securely
> > ++     * to protect against race conditions and symlink attacks. Indeed=
,
> > ++     * the source and destination can be in a user controled path.
> > +      */
> > +-    if (mount(inst_dir, polyptr->dir, NULL, MS_BIND, NULL) < 0) {
> > +-        pam_syslog(idata->pamh, LOG_ERR, "Error mounting %s on %s, %m=
",
> > +-                   inst_dir, polyptr->dir);
> > ++    if(mount(s_ipath, s_pptrdir, NULL, MS_BIND, NULL) < 0) {
> > ++        pam_syslog(idata->pamh, LOG_ERR,
> > ++                "Error mounting %s on %s (%s on %s), %m",
> > ++                   s_ipath, s_pptrdir, polyptr->instance_absolute, po=
lyptr->dir);
> > +         goto error_out;
> > +     }
> > +
> > +     if (!(polyptr->flags & POLYDIR_NOINIT))
> > +-      retval =3D inst_init(polyptr, inst_dir, idata, newdir);
> > ++      retval =3D inst_init(polyptr, polyptr->instance_absolute, idata=
, newdir);
> > +
> > +     goto cleanup;
> > +
> > +@@ -1647,8 +1954,12 @@ error_out:
> > +     retval =3D PAM_SESSION_ERR;
> > +
> > + cleanup:
> > +-    free(inst_dir);
> > +-    free(instname);
> > ++    if (dfd_iparent !=3D -1)
> > ++        close(dfd_iparent);
> > ++    if (dfd_ipath !=3D -1)
> > ++        close(dfd_ipath);
> > ++    if (dfd_pptrdir !=3D -1)
> > ++        close(dfd_pptrdir);
> > + #ifdef WITH_SELINUX
> > +     freecon(instcontext);
> > +     freecon(origcontext);
> > +@@ -1687,6 +1998,7 @@ static int cleanup_tmpdirs(struct instance_data =
*idata)
> > + {
> > +     struct polydir_s *pptr;
> > +     pid_t rc, pid;
> > ++    int dfd =3D -1;
> > +     struct sigaction newsa, oldsa;
> > +     int status;
> > +
> > +@@ -1698,7 +2010,17 @@ static int cleanup_tmpdirs(struct instance_data=
 *idata)
> > +     }
> > +
> > +     for (pptr =3D idata->polydirs_ptr; pptr; pptr =3D pptr->next) {
> > +-      if (pptr->method =3D=3D TMPDIR && access(pptr->instance_prefix,=
 F_OK) =3D=3D 0) {
> > ++      if (pptr->method =3D=3D TMPDIR) {
> > ++
> > ++            dfd =3D secure_opendir_stateless(pptr->instance_parent);
> > ++            if (dfd =3D=3D -1)
> > ++                continue;
> > ++
> > ++            if (faccessat(dfd, pptr->instname, F_OK, AT_SYMLINK_NOFOL=
LOW) !=3D 0) {
> > ++                close(dfd);
> > ++                continue;
> > ++            }
> > ++
> > +           pid =3D fork();
> > +           if (pid =3D=3D 0) {
> > +               static char *envp[] =3D { NULL };
> > +@@ -1708,9 +2030,21 @@ static int cleanup_tmpdirs(struct instance_data=
 *idata)
> > +                       _exit(1);
> > +               }
> > + #endif
> > +-              if (execle("/bin/rm", "/bin/rm", "-rf", pptr->instance_=
prefix, NULL, envp) < 0)
> > +-                      _exit(1);
> > ++                if (fchdir(dfd) =3D=3D -1) {
> > ++                    pam_syslog(idata->pamh, LOG_ERR, "Failed fchdir t=
o %s: %m",
> > ++                            pptr->instance_absolute);
> > ++                    _exit(1);
> > ++                }
> > ++
> > ++              close_fds_pre_exec(idata);
> > ++
> > ++              execle("/bin/rm", "/bin/rm", "-rf", pptr->instname, NUL=
L, envp);
> > ++              _exit(1);
> > +           } else if (pid > 0) {
> > ++
> > ++                if (dfd !=3D -1)
> > ++                    close(dfd);
> > ++
> > +               while (((rc =3D waitpid(pid, &status, 0)) =3D=3D (pid_t=
)-1) &&
> > +                   (errno =3D=3D EINTR));
> > +               if (rc =3D=3D (pid_t)-1) {
> > +@@ -1723,8 +2057,12 @@ static int cleanup_tmpdirs(struct instance_data=
 *idata)
> > +                       "Error removing %s", pptr->instance_prefix);
> > +               }
> > +           } else if (pid < 0) {
> > ++
> > ++                if (dfd !=3D -1)
> > ++                    close(dfd);
> > ++
> > +               pam_syslog(idata->pamh, LOG_ERR,
> > +-                      "Cannot fork to run namespace init script, %m")=
;
> > ++                      "Cannot fork to cleanup temporary directory, %m=
");
> > +               rc =3D PAM_SESSION_ERR;
> > +               goto out;
> > +           }
> > +@@ -1746,6 +2084,7 @@ out:
> > + static int setup_namespace(struct instance_data *idata, enum unmnt_op=
 unmnt)
> > + {
> > +     int retval =3D 0, need_poly =3D 0, changing_dir =3D 0;
> > ++    int dfd =3D -1;
> > +     char *cptr, *fptr, poly_parent[PATH_MAX];
> > +     struct polydir_s *pptr;
> > +
> > +@@ -1861,13 +2200,21 @@ static int setup_namespace(struct instance_dat=
a *idata, enum unmnt_op unmnt)
> > +                       strcpy(poly_parent, "/");
> > +                   else if (cptr)
> > +                       *cptr =3D '\0';
> > +-                    if (chdir(poly_parent) < 0) {
> > ++
> > ++                    dfd =3D secure_opendir_stateless(poly_parent);
> > ++                    if (dfd =3D=3D -1) {
> > ++                        pam_syslog(idata->pamh, LOG_ERR,
> > ++                            "Failed opening %s to fchdir: %m", poly_p=
arent);
> > ++                    }
> > ++                    else if (fchdir(dfd) =3D=3D -1) {
> > +                         pam_syslog(idata->pamh, LOG_ERR,
> > +-                              "Can't chdir to %s, %m", poly_parent);
> > ++                            "Failed fchdir to %s: %m", poly_parent);
> > +                     }
> > ++                    if (dfd !=3D -1)
> > ++                        close(dfd);
> > +                 }
> > +
> > +-                if (umount(pptr->rdir) < 0) {
> > ++            if (secure_umount(pptr->rdir) < 0) {
> > +                   int saved_errno =3D errno;
> > +                   pam_syslog(idata->pamh, LOG_ERR, "Unmount of %s fai=
led, %m",
> > +                       pptr->rdir);
> > +@@ -1937,7 +2284,7 @@ static int orig_namespace(struct instance_data *=
idata)
> > +                       "Unmounting instance dir for user %d & dir %s",
> > +                        idata->uid, pptr->dir);
> > +
> > +-            if (umount(pptr->dir) < 0) {
> > ++            if (secure_umount(pptr->dir) < 0) {
> > +                 pam_syslog(idata->pamh, LOG_ERR, "Unmount of %s faile=
d, %m",
> > +                        pptr->dir);
> > +                 return PAM_SESSION_ERR;
> > +diff --git a/modules/pam_namespace/pam_namespace.h b/modules/pam_names=
pace/pam_namespace.h
> > +index b51f284..abd570d 100644
> > +--- a/modules/pam_namespace/pam_namespace.h
> > ++++ b/modules/pam_namespace/pam_namespace.h
> > +@@ -44,21 +44,16 @@
> > + #include <stdlib.h>
> > + #include <errno.h>
> > + #include <syslog.h>
> > +-#include <dlfcn.h>
> > +-#include <stdarg.h>
> > + #include <pwd.h>
> > + #include <grp.h>
> > + #include <limits.h>
> > + #include <sys/types.h>
> > + #include <sys/stat.h>
> > +-#include <sys/resource.h>
> > + #include <sys/mount.h>
> > + #include <sys/wait.h>
> > +-#include <libgen.h>
> > + #include <fcntl.h>
> > + #include <sched.h>
> > + #include <glob.h>
> > +-#include <locale.h>
> > + #include "security/pam_modules.h"
> > + #include "security/pam_modutil.h"
> > + #include "security/pam_ext.h"
> > +@@ -112,7 +107,7 @@
> > + #define PAMNS_MOUNT_PRIVATE   0x00080000 /* Make the polydir mounts p=
rivate */
> > +
> > + /* polydir flags */
> > +-#define POLYDIR_EXCLUSIVE     0x00000001 /* polyinstatiate exclusivel=
y for override uids */
> > ++#define POLYDIR_EXCLUSIVE     0x00000001 /* polyinstantiate exclusive=
ly for override uids */
> > + #define POLYDIR_CREATE        0x00000002 /* create the polydir */
> > + #define POLYDIR_NOINIT        0x00000004 /* no init script */
> > + #define POLYDIR_SHARED        0x00000008 /* share context/level insta=
nces among users */
> > +@@ -124,6 +119,13 @@
> > + #define NAMESPACE_POLYDIR_DATA "pam_namespace:polydir_data"
> > + #define NAMESPACE_PROTECT_DATA "pam_namespace:protect_data"
> > +
> > ++/*
> > ++ * Operation mode for function secure_opendir()
> > ++ */
> > ++#define SECURE_OPENDIR_PROTECT     0x00000001
> > ++#define SECURE_OPENDIR_MKDIR       0x00000002
> > ++#define SECURE_OPENDIR_FULL_FD     0x00000004
> > ++
> > + /*
> > +  * Polyinstantiation method options, based on user, security context
> > +  * or both
> > +@@ -161,6 +163,9 @@ struct polydir_s {
> > +     char dir[PATH_MAX];               /* directory to polyinstantiate=
 */
> > +     char rdir[PATH_MAX];              /* directory to unmount (based =
on RUSER) */
> > +     char instance_prefix[PATH_MAX];   /* prefix for instance dir path=
 name */
> > ++    char instance_absolute[PATH_MAX]; /* absolute path to the instanc=
e dir (instance_parent + instname) */
> > ++    char instance_parent[PATH_MAX];   /* parent dir of the instance d=
ir */
> > ++    char *instname;                   /* last segment of the path to =
the instance dir */
> > +     enum polymethod method;           /* method used to polyinstantia=
te */
> > +     unsigned int num_uids;            /* number of override uids */
> > +     uid_t *uid;                               /* list of override uid=
s */
> > +--
> > +2.50.1
> > +
> > diff --git a/meta/recipes-extended/pam/libpam/CVE-2025-6020-02.patch b/=
meta/recipes-extended/pam/libpam/CVE-2025-6020-02.patch
> > new file mode 100644
> > index 0000000000..b89d61b312
> > --- /dev/null
> > +++ b/meta/recipes-extended/pam/libpam/CVE-2025-6020-02.patch
> > @@ -0,0 +1,187 @@
> > +From 592d84e1265d04c3104acee815a503856db503a1 Mon Sep 17 00:00:00 2001
> > +From: Olivier Bal-Petre <olivier.bal-petre@ssi.gouv.fr>
> > +Date: Tue, 4 Mar 2025 14:37:02 +0100
> > +Subject: [PATCH] pam_namespace: add flags to indicate path safety
> > +
> > +Add two flags in the script to indicate if the paths to the polydir
> > +and the instance directories are safe (root owned and writable by
> > +root only).
> > +
> > +Signed-off-by: Olivier Bal-Petre <olivier.bal-petre@ssi.gouv.fr>
> > +Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> > +
> > +Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/comm=
it/592d84e1265d04c3104acee815a503856db503a1]
> > +CVE: CVE-2025-6020
> > +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > +---
> > + modules/pam_namespace/namespace.init  | 56 ++++++++++++-------
> > + modules/pam_namespace/pam_namespace.c | 79 ++++++++++++++++++++++++++=
-
> > + 2 files changed, 115 insertions(+), 20 deletions(-)
> > +
> > +diff --git a/modules/pam_namespace/namespace.init b/modules/pam_namesp=
ace/namespace.init
> > +index 67d4aa2..8782178 100755
> > +--- a/modules/pam_namespace/namespace.init
> > ++++ b/modules/pam_namespace/namespace.init
> > +@@ -1,25 +1,43 @@
> > + #!/bin/sh
> > +-# It receives polydir path as $1, the instance path as $2,
> > +-# a flag whether the instance dir was newly created (0 - no, 1 - yes)=
 in $3,
> > +-# and user name in $4.
> > ++# It receives as arguments:
> > ++# - $1 polydir path (see WARNING below)
> > ++# - $2 instance path (see WARNING below)
> > ++# - $3 flag whether the instance dir was newly created (0 - no, 1 - y=
es)
> > ++# - $4 user name
> > ++# - $5 flag whether the polydir path ($1) is safe (0 - unsafe, 1 -saf=
e)
> > ++# - $6 flag whether the instance path ($2) is safe (0 - unsafe, 1 - s=
afe)
> > ++#
> > ++# WARNING: This script is invoked with full root privileges. Accessin=
g
> > ++# the polydir ($1) and the instance ($2) directories in this context =
may be
> > ++# extremely dangerous as those can be under user control. The flags $=
5 and $6
> > ++# are provided to let you know if all the segments part of the path (=
except the
> > ++# last one) are owned by root and are writable by root only. If the p=
ath does
> > ++# not meet these criteria, you expose yourself to possible symlink at=
tacks when
> > ++# accessing these path.
> > ++# However, even if the path components are safe, the content of the
> > ++# directories may still be owned/writable by a user, so care must be =
taken!
> > + #
> > + # The following section will copy the contents of /etc/skel if this i=
s a
> > + # newly created home directory.
> > +-if [ "$3" =3D 1 ]; then
> > +-        # This line will fix the labeling on all newly created direct=
ories
> > +-        [ -x /sbin/restorecon ] && /sbin/restorecon "$1"
> > +-        user=3D"$4"
> > +-        passwd=3D$(getent passwd "$user")
> > +-        homedir=3D$(echo "$passwd" | cut -f6 -d":")
> > +-        if [ "$1" =3D "$homedir" ]; then
> > +-                gid=3D$(echo "$passwd" | cut -f4 -d":")
> > +-                cp -rT /etc/skel "$homedir"
> > +-                chown -R "$user":"$gid" "$homedir"
> > +-                mask=3D$(awk '/^UMASK/{gsub("#.*$", "", $2); print $2=
; exit}' /etc/login.defs)
> > +-                mode=3D$(printf "%o" $((0777 & ~$mask)))
> > +-                chmod ${mode:-700} "$homedir"
> > +-                [ -x /sbin/restorecon ] && /sbin/restorecon -R "$home=
dir"
> > +-        fi
> > +-fi
> > +
> > ++# Executes only if the polydir path is safe
> > ++if [ "$5" =3D 1 ]; then
> > ++
> > ++    if [ "$3" =3D 1 ]; then
> > ++            # This line will fix the labeling on all newly created di=
rectories
> > ++            [ -x /sbin/restorecon ] && /sbin/restorecon "$1"
> > ++            user=3D"$4"
> > ++            passwd=3D$(getent passwd "$user")
> > ++            homedir=3D$(echo "$passwd" | cut -f6 -d":")
> > ++            if [ "$1" =3D "$homedir" ]; then
> > ++                    gid=3D$(echo "$passwd" | cut -f4 -d":")
> > ++                    cp -rT /etc/skel "$homedir"
> > ++                    chown -R "$user":"$gid" "$homedir"
> > ++                    mask=3D$(sed -E -n 's/^UMASK[[:space:]]+([^#[:spa=
ce:]]+).*/\1/p' /etc/login.defs)
> > ++                    mode=3D$(printf "%o" $((0777 & ~mask)))
> > ++                    chmod ${mode:-700} "$homedir"
> > ++                    [ -x /sbin/restorecon ] && /sbin/restorecon -R "$=
homedir"
> > ++            fi
> > ++    fi
> > ++fi
> > + exit 0
> > +diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_names=
pace/pam_namespace.c
> > +index fcd78fd..48d19bf 100644
> > +--- a/modules/pam_namespace/pam_namespace.c
> > ++++ b/modules/pam_namespace/pam_namespace.c
> > +@@ -1462,6 +1462,79 @@ static int check_inst_parent(int dfd, struct in=
stance_data *idata)
> > +       return PAM_SUCCESS;
> > + }
> > +
> > ++/*
> > ++ * Check for a given absolute path that all segments except the last =
one are:
> > ++ * 1. a directory owned by root and not writable by group or others
> > ++ * 2. a symlink owned by root and referencing a directory respecting =
1.
> > ++ * Returns 0 if safe, -1 is unsafe.
> > ++ * If the path is not accessible (does not exist, hidden under a moun=
t...),
> > ++ * returns -1 (unsafe).
> > ++ */
> > ++static int check_safe_path(const char *path, struct instance_data *id=
ata)
> > ++{
> > ++    char *p =3D strdup(path);
> > ++    char *d;
> > ++    char *dir =3D p;
> > ++    struct stat st;
> > ++
> > ++    if (p =3D=3D NULL)
> > ++        return -1;
> > ++
> > ++    /* Check path is absolute */
> > ++    if (p[0] !=3D '/')
> > ++        goto error;
> > ++
> > ++    strip_trailing_slashes(p);
> > ++
> > ++    /* Last segment of the path may be owned by the user */
> > ++    if ((d =3D strrchr(dir, '/')) !=3D NULL)
> > ++        *d =3D '\0';
> > ++
> > ++    while ((d=3Dstrrchr(dir, '/')) !=3D NULL) {
> > ++
> > ++        /* Do not follow symlinks */
> > ++        if (lstat(dir, &st) !=3D 0)
> > ++            goto error;
> > ++
> > ++        if (S_ISLNK(st.st_mode)) {
> > ++            if (st.st_uid !=3D 0) {
> > ++                if (idata->flags & PAMNS_DEBUG)
> > ++                    pam_syslog(idata->pamh, LOG_DEBUG,
> > ++                            "Path deemed unsafe: Symlink %s should be=
 owned by root", dir);
> > ++                goto error;
> > ++            }
> > ++
> > ++            /* Follow symlinks */
> > ++            if (stat(dir, &st) !=3D 0)
> > ++                goto error;
> > ++        }
> > ++
> > ++        if (!S_ISDIR(st.st_mode)) {
> > ++                if (idata->flags & PAMNS_DEBUG)
> > ++                    pam_syslog(idata->pamh, LOG_DEBUG,
> > ++                        "Path deemed unsafe: %s is expected to be a d=
irectory", dir);
> > ++            goto error;
> > ++        }
> > ++
> > ++        if (st.st_uid !=3D 0 ||
> > ++            ((st.st_mode & (S_IWGRP|S_IWOTH)) && !(st.st_mode & S_ISV=
TX))) {
> > ++                if (idata->flags & PAMNS_DEBUG)
> > ++                    pam_syslog(idata->pamh, LOG_DEBUG,
> > ++                        "Path deemed unsafe: %s should be owned by ro=
ot, and not be writable by group or others", dir);
> > ++            goto error;
> > ++        }
> > ++
> > ++        *d =3D '\0';
> > ++    }
> > ++
> > ++    free(p);
> > ++    return 0;
> > ++
> > ++error:
> > ++    free(p);
> > ++    return -1;
> > ++}
> > ++
> > + /*
> > + * Check to see if there is a namespace initialization script in
> > + * the /etc/security directory. If such a script exists
> > +@@ -1510,7 +1583,11 @@ static int inst_init(const struct polydir_s *po=
lyptr, const char *ipath,
> > +                               close_fds_pre_exec(idata);
> > +
> > +                               execle(init_script, init_script,
> > +-                                      polyptr->dir, ipath, newdir?"1"=
:"0", idata->user, NULL, envp);
> > ++                                      polyptr->dir, ipath,
> > ++                                      newdir ? "1":"0", idata->user,
> > ++                                      (check_safe_path(polyptr->dir, =
idata) =3D=3D -1) ? "0":"1",
> > ++                                      (check_safe_path(ipath, idata) =
=3D=3D -1) ? "0":"1",
> > ++                                      NULL, envp);
> > +                                       _exit(1);
> > +                       } else if (pid > 0) {
> > +                               while (((rc =3D waitpid(pid, &status, 0=
)) =3D=3D (pid_t)-1) &&
> > +--
> > +2.50.1
> > +
> > diff --git a/meta/recipes-extended/pam/libpam/CVE-2025-6020-03.patch b/=
meta/recipes-extended/pam/libpam/CVE-2025-6020-03.patch
> > new file mode 100644
> > index 0000000000..bbc18b5032
> > --- /dev/null
> > +++ b/meta/recipes-extended/pam/libpam/CVE-2025-6020-03.patch
> > @@ -0,0 +1,35 @@
> > +From 976c20079358d133514568fc7fd95c02df8b5773 Mon Sep 17 00:00:00 2001
> > +From: "Dmitry V. Levin" <ldv@strace.io>
> > +Date: Tue, 27 May 2025 08:00:00 +0000
> > +Subject: [PATCH] pam_namespace: secure_opendir: do not look at the gro=
up
> > + ownership
> > +
> > +When the directory is not group-writable, the group ownership does
> > +not matter, and when it is group-writable, there should not be any
> > +exceptions for the root group as there is no guarantee that the root
> > +group does not include non-root users.
> > +
> > +Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/comm=
it/976c20079358d133514568fc7fd95c02df8b5773]
> > +CVE: CVE-2025-6020
> > +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > +---
> > + modules/pam_namespace/pam_namespace.c | 3 +--
> > + 1 file changed, 1 insertion(+), 2 deletions(-)
> > +
> > +diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_names=
pace/pam_namespace.c
> > +index 48d19bf..49029c1 100644
> > +--- a/modules/pam_namespace/pam_namespace.c
> > ++++ b/modules/pam_namespace/pam_namespace.c
> > +@@ -213,8 +213,7 @@ static int secure_opendir(const char *path, int op=
m, mode_t mode,
> > +                       if (dfd_next =3D=3D -1)
> > +                               goto error;
> > +               } else if (st.st_uid !=3D 0
> > +-                         || (st.st_gid !=3D 0 && (st.st_mode & S_IWGR=
P))
> > +-                         || (st.st_mode & S_IWOTH)) {
> > ++                         || (st.st_mode & (S_IWGRP|S_IWOTH))) {
> > +                       /* do not follow symlinks on subdirectories */
> > +                       flags |=3D O_NOFOLLOW;
> > +               }
> > +--
> > +2.50.1
> > +
> > diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-e=
xtended/pam/libpam_1.5.2.bb
> > index 567f9741cb..430bf2aa4e 100644
> > --- a/meta/recipes-extended/pam/libpam_1.5.2.bb
> > +++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
> > @@ -29,6 +29,10 @@ SRC_URI =3D "https://github.com/linux-pam/linux-pam/=
releases/download/v${PV}/Linux
> >             file://CVE-2024-22365.patch \
> >             file://CVE-2024-10041-1.patch \
> >             file://CVE-2024-10041-2.patch \
> > +           file://0001-pam_inline-introduce-pam_asprint.patch \
> > +           file://CVE-2025-6020-01.patch \
> > +           file://CVE-2025-6020-02.patch \
> > +           file://CVE-2025-6020-03.patch \
> >             "
> >
> >  SRC_URI[sha256sum] =3D "e4ec7131a91da44512574268f493c6d8ca105c87091691=
b8e9b56ca685d4f94d"
> > --
> > 2.50.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220812): https://lists.openembedded.org/g/openembedde=
d-core/message/220812
> Mute This Topic: https://lists.openembedded.org/mt/114299915/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

