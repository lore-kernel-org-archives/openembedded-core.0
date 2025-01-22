Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D32C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 08:28:49 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.38555.1737534528622756739
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 00:28:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bNaRfXdw;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d896be3992so47490216d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 00:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737534527; x=1738139327; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yegYqASMxlf30UlLIgTktiCcC8AFG17kFs5/g/KKGkI=;
        b=bNaRfXdwjWlxG6Wf0skYbBOOYvW3ZJ0S04aFNoiOBdb/xa6FbcNcxDmF3KZemnthp0
         4N4bh9304WdzRKbHkXLmhfUV2nvEGKiax/hUzJkkGQnQ99TFhLPx654EvSgDGM/pDQ1Q
         /x1/npUr0RFmRnFhDxEfTX65Hv0HGFAJctLS4UELVSDb/QbowrkC3OsJ0ruXTqArxR7S
         HO43sFQ7lJ6JPFhQIpiyIgoXdcLxDc5WTrW+g0138W/2odr64Mj/2uIEajw4i06bR9rd
         1FHM07moi6xnZWZ9xpAJmkZAJQ1KluqtPP0sprqlMb43acDUEncDLIyr+moag4j18WbS
         UIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737534527; x=1738139327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yegYqASMxlf30UlLIgTktiCcC8AFG17kFs5/g/KKGkI=;
        b=szS4piiQ7LkaMZEHWXLXTI32DIIWMNVYx4I+Uy8yLF0UAdTYeAhz3VDKOGw3pScvOo
         tZ+mMcFW65wrOOelcP41K9ri2WxNJtEBy/u3nbYrjFvcWWet48JBMwwfxJmiEVJV0Wlq
         yqscxHJncUao25ennydhLXMiXAShTjR3niYvvYIaQiaZ4rm11UBrNFXJnLvfMhysVsbY
         ngPUMt06Y8PiZ3cMWDLu9MAORUpd+IyutT2skmN1p9e/khm4sohOf+rndSNfM740qIAG
         f9m+02tYFwzmivoI49Fi/8gNVJd1obVRGaWEeManqIw/8XLZzq1GYqwXumRfaABlrofX
         5Trw==
X-Forwarded-Encrypted: i=1; AJvYcCUPntSrr1HPrdcN61owcl1rUldgnfJMhUsNa7gUz+zsnat1+rj5ei0SyDxhsLENdiKL6lHNHiweDd2A6LElf9vv6w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx1try88jkgXi1j8FA42znPbfp3gPqtdlYyMngrZ5DpuyUsHcvl
	Z83mDW9dApKIScaoCR1xD1MLc4wENcUxjsMWEBUJENDzfnjo757DMBCu+632v06YIWlfKV7y0oo
	4awtvh8IqIhnXK6lDsF+oBjgzumbeuA==
X-Gm-Gg: ASbGncudS2iRWVHbh08Bc0j80XsHK0lhNzQi/YprW4JAtqPDfr9niZCzTdJM5yR2S85
	Cz4tpXFH1UV/B/5a38QwD+EUTIo9SmSKJZkbl3rBabJJO7LB7gvggZIemi1ZZ56KdIvjL4KtKfI
	0VZsU6
X-Google-Smtp-Source: AGHT+IFom9o2RU2I2v04/RBoNmTcn7GjACjMdDBeB7XSJ1LSGwKxn4FXC1ZexlBR9CsQkQrehqU5XLo8LnYN8pbzw1o=
X-Received: by 2002:a05:6214:328e:b0:6d8:9a85:5b3d with SMTP id
 6a1803df08f44-6e1b2168b18mr356669856d6.7.1737534527022; Wed, 22 Jan 2025
 00:28:47 -0800 (PST)
MIME-Version: 1.0
References: <1736986779-18213-1-git-send-email-wangmy@fujitsu.com>
 <B0D54F55-821C-42B5-8EF6-285E7055A9D8@arm.com> <CANNYZj8Lbz7s6JeQzrXu=MCbyQ5bC6RZcyLYLMc6MyHvcXLc6g@mail.gmail.com>
 <TYWPR01MB118610AE7185CEB27A28AFD98DCE12@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB118610AE7185CEB27A28AFD98DCE12@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Jan 2025 09:28:36 +0100
X-Gm-Features: AbW1kvaLTENwgntk_SBFloea2A88p-zFhBW7bFv6znaKhISWm6bO5dPHDx-wck4
Message-ID: <CANNYZj_zmLZnyPPKoRs5GdUe4sS_Uw7dtgET39=r7g12-3UF8A@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [PATCH v3] ncurses: Fix install conflict when
 enable multilib.
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: "ross.burton@arm.com" <ross.burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
Content-Type: multipart/alternative; boundary="00000000000044acb1062c4748cd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 08:28:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210139

--00000000000044acb1062c4748cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please remember to include the links to upstream discussions into commit
messages. This always helps when at some point in the future someone would
need to understand the issue, do additional fixing or other follow up work.

If it=E2=80=99s on the mailing list, those typically have web based archive=
s with
stable links to individual messages.

Alex

On Wed 22. Jan 2025 at 1.17, Mingyu Wang (Fujitsu) <wangmy@fujitsu.com>
wrote:

> This issue has been raised to the upstream, who stated that in addition t=
o
> linux-gnueabi, there are many other types that need to be matched, so the=
y
> have included the modifications in the to-do list.
>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
> No.6 Wenzhu Road, Nanjing, 210012, China
> TEL=EF=BC=9A+86+25-86630566--8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
>
> > -----Original Message-----
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Sent: Tuesday, January 21, 2025 11:40 PM
> > To: ross.burton@arm.com
> > Cc: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>;
> > openembedded-core@lists.openembedded.org; Lei, Maohui/=E9=9B=B7 =E8=8C=
=82=E6=85=A7
> > <leimaohui@fujitsu.com>
> > Subject: Re: [PATCH] [OE-core] [PATCH v3] ncurses: Fix install conflict
> when
> > enable multilib.
> >
> > On Tue, 21 Jan 2025 at 16:31, Ross Burton via lists.openembedded.org
> > <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> > > > The host_os when enable multilib is as folloing:
> > > > host_os of aarch64 : linux-gnu
> > > > host_os of aarch32 : linux-gnueabi
> > >
> > > Seems like the proper fix would be to change the glob to *linux-gnu*
> (and sent
> > that upstream first, obviously)?
> >
> > This is an outcome of my review; in the end of it I had asked to send
> that proper
> > fix upstream, but provide the oe-core fix as a tweak to configure flags=
.
> Basically
> > because we don't know if upstream will take the proper fix.
> >
> > What would help is to include the link to that upstream submission into
> this
> > commit message.
> >
> > Alex
>

--00000000000044acb1062c4748cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please remember to include the links to upstream discussi=
ons into commit messages. This always helps when at some point in the futur=
e someone would need to understand the issue, do additional fixing or other=
 follow up work.</div><div dir=3D"auto"><br></div><div dir=3D"auto">If it=
=E2=80=99s on the mailing list, those typically have web based archives wit=
h stable links to individual messages.</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Alex=C2=A0</div><div><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 22. Jan 2025 at =
1.17, Mingyu Wang (Fujitsu) &lt;<a href=3D"mailto:wangmy@fujitsu.com">wangm=
y@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:soli=
d;padding-left:1ex;border-left-color:rgb(204,204,204)">This issue has been =
raised to the upstream, who stated that in addition to linux-gnueabi, there=
 are many other types that need to be matched, so they have included the mo=
difications in the to-do list.<br>
<br>
=C2=A0 --<br>
Best Regards<br>
---------------------------------------------------<br>
Wang Mingyu<br>
FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)<br>
No.6 Wenzhu Road, Nanjing, 210012, China<br>
TEL=EF=BC=9A+86+25-86630566--8568<br>
COINS: 79988548<br>
FAX: +86+25-83317685<br>
MAIL: <a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujits=
u.com</a><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; Sent: Tuesday, January 21, 2025 11:40 PM<br>
&gt; To: <a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burt=
on@arm.com</a><br>
&gt; Cc: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C &lt;<a href=3D"mailto:wa=
ngmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;;<br>
&gt; <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"=
_blank">openembedded-core@lists.openembedded.org</a>; Lei, Maohui/=E9=9B=B7=
 =E8=8C=82=E6=85=A7<br>
&gt; &lt;<a href=3D"mailto:leimaohui@fujitsu.com" target=3D"_blank">leimaoh=
ui@fujitsu.com</a>&gt;<br>
&gt; Subject: Re: [PATCH] [OE-core] [PATCH v3] ncurses: Fix install conflic=
t when<br>
&gt; enable multilib.<br>
&gt; <br>
&gt; On Tue, 21 Jan 2025 at 16:31, Ross Burton via <a href=3D"http://lists.=
openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.o=
rg</a><br>
&gt; &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org" ta=
rget=3D"_blank">arm.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; &gt; The host_os when enable multilib is as folloing:<br>
&gt; &gt; &gt; host_os of aarch64 : linux-gnu<br>
&gt; &gt; &gt; host_os of aarch32 : linux-gnueabi<br>
&gt; &gt;<br>
&gt; &gt; Seems like the proper fix would be to change the glob to *linux-g=
nu* (and sent<br>
&gt; that upstream first, obviously)?<br>
&gt; <br>
&gt; This is an outcome of my review; in the end of it I had asked to send =
that proper<br>
&gt; fix upstream, but provide the oe-core fix as a tweak to configure flag=
s. Basically<br>
&gt; because we don&#39;t know if upstream will take the proper fix.<br>
&gt; <br>
&gt; What would help is to include the link to that upstream submission int=
o this<br>
&gt; commit message.<br>
&gt; <br>
&gt; Alex<br>
</blockquote></div></div>

--00000000000044acb1062c4748cd--

