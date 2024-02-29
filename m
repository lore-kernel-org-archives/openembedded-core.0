Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D424C48BF6
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 21:42:20 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web11.7658.1709242935948542910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 13:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kHJGI2Jw;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7d2e19120b5so759582241.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 13:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709242935; x=1709847735; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nqztBQSZ0ynEVqAuHUjOUVvTnMAeo2ott14w6RkDHJ4=;
        b=kHJGI2Jw8lG36vyLZqGCDcoOWqc13Afe7dGLA/07urFI8CENxZ2/r03RYTeZApdUxj
         MEadjYqgf2S7wga9h1R6YHd5Yc5D5DoLP5/VqZHOE3iNgorQ2rkgPi7nJIeunhaxXpZA
         6nl0RHMJkCaKCZn5ZnIEZJmWqBz55x9qd7aDvA5Pv7fXBs4uckEeapX+Qz2lItIV15QK
         Pp5crQU0ry2WlGriWIjeIUraJmQVzd5vPs5UVtfdzvR3SacAUclkA8454+KVvlozZlEx
         FhXqZf+qzC9jVpD4L+TQxICDHIFM0600zJJY7Qmso9+5LaKsKh6Xalf3CS4O99qQsFlq
         oxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709242935; x=1709847735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nqztBQSZ0ynEVqAuHUjOUVvTnMAeo2ott14w6RkDHJ4=;
        b=hFfBScFp4HzN2P6fsdwfX/CvaxKJmuAEGEHn/KYE+cWpofJfuyMj7IGHZSbHi6Q2eq
         lgshDfM5f/vlSUMiuTrrsLGGGwIsUsrY2kEnS3HkW7Vzn3/JtyCe0bVYjBA0EzovMV52
         qsLupJ9wKiCueBLMdFMqH+OpYxStsLzMgc5MWgWsRAN5MsXTG4t8hNcSzLKOTJnQDqee
         S7zISi5nh867g8MQjwFja88/Gjl8pRfyHXF6io+4S/6dYXYbIJjwJRmuolrCFGUK+NMr
         +AQeCj3jd+FAOGYJxzMBcg5QadnSpc9e74oblwNCk7ogV2tbGEjORKYjaMKXIFwwvYRs
         VRZg==
X-Forwarded-Encrypted: i=1; AJvYcCUyb4unzTLgkwTiN5F0AQ1SvEzMsDZsTwDrjC1bc+ry/b2hfxc61CigjnRQYHaevQYJ5CGP68ohKy2d/SXPdHBx5C4zJvcyEzjW41YfcEWivphXlwWOdcNL
X-Gm-Message-State: AOJu0Yzy8JRYqeYepipSpvGzo3QGtNMtOEpbIfnYI4Coq8dmMRnzo9CZ
	1cuKzP4MB85pMXCLLMU6k80BXxxE/bfzh20Zo9qY6otO/1rv/oMR8o7QdXEYvdue1oCa/Kl/Hhi
	6SoTXo9hvga9vhSA6VYcbLQj7M/A=
X-Google-Smtp-Source: AGHT+IGe/FKnziBt1alhlvXyKy1ixPn2jtlJ7o3d/SWJe7i7yafL12onr1+atwypG6bLKafRwTC6VfxRqfiIt/aDdrU=
X-Received: by 2002:a05:6102:3093:b0:472:6e7f:888b with SMTP id
 l19-20020a056102309300b004726e7f888bmr3323011vsb.32.1709242934846; Thu, 29
 Feb 2024 13:42:14 -0800 (PST)
MIME-Version: 1.0
References: <20240228183011.1495807-1-jose.quaresma@foundries.io>
 <CAMKF1sqZc2HR=iWKjDHQAVHHxTfXKv0DqcbHZr+-akTSvU24eA@mail.gmail.com>
 <e9a42854ce1e115e6f82088ae873f984a182596a.camel@linuxfoundation.org> <17B84BB9B5B6E4EC.16400@lists.openembedded.org>
In-Reply-To: <17B84BB9B5B6E4EC.16400@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 29 Feb 2024 21:42:04 +0000
Message-ID: <CANPvuRnz--2ApD7u_uVUkRvQ7WH078V4xwDSRGvsEXhCs-NyHA@mail.gmail.com>
Subject: Re: [OE-core] [RFC OE-core][PATCH v2 1/7] go: rework patch to avoid identation
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000f76ea706128c2138"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 21:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196448

--000000000000f76ea706128c2138
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A quinta, 29/02/2024, 09:35, Jose Quaresma via lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu:

>
>
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu (quinta,
> 29/02/2024 =C3=A0(s) 08:18):
>
>> On Wed, 2024-02-28 at 21:16 -0800, Khem Raj wrote:
>> > Fails to compile bunch of  recipes using go e.g. influxdb, crucible,
>> > syzkaller in meta-oe see
>> >
>> >
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3667/s=
teps/15/logs/stdio
>>
>> Also fails for oe-selftest:
>>
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6415/s=
teps/14/logs/stdio
>>
>> and on arm hosts:
>>
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/7999/s=
teps/13/logs/stdio
>
>
>
> Thanks for testing, I will take a look on all of this today.
>

I have no progress today and unfortunately I won't have time to work on
this in the next few days :( if anyone wants to continue with this effort,
feel free to do so.

my apologies.

Jose


> Jose
>
>
>>
>>
>> Cheers,
>>
>> Richard
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
> View/Reply Online (#196423):
> https://lists.openembedded.org/g/openembedded-core/message/196423
> Mute This Topic: https://lists.openembedded.org/mt/104628621/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f76ea706128c2138
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">A quinta, 29/02/2024, 09:35, Jose Quaresma via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;quaresma.=
jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.=
openembedded.org</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org" target=3D"_blank" rel=3D"noreferrer">ri=
chard.purdie@linuxfoundation.org</a>&gt; escreveu (quinta, 29/02/2024 =C3=
=A0(s) 08:18):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Wed, 2024-02-28 at 21:16 -0800, Khem Raj wrote:<br>
&gt; Fails to compile bunch of=C2=A0 recipes using go e.g. influxdb, crucib=
le,<br>
&gt; syzkaller in meta-oe see<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/88/=
builds/3667/steps/15/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/366=
7/steps/15/logs/stdio</a><br>
<br>
Also fails for oe-selftest:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/80/build=
s/6415/steps/14/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6415/ste=
ps/14/logs/stdio</a><br>
<br>
and on arm hosts:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/97/build=
s/7999/steps/13/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/7999/ste=
ps/13/logs/stdio</a></blockquote><div><br></div><div><br></div><div>Thanks =
for testing, I will take a look on all of this today.</div></div></div></bl=
ockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I have n=
o progress today and unfortunately I won&#39;t have time to work on this in=
 the next few days :( if anyone wants to continue with this effort, feel fr=
ee to do so.</div><div dir=3D"auto"><br></div><div dir=3D"auto">my apologie=
s.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Jose</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></di=
v><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#196423): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196423" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/196423</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104628621/505=
2612" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/104628621/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">quaresma.jose@gmail.com</a>]=
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000f76ea706128c2138--

