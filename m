Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC74DC5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 19:53:57 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.4622.1748894033730861939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 12:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HoipD7eM;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-311ef4fb549so4151048a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 12:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748894033; x=1749498833; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BHKZiiq+WIsB3UOOBOXwT4CbvRIor2RePypfyyeRmbQ=;
        b=HoipD7eMJZpGbdnLZ0lW+98GK9uTsNJLYHRuYordKguim0eTSwVzkZFW+gxquBRRZ/
         cTzURavRpjPaRUIUZAZNFzQRG3dGPwIRkiwjtRHysFOMAJF6tLtfgK3j/mgK7U9nscos
         2UIIsWk2ZbSZ77C6wuUCADHOPLEajG2ygaNr/yU68ZMwn6cGnaW3eUkfBrJ6uPySQ9nw
         ZTe85fZ/2Z1Dqs+rfo+9UQvXy8Lpm5Bh8OIu7kkl+k7Ief3immRkvSZqbx926HpLvMPk
         QR4IZgIbAIR4YSu+tjAfA5F38zieA0L6WfiZ9jJ8nYALyvoLsf+6NDphXnPIdyeBl3a8
         2WEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748894033; x=1749498833;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHKZiiq+WIsB3UOOBOXwT4CbvRIor2RePypfyyeRmbQ=;
        b=Yh5BWjUE13l6Zfv9f6JjKItSE15WQKFULk81+W1WGYL4OiDE6VZM8WKqucd4sqCZ2w
         rLoD0Q2bdELZiMnDPBoZNQk0Ntt1F/6IRbdmjlzvd6FnqP0PaseVus4lArX+vt6XgCaX
         cL0PzaNB3VsgcrIp6BiobPz7KgqyiOTn340yV5mZnkwXiCqv2CFGFDXUqVY11P5woGLr
         /bdgFpFHJ2SOdR6baf+gQUV4n5rX3Vr3mzJM1/5qquxN55kaCsT69VOsdj/q69pL7mUe
         T8uZkbxu5RjT8cUNPG/Ab8PuoM+ydtmaKzc34QJmdnhPDL5SVubK75j8J16KoNGu4oyt
         sWGA==
X-Gm-Message-State: AOJu0Yw+ATf4/GZialG/aGSy8BDTrHpnMawkOtZwjBNkky3AkJuPmm3J
	2gSr3Ameg9Q+HoFhncKHBcIAJjhKdhJCkAGauce3IEOSQLLToR7IMQ6FO2aAN8iIQwPFensVxck
	1jlOgivfCCGYx1aY8qSuMybBLFn2ROxM=
X-Gm-Gg: ASbGnctHFkl4JZNvqYrETbvy2QQyCjk+4INb2ckmhd7tmvkgnZ4amBMKrZ63xtPScUN
	JJhLyuCHt3TwsKjsVpb3ilrAPjJM7gWMJfBjYc8JDdvWPi+kS6ld0pFPh3G++0urWQeSzwunOvI
	Xge1kfXYQDEqLyulOBriT51AEFGb7ru7u5Lg==
X-Google-Smtp-Source: AGHT+IHdgY3GThRC4RphAincuCxmH9dHL/plcAvb2UXp08WDYb8Imhd42TpR2TQVwUILZUawu5DzWInAxhAjtLJZaVA=
X-Received: by 2002:a17:90b:35ca:b0:311:d670:a10e with SMTP id
 98e67ed59e1d1-31241735b74mr26139998a91.18.1748894032767; Mon, 02 Jun 2025
 12:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250602075714.32122-1-adrian.freihofer@siemens.com>
 <20250602075714.32122-11-adrian.freihofer@siemens.com> <aD3yuMnWwfPcUs3p@gmail.com>
 <54382081fb7bfccb83b8ebbd96942f48e3c3e56d.camel@siemens.com>
In-Reply-To: <54382081fb7bfccb83b8ebbd96942f48e3c3e56d.camel@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 2 Jun 2025 15:53:41 -0400
X-Gm-Features: AX0GCFtBBDmo8E0ytV6gehqr-yMXxKcJfYpF2t8TxuydNCFOZaJi89-_41ibVqo
Message-ID: <CADkTA4Mfx44EH3pZWE2at89ko8dGaby_mK+G_4Zepu2jF4NkRQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6 10/21] kernel-uboot.bbclass: deploy the
 vmlinux kernel binary
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"marex@denx.de" <marex@denx.de>, "a.fatoum@pengutronix.de" <a.fatoum@pengutronix.de>
Content-Type: multipart/alternative; boundary="00000000000092af7606369c1f2c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 19:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217730

--00000000000092af7606369c1f2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 3:44=E2=80=AFPM Freihofer, Adrian <
adrian.freihofer@siemens.com> wrote:

> Hi Bruce
>
> On Mon, 2025-06-02 at 14:51 -0400, Bruce Ashfield wrote:
> >
> >
> > In message: [OE-core] [PATCH v6 10/21] kernel-uboot.bbclass: deploy
> > the vmlinux kernel binary
> > on 02/06/2025 Adrian Freihofer via lists.openembedded.org wrote:
> >
> > > From: Adrian Freihofer <adrian.freihofer@siemens.com>
> > >
> > > Extend the kernel-uboot.bbclass to build and deploy the kernel
> > > binary
> > > intended for inclusion in a FIT image.
> > > Note that the kernel used in a FIT image is a stripped (and
> > > optionally
> > > compressed) vmlinux ELF binary - not a self-extracting format like
> > > zImage, which is already available in the deploy directory if
> > > needed
> > > separately.
> > >
> > > The kernel.bbclass inherits all classes listed in the
> > > KERNEL_CLASSES
> > > variable. By default, KERNEL_CLASSES is defined as:
> > >   KERNEL_CLASSES ?=3D " kernel-uimage "
> > > Since kernel-uimage.bbclass inherits from kernel-uboot.bbclass, the
> > > creation and deployment of the kernel binary for inclusion in a FIT
> > > image happens automatically by default.
> > >
> > > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > > ---
> > >  meta/classes-recipe/kernel-uboot.bbclass | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes-recipe/kernel-uboot.bbclass
> > > b/meta/classes-recipe/kernel-uboot.bbclass
> > > index d2a63524ece..e26ba6f0aa9 100644
> > > --- a/meta/classes-recipe/kernel-uboot.bbclass
> > > +++ b/meta/classes-recipe/kernel-uboot.bbclass
> > > @@ -56,4 +56,13 @@ uboot_prep_kimage() {
> > >     fi
> > >
> > >     printf "$linux_comp" > "$output_dir/linux_comp"
> > > -}
> > > \ No newline at end of file
> > > +}
> > > +
> > > +kernel_do_deploy:append() {
> > > +   # Provide the kernel artifacts to post processing recipes
> > > e.g. for creating a FIT image
> > > +   uboot_prep_kimage "$deployDir"
> > > +   # For x86 a setup.bin needs to be include"d in a fitImage
> > > as well
> > > +   if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
> > > +           install -D "${B}/${KERNEL_OUTPUT_DIR}/setup.bin"
> > > "$deployDir/"
> > > +   fi
> >
> > Isn't this adding extra steps / overhead to a user of kernel-uboot
> > bbclass that isn't building or using a fitimage ?
>
> Yes, the vmlinux is generated and deployed. For some x86 machines the
> setup.bin gets deployed as well.
>
> We could argue that this default is good, because all the different use
> cases just work (for little overhead). For those who do not like this
> overhead it is possible to add
>   KERNEL_CLASSES =3D ""
>
> But we could also argue that uImage and fitImage should be completely
> opt-in and changing the default (in kernel.bbclass) from
>   KERNEL_CLASSES ?=3D " kernel-uimage "
> to
>   KERNEL_CLASSES ?=3D ""
> would be better.
>
> Or we could leave the uImage exactly as it is, and for the fitImage,
> introduce a new bbclass called 'kernel-export-vmlinux.bbclass'. This
> new class would be enabled by adding:
>   KERNEL_CLASSES =3D "kernel-export-vmlinux"
>
>
> Any preferences?
>

I prefer #3, with the explicit export kernel class.

option #1 might be hard to find, we could argue that if you are having
such an issue with space / time, you'd dig in and find out how to disable
the processing. But I still prefer something obvious

#2 I do like opt-in, but leaving the default as it currently is makes sense=
.

Bruce



>
> Thank you for the re-view.
> Adrian
>
> >
> > Bruce
> >
> > > +}
> > > --
> > > 2.49.0
> > >
> >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#217701):
> > > https://lists.openembedded.org/g/openembedded-core/message/217701
> > > Mute This Topic:
> > > https://lists.openembedded.org/mt/113424435/1050810
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe:
> > > https://lists.openembedded.org/g/openembedded-core/unsub
> > >  [bruce.ashfield@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000092af7606369c1f2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 2, 2025 at 3:44=
=E2=80=AFPM Freihofer, Adrian &lt;<a href=3D"mailto:adrian.freihofer@siemen=
s.com">adrian.freihofer@siemens.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Hi Bruce<br>
<br>
On Mon, 2025-06-02 at 14:51 -0400, Bruce Ashfield wrote:<br>
&gt;<br>
&gt;<br>
&gt; In message: [OE-core] [PATCH v6 10/21] kernel-uboot.bbclass: deploy<br=
>
&gt; the vmlinux kernel binary<br>
&gt; on 02/06/2025 Adrian Freihofer via <a href=3D"http://lists.openembedde=
d.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrot=
e:<br>
&gt;<br>
&gt; &gt; From: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@sie=
mens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Extend the kernel-uboot.bbclass to build and deploy the kernel<br=
>
&gt; &gt; binary<br>
&gt; &gt; intended for inclusion in a FIT image.<br>
&gt; &gt; Note that the kernel used in a FIT image is a stripped (and<br>
&gt; &gt; optionally<br>
&gt; &gt; compressed) vmlinux ELF binary - not a self-extracting format lik=
e<br>
&gt; &gt; zImage, which is already available in the deploy directory if<br>
&gt; &gt; needed<br>
&gt; &gt; separately.<br>
&gt; &gt;<br>
&gt; &gt; The kernel.bbclass inherits all classes listed in the<br>
&gt; &gt; KERNEL_CLASSES<br>
&gt; &gt; variable. By default, KERNEL_CLASSES is defined as:<br>
&gt; &gt;=C2=A0 =C2=A0KERNEL_CLASSES ?=3D &quot; kernel-uimage &quot;<br>
&gt; &gt; Since kernel-uimage.bbclass inherits from kernel-uboot.bbclass, t=
he<br>
&gt; &gt; creation and deployment of the kernel binary for inclusion in a F=
IT<br>
&gt; &gt; image happens automatically by default.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.frei=
hofer@siemens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<b=
r>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/classes-recipe/kernel-uboot.bbclass | 11 ++++++++++-<b=
r>
&gt; &gt;=C2=A0 1 file changed, 10 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/classes-recipe/kernel-uboot.bbclass<br>
&gt; &gt; b/meta/classes-recipe/kernel-uboot.bbclass<br>
&gt; &gt; index d2a63524ece..e26ba6f0aa9 100644<br>
&gt; &gt; --- a/meta/classes-recipe/kernel-uboot.bbclass<br>
&gt; &gt; +++ b/meta/classes-recipe/kernel-uboot.bbclass<br>
&gt; &gt; @@ -56,4 +56,13 @@ uboot_prep_kimage() {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0printf &quot;$linux_comp&quot; &gt; &quot;$out=
put_dir/linux_comp&quot;<br>
&gt; &gt; -}<br>
&gt; &gt; \ No newline at end of file<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +kernel_do_deploy:append() {<br>
&gt; &gt; +=C2=A0 =C2=A0# Provide the kernel artifacts to post processing r=
ecipes<br>
&gt; &gt; e.g. for creating a FIT image<br>
&gt; &gt; +=C2=A0 =C2=A0uboot_prep_kimage &quot;$deployDir&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0# For x86 a setup.bin needs to be include&quot;d in=
 a fitImage<br>
&gt; &gt; as well<br>
&gt; &gt; +=C2=A0 =C2=A0if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -D &quot;${B}/$=
{KERNEL_OUTPUT_DIR}/setup.bin&quot;<br>
&gt; &gt; &quot;$deployDir/&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0fi<br>
&gt;<br>
&gt; Isn&#39;t this adding extra steps / overhead to a user of kernel-uboot=
<br>
&gt; bbclass that isn&#39;t building or using a fitimage ?<br>
<br>
Yes, the vmlinux is generated and deployed. For some x86 machines the<br>
setup.bin gets deployed as well.<br>
<br>
We could argue that this default is good, because all the different use<br>
cases just work (for little overhead). For those who do not like this<br>
overhead it is possible to add<br>
=C2=A0 KERNEL_CLASSES =3D &quot;&quot;<br>
<br>
But we could also argue that uImage and fitImage should be completely<br>
opt-in and changing the default (in kernel.bbclass) from<br>
=C2=A0 KERNEL_CLASSES ?=3D &quot; kernel-uimage &quot;<br>
to<br>
=C2=A0 KERNEL_CLASSES ?=3D &quot;&quot;<br>
would be better.<br>
<br>
Or we could leave the uImage exactly as it is, and for the fitImage,<br>
introduce a new bbclass called &#39;kernel-export-vmlinux.bbclass&#39;. Thi=
s<br>
new class would be enabled by adding:<br>
=C2=A0 KERNEL_CLASSES =3D &quot;kernel-export-vmlinux&quot;<br>
<br>
<br>
Any preferences?<br></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">I prefer #3, with the explicit export kern=
el class.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">option=C2=
=A0#1 might be hard to find, we could argue that if you are having</div><di=
v class=3D"gmail_default" style=3D"font-size:small">such an issue with spac=
e / time, you&#39;d dig in and find out how to disable</div><div class=3D"g=
mail_default" style=3D"font-size:small">the processing. But I still prefer =
something obvious</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">#2 I do=
 like opt-in, but leaving the default as it currently is makes sense.</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thank you for the re-view.<br>
Adrian<br>
<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; &gt; +}<br>
&gt; &gt; --<br>
&gt; &gt; 2.49.0<br>
&gt; &gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#217701):<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/mes=
sage/217701" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/217701</a><br>
&gt; &gt; Mute This Topic:<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/mt/113424435/1050810" r=
el=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/11342=
4435/1050810</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
&gt; &gt; Unsubscribe:<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/uns=
ub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/o=
penembedded-core/unsub</a><br>
&gt; &gt;=C2=A0 [<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_bla=
nk">bruce.ashfield@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
&gt;<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000092af7606369c1f2c--

