Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F58AC00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 14:21:26 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.11240.1660314077571620904
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 07:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nVmCxYhi;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id u3so1539225lfk.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 07:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=P3Vybp46XQG/aP2f9FGqM7WVdItwG8DjXIOjcfWpOgk=;
        b=nVmCxYhiKkg6yXDK2fXJYQHXmHjy+HD7uZ5ecqgcGmc7Rm+F37HOo7zikc556YVxmG
         PhKWacXQ9+hooK3d7z9ZRer+r07rMweVMr76smLmRpeNr3Qylu4BEOCwEi6cXuFrMskI
         BFfHqyR4ndsFFcqEHwJFmPFXHFZ1Ec7xbRSWcw1DhVHp5j3n9SblVa5izA1RjQG5Y2Ot
         Acu7ra6RAJCwwa+K/U2mRQJXs9xSDyKolXZTdHlvc/NYHDxxJsztuki2Ne1A6WhNRI70
         JtkPXQDEBihkgIOFAZwizWbVfhkMbD+pA4KmsEpTUMmadZz0DdGRRbOV//CsARm+a7aX
         d0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=P3Vybp46XQG/aP2f9FGqM7WVdItwG8DjXIOjcfWpOgk=;
        b=nwYFhDAEwnyPHjcvEt+msS9O1k9x1+insci3YD4P3fdMKCiXDRZwySZ9EZ4su4KXYl
         LQ2kzuukIsXea4mEnfCpxBxyv9pudNLmAp3jBFLm5fCgupan6DPCb1y+MoTbEqeSTNxv
         mUc62V0bprvHTOZJyuSrOn+saqVbZBY5EDfhubszYjscHH4M4TEvu4udBsWrN1wwLJq4
         hrvJh4gzlZtyVTfdDUXebxJZ2pjkuqn9c41/9ecOAIPW1OSvpZPXkJAhCe5xVrX9eySv
         3sTskV0vD1uRxrhVMBf46RS+KZH+scnjc3bTf3Q/FkZcX6DuZLdmrYW4idrZJuKxD7Zn
         7IHw==
X-Gm-Message-State: ACgBeo3qAYWz7Kz+uxN19XN64lnEXZwihbP2KSH+9PTBTqqu0U62vIPj
	hM7h27ooEYtzPnjcIiXk3fmxd5kaXzOTSC6jxFk=
X-Google-Smtp-Source: 
 AA6agR7UAKpUUuDs9a34JjZbSTVKGiXcFh5D3IuIHCwSCDXBte1TxRKI8nnfFHoRkFi7XOrS1RpDvT3a+DCiGcLN1Aw=
X-Received: by 2002:a05:6512:1082:b0:48a:f9b5:a563 with SMTP id
 j2-20020a056512108200b0048af9b5a563mr1514714lfg.471.1660314074353; Fri, 12
 Aug 2022 07:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220811161757.278819-1-jose.quaresma@foundries.io>
 <CADkTA4PaFdRpyxko=bpRQ5CVoAVgD8g8Nt4SMW_0USAYme3RkQ@mail.gmail.com>
 <CANPvuRmPVe_4D-hWkkZ93y=u6YuMVBu_KCADG1OH32aK-=OB_w@mail.gmail.com>
 <CADkTA4ONM+bq+onFjQSpYxU=qz8gyTEmpVTBBZR2S34t18HzAw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4ONM+bq+onFjQSpYxU=qz8gyTEmpVTBBZR2S34t18HzAw@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 12 Aug 2022 15:21:03 +0100
Message-ID: 
 <CANPvuRnXc_cC0ETfJWvkzRnXv9V8PNyJtf9Y5C=tmN3m4t9WNA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] module.bbclass: rebuild the modules when kernel
 change
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Ricardo Salveti <ricardo@foundries.io>, daiane.angolini@foundries.io,
	otavio@ossystems.com.br, Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000009e140705e60bfe87"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Aug 2022 14:21:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169286

--0000000000009e140705e60bfe87
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

I can replicate this issue without touching the do_shared_workdir using the
KERNEL_EXTRA_ARGS.

Update the bug ticket with the step to reproduce.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14885

Jose

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia quinta,
11/08/2022 =C3=A0(s) 18:46:

> On Thu, Aug 11, 2022 at 1:26 PM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> >
> >
> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia quinta,
> 11/08/2022 =C3=A0(s) 18:06:
> >>
> >> On Thu, Aug 11, 2022 at 12:18 PM Jose Quaresma <quaresma.jose@gmail.co=
m>
> wrote:
> >> >
> >> > When the kernel is rebuild or some of they tasks change the
> >> > kernel modules is not rebuild as well and will comes from
> >> > the sstate-cache.
> >> >
> >> > [YOCTO #14885]
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14885
> >> >
> >> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> >> > ---
> >> >  meta/classes/module.bbclass | 2 ++
> >> >  1 file changed, 2 insertions(+)
> >> >
> >> > diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbcla=
ss
> >> > index a09ec3ed1e..d377a08bc6 100644
> >> > --- a/meta/classes/module.bbclass
> >> > +++ b/meta/classes/module.bbclass
> >> > @@ -1,5 +1,7 @@
> >> >  inherit module-base kernel-module-split pkgconfig
> >> >
> >> > +DEPENDS +=3D "virtual/kernel"
> >>
> >> There's already a dependency on virtual/kernel:do_shared_workdir()
> through
> >> module-base.bbclass and the make-mod-scripts dependency.
> >
> >
> > I know that and imo the make-mod-scripts need to be cleaned up a bit as
> well
> > It is compile the the code do_configure and as a dependency in
> "virtual/kernel:do_compile_kernelmodules"
>
> Right. It doesn't save much, but being able to start dependent tasks even
> that bit sooner has proven to be a win. We get plenty of complaints about
> the kernel being a bottleneck, which is what lead to the finer dependency=
.
>
> > for they do_compile anyway this is another history and I will submit
> some patch when finished.
> > Another thing that I have in my mind is to make the  make-mod-scripts a
> native recipe because they
> > don't build anything for the target.
> >
>
> make-mod-scripts is a bit strange indeed, it sits somewhere in the middle=
,
> it
> does use the target compiler, etc, for some tests that the kernel fires a=
s
> part
> of even the scripts and preparation. Which is why it hasn't been -native
> only
> up until now .. it isn't out of the question that we could use it in
> more of a cross
> friendly way (there are some really old bugs/enhancements around that
> topic).
>
> It might be worth a try, but if it isn't breaking anything .. I tread
> very carefully
> around the kernel dependencies, shared-workdir and the scripts. We've had
> many subtle race conditions and other hard to debug issues.
>
> >>
> >>
> >> And that dependency was a change to this:
> >>
> >> -# This is instead of DEPENDS =3D "virtual/kernel"
> >> -do_configure[depends] +=3D "virtual/kernel:do_compile_kernelmodules"
> >>
> >> i.e. we've always had a finer grained dependency than what is being
> >> proposed here.
> >>
> >> We need to understand why that shared_workdir() dependency isn't
> >> doing the job any more, and if there's no way to fix it .. then going
> back
> >> to the older compile dependency is still lighter weight than depending
> >> on virtual/kernel (and the default of do_prepare_recipe_sysroot).
> >
> >
> > I can do another round in order to change another task, other than the
> shared_workdir,
> > that I think will do the same i.e: get the modules from the sstate-cach=
e.
> > I suspect this is unrelated to the task shared_workdir.
> >
> > Thanks for the feedback and your time.
>
> I can dig into it more as well, I'll see what I can find in some local
> builds.
>
> Bruce
>
> >
> > Jose
> >
> >>
> >>
> >> It must (could?) be something with the shared workdir changing the
> interactions.
> >>
> >> Bruce
> >>
> >> > +
> >> >  EXTRA_OEMAKE +=3D "KERNEL_SRC=3D${STAGING_KERNEL_DIR}"
> >> >
> >> >  MODULES_INSTALL_TARGET ?=3D "modules_install"
> >> > --
> >> > 2.37.1
> >> >
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#169253):
> https://lists.openembedded.org/g/openembedded-core/message/169253
> >> > Mute This Topic: https://lists.openembedded.org/mt/92962048/1050810
> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b
> [bruce.ashfield@gmail.com]
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000009e140705e60bfe87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bruce,<br><br>I can replicate this issue without touchi=
ng the do_shared_workdir using the KERNEL_EXTRA_ARGS.<br><br>Update the bug=
 ticket with the step to reproduce.<br><a href=3D"https://bugzilla.yoctopro=
ject.org/show_bug.cgi?id=3D14885">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D14885</a><br><br>Jose<br></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:br=
uce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; escreveu no dia qu=
inta, 11/08/2022 =C3=A0(s) 18:46:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Thu, Aug 11, 2022 at 1:26 PM Jose Quaresma &lt;<a href=
=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.c=
om</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt; escreveu no dia quinta, 11/08/=
2022 =C3=A0(s) 18:06:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Aug 11, 2022 at 12:18 PM Jose Quaresma &lt;<a href=3D"mail=
to:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&g=
t; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; When the kernel is rebuild or some of they tasks change the<b=
r>
&gt;&gt; &gt; kernel modules is not rebuild as well and will comes from<br>
&gt;&gt; &gt; the sstate-cache.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; [YOCTO #14885] <a href=3D"https://bugzilla.yoctoproject.org/s=
how_bug.cgi?id=3D14885" rel=3D"noreferrer" target=3D"_blank">https://bugzil=
la.yoctoproject.org/show_bug.cgi?id=3D14885</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quare=
sma@foundries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 meta/classes/module.bbclass | 2 ++<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/classes/module.bbclass b/meta/classes/modul=
e.bbclass<br>
&gt;&gt; &gt; index a09ec3ed1e..d377a08bc6 100644<br>
&gt;&gt; &gt; --- a/meta/classes/module.bbclass<br>
&gt;&gt; &gt; +++ b/meta/classes/module.bbclass<br>
&gt;&gt; &gt; @@ -1,5 +1,7 @@<br>
&gt;&gt; &gt;=C2=A0 inherit module-base kernel-module-split pkgconfig<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +DEPENDS +=3D &quot;virtual/kernel&quot;<br>
&gt;&gt;<br>
&gt;&gt; There&#39;s already a dependency on virtual/kernel:do_shared_workd=
ir() through<br>
&gt;&gt; module-base.bbclass and the make-mod-scripts dependency.<br>
&gt;<br>
&gt;<br>
&gt; I know that and imo the make-mod-scripts need to be cleaned up a bit a=
s well<br>
&gt; It is compile the the code do_configure and as a dependency in &quot;v=
irtual/kernel:do_compile_kernelmodules&quot;<br>
<br>
Right. It doesn&#39;t save much, but being able to start dependent tasks ev=
en<br>
that bit sooner has proven to be a win. We get plenty of complaints about<b=
r>
the kernel being a bottleneck, which is what lead to the finer dependency.<=
br>
<br>
&gt; for they do_compile anyway this is another history and I will submit s=
ome patch when finished.<br>
&gt; Another thing that I have in my mind is to make the=C2=A0 make-mod-scr=
ipts a native recipe because they<br>
&gt; don&#39;t build anything for the target.<br>
&gt;<br>
<br>
make-mod-scripts is a bit strange indeed, it sits somewhere in the middle, =
it<br>
does use the target compiler, etc, for some tests that the kernel fires as =
part<br>
of even the scripts and preparation. Which is why it hasn&#39;t been -nativ=
e only<br>
up until now .. it isn&#39;t out of the question that we could use it in<br=
>
more of a cross<br>
friendly way (there are some really old bugs/enhancements around that topic=
).<br>
<br>
It might be worth a try, but if it isn&#39;t breaking anything .. I tread<b=
r>
very carefully<br>
around the kernel dependencies, shared-workdir and the scripts. We&#39;ve h=
ad<br>
many subtle race conditions and other hard to debug issues.<br>
<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; And that dependency was a change to this:<br>
&gt;&gt;<br>
&gt;&gt; -# This is instead of DEPENDS =3D &quot;virtual/kernel&quot;<br>
&gt;&gt; -do_configure[depends] +=3D &quot;virtual/kernel:do_compile_kernel=
modules&quot;<br>
&gt;&gt;<br>
&gt;&gt; i.e. we&#39;ve always had a finer grained dependency than what is =
being<br>
&gt;&gt; proposed here.<br>
&gt;&gt;<br>
&gt;&gt; We need to understand why that shared_workdir() dependency isn&#39=
;t<br>
&gt;&gt; doing the job any more, and if there&#39;s no way to fix it .. the=
n going back<br>
&gt;&gt; to the older compile dependency is still lighter weight than depen=
ding<br>
&gt;&gt; on virtual/kernel (and the default of do_prepare_recipe_sysroot).<=
br>
&gt;<br>
&gt;<br>
&gt; I can do another round in order to change another task, other than the=
 shared_workdir,<br>
&gt; that I think will do the same i.e: get the modules from the sstate-cac=
he.<br>
&gt; I suspect this is unrelated to the task shared_workdir.<br>
&gt;<br>
&gt; Thanks for the feedback and your time.<br>
<br>
I can dig into it more as well, I&#39;ll see what I can find in some local =
builds.<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Jose<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; It must (could?) be something with the shared workdir changing the=
 interactions.<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 EXTRA_OEMAKE +=3D &quot;KERNEL_SRC=3D${STAGING_KERNEL_D=
IR}&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 MODULES_INSTALL_TARGET ?=3D &quot;modules_install&quot;=
<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.37.1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#169253): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/message/169253" rel=3D"noreferrer" target=3D"=
_blank">https://lists.openembedded.org/g/openembedded-core/message/169253</=
a><br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/92962048/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/mt/92962048/1050810</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.openemb=
edded.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfie=
ld@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait<br>
&gt;&gt; thee at its end<br>
&gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Best regards,<br>
&gt;<br>
&gt; Jos=C3=A9 Quaresma<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div>

--0000000000009e140705e60bfe87--

