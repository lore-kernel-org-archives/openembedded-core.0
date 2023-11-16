Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E9EC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 13:11:08 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.6172.1700140265105414469
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 05:11:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=PLdrErJS;
 spf=pass (domain: smile.fr, ip: 209.85.218.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9bf86b77a2aso117804166b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 05:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700140263; x=1700745063; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZwQ8t8DqodfFZ/Nermw2dVEizv+0TKP+n6kkjsyfldU=;
        b=PLdrErJSqRIDuS8VRsHtJwKFl8unOC7hXGvqP3jYp1kd4spBOCjURzdx2SVN7eDoUm
         7Ek8m4UQgK4rWJ9h0PKNO9ibjM2iTgdhBZv4kH8/1py5Cf9H0mmbyHwEorYsJU9+ZG+V
         9MPQ6aKoMPXqE6TKjCkSgFwM4truWGurWQZGTnqjmOcTDEG6X6adBNaNJxaidLa4HjlE
         WWV8moD3ctHOnB8f1fxZ8C6kRlcRis4DgQUrYEyKyqVVbNnpw2p6R8m8qBiX3r+Wig+k
         KQUZgPq0t7A1e4oLkWc+8I2JZDvCclrKW7vJTi1Uxsw2JzaH8S62dXGbBoTNEz1eROxN
         Sk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700140263; x=1700745063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwQ8t8DqodfFZ/Nermw2dVEizv+0TKP+n6kkjsyfldU=;
        b=iu3mCJMuKU65isQ+zognMLlfuDHr6s69AXZo9xnxfgbpWY968P4vE4l5sXxVDZ5D7a
         v7qFQjyk6fMJw8gycbCBYmp+gAay6DD4qu9I6iu6fUec45ydluQ2Xblm/OA7Hs+pLnJ/
         qhnH4UCkY7zDI4YdhkQ3MrXdSgFRDLJv9DDpFoQ9pnGGFg2GF68oEiqch/qXuQyCboQL
         OfBFh60vVev2Aq0l7wyfbt+i7AMlxlqR3Iyfg1TUntRKypV0iZNqFf+p8VJIm/WjqHDb
         2fToeNOX8dbFvsj5RTnBLukkRBw4dEj04RSv5AI9BG5nnM8NU1NtBAWBYgcP2vuw0H7M
         HpZA==
X-Gm-Message-State: AOJu0Ywb1QRxONIE3+VKyoQNBJb9ZhPLd2xAvq+m5ppc7GIxRgf449Of
	qXaUsDUuZFE4CxYnW2Z1Lej5MPEkOZNomE0U5GPHug==
X-Google-Smtp-Source: AGHT+IHX7727MvOH08Qz//gVooqQpXtA6TqxHuufS/ZGzc+UE6RQrEt5xN9o6aAlE1tu6NLnZkf3Er5oMXl8uFLw3Vg=
X-Received: by 2002:a17:906:d938:b0:9d0:4b8f:3d65 with SMTP id
 rn24-20020a170906d93800b009d04b8f3d65mr10466573ejb.23.1700140262884; Thu, 16
 Nov 2023 05:11:02 -0800 (PST)
MIME-Version: 1.0
References: <20230928215640.2683961-1-yoann.congal@smile.fr>
 <20230928215640.2683961-3-yoann.congal@smile.fr> <1ab344acaa97212f14044d48623d03b9a93c2ed4.camel@linuxfoundation.org>
In-Reply-To: <1ab344acaa97212f14044d48623d03b9a93c2ed4.camel@linuxfoundation.org>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Thu, 16 Nov 2023 14:10:36 +0100
Message-ID: <CAMSfU+4sT86jrae0GDCAwA+R2ERb0CT7WWe5JRMoeRyaQ_x6cA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] meta/recipes: Remove empty
 ${PN}/DEV_PKG_DEPENDENCY workarounds
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Fawzi KHABER <fawzi.khaber@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 13:11:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190794

Hi Richard,

Le jeu. 16 nov. 2023 =C3=A0 13:13, Richard Purdie
<richard.purdie@linuxfoundation.org> a =C3=A9crit :
> On Thu, 2023-09-28 at 23:56 +0200, Yoann Congal wrote:
> > From: Fawzi KHABER <fawzi.khaber@smile.fr>
> >
> > Remove superfluous DEV_PKG_DEPENDENCY =3D "" previously used to bypass
> > ${PN}-dev package RDEPENDS on empty&non-built ${PN}. DEV_PKG_DEPENDENCY
> > applies RRECOMMENDS now, all workarounds are not needed anymore.
> >
> > Related to [YOCTO #6839] and [YOCTO #8222]
> >
> > Signed-off-by: Yoann CONGAL <yoann.congal@smile.fr>
> > Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
> > ---
> >  meta/recipes-connectivity/bind/bind_9.18.19.bb                | 1 -
> >  meta/recipes-core/musl/bsd-headers.bb                         | 1 -
> >  meta/recipes-core/musl/libssp-nonshared.bb                    | 1 -
> >  meta/recipes-core/newlib/newlib_git.bb                        | 3 ---
> >  meta/recipes-devtools/gcc/libgcc-common.inc                   | 4 ----
> >  meta/recipes-devtools/python/python3_3.11.5.bb                | 1 -
> >  meta/recipes-graphics/mesa/libglu_9.0.3.bb                    | 3 ---
> >  meta/recipes-graphics/mesa/mesa.inc                           | 3 ---
> >  meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb        | 1 -
> >  meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb                | 1 -
> >  meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb          | 1 -
> >  meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb          | 3 +--
> >  meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb         | 3 +--
> >  meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 1 -
> >  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb  | 1 -
> >  meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb | 1 -
> >  16 files changed, 2 insertions(+), 27 deletions(-)
>
> Firstly, sorry for taking as long to get to this.

That is fine! This was sent really late in the dev cycle wrt the release...

> The patch 1/2 looks
> good and I'm happy to merge that. It does set us on the patch I
> outlined originally so I think we're good there.

Awesome, thanks!

> I'm less sure about this second one. It appears to remove variables
> which do actively change things and once they are removed, warnings
> from the previous patch show up.
>
> I therefore think the second patch is incorrect and doesn't move us in
> the direction we want?

I would need to look into it to to confirm this but from your plan :
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D6839#c7
a) was to make warnings appear
b) fixing the warnings

We are now between a) and b) : warnings but no fix.

Since the patch I finally integrated the fact that the CI must be warning f=
ree.
So I guess, I'll come back with a series with this patch (a) _and the
fixes (b)_.
Does that sound good?

> Cheers,
>
> Richard

Regards,
--=20
Yoann Congal
Smile ECS - Tech expert

