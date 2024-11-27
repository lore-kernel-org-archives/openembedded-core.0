Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7FFD6ACD5
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 13:51:40 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.72047.1732715494470551708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 05:51:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V/X4KB2T;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6d4531d1309so37472436d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 05:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732715493; x=1733320293; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JPSh23gdbarfXnLi+RdEOkXSZ6MNCSl/QIk07exvc7I=;
        b=V/X4KB2TX1uGuH5cg68zCQtiHpVkMbzssFpiWQ4OfEmNeAFvEC7upuudnBGQ31viDs
         TNvAO4/xagV3FZQcJ4CisnRWhhiRWbBIny7AtUo8ef5Z1C5BO+ROGgfZRxNGxtrWCfPl
         9Wthf+bogTTNaOcDL/CfWlMD+O0JPlUKnQtw8v848waUX+wOcWZ1hcP5A267fgXmE5PN
         X19Zd/qvAobfgN9DyKZQc2wnfsuQfIE8gfwHgiDU7jEqnX/Bb729dL4dXzWpx3Vu8NQf
         bye2zgx7iWeV7PBruwNQ/2WnYmhYBiAy1lpI5acwEc0qwaNRozFuXikV39TIUNadEATY
         uccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732715493; x=1733320293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPSh23gdbarfXnLi+RdEOkXSZ6MNCSl/QIk07exvc7I=;
        b=v9pwiMXFplpQZJF7ISL89ys/pbCO0hw4gyN707PMi5BLW+W4Zmail6fhHrSn6BUttz
         0XAGvUoNcyZiRJD3P8Peq+40pCbO7rA1N9fqS4AYEMx/ZUMXhpgm74t5sHy5K7q22sU5
         BwL0eypRLnux2/r5DQkCvVtbBpz5MIlT22Uos7ORr/5xhnpJT/VkRYxtV4H3J+gmHgN+
         xov1BbDFettzF9/zG7/HZU2hk6UUr5Sp326Y31iLEo3g03fA5f/XEMy4Z2vhwdScDMb3
         /VV0usf6SmNM/Ws2DZl0xv6jIV8Md3C+UIwEddnMo34TDHTJ85UI1HP6d6wct/YJRTJO
         EbtA==
X-Forwarded-Encrypted: i=1; AJvYcCWMTU0wsO0e/omDVFoW1kmiX6ySSu78eQhwNViFnWdWDBUn5GDBgmH1oroy1NDCkkQvsF5WbvpYJ9aMGGT44uxVyQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxdfCZuAKTGQpB3PHkC8ntq2G2LE4fOlsOqSH5BiCG0zsCu6Ms1
	X9TKi3u70+u44qS+5bPM9aBZMJf+NTSAuhG+O5AAWMYhlrwhcjXt6cFeLzhO3ukb+z15SWieabK
	IL44OFCrby1xsWU0QGCEiJLCUU3s=
X-Gm-Gg: ASbGncvAp+A5t2cUSJYJ2FpkfI3iLSwTYWXgQjBHfO446HgGlJU7GbpnsfzgRJZjSQF
	Nhe60zxU05c//RbufkMIsNtZ13HP1rdnksLrXIMjAE7461Vk9k8tfsylbjnEDS53Wfg==
X-Google-Smtp-Source: AGHT+IEQYpXDEQURQd7+nYK1zpX59Dx0h+DzDp9Tvq9KB4SE9u3/HizInwcyGQKcRH6PkTqirUAo2XAY/DTFZusR9Zs=
X-Received: by 2002:a05:6214:1d29:b0:6d4:ca5:7c05 with SMTP id
 6a1803df08f44-6d864d06ce3mr34968096d6.8.1732715493526; Wed, 27 Nov 2024
 05:51:33 -0800 (PST)
MIME-Version: 1.0
References: <20241022081140.1464860-1-thakur.virendra1810@gmail.com>
 <CANNYZj8VR90wUtudX4FiA-teKaJFrkgK_hohmb2o6iNXeGL96w@mail.gmail.com>
 <MA0PR01MB9355C27D944D288DF19DEE389D202@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
 <CANNYZj9n-DiX3WfUJTqa=s_iKAfLSuNJZ7QuD6+H+PW9_m3ZrQ@mail.gmail.com>
 <MA0PR01MB935507E141ADD1CD9E3A28839D202@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
 <CANNYZj-qHdsNbqKy7bCNn4jx4T5Hc37qdZqgHHWeu5OCzTAi6A@mail.gmail.com>
 <MA0PR01MB93553EC00CC06C983FA1BCF19D232@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
 <CANNYZj_1jNg5tFdpx4Zo4ZMLF_KWWjj60f2YZQeWjAtjaDtiJA@mail.gmail.com>
 <MA0PR01MB9355C978E83C2F793FA49D539D232@MA0PR01MB9355.INDPRD01.PROD.OUTLOOK.COM>
 <CANNYZj_gaDoHSsDKaQajaJxqQU6ug7=MVrCY0_Fp_k7dHiAvEA@mail.gmail.com> <PN2PPF882B3C2CA099C2B8D534947AB18D69D282@PN2PPF882B3C2CA.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN2PPF882B3C2CA099C2B8D534947AB18D69D282@PN2PPF882B3C2CA.INDPRD01.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Nov 2024 14:51:21 +0100
Message-ID: <CANNYZj__T0GwCbu4v=37q-n2d1shSyY6xjBzqYzfuCZE9u-_QA@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH] libyaml: Add libyaml ptest
To: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
Cc: "thakur.virendra1810@gmail.com" <thakur.virendra1810@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"wangmy@fujitsu.com" <wangmy@fujitsu.com>
Content-Type: multipart/alternative; boundary="0000000000007d142a0627e54347"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 13:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207931

--0000000000007d142a0627e54347
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Nov 2024 at 14:39, Virendra Kumar Thakur <
Virendra.Thakur@kpit.com> wrote:

> Test which I have added is addressing our purpose.
> Not working on this topic now. I will work on your suggestion If i will
> get some time.
>

The problem is that the test adds custom test data that isn't possible to
independently recreate (as the only information about it is that it was
'created by using examples'). This makes it very difficult to do later
adjustments to that data when needed (e.g. when upstream changes the tests
that start causing failures with the data).

On the other hand, upstream does provide official test data, and that's
what we should be using.

For this reason I cannot accept the implementation as it is.

Alex

--0000000000007d142a0627e54347
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 27 Nov 2024 at 14:39, Virendra Kumar Thakur &lt;<a href=3D"m=
ailto:Virendra.Thakur@kpit.com">Virendra.Thakur@kpit.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-2=
109861168259667368">




<div dir=3D"ltr"><div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Test which I have added is addressing our purpose.=C2=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Not working on this topic now. I will work on your suggestion If i will get=
 some time.=C2=A0=C2=A0</div></div></div></blockquote></div><div class=3D"g=
mail_quote"><br></div><div class=3D"gmail_quote">The problem is that the te=
st adds custom test data that isn&#39;t possible to independently recreate =
(as the only information about it is that it was &#39;created by using exam=
ples&#39;). This makes it very difficult to do later adjustments to that da=
ta when needed (e.g. when upstream changes the tests that start causing fai=
lures with the data). <br></div><div class=3D"gmail_quote"><br></div><div c=
lass=3D"gmail_quote">On the other hand, upstream does provide official test=
 data, and that&#39;s what we should be using.<br></div><div class=3D"gmail=
_quote"><br></div><div class=3D"gmail_quote">For this reason I cannot accep=
t the implementation as it is.</div><div class=3D"gmail_quote"><br></div><d=
iv class=3D"gmail_quote">Alex<br></div></div>

--0000000000007d142a0627e54347--

