Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B2DC4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 09:31:26 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web11.14400.1707384683575870442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 01:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BxopqXn8;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4c0375d438eso672225e0c.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 01:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707384682; x=1707989482; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RN9Y8RelEniAvjKkpTYQ+ARbPxHolMeh4ZW3bTFy7pg=;
        b=BxopqXn8tVCWL2qvh6rGCfb7/wjImQh1e4YfGMEkwCTqamJZLSwUdaEPOC+G5rLBWJ
         pRd72MNTO3OBVuANxzPDqSRwpPMhEB3KTTlwT7C0Dk93VGpmx+fOTq0JAsG7xZ+KxZ9e
         G+P9SMj0SHFz/ItTUbWxgw/19qja95YPDDmlsodeeMm5qbOsaDuvBBPZIWorSz5T5763
         Dmfkt9USEeMJUVTIfJML/40N20p3B8O4Ohyt3ExF4fKNrKRCAUCwU2EkMjGvrfvYJqSd
         Kj25iTgjGD64yyTtFZKNKKkia1SZrtngZX/lXYNk0EFITrGRIWdcurqgESi7aB3ZIoCv
         Jnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707384682; x=1707989482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RN9Y8RelEniAvjKkpTYQ+ARbPxHolMeh4ZW3bTFy7pg=;
        b=o66yncDTeR+1kEWtR5xD8hHLbjx38X0z+DHk2RAZZob5Mvm2s6Gopyns4IEYxBIa6P
         oVZnC+mFYz8uJjvGups5dGz++0ZD+qFPg6CrldYDo85dASboL5JxJ24PGsxZEs9U8uFm
         Bnxmk25sKjXhXSjYzQZzUWm1g6x2zUc6SZ1YcKPYVP7EHh0eq7aIHUPLJH20ImxjyHGF
         g4i783g+h3C1MRrsEFiE/W4+K5+PqXcRoixl8b+wxkJesRLs8GjoNoTgLNWRCMTXJZOR
         Zg3RUkOSUEjCsFcrktj+ow10I/16+7fnXSJi73TB+xIDMMBPFYD6zF6F7h3jUYCObTN8
         eHbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdg2aS+Scup3CLBJLzbCykVnwUaQmvAD94TqvQstKa2/KxKsywSj+8Fiifk++8msIE3kfUIUSPDFHyKY7mv+7F+qI8/e3Vbd8ITE3HGcT+C9/HVP372feU
X-Gm-Message-State: AOJu0YzWfI68lBhW6lC9thnKmjmKhiu4Z3ywY8Tv05UDcMzLtFymHJB7
	5D1J1VlT95mgUASYiEFb5tZ1ou7vVPTakF7g9E14nAOx95pmUzjE55ZoTcgPggncyuCCu3luXSF
	N3Dukw34kV9dJ+Fz9FI2IniecNYg=
X-Google-Smtp-Source: AGHT+IG8A4OzHi+d8iRaMgEhonPlhCz/cbvUAFQND8aiKiOTcVimUbmcWwx+sc6BbEQR0TNEvWPaInIbDZcXZoBUAZI=
X-Received: by 2002:a05:6102:34c7:b0:46d:6147:c752 with SMTP id
 a7-20020a05610234c700b0046d6147c752mr1229618vst.15.1707384682433; Thu, 08 Feb
 2024 01:31:22 -0800 (PST)
MIME-Version: 1.0
References: <20240207102529.128369-1-matthias.schiffer@ew.tq-group.com>
 <4021EB06-42BE-45D5-9F7A-EE0F63F8EA30@arm.com> <4584b21bd67a1819159926b5331120a796f216a6.camel@ew.tq-group.com>
In-Reply-To: <4584b21bd67a1819159926b5331120a796f216a6.camel@ew.tq-group.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 8 Feb 2024 09:31:11 +0000
Message-ID: <CANPvuRnw=cioafCQo-6XhnaV2jnvn6UksQBXgTq4JYpLdNsH4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: install .config to deploy dir
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	"oss@ew.tq-group.com" <oss@ew.tq-group.com>
Content-Type: multipart/alternative; boundary="0000000000007dd57e0610db7941"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 09:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195124

--0000000000007dd57e0610db7941
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matthias,

Matthias Schiffer <matthias.schiffer@ew.tq-group.com> escreveu (quinta,
8/02/2024 =C3=A0(s) 08:50):

> On Wed, 2024-02-07 at 15:58 +0000, Ross Burton wrote:
> > ********************
> > Achtung externe E-Mail: =C3=96ffnen Sie Anh=C3=A4nge und Links nur, wen=
n Sie
> wissen, dass diese aus einer sicheren Quelle stammen und sicher sind.
> Leiten Sie die E-Mail im Zweifelsfall zur Pr=C3=BCfung an den IT-Helpdesk=
 weiter.
> > Attention external email: Open attachments and links only if you know
> that they are from a secure source and are safe. In doubt forward the ema=
il
> to the IT-Helpdesk to check it.
> > ********************
> >
> > On 7 Feb 2024, at 10:25, Matthias Schiffer via lists.openembedded.org
> <matthias.schiffer=3Dew.tq-group.com@lists.openembedded.org> wrote:
> > >
> > > Deploy the kernel configuration with the built images, so it is easy =
to
> > > check its contents, or rebuild the same configuration outside of the
> > > Yocto build system.
> >
> > For what it's worth, I added a task quite recently to tell you where th=
e
> config file is (and generate it, if needed), so for =E2=80=9Cwhat did thi=
s kernel I
> just built have as the config=E2=80=9D that is potentially more useful th=
an
> deploying as it works even when the compile fails, or if it hasn=E2=80=99=
t finished
> yet:
> >
> > $ bitbake virtual/kernel -c showconfig
> > =E2=80=A6
> > Config file written to
> /yocto/ross/build/tmp/work/qemuarm64-poky-linux/linux-yocto/6.6.12+git/li=
nux-qemuarm64-standard-build/.config
>
> Hmm, I *think* this will not help our particular usecase, as our CI jobs
> always run with `INHERIT +=3D
> "rm_work"`, so I'd assume that the kernel build dir is deleted between
> bitbake calls - but I might
> be wrong about the exact point where "rm_work" runs.
>

The kernel sources and build artifacts are particular on this aspect and
were placed on a work-shared dir
tmp/work-shared/MACHINE, more specifically kernel-source and
kernel-build-artifacts .
Anyway any recipe that inherits the kernel bbclass was excluded to be
removed by the rm_works,
this can be checked on the meta/classes/rm_work.bbclass inject_rm_work
python function.

Jose


> >
> >
> > > This can be particularly convenient when running a Yocto build as a C=
I
> > > job, and only the deploy dir is made available for download.
> >
> > I=E2=80=99m wondering if the kernel-dev package should split the config=
 out into
> a subpackage, so it can be installed or examined separately.
>
> In any case, we can update our CI to save the kernel-dev package or its
> contents, so I'm fine with
> this patch being dropped. Thanks!
>
> Regards,
> Matthias
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> https://www.tq-group.com/
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195120):
> https://lists.openembedded.org/g/openembedded-core/message/195120
> Mute This Topic: https://lists.openembedded.org/mt/104215836/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000007dd57e0610db7941
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Matthias,<br></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Matthias Schiffer &lt;<a =
href=3D"mailto:matthias.schiffer@ew.tq-group.com">matthias.schiffer@ew.tq-g=
roup.com</a>&gt; escreveu (quinta, 8/02/2024 =C3=A0(s) 08:50):<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2024-02-07 at 15:58 =
+0000, Ross Burton wrote:<br>
&gt; ********************<br>
&gt; Achtung externe E-Mail: =C3=96ffnen Sie Anh=C3=A4nge und Links nur, we=
nn Sie wissen, dass diese aus einer sicheren Quelle stammen und sicher sind=
. Leiten Sie die E-Mail im Zweifelsfall zur Pr=C3=BCfung an den IT-Helpdesk=
 weiter.<br>
&gt; Attention external email: Open attachments and links only if you know =
that they are from a secure source and are safe. In doubt forward the email=
 to the IT-Helpdesk to check it.<br>
&gt; ********************<br>
&gt; <br>
&gt; On 7 Feb 2024, at 10:25, Matthias Schiffer via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a> &lt;matthias.schiffer=3D<a href=3D"mailto:ew.tq-group.com@lists.ope=
nembedded.org" target=3D"_blank">ew.tq-group.com@lists.openembedded.org</a>=
&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; Deploy the kernel configuration with the built images, so it is e=
asy to<br>
&gt; &gt; check its contents, or rebuild the same configuration outside of =
the<br>
&gt; &gt; Yocto build system.<br>
&gt; <br>
&gt; For what it&#39;s worth, I added a task quite recently to tell you whe=
re the config file is (and generate it, if needed), so for =E2=80=9Cwhat di=
d this kernel I just built have as the config=E2=80=9D that is potentially =
more useful than deploying as it works even when the compile fails, or if i=
t hasn=E2=80=99t finished yet:<br>
&gt; <br>
&gt; $ bitbake virtual/kernel -c showconfig<br>
&gt; =E2=80=A6<br>
&gt; Config file written to /yocto/ross/build/tmp/work/qemuarm64-poky-linux=
/linux-yocto/6.6.12+git/linux-qemuarm64-standard-build/.config<br>
<br>
Hmm, I *think* this will not help our particular usecase, as our CI jobs al=
ways run with `INHERIT +=3D<br>
&quot;rm_work&quot;`, so I&#39;d assume that the kernel build dir is delete=
d between bitbake calls - but I might<br>
be wrong about the exact point where &quot;rm_work&quot; runs.<br></blockqu=
ote><div><br></div><div>The kernel sources and build artifacts are particul=
ar on this aspect and were placed on a work-shared dir</div><div>tmp/work-s=
hared/MACHINE,=C2=A0more specifically kernel-source and kernel-build-artifa=
cts .</div><div>Anyway any recipe that inherits the kernel bbclass was excl=
uded to be removed by the rm_works,</div><div>this can be checked on the me=
ta/classes/rm_work.bbclass inject_rm_work python function.<br></div><div><b=
r></div><div>Jose</div><div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
&gt; <br>
&gt; <br>
&gt; &gt; This can be particularly convenient when running a Yocto build as=
 a CI<br>
&gt; &gt; job, and only the deploy dir is made available for download.<br>
&gt; <br>
&gt; I=E2=80=99m wondering if the kernel-dev package should split the confi=
g out into a subpackage, so it can be installed or examined separately.<br>
<br>
In any case, we can update our CI to save the kernel-dev package or its con=
tents, so I&#39;m fine with<br>
this patch being dropped. Thanks!<br>
<br>
Regards,<br>
Matthias<br>
<br>
<br>
-- <br>
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any<br>
Amtsgericht M=C3=BCnchen, HRB 105018<br>
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider<br>
<a href=3D"https://www.tq-group.com/" rel=3D"noreferrer" target=3D"_blank">=
https://www.tq-group.com/</a><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#195120): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/195120" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/195120</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104215836/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104215836/5052612</a><br>
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
div>

--0000000000007dd57e0610db7941--

