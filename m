Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBE7EA8536
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 16:37:34 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42345.1772987844661235192
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 09:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z4H0LT7e;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a133502accso3714872e87.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 09:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1772987842; cv=none;
        d=google.com; s=arc-20240605;
        b=e5BTJsmdeDUVClg+JN7T7muIpATKEMoeDADp33OPQLnUiliWJ0MlQkwAwS3xkm5A1t
         C5VsUbIJPQHGaJo4Eaq1pn2TNmcVTFfeRHRi4j7m011uBGLb1MgRSGso5BbhwLlkuZ+C
         kj763TMCsk7tD6Zf0kePDcIcKNDvZcJ1cYbErOEqNd5wfyzsXQ8Qo2NxMV7BtezMAOBw
         PnqTqIfLE+7Hl2G1AbX7peNFylCJu3FqjX3ZMufDDk+mtRRe0NacVC52Ocyys7kcBXRE
         Xw/JWjA3JT5vk9KXL7oHy1tpNIFSmrXKnopEqSZU1jcpO32s4aylrK5eq4+MvMsKLrOD
         zQxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=37QPNuZjuuJP5UXMYCTfIWodm6v1PS9/t37VmmOy0GU=;
        fh=lokdjCdjsyY6KjBfIJktI8BQ5vhRQ0H3tAEZGfjN5Hs=;
        b=PGTKxJaaUbs5vy4dA8KWl8SdOtBy5Ggz8lX+VQvCxOgN6J8/nMDvAi+aTpgmzTFMoH
         7YltLNP3r06P8lzLOXbIxenzbvssykv/RqiuB3Lj3VAJWmah7Y5jbkGCKFQO1jqIvgE6
         Jk/YuyBiAkKNf7PSR5OpVyLDEI0Mt0MCp0itLGG8ZHSQziBDOTDWRgXlCptPlYtYs+VV
         H9S7JwXKi80PUdYOdcLSHNslWrkLSVSpBwieeBySGCJSSC7W/3SfaBk1HTy+aBhHx816
         Up+y3TvpVArWs3nziXrCakmr6MGcK4tEQNL4/Ac8WdyQpXSVamM649vAgcRiYpN0/2Rv
         0knQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772987842; x=1773592642; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37QPNuZjuuJP5UXMYCTfIWodm6v1PS9/t37VmmOy0GU=;
        b=Z4H0LT7eKttFpf1CkdpC2Iy+CZQcpB8Sfq4K9Nu2mKY9eT3Zqxc7/XsTu4T+rpAwhU
         tBTXEs+ISvH/lLYMhvt6GUV8Iy3y32kW9zCwG/Ppiy76wPuMge3f5LZNh1u64GRFF0KC
         1+8Jg14YGOUlUdl6zDIZhgeeh1sRHGNWIJ5m+ATwecICxYizygVPi5i2iGcoe76QqKB4
         io9+IcaUU/2MydDIwwH1iJvHQ6aFRxGesIlZOiqXEBOBkeJv6FsqjtJ4xqf+VL+M38y5
         /8ASDItF0tk/LJVZZj0sQndIKocy3RH0fRm0Rs/z8UNgsFjlCZSRxgtmg9Kjt8NuesQB
         O8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772987842; x=1773592642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=37QPNuZjuuJP5UXMYCTfIWodm6v1PS9/t37VmmOy0GU=;
        b=sW4rrJ5nDKDZvosNFEU2Ct/aX3wwI/QxtziUCCPLWeq2k+1ZCgRgl+iZlqJJjelRsY
         pdEpJc300vfr35WcVEh+thYOTyE4uWUhE3Sjh1Rh5FTEkXDon1L3EteCCuPgQHBJJytc
         OGNW8wPjbFHVj1T7pFuPzRUb8X92kxUH83G2ZLj/9VdBezGB6FaZG25I/Qazn1ZSp9LR
         LWlO4wCnLdjJ2Zjg9EqHFjt6obe4I8qSyuWtSfkyyJMNtJ+ZEepKPORoH1sDP3uL0RZI
         xJsSn5h7vRNQqvmPOrgbAPvFeHjAu3IJ3UWgRNWuB7YRQbfhCK4OOUjpArPf0F0Zmq0Y
         N6wg==
X-Gm-Message-State: AOJu0YzQFljXwgUDL2nXJJgh4U/9CG1pt9vQ2jB1R1tcUShif6lzpJi9
	O1oVkn3qr1v48mZ68XHRAr9J3CIiR+EmjnBPqT+FZ35odk4jsL6fuoZFAfCYP/5KUA29X9TD1mW
	ae9M7QxQrJBis9UCsTyFRP9TFS7hFPeU=
X-Gm-Gg: ATEYQzyWbSlHTnjAU0TqFdCyTzx8Li7WOWI0DpWFxsTLfZ3k3Q7HtYrZp83naFSuGRd
	0vnjtA4npIzDwxKCPazGlH/wE2iLDwF4CmBMurv9EZD+n4sC4uF8xDobyHOmbinzEtc0B/bUW2k
	pDIanuBsXuJYM62uCLCH6R4AkrTKhZt4opLR6XCpblrBTtDRsvdPxIEjHz8ONNY5SnKxgkMXOFn
	agqyyjxh4rI6UMbrunuJowuvH0CYdFzvnjNECQ5mO3dLw4qqg5RIOhI2BfPDnxKaLXAzRn+PDVb
	CfVLTdVA/Q==
X-Received: by 2002:a05:6512:24c9:20b0:5a1:3447:ac38 with SMTP id
 2adb3069b0e04-5a13caaeacdmr2045911e87.2.1772987842094; Sun, 08 Mar 2026
 09:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com> <20260308150834.2508331-3-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260308150834.2508331-3-Hemanth.KumarMD@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 8 Mar 2026 17:37:09 +0100
X-Gm-Features: AaiRm51pq4MoBC5NDI-XJKu-0uoDqenpTdf_UZyl0xwFrWEKPJ2yzFVr8I8JY3Q
Message-ID: <CA+chaQcneoNBogdCZmZB3LCE-cVErs2-4NoNtYUGgK+REEBxLg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/7] pseudo: fix for build with glibc-2.43
To: Hemanth.KumarMD@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com, 
	Randy.MacLeod@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 16:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232665

Hi,

this is already merged in the repo and there is SRCREV bump which
includes that change from Richard in master-next.

Regards,

On Sun, Mar 8, 2026 at 4:09=E2=80=AFPM Hemanth Kumar M D via
lists.openembedded.org
<Hemanth.KumarMD=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Martin Jansa <martin.jansa@gmail.com>
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  ...01-openat2-use-const-struct-open_how.patch | 54 +++++++++++++++++++
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
>  2 files changed, 55 insertions(+)
>  create mode 100644 meta/recipes-devtools/pseudo/files/0001-openat2-use-c=
onst-struct-open_how.patch
>
> diff --git a/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-st=
ruct-open_how.patch b/meta/recipes-devtools/pseudo/files/0001-openat2-use-c=
onst-struct-open_how.patch
> new file mode 100644
> index 0000000000..eda2593bdf
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-op=
en_how.patch
> @@ -0,0 +1,54 @@
> +From d17159194e94b5150600c333a5e2ad46fda6291e Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <martin.jansa@gmail.com>
> +Date: Thu, 5 Mar 2026 17:53:34 +0100
> +Subject: [PATCH] openat2: use const struct open_how
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +To match
> +https://sourceware.org/cgit/glibc/commit/?id=3D0f0a5cd338998f4b603f52f3c=
e2163df0db7b814
> +
> +Otherwise it fails to build with glibc-2.43:
> +
> +In file included from pseudo_wrappers.c:300:
> +pseudo_wrapfuncs.c: At top level:
> +pseudo_wrapfuncs.c:11537:1: error: conflicting types for =E2=80=98openat=
2=E2=80=99; have =E2=80=98int(int,  const char *, struct open_how *, size_t=
)=E2=80=99 {aka =E2=80=98int(int,  const char *, struct open_how *, long un=
signed int)=E2=80=99}
> +11537 | openat2(int dirfd, const char *path, struct open_how *how, size_=
t size) {
> +      | ^~~~~~~
> +In file included from /usr/include/bits/fcntl-linux.h:492,
> +                 from /usr/include/bits/fcntl.h:61,
> +                 from /usr/include/fcntl.h:35,
> +                 from pseudo_wrappers.c:23:
> +/usr/include/bits/fcntl-linux-fortify.h:36:1: note: previous definition =
of =E2=80=98openat2=E2=80=99 with type =E2=80=98int(int,  const char *, con=
st struct open_how *, long unsigned int)=E2=80=99
> +   36 | openat2 (int __dfd, const char *__filename, const struct open_ho=
w *__how,
> +      | ^~~~~~~
> +make: *** [Makefile:162: pseudo_wrappers.o] Error 1
> +
> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> +Upstream-Status: Pending
> +---
> + ports/linux/openat2/guts/openat2.c | 2 +-
> + ports/linux/openat2/wrapfuncs.in   | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/ports/linux/openat2/guts/openat2.c b/ports/linux/openat2/gu=
ts/openat2.c
> +index da01b31..366fb95 100644
> +--- a/ports/linux/openat2/guts/openat2.c
> ++++ b/ports/linux/openat2/guts/openat2.c
> +@@ -4,7 +4,7 @@
> +  *
> +  * SPDX-License-Identifier: LGPL-2.1-only
> +  *
> +- * int openat2(int dirfd, const char *path, struct open_how *how, size_=
t size)
> ++ * int openat2(int dirfd, const char *path, const struct open_how *how,=
 size_t size)
> +  *    int rc =3D -1;
> +  */
> +
> +diff --git a/ports/linux/openat2/wrapfuncs.in b/ports/linux/openat2/wrap=
funcs.in
> +index 96ae8a7..2f1e716 100644
> +--- a/ports/linux/openat2/wrapfuncs.in
> ++++ b/ports/linux/openat2/wrapfuncs.in
> +@@ -1 +1 @@
> +-int openat2(int dirfd, const char *path, struct open_how *how, size_t s=
ize);
> ++int openat2(int dirfd, const char *path, const struct open_how *how, si=
ze_t size);
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-de=
vtools/pseudo/pseudo_git.bb
> index a26a205a16..b34525055d 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -1,6 +1,7 @@
>  require pseudo.inc
>
>  SRC_URI =3D "git://git.yoctoproject.org/pseudo;branch=3Dmaster;protocol=
=3Dhttps \
> +           file://0001-openat2-use-const-struct-open_how.patch \
>             file://fallback-passwd \
>             file://fallback-group \
>             "
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232653): https://lists.openembedded.org/g/openembedde=
d-core/message/232653
> Mute This Topic: https://lists.openembedded.org/mt/118204632/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

