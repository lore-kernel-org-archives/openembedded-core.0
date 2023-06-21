Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4357FEB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 14:09:47 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.11615.1687356585213696153
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 07:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=b1aQaOvc;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.175, mailfrom: steve@sakoman.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b47742de92so52891411fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 07:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687356583; x=1689948583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVAj2qPm66aKeI7zoi4rL1zNx6CliIGdjh93/XXWaQ8=;
        b=b1aQaOvcLknNDphoHBgqFTX98FNkcP5noZzZ2lMMnolcn+RFiFCVT620FAe1jQlOfr
         84YLdGCqfZfpYBPh0HptsYSIW+8t2+8qx+JJj1yrL/I/B80cmkOosw/um18vNR1ocmOu
         +CAMXeKg1jcit2EiIWBbceRgP71rx/6OBLk+Zzgdh4UV2CrIYZsT7tlJT8dImEyZ1KU8
         4AVJQRXzXDEi2vVZCSZJdrnC5c21bcsTiRlzZhmkzZ9h9LxHq6adexdWUcCyARdvWrZt
         8i4fbeyPhpoSiGNJxWYMaK7TFVdIx2H0xZ32OoiafFGK4BHqJIFcwhmiC8GvcfukZgcL
         x9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687356583; x=1689948583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVAj2qPm66aKeI7zoi4rL1zNx6CliIGdjh93/XXWaQ8=;
        b=WurRBmn/t5MJ4TU9p/cldxg+GcOBSMiVn7B1aYShlziS19/ysXA7C2WGSdWlQF8LVP
         kdn/WlVwMNmFhcPxoUHwJ+t5RS4GnmBZfboka+0b3xmf1V+6kJKE5IDfmZZv4u2nVBBV
         qgv86Zf3vTy17TGIvbSJD401F/EsEfdQGZiQbPLehT5X+J93qdFOhGtzASaFAhJqYDSO
         NXUcTUapeoCsZdBkeGv1YFbAW8m75AmqLwayFeGFGWKs/aIaP42gZHguqU55CK9xLGP/
         g0oazQGjHkyKYCsmKmxQ788gPEX9Wa+8VGbWEEWcZGHT2Ngzh/B/vXx7whXWFEAVImSm
         xB2g==
X-Gm-Message-State: AC+VfDzl7XwRklmjjsB6azTaZ/zs1DcYLbblJmScIONmfQZIN+sQ4Xav
	XgTXHcX0RMWPYRrBt/ukgsZikYdB8u0y+/udyy+5xA==
X-Google-Smtp-Source: ACHHUZ7MUxZn6uA2wRXfruD6SC1IIepb5whpFRWdx169ChTFAO5R4WLCmnBmmZftVN8IKb8xc5ALO6ItnfFROwuhARc=
X-Received: by 2002:a05:6512:3b08:b0:4f8:6ff9:ec53 with SMTP id
 f8-20020a0565123b0800b004f86ff9ec53mr821732lfv.34.1687356583083; Wed, 21 Jun
 2023 07:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687143192.git.steve@sakoman.com> <cf741646f41835024c7e53234cfd527ff3f8542b.1687143192.git.steve@sakoman.com>
 <SJ0PR11MB6717DC7CA09D8738FB1C3FB9DC5DA@SJ0PR11MB6717.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB6717DC7CA09D8738FB1C3FB9DC5DA@SJ0PR11MB6717.namprd11.prod.outlook.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 21 Jun 2023 04:09:31 -1000
Message-ID: <CAOSpxdauUbANSmM++qUM0VxwoBxmQwx-PgEfohC0xAYTKEYVPg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 02/18] cups: Fix CVE-2023-32324
To: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco)" <schitrod@cisco.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 14:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183181

On Tue, Jun 20, 2023 at 10:00=E2=80=AFPM Sanjaykumar kantibhai Chitroda -X
(schitrod - E-INFO CHIPS INC at Cisco) <schitrod@cisco.com> wrote:
>
> Hi Steve,
>
> CVE fix for cups package is accepted and merged on master.
> https://github.com/openembedded/openembedded-core/commit/a4bdbc82f7e5cc9a=
5cb603cb720f09b0216b0a0e
>
> Is there any comment for similar fix on kirkstone branch?

Hi Sanjay,

Also accepted and merged on kirkstone:

https://git.openembedded.org/openembedded-core/commit/?h=3Dkirkstone&id=3Dc=
f741646f41835024c7e53234cfd527ff3f8542b

Steve

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Steve Sakoman
> Sent: Monday, June 19, 2023 8:25 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core][kirkstone 02/18] cups: Fix CVE-2023-32324
>
> From: Sanjay Chitroda <schitrod@cisco.com>
>
> OpenPrinting CUPS is an open source printing system. In versions 2.4.2 an=
d prior, a heap buffer overflow vulnerability would allow a remote attacker=
 to launch a denial of service (DoS) attack. A buffer overflow vulnerabilit=
y in the function `format_log_line` could allow remote attackers to cause a=
 DoS on the affected system. Exploitation of the vulnerability can be trigg=
ered when the configuration file `cupsd.conf` sets the value of `loglevel `=
to `DEBUG`. No known patches or workarounds exist at time of publication.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-32324
> https://security-tracker.debian.org/tracker/CVE-2023-32324
>
> Upstream Patch:
> https://github.com/OpenPrinting/cups/commit/fd8bc2d32589
>
> Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-extended/cups/cups.inc           |  1 +
>  .../cups/cups/CVE-2023-32324.patch            | 36 +++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32324.patch
>
> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
> index 0acc5c575e..1b87d47a49 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -15,6 +15,7 @@ SRC_URI =3D "https://github.com/OpenPrinting/cups/relea=
ses/download/v${PV}/cups-${
>             file://0004-cups-fix-multilib-install-file-conflicts.patch \
>             file://volatiles.99_cups \
>             file://cups-volatiles.conf \
> +           file://CVE-2023-32324.patch \
>             "
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/OpenPrinting/cups/releases"
> diff --git a/meta/recipes-extended/cups/cups/CVE-2023-32324.patch b/meta/=
recipes-extended/cups/cups/CVE-2023-32324.patch
> new file mode 100644
> index 0000000000..40b89c9899
> --- /dev/null
> +++ b/meta/recipes-extended/cups/cups/CVE-2023-32324.patch
> @@ -0,0 +1,36 @@
> +From 07cbffd11107eed3aaf1c64e35552aec20f792da Mon Sep 17 00:00:00 2001
> +From: Zdenek Dohnal <zdohnal@redhat.com>
> +Date: Thu, 1 Jun 2023 12:04:00 +0200
> +Subject: [PATCH] cups/string.c: Return if `size` is 0 (fixes
> +CVE-2023-32324)
> +
> +CVE: CVE-2023-32324
> +Upstream-Status: Backport
> +[https://github.com/OpenPrinting/cups/commit/fd8bc2d32589]
> +
> +(cherry picked from commit fd8bc2d32589d1fd91fe1c0521be2a7c0462109e)
> +Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
> +---
> + cups/string.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/cups/string.c b/cups/string.c index 93cdad19..6ef58515
> +100644
> +--- a/cups/string.c
> ++++ b/cups/string.c
> +@@ -1,6 +1,7 @@
> + /*
> +  * String functions for CUPS.
> +  *
> ++ * Copyright =C2=A9 2023 by OpenPrinting.
> +  * Copyright =C2=A9 2007-2019 by Apple Inc.
> +  * Copyright =C2=A9 1997-2007 by Easy Software Products.
> +  *
> +@@ -730,6 +731,9 @@ _cups_strlcpy(char       *dst,             /* O - De=
stination string */
> +   size_t      srclen;                 /* Length of source string */
> +
> +
> ++  if (size =3D=3D 0)
> ++    return (0);
> ++
> +  /*
> +   * Figure out how much room is needed...
> +   */
> --
> 2.34.1
>

