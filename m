Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD2EC77B61
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 10:31:01 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web11.47405.1682332258477030912
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 03:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QkmUl2W5;
 spf=pass (domain: gmail.com, ip: 209.85.222.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-77858d8dcb5so18248190241.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 03:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682332257; x=1684924257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VUEva/UIXEMiRFIUP6H8TaT+C5zr8ac1neO3oiMPTHg=;
        b=QkmUl2W5F9DuhZFyOY0yViR/lhjWB89erwODu7D6pXglNYR28Ty84N1vNf0/A9wjHB
         22pPlLYVRF/wPdKwOZ9HbCIvmhxJd2t1moktsvSu5kfiEQJphkG5aI6aS6RfVjlRxTYw
         mAaHeFURjWbfGHe+HRdEevOOFUcdUVJDbx6jxEnCI/BrgCRUOCACRZjsTUc3LGZp0Ggb
         +5oUDYuP+D6+0Vse6qDpw3DRBTyVrdrpgTo/NVgoF8YlruGUvxuGS179O4AcaL4W0q6T
         L+NyWGJtGsMDFNanlhOexoAN2N6dBoOG/jxnnWa/nJRNMqsILzS6pUyDTsU0X7HU6xMw
         HsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682332257; x=1684924257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUEva/UIXEMiRFIUP6H8TaT+C5zr8ac1neO3oiMPTHg=;
        b=kRs5YPsIaQRCtuWvMV5DDNknKv5b+8yAa7T1ffajtPBcGzbsh3LSn5xuaWa+qkO/1t
         CUyW6BH2DVgEKIQrN+K/YNthZfNhJMDK8IN0QQF2h7+DSXtYLQC6PLq+uVnceDxx0jrz
         V8TxqOgYMAjP8SV5Yklt2fF97HZv8moH5UM55x6YLELPL7gnSCDC+k06WAo516yge17H
         Fpfr0twkVYj579HZwFwtUaRS3OL6E2f/z0Lw9h1PZUO1dknBBnUVjCH/0NOGyylWmJDV
         LhXjS8g0Dzk529F4TCdhl2YzaWO4ofBbGHgSQSzvfaUhRxdFAENsXURPi0xOXy2cr17P
         nmCA==
X-Gm-Message-State: AAQBX9fNY0bXmj5gqb8TQE7rvMPmbH1VuBBicYv0QRfFVMUALnwPiN39
	IpKowZVTORmw/fCqSR7vywdX1jHQKQd+Gqu6O0k=
X-Google-Smtp-Source: AKy350ZOmMlwHCyjno9aLsFb/pIie2hWW+u1rIxmFNSBbPEhYT+GxB3KHKrrICgxIqPklUiJgQw4MNGH+cJyqI2dMPQ=
X-Received: by 2002:a05:6102:5585:b0:430:cea:e19a with SMTP id
 dc5-20020a056102558500b004300ceae19amr6363257vsb.0.1682332257369; Mon, 24 Apr
 2023 03:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230416103052.28268-1-christoph.lauer@email.de>
 <27b6976546dae12e92dd3af28f657c02eca4afe8.camel@linuxfoundation.org>
 <CANPvuRnSPULJzxC0qt=sQLWS5jyx4OkJ2cQobDzHs0LmmBG6MQ@mail.gmail.com>
 <CADkTA4N9Sypxccr0OU6KQxPK5rbsL_mNFGaJ2Zn_jYHL1tNSEg@mail.gmail.com>
 <652908a6640ffc911d46613cb99159086131416f.camel@linuxfoundation.org>
 <CADkTA4MBh46pqJoQjW4dhOc3Sw-4+rr-u4d48OPSs9eC1VPx8A@mail.gmail.com>
 <CANPvuR=M0-ndA609d2i43rgVVSPrHzEeo5o7orRjmeR9BA5_QQ@mail.gmail.com>
 <CADkTA4MMj6qUNHyjNV6QxE0iZAwA8=Ur6Ks4_7ETJtmrv6TrNA@mail.gmail.com>
 <CANPvuRmb7Kh3hgjZEcr1vU4czrULvLYabk3apBERQbo4RJ8y3w@mail.gmail.com>
 <afb0f1d6405256d9dfc6bd5bc0a642ddb1dd82c5.camel@linuxfoundation.org>
 <175785898B60CE37.9727@lists.openembedded.org> <CADkTA4MQty2wAcBrDGT=vqVeAHpMbzKjpf8-6xbH7UKa2R6wsg@mail.gmail.com>
 <7b254d25-03b9-5d0a-4257-4d43c50d069f@email.de> <CADkTA4OPx0hNnp1MfAyB45H8j4Degyz9JtVcXxK_sta=X1AKaw@mail.gmail.com>
In-Reply-To: <CADkTA4OPx0hNnp1MfAyB45H8j4Degyz9JtVcXxK_sta=X1AKaw@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 24 Apr 2023 11:30:46 +0100
Message-ID: <CANPvuRnWCXKCyYEmrLfGRxmrC0w4dDnSNN_H3-LfmOyctQ9XwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Christoph Lauer <Christoph.Lauer@email.de>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Christoph Lauer <christoph.lauer@xtronic.de>
Content-Type: multipart/alternative; boundary="0000000000009840fb05fa1280d0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 10:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180349

--0000000000009840fb05fa1280d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia domingo,
23/04/2023 =C3=A0(s) 20:55:

> On Sat, Apr 22, 2023 at 9:06=E2=80=AFAM Christoph Lauer
> <Christoph.Lauer@email.de> wrote:
> >
> > Am 21.04.23 um 22:28 schrieb Bruce Ashfield:
> > > On Wed, Apr 19, 2023 at 11:03=E2=80=AFPM Bruce Ashfield via
> > > lists.openembedded.org
> > > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> > >>
> > >> On Wed, Apr 19, 2023 at 6:54=E2=80=AFPM Richard Purdie
> > >> <richard.purdie@linuxfoundation.org> wrote:
> > >>>
> > >>> On Wed, 2023-04-19 at 23:34 +0100, Jose Quaresma wrote:
> > >>>> Hi,
> > >>>>
> > >>>> Not related with the previous discussion but just for
> > >>>> your information.
> > >>>> The rm_work.bbclass has an exception for the kernel recipes [1].
> > >>>> So I don't understand why we can't do the same for the make-mod-
> > >>>> scripts
> > >>>> who is the twin brother of all these kernel recipes.
> > >>>>
> > >>>> [1]
> > >>>>
> https://git.openembedded.org/openembedded-core/tree/meta/classes/rm_work.=
bbclass#n168
> > >>>
> > >>> Ideally we wouldn't be doing this for the kernel recipes.
> > >>>
> > >>> There is also a big difference to that and the proposed patch. The
> > >>> proposed patch was preserving a specific directory rather than an
> > >>> entire recipe. Removing the task stamps but leaving a small piece o=
f
> > >>> WORKDIR is quite different to preserving WORKDIR and STAMPS for a
> > >>> specific recipe. The former is not tested and will break things. Th=
e
> > >>> latter is better tolerated by bitbake.
> > >>
> > >> Agreed.
> > >>
> > >> Plus, I am working on this now.
> > >>
> > >> I have static linking of the scripts/tools working, but what I haven=
't
> > >> figured out is how to do that without patching the Makefiles.
> > >>
> > >
> > > It turned out to be quite the battle to get older kernels what was
> > > required for static linking of the tools.
> > >
> > > Attached is my WIP patch. I'm out of the office early next week, but
> > > will revisit it once I'm back.
> > >
> > > Bruce
> > >
> > >> Next up will be some rpath trickery.
> > >>
> > >> Bruce
> > >>
> > >>>
> > >>> So yes, we could do the same. I'm sure there will be other recipes
> > >>> people want to preserve for other reasons. Where do we draw the lin=
e?
> > >>> We could preserve everything and drop rm_work, then we wouldn't hav=
e
> > >>> these problems? :)
> > >>>
> > >>> Cheers,
> > >>>
> > >>> Richard
> > >>
> > >>
> > >>
> > >> --
> > >> - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
> > >> thee at its end
> > >> - "Use the force Harry" - Gandalf, Star Trek II
> > >>
> > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >> Links: You receive all messages sent to this group.
> > >> View/Reply Online (#180233):
> https://lists.openembedded.org/g/openembedded-core/message/180233
> > >> Mute This Topic: https://lists.openembedded.org/mt/98296212/1050810
> > >> Group Owner: openembedded-core+owner@lists.openembedded.org
> > >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b
> [bruce.ashfield@gmail.com]
> > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >>
> > >
> > >
> >
> > Thank you for your work, I see you put some time and effort into it.
> > HOSTPKG_CONFIG is, as you mentioned, available since kernel version 5.1=
9
>
> Yes, I realize that and documented it in the patch ... but I also
> tested on pre-5.19 kernels and what I have in the patch works. Did it
> not work in your testing ?
>

I will test the patch on a couple of kernel versions with some of them
pre-5.19
but all in 5 major versions.
I will say something about my results later this week.

Thanks for working on this one.

Jose


>
> > (see kernel patch [1]), so we need a way to call 'pkg-config --static'
> > with pre-5.19 kernels. A way without modifying the Makefile would be to
> > modify openssls pkg-config in recipe-sysroot-native of make-mod-script,
> > so 'pkg-config --libs' actually shows the dependencies of 'pkg-config
> > --static --libs', but it's a bit hacky.
>
> Already considered, and discarded. That's not going to fly.
>
> >
> > Also fully-static executables still need the same glibc during runtime
> > that they were built with, which makes them error-prone and is generall=
y
> > discouraged. As an alternative, we could build dynamic executables that
> > use the static libcrypto library. The linker links by default against
> > the shared library, so we could remove them from recipe-sysroot-native
> > to force linking against the static library (again, somewhat hacky).
>
> Also considered and discarded.
>
> As do the dynamically linked ones for the c runtime. We aren't talking
> about using these outside of a single build and they are generated on
> the fly, so again, there's very little concern about runtimes changing
> after linking.. There's less risk in static than in the alternatives.
>
> Bruce
>
>
> >
> > [1]
> >
> https://github.com/torvalds/linux/commit/d5ea4fece4508bf8e72b659cd22fa484=
0d8d61e5
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

--0000000000009840fb05fa1280d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; escreveu no dia =
domingo, 23/04/2023 =C3=A0(s) 20:55:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Sat, Apr 22, 2023 at 9:06=E2=80=AFAM Christoph Laue=
r<br>
&lt;<a href=3D"mailto:Christoph.Lauer@email.de" target=3D"_blank">Christoph=
.Lauer@email.de</a>&gt; wrote:<br>
&gt;<br>
&gt; Am 21.04.23 um 22:28 schrieb Bruce Ashfield:<br>
&gt; &gt; On Wed, Apr 19, 2023 at 11:03=E2=80=AFPM Bruce Ashfield via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.openembedd=
ed.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<b=
r>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Wed, Apr 19, 2023 at 6:54=E2=80=AFPM Richard Purdie<br>
&gt; &gt;&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" tar=
get=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; On Wed, 2023-04-19 at 23:34 +0100, Jose Quaresma wrote:<b=
r>
&gt; &gt;&gt;&gt;&gt; Hi,<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Not related with the previous discussion but just for=
<br>
&gt; &gt;&gt;&gt;&gt; your information.<br>
&gt; &gt;&gt;&gt;&gt; The rm_work.bbclass has an exception for the kernel r=
ecipes [1].<br>
&gt; &gt;&gt;&gt;&gt; So I don&#39;t understand why we can&#39;t do the sam=
e for the make-mod-<br>
&gt; &gt;&gt;&gt;&gt; scripts<br>
&gt; &gt;&gt;&gt;&gt; who is the twin brother of all these kernel recipes.<=
br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; [1]<br>
&gt; &gt;&gt;&gt;&gt; <a href=3D"https://git.openembedded.org/openembedded-=
core/tree/meta/classes/rm_work.bbclass#n168" rel=3D"noreferrer" target=3D"_=
blank">https://git.openembedded.org/openembedded-core/tree/meta/classes/rm_=
work.bbclass#n168</a><br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Ideally we wouldn&#39;t be doing this for the kernel reci=
pes.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; There is also a big difference to that and the proposed p=
atch. The<br>
&gt; &gt;&gt;&gt; proposed patch was preserving a specific directory rather=
 than an<br>
&gt; &gt;&gt;&gt; entire recipe. Removing the task stamps but leaving a sma=
ll piece of<br>
&gt; &gt;&gt;&gt; WORKDIR is quite different to preserving WORKDIR and STAM=
PS for a<br>
&gt; &gt;&gt;&gt; specific recipe. The former is not tested and will break =
things. The<br>
&gt; &gt;&gt;&gt; latter is better tolerated by bitbake.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Agreed.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Plus, I am working on this now.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I have static linking of the scripts/tools working, but what =
I haven&#39;t<br>
&gt; &gt;&gt; figured out is how to do that without patching the Makefiles.=
<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; It turned out to be quite the battle to get older kernels what wa=
s<br>
&gt; &gt; required for static linking of the tools.<br>
&gt; &gt;<br>
&gt; &gt; Attached is my WIP patch. I&#39;m out of the office early next we=
ek, but<br>
&gt; &gt; will revisit it once I&#39;m back.<br>
&gt; &gt;<br>
&gt; &gt; Bruce<br>
&gt; &gt;<br>
&gt; &gt;&gt; Next up will be some rpath trickery.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Bruce<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; So yes, we could do the same. I&#39;m sure there will be =
other recipes<br>
&gt; &gt;&gt;&gt; people want to preserve for other reasons. Where do we dr=
aw the line?<br>
&gt; &gt;&gt;&gt; We could preserve everything and drop rm_work, then we wo=
uldn&#39;t have<br>
&gt; &gt;&gt;&gt; these problems? :)<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Cheers,<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Richard<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and madne=
ss await<br>
&gt; &gt;&gt; thee at its end<br>
&gt; &gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;&gt; Links: You receive all messages sent to this group.<br>
&gt; &gt;&gt; View/Reply Online (#180233): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/message/180233" rel=3D"noreferrer" target=3D"=
_blank">https://lists.openembedded.org/g/openembedded-core/message/180233</=
a><br>
&gt; &gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/98296212/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/mt/98296212/1050810</a><br>
&gt; &gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.openemb=
edded.org</a><br>
&gt; &gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfie=
ld@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; Thank you for your work, I see you put some time and effort into it.<b=
r>
&gt; HOSTPKG_CONFIG is, as you mentioned, available since kernel version 5.=
19<br>
<br>
Yes, I realize that and documented it in the patch ... but I also<br>
tested on pre-5.19 kernels and what I have in the patch works. Did it<br>
not work in your testing ?<br></blockquote><div><br></div><div>I will test =
the patch on a couple of kernel versions with some of them pre-5.19</div><d=
iv>but all in 5 major versions.=C2=A0<br>I will say something about my resu=
lts later this week.<br><br></div>Thanks for working on this one.<br><br>Jo=
se<br><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; (see kernel patch [1]), so we need a way to call &#39;pkg-config --sta=
tic&#39;<br>
&gt; with pre-5.19 kernels. A way without modifying the Makefile would be t=
o<br>
&gt; modify openssls pkg-config in recipe-sysroot-native of make-mod-script=
,<br>
&gt; so &#39;pkg-config --libs&#39; actually shows the dependencies of &#39=
;pkg-config<br>
&gt; --static --libs&#39;, but it&#39;s a bit hacky.<br>
<br>
Already considered, and discarded. That&#39;s not going to fly.<br>
<br>
&gt;<br>
&gt; Also fully-static executables still need the same glibc during runtime=
<br>
&gt; that they were built with, which makes them error-prone and is general=
ly<br>
&gt; discouraged. As an alternative, we could build dynamic executables tha=
t<br>
&gt; use the static libcrypto library. The linker links by default against<=
br>
&gt; the shared library, so we could remove them from recipe-sysroot-native=
<br>
&gt; to force linking against the static library (again, somewhat hacky).<b=
r>
<br>
Also considered and discarded.<br>
<br>
As do the dynamically linked ones for the c runtime. We aren&#39;t talking<=
br>
about using these outside of a single build and they are generated on<br>
the fly, so again, there&#39;s very little concern about runtimes changing<=
br>
after linking.. There&#39;s less risk in static than in the alternatives.<b=
r>
<br>
Bruce<br>
<br>
<br>
&gt;<br>
&gt; [1]<br>
&gt; <a href=3D"https://github.com/torvalds/linux/commit/d5ea4fece4508bf8e7=
2b659cd22fa4840d8d61e5" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/torvalds/linux/commit/d5ea4fece4508bf8e72b659cd22fa4840d8d61e5</a><br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000009840fb05fa1280d0--

