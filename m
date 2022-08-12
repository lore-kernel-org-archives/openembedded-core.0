Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8A6C00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 14:09:56 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.11041.1660313394544326244
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 07:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XygrqiX6;
 spf=pass (domain: gmail.com, ip: 209.85.160.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-116c7286aaaso1031128fac.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 07:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=mg/U6CXIi4mMJhE3t9WXogdDF1N/j1HdNK2GlHooC+0=;
        b=XygrqiX6MAg32MX/o+JrHOv9ABGn30b4Wvsv0xpKUfSoflg4O+AF/GYAn1zN76QreV
         kcniivDd088Jisrc+54IDFliyzbPcR2tRnluxIzfwTJDnFRgUtTv2fPT3nBg9tM4PZ1D
         CZRiJJWvV3nPkFxFKxTtTkQvYxowuZ6aXqrMGth5E+UBK/IkGK41LxLU5zHEYYyyqW2W
         xOtNZ7UfcBlxTTJ/NEg6XE0OMl4eIkNRV2RkABUrkzA2XaOA3q2OrFlZEAOiTfjXnMpO
         1f2yk+RW57xOBJOKi9BLEzxsEpqt4KXzEZEOEAW/7wHPrhiIDHO9/uZvT8pE0dyUaUBU
         R2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=mg/U6CXIi4mMJhE3t9WXogdDF1N/j1HdNK2GlHooC+0=;
        b=reAiHb23TLepNJpiobOUiYwH+mCfW0pYJh4hR0plGF7fQb/8gl3EI4G/Mrkklc/S6D
         3LUCKjj3Zbsuo8rTRdaBiwB2ndVg698lU+PQiZktDuRXX6YCgWLAZdIwWhg38BkhjInV
         RQbwb/CFmtOp2b0UxOou4VsmJu5F+eS8b3j1hnfsJLay0dnw5d3PrQ4o+UNHH7rZfg5D
         wA/rgoZ5bArTf4bVJA3TZ5XHFHKjy/DBAsLg3c2E6A7LBJAwaRzbd/B8wmRh+dwv5esN
         dibCkh79qW/ufcGnWfnr/ZVg/W92TmtEXpt5RHsjPLefbn1WCyyjli3MtGf913FePBO5
         Q0gQ==
X-Gm-Message-State: ACgBeo1fw9gd4G7w1cDpDrpCaDHD6BbJzyvtjpjD5fXHgL0hETgCAM/r
	kWHDKxskVvPwnTJbzOZ2LxGVxXLSmIxTWTNAvD4=
X-Google-Smtp-Source: 
 AA6agR7l+oSqV1MMIxf4FMugqZmwrtOZcAhb3gbhn5uaxYIBlVv/7QKh3ZPtSD4YpkNYIqvcatxFHqpcHsLQmHOUToQ=
X-Received: by 2002:a05:6870:d29d:b0:10e:747b:f87b with SMTP id
 d29-20020a056870d29d00b0010e747bf87bmr5857910oae.6.1660313393787; Fri, 12 Aug
 2022 07:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220812112643.2168104-1-jose.quaresma@foundries.io>
 <CADkTA4MY94LwgAop_DyMOwrMoZbV0q5Um_9ZuhRMf58yVFpVKw@mail.gmail.com>
 <CANPvuRmYhwb+=mWRxXzF9nUx8uawK=1WLnZ2M8x1Q3TigUiqzQ@mail.gmail.com>
In-Reply-To: 
 <CANPvuRmYhwb+=mWRxXzF9nUx8uawK=1WLnZ2M8x1Q3TigUiqzQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 12 Aug 2022 10:09:42 -0400
Message-ID: 
 <CADkTA4NxaratW=qMR8RAAX9F-12g06ih3YYUE6=H0gijwBHDTA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] linux-yocto: adds a space when append to
 KERNEL_EXTRA_ARGS
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Aug 2022 14:09:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169285

On Fri, Aug 12, 2022 at 9:57 AM Jose Quaresma <quaresma.jose@gmail.com> wro=
te:
>
>
>
> Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia sexta, 12/08/20=
22 =C3=A0(s) 14:08:
>>
>> On Fri, Aug 12, 2022 at 7:27 AM Jose Quaresma <quaresma.jose@gmail.com> =
wrote:
>> >
>> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> > ---
>> >  meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-=
kernel/linux/linux-yocto.inc
>> > index cabc8f4975..7ea661e138 100644
>> > --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> > @@ -60,7 +60,7 @@ do_install:append(){
>> >  KERNEL_FEATURES:append:qemuall=3D" features/kernel-sample/kernel-samp=
le.scc"
>> >
>> >  KERNEL_DEBUG_OPTIONS ?=3D "stack"
>> > -KERNEL_EXTRA_ARGS:append:x86-64 =3D "${@bb.utils.contains('KERNEL_DEB=
UG_OPTIONS', 'stack', 'HOST_LIBELF_LIBS=3D"-L${RECIPE_SYSROOT_NATIVE}/usr/l=
ib/pkgconfig/../../../usr/lib/ -lelf"', '', d)}"
>> > +KERNEL_EXTRA_ARGS:append:x86-64 =3D " ${@bb.utils.contains('KERNEL_DE=
BUG_OPTIONS', 'stack', 'HOST_LIBELF_LIBS=3D"-L${RECIPE_SYSROOT_NATIVE}/usr/=
lib/pkgconfig/../../../usr/lib/ -lelf"', '', d)}"
>>
>> The space would be intentional, as :append doesn't add one (or maybe
>>
>> I'm not seeing the removed space with the small font I'm currently
>> reading this with).
>
>
> but there is no space and what my patch does is adding it before the char=
 '$' change form 'x86-64 =3D "$' to 'x86-64 =3D " $'
> that afaik is the policy used when we need to append something to variabl=
e with :append (take into account the extra space)
>
> maybe my commit title can be changed to:
> linux-yocto: prepend the the value with a space when append to KERNEL_EXT=
RA_ARGS

Ah yes, the grammar of the short log made me misread the patch.

When someone says "adds a space ..", I read it as "it was adding a
space before, and I'm changing it to not do that".

"add a space" would be enough, but yes, the new shortlog is better and
is fine with me.

>
>>
>>
>> Was it causing a problem ?
>
>
> yes, if you use KERNEL_EXTRA_ARGS=3DX or KERNEL_EXTRA_ARGS:append=3DX in =
your code it doesn't work
> because of the missing space and at the end KERNEL_EXTRA_ARGS will have:
>
> KERNEL_EXTRA_ARGS =3D "XHOST_LIBELF_....
>
> instead of
>
> KERNEL_EXTRA_ARGS =3D "X HOST_LIBELF_....

yes, once I'm reading the shortlog and patch correctly, the potential
issues are clear!

Bruce

>
> Jose
>
>>
>> Bruce
>>
>> >
>> >  do_devshell:prepend() {
>> >      # setup native pkg-config variables (kconfig scripts call pkg-con=
fig directly, cannot generically be overriden to pkg-config-native)
>> > --
>> > 2.34.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#169281): https://lists.openembedded.org/g/openembe=
dded-core/message/169281
>> > Mute This Topic: https://lists.openembedded.org/mt/92977591/1050810
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[bruce.ashfield@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

