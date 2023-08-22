Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D95EE49A3
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 16:32:25 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.730.1692721939301398148
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 09:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=eZ3Eedaz;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.54, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-52a06f5f556so3226873a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 09:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692721937; x=1693326737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXzFYXdwfr1q4JwL5OeX1/HCw36D9jwLXTVP8rcy4wk=;
        b=eZ3EedazbNNyfMG7bA9LVr7xX9V+4XcoB0rUH19IYtTBlW74ohkyKVXPbWWDZViaOY
         u86zeep+eXsJjjswdNwaj6pLfaVO0E5fKVX/uSiH99r0OylV8WuXR03UbnS3vUlxL4kM
         YY3CtORfkBPZIhrVz4sixePuCO6HcOBWXNnORnMktjBQlffB1D4xYetm+CYK7R6z3/Ti
         QixiuB0E/nRK3TBWA1nbnbKgqqIT4o4hLlLRhAVrOecUmIcdPTA3ZUk05BSV3x+h/0do
         u+ydrzMdIkGES0aGgD/RiVQ/01KjaiqySTUIpA839XR7jZdlVXg4bJbWNLhV8vkmQvQP
         7Qzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692721937; x=1693326737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXzFYXdwfr1q4JwL5OeX1/HCw36D9jwLXTVP8rcy4wk=;
        b=jAweuNPPTPUkmea86ZP+Bpbopg4lwDFy0obSkvkRSa9z7V6oybtkyMXoBT8jn91Ukv
         pakmZQXI9HuHzRmyUG9BM74sQX315J+kOp+FdUv7aKpJUcjGgvYi7vzqxmaZ0mZs16Oj
         zayq5Qz9RyQOSOacFI8p3lxv2wQsPIfudd+rYCwuBbDW7EWEv29VxYMnKlBavskm1ezm
         kBeKDFSINmICrZGH6gwmIfYfPESGVOZRiZiFW8QK+0WEoPBoEjnBNQkuMQJTM4kua8b1
         tMtQAA8oSiQj1AuuPwK7tP/2M9yuD5Tre4x+MjhjRYa/cqpZSvzNCHPWVlwuYTe7hBoY
         XQhA==
X-Gm-Message-State: AOJu0YwpheB4XInQ1wn31QKILPTWKEu8cLsHdi0ktEeLkcHrRPgTRj/d
	0dawKT2Efvyco6ev5AGp4BInkyWa5IyK4/wxBHboZg==
X-Google-Smtp-Source: AGHT+IH6CJjCrXlWG+jrdTMQmIFHrkbaUQyyDHy7hbceUc8bUUQQb1n6wKEcotSBQ7X6+e5t45W63UAOLSAJPvHDAPQ=
X-Received: by 2002:a17:906:209e:b0:99d:dd43:d427 with SMTP id
 30-20020a170906209e00b0099ddd43d427mr8873403ejq.10.1692721937306; Tue, 22 Aug
 2023 09:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230822015557.1791146-1-virendrak@kpit.com>
In-Reply-To: <20230822015557.1791146-1-virendrak@kpit.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 22 Aug 2023 06:32:06 -1000
Message-ID: <CAOSpxdYzTVQHDtZduafvvqODL-1R0b5hrGwuX=ijQ4=nmqPPWg@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] openssh: Fix CVE-2023-38408
To: virendra thakur <thakur.virendra1810@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Virendra Thakur <virendrak@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 16:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186512

On Mon, Aug 21, 2023 at 3:56=E2=80=AFPM virendra thakur
<thakur.virendra1810@gmail.com> wrote:
>
> From: Virendra Thakur <virendrak@kpit.com>
>
> Add patch to fix CVE-2023-38408
>
> Upstream-Status: Backport [https://launchpadlibrarian.net/680920377/opens=
sh_8.2p1-4ubuntu0.9.debian.tar.xz]

launchpadlibrarian.net is not upstream for openssh!

Please send a v2 that references the actual upstream commits.

Thanks,

Steve

>
> Signed-off-by: Virendra Thakur <virendrak@kpit.com>
> ---
>  .../openssh/openssh/CVE-2023-38408-1.patch    |  31 ++++
>  .../openssh/openssh/CVE-2023-38408-3.patch    | 161 ++++++++++++++++++
>  .../openssh/openssh_8.2p1.bb                  |   2 +
>  3 files changed, 194 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38=
408-1.patch
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2023-38=
408-3.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-1.p=
atch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-1.patch
> new file mode 100644
> index 0000000000..3d7c7bd357
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-1.patch
> @@ -0,0 +1,31 @@
> +From 892506b13654301f69f9545f48213fc210e5c5cc Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Wed, 19 Jul 2023 13:55:53 +0000
> +Subject: [PATCH] upstream: terminate process if requested to load a PKCS=
#11
> + provider
> +
> +that isn't a PKCS#11 provider; from / ok markus@
> +
> +OpenBSD-Commit-ID: 39532cf18b115881bb4cfaee32084497aadfa05c
> +CVE: CVE-2023-38408
> +Upstream-Status: Backport [https://launchpadlibrarian.net/680920377/open=
ssh_8.2p1-4ubuntu0.9.debian.tar.xz]
> +Signed-off-by: Virendra Thakur <virendrak@kpit.com>
> +---
> + ssh-pkcs11.c | 8 +++-----
> + 1 file changed, 3 insertions(+), 5 deletions(-)
> +
> +--- a/ssh-pkcs11.c
> ++++ b/ssh-pkcs11.c
> +@@ -1504,10 +1504,8 @@ pkcs11_register_provider(char *provider_
> +               error("dlopen %s failed: %s", provider_id, dlerror());
> +               goto fail;
> +       }
> +-      if ((getfunctionlist =3D dlsym(handle, "C_GetFunctionList")) =3D=
=3D NULL) {
> +-              error("dlsym(C_GetFunctionList) failed: %s", dlerror());
> +-              goto fail;
> +-      }
> ++      if ((getfunctionlist =3D dlsym(handle, "C_GetFunctionList")) =3D=
=3D NULL)
> ++              fatal("dlsym(C_GetFunctionList) failed: %s", dlerror());
> +       p =3D xcalloc(1, sizeof(*p));
> +       p->name =3D xstrdup(provider_id);
> +       p->handle =3D handle;
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-3.p=
atch b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-3.patch
> new file mode 100644
> index 0000000000..6a94b8715c
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2023-38408-3.patch
> @@ -0,0 +1,161 @@
> +Backport of:
> +
> +From 29ef8a04866ca14688d5b7fed7b8b9deab851f77 Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Wed, 19 Jul 2023 14:02:27 +0000
> +Subject: [PATCH] upstream: Ensure FIDO/PKCS11 libraries contain expected
> + symbols
> +
> +This checks via nlist(3) that candidate provider libraries contain one
> +of the symbols that we will require prior to dlopen(), which can cause
> +a number of side effects, including execution of constructors.
> +
> +Feedback deraadt; ok markus
> +
> +OpenBSD-Commit-ID: 1508a5fbd74e329e69a55b56c453c292029aefbe
> +CVE: CVE-2023-38408
> +Upstream-Status: Backport [https://launchpadlibrarian.net/680920377/open=
ssh_8.2p1-4ubuntu0.9.debian.tar.xz]
> +Signed-off-by: Virendra Thakur <virendrak@kpit.com>
> +---
> + misc.c       | 78 +++++++++++++++++++++++++++++++++++++++++++++++++++-
> + misc.h       |  3 +-
> + ssh-pkcs11.c |  6 +++-
> + ssh-sk.c     |  8 ++++--
> + 4 files changed, 89 insertions(+), 6 deletions(-)
> +
> +--- a/misc.c
> ++++ b/misc.c
> +@@ -28,6 +28,7 @@
> +
> + #include <sys/types.h>
> + #include <sys/ioctl.h>
> ++#include <sys/mman.h>
> + #include <sys/socket.h>
> + #include <sys/stat.h>
> + #include <sys/time.h>
> +@@ -41,6 +42,9 @@
> + #ifdef HAVE_POLL_H
> + #include <poll.h>
> + #endif
> ++#ifdef HAVE_NLIST_H
> ++#include <nlist.h>
> ++#endif
> + #include <signal.h>
> + #include <stdarg.h>
> + #include <stdio.h>
> +@@ -2314,3 +2318,75 @@ ssh_signal(int signum, sshsig_t handler)
> +       }
> +       return osa.sa_handler;
> + }
> ++
> ++/*
> ++ * Returns zero if the library at 'path' contains symbol 's', nonzero
> ++ * otherwise.
> ++ */
> ++int
> ++lib_contains_symbol(const char *path, const char *s)
> ++{
> ++#ifdef HAVE_NLIST_H
> ++      struct nlist nl[2];
> ++      int ret =3D -1, r;
> ++
> ++      memset(nl, 0, sizeof(nl));
> ++      nl[0].n_name =3D xstrdup(s);
> ++      nl[1].n_name =3D NULL;
> ++      if ((r =3D nlist(path, nl)) =3D=3D -1) {
> ++              error("nlist failed for %s", path);
> ++              goto out;
> ++      }
> ++      if (r !=3D 0 || nl[0].n_value =3D=3D 0 || nl[0].n_type =3D=3D 0) =
{
> ++              error("library %s does not contain symbol %s", path, s);
> ++              goto out;
> ++      }
> ++      /* success */
> ++      ret =3D 0;
> ++ out:
> ++      free(nl[0].n_name);
> ++      return ret;
> ++#else /* HAVE_NLIST_H */
> ++      int fd, ret =3D -1;
> ++      struct stat st;
> ++      void *m =3D NULL;
> ++      size_t sz =3D 0;
> ++
> ++      memset(&st, 0, sizeof(st));
> ++      if ((fd =3D open(path, O_RDONLY)) < 0) {
> ++              error("open %s: %s", path, strerror(errno));
> ++              return -1;
> ++      }
> ++      if (fstat(fd, &st) !=3D 0) {
> ++              error("fstat %s: %s", path, strerror(errno));
> ++              goto out;
> ++      }
> ++      if (!S_ISREG(st.st_mode)) {
> ++              error("%s is not a regular file", path);
> ++              goto out;
> ++      }
> ++      if (st.st_size < 0 ||
> ++          (size_t)st.st_size < strlen(s) ||
> ++          st.st_size >=3D INT_MAX/2) {
> ++              error("%s bad size %lld", path, (long long)st.st_size);
> ++              goto out;
> ++      }
> ++      sz =3D (size_t)st.st_size;
> ++      if ((m =3D mmap(NULL, sz, PROT_READ, MAP_PRIVATE, fd, 0)) =3D=3D =
MAP_FAILED ||
> ++          m =3D=3D NULL) {
> ++              error("mmap %s: %s", path, strerror(errno));
> ++              goto out;
> ++      }
> ++      if (memmem(m, sz, s, strlen(s)) =3D=3D NULL) {
> ++              error("%s does not contain expected string %s", path, s);
> ++              goto out;
> ++      }
> ++      /* success */
> ++      ret =3D 0;
> ++ out:
> ++      if (m !=3D NULL && m !=3D MAP_FAILED)
> ++              munmap(m, sz);
> ++      close(fd);
> ++      return ret;
> ++#endif /* HAVE_NLIST_H */
> ++}
> +--- a/misc.h
> ++++ b/misc.h
> +@@ -86,6 +86,7 @@ const char *atoi_err(const char *, int *
> + int    parse_absolute_time(const char *, uint64_t *);
> + void   format_absolute_time(uint64_t, char *, size_t);
> + int    path_absolute(const char *);
> ++int    lib_contains_symbol(const char *, const char *);
> +
> + void   sock_set_v6only(int);
> +
> +--- a/ssh-pkcs11.c
> ++++ b/ssh-pkcs11.c
> +@@ -1499,6 +1499,10 @@ pkcs11_register_provider(char *provider_
> +                   __func__, provider_id);
> +               goto fail;
> +       }
> ++      if (lib_contains_symbol(provider_id, "C_GetFunctionList") !=3D 0)=
 {
> ++              error("provider %s is not a PKCS11 library", provider_id)=
;
> ++              goto fail;
> ++      }
> +       /* open shared pkcs11-library */
> +       if ((handle =3D dlopen(provider_id, RTLD_NOW)) =3D=3D NULL) {
> +               error("dlopen %s failed: %s", provider_id, dlerror());
> +--- a/ssh-sk.c
> ++++ b/ssh-sk.c
> +@@ -119,10 +119,12 @@ sshsk_open(const char *path)
> + #endif
> +               return ret;
> +       }
> +-      if ((ret->dlhandle =3D dlopen(path, RTLD_NOW)) =3D=3D NULL) {
> +-              error("Provider \"%s\" dlopen failed: %s", path, dlerror(=
));
> ++      if (lib_contains_symbol(path, "sk_api_version") !=3D 0) {
> ++              error("provider %s is not an OpenSSH FIDO library", path)=
;
> +               goto fail;
> +       }
> ++      if ((ret->dlhandle =3D dlopen(path, RTLD_NOW)) =3D=3D NULL)
> ++              fatal("Provider \"%s\" dlopen failed: %s", path, dlerror(=
));
> +       if ((ret->sk_api_version =3D dlsym(ret->dlhandle,
> +           "sk_api_version")) =3D=3D NULL) {
> +               error("Provider \"%s\" dlsym(sk_api_version) failed: %s",
> diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_8.2p1.bb
> index 79dba121ff..98cabbe937 100644
> --- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> @@ -27,6 +27,8 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH=
/portable/openssh-${PV}.tar
>             file://CVE-2020-14145.patch \
>             file://CVE-2021-28041.patch \
>             file://CVE-2021-41617.patch \
> +           file://CVE-2023-38408-1.patch \
> +           file://CVE-2023-38408-3.patch \
>             "
>  SRC_URI[md5sum] =3D "3076e6413e8dbe56d33848c1054ac091"
>  SRC_URI[sha256sum] =3D "43925151e6cf6cee1450190c0e9af4dc36b41c12737619ed=
ff8bcebdff64e671"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186488): https://lists.openembedded.org/g/openembedde=
d-core/message/186488
> Mute This Topic: https://lists.openembedded.org/mt/100887090/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

