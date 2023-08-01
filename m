Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AEAC0015E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 13:04:40 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.12327.1690895078791366957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 06:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fhxd1g12;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-307d20548adso5029778f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 06:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690895077; x=1691499877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fkETFJKHx4jmzQUm67le24vj7CZYBtUihh0768ErAgs=;
        b=fhxd1g12YVWUu3+dGNE1ZiaphvvxNF70nzOQyO6NZqQUJm4BfkT1MbO3KB2cIWtmd5
         sddlVovo/9vHe/GvYjJLuSDUQzImfeBL6yuL2N9lrwccD4bS7ksKdcQbuOkEsQyu2Uwe
         Z1p1yiHDhAurhyIHrVyD8gH26RAKxXeKGzC1dwcxP+O+SSzsJJeT4Zie2TNqah49KA3m
         yE4pbIKfuzooPb8WRQHWjBM9y9ZQO8q3zkF8JSsQdgkGKEa35CWQmztbC5Thyf6K5vhy
         t7/PSxFTNT15x9alg3+jrjWrqrUDSrnVRFtij3SdSQWdu9urJvPKc8yExtEF6L6p+DP6
         v31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690895077; x=1691499877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkETFJKHx4jmzQUm67le24vj7CZYBtUihh0768ErAgs=;
        b=PkzEl44tSH7oBurp5de3d2mnsCjlzKVLjilrazzaEVjtdhoXM8fwzrd0GUaOSCrNsK
         TBkrTOpZUrJgEB9wil1B+81PsgPxIGck16GCZII1tpazieM5UVtSBeR65nZJqvr2+IE6
         swo9a6JUOi7Q4sl4wmv/lVD5b5GwOWEC4a+EzABBn+fHgzZhRpSFsgK5qryFEn5Hgjov
         KLhqkuo03TtC3S2xG79M/SFygItyGt5nKSdv+/jriT80R2QRP3CLjNSH0O+SlL9bcvzY
         2d8y0JekAXtEv4w1EntmmdCTKxthDMMC1XyMYb5gJZd0kwUWVCUe7M+GkbHBp6fae706
         9dfA==
X-Gm-Message-State: ABy/qLa1llOxK3EZ6G5BNVDQOE9xSFbHKcOj+AAkNtFz8XfHH5Yk0SJs
	+4pBYLzWhIv5k5jnmr6oZr+2sb5+J1AFh5ArKG4=
X-Google-Smtp-Source: APBJJlEqowM7hdbS6Da91RU2ZZVmi8Y7Si4Lh+k2PVPe0sHLEW8K2D0+fJYHoORxEWgWkgUAxI4HaK36YymJEpOYd+E=
X-Received: by 2002:a05:6000:1cc4:b0:315:a043:5e0a with SMTP id
 bf4-20020a0560001cc400b00315a0435e0amr2259145wrb.56.1690895076860; Tue, 01
 Aug 2023 06:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230726092228.1005306-1-p.lobacz@welotec.com>
 <VI1PR04MB5373AD2BB745671859678D699100A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <20230727141809d2150cbd@mail.local> <17762A3A069807A3.31298@lists.openembedded.org>
 <VI1PR04MB537349F74CD4C3E13B272B879105A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <VI1PR04MB5373AB9F0C887CF659E739439105A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <CAJdd5GYifrOT_9-fct6TT95sw6tDe0L7etLxOcaEgTTGvWFPJg@mail.gmail.com>
 <972083f47f3513fada3dc64c233f2c229f952aca.camel@linuxfoundation.org>
 <177710C9CE043B33.12785@lists.openembedded.org> <AM6PR04MB5368B2FF63E716221B740A029105A@AM6PR04MB5368.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB5368B2FF63E716221B740A029105A@AM6PR04MB5368.eurprd04.prod.outlook.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 1 Aug 2023 15:04:22 +0200
Message-ID: <CA+chaQfRM855mvJwnxvUKk_JpXq51AS7uXuqM0qv=Uayj4OQNg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
To: =?UTF-8?Q?Piotr_=C5=81obacz?= <p.lobacz@welotec.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Joshua Watt <JPEWhacker@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alex Stewart <alex.stewart@ni.com>
Content-Type: multipart/alternative; boundary="00000000000068a6c80601dc307d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 13:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185243

--00000000000068a6c80601dc307d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just FYI:

Not sure if it's still relevant, but last time I was comparing some posix
archives from different host OSes there were some differences other than
timestamps I believe, this was 2.5 years ago showing differences between
tar 1.29 on ubuntu 18.04 and 1.33 on tumbleweed:

https://git.openembedded.org/openembedded-core/commit/?id=3D3ecea58f2a3382d=
9f4b410d6ad7089111334cb6f

Cheers,

On Mon, Jul 31, 2023 at 11:28=E2=80=AFPM Piotr =C5=81obacz <p.lobacz@welote=
c.com> wrote:

>
>
> > I'd guess you need to make the sstate archives of do_package store the
> > acl and extended attribute data and when that is done, the millisecond
> > timestamp data will probably be saved too? I'm not sure this is going
> > to be a generally useful thing in the general case though and zeroing
> > the millisecond portion would really be easier in general if we could.
> > Certainly, SOURCE_DATE_EPOCH doesn't have millisecond precision.
>
> This is what we were talking about on tar mailing list, to remove this
> precision for posix format.
> Additionally in case of acl and extended attribute data they need to be
> also added to this sstate
> archives, which still means that it needs to be extended with posix forma=
t.
>
> BR
> Piotr
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185173):
> https://lists.openembedded.org/g/openembedded-core/message/185173
> Mute This Topic: https://lists.openembedded.org/mt/100471398/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000068a6c80601dc307d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just FYI:<div><br></div><div>Not sure if it&#39;s still re=
levant, but last time I was comparing some posix archives from different ho=
st OSes there were some differences other than timestamps I believe, this w=
as 2.5 years ago showing differences between tar=C2=A01.29 on ubuntu 18.04 =
and=C2=A01.33 on=C2=A0tumbleweed:<div><br><div><a href=3D"https://git.opene=
mbedded.org/openembedded-core/commit/?id=3D3ecea58f2a3382d9f4b410d6ad708911=
1334cb6f">https://git.openembedded.org/openembedded-core/commit/?id=3D3ecea=
58f2a3382d9f4b410d6ad7089111334cb6f</a><br></div></div></div><div><br></div=
><div>Cheers,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Mon, Jul 31, 2023 at 11:28=E2=80=AFPM Piotr =C5=81oba=
cz &lt;<a href=3D"mailto:p.lobacz@welotec.com">p.lobacz@welotec.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; I&#39;d guess you need to make the sstate archives of do_package store=
 the<br>
&gt; acl and extended attribute data and when that is done, the millisecond=
<br>
&gt; timestamp data will probably be saved too? I&#39;m not sure this is go=
ing<br>
&gt; to be a generally useful thing in the general case though and zeroing<=
br>
&gt; the millisecond portion would really be easier in general if we could.=
<br>
&gt; Certainly, SOURCE_DATE_EPOCH doesn&#39;t have millisecond precision.<b=
r>
<br>
This is what we were talking about on tar mailing list, to remove this prec=
ision for posix format.<br>
Additionally in case of acl and extended attribute data they need to be als=
o added to this sstate<br>
archives, which still means that it needs to be extended with posix format.=
<br>
<br>
BR<br>
Piotr<br>
<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#185173): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/185173" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/185173</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100471398/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100471398/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000068a6c80601dc307d--

