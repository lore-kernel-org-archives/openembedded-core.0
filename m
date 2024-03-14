Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375ABC5475B
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 04:14:33 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.4032.1710389667382168044
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 21:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bIfZbjSD;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6ddf26eba3cso362874a34.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 21:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710389666; x=1710994466; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3putdVTZmE0tKjay9/ytgD7DjyH1eXXW66AsRHMGrwg=;
        b=bIfZbjSDfzEef4ka+VB/yjawhf2Nb1sMRRq8ONWLTW2GBoIo8qeR45bs8FmFEzjXSe
         h7DwdttbmGQ8kNl7r4LA3+VH6iEXzkWNdJlG59E1v/lehI+2YMWqWo6JfRN70tfgzVKb
         q+Szd/A7tXuU+j5rYOJuF13ICwRnPmD9zc8gAqxfWh1JlNlxN2BAMIrmtNLdsaTHWI1w
         +4vuEQF+lcpzufi51CpkC2KpVWB/1A2+SvIr5OYjO31ijbS37RwguV6O81gEpHjW5Zke
         2VSAhDwcsEz/vMhYLHNNUE8nDr7lpEXe4V4478kqOL3PZiwKzoz/dc70UpmTrl+X2a1J
         RVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710389666; x=1710994466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3putdVTZmE0tKjay9/ytgD7DjyH1eXXW66AsRHMGrwg=;
        b=lHvb118UKfUPwo3HX4bxVlxXQNF6EQ1HPc3Xvl7ooomca3qHUyyU3P6tgsr6juMjUb
         SzGeJKTE5qeg4sGM6Ek+hHdZwLh5P7Lp3/pipM3zYFMMWzMD4F/NByIpySeYgKgMRjVU
         2JdJ3Viu4mZdgz/jpmBJ0AZiGgXW9yfKYzV6ZD+O4rSdqPXEuDb30aheSf/m63eGMwQ8
         2vflVgaiehCxQ/Sdi5mtVSh/FPmm3DAthdIMU41+nn55dPsyJzf5Q8vmeV0KJjw6KKsk
         Yk71iuUewKSXKrEBHXwsZcGzpLi2FbQxYq5hlCoLsoVbmE+3LAVKnssH6ZBNvs//wlvY
         gjcA==
X-Gm-Message-State: AOJu0YycJAGaqbosiE1ry0Ew3Ri7AOZh31ZFzbd4ou7Bk5vo2PPVQHKV
	5QWDNLRX+YClDrSh3D7Nrctqms4yh4CjqACmfma5y9q2PAyMRDHRbrj2Bo6bfGyPHOOGOWUHDMV
	18dvx/NSMDXeAuZZ3ZsUn3Dyp29c=
X-Google-Smtp-Source: AGHT+IFyCpKwshroG+LxKtBmUvFFSz51sx7Pjoax/fb++uQlP9jQI5CWYSQTobHNVupl8SdW782uGWQTS/f9GdwLG3Y=
X-Received: by 2002:a05:6870:4308:b0:221:c58f:8ff with SMTP id
 w8-20020a056870430800b00221c58f08ffmr831515oah.2.1710389666495; Wed, 13 Mar
 2024 21:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240313173336.3900178-1-alex@linutronix.de> <20240313173336.3900178-9-alex@linutronix.de>
In-Reply-To: <20240313173336.3900178-9-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Mar 2024 21:14:00 -0700
Message-ID: <CAMKF1sqNh=x7KxChBh=f2rQRceeVuH6c8-T25GkcT6j7E4WKSQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 09/21] libpam: update 1.5.3 -> 1.6.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 04:14:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197096

fails to build with musl

| ../../../Linux-PAM-1.6.0/modules/pam_namespace/pam_namespace.c:649:41:
error: use of undeclared identifier 'SIZE_MAX'
|   649 |         if (count > UINT_MAX || count > SIZE_MAX / sizeof(uid_t))=
 {
|       |                                         ^
| 1 error generated.
| make[3]: *** [Makefile:807: pam_namespace.lo] Error 1

On Wed, Mar 13, 2024 at 10:33=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...place-use-of-termio.h-with-termios.h.patch | 39 -------------------
>  .../pam/libpam/libpam-xtests.patch            | 22 +++++++----
>  .../pam/{libpam_1.5.3.bb =3D> libpam_1.6.0.bb}  |  3 +-
>  3 files changed, 16 insertions(+), 48 deletions(-)
>  delete mode 100644 meta/recipes-extended/pam/libpam/0001-examples-Replac=
e-use-of-termio.h-with-termios.h.patch
>  rename meta/recipes-extended/pam/{libpam_1.5.3.bb =3D> libpam_1.6.0.bb} =
(97%)
>
> diff --git a/meta/recipes-extended/pam/libpam/0001-examples-Replace-use-o=
f-termio.h-with-termios.h.patch b/meta/recipes-extended/pam/libpam/0001-exa=
mples-Replace-use-of-termio.h-with-termios.h.patch
> deleted file mode 100644
> index 95c437df4f1..00000000000
> --- a/meta/recipes-extended/pam/libpam/0001-examples-Replace-use-of-termi=
o.h-with-termios.h.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 9b96fcfa5748934b8b6a4db4ee25a5e3165905c0 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 1 Jul 2023 07:48:17 -0700
> -Subject: [PATCH] examples: Replace use of termio.h with termios.h
> -
> -Fixes build with musl and makes it portable
> -
> -Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit=
/5374f677e4cae669eb9accf2449178b602e8a40a]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - examples/tty_conv.c | 5 +++--
> - 1 file changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/examples/tty_conv.c b/examples/tty_conv.c
> -index 23f0684..db22500 100644
> ---- a/examples/tty_conv.c
> -+++ b/examples/tty_conv.c
> -@@ -6,7 +6,8 @@
> - #include <string.h>
> - #include <errno.h>
> - #include <unistd.h>
> --#include <termio.h>
> -+#include <termios.h>
> -+#include <sys/ioctl.h>
> - #include <security/pam_appl.h>
> -
> - /***************************************
> -@@ -16,7 +17,7 @@
> -  ***************************************/
> - static void echoOff(int fd, int off)
> - {
> --    struct termio tty;
> -+    struct termios tty;
> -     if (ioctl(fd, TCGETA, &tty) < 0)
> -     {
> -         fprintf(stderr, "TCGETA failed: %s\n", strerror(errno));
> ---
> -2.41.0
> -
> diff --git a/meta/recipes-extended/pam/libpam/libpam-xtests.patch b/meta/=
recipes-extended/pam/libpam/libpam-xtests.patch
> index ea145899b49..f2dafa72a5b 100644
> --- a/meta/recipes-extended/pam/libpam/libpam-xtests.patch
> +++ b/meta/recipes-extended/pam/libpam/libpam-xtests.patch
> @@ -1,13 +1,21 @@
> -This patch is used to create a new sub package libpam-xtests to do more =
checks.
> +From 060726f7e60c8ecb5bf50fd776910b290d9a0a69 Mon Sep 17 00:00:00 2001
> +From: Kang Kai <kai.kang@windriver.com>
> +Date: Tue, 19 Jul 2011 17:08:31 +0800
> +Subject: [PATCH] This patch is used to create a new sub package libpam-x=
tests
> + to do more checks.
>
>  Upstream-Status: Pending
>
>  Signed-off-by: Kang Kai <kai.kang@windriver.com>
> -Index: Linux-PAM-1.3.0/xtests/Makefile.am
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Linux-PAM-1.3.0.orig/xtests/Makefile.am
> -+++ Linux-PAM-1.3.0/xtests/Makefile.am
> -@@ -7,7 +7,7 @@ AM_CFLAGS =3D -DLIBPAM_COMPILE -I$(top_src
> +---
> + xtests/Makefile.am | 17 ++++++++++++++++-
> + 1 file changed, 16 insertions(+), 1 deletion(-)
> +
> +diff --git a/xtests/Makefile.am b/xtests/Makefile.am
> +index acf9746..9826c9f 100644
> +--- a/xtests/Makefile.am
> ++++ b/xtests/Makefile.am
> +@@ -8,7 +8,7 @@ AM_CFLAGS =3D -DLIBPAM_COMPILE -I$(top_srcdir)/libpam/in=
clude \
>   LDADD =3D $(top_builddir)/libpam/libpam.la \
>         $(top_builddir)/libpam_misc/libpam_misc.la
>
> @@ -16,7 +24,7 @@ Index: Linux-PAM-1.3.0/xtests/Makefile.am
>
>   EXTRA_DIST =3D run-xtests.sh tst-pam_dispatch1.pamd tst-pam_dispatch2.p=
amd \
>         tst-pam_dispatch3.pamd tst-pam_dispatch4.pamd \
> -@@ -51,3 +51,18 @@ EXTRA_PROGRAMS =3D $(XTESTS)
> +@@ -55,3 +55,18 @@ EXTRA_PROGRAMS =3D $(XTESTS)
>
>   xtests: $(XTESTS) run-xtests.sh
>         "$(srcdir)"/run-xtests.sh "$(srcdir)" ${XTESTS} ${NOSRCTESTS}
> diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-ext=
ended/pam/libpam_1.6.0.bb
> similarity index 97%
> rename from meta/recipes-extended/pam/libpam_1.5.3.bb
> rename to meta/recipes-extended/pam/libpam_1.6.0.bb
> index 4dd98906064..bbea008d552 100644
> --- a/meta/recipes-extended/pam/libpam_1.5.3.bb
> +++ b/meta/recipes-extended/pam/libpam_1.6.0.bb
> @@ -21,12 +21,11 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/Linux=
-PAM-${PV}.tar.xz \
>             file://pam.d/common-session-noninteractive \
>             file://pam.d/other \
>             file://libpam-xtests.patch \
> -           file://0001-examples-Replace-use-of-termio.h-with-termios.h.p=
atch \
>             file://run-ptest \
>             file://pam-volatiles.conf \
>             "
>
> -SRC_URI[sha256sum] =3D "7ac4b50feee004a9fa88f1dfd2d2fa738a82896763050cd7=
73b3c54b0a818283"
> +SRC_URI[sha256sum] =3D "fff4a34e5bbee77e2e8f1992f27631e2329bcbf8a0563dde=
b5c3389b4e3169ad"
>
>  DEPENDS =3D "bison-native flex-native cracklib libxml2-native virtual/cr=
ypt"
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197061): https://lists.openembedded.org/g/openembedde=
d-core/message/197061
> Mute This Topic: https://lists.openembedded.org/mt/104910676/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

