Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511F0C6FD18
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 13:52:30 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web10.38276.1681912347501793947
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 06:52:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mYxUyzSA;
 spf=pass (domain: gmail.com, ip: 209.85.222.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id r10so13865936uat.6
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 06:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681912346; x=1684504346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=65DWWLBlRhgQ2zvk7kZaEgykmooICwJw7CIGaDHxH0A=;
        b=mYxUyzSAHXCGBZfYcn0Qd24zqmzQYExfmb25HE104hd3D8OzafwoCEDblPqzj023/v
         pr1YXJb3NqlZibxDHpi68+wXnJQdXXWmVUd/Ue0not2OvvkpxlrKAf8I8z1gUdXNtvvR
         4oLFX5gvToc3htfS3+aRvs+QHz8Da3baL0fXjLj3FI+yx3uR5X8PI/bGNhtoj0SJb/5y
         ALuhVI9uhvFQdSkK2CVdlgQ9E66N9DdLS9indShf/Sq7ZJXnYR/CQ3nE0fwojpCYcQy4
         YrsjWAwkDJ3MWouH+EVzjcPmhgxjMqTkyJUjsq8goscIfuze9UJTA57uQV0WZFOQ3w0w
         LZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681912346; x=1684504346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65DWWLBlRhgQ2zvk7kZaEgykmooICwJw7CIGaDHxH0A=;
        b=ILplzUg/jcLtxWjNemDnJAP6S0xmhEokdG9LaeoAKmHyL2EH+/NyZHVMT/o1Qk/fOV
         WVk4mn86pT9PD9XP+Jd5QxNdlvIf04x5q68qkxPJ+gIs09AFLkmlzyPO/L8+B89SL58t
         PqctlVjnyb8oSYEd7927aupPtMBWBV0bSW78pKzmfteSPqQRcb6e5oRU99u75yVI5uCq
         rPv7be5k3lZrcIJW86YvrX/98wtiVbGE51VZ3xMHiKkG9XhUjvOGfMZcS2DN0ZlrjWNa
         hHsRFE+HweuWK1T4qe0yf2ZANOJ2xl/BclVA2jfx0IO+9wvERkgKUCAng4JiaDBaRz+v
         JNXg==
X-Gm-Message-State: AAQBX9dPvZWsePQkAsjmWWaRoa0jzZR+3IgLOmONcaJ4CZqDPA1HlCjU
	tRL4LWSedx7kAc3KIeLz9WsTmP4RgcJKGHFGkkI=
X-Google-Smtp-Source: AKy350bRHl63l4t6r83KoFH+EWvFIwbiULSMoA5X4GFLnf76yVSnql9LDh65W/Iot8Q9AiSLtSlk5P77UIeDET3ex7k=
X-Received: by 2002:ab0:5652:0:b0:772:3739:9d4b with SMTP id
 z18-20020ab05652000000b0077237399d4bmr12933720uaa.0.1681912346422; Wed, 19
 Apr 2023 06:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230416103052.28268-1-christoph.lauer@email.de>
 <27b6976546dae12e92dd3af28f657c02eca4afe8.camel@linuxfoundation.org>
 <CANPvuRnSPULJzxC0qt=sQLWS5jyx4OkJ2cQobDzHs0LmmBG6MQ@mail.gmail.com>
 <CADkTA4N9Sypxccr0OU6KQxPK5rbsL_mNFGaJ2Zn_jYHL1tNSEg@mail.gmail.com>
 <652908a6640ffc911d46613cb99159086131416f.camel@linuxfoundation.org> <CADkTA4MBh46pqJoQjW4dhOc3Sw-4+rr-u4d48OPSs9eC1VPx8A@mail.gmail.com>
In-Reply-To: <CADkTA4MBh46pqJoQjW4dhOc3Sw-4+rr-u4d48OPSs9eC1VPx8A@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 19 Apr 2023 14:52:15 +0100
Message-ID: <CANPvuR=M0-ndA609d2i43rgVVSPrHzEeo5o7orRjmeR9BA5_QQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Christoph Lauer <christoph.lauer@email.de>, openembedded-core@lists.openembedded.org, 
	Christoph Lauer <christoph.lauer@xtronic.de>
Content-Type: multipart/alternative; boundary="000000000000f3b5cd05f9b0bb75"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 13:52:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180223

--000000000000f3b5cd05f9b0bb75
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 18/04=
/2023
=C3=A0(s) 22:12:

> On Tue, Apr 18, 2023 at 5:04=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Tue, 2023-04-18 at 16:25 -0400, Bruce Ashfield wrote:
> > > On Mon, Apr 17, 2023 at 6:31=E2=80=AFPM Jose Quaresma <quaresma.jose@=
gmail.com>
> wrote:
> > > >
> > > >
> > > >
> > > > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> segunda, 17/04/2023 =C3=A0(s) 20:51:
> > > > >
> > > > > On Sun, 2023-04-16 at 12:30 +0200, Christoph Lauer wrote:
> > > > > > From: Christoph Lauer <christoph.lauer@xtronic.de>
> > > > > >
> > > > > > With rm_work active, external module signing throws an error:
> > > > > > scripts/sign-file: error while loading shared libraries:
> libcrypto.so.3: cannot open shared object file: No such file or directory
> > > > > > Preserve libraries that sign-file script needs during runtime.
> > > > > >
> > > > > > Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
> > > > > > ---
> > > > > >  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb |
> 3 +++
> > > > > >  1 file changed, 3 insertions(+)
> > > > > >
> > > > > > diff --git a/meta/recipes-kernel/make-mod-scripts/
> make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/
> make-mod-scripts_1.0.bb
> > > > > > index 28e0807d1d..0e24efc597 100644
> > > > > > --- a/meta/recipes-kernel/make-mod-scripts/
> make-mod-scripts_1.0.bb
> > > > > > +++ b/meta/recipes-kernel/make-mod-scripts/
> make-mod-scripts_1.0.bb
> > > > > > @@ -32,3 +32,6 @@ do_configure() {
> > > > > >               -C ${STAGING_KERNEL_DIR}
> O=3D${STAGING_KERNEL_BUILDDIR} $t
> > > > > >       done
> > > > > >  }
> > > > > > +
> > > > > > +# keep native libraries required for module signing
> > > > > > +RM_WORK_EXCLUDE_ITEMS +=3D "recipe-sysroot-native"
> > > > >
> > > > > I'm really reluctant to take this change as it isn't the way
> > > > > dependencies are meant to work.
> > > > >
> > > > > It sounds like something in a shared workdir is depending on
> something
> > > > > in a recipe workdir and we simply don't support that. Everything
> needed
> > > > > should be in the shared workdir. At best this is a bandaid and
> there
> > > > > will be other ways to make this fail such as cleaning
> make-mod-scripts.
> > > >
> > > >
> > > > The problem is because for signing the kernel modules the
> sign-file.c [1] is linked dynamically with openssl-native.
> > > > This works when building the in tree kernel modules but will fail
> when we try to sing any out of tree kernel module.
> > > > To sign the out of tree kernel we will use the binaries from the
> shared workdir but the native libcrypto.so.3 is removed by
> > > > the rm_work bbclass. We need to link the sign-file statically
> otherwise it will not work with the rm_work bbclass.
> > > >
> > > > [1]
> https://github.com/torvalds/linux/blob/master/scripts/sign-file.c
> > > >
> > > > Another solution for this problem can be changing the
> make-mod-scripts to be a native tool and in this way
> > > > they will be installed and the dependencies will be handled
> correctly.
> > >
> > > There would very likely be different issues if the scripts were
> > > generated and then packaged as a native tool / package. Since they ar=
e
> > > so tightly coupled to the kernel. We'd just trade one set of issues
> > > for another (out of sync artifacts, etc).
>

Maybe some new issues will come with this change but this will be more
aligned with
majority of the other tools. This is something I will keep in my TODO list.


> > >
> > > I'm going to hack on this a bit.
> > >
> > > That being said, I've never done any module signing .. since I don't
> > > need it in my development workflow.
> > >
> > > Is there a canonical guide to getting it setup so I can test my stati=
c
> > > link and relocated artifacts fixes ? is it with meta-integrity and th=
e
> > > kernel-modsign bbclass ?
>

Yes, I am using the kernel-modsign bbclass of meta-security.
The step to needed is add modsign in DISTRO_FUTURES and
provide the required keys setting the MODSIGN_* variable in the bbclass

>
> > I did think about this a bit more. It does likely depend on the version
> > of libcrypto from the host system as to whether it reproduces or not.
> > The possible solution ideas I came up with are:
> >
> > a) statically link sign-file so we don't need libcrypto
> > b) copy the libcrypto.so into a known location in the shared workdir
> > (probably some new path) and then adding an RPATH/RUNPATH using chrpath
> > to the binary.
>
> Agreed. I have sign-file statically building here, and it works, but
> objtool is blowing up under static linking.
>

Building the sign-file statically looks like a good solution but I have no
idea of the side effects.


>
> If I can't break the tools into separate bits, or fix that static link
> .. My other idea is the same as yours, if we copy out the .so and make
> sure it is in a recognized location in the artifacts dir, we are good
> to go.
>

But I believe that for copying it will require copying the full native
sysroot dependency chain and
not only libcrypto.so.

Jose


>
> Bruce
>
> >
> > Cheers,
> >
> > Richard
> >
> >
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

--000000000000f3b5cd05f9b0bb75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; escreveu no dia =
ter=C3=A7a, 18/04/2023 =C3=A0(s) 22:12:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Tue, Apr 18, 2023 at 5:04=E2=80=AFPM Richard Pur=
die<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, 2023-04-18 at 16:25 -0400, Bruce Ashfield wrote:<br>
&gt; &gt; On Mon, Apr 17, 2023 at 6:31=E2=80=AFPM Jose Quaresma &lt;<a href=
=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.c=
om</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; e=
screveu no dia segunda, 17/04/2023 =C3=A0(s) 20:51:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Sun, 2023-04-16 at 12:30 +0200, Christoph Lauer wrot=
e:<br>
&gt; &gt; &gt; &gt; &gt; From: Christoph Lauer &lt;<a href=3D"mailto:christ=
oph.lauer@xtronic.de" target=3D"_blank">christoph.lauer@xtronic.de</a>&gt;<=
br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; With rm_work active, external module signing throw=
s an error:<br>
&gt; &gt; &gt; &gt; &gt; scripts/sign-file: error while loading shared libr=
aries: libcrypto.so.3: cannot open shared object file: No such file or dire=
ctory<br>
&gt; &gt; &gt; &gt; &gt; Preserve libraries that sign-file script needs dur=
ing runtime.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Christoph Lauer &lt;<a href=3D"mail=
to:christoph.lauer@xtronic.de" target=3D"_blank">christoph.lauer@xtronic.de=
</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 meta/recipes-kernel/make-mod-scripts/<a href=
=3D"http://make-mod-scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">ma=
ke-mod-scripts_1.0.bb</a> | 3 +++<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/meta/recipes-kernel/make-mod-scripts/=
<a href=3D"http://make-mod-scripts_1.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">make-mod-scripts_1.0.bb</a> b/meta/recipes-kernel/make-mod-scripts/<a =
href=3D"http://make-mod-scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank=
">make-mod-scripts_1.0.bb</a><br>
&gt; &gt; &gt; &gt; &gt; index 28e0807d1d..0e24efc597 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/meta/recipes-kernel/make-mod-scripts/<a href=
=3D"http://make-mod-scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">ma=
ke-mod-scripts_1.0.bb</a><br>
&gt; &gt; &gt; &gt; &gt; +++ b/meta/recipes-kernel/make-mod-scripts/<a href=
=3D"http://make-mod-scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">ma=
ke-mod-scripts_1.0.bb</a><br>
&gt; &gt; &gt; &gt; &gt; @@ -32,3 +32,6 @@ do_configure() {<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0-C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} $t<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +# keep native libraries required for module signi=
ng<br>
&gt; &gt; &gt; &gt; &gt; +RM_WORK_EXCLUDE_ITEMS +=3D &quot;recipe-sysroot-n=
ative&quot;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I&#39;m really reluctant to take this change as it isn&=
#39;t the way<br>
&gt; &gt; &gt; &gt; dependencies are meant to work.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; It sounds like something in a shared workdir is dependi=
ng on something<br>
&gt; &gt; &gt; &gt; in a recipe workdir and we simply don&#39;t support tha=
t. Everything needed<br>
&gt; &gt; &gt; &gt; should be in the shared workdir. At best this is a band=
aid and there<br>
&gt; &gt; &gt; &gt; will be other ways to make this fail such as cleaning m=
ake-mod-scripts.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The problem is because for signing the kernel modules the si=
gn-file.c [1] is linked dynamically with openssl-native.<br>
&gt; &gt; &gt; This works when building the in tree kernel modules but will=
 fail when we try to sing any out of tree kernel module.<br>
&gt; &gt; &gt; To sign the out of tree kernel we will use the binaries from=
 the shared workdir but the native libcrypto.so.3 is removed by<br>
&gt; &gt; &gt; the rm_work bbclass. We need to link the sign-file staticall=
y otherwise it will not work with the rm_work bbclass.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [1] <a href=3D"https://github.com/torvalds/linux/blob/master=
/scripts/sign-file.c" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/torvalds/linux/blob/master/scripts/sign-file.c</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Another solution for this problem can be changing the make-m=
od-scripts to be a native tool and in this way<br>
&gt; &gt; &gt; they will be installed and the dependencies will be handled =
correctly.<br>
&gt; &gt;<br>
&gt; &gt; There would very likely be different issues if the scripts were<b=
r>
&gt; &gt; generated and then packaged as a native tool / package. Since the=
y are<br>
&gt; &gt; so tightly coupled to the kernel. We&#39;d just trade one set of =
issues<br>
&gt; &gt; for another (out of sync artifacts, etc).<br></blockquote><div><b=
r>Maybe some new issues will come with this change but this will be more al=
igned=C2=A0with</div><div>majority of the other tools. This is something I =
will keep in my TODO list.<br>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
&gt; &gt;<br>
&gt; &gt; I&#39;m going to hack on this a bit.<br>
&gt; &gt;<br>
&gt; &gt; That being said, I&#39;ve never done any module signing .. since =
I don&#39;t<br>
&gt; &gt; need it in my development workflow.<br>
&gt; &gt;<br>
&gt; &gt; Is there a canonical guide to getting it setup so I can test my s=
tatic<br>
&gt; &gt; link and relocated artifacts fixes ? is it with meta-integrity an=
d the<br>
&gt; &gt; kernel-modsign bbclass ?<br></blockquote><div><br></div><div>Yes,=
 I am using the kernel-modsign bbclass of meta-security.<br>The step to nee=
ded is add modsign in DISTRO_FUTURES and</div><div>provide the required key=
s setting the MODSIGN_* variable in the bbclass=C2=A0=C2=A0</div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; I did think about this a bit more. It does likely depend on the versio=
n<br>
&gt; of libcrypto from the host system as to whether it reproduces or not.<=
br>
&gt; The possible solution ideas I came up with are:<br>
&gt;<br>
&gt; a) statically link sign-file so we don&#39;t need libcrypto<br>
&gt; b) copy the libcrypto.so into a known location in the shared workdir<b=
r>
&gt; (probably some new path) and then adding an RPATH/RUNPATH using chrpat=
h<br>
&gt; to the binary.<br>
<br>
Agreed. I have sign-file statically building here, and it works, but<br>
objtool is blowing up under static linking.<br></blockquote><div><br></div>=
<div>Building the sign-file statically looks like a good solution but I hav=
e no idea=C2=A0of the side effects.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
If I can&#39;t break the tools into separate bits, or fix that static link<=
br>
.. My other idea is the same as yours, if we copy out the .so and make<br>
sure it is in a recognized location in the artifacts dir, we are good<br>
to go.<br></blockquote><div><br></div><div>But I believe=C2=A0that for copy=
ing it will require copying the full native sysroot dependency chain and</d=
iv><div>not only libcrypto.so.<br><br>Jose</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
&gt;<br>
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

--000000000000f3b5cd05f9b0bb75--

