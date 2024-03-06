Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F6EC5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 10:22:18 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web11.8823.1709720530221421898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 02:22:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JMGh8kKJ;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-47277290797so1085051137.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 02:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709720529; x=1710325329; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IgC1usucJ89VSMDF28KnKrpBwDco2KEUvIp2DYoXDgo=;
        b=JMGh8kKJV23E2uajomFzNdsfRTHz2mlZ7qlWjLirjx/LGwRaCEoGPztZhJBACkGHU4
         uLa79o1+wl/a8EnyvnqpY0BUrat5Z0gQWLeT8WS1QMvEmFia/gPAnwmXWNKaWYp9e8bb
         ud03sTJXHnOSMUcpACVcQ1pL7/6G8xaP4ilm9eqE59DN9arUTKQgXdEmeFErQWpHyHz2
         v4GNBC/VgUNjhZnkh4rSYZs300gB6GmifgexDBaYq5QXDAysCXxY6uLcSk5qis6LPprk
         VKdavuD5D2vFX+hTqNS8ED6mXPgxNDNf4/G5OQ83nsUrX9mxAhEYfRflJlXuh/QoRwTt
         jFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709720529; x=1710325329;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgC1usucJ89VSMDF28KnKrpBwDco2KEUvIp2DYoXDgo=;
        b=oblT4j20qn7qVXkYL1BQB0kNbTZKsKl9VhN0L1dNEw3Sj37gMUJoV7l+iRZaXvEWuC
         2EG/fDFl+bol5ek6rEOtV/ZFYZLIpHaL4rNzCAqBCDpSUADJzv/E8r9qyzsHP2tARxwA
         g5jTkHpG+O9lV+rYu0wBc0YaZ9rfKIJhXrdo+SfwY3lmiJYwqiW/RrAOfdd2INEi/R9Y
         XcBHuYR+0u7w0qZCNWmNPZAyAA7v7EKwgYQd+tpgJc825J3GoZ5Yf9wvCjDNn+ftbweG
         VmqP+eBsY2zh9i+JR4G7de5UFlpUQfwNQxoHzSS13+Ap9BZM8GY6cIbUCRLlNMaOEItc
         VNsA==
X-Forwarded-Encrypted: i=1; AJvYcCWBiAImiWgDMxipA+bPDORc3Mfb9qyILi0JaGKiHGSWnLl3JqD9FSWoYKdJuwRdgpkRxrjJI0O2owH5X8VWE3OYcqM4yg0z/xQv7cekcUS0UOU1xlwdnge8
X-Gm-Message-State: AOJu0YxrERU6u4osMGrcf1GZ9kIw+zEzRUCyL2NrdXKh87EkxbE1fTKe
	LnI69QP4LtjzvLTJ5zV+Zzgqm5ZDtkEjwFnNmrwvZNyoLLVS1gmBxZQdEge3UCnyGYQD0mSX4Dh
	lZOFxgfycNe7k6eTTWIl7yPONAxE=
X-Google-Smtp-Source: AGHT+IHlvLscZMj4vwwBRCxQx+doPqga7xKSZZLxGpWOUrjw8vqT4I5u/TS4/DSlYaHfeSHdYQpyVyoITiHIRAhu7YE=
X-Received: by 2002:a05:6102:3bfa:b0:472:64aa:403f with SMTP id
 be26-20020a0561023bfa00b0047264aa403fmr4544537vsb.26.1709720529125; Wed, 06
 Mar 2024 02:22:09 -0800 (PST)
MIME-Version: 1.0
References: <20240228183011.1495807-1-jose.quaresma@foundries.io>
 <CAMKF1sqZc2HR=iWKjDHQAVHHxTfXKv0DqcbHZr+-akTSvU24eA@mail.gmail.com>
 <e9a42854ce1e115e6f82088ae873f984a182596a.camel@linuxfoundation.org>
 <17B84BB9B5B6E4EC.16400@lists.openembedded.org> <CANPvuRnz--2ApD7u_uVUkRvQ7WH078V4xwDSRGvsEXhCs-NyHA@mail.gmail.com>
 <17B8756EC40C8FBB.30419@lists.openembedded.org> <10c3fd9adcd8c39a85f578ab690fc7a45b68cf9c.camel@linuxfoundation.org>
 <17B9E61D9B388488.13906@lists.openembedded.org>
In-Reply-To: <17B9E61D9B388488.13906@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 6 Mar 2024 10:21:58 +0000
Message-ID: <CANPvuRkrNGD6pj51BDEEJ=A2n+xxbs-Wjk1Fvs+FoXcritSuGA@mail.gmail.com>
Subject: Re: [OE-core] [RFC OE-core][PATCH v2 1/7] go: rework patch to avoid identation
To: quaresma.jose@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000cdc9470612fb5406"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 10:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196662

--000000000000cdc9470612fb5406
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu (ter=C3=A7a, 5/03/2024 =C3=A0(s)=
 14:55):

>
>
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu (domingo,
> 3/03/2024 =C3=A0(s) 23:03):
>
>> On Thu, 2024-02-29 at 22:19 +0000, Richard Purdie via
>> lists.openembedded.org wrote:
>> > On Thu, 2024-02-29 at 21:42 +0000, Jose Quaresma wrote:
>> > >
>> > >
>> > > A quinta, 29/02/2024, 09:35, Jose Quaresma via
>> > > lists.openembedded.org
>> > > <quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu:
>> > > >
>> > > >
>> > > > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu
>> > > > (quinta, 29/02/2024 =C3=A0(s) 08:18):
>> > > > > On Wed, 2024-02-28 at 21:16 -0800, Khem Raj wrote:
>> > > > > > Fails to compile bunch of  recipes using go e.g. influxdb,
>> > > > > > crucible,
>> > > > > > syzkaller in meta-oe see
>> > > > > >
>> > > > > >
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3667/s=
teps/15/logs/stdio
>> > > > >
>> > > > > Also fails for oe-selftest:
>> > > > >
>> > > > >
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6415/s=
teps/14/logs/stdio
>> > > > >
>> > > > > and on arm hosts:
>> > > > >
>> > > > >
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/7999/s=
teps/13/logs/stdio
>> > > > >
>> > > >
>> > > >
>> > > >
>> > > > Thanks for testing, I will take a look on all of this today.
>> > >
>> > > I have no progress today and unfortunately I won't have time to
>> > > work
>> > > on this in the next few days :( if anyone wants to continue with
>> > > this
>> > > effort, feel free to do so.
>> > >
>> > > my apologies.
>> >
>> > FWIW https://github.com/golang/go/issues/65887 looked relevant to the
>> > first issue.
>> >
>> > We are really late in the schedule to pull in things like this so I'm
>> > not sure we'll get this in at this point :/.
>> >
>
>
> Having the 1.21 bump was already a significant benefit for the project in
> my opinion.
> so if you drop the 1.22 the impact is much reduced.
>
>
>>
>> I've some tweaks in master-next I'm testing to see if it does sort
>> 1.22...
>>
>
> I also will do some tests with your changes in main-next to see if I foun=
d
> any runtime issue.
>

The stack I have tested may be considered a bit limited but I didn't find
anything relevant that prevents integration.
If this bump to 1.22 can be tested with meta-virt the results would be a
wider range.

Jose


>
> Jose
>
>
>>
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
> View/Reply Online (#196634):
> https://lists.openembedded.org/g/openembedded-core/message/196634
> Mute This Topic: https://lists.openembedded.org/mt/104628621/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000cdc9470612fb5406
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a hr=
ef=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded=
.org</a>&gt; escreveu (ter=C3=A7a, 5/03/2024 =C3=A0(s) 14:55):<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; escrev=
eu (domingo, 3/03/2024 =C3=A0(s) 23:03):<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Thu, 2024-02-29 at 22:19 +0000, Richard Purdie =
via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; On Thu, 2024-02-29 at 21:42 +0000, Jose Quaresma wrote:<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; A quinta, 29/02/2024, 09:35, Jose Quaresma via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedde=
d.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; escreveu:=
<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; e=
screveu<br>
&gt; &gt; &gt; (quinta, 29/02/2024 =C3=A0(s) 08:18):<br>
&gt; &gt; &gt; &gt; On Wed, 2024-02-28 at 21:16 -0800, Khem Raj wrote:<br>
&gt; &gt; &gt; &gt; &gt; Fails to compile bunch of=C2=A0 recipes using go e=
.g. influxdb,<br>
&gt; &gt; &gt; &gt; &gt; crucible,<br>
&gt; &gt; &gt; &gt; &gt; syzkaller in meta-oe see<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/ty=
phoon/#/builders/88/builds/3667/steps/15/logs/stdio" rel=3D"noreferrer" tar=
get=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/builders/88/b=
uilds/3667/steps/15/logs/stdio</a><br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Also fails for oe-selftest:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon=
/#/builders/80/builds/6415/steps/14/logs/stdio" rel=3D"noreferrer" target=
=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/builders/80/buil=
ds/6415/steps/14/logs/stdio</a><br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; and on arm hosts:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon=
/#/builders/97/builds/7999/steps/13/logs/stdio" rel=3D"noreferrer" target=
=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/builders/97/buil=
ds/7999/steps/13/logs/stdio</a><br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Thanks for testing, I will take a look on all of this today.=
<br>
&gt; &gt; <br>
&gt; &gt; I have no progress today and unfortunately I won&#39;t have time =
to<br>
&gt; &gt; work<br>
&gt; &gt; on this in the next few days :( if anyone wants to continue with<=
br>
&gt; &gt; this<br>
&gt; &gt; effort, feel free to do so.<br>
&gt; &gt; <br>
&gt; &gt; my apologies.<br>
&gt; <br>
&gt; FWIW <a href=3D"https://github.com/golang/go/issues/65887" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/golang/go/issues/65887</a>=C2=
=A0looked relevant to the<br>
&gt; first issue.<br>
&gt; <br>
&gt; We are really late in the schedule to pull in things like this so I&#3=
9;m<br>
&gt; not sure we&#39;ll get this in at this point :/.<br>
&gt;</blockquote><div><br></div><div>Having the 1.21 bump was already a sig=
nificant benefit for the project in my opinion.<br></div><div>so if you dro=
p the 1.22 the impact is much reduced.<br></div><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"> <br>
<br>
I&#39;ve some tweaks in master-next I&#39;m testing to see if it does sort<=
br>
1.22...<br></blockquote><div><br></div><div>I also will do some tests with =
your changes in main-next to see if I found any runtime issue.</div></div><=
/div></blockquote><div><br></div><div>The stack I have tested=C2=A0may be c=
onsidered a bit limited but=C2=A0I didn&#39;t find anything relevant=C2=A0t=
hat prevents integration.<br>If this bump to 1.22 can be tested with meta-v=
irt=C2=A0the results would be a wider range.</div><div><br></div><div>Jose<=
/div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>Jose</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
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
View/Reply Online (#196634): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196634" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/196634</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104628621/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104628621/5052612</a><br>
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

--000000000000cdc9470612fb5406--

