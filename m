Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E40FC19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 17:46:30 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web08.874.1660239986891353023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 10:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EGSgvhOr;
 spf=pass (domain: gmail.com, ip: 209.85.160.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-10e615a36b0so22348492fac.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 10:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=yQXbLtxq/A3xL7qcy0XRDXGM2HA6E6STLGychi0y4dM=;
        b=EGSgvhOrN0xj6SRqceO9H1/e0ATPOXdnBmb3xwHW+hEqiH/h34BZK87c9jdbjYZ9Jm
         FgPMmR6AqEbfwQPvHoC3PVmeN3WQVdrqK35BBERZvu08P3OOXGEexXl+hgarMdsXGV3c
         hVrvgloi8sZ63QfUGsN9P+kul8LUsOAw3yPYo/2SN4IS+n7kaIcVknSZSvXDLthvr5jl
         UElJ8AAEiHeg0nLZ6in6wTZAgUA8O4FXE3M/vn/LIfnTpR2RZiTOdMMXGIz88xJVfpAm
         1siyySPpU0qyMsgFX+5J+yb2It43JngCQ/3Gb9R6QzEs3/eFe4pA+VKnE6c+JHYp5Csp
         T+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=yQXbLtxq/A3xL7qcy0XRDXGM2HA6E6STLGychi0y4dM=;
        b=uyInLoVUv/7JeKxuTwrZEpIuecF2uY4JfFVIw2BTObpMOdhouUIyFwiFNXJouqD7wc
         xmGnBCl81Y11qkR7wWFS4zR2/hQJV8g7SCumZTzvEFji5gVcnuxQJx4VLrcw3zPgU8as
         HdMmt3L33gJxxTBnSDHWwH76L6Cdo5OS4KmfeGbREtCYKzcfCwVs7lh8vBWd7/jQe395
         jmznZje1VF0qW28nIvAvlPq14bANi2ISQGiIvxNyf3/BDdPDN4iHhcIFpb5U5lnTt509
         EOxRKIA5gS7M6QaUK6aUaeSLhvsaHc9oezNn/JxoMMEF5OrjsB2GwaASGoONFoN1O5yn
         xycA==
X-Gm-Message-State: ACgBeo0bd+6CmKdF2c5bDJpA40qAb12ZTLdyFvE4940iQjey0gUeF+1J
	raLVs0uS/Uj6SrEh2it9INGqOK6Of17KtuT3nuU=
X-Google-Smtp-Source: 
 AA6agR5a2w01D1SBaCJuhCQQ1fizpb9q0N2aytpsqO4xOSyBjx2NU2xXeYopsaUEuSus+PZFQuSxYBqgx277o9ZxNfY=
X-Received: by 2002:a05:6870:4388:b0:10e:803f:9dae with SMTP id
 r8-20020a056870438800b0010e803f9daemr3944880oah.175.1660239986209; Thu, 11
 Aug 2022 10:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220811161757.278819-1-jose.quaresma@foundries.io>
 <CADkTA4PaFdRpyxko=bpRQ5CVoAVgD8g8Nt4SMW_0USAYme3RkQ@mail.gmail.com>
 <CANPvuRmPVe_4D-hWkkZ93y=u6YuMVBu_KCADG1OH32aK-=OB_w@mail.gmail.com>
In-Reply-To: 
 <CANPvuRmPVe_4D-hWkkZ93y=u6YuMVBu_KCADG1OH32aK-=OB_w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Aug 2022 13:46:17 -0400
Message-ID: 
 <CADkTA4ONM+bq+onFjQSpYxU=qz8gyTEmpVTBBZR2S34t18HzAw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] module.bbclass: rebuild the modules when kernel
 change
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Ricardo Salveti <ricardo@foundries.io>, daiane.angolini@foundries.io,
	otavio@ossystems.com.br, Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 17:46:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169262

On Thu, Aug 11, 2022 at 1:26 PM Jose Quaresma <quaresma.jose@gmail.com> wro=
te:
>
>
>
> Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia quinta, 11/08/2=
022 =C3=A0(s) 18:06:
>>
>> On Thu, Aug 11, 2022 at 12:18 PM Jose Quaresma <quaresma.jose@gmail.com>=
 wrote:
>> >
>> > When the kernel is rebuild or some of they tasks change the
>> > kernel modules is not rebuild as well and will comes from
>> > the sstate-cache.
>> >
>> > [YOCTO #14885] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D148=
85
>> >
>> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> > ---
>> >  meta/classes/module.bbclass | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
>> > index a09ec3ed1e..d377a08bc6 100644
>> > --- a/meta/classes/module.bbclass
>> > +++ b/meta/classes/module.bbclass
>> > @@ -1,5 +1,7 @@
>> >  inherit module-base kernel-module-split pkgconfig
>> >
>> > +DEPENDS +=3D "virtual/kernel"
>>
>> There's already a dependency on virtual/kernel:do_shared_workdir() throu=
gh
>> module-base.bbclass and the make-mod-scripts dependency.
>
>
> I know that and imo the make-mod-scripts need to be cleaned up a bit as w=
ell
> It is compile the the code do_configure and as a dependency in "virtual/k=
ernel:do_compile_kernelmodules"

Right. It doesn't save much, but being able to start dependent tasks even
that bit sooner has proven to be a win. We get plenty of complaints about
the kernel being a bottleneck, which is what lead to the finer dependency.

> for they do_compile anyway this is another history and I will submit some=
 patch when finished.
> Another thing that I have in my mind is to make the  make-mod-scripts a n=
ative recipe because they
> don't build anything for the target.
>

make-mod-scripts is a bit strange indeed, it sits somewhere in the middle, =
it
does use the target compiler, etc, for some tests that the kernel fires as =
part
of even the scripts and preparation. Which is why it hasn't been -native on=
ly
up until now .. it isn't out of the question that we could use it in
more of a cross
friendly way (there are some really old bugs/enhancements around that topic=
).

It might be worth a try, but if it isn't breaking anything .. I tread
very carefully
around the kernel dependencies, shared-workdir and the scripts. We've had
many subtle race conditions and other hard to debug issues.

>>
>>
>> And that dependency was a change to this:
>>
>> -# This is instead of DEPENDS =3D "virtual/kernel"
>> -do_configure[depends] +=3D "virtual/kernel:do_compile_kernelmodules"
>>
>> i.e. we've always had a finer grained dependency than what is being
>> proposed here.
>>
>> We need to understand why that shared_workdir() dependency isn't
>> doing the job any more, and if there's no way to fix it .. then going ba=
ck
>> to the older compile dependency is still lighter weight than depending
>> on virtual/kernel (and the default of do_prepare_recipe_sysroot).
>
>
> I can do another round in order to change another task, other than the sh=
ared_workdir,
> that I think will do the same i.e: get the modules from the sstate-cache.
> I suspect this is unrelated to the task shared_workdir.
>
> Thanks for the feedback and your time.

I can dig into it more as well, I'll see what I can find in some local buil=
ds.

Bruce

>
> Jose
>
>>
>>
>> It must (could?) be something with the shared workdir changing the inter=
actions.
>>
>> Bruce
>>
>> > +
>> >  EXTRA_OEMAKE +=3D "KERNEL_SRC=3D${STAGING_KERNEL_DIR}"
>> >
>> >  MODULES_INSTALL_TARGET ?=3D "modules_install"
>> > --
>> > 2.37.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#169253): https://lists.openembedded.org/g/openembe=
dded-core/message/169253
>> > Mute This Topic: https://lists.openembedded.org/mt/92962048/1050810
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

