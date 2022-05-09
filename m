Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DF5C4332F
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 17:05:29 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web09.114.1652115927989289873
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 10:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qa9cTjMT;
 spf=pass (domain: gmail.com, ip: 209.85.222.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id 185so1919287qke.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 10:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CEfOu2ug5D1hEue/w9LzNheDI1bK0/uq/8td5gy+X/U=;
        b=Qa9cTjMT5qNQHCyI2D+RxXivPrldx3YiVIzLrbzCsZgGekSMMSd9LLv9OwqrGyfLeI
         0EZP+1cjeentIUo9bFHo2xRo0liMIT7dd9gzKM3GjE4FT5o+LjeNKxy0drkMi0NyReBO
         Qtl8m2wtyZ+rZPsqtBWa3biT11pYA6GvLZDae6wqIun0p19fGxBAz8D4UZd/Bj2G8HIS
         N2Ts8B1gRmNY9oAAU/5uxeQtbg0UWEWIWIjm+Y9iaNUz08uwdn4JvhZ2WbYMxKMmPd6h
         bilWtSKxcfeWuvGq0DQRmetQFrkqLTI7lY/1+FcEaJo1Ua10NfAGW/+KGp7AkRCLIWxN
         Nk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CEfOu2ug5D1hEue/w9LzNheDI1bK0/uq/8td5gy+X/U=;
        b=7NE2py4395gFFh6i0DI6jPQpcOCStfLd0vs7JPY4hmISIfXh8MWm/TqjlgQSGjCN7D
         QgSIreQDBx1Y5TKjyn8OxbEKuQDitszRY8sdmDtm13I1WVhKu/S2DHQulyRHtckBLPGZ
         mmi/pcIPLuASPuXyLK4T1tP7RV3p4S3BXdZYSYeSbdpZffh6oRjE+44AbJMitA03XHVk
         kJv0uz+Wlt8Y198hFJ12Uj4+JylPAQRn0U7uYZb4FkKY2y0D+lPA9Mm9CNHAdxGDB0Ef
         1LUD1xWBbfT/PM545S7kDXqF4UvvzvlIcKKZnnTmQzjHnoLdxnMlX/PRjhdBjJqrUT//
         oRKQ==
X-Gm-Message-State: AOAM532DzvD99Gt8/fnIR8ZXF4JENTlhdx7vJpZQ+FPjIJ31qaKDO4NW
	PxXE4+TLFqrlr8guvY5CtA3DIetr53/ngfccyPs=
X-Google-Smtp-Source: 
 ABdhPJy7uzx7YgYa02NZWKsrWw4d8Wgz0tBJe9MQItF2lQhVhHMsDP12Bye5DMHNhTsJyuXi8oh66MFPfgquDaOT0g4=
X-Received: by 2002:a05:620a:44d0:b0:6a0:3f5a:d810 with SMTP id
 y16-20020a05620a44d000b006a03f5ad810mr12747645qkp.72.1652115926892; Mon, 09
 May 2022 10:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220509072042.9829-1-Riyaz.Khan@kpit.com>
In-Reply-To: <20220509072042.9829-1-Riyaz.Khan@kpit.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 May 2022 10:05:00 -0700
Message-ID: 
 <CAMKF1sqQUsErjzV87bwrAm-xDSH93pC8T5yuezKQ0+DJwXjC=Q@mail.gmail.com>
Subject: Re: [meta-oe][master][PATCH] tcpdump: Add fix for CVE-2018-16301
To: Riyaz <Riyaz.Khan@kpit.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Nisha Parrakat <nisha.parrakat@kpit.com>,
 Anuj Chougule <anuj.chougule@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 17:05:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165403

send it to openembedded-devel mailing list please.

On Mon, May 9, 2022 at 12:21 AM Riyaz <Riyaz.Khan@kpit.com> wrote:
>
> From: Riyaz Ahmed Khan <Riyaz.Khan@kpit.com>
>
> Add patch for CVE issue: CVE-2018-16301
> Link: https://github.com/the-tcpdump-group/tcpdump/commit/8ab211a7ec728bb=
0ad8c766c8eeb12deb0a13b86
>
> Signed-off-by: Riyaz Ahmed Khan <Riyaz.Khan@kpit.com>
> ---
>  .../tcpdump/tcpdump/CVE-2018-16301.patch      | 111 ++++++++++++++++++
>  .../recipes-support/tcpdump/tcpdump_4.9.3.bb  |   1 +
>  2 files changed, 112 insertions(+)
>  create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/CVE-2=
018-16301.patch
>
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2018-163=
01.patch b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2018-16301.p=
atch
> new file mode 100644
> index 000000000..5f5c68ccd
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2018-16301.patc=
h
> @@ -0,0 +1,111 @@
> +From 8ab211a7ec728bb0ad8c766c8eeb12deb0a13b86 Mon Sep 17 00:00:00 2001
> +From: Guy Harris <gharris@sonic.net>
> +Date: Wed, 30 Sep 2020 11:37:30 -0700
> +Subject: [PATCH] Handle very large -f files by rejecting them.
> +
> +_read(), on Windows, has a 32-bit size argument and a 32-bit return
> +value, so reject -f files that have more than 2^31-1 characters.
> +
> +Add some #defines so that, on Windows, we use _fstati64 to get the size
> +of that file, to handle large files.
> +
> +Don't assume that our definition for ssize_t is the same size as size_t;
> +by the time we want to print the return value of the read, we know it'll
> +fit into an int, so just cast it to int and print it with %d.
> +
> +(cherry picked from commit faf8fb70af3a013e5d662b8283dec742fd6b1a77)
> +
> +CVE: CVE-2022-25308
> +Upstream-Status: Backport [https://github.com/the-tcpdump-group/tcpdump/=
commit/8ab211a7ec728bb0ad8c766c8eeb12deb0a13b86]
> +
> +Signed-off-by: Riyaz Ahmed Khan <Riyaz.Khan@kpit.com>
> +
> +---
> + netdissect-stdinc.h | 16 +++++++++++++++-
> + tcpdump.c           | 15 ++++++++++++---
> + 2 files changed, 27 insertions(+), 4 deletions(-)
> +
> +diff --git a/netdissect-stdinc.h b/netdissect-stdinc.h
> +index 8282c5846..9941c2a16 100644
> +--- a/netdissect-stdinc.h
> ++++ b/netdissect-stdinc.h
> +@@ -149,10 +149,17 @@
> + #ifdef _MSC_VER
> + #define stat _stat
> + #define open _open
> +-#define fstat _fstat
> + #define read _read
> + #define close _close
> + #define O_RDONLY _O_RDONLY
> ++
> ++/*
> ++ * We define our_fstat64 as _fstati64, and define our_statb as
> ++ * struct _stati64, so we get 64-bit file sizes.
> ++ */
> ++#define our_fstat _fstati64
> ++#define our_statb struct _stati64
> ++
> + #endif  /* _MSC_VER */
> +
> + /*
> +@@ -211,6 +218,13 @@ typedef char* caddr_t;
> +
> + #include <arpa/inet.h>
> +
> ++/*
> ++ * We should have large file support enabled, if it's available,
> ++ * so just use fstat as our_fstat and struct stat as our_statb.
> ++ */
> ++#define our_fstat fstat
> ++#define our_statb struct stat
> ++
> + #endif /* _WIN32 */
> +
> + #ifndef HAVE___ATTRIBUTE__
> +diff --git a/tcpdump.c b/tcpdump.c
> +index 043bda1d7..8f27ba2a4 100644
> +--- a/tcpdump.c
> ++++ b/tcpdump.c
> +@@ -108,6 +108,7 @@ The Regents of the University of California.  All ri=
ghts reserved.\n";
> + #endif /* HAVE_CAP_NG_H */
> + #endif /* HAVE_LIBCAP_NG */
> +
> ++#include "netdissect-stdinc.h"
> + #include "netdissect.h"
> + #include "interface.h"
> + #include "addrtoname.h"
> +@@ -861,15 +862,22 @@ read_infile(char *fname)
> + {
> +       register int i, fd, cc;
> +       register char *cp;
> +-      struct stat buf;
> ++      our_statb buf;
> +
> +       fd =3D open(fname, O_RDONLY|O_BINARY);
> +       if (fd < 0)
> +               error("can't open %s: %s", fname, pcap_strerror(errno));
> +
> +-      if (fstat(fd, &buf) < 0)
> ++      if (our_fstat(fd, &buf) < 0)
> +               error("can't stat %s: %s", fname, pcap_strerror(errno));
> +
> ++      /*
> ++       * Reject files whose size doesn't fit into an int; a filter
> ++       * *that* large will probably be too big.
> ++       */
> ++      if (buf.st_size > INT_MAX)
> ++              error("%s is too large", fname);
> ++
> +       cp =3D malloc((u_int)buf.st_size + 1);
> +       if (cp =3D=3D NULL)
> +               error("malloc(%d) for %s: %s", (u_int)buf.st_size + 1,
> +@@ -878,7 +886,8 @@ read_infile(char *fname)
> +       if (cc < 0)
> +               error("read %s: %s", fname, pcap_strerror(errno));
> +       if (cc !=3D buf.st_size)
> +-              error("short read %s (%d !=3D %d)", fname, cc, (int)buf.s=
t_size);
> ++              error("short read %s (%d !=3D %d)", fname, (int) cc,
> ++                  (int)buf.st_size);
> +
> +       close(fd);
> +       /* replace "# comment" with spaces */
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb b/m=
eta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
> index 2ea493863..66bf21775 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
> @@ -18,6 +18,7 @@ SRC_URI =3D " \
>      file://add-ptest.patch \
>      file://run-ptest \
>      file://0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buff.pat=
ch \
> +    file://CVE-2018-16301.patch \
>  "
>
>  SRC_URI[md5sum] =3D "a4ead41d371f91aa0a2287f589958bae"
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.

