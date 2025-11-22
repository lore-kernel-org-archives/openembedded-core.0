Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A41CFC533
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 12:24:20 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8152.1763814257945702404
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 04:24:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GjsLgJQ7;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: liu.ming50@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34101107cc8so2566387a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 04:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763814257; x=1764419057; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DUZdLq2Pif+hy40hYIoRrVGbFL8Kd24CmPHVUwkTp2c=;
        b=GjsLgJQ7ZApXkAUSOwgnU4p17BMt0UuJ6w3Xe+pLmTsHAJUfnPnNpCHqNly7bWuLmA
         ALsCmc5QPKkGbMry7gu4iPeLdbqzPNGJlnPu/7E9vSt5JNwilMhlV5UBUuxqJP0jQ17c
         MQIa1YAsyOz+4Y7AA9/wH66gHkpFNif38zk/sFX7Lji200Po3yE+MdWqftZEkr0VmxcJ
         qc148qYOvthGh2bV+aLMPD8MW7nsKlBYl6j3rXwP2rtB8RAD7n/ZR1hTD+HUw0VQfpi0
         T0sbBcda9OtdL+U7Xz/m2mN2ZOfEppUVUoUpOuOUMQyQlYJlcGkEppEmvHc7w1aTccyT
         K9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763814257; x=1764419057;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUZdLq2Pif+hy40hYIoRrVGbFL8Kd24CmPHVUwkTp2c=;
        b=DflTtGIucmNA9G//BdSGFcYoa/W+IOd9mdavuXzoLWZW10Qc8zR4ocDfAmikvCxlQn
         LmYrz9UpLqR9fXlB/VBVc3bmzvzA1ynpz2S6BHqm1e+Fz9i/lWAYCLS+5e7EFvI2KPbG
         Eu04mZhE0/F0ac2aQKuHIwD41leZ2Qx3prv7VLmjz2Qerue0P+cktuUg6NU6o43lZwDw
         VAKkZHJPDyCVwrLF9JGDiFaGzKYqvBiHcsqzzbP5NBICnWOdTibCeHRFhe14SgQNqqwN
         HuOLr1i8P0cQ9IMFr/9hhVCWetLYA8OtEcVTWktzxI/tfVjQtNe46GGRDJhzwXjl2toQ
         nKhA==
X-Gm-Message-State: AOJu0Yy1waIC6sUHbjNGXru68jreSp4A2HXcJAOUbsIygsfAtEWC8rfN
	WOVxtAMbk55NBE08gS9g8ZA9at4VoCu45xuVdAUBfuk5Lmmqw211NBok4gJ04lL7gWmFsEWXYXO
	KacMBLCtt26K0pJOcSJsSIvEwJBuWqjQ=
X-Gm-Gg: ASbGnctX1O/e9BHazrq4s7qQ+pWAv4EuFh3KoNRSWjDgLryVIOVuKcPWkSwxrjQOZPO
	q4UwgrVCb3CxRnyYPyTrq9/s2IvzikoDT3MZDCu+hC4tOohSXF6S3n34y4WQxZU5k6/UpKYmPSS
	2bhSMmbsVhaWUw6i//qdTpRQxODwFqeFrLuGr3BCObx8ZTbMW91+znFd4ZXFlh3//8QLt9G+gUk
	6p7+eLWW8JFFvlreXbEmUA9Z06KGGnze4h1cFzYi5hTFQWYW5HNjrJ1I2OEBCgpHZ2FysdVemUE
	B0gOXTWr1JdxNxolFGM1LwssC0R6MQ==
X-Google-Smtp-Source: AGHT+IFwlk8Wy0MmPxdfX+UtnaSbX9qj4rAFzxhN6tDKMeaIde4F6QKhqtyOUjNBgMAryE0HP3XOrgqGIgbViNmAhU0=
X-Received: by 2002:a17:90b:5588:b0:340:d81d:7874 with SMTP id
 98e67ed59e1d1-34733f442c9mr6271130a91.26.1763814257242; Sat, 22 Nov 2025
 04:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20251001093453.185784-1-liu.ming50@gmail.com> <CANNYZj8ka0t576ifJKNvrahors+QsPz+0xj2JZNZ8x91sJX=hw@mail.gmail.com>
 <CALatG=61tOh728dLdkmTwuKRSd9Tm1O0cTOrWncCW8Y=uPkzLg@mail.gmail.com>
In-Reply-To: <CALatG=61tOh728dLdkmTwuKRSd9Tm1O0cTOrWncCW8Y=uPkzLg@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Sat, 22 Nov 2025 13:24:05 +0100
X-Gm-Features: AWmQ_bkqekWuzBdpVM9jDYa68d-3AykA4rbWLj2rS_4qojD9AUKpEbMff1jcWLc
Message-ID: <CALatG=431+x-TwfAdo=88gfzQOV4qvhFLyRVZkM5j2J9cz=haQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-module-split.bbclass: support muti-lines
 in module conf
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Mathias Thore <mathias.thore@atlascopco.com>
Content-Type: multipart/alternative; boundary="00000000000040b6c106442e02eb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 12:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226694

--00000000000040b6c106442e02eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Alexander/maintainers:

Could you please kindly help me review this MR? It's pending for a while.

the best.
thank you

Ming Liu <liu.ming50@gmail.com> =E6=96=BC 2025=E5=B9=B410=E6=9C=881=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8812:02=E5=AF=AB=E9=81=93=EF=BC=9A

> > Can you provide an example of such a variable which causes the issue?
>
> Sure, when we have the following settings:
>
> ```
> KERNEL_MODULE_AUTOLOAD =3D "mod1"
> module_conf_mod1 =3D "line1\nline2\nline3"
> ```
>
> // MIng
>
> Alexander Kanavin <alex.kanavin@gmail.com> =E6=96=BC 2025=E5=B9=B410=E6=
=9C=881=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8811:49=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
>> On Wed, 1 Oct 2025 at 11:35, Ming Liu via lists.openembedded.org
>> <liu.ming50=3Dgmail.com@lists.openembedded.org> wrote:
>> >
>> > The expanded bitbake variables are raw strings so it does not support
>> > writting multiple lines to a kernel module conf, add the support by
>> > decoding it with 'unicode-escape'.
>> > -                f.write("%s\n" % modconf)
>> > +                f.write("%s\n" %
>> modconf.encode().decode('unicode-escape'))
>>
>> Can you provide an example of such a variable which causes the issue?
>>
>> Alex
>>
>

--00000000000040b6c106442e02eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Alexander/maintainers:<div><br></div><div>Could you pl=
ease kindly help me review this MR? It&#39;s pending for a while.</div><div=
><br></div><div>the best.</div><div>thank you</div></div><br><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Mi=
ng Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@gmail.com</a>=
&gt; =E6=96=BC 2025=E5=B9=B410=E6=9C=881=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=
=8B=E5=8D=8812:02=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr">&gt; Can you provide an examp=
le of such a variable which causes the issue?<div><br></div><div>Sure, when=
 we have the following settings:</div><div><br></div><div>```</div><div>KER=
NEL_MODULE_AUTOLOAD =3D &quot;mod1&quot;</div><div>module_conf_mod1 =3D &qu=
ot;line1\nline2\nline3&quot;</div><div>```</div><div><br></div><div>// MIng=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" targe=
t=3D"_blank">alex.kanavin@gmail.com</a>&gt; =E6=96=BC 2025=E5=B9=B410=E6=9C=
=881=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8811:49=E5=AF=AB=E9=81=93=
=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed=
, 1 Oct 2025 at 11:35, Ming Liu via <a href=3D"http://lists.openembedded.or=
g" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&lt;liu.ming50=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; The expanded bitbake variables are raw strings so it does not support<=
br>
&gt; writting multiple lines to a kernel module conf, add the support by<br=
>
&gt; decoding it with &#39;unicode-escape&#39;.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot=
;%s\n&quot; % modconf)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot=
;%s\n&quot; % modconf.encode().decode(&#39;unicode-escape&#39;))<br>
<br>
Can you provide an example of such a variable which causes the issue?<br>
<br>
Alex<br>
</blockquote></div>
</blockquote></div>

--00000000000040b6c106442e02eb--

