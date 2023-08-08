Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EABC001DB
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 16:11:00 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.65736.1691511055821644142
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 09:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ijC4qP0y;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6bd0a0a6766so477272a34.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 09:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691511055; x=1692115855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0xizGYPhsw9Bv+0DPE/rmGmg8m5v9Dnq8G7fqM3b2DY=;
        b=ijC4qP0ybHQ2c11tEHFyl9oPXa0QImvZzKYTU+cQPsP1/4lZ9/i9SYokKg3B3/aqH7
         PhqZIdZu+39erY2Y7xieiQRBl1Y/Ts5LfUkgVZT9mw/h/TpWzug+OzgegJ3RskQivaiN
         +ogkmYDFzOUQSP5LVECdNMp6KZIJpFHuuYOI2WQLd4zhs1okN0gayDcyPSMMClyOTkiA
         FOtkXe7ljYxgcDL3sUqDzO/ogocncWAEjEtD/YULK3rqScUxp0pCyylH4s8gOv8JPZii
         +f6DvK15+oq/p9SZfTDndxBIMrKk41t06kXxOyA9e6x7MeiaQk9n9WHA2AHPeDp0xIYP
         fNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511055; x=1692115855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xizGYPhsw9Bv+0DPE/rmGmg8m5v9Dnq8G7fqM3b2DY=;
        b=e4bkWATcUnfA8UvFyvl8EzIrNCCBU+bK6mcwwkUE9iQ2XvA5GcnSU9DFpYaSz5mKp4
         AoEBWd0MXfboW9OKhq7iCUTi9tieIYDOAa/aYJDfH0AiJKjLaohzY5/EA6UksXT5jOr1
         2Q+AfCAVhsxfEoNbxxe9IBFiBWoRd4H9R5dqXCco4uefe50I0fKHu1unPCGFZPqDHOV9
         lJ0uLaPeGbOLmOWSAvuQeWg6IDaGUGZ2gvS4HZC7f9cw0395DbYD0Afk3d29WB8s/wNV
         Qyi7wxKZSM+1ZJd/DSb+geop39iFxI1dNRGP8EyxPklBVQj+KxKNdeEKcfUfCDDiNuL5
         fv8A==
X-Gm-Message-State: AOJu0YznSGSzX++CbVKnBQnv4MrKSrinEg5xciS3TFrNfhyPdqpMA34O
	Ij4tOU2md6IicYK+ow7RQIK9LM6dKPve3e7h8sE=
X-Google-Smtp-Source: AGHT+IF6/2ICuWFFWl8ot8LaUHQeHUMOLBJn6lrk9Y/FQGxuU3WrkctpcZdy2nhziodiYhXD6vhodAN/jea4F2wwpUI=
X-Received: by 2002:a05:6358:9da1:b0:135:92f0:fa6a with SMTP id
 d33-20020a0563589da100b0013592f0fa6amr9450729rwo.1.1691511054614; Tue, 08 Aug
 2023 09:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <202308061238184bdb334c@mail.local> <CAMw=ZnQZ0ZJGjm5DCMza2dfF+xhpAoaPbgeMvJre6NM_qNd6RQ@mail.gmail.com>
 <20230806132213bed8666e@mail.local> <CAMw=ZnT3EB9v9wC=tkjJGvDu0EbvVkdmppv4qBgUp-K-Ui5e7Q@mail.gmail.com>
 <c956c4fc4c1b4aaa8004c10f8a2d445539e780d1.camel@linuxfoundation.org>
 <CAMw=ZnQ9VDL=TCUzfsSRiGujCyb_-ZO50S3+UFckDh6LkTgnWw@mail.gmail.com>
 <202308071440247bbfcdd8@mail.local> <202308072237172d39a14b@mail.local>
 <CAMw=ZnRZ-LNhpGvvDH+OBk7LuvdCyxTW5mZGB_f+D8wuB6weLA@mail.gmail.com>
 <CAMKF1srqMkp3LrS0wY=K=MbQLnVjbtvczGa9jC4YKcOs+Cpmew@mail.gmail.com> <202308080051444293001a@mail.local>
In-Reply-To: <202308080051444293001a@mail.local>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 8 Aug 2023 17:10:43 +0100
Message-ID: <CANPvuR=KEGvHwA=20ha0eOKww4cS=Z9nTOZu4Xf=Oi5YEfT2Uw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v8] systemd: update to v254
To: alexandre.belloni@bootlin.com
Cc: Khem Raj <raj.khem@gmail.com>, Luca Boccassi <luca.boccassi@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008b42fa06026b9ba7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 16:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185668

--0000000000008b42fa06026b9ba7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

With this adictional patch
https://lists.openembedded.org/g/openembedded-core/message/185666
the stub looks good again.

Jose

Alexandre Belloni via lists.openembedded.org <alexandre.belloni=3D
bootlin.com@lists.openembedded.org> escreveu no dia ter=C3=A7a, 8/08/2023 =
=C3=A0(s)
01:51:

> On 07/08/2023 17:01:02-0700, Khem Raj wrote:
> > Can you try this patch on top
> >
> >
> https://git.yoctoproject.org/poky-contrib/commit/?h=3Dyoe/mut&id=3D0defb1=
4c600170434befe8c94dad4732041a3513
> >
>
> I have those two patches on top of master:
>
> systemd-boot: Ensure EFI_LD is also passed to compiler driver
> systemd: fix efi dependency
>



>
>
> > On Mon, Aug 7, 2023 at 3:48=E2=80=AFPM Luca Boccassi <luca.boccassi@gma=
il.com>
> wrote:
> > >
> > > On Mon, 7 Aug 2023 at 23:37, Alexandre Belloni
> > > <alexandre.belloni@bootlin.com> wrote:
> > > >
> > > > On 07/08/2023 16:40:25+0200, Alexandre Belloni wrote:
> > > > > Hello,
> > > > >
> > > > > I've been looking a bit more at this. there is definitively anoth=
er
> > > > > issue here which is the first one I found:
> > > > >
> > > > > x86_64-poky-linux-objcopy:
> /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.s=
tub:
> file format not recognized
> > > > >
> > > > > This is the main issue here.
> > > > >
> > > > > $ file
> /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.s=
tub
> > > > >
> /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.s=
tub:
> MS-DOS executable PE32+ executable (EFI application) x86-64 (stripped to
> external PDB), for MS Windows
> > > > > $ objdump -p
> /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.s=
tub
> > > > > objdump:
> /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.s=
tub
> (.reloc): section flag STYP_GROUP (0x4) ignored
> > > > > objdump:
> /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.s=
tub
> (.reloc): section flag STYP_COPY (0x10) ignored
> > > > > objdump:
> /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.s=
tub:
> warning: ignoring section flag IMAGE_SCN_MEM_NOT_PAGED in section .reloc
> > > > > objdump:
> /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.s=
tub
> (.reloc): section flag STYP_GROUP (0x4) ignored
> > > > > objdump:
> /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.s=
tub
> (.reloc): section flag STYP_COPY (0x10) ignored
> > > > > objdump:
> /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.s=
tub:
> warning: ignoring section flag IMAGE_SCN_MEM_NOT_PAGED in section .reloc
> > > > > objdump:
> /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.s=
tub:
> file format not recognized
> > > > >
> > > > > I tested with v253.7 and I properly get:
> > > > >
> > > > > $ file
> /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.s=
tub
> > > > >
> /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.s=
tub:
> PE32+ executable (EFI application) x86-64 (stripped to external PDB), for
> MS Windows
> > > > > $
> ./build-st/tmp/sysroots-components/x86_64/binutils-cross-x86_64/usr/bin/x=
86_64-poky-linux/x86_64-poky-linux-objdump
> -h
> /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.s=
tub
> > > > >
> > > > >
> /home/alexandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.s=
tub:
>    file format pei-x86-64
> > > > >
> > > > > Sections:
> > > > > Idx Name          Size      VMA               LMA
>  File off  Algn
> > > > >   0 .text         0000d7f0  0000000000004000  0000000000004000
> 00000400  2**4
> > > > >                   CONTENTS, ALLOC, LOAD, READONLY, CODE
> > > > >   1 .reloc        0000000c  0000000000012000  0000000000012000
> 0000dc00  2**2
> > > > >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> > > > >   2 .data         00002ab0  0000000000013000  0000000000013000
> 0000de00  2**4
> > > > >                   CONTENTS, ALLOC, LOAD, DATA
> > > > >   3 .dynamic      00000100  0000000000016000  0000000000016000
> 00010a00  2**2
> > > > >                   CONTENTS, ALLOC, LOAD, DATA
> > > > >   4 .rela         00000630  0000000000017000  0000000000017000
> 00010c00  2**2
> > > > >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> > > > >   5 .dynsym       00000018  0000000000018000  0000000000018000
> 00011400  2**2
> > > > >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> > > > >   6 .sdmagic      0000002a  000000000001a460  000000000001a460
> 00011600  2**2
> > > > >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> > > > >
> > > > > I really believe the recipe is not generating a working efi.stub.
> Can
> > > > > you check?
> > > > >
> > > >
> > > > I've built systemd-boot v254 outside of YP and it generated a prope=
r
> > > > linuxx64.efi.stub. I still don't get why the recipe doesn't generat=
e
> a
> > > > working binary.
> > > >
> > > > The issue seems to be at the linuxx64.elf.stub generation as I took
> the
> > > > one from my YP build, ran it through elf2efi.py on my PC and this
> didn't
> > > > generate a working linuxx64.efi.stub
> > >
> > > Strange - do you see a difference in compiler/linker flags? That woul=
d
> > > be the only thing I can think of
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185628):
> https://lists.openembedded.org/g/openembedded-core/message/185628
> Mute This Topic: https://lists.openembedded.org/mt/100516497/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000008b42fa06026b9ba7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div>With this adictional patch=
=C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded-core/message=
/185666">https://lists.openembedded.org/g/openembedded-core/message/185666<=
/a></div>the=C2=A0<span style=3D"color:rgb(0,0,0)">stub looks good again.<b=
r></span><br>Jose<div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Alexandre Belloni via <a href=3D"http://lists.openembedded.=
org">lists.openembedded.org</a> &lt;alexandre.belloni=3D<a href=3D"mailto:b=
ootlin.com@lists.openembedded.org">bootlin.com@lists.openembedded.org</a>&g=
t; escreveu no dia ter=C3=A7a, 8/08/2023 =C3=A0(s) 01:51:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 07/08/2023 17:01:02-0700, Khem=
 Raj wrote:<br>
&gt; Can you try this patch on top<br>
&gt; <br>
&gt; <a href=3D"https://git.yoctoproject.org/poky-contrib/commit/?h=3Dyoe/m=
ut&amp;id=3D0defb14c600170434befe8c94dad4732041a3513" rel=3D"noreferrer" ta=
rget=3D"_blank">https://git.yoctoproject.org/poky-contrib/commit/?h=3Dyoe/m=
ut&amp;id=3D0defb14c600170434befe8c94dad4732041a3513</a><br>
&gt; <br>
<br>
I have those two patches on top of master:<br>
<br>
systemd-boot: Ensure EFI_LD is also passed to compiler driver<br>
systemd: fix efi dependency<br></blockquote><div><br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; On Mon, Aug 7, 2023 at 3:48=E2=80=AFPM Luca Boccassi &lt;<a href=3D"ma=
ilto:luca.boccassi@gmail.com" target=3D"_blank">luca.boccassi@gmail.com</a>=
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Mon, 7 Aug 2023 at 23:37, Alexandre Belloni<br>
&gt; &gt; &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com" target=3D"_b=
lank">alexandre.belloni@bootlin.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On 07/08/2023 16:40:25+0200, Alexandre Belloni wrote:<br>
&gt; &gt; &gt; &gt; Hello,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I&#39;ve been looking a bit more at this. there is defi=
nitively another<br>
&gt; &gt; &gt; &gt; issue here which is the first one I found:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; x86_64-poky-linux-objcopy: /home/alexandre/poky/build-s=
t/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: file format not recognize=
d<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This is the main issue here.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; $ file /home/alexandre/poky/build-st/tmp/deploy/images/=
qemux86-64/linuxx64.efi.stub<br>
&gt; &gt; &gt; &gt; /home/alexandre/poky/build-st/tmp/deploy/images/qemux86=
-64/linuxx64.efi.stub: MS-DOS executable PE32+ executable (EFI application)=
 x86-64 (stripped to external PDB), for MS Windows<br>
&gt; &gt; &gt; &gt; $ objdump -p /home/alexandre/poky/build-st/tmp/deploy/i=
mages/qemux86-64/linuxx64.efi.stub<br>
&gt; &gt; &gt; &gt; objdump: /home/alexandre/poky/build-st/tmp/deploy/image=
s/qemux86-64/linuxx64.efi.stub (.reloc): section flag STYP_GROUP (0x4) igno=
red<br>
&gt; &gt; &gt; &gt; objdump: /home/alexandre/poky/build-st/tmp/deploy/image=
s/qemux86-64/linuxx64.efi.stub (.reloc): section flag STYP_COPY (0x10) igno=
red<br>
&gt; &gt; &gt; &gt; objdump: /home/alexandre/poky/build-st/tmp/deploy/image=
s/qemux86-64/linuxx64.efi.stub: warning: ignoring section flag IMAGE_SCN_ME=
M_NOT_PAGED in section .reloc<br>
&gt; &gt; &gt; &gt; objdump: /home/alexandre/poky/build-st/tmp/deploy/image=
s/qemux86-64/linuxx64.efi.stub (.reloc): section flag STYP_GROUP (0x4) igno=
red<br>
&gt; &gt; &gt; &gt; objdump: /home/alexandre/poky/build-st/tmp/deploy/image=
s/qemux86-64/linuxx64.efi.stub (.reloc): section flag STYP_COPY (0x10) igno=
red<br>
&gt; &gt; &gt; &gt; objdump: /home/alexandre/poky/build-st/tmp/deploy/image=
s/qemux86-64/linuxx64.efi.stub: warning: ignoring section flag IMAGE_SCN_ME=
M_NOT_PAGED in section .reloc<br>
&gt; &gt; &gt; &gt; objdump: /home/alexandre/poky/build-st/tmp/deploy/image=
s/qemux86-64/linuxx64.efi.stub: file format not recognized<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I tested with v253.7 and I properly get:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; $ file /home/alexandre/poky/build-st/tmp/deploy/images/=
qemux86-64/linuxx64.efi.stub<br>
&gt; &gt; &gt; &gt; /home/alexandre/poky/build-st/tmp/deploy/images/qemux86=
-64/linuxx64.efi.stub: PE32+ executable (EFI application) x86-64 (stripped =
to external PDB), for MS Windows<br>
&gt; &gt; &gt; &gt; $ ./build-st/tmp/sysroots-components/x86_64/binutils-cr=
oss-x86_64/usr/bin/x86_64-poky-linux/x86_64-poky-linux-objdump -h /home/ale=
xandre/poky/build-st/tmp/deploy/images/qemux86-64/linuxx64.efi.stub<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; /home/alexandre/poky/build-st/tmp/deploy/images/qemux86=
-64/linuxx64.efi.stub:=C2=A0 =C2=A0 =C2=A0file format pei-x86-64<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Sections:<br>
&gt; &gt; &gt; &gt; Idx Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Size=C2=A0 =
=C2=A0 =C2=A0 VMA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LMA=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0File off=C2=A0 Algn<=
br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A00 .text=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A000=
00d7f0=C2=A0 0000000000004000=C2=A0 0000000000004000=C2=A0 00000400=C2=A0 2=
**4<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0CONTENTS, ALLOC, LOAD, READONLY, CODE<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A01 .reloc=C2=A0 =C2=A0 =C2=A0 =C2=A0 0000000=
c=C2=A0 0000000000012000=C2=A0 0000000000012000=C2=A0 0000dc00=C2=A0 2**2<b=
r>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0CONTENTS, ALLOC, LOAD, READONLY, DATA<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A02 .data=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A000=
002ab0=C2=A0 0000000000013000=C2=A0 0000000000013000=C2=A0 0000de00=C2=A0 2=
**4<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0CONTENTS, ALLOC, LOAD, DATA<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A03 .dynamic=C2=A0 =C2=A0 =C2=A0 00000100=C2=
=A0 0000000000016000=C2=A0 0000000000016000=C2=A0 00010a00=C2=A0 2**2<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0CONTENTS, ALLOC, LOAD, DATA<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A04 .rela=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A000=
000630=C2=A0 0000000000017000=C2=A0 0000000000017000=C2=A0 00010c00=C2=A0 2=
**2<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0CONTENTS, ALLOC, LOAD, READONLY, DATA<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A05 .dynsym=C2=A0 =C2=A0 =C2=A0 =C2=A00000001=
8=C2=A0 0000000000018000=C2=A0 0000000000018000=C2=A0 00011400=C2=A0 2**2<b=
r>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0CONTENTS, ALLOC, LOAD, READONLY, DATA<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A06 .sdmagic=C2=A0 =C2=A0 =C2=A0 0000002a=C2=
=A0 000000000001a460=C2=A0 000000000001a460=C2=A0 00011600=C2=A0 2**2<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0CONTENTS, ALLOC, LOAD, READONLY, DATA<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I really believe the recipe is not generating a working=
 efi.stub. Can<br>
&gt; &gt; &gt; &gt; you check?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;ve built systemd-boot v254 outside of YP and it genera=
ted a proper<br>
&gt; &gt; &gt; linuxx64.efi.stub. I still don&#39;t get why the recipe does=
n&#39;t generate a<br>
&gt; &gt; &gt; working binary.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The issue seems to be at the linuxx64.elf.stub generation as=
 I took the<br>
&gt; &gt; &gt; one from my YP build, ran it through elf2efi.py on my PC and=
 this didn&#39;t<br>
&gt; &gt; &gt; generate a working linuxx64.efi.stub<br>
&gt; &gt;<br>
&gt; &gt; Strange - do you see a difference in compiler/linker flags? That =
would<br>
&gt; &gt; be the only thing I can think of<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#185628): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/185628" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/185628</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100516497/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100516497/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div></div>

--0000000000008b42fa06026b9ba7--

