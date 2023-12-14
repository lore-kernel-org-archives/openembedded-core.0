Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F79C4167B
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 13:02:28 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.21404.1702558945649111139
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 05:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dvMvkApQ;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-58d1b767b2bso5292296eaf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 05:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702558945; x=1703163745; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dVkbHPZFZwIsDYOtntH4x+LTQHN8m9nJ5zIEuMK8Zy4=;
        b=dvMvkApQNhkOhHhKOyRCtdT3zn2VxCEtN0NaM/lbiHXVDCB0ljdRUjIaCg7r97vSIn
         zD+C1c81+qxGLdP+vbqCI11Y9/uDrJ1s3suUB494iL/Q0JdzS7YwOeUO63uXC5AbWmjS
         DsxU1oMoKNujWKKXPmaRRqk2R1ynsHvgVOp2QpVmIXJpQ7KYMwxehNAgXqsyuo2jWo0m
         GQ1m1Z26Yd09+nzAuhiqGTOYS1t59/0i9dzYto1CilkniwcMWCaDIWCSXl8YDont28mh
         N5Gvn2V6S198lE5YvM70shtI6l6QDL7YwQVIWqlPgZ7UuqSDeTK8lPtgzRaUfXpoPXy9
         wSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702558945; x=1703163745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVkbHPZFZwIsDYOtntH4x+LTQHN8m9nJ5zIEuMK8Zy4=;
        b=IjpwHgknMdEDr+6H+P1KJN5cVNRZVKSNp+e8+mBzrqdc/QqSQjXesXSgd2KyzoIRWp
         iz8/JN6ppvSNOSjDbNhkHGYruwRSb9NmcJgulohNVaeK1+8d6k4pELs1Wi/HlN/qVAcA
         qA2ekZz56nDyMANhCwV5uZPSuTOmaGpR9/wyW84UwDndkTng3W+884g/Sy2x7xrv4EnD
         fLHtHjDW4Rz1WNBf+rJBlwi82a80oh0OLTO/0cU+tHRJOST+/qu0M3lDOLlGK73SlH0N
         CabHKrLbO2lOh2nK5Sav2rZds/+PYiZlSspVx3X4TwBrxBVhSxSIy74EhCpNvxSDgtuP
         C0Kw==
X-Gm-Message-State: AOJu0YzThdiMBkoOnSk75z06sFbji4cQaOCCwhUgv06mfm3LMxm0Iw7x
	OZo55Eqd1JNz5RvdExGysymJVajxiDN0SABuAuw=
X-Google-Smtp-Source: AGHT+IEqItGZ0Gf3DsVsFZnS4Xoe4NF5ybLCyXi0aHMDDgMO5vnMzPvZiDoFCsafu7N8kNFNvhF47AmR9718ipPEBKI=
X-Received: by 2002:a05:6359:2c43:b0:16b:9480:41c8 with SMTP id
 qv3-20020a0563592c4300b0016b948041c8mr7724096rwb.1.1702558944749; Thu, 14 Dec
 2023 05:02:24 -0800 (PST)
MIME-Version: 1.0
References: <20231213085657.2552223-1-yoann.congal@smile.fr>
 <CANNYZj9mWiEZRf_snYJ0eRcirn746GbkZSekLV3-XVcHjaR6bw@mail.gmail.com>
 <6cfb111def75c0f1549e7f004deac4e8a44365cf.camel@linuxfoundation.org>
 <CANNYZj8iD+LQRz8Sqb=QbYEXd6W_rnXz11pEVmzk9mGFKywfyA@mail.gmail.com>
 <7924018e34e7e6e76d5e1be046e8aa65481e15af.camel@linuxfoundation.org>
 <CANNYZj8bin4UjXK=gj-aR35t=ajQmNFsD8LKsiX_7x2-z08fYg@mail.gmail.com>
 <32526832f7e19b83551e786f0ab185cf7b879d1b.camel@linuxfoundation.org>
 <CANNYZj9umd8trnf1BaBC0TBxtE44oYzkHUNAmVj+is7mP94Tnw@mail.gmail.com> <ff1629d4d4fef4f3e8db9bad3fad4220d08f01ef.camel@linuxfoundation.org>
In-Reply-To: <ff1629d4d4fef4f3e8db9bad3fad4220d08f01ef.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 14 Dec 2023 13:02:13 +0000
Message-ID: <CANPvuR=vFFBkEp6eH8JiM36wgi=BWHYBYm0hrvqib07jcn=djg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] strace: Disable bluetooth support by default
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org, Tim Orling <ticotimo@gmail.com>, 
	Martin Jansa <martin.jansa@gmail.com>, Ross Burton <ross.burton@arm.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: multipart/alternative; boundary="0000000000001c6d01060c77e5aa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 13:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192367

--0000000000001c6d01060c77e5aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quinta,
14/12/2023 =C3=A0(s) 12:37:

> On Thu, 2023-12-14 at 13:34 +0100, Alexander Kanavin wrote:
> > On Thu, 14 Dec 2023 at 13:30, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > I think it would have a huge impact on the throughput of patches :( A=
n
> > > hour or two before the majority of the tests even start.
> >
> > Then the only remaining idea I have is adding more hardware. So that
> > there's enough of it to rarely if ever have a situation where several
> > builds run on the same worker.
>
> We are in the process of trying to work out which direction the
> infrastructure will take as we are due a hardware refresh FWIW.
>
> I do still also think we need to take a look at the sstate
> matches/mismatches...
>

I've thought a few times that having an argument on bitbake or something
else to just
execute the native targets would be very useful.
With something like that we can split the builds for multiple machines in
two steps building first the common part,
In this first step we have some of the havey like clang-native rust-native
rust-llvm-native.

To conclude the first build would only run and build the native targets and
the following builds will get all from the sstate.

Jose


> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192364):
> https://lists.openembedded.org/g/openembedded-core/message/192364
> Mute This Topic: https://lists.openembedded.org/mt/103146402/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000001c6d01060c77e5aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia quinta, 14/12/2023 =C3=A0(s) 12:37:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Thu, 2023-12-14 at 13:34 +0100, =
Alexander Kanavin wrote:<br>
&gt; On Thu, 14 Dec 2023 at 13:30, Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; I think it would have a huge impact on the throughput of patches =
:( An<br>
&gt; &gt; hour or two before the majority of the tests even start.<br>
&gt; <br>
&gt; Then the only remaining idea I have is adding more hardware. So that<b=
r>
&gt; there&#39;s enough of it to rarely if ever have a situation where seve=
ral<br>
&gt; builds run on the same worker.<br>
<br>
We are in the process of trying to work out which direction the<br>
infrastructure will take as we are due a hardware refresh FWIW.<br>
<br>
I do still also think we need to take a look at the sstate<br>
matches/mismatches...<br></blockquote><div><br></div><div>I&#39;ve thought =
a few times that having an argument on bitbake or something else to just</d=
iv><div>execute the native targets would be very useful.<br>With something =
like that we can split the builds for multiple machines in two steps buildi=
ng first the common part,</div><div>In this first step we have some of the =
havey like clang-native rust-native rust-llvm-native.<br><br>To conclude th=
e first build would only run and build the native targets and the following=
 builds will get all from the sstate.<br><br>Jose</div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192364): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/192364" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/192364</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103146402/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103146402/5052612</a><br>
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

--0000000000001c6d01060c77e5aa--

