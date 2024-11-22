Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2BDD75E39
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 12:43:35 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.23084.1732279410884168591
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 04:43:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mOapt6uY;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6d41f721047so13636926d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 04:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732279410; x=1732884210; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1uq3Dzi0zA7oZyDjq4GCMvgbKdSupnm6J2vLTqjWPDg=;
        b=mOapt6uYktHWTn1+pDCxkPWlbWrgYbApEF0WbmJeO9Y4BJSO1PlFC9w397Ojdt6PS1
         cI5iW8k7tkv9Jg254TMnSEO19kBl3xTzslRFDqizWXLxdJWzkWxjx/MqjfrJ1Rzfx7fc
         ydqb+Rs108srj23RSEQgG8XhM0jF1prnBVU1Fx4rLBIkvd56fpa5kOnIbvWtnJhNFnbr
         W1N9/RwZSuv8SXlwDRHQVJ/I4CUCP6HCcai//uFk18oftF8YRsWY7Q2AZ9R/TY0/C8dK
         4xxveaf6b+X+VeKHH43rB6k8wXG6fZnSQwqe8sSyqoTzQ4vZDmexB16ZkljwNopoaBdv
         8RUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732279410; x=1732884210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uq3Dzi0zA7oZyDjq4GCMvgbKdSupnm6J2vLTqjWPDg=;
        b=AYbhlBm+0vRQSx4uu28zdgA/+zbm1BnfkKjUYYOakRS7761FNB7/f3UVt7uLkjDedN
         tdPeka8K9XIX73NgRKBWnhL+Vprrqes9J3+bv10/ZnZZke4AFcEJ5j4CVlYvvs+tub/C
         N0zVEIwtR47/e+Ppx/+NDaAeosgNl1/93fMBigxj7SzYMpyBOZpzFv+4OZmJKaoosmKN
         CqavdxTVYSf9AgW52OlJrcdydJUk65mMkGze84pPYiB7zGpdOSXHQZUt1RndG4WhGRva
         Q8gq85bZRCLB9ktcr8v8zr2IzICQQtKdvS1URbakFTCemoP91lA/GHwOJS9Qn2kC3Mov
         qYqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSM9AhTLEMFSND2qJsJ32A9hXLb6L/E3VckiDjmcZgmc/bQVm/MsZ5wm3CnLg2gQoFAjf4yGRC2k1W9R31yxiDag==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzxgkFQVGuKJihSWoR8A/U00qzS1ss3oHQJVIbOjPfKhhi/BZyc
	jEpiMdBn4H8OwZrDghv/7LibLwPoiFA/U8jIib6cypWQfDoPHr3OGyKQSSkFOzjJ/wyQm47+/b2
	7cwPpFyH0QmaC3+O4vr4Ihl5GABQ=
X-Gm-Gg: ASbGncvfK4QuYQ2tKC5EJLLmHlv9PXlH18enek1aCmwRP6HJaoNhn7dzdCGUKLm91LL
	ciXcSub+6Ozz/oyUViH2i2DXgBsb0oPRVDWgafNuUEOeKJ5zbntlrW2JIBh1rezSJtw==
X-Google-Smtp-Source: AGHT+IFdFA5CrWh5zOqnaXjB4F9mNZqz5T4KIswHk4npE7ZUGlgUioIYXtbzs+70NCJ+oqESq2UuawLNWGEGyVyxSTE=
X-Received: by 2002:a05:6214:629:b0:6ce:26d0:c7af with SMTP id
 6a1803df08f44-6d451343dd1mr33201766d6.31.1732279409839; Fri, 22 Nov 2024
 04:43:29 -0800 (PST)
MIME-Version: 1.0
References: <20241022081140.1464860-1-thakur.virendra1810@gmail.com>
 <CANNYZj8VR90wUtudX4FiA-teKaJFrkgK_hohmb2o6iNXeGL96w@mail.gmail.com>
 <MA0PR01MB9355C27D944D288DF19DEE389D202@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
 <CANNYZj9n-DiX3WfUJTqa=s_iKAfLSuNJZ7QuD6+H+PW9_m3ZrQ@mail.gmail.com>
 <MA0PR01MB935507E141ADD1CD9E3A28839D202@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
 <CANNYZj-qHdsNbqKy7bCNn4jx4T5Hc37qdZqgHHWeu5OCzTAi6A@mail.gmail.com> <MA0PR01MB93553EC00CC06C983FA1BCF19D232@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA0PR01MB93553EC00CC06C983FA1BCF19D232@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 22 Nov 2024 13:43:18 +0100
Message-ID: <CANNYZj_1jNg5tFdpx4Zo4ZMLF_KWWjj60f2YZQeWjAtjaDtiJA@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH] libyaml: Add libyaml ptest
To: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
Cc: "thakur.virendra1810@gmail.com" <thakur.virendra1810@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"wangmy@fujitsu.com" <wangmy@fujitsu.com>
Content-Type: multipart/alternative; boundary="000000000000e01a7006277fba64"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 12:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207611

--000000000000e01a7006277fba64
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Nov 2024 at 13:38, Virendra Kumar Thakur <
Virendra.Thakur@kpit.com> wrote:

> It fails due to libyaml source is from downloaded from dowload directory
> mentioned below as a tar , its not git repo.
> In yocto libyaml SRC is from : SRC_URI = "
> https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
>
> Due to this it fail to fetch code from git repo.
>

For the sake of experiment, perhaps you can try again with a git checkout
to 0.2.5 tag from here?

https://github.com/yaml/libyaml


Alex

--000000000000e01a7006277fba64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 22 Nov 2024 at 13:38, Virendra Kumar Thakur &lt;<a href=3D"m=
ailto:Virendra.Thakur@kpit.com">Virendra.Thakur@kpit.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-1=
466832740147182391">




<div dir=3D"ltr"><div id=3D"m_-1466832740147182391Signature"><div style=3D"=
font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,=
sans-serif;font-size:12pt;color:rgb(0,0,0)">
It fails due to libyaml source is from downloaded from dowload directory me=
ntioned below as a tar , its not git repo.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
In yocto libyaml SRC is from : SRC_URI =3D <span style=3D"background-color:=
rgb(255,255,0)">
&quot;<a href=3D"https://pyyaml.org/download/libyaml/yaml-$%7BPV%7D.tar.gz"=
 target=3D"_blank">https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz</a=
>&quot;</span><br>
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Due to this it fail to fetch code from git repo.=C2=A0</div></div></div></d=
iv></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"gm=
ail_quote">For the sake of experiment, perhaps you can try again with a git=
 checkout to 0.2.5 tag from here? <br></div><div class=3D"gmail_quote"><br>=
</div><div class=3D"gmail_quote"><a href=3D"https://github.com/yaml/libyaml=
">https://github.com/yaml/libyaml</a></div><div class=3D"gmail_quote"><br><=
/div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<b=
r></div></div>

--000000000000e01a7006277fba64--

