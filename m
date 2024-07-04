Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6220FC30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 10:56:55 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web10.7715.1720090607601769497
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 03:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NeXf6cU0;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-48f3e704576so238147137.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 03:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720090606; x=1720695406; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w88gua3H7tbOCQV0qyGgvMdx+zR5X5y+YWc08WElxVU=;
        b=NeXf6cU0NQGrTHMpAAHH7qWsd0nT2YFa00hqupoVO0i6St62VbaUdxLAC1VuIMLGn8
         WzT21Uvg3jMmLgi25IxWuuNe/NiOgY4WYTMMzY3uQ/7zyoItE49iwtLi1PXYAbHCiJuT
         XTGMioKQmBbtQdL3PesQ+h2ora5d1pfQUQH2Twg1HCVs8Njga7QkENyqBsztwSHPDxpk
         pqPTTC+Jodc5Y2frn+BKFTvbGI189tdhjO1CwvsYzLM+6H7i4DlH6mLHrM0IBpH5lYGX
         oacxBb6R8QLWx8BhFlK4u95Y09BKReX9P+Ceh0MHoUrLnzdS4LxI7kSkHbZ7MfWWguhS
         v0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720090606; x=1720695406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w88gua3H7tbOCQV0qyGgvMdx+zR5X5y+YWc08WElxVU=;
        b=MQGewRc3SgjntyGVE2DYp5jrDgTyqvOsyOj5JRU5bHpeCKRlMbOq0PDijL+8BrwPTc
         lchb7e27G6nNUL4hMU7dvJfbtKub/bg4T3Yq6zjkWQXMwl0Wohz0vCfjeXmyPzlj4PQ3
         /TsiA/9Fjdn0xVTfO/0ydDmo/93PB2CrIIya6ObX9gWCAgHebJ6t/ASznsk9aPpV6aGJ
         FT9poZZ/BRA2sFglH+PC8ERyT56QcmexNhQN7hKIrj0AoimeFjqyDOvUyrct3UbnS61r
         jqGE92Qw+kxS0tFkUTkcBnrBlmXrFGbJdg+srRDcnldhVH8nfkFyDqM7jnbaGXBC0kE7
         BNbw==
X-Forwarded-Encrypted: i=1; AJvYcCXHBf+AvMTUHEmMfTb3Z5miQHR01Qdw6NnOC6GiHVoTWNd1QSn3De6TPk7joE3xrfCljCjhnTAkF1Ogpw8hQnJ4WKEzXXsi0ePcl2F1oYCgH3dos4wM6CXu
X-Gm-Message-State: AOJu0Yypnsj44LrWTH5GlXA5RVZ2xug8Cnp/4vM6vIgU+7Lb83GMoanb
	mFloiTQu1PSpjWnLxnrZPfp91OqCbLkWSAMW8ihJv8+De+s2KQEByLFeHeK+KeNOw9o3fTG9iCr
	0D6vFWpKGLV4FcPTnRX/toIUIILs=
X-Google-Smtp-Source: AGHT+IGyBTnWNiw7b0cEsoe6mJfccvb+6GPEhEBOIevh3Y/iGYwA/TS7UwVAhNTO7TFuYIJQFNI9H8k/QZunB6p/qBc=
X-Received: by 2002:a67:f556:0:b0:48f:eaf7:74e with SMTP id
 ada2fe7eead31-48fee88fa95mr1013535137.20.1720090605773; Thu, 04 Jul 2024
 03:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240703154004.2632376-1-jose.quaresma@foundries.io>
 <ce52f2465b097e9b1fedb37bee9f65ae0c24606a.camel@linuxfoundation.org> <17DEC8F48E4BD94A.16962@lists.openembedded.org>
In-Reply-To: <17DEC8F48E4BD94A.16962@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 4 Jul 2024 11:56:34 +0100
Message-ID: <CANPvuRmEwXODPUMt+acDJzFYDzz7j6hEMCYbCWR60uxroQXA_Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] openssh: upgrade 9.7p1 -> 9.8p1
To: quaresma.jose@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000089ef88061c69cdaf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 10:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201535

--00000000000089ef88061c69cdaf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu (quarta, 3/07/2024 =C3=A0(s) 19:=
57):

>
>
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu (quarta,
> 3/07/2024 =C3=A0(s) 18:41):
>
>> On Wed, 2024-07-03 at 16:40 +0100, Jose Quaresma via
>> lists.openembedded.org wrote:
>> > Release notes at https://www.openssh.com/txt/release-9.8
>>
>> Thanks for the upgrade, it does look important. Unfortunately it had a
>> build failure for musl:
>>
>> https://valkyrie.yoctoproject.org/#/builders/3/builds/68
>
>
I have fixed this musl issue.


>
>>
>> Also may be related:
>>
>>
>> https://valkyrie.yoctoproject.org/#/builders/74/builds/60/steps/15/logs/=
stdio
>>
>> https://valkyrie.yoctoproject.org/#/builders/18/builds/61/steps/12/logs/=
stdio
>
>
For the testimage, I will need more time to debug.
so I will only send the CVE fix in another patch while I'm still here
debugging.

Jose


>
>>
>> The build is still ongoing.
>>
>
> Tomorrow I will take a look at this and will try to fix it.
>
> Thanks
>
> Jose
>
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201498):
> https://lists.openembedded.org/g/openembedded-core/message/201498
> Mute This Topic: https://lists.openembedded.org/mt/107021655/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000089ef88061c69cdaf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a hr=
ef=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded=
.org</a>&gt; escreveu (quarta, 3/07/2024 =C3=A0(s) 19:57):<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr=
"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; escreveu (=
quarta, 3/07/2024 =C3=A0(s) 18:41):<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Wed, 2024-07-03 at 16:40 +0100, Jose Quaresma via <a=
 href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank=
">lists.openembedded.org</a> wrote:<br>
&gt; Release notes at <a href=3D"https://www.openssh.com/txt/release-9.8" r=
el=3D"noreferrer" target=3D"_blank">https://www.openssh.com/txt/release-9.8=
</a><br>
<br>
Thanks for the upgrade, it does look important. Unfortunately it had a buil=
d failure for musl:<br>
<br>
<a href=3D"https://valkyrie.yoctoproject.org/#/builders/3/builds/68" rel=3D=
"noreferrer" target=3D"_blank">https://valkyrie.yoctoproject.org/#/builders=
/3/builds/68</a></blockquote></div></div></blockquote><div><br></div><div>I=
 have fixed this musl issue.</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Also may be related:<br>
<br>
<a href=3D"https://valkyrie.yoctoproject.org/#/builders/74/builds/60/steps/=
15/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yoctop=
roject.org/#/builders/74/builds/60/steps/15/logs/stdio</a><br>
<a href=3D"https://valkyrie.yoctoproject.org/#/builders/18/builds/61/steps/=
12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yoctop=
roject.org/#/builders/18/builds/61/steps/12/logs/stdio</a></blockquote></di=
v></div></blockquote><div><br></div><div>For the testimage,=C2=A0I will nee=
d more time to debug.</div><div>so I will only send the CVE fix in another =
patch=C2=A0while I&#39;m still here debugging.<br><br>Jose<br>=C2=A0<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br=
>
<br>
The build is still ongoing.<br></blockquote><div><br>Tomorrow=C2=A0I will t=
ake a look at this and will try to fix it.<br><br>Thanks=C2=A0<br><br>Jose<=
br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#201498): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/201498" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/201498</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107021655/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107021655/5052612</a><br>
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

--00000000000089ef88061c69cdaf--

