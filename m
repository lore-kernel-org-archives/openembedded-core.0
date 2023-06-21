Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5E5EB64D8
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 14:23:27 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.11949.1687357397780915987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 07:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=4geSvmTg;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.179, mailfrom: steve@sakoman.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b470330145so59269061fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 07:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687357396; x=1689949396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPXFgcIRMyZi+6kWLKKrn6j68A6V40KjGZ6fFE5uHSc=;
        b=4geSvmTgj97a2y6nOjPos3cNWM3IDawncA24EGXifQME+OX+h5h0hHBMPG1f/ZtDxI
         O6hZURj5EvJRjUte8oADJbuN9GziSaLT0zDYtcjpHbYh+x1hShtmoYOHLJOiwAaBfpSY
         Fo5sVt5Pauc6KKO5kXRp41f17QOW/s/Ls3eE/cw+5Q+xlS1JCyl1Lunxq2EEBQ8iC3O0
         SaaVI9tdPqrRJwX0qN2NhLpfWRjnh/6r/r5ZtK8THSjozsQqgxgzKAxG03GBUzRO1aUy
         6bM33CPJVDWaYy3J3O0lmGkikvOYsev0oX42Yzf2LfZRPS9uNf+OII0zZIcG+pzFXyP+
         ILxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687357396; x=1689949396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPXFgcIRMyZi+6kWLKKrn6j68A6V40KjGZ6fFE5uHSc=;
        b=MUZGM7A6Wr+hkUb1KQ8usqkRbMJ6NQYv5ZEudQ3oahIWb9qeF883FgBys+z2qmOo//
         MvzpYso4Z4GfS5zpIW/ElSkPhzxWbmMIl7KylHgtGOzlTG/PNzO1rRr4pFzgD/GCjD4c
         g3d/RH+I9g9cSdnRxXsGBlm8mbcVwTnkI4mz8VmSxdlGhr2fOVLOigWdbjIi7jt42054
         VHPIfMS+Ki8klf2BHggZSogVmaCw5aTW9TiqUFZm6s+GpCEKFuz+OdI06UIm8zxBNV9S
         3vVp01UyJlRGA/Vj5OJzq9S+RHx3nRfM4z9D8DgApSTxgBv1kWrs2TJImLmR6VMLNC66
         twaw==
X-Gm-Message-State: AC+VfDzgT93qUsMbIfQolCPvBquOGX5lYBvnFBw3W2w7ZKqLZqlNd83i
	Q9ua2XD020CVVop4tf2ojxuW7P9SJ/1N2ThPqKbu/Q==
X-Google-Smtp-Source: ACHHUZ7CUrTL6LVU0t7Xa2jvoB2/W+Xk6Ow7k9wtLxxFUQaZ2f8J3pIeSXvouhisT1b6l2SRbRhvZOHpPng9GRA+el8=
X-Received: by 2002:a2e:8518:0:b0:2b5:1b80:2643 with SMTP id
 j24-20020a2e8518000000b002b51b802643mr3666999lji.50.1687357395954; Wed, 21
 Jun 2023 07:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <17684F4A5AE4FC5E.24824@lists.openembedded.org> <SJ0PR11MB6717D52424A3F7FFF4926A99DC5DA@SJ0PR11MB6717.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB6717D52424A3F7FFF4926A99DC5DA@SJ0PR11MB6717.namprd11.prod.outlook.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 21 Jun 2023 04:23:04 -1000
Message-ID: <CAOSpxdYkeOiASuzj6unOEQkmkgE-RPEfknAPrAC9H7WgLJSPiw@mail.gmail.com>
Subject: Re: [OE-core] [OE-core,mickledore][PATCH] cups: Fix CVE-2023-32324
To: schitrod@cisco.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 14:23:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183184

On Tue, Jun 20, 2023 at 10:03=E2=80=AFPM Sanjaykumar kantibhai Chitroda -X
(schitrod - E-INFO CHIPS INC at Cisco) via lists.openembedded.org
<schitrod=3Dcisco.com@lists.openembedded.org> wrote:
>
> Hi Steve,
>
> CVE fix for cups package is accepted and merged on master.
> https://github.com/openembedded/openembedded-core/commit/a4bdbc82f7e5cc9a=
5cb603cb720f09b0216b0a0e
>
> Is there any comment for similar fix on mickledore branch?

Hi Sanjay,

It is in the current test queue for mickledore, which you can browse at:

https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/mick=
ledore-nut

Steve

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Sanjaykumar kantibhai Chitroda -X (schitrod -=
 E-INFO CHIPS INC at Cisco) via lists.openembedded.org
> Sent: Wednesday, June 14, 2023 1:00 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cis=
co) <schitrod@cisco.com>
> Subject: [OE-core] [OE-core,mickledore][PATCH] cups: Fix CVE-2023-32324
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
> ---
>  meta/recipes-extended/cups/cups.inc           |  1 +
>  .../cups/cups/CVE-2023-32324.patch            | 36 +++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32324.patch
>
> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
> index da320b1085..d77758fd3f 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -15,6 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/cups-${=
PV}-source.tar.gz \
>             file://0004-cups-fix-multilib-install-file-conflicts.patch \
>             file://volatiles.99_cups \
>             file://cups-volatiles.conf \
> +           file://CVE-2023-32324.patch \
>             "
>
>  GITHUB_BASE_URI =3D "https://github.com/OpenPrinting/cups/releases"
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
> 2.35.6
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183174): https://lists.openembedded.org/g/openembedde=
d-core/message/183174
> Mute This Topic: https://lists.openembedded.org/mt/99513254/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

