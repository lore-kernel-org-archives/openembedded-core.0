Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F294C77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 21:25:36 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.766.1685481931751604897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 14:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qjvQ8c6V;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4f3b9e54338so5933181e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 14:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685481929; x=1688073929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13RvmBow3c3QXDivYUWZrLjSlP6FWmV2Z9vtjXS8Zlg=;
        b=qjvQ8c6VS538qb4XIHVKJ0EXTpgnpBw2l+nZsf6y1YKlihh7rHdEcnp+tMeyURNz3A
         aQvuSHXoca2K6fN0eKjvIrxQtRtKRWahYp9BQfBJQ4aZB6XK4ymIy6ygsHg69h17TzNy
         k5oS552i8GaxuwuTapEGAjiDeKoabM8K8qJ6NUB3LJainSDUHDKko8yGMXUU4TSDW2Px
         MKrntVnmPytSxQxeWmgwFQ4zjGLZqV1e+KU2aQhe5+dJgB9w+HBQu1HFt2G/m3jwCye2
         2Ot2K9jRByoNWSCRIDkLN/daMKb7zB7rGfj4lfXUnCBdsN85UDXz7s+gEjT7m6N9Lq8x
         EVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685481929; x=1688073929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13RvmBow3c3QXDivYUWZrLjSlP6FWmV2Z9vtjXS8Zlg=;
        b=TIAvEWoaDcQzMFoV2PjNEhtuw6oFi7UR1lweGgdLp3C8AU7t7P8qJam9nEitJY0RzC
         ANTeKLqiNqukpdSRbAlH4GbLSCuJoG89q54rfGu29NtBZoECwyJzvEJf0aLutgKkyxZ3
         AzLQVcJn8G0b5ot+tnBVV4EzrYWg85kF3WCigCI72QYyJcvJ1QN4HTqZKua0rERTvDSb
         Ki36DwXgiCuaKc8ql2MyiPWk5Gb7QiQK9mfS6WwUbKSpOU/KjJAGFrYLa6oFkcfiypRJ
         z1UQoz2rSiyHZ3a3Co7llVO+pp9U3riumk3lbxq50IsKaXQLd6ig4u5nMmmV/FTx3+JV
         9ajg==
X-Gm-Message-State: AC+VfDyB/oQU8Dmo9hQdGyO9y5klMjiTC07afmW2s7XtIu0Rt12eXKw2
	PZtNShq8cM+jVfFM2Ryy8uVSXBD+++TQCSg5IXo=
X-Google-Smtp-Source: ACHHUZ7zv+DEhxYWlmI69zPk2o+GQmXEuRbZdQbD3LeDBm2qJKScfOUkJtDBIqFAZryqYijMcmE+oktKSaUWvTe3k38=
X-Received: by 2002:a2e:b019:0:b0:298:acea:d261 with SMTP id
 y25-20020a2eb019000000b00298acead261mr1622087ljk.21.1685481929356; Tue, 30
 May 2023 14:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230530204117.949199-1-JPEWhacker@gmail.com> <bf7d98b4ee31c416072db5437da44ce7a4c0f841.camel@linuxfoundation.org>
In-Reply-To: <bf7d98b4ee31c416072db5437da44ce7a4c0f841.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 30 May 2023 16:25:17 -0500
Message-ID: <CAJdd5GbHuoJFe8BbvjUbG=iPmedYtJTgOx-fyNu86zms+gDeeQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/package: mark PKGDATA_VARS as a
 dependency of emit_pkgdata
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 21:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181954

On Tue, May 30, 2023 at 4:23=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2023-05-30 at 15:41 -0500, Joshua Watt wrote:
> > emit_pkgdata needs to re-run when PKGDATA_VARS changes, but bitbake is
> > unaware of this because the code that uses it is in a python library.
> > Fix this by explicitly marking PKGDATA_VARS as a dependency
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/classes-global/package.bbclass | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/=
package.bbclass
> > index e8055a9cdc5..c466601266e 100644
> > --- a/meta/classes-global/package.bbclass
> > +++ b/meta/classes-global/package.bbclass
> > @@ -381,6 +381,7 @@ python emit_pkgdata() {
> >      import oe.packagedata
> >      oe.packagedata.emit_pkgdata(pkgfiles, d)
> >  }
> > +emit_pkgdata[vardeps] +=3D "PKGDATA_VARS"
> >  emit_pkgdata[dirs] =3D "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-=
reverse ${PKGDESTWORK}/runtime-rprovides ${PKGDESTWORK}/extended"
> >
> >  ldconfig_postinst_fragment() {
>
> Is the auto dependency code somehow breaking for that function?

It empirically seemed to not re-run the functions when I changed that
variable as part of a (now abandoned) way to fix the SPDX builds.

I thought the code scanner didn't go into library functions; or am I
mistaken there?

>
> Cheers,
>
> Richard

