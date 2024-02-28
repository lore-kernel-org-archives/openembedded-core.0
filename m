Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DFCCC5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 12:17:14 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web10.11579.1709122632403821962
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 04:17:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AelUjDk3;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-7d5cbc4a585so2007664241.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 04:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709122631; x=1709727431; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xHbBoQT4Qj03iyglyjwrxBNmleJ9FJDgDHqQyx/XDaU=;
        b=AelUjDk3zLX3qZibOvREEZpyigy2xQn9Q0dj4KEKU81hO6xAVsk0WWpbp6dXKX0kGu
         VF5o22bq2aBmRB12JgejBrFpWyDHF+NMwA6XY3ap3GfYvfxx6UBc3MPg1hJQUp1Ypnka
         M90vNlywnx2CE0haBJ+3O3CbTTmh+Cj3gZ0wLBv+gaplumPK9DEgIJ0ikt2yYqmoVkVe
         hmyjMLpZPCCLHqxSwZ3JQAwKemc4gLitvviVtz92mSOsf9cR2HHJujTFVT2bpYLrVb57
         M68W1EjqtMN09khIrcvqs4Xr/1Z2c7XP7C4kJE66jxjAxn3zx1XfOWIp4aAsyYr+AlWK
         qzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709122631; x=1709727431;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHbBoQT4Qj03iyglyjwrxBNmleJ9FJDgDHqQyx/XDaU=;
        b=iQnDwqEeXxnHcfyB8ZarGJ6GURwyg3hLgHjFoyRQqlMl+y7mFGdtc1VI+XNvH2uhn9
         H60gTNxxLsN5Lf2fKma5Y3d7fP9U+3g6dOd2hjpgEsmX+QCBGTNbTAzpeJrZjWn66Dwb
         xVtGc50/yN00aAcNq3KVtjXdaD5UBYBQa4lVceVsDtZjWrkB+7BgNpd45iqVr8jC175m
         /JLZ36lYB6YCPXSkuzzldXv07MjntLhj3gA4t9Zp2+haHjBqFCyai66rncPi/CYZIGFY
         WYAwrG4uI0ZAAOrqFS/s5A3Kxi6DDlsKBSwiFyxsCnhuRCpLjwHS0B740RYRAXlUiStf
         po+g==
X-Forwarded-Encrypted: i=1; AJvYcCWC5USkBWX8+ZKKi6a7GAHR53cCPxP8/c+Jd9CE5lklUn4vxlFulwxyMkAI4JDIWHPyR48rqI1CULJsyuoNibVCkqAMH5Yk13IYCPcU0MyPHN2is3kZ0nwG
X-Gm-Message-State: AOJu0YzBybv/BoCYoyKVQGdy83S3i6HuO73VkO92d6Xw8fLpNo8SaBz5
	UrQI/4qw6cT6ff1J5MPmfDW7Qz7oN2TCMoeXCBQkKlkwaNRoitlrNq4d7n1hCj/7QALh2jEKwAk
	72lDyv6XDoeCw3pNdVbC2hmr8ypg=
X-Google-Smtp-Source: AGHT+IEzAS1b8A6rahRotyjCtkLkc1VYKU1ttNbBqNGkO2AHxH+1xdFYO3OjBRcovV1wz862eYuKxw73CYoWLPapvik=
X-Received: by 2002:a05:6102:acb:b0:471:eb10:a13 with SMTP id
 m11-20020a0561020acb00b00471eb100a13mr6455757vsh.24.1709122631236; Wed, 28
 Feb 2024 04:17:11 -0800 (PST)
MIME-Version: 1.0
References: <20240227100709.1154-1-jose.quaresma@foundries.io>
 <17B7B05748A57C25.14830@lists.openembedded.org> <CANPvuRkPCgyBY43BH7S=azRCKum51NVk2ikQ4jwU9V6ezUQWGg@mail.gmail.com>
 <b6a799de1f0e8df4c117ce5dec0bd08243878e68.camel@linuxfoundation.org>
 <CADkTA4M_C-83rQueM7L5FOemO6_D-dj066E28FHZp8Q8GQYUyw@mail.gmail.com> <17B7C169DE9703C5.684@lists.openembedded.org>
In-Reply-To: <17B7C169DE9703C5.684@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 28 Feb 2024 12:17:00 +0000
Message-ID: <CANPvuRknxn0ZaRYXaAGzqOUwGmOE9v0qbq+i0Yy=iptj70n4_g@mail.gmail.com>
Subject: Re: [OE-core] [RFC OE-core][PATCH 3/3] goarch: disable dynamic
 linking globally
To: quaresma.jose@gmail.com
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000005004d70612701f20"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 12:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196383

--0000000000005004d70612701f20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu (ter=C3=A7a, 27/02/2024 =C3=A0(s=
) 15:20):

>
>
> Bruce Ashfield <bruce.ashfield@gmail.com> escreveu (ter=C3=A7a, 27/02/202=
4
> =C3=A0(s) 14:01):
>
>> On Tue, Feb 27, 2024 at 8:57=E2=80=AFAM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > On Tue, 2024-02-27 at 10:13 +0000, Jose Quaresma wrote:
>> > > Hi,
>> > >
>> > > I would like to ask if this patchset could be exercised in the
>> > > autobuilder?
>> > > I only got it working yesterday and today I'm going to do a more
>> > > exhaustive test.
>> > > This is still missing the update to 1.22, which I'll do later, but
>> > > testing this would be a good help.
>> >
>> > I did put this in for testing. The build is still running but so far
>> > there were two issues:
>> >
>> >
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6466/s=
teps/14/logs/stdio
>> >
>> > from oe-selftest -r gotoolchain.oeGoToolchainSelfTest.test_go_dep_buil=
d
>>
>
> I have see of this also in my local builds in my distro and there are som=
e
> reports upstream
> https://github.com/golang/go/issues/61928
> I believe this one is expected with the update but I am still doing my
> local tests.
>

I have fixed something like this in my distro so I will fix it also in my
next and final submission.

Jose


>
>> >
>> > and meta-clang:
>> >
>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/142/builds/39
>> >
>> > meta-virt did pass our testing but I've copied Bruce so he's aware of
>> > this and can comment. Copying Khem for meta-clang too.
>>
>
> For meta-clang maybe we can switch to gcc to build the go-helloworld
>
>
>>
>> I'm running into some golang issues linking with my latest updates to
>> meta-virt .
>>
>> I'll apply these locally and see if they help, make things worse or have
>> no impact on my upcoming recipe bumps for m-virt.
>>
>
> I am testing mostly docker and everything seems fine so far.
>
> Jose
>
>
>>
>> Bruce
>>
>>
>> >
>> > Cheers,
>> >
>> > Richard
>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196275):
> https://lists.openembedded.org/g/openembedded-core/message/196275
> Mute This Topic: https://lists.openembedded.org/mt/104600118/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000005004d70612701f20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a hr=
ef=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded=
.org</a>&gt; escreveu (ter=C3=A7a, 27/02/2024 =C3=A0(s) 15:20):<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com"=
 target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; escreveu (ter=C3=A7a, 2=
7/02/2024 =C3=A0(s) 14:01):<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Tue, Feb 27, 2024 at 8:57=E2=80=AFAM Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, 2024-02-27 at 10:13 +0000, Jose Quaresma wrote:<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; I would like to ask if this patchset could be exercised in the<br=
>
&gt; &gt; autobuilder?<br>
&gt; &gt; I only got it working yesterday and today I&#39;m going to do a m=
ore<br>
&gt; &gt; exhaustive test.<br>
&gt; &gt; This is still missing the update to 1.22, which I&#39;ll do later=
, but<br>
&gt; &gt; testing this would be a good help.<br>
&gt;<br>
&gt; I did put this in for testing. The build is still running but so far<b=
r>
&gt; there were two issues:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/87/=
builds/6466/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https=
://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6466/steps/14/=
logs/stdio</a><br>
&gt;<br>
&gt; from oe-selftest -r gotoolchain.oeGoToolchainSelfTest.test_go_dep_buil=
d<br></blockquote><div><br></div><div>I have see of this also in my local b=
uilds in my distro and there are some reports upstream</div><div><a href=3D=
"https://github.com/golang/go/issues/61928" target=3D"_blank">https://githu=
b.com/golang/go/issues/61928</a></div><div>I believe=C2=A0this one is expec=
ted=C2=A0with the update but I am still doing my local tests.</div></div></=
div></blockquote><div><br></div><div>I have fixed something like this in my=
 distro so I will fix it also in my next and final submission.</div><div><b=
r></div><div>Jose</div><div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; and meta-clang:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/142=
/builds/39" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctop=
roject.org/typhoon/#/builders/142/builds/39</a><br>
&gt;<br>
&gt; meta-virt did pass our testing but I&#39;ve copied Bruce so he&#39;s a=
ware of<br>
&gt; this and can comment. Copying Khem for meta-clang too.<br></blockquote=
><div><br></div><div>For meta-clang maybe we can switch=C2=A0to gcc to buil=
d the go-helloworld<br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
I&#39;m running into some golang issues linking with my latest updates to<b=
r>
meta-virt .<br>
<br>
I&#39;ll apply these locally and see if they help, make things worse or hav=
e<br>
no impact on my upcoming recipe bumps for m-virt.<br></blockquote><div><br>=
</div><div>I am testing mostly docker=C2=A0and everything seems fine so far=
.<br><br>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Bruce<br>
<br>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
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
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#196275): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196275" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/196275</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104600118/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104600118/5052612</a><br>
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

--0000000000005004d70612701f20--

