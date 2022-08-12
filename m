Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7908CC00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 14:42:39 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web08.21.1660315353391888313
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 07:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bp6xl2/c;
 spf=pass (domain: gmail.com, ip: 209.85.160.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so1138233fac.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 07:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=kPOwqG3dUIV5KHAIQHXf+VKW0/PfEBZltvxPmMErCs0=;
        b=Bp6xl2/cSVD4aG/QMD3n7jgi9+s1rT1inFiRvagmu4KzVCp7FGQtVmApm5Qse0NnTc
         9zo37dvGsJFEEHhg/ZKQS6S5sBrM1QmCXeJKcTS3Bo4z0rRnrrOiayCQ9c1ZJPDAhlMb
         TJqnfyrVvrUMt1E/hSosOchsRwE0C6m48DYqcRZ6aAYzaGjQAxHS5thWW1pYMVRIDJHL
         jePsYS+nzN5qJgMqwZV/OXBXRRCG75dcs3gbSvhPxwGeJ6ghJLeFVzcgfzsi9hjOd4kb
         UtG/dbvDhnLq1KBHDyaYT8tQ6WcRk+I02qLiwZu+OH84+AbzD4z4oX3NFftpKyq32nbQ
         AB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=kPOwqG3dUIV5KHAIQHXf+VKW0/PfEBZltvxPmMErCs0=;
        b=HjLxmhkP374lIM5YrRSHttDOpvhvcv89+BWRhpBsv2dYcrzf3yBKcBwAwKz91yUIUf
         3OjweFnlY8kktqfpbskYph8NP+DP0j3dtObNMHAgbM9xBdbaXIVl91+Tj+gYYadTujiA
         Bw4JiIhApsFQNFUTbFKRHOPlD/p7+NsC6EXkqQkj9DSMBLNgQGjWdfXo2M6S+HWV06Vk
         95Of/PNj5mqSzFP6cRZi7QN6OMzOYcy7dRWZK6fSsuOyjJWD510G3T3C2iNKi+X25Y2l
         7W+uaHatCh271o+F6tNMW/5D3RNgYKrse4vH0wMK0LbpwkOwhHlKWkj5UrGItLk5AVE8
         A2Dg==
X-Gm-Message-State: ACgBeo164bB9++YesSUckj5krMVCRSe88qD/v/vsZgrJvXvHHccbbmPf
	r44DzrJYJ/eeBkdDLUAVtgty43Hf03OGsOdJGIc=
X-Google-Smtp-Source: 
 AA6agR4RXrULFkob6QJ8aH6daL8jHihwtY+YVjs0FyfOgGmU8lIt0O7J7uSsxwUnxEkIyT09/mM4XcEXXqymWnyV680=
X-Received: by 2002:a05:6870:d29d:b0:10e:747b:f87b with SMTP id
 d29-20020a056870d29d00b0010e747bf87bmr5927493oae.6.1660315352644; Fri, 12 Aug
 2022 07:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220811161757.278819-1-jose.quaresma@foundries.io>
 <CADkTA4PaFdRpyxko=bpRQ5CVoAVgD8g8Nt4SMW_0USAYme3RkQ@mail.gmail.com>
 <CANPvuRmPVe_4D-hWkkZ93y=u6YuMVBu_KCADG1OH32aK-=OB_w@mail.gmail.com>
 <CADkTA4ONM+bq+onFjQSpYxU=qz8gyTEmpVTBBZR2S34t18HzAw@mail.gmail.com>
 <CANPvuRnXc_cC0ETfJWvkzRnXv9V8PNyJtf9Y5C=tmN3m4t9WNA@mail.gmail.com>
In-Reply-To: 
 <CANPvuRnXc_cC0ETfJWvkzRnXv9V8PNyJtf9Y5C=tmN3m4t9WNA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 12 Aug 2022 10:42:21 -0400
Message-ID: 
 <CADkTA4OtHvmYyzRHLfhNqzAwcST6u9c4p1x5taUrsE0PFbBj+g@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 12 Aug 2022 14:42:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169287

On Fri, Aug 12, 2022 at 10:21 AM Jose Quaresma <quaresma.jose@gmail.com> wr=
ote:
>
> Hi Bruce,
>
> I can replicate this issue without touching the do_shared_workdir using t=
he KERNEL_EXTRA_ARGS.
>
> Update the bug ticket with the step to reproduce.
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14885

Thanks for the update. I'll have a look shortly!

Bruce

>
> Jose
>
> Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia quinta, 11/08/2=
022 =C3=A0(s) 18:46:
>>
>> On Thu, Aug 11, 2022 at 1:26 PM Jose Quaresma <quaresma.jose@gmail.com> =
wrote:
>> >
>> >
>> >
>> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia quinta, 11/0=
8/2022 =C3=A0(s) 18:06:
>> >>
>> >> On Thu, Aug 11, 2022 at 12:18 PM Jose Quaresma <quaresma.jose@gmail.c=
om> wrote:
>> >> >
>> >> > When the kernel is rebuild or some of they tasks change the
>> >> > kernel modules is not rebuild as well and will comes from
>> >> > the sstate-cache.
>> >> >
>> >> > [YOCTO #14885] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
14885
>> >> >
>> >> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> >> > ---
>> >> >  meta/classes/module.bbclass | 2 ++
>> >> >  1 file changed, 2 insertions(+)
>> >> >
>> >> > diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbcl=
ass
>> >> > index a09ec3ed1e..d377a08bc6 100644
>> >> > --- a/meta/classes/module.bbclass
>> >> > +++ b/meta/classes/module.bbclass
>> >> > @@ -1,5 +1,7 @@
>> >> >  inherit module-base kernel-module-split pkgconfig
>> >> >
>> >> > +DEPENDS +=3D "virtual/kernel"
>> >>
>> >> There's already a dependency on virtual/kernel:do_shared_workdir() th=
rough
>> >> module-base.bbclass and the make-mod-scripts dependency.
>> >
>> >
>> > I know that and imo the make-mod-scripts need to be cleaned up a bit a=
s well
>> > It is compile the the code do_configure and as a dependency in "virtua=
l/kernel:do_compile_kernelmodules"
>>
>> Right. It doesn't save much, but being able to start dependent tasks eve=
n
>> that bit sooner has proven to be a win. We get plenty of complaints abou=
t
>> the kernel being a bottleneck, which is what lead to the finer dependenc=
y.
>>
>> > for they do_compile anyway this is another history and I will submit s=
ome patch when finished.
>> > Another thing that I have in my mind is to make the  make-mod-scripts =
a native recipe because they
>> > don't build anything for the target.
>> >
>>
>> make-mod-scripts is a bit strange indeed, it sits somewhere in the middl=
e, it
>> does use the target compiler, etc, for some tests that the kernel fires =
as part
>> of even the scripts and preparation. Which is why it hasn't been -native=
 only
>> up until now .. it isn't out of the question that we could use it in
>> more of a cross
>> friendly way (there are some really old bugs/enhancements around that to=
pic).
>>
>> It might be worth a try, but if it isn't breaking anything .. I tread
>> very carefully
>> around the kernel dependencies, shared-workdir and the scripts. We've ha=
d
>> many subtle race conditions and other hard to debug issues.
>>
>> >>
>> >>
>> >> And that dependency was a change to this:
>> >>
>> >> -# This is instead of DEPENDS =3D "virtual/kernel"
>> >> -do_configure[depends] +=3D "virtual/kernel:do_compile_kernelmodules"
>> >>
>> >> i.e. we've always had a finer grained dependency than what is being
>> >> proposed here.
>> >>
>> >> We need to understand why that shared_workdir() dependency isn't
>> >> doing the job any more, and if there's no way to fix it .. then going=
 back
>> >> to the older compile dependency is still lighter weight than dependin=
g
>> >> on virtual/kernel (and the default of do_prepare_recipe_sysroot).
>> >
>> >
>> > I can do another round in order to change another task, other than the=
 shared_workdir,
>> > that I think will do the same i.e: get the modules from the sstate-cac=
he.
>> > I suspect this is unrelated to the task shared_workdir.
>> >
>> > Thanks for the feedback and your time.
>>
>> I can dig into it more as well, I'll see what I can find in some local b=
uilds.
>>
>> Bruce
>>
>> >
>> > Jose
>> >
>> >>
>> >>
>> >> It must (could?) be something with the shared workdir changing the in=
teractions.
>> >>
>> >> Bruce
>> >>
>> >> > +
>> >> >  EXTRA_OEMAKE +=3D "KERNEL_SRC=3D${STAGING_KERNEL_DIR}"
>> >> >
>> >> >  MODULES_INSTALL_TARGET ?=3D "modules_install"
>> >> > --
>> >> > 2.37.1
>> >> >
>> >> >
>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> > Links: You receive all messages sent to this group.
>> >> > View/Reply Online (#169253): https://lists.openembedded.org/g/opene=
mbedded-core/message/169253
>> >> > Mute This Topic: https://lists.openembedded.org/mt/92962048/1050810
>> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub [bruce.ashfield@gmail.com]
>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> >
>> >>
>> >>
>> >> --
>> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> >> thee at its end
>> >> - "Use the force Harry" - Gandalf, Star Trek II
>> >
>> >
>> >
>> > --
>> > Best regards,
>> >
>> > Jos=C3=A9 Quaresma
>>
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

