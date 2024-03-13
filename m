Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4605C54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 20:05:08 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.5964.1710360306364655034
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 13:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=17w1LcXz;
 spf=pass (domain: smile.fr, ip: 209.85.208.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5689d96ba1cso58759a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 13:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1710360305; x=1710965105; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a6wl6J0ApJlOt57sQ8EGKgRyPWKGc1trSNB5TrhEVmE=;
        b=17w1LcXzO4q2HeMpa14sGESGWRWHfwfOk6MfN7LeElDwUfcf+D1ZHFEf9sIy0Q8eNK
         iTi052sopwSY451bp77rE4JuF/sq8HQRle4IxCPrFsruiwTkYmfz4H54p2aaI5Ba1DxL
         YGam1IXgFTuE1EMSF69vl+4Wf/y2McwWqAL/SZQjuy5tfPfJ6Ct8Ih2J7rofkVy+yDOw
         ymsb9HLa0zL83EZk+msWq1W3UVt/ha/vnQvMrHBgQ4CDXLCHhP15lAGt9KOh7FbwspWu
         C3gTvbtq3dvN6qk1uaaRQqW6ZHykzo06Ia7ZE2aKKNFNmB8f1x/N7+xaIYIkWP6BtCBS
         ipLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710360305; x=1710965105;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6wl6J0ApJlOt57sQ8EGKgRyPWKGc1trSNB5TrhEVmE=;
        b=bnVEuQXsdvRtwNHwW8GfXVEJgNvsnNYpb/FQ5g0T6NPDDstyHdR68EvxS/3kIRNdDE
         lKQgRXPRqPapFthNzSvZSzt8rMpRhexJgEY/pJLmgnDsNOw/3JkN324m4NLKrxt06P9O
         58RBIhIZ6tub9Y/xKsyLdvGN5jwPtKB4ySMZephxq+hyEjzuiafwRSPi2+bSCAsJ0yzX
         GWXBIowNcPKtOeinAJkgrh/81IPQ2Kby0rUlZZ/11CFCBIPqFnwYSpLG+t6BlTfxh3+R
         huGJwBntKJIQzFvtcjSEZLLe+F8HHKwmrPXOq6dYgfXPnxYsq83FvakPdzg0znvWLCzl
         CrRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK6pujOY/z4aEkMzyxVAYNC/8jpFb3ZUbQr3xjy/jHnIA61QY5u5XhBwF40kHgNIxVaflU++8BWW/vXA2O17j8NjI2uit8Pr/Lvx7kmKFijD3TzgeBR5Hg
X-Gm-Message-State: AOJu0YwFoY0CJrtTeblPS4JjbgxqA9TnDLWCAw997H+v1G3pqynjNVsq
	b92CwjgQHbI328eZJsxS4oz5MrNI8KEEPN5kAn7tjQpKwipnhyw/HINspeWpk8cAJ3031UVBWUk
	06uhxiCyU3s/43E81tfrFj8gRvtmAhQKvK0SgjQ==
X-Google-Smtp-Source: AGHT+IF1FlWARZ+pSW5Xh5MPr3Twg+uDoe+1EMnoFY5cqcA71y/oKVgawBctNiwVp25KxIYjXhqS9fwsWZveAynTOaI=
X-Received: by 2002:a17:906:99cf:b0:a46:511c:ffcb with SMTP id
 s15-20020a17090699cf00b00a46511cffcbmr2831052ejn.38.1710360304662; Wed, 13
 Mar 2024 13:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb-rUZzdqbXD4yoHiF5V-L2sOg1DVWMEsDGXWk36F2cexQ@mail.gmail.com>
In-Reply-To: <CAK5yBb-rUZzdqbXD4yoHiF5V-L2sOg1DVWMEsDGXWk36F2cexQ@mail.gmail.com>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Wed, 13 Mar 2024 21:04:38 +0100
Message-ID: <CAMSfU+5fTNCyTSRMkN=L4UQ83eOSBtfBXHUUhmMtUd9KEgjJYA@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 12 March 2024 (WW11)
To: Stephen Jolley <sjolley.yp.pm@gmail.com>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000065dc680613904a37"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 20:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197080

--00000000000065dc680613904a37
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mar. 12 mars 2024 =C3=A0 15:45, Stephen Jolley <sjolley.yp.pm@gmail.com>=
 a
=C3=A9crit :

>
>    -
>
>    The previously reported CVE database update issue on the autobuilder
>    has not been addressed yet. This is causing higher numbers of CVEs to =
be
>    reported on the autobuilder generated charts.
>
> Here's my proposal to fix this :

   - [PATCH 2/2] cve-update-nvd2-native: Add an age threshold for
   incremental update
   https://lists.openembedded.org/g/openembedded-core/message/197046
   - [yocto-autobuilder2][PATCH] schedulers: metrics: Start with master for
   the daily full download
   https://lists.yoctoproject.org/g/yocto/message/62754
   - [yocto-autobuilder-helper][PATCH] config.json: metrics: Switch to
   daily CVE DB full-download
   https://lists.yoctoproject.org/g/yocto/message/62753

Those 3 patches work together to (hopefully) do a daily full download of
the NVD CVE database. That should fix the metrics on master and any branch
sharing the CVE database with it.

Best regards,
--=20
Yoann Congal
Smile ECS - Tech expert

--00000000000065dc680613904a37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div dir=3D"ltr"><div><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 12 m=
ars 2024 =C3=A0=C2=A015:45, Stephen Jolley &lt;<a href=3D"mailto:sjolley.yp=
.pm@gmail.com">sjolley.yp.pm@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><span i=
d=3D"m_704423976736090797gmail-docs-internal-guid-9e798738-7fff-b5dd-f61c-6=
70e7a316e89"><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-variant-alternates:normal;vertical-align=
:baseline;white-space:pre-wrap"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-variant-alternates:normal;vertical-align:baselin=
e">The previously reported CVE database update issue on the autobuilder has=
 not been addressed yet. This is causing higher numbers of CVEs to be repor=
ted on the autobuilder generated charts.</span></p></li></ul></span></div><=
/blockquote><div>Here&#39;s my proposal to fix this : <br></div><div><ul><l=
i>[PATCH 2/2] cve-update-nvd2-native: Add an age threshold for incremental =
update <a href=3D"https://lists.openembedded.org/g/openembedded-core/messag=
e/197046">https://lists.openembedded.org/g/openembedded-core/message/197046=
</a></li><li>[yocto-autobuilder2][PATCH] schedulers: metrics: Start with ma=
ster for the daily full download <a href=3D"https://lists.yoctoproject.org/=
g/yocto/message/62754">https://lists.yoctoproject.org/g/yocto/message/62754=
</a></li><li>[yocto-autobuilder-helper][PATCH] config.json: metrics: Switch=
 to daily CVE DB full-download <a href=3D"https://lists.yoctoproject.org/g/=
yocto/message/62753">https://lists.yoctoproject.org/g/yocto/message/62753</=
a></li></ul></div><div>Those 3 patches work together to (hopefully) do a da=
ily full download of the NVD CVE database. That should fix the metrics on m=
aster and any branch sharing the CVE database with it.</div><div><br></div>=
<div>Best regards,</div><div><span class=3D"gmail_signature_prefix">-- </sp=
an><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><font fa=
ce=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"Raleway, regu=
lar">Smile ECS - Tech expert<br></font></div></div></div></div></div></div>=
</div></div>

--00000000000065dc680613904a37--

