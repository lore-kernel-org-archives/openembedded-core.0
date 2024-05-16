Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE87C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 20:05:50 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.23946.1715889948608662913
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 13:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mKMR7rNj;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-23ee34c33ceso584604fac.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 13:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715889948; x=1716494748; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7dMGMOC838+ZsX1eWsmvEVWy7Tt6UPn7tLlI3ytczc=;
        b=mKMR7rNjSI8tGsAqtJhqaDgOIr7QOW5iJGu+u5yZip6pATeuKtarlfuPkNw0lkhBas
         Net89BEresDNW+K2I0z3NjMMDVmUWq3XMMnftDQ2TtggwmAERKH9eHY9pPgNiz40zORY
         2gVngVqpaMiVeWin+fIvhuu1xGSzesjHEqo+UBGP2+1sNsfpYjZDdxEWtMiM8miiCw9r
         K0X0sUKOuv78E5g/ylvWyjzdU3BH77PA8HDC/GGtuNHmvFplgPR7w1jArUyGGR5xf+x8
         KCU3nXMlVV4qwOWsBJFgOFeVaR/Tbz/oGqtdFe8268xNtjZtCtqDnusBeZJ52a86eE4L
         xfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715889948; x=1716494748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7dMGMOC838+ZsX1eWsmvEVWy7Tt6UPn7tLlI3ytczc=;
        b=lCQmloCQb+he0h32JK3kadeJlaghE4aIzk1Vynbn7pp7dp0MBq7/4C/kgoZcP0lTV8
         HPxRbRQZTGld7kR4tnCeiBJx8T0t9A34hRowY2xMnXny5xAeXb8YjDgeIDjUOtIbrJEl
         5GNZf43v6DJ1SSBnITRSyaSyF8DCrC5T5uO5jZOT7mx37/t3bLLHjaojYqjgVz66TR0T
         jGwTl7t/wcdEY5xaLR1zyBGOrxRquREVYjQW2lsfOP4w3ZwWJJjRvwkBhvmnTnOKVsNo
         znWTeW50Ls/ue7GwTmoYdX7b2Rg2oIVcALyu7s+cuzSHX3+Lh0rQcbsNo4KsmR1m43AW
         WneA==
X-Forwarded-Encrypted: i=1; AJvYcCWlBvf9OHEKs0ffOFnwzFuBXD3D9QSkvnYYE3RTh8uZxuuWQqkfN+STj90Q5t2ZdHNTfECTdU4t0lNGBOS7rzWmQIeGlLcl0vz48e8njpgZXrNq345lFaz1
X-Gm-Message-State: AOJu0YwOIqyHTyaaBxdLj7nPNroxvV21jpsFY+0r+/r9IkFVRQ2BBqm6
	SrX3cQdTI+0rotqcjp8H7zjjHTFciN0AS1nzjsgHbCeArppAev7HFl1+UyY1cv99byRtjFuyoRX
	1HWp019GNA2srUkFIEFnbsXDaPAI=
X-Google-Smtp-Source: AGHT+IEIY+WSISGB9mCtpkytgnxhmFih05FbqdEDvVI+Lwyst09psue6ssGREoXOMwlSHlL3aoTuyx3TUzO9q/gboqQ=
X-Received: by 2002:a05:6870:b1c4:b0:23b:d7ce:476b with SMTP id
 586e51a60fabf-24172a3ddfbmr23153113fac.8.1715889947830; Thu, 16 May 2024
 13:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240506074548.16296-1-peter.marko@siemens.com> <CA+chaQdY=sq6egqkXewCq0BQutX4Z7r+coWG+3Vz0SJihJFWjg@mail.gmail.com>
In-Reply-To: <CA+chaQdY=sq6egqkXewCq0BQutX4Z7r+coWG+3Vz0SJihJFWjg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 May 2024 13:05:22 -0700
Message-ID: <CAMKF1so3hkAxZM6TcG4eq+JZUxOJWuQJr53NxZG=4nO+-aioGw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] glibc: correct license
To: martin.jansa@gmail.com
Cc: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 20:05:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199497

On Wed, May 15, 2024 at 10:29=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Hi Peter,
>
> what about BSD-4-Clause-UC, BSD-3-Clause, ISC licenses included in glibc.
>
> I've suggested to add them long time ago in:
> https://lists.openembedded.org/g/openembedded-core/topic/91285771#msg1660=
05
> which resulted in:
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D28007
> https://sourceware.org/pipermail/libc-alpha/2022-May/139167.html
> but the discussion upstream stopped shortly after and the oe-core
> change was never merged because of that. Maybe it's time to re-check
> and ping upstream again after 2 years.

Perhaps yes.

On a tangent here, but I also think we should use
https://github.com/nexB/scancode-toolkit
to extract the license information from source code itself to update
the LICENSE field
in the recipes.

>
> Cheers,
>
> On Mon, May 6, 2024 at 9:46=E2=80=AFAM Peter Marko via lists.openembedded=
.org
> <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
> >
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > The license per [1] is LGPL-2.1-or-later and
> > [2] converted last LGPL-2.1-only references.
> >
> > License-Update: corrected from LGPL-2.1-only to LGPL-2.1-or-later based=
 on [1] and [2]
> >
> > [1] https://www.gnu.org/software/libc/
> > [2] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;h=3D273a83=
5fe7c685cc54266bb8b502787bad5e9bae
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  meta/recipes-core/glibc/glibc-common.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-co=
re/glibc/glibc-common.inc
> > index b9516e77f0..91a3f5bcd5 100644
> > --- a/meta/recipes-core/glibc/glibc-common.inc
> > +++ b/meta/recipes-core/glibc/glibc-common.inc
> > @@ -2,7 +2,7 @@ SUMMARY =3D "GLIBC (GNU C Library)"
> >  DESCRIPTION =3D "The GNU C Library is used as the system C library in =
most systems with the Linux kernel."
> >  HOMEPAGE =3D "http://www.gnu.org/software/libc/libc.html"
> >  SECTION =3D "libs"
> > -LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
> > +LICENSE =3D "GPL-2.0-only & LGPL-2.1-or-later"
> >
> >  LIC_FILES_CHKSUM ?=3D "file://LICENSES;md5=3Df77e878d320e99e94ae9a4aea=
7f491d1 \
> >        file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> > --
> > 2.30.2
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199437): https://lists.openembedded.org/g/openembedde=
d-core/message/199437
> Mute This Topic: https://lists.openembedded.org/mt/105935723/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

