Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE995C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 13:17:29 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web09.5325.1668431839003308960
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 05:17:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Kxpi0NIx;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id u11so13088246ljk.6
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 05:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fx25CuAXPJoy7lPmwC+CraY47Kko2pNxAJURZU8tEfU=;
        b=Kxpi0NIxHsbe2j2YMbYfknB59ldQjlNS58duY/8xyDeom7ERd2xrN5+XBHqpvAz5DB
         kBzjT4064Vjvk57kEpJn0u43/WhLGG0PNHKkNOMetZM+80dhQEsqcb2l1kq4+b3Iw0pv
         p2kuqBNvOFD4JPfOc8br/1irM5C567EZpiTNklU26BPJaDGO7ztKlsdS550bYjy0pW06
         GulT4dLQ+RFO0RNi7S2cLjXVYNiaQwl90qnWegfGp1VO3K1VYGQkQwQF+yfngztDpVlS
         8wjXBGgSI8bNvKZkcK6cp9iibIQlYsDqo9FBzsXn275O+7BuzuI9TT3pZYofGuFJnXp9
         +QTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fx25CuAXPJoy7lPmwC+CraY47Kko2pNxAJURZU8tEfU=;
        b=N4A+mpJ9O1P2nguVoHWCdYboYQ7GODgLFHjqxdU3Z3PPj+6DG3I307jRZI/9a7vJ6+
         Y3dfyDtZVdnkCaGt6//gNX5lKZPT8iBCaljKlVJJ+x8vfK+/B/ycRTixKvcjhy+MInqc
         wXzpJjberoInJb3DQRu1uWiq5hNLkV0Vim7FVk6zXZqQ3qb34Y7N8igZ9wYLRuNcItQF
         Yh8TbPTwFT2LP2Yk+UB12Y3IlRYHBwRIES2CKdC0xR3bpiGg74Z1rGdlAcU3cA3Gxltt
         vEbm7Rn92LP3PqXyk4K1/EMpWdIXc5FlwYFvQ3EHT6TgVcFs0iWcWrBpCIRe+C6zgIha
         o2ag==
X-Gm-Message-State: ANoB5pkTFXUfFzpxmq+LhrwdU8clSLgt8DyjfcdQ53Pi5wpZAeT4GUMn
	J1JHvKLQ1QpADT1JxgIdfza80kOaDAfn0AoEdwQ=
X-Google-Smtp-Source: AA0mqf5FyHFpo7ve9plZuaycXEZxhU+TMl1JtMb689B+ZwQAicBskWR2Rnqwzcdhzw4sB1zkpobnZq6QJYnjjkLmfq4=
X-Received: by 2002:a2e:8081:0:b0:277:1273:f3b8 with SMTP id
 i1-20020a2e8081000000b002771273f3b8mr3853592ljg.178.1668431837176; Mon, 14
 Nov 2022 05:17:17 -0800 (PST)
MIME-Version: 1.0
References: <20221014152245.243292-1-jose.quaresma@foundries.io>
 <171DF8E2F2B472D4.2422@lists.openembedded.org> <CANPvuRntRt1e33kujzgs_=K_FSoOOj0N7KCKkyoiyrSynDJc9w@mail.gmail.com>
 <bc610ce45417a57c2212c3fd20a61e57189765bb.camel@linuxfoundation.org> <1723BFAED82D2E62.15522@lists.openembedded.org>
In-Reply-To: <1723BFAED82D2E62.15522@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 14 Nov 2022 13:17:05 +0000
Message-ID: <CANPvuRmUm8T2XukmmRDgg0NU0bmhktKWA_6tQfASkVmj1N+_Dw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 2/2] archiver: avoid using machine variable as
 it breaks multiconfig
To: quaresma.jose@gmail.com, Steve Sakoman <steve@sakoman.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, ricardo@foundries.io, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000fca87d05ed6e0e5f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 13:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173238

--000000000000fca87d05ed6e0e5f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Can this patch be backported to kirkstone?

Jose

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia quarta, 2/11/2022 =C3=A0(=
s)
11:04:

>
>
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> quarta, 2/11/2022 =C3=A0(s) 10:55:
>
>> On Wed, 2022-11-02 at 09:42 +0000, Jose Quaresma wrote:
>> > Are there any issues with this patch or the oe-selftest in the
>> > previous one that I need to address?
>>
>> When I was reviewing the patches that were queued while I was away,
>> this one wasn't one I could immediately look at and make a decision on.
>> It was therefore deferred for me to spend a bit more time on. I'm
>> trying to get there!
>>
>
> Thanks for the update.
> I decided to ask now because I saw that the master branch has started the
> integration again.
> If anything is needed from me please let me know.
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
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172584):
> https://lists.openembedded.org/g/openembedded-core/message/172584
> Mute This Topic: https://lists.openembedded.org/mt/94730390/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000fca87d05ed6e0e5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Steve,<br><br>Can this patch be backported to kirk=
stone?<br><br>Jose</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">Jose Quaresma via <a href=3D"http://lists.openembedded.or=
g" target=3D"_blank">lists.openembedded.org</a> &lt;quaresma.jose=3D<a href=
=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@li=
sts.openembedded.org</a>&gt; escreveu no dia quarta, 2/11/2022 =C3=A0(s) 11=
:04:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:richard.pur=
die@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.o=
rg</a>&gt; escreveu no dia quarta, 2/11/2022 =C3=A0(s) 10:55:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2022-11-02 at 09:42 +=
0000, Jose Quaresma wrote:<br>
&gt; Are there any issues with this patch or the=C2=A0oe-selftest in the<br=
>
&gt; previous one that=C2=A0I need to address?<br>
<br>
When I was reviewing the patches that were queued while I was away,<br>
this one wasn&#39;t one I could immediately look at and make a decision on.=
<br>
It was therefore deferred for me to spend a bit more time on. I&#39;m<br>
trying to get there!<br></blockquote><div><br>Thanks for the update.<br>I d=
ecided to ask now because I saw that the master branch has started the inte=
gration again.</div><div>If anything is needed from me please let me know.<=
br><br>Jose<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172584): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172584" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172584</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94730390/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94730390/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div>

--000000000000fca87d05ed6e0e5f--

