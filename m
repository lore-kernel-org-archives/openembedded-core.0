Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.29250.1629748510719785257
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 12:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=W03poeBD;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.48, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f48.google.com with SMTP id q11-20020a7bce8b0000b02902e6880d0accso253096wmj.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 12:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6eJ1BeWX6BWjHDp2A0lKvwPpcT2CpRwcbwPnWtX8Qsw=;
        b=W03poeBD0MEcUIj/KZukmyklZ3xDt6skTIqV5uLaQYxpqROJebaVNY0u95zgTNBkZV
         dWFOZZYXotxhVA6Wfy10eLfQaV4CPS8ycSp14HFFHHm0HzgM3Ea71Y3u40rhhbrkxC19
         gyXj+CZ/3xZEplP3BkaO4dlOzWDbhyUfxqbrAQtpBAgmSqVtzMqUYJ0YNTTlkGVT0wIe
         KVlc7t5vbqexsgsdy3pEH0rU81Dyji8blUol507XWtbS7uDHNrgYeZ3KsOj1+MrWMExr
         t7OjoBhcHoDIPk9nMEXZXQpLRP6oBFrmS7ZeVAZkn5f04qDu0B/0/LOga8gJf0CHre6g
         TVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6eJ1BeWX6BWjHDp2A0lKvwPpcT2CpRwcbwPnWtX8Qsw=;
        b=kTTEJTXQvEh5zh3Gs5i+/ab+PMdOBIcOJwZ8QhHUw8JslQygsjR5TdZ6bZF5hs7ODe
         GrW/s1vWWWutq9pXvGfeC6MktiHiN11JLgNphLwxHk8KA+ZBPpRg10a75KuSZsaWMAoB
         bQxsiPZm2MtLaZDBJx/Ov01u0LJPffowJaLmOrG3EYG58La6B4DM7g4VkhdjI1oKCsBT
         e5LrGXo+VG+41mCoKOdBmKOjePaY3ISJgC2SylkFNM3e0rVfYPB/ktDX67Fae9LF1QTd
         j7VlpQEyiz2pKMoD1X9NHUOCStKF9XOvwkwAKE+BNxccez69AiJ+u+NPrW9QPGoWNE6A
         65eA==
X-Gm-Message-State: AOAM531NIHWQBwgcD8lwPQSl6HMywezH1pe6fcs2qNLDrM04RsI9sMqu
	G4TjfDB+nDVHHfERkc+b5DERLYmctgpZPghe7xbfbQ==
X-Google-Smtp-Source: ABdhPJwg0heW57ZALVef5CuSSsDM5JVTnQ9ciy7mmrZ8JxbohPfJ1ZeF/XOcxBkK6QYGzkfyYW7BxKgwlgIVBdCCsp4=
X-Received: by 2002:a1c:f60c:: with SMTP id w12mr278753wmc.3.1629748509112;
 Mon, 23 Aug 2021 12:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210823181226.3259-1-ranjitsinh.rathod@kpit.com>
In-Reply-To: <20210823181226.3259-1-ranjitsinh.rathod@kpit.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 23 Aug 2021 09:54:56 -1000
Message-ID: <CAOSpxdZ4Lo1wj_iRu1WS8ngMMFaiNBUWchqXSucmMFgG750nnw@mail.gmail.com>
Subject: Re: [OE-core] [meta][dunfell][PATCH] rpm: Add fix for CVE-2021-20266
To: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 8:12 AM Ranjitsinh Rathod
<ranjitsinh.rathod@kpit.com> wrote:
>
> Adding fix for CVE-2021-20266
> Upstream-Status: Backport [https://github.com/rpm-software-management/rpm=
/pull/1587/commits/9646711891df851dfbf7ef54cc171574a0914b15]
>
> Note: Hunk#2 and Hunk#3 refreshed to apply patch and match value of
> dl_max variable to make it with current version

Causes autobuilder failures:

https://errors.yoctoproject.org/Errors/Details/602478/

Steve

>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> ---
>  .../rpm/files/CVE-2021-20266.patch            | 108 ++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |   1 +
>  2 files changed, 109 insertions(+)
>  create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-20266.patch
>
> diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-20266.patch b/meta/=
recipes-devtools/rpm/files/CVE-2021-20266.patch
> new file mode 100644
> index 0000000000..d8b91d4f8e
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/CVE-2021-20266.patch
> @@ -0,0 +1,108 @@
> +From 9646711891df851dfbf7ef54cc171574a0914b15 Mon Sep 17 00:00:00 2001
> +From: Demi Marie Obenour <athena@invisiblethingslab.com>
> +Date: Mon, 8 Feb 2021 16:05:01 -0500
> +Subject: [PATCH] hdrblobInit() needs bounds checks too
> +
> +Users can pass untrusted data to hdrblobInit() and it must be robust
> +against this.
> +
> +Backported from commit 8f4b3c3cab8922a2022b9e47c71f1ecf906077ef
> +
> +Upstream-Status: Backport [https://github.com/rpm-software-management/rp=
m/pull/1587/commits/9646711891df851dfbf7ef54cc171574a0914b15]
> +CVE: CVE-2021-20266
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +---
> + lib/header.c | 48 +++++++++++++++++++++++++++++++-----------------
> + 1 file changed, 31 insertions(+), 17 deletions(-)
> +
> +diff --git a/lib/header.c b/lib/header.c
> +index 6af48e61af..46ded5dd99 100644
> +--- a/lib/header.c
> ++++ b/lib/header.c
> +@@ -11,6 +11,7 @@
> + #include "system.h"
> + #include <netdb.h>
> + #include <errno.h>
> ++#include <inttypes.h>
> + #include <rpm/rpmtypes.h>
> + #include <rpm/rpmstring.h>
> + #include "lib/header_internal.h"
> +@@ -1910,6 +1911,25 @@ hdrblob hdrblobFree(hdrblob blob)
> +     return NULL;
> + }
> +
> ++static rpmRC hdrblobVerifyLengths(rpmTagVal regionTag, uint32_t il, uin=
t32_t dl,
> ++                                char **emsg) {
> ++    uint32_t il_max =3D HEADER_TAGS_MAX;
> ++    uint32_t dl_max =3D HEADER_DATA_MAX;
> ++    if (regionTag =3D=3D RPMTAG_HEADERSIGNATURES) {
> ++      il_max =3D 32;
> ++      dl_max =3D 8192;
> ++    }
> ++    if (hdrchkRange(il_max, il)) {
> ++      rasprintf(emsg, _("hdr tags: BAD, no. of tags(%" PRIu32 ") out of=
 range"), il);
> ++      return RPMRC_FAIL;
> ++    }
> ++    if (hdrchkRange(dl_max, dl)) {
> ++      rasprintf(emsg, _("hdr data: BAD, no. of bytes(%" PRIu32 ") out o=
f range"), dl);
> ++      return RPMRC_FAIL;
> ++    }
> ++    return RPMRC_OK;
> ++}
> ++
> + rpmRC hdrblobRead(FD_t fd, int magic, int exact_size, rpmTagVal regionT=
ag, hdrblob blob, char **emsg)
> + {
> +     int32_t block[4];
> +@@ -1922,13 +1942,6 @@ rpmRC hdrblobRead(FD_t fd, int magic, int exact_s=
ize, rpmTagVal regionTag, hdrbl
> +     size_t nb;
> +     rpmRC rc =3D RPMRC_FAIL;            /* assume failure */
> +     int xx;
> +-    int32_t il_max =3D HEADER_TAGS_MAX;
> +-    int32_t dl_max =3D HEADER_DATA_MAX;
> +-
> +-    if (regionTag =3D=3D RPMTAG_HEADERSIGNATURES) {
> +-      il_max =3D 32;
> +-      dl_max =3D 8192;
> +-    }
> +
> +     memset(block, 0, sizeof(block));
> +     if ((xx =3D Freadall(fd, bs, blen)) !=3D blen) {
> +@@ -1941,15 +1954,9 @@ rpmRC hdrblobRead(FD_t fd, int magic, int exact_s=
ize, rpmTagVal regionTag, hdrbl
> +       goto exit;
> +     }
> +     il =3D ntohl(block[2]);
> +-    if (hdrchkRange(il_max, il)) {
> +-      rasprintf(emsg, _("hdr tags: BAD, no. of tags(%d) out of range"),=
 il);
> +-      goto exit;
> +-    }
> +     dl =3D ntohl(block[3]);
> +-    if (hdrchkRange(dl_max, dl)) {
> +-      rasprintf(emsg, _("hdr data: BAD, no. of bytes(%d) out of range")=
, dl);
> ++    if (hdrblobVerifyLengths(regionTag, il, dl, emsg))
> +       goto exit;
> +-    }
> +
> +     nb =3D (il * sizeof(struct entryInfo_s)) + dl;
> +     uc =3D sizeof(il) + sizeof(dl) + nb;
> +@@ -1993,11 +2000,18 @@ rpmRC hdrblobInit(const void *uh, size_t uc,
> +               struct hdrblob_s *blob, char **emsg)
> + {
> +     rpmRC rc =3D RPMRC_FAIL;
> +-
> +     memset(blob, 0, sizeof(*blob));
> ++    if (uc && uc < 8) {
> ++      rasprintf(emsg, _("hdr length: BAD"));
> ++      goto exit;
> ++    }
> ++
> +     blob->ei =3D (int32_t *) uh; /* discards const */
> +-    blob->il =3D ntohl(blob->ei[0]);
> +-    blob->dl =3D ntohl(blob->ei[1]);
> ++    blob->il =3D ntohl((uint32_t)(blob->ei[0]));
> ++    blob->dl =3D ntohl((uint32_t)(blob->ei[1]));
> ++    if (hdrblobVerifyLengths(regionTag, blob->il, blob->dl, emsg) !=3D =
RPMRC_OK)
> ++      goto exit;
> ++
> +     blob->pe =3D (entryInfo) &(blob->ei[2]);
> +     blob->pvlen =3D sizeof(blob->il) + sizeof(blob->dl) +
> +                 (blob->il * sizeof(*blob->pe)) + blob->dl;
> diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-dev=
tools/rpm/rpm_4.14.2.1.bb
> index 018b2f8700..c93654aa8f 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> @@ -45,6 +45,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/r=
pm;branch=3Drpm-4.14.x \
>             file://0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD=
160.patch \
>             file://0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch \
>             file://CVE-2021-3421.patch \
> +           file://CVE-2021-20266.patch \
>             "
>
>  PE =3D "1"
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
>
>=20
>
