Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A07C7618E
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 08:26:30 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.46090.1682324780371702423
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 01:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Pb0iEsvA;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4ec816d64afso17658910e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 01:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682324778; x=1684916778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g188iWnBX/ecvkt5ICyIrAtZPdS1LsmGEaPSqXvom0E=;
        b=Pb0iEsvA/Ku45KMIQ+HypOuQNTTOH2jH5vJiDxx756K1Lgd2MZXFg/70rzQZaoll7X
         odVXAzkzIss7a/rm1JaT2b43F0acmtmvQlIH+K00dMJIYfWrG+erqyxf8El+iV/SCtse
         N5D3hMtFCAfHuM1bfyvpD/ieDERpPpgTlLGNrZ6EXhcntDko5P4DikuSvn18jia0GDGD
         o8qgkfmT+Qhr6LtT6avOCzyHd63v+yF5Y4ECRXCVOLs0aFmhqabiblKTMrgi0sHFgh4p
         Olz1pEqAUdFqDHpIVsYDLULBKDe8t/BfLkMcXxWHazcvdH3r5m/JZCygS/cOnFrRcHFF
         Xoqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682324778; x=1684916778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g188iWnBX/ecvkt5ICyIrAtZPdS1LsmGEaPSqXvom0E=;
        b=X/KPZP/M4WSIuB/MGjTSpDmhpwI3EiaVBwxirpO+O/iRAvpXgP2V0D0arbepo/xHbm
         onfRkYAG7dfnCs+Z002NqZgSPLLmMrJADoun8qbATb9ARmYAP+dHe/LU5S3somvjpN1O
         QfgHhGfx/W/9CgDdUIKAdIn5nuilvWV6Z/k88s0bhkGCSYcECXppVd9PfgvoDBlGlUFU
         5rJQ5d5zxSLP61iHrBu6ZeY5+/wRN8WDeiKP1hhq7by1KJIKr4VxRgWn88mdVGLecvIt
         YftpgRb8y3tFcsWke2OHmPWAwi1C4l01DrpCXP142lyR5AIl8UtbQfMxfOE++Ysu+yGI
         AZyg==
X-Gm-Message-State: AAQBX9eW8o5JAbtWLAfBsUZMM7kXee05d4bfBG/OZLCTBUr8RwqCl43T
	8zH076gK4oDkfLj7bVEyISQMvydHfYN8yyv67SM=
X-Google-Smtp-Source: AKy350ZNVB7BusNgy5t8NzKscrOokC/+5ma1keT4IYQLUwJpXRg0doNYOZZrgaPJUO07PF6jgPkCoG1pkD4P5Os4Odw=
X-Received: by 2002:a05:651c:231b:b0:2a8:bc78:2e3f with SMTP id
 bi27-20020a05651c231b00b002a8bc782e3fmr3014006ljb.0.1682324778418; Mon, 24
 Apr 2023 01:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1682178812.git.frederic.martinsons@gmail.com>
 <4f1ee72f98af8396292171efcf08d3db1efa44e8.1682178812.git.frederic.martinsons@gmail.com>
 <CANNYZj_LnwyRXfAMmf059n4f3Vrxht3rrqN_BTBGxtXVa1GsDQ@mail.gmail.com>
In-Reply-To: <CANNYZj_LnwyRXfAMmf059n4f3Vrxht3rrqN_BTBGxtXVa1GsDQ@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 24 Apr 2023 10:26:07 +0200
Message-ID: <CA+cAkeoiB4DcBRysUvMHgHyeN==UUCQYTf1zfi3HpsxV5GUMBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] zvariant: add ptest feature for zvariant
 test suite
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d087a605fa10c220"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 08:26:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180342

--000000000000d087a605fa10c220
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Apr 2023 at 09:47, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Sat, 22 Apr 2023 at 18:00, Frederic Martinsons
> <frederic.martinsons@gmail.com> wrote:
>
> > +# zvariant is an indermediate product for the zbus project
> > +# and so, it provided only a static lib (rlib) which fall only
> > +# in -dev package
> > +ALLOW_EMPTY:${PN} = "1"
> > +RDEPENDS:${PN}-ptest:remove = "${PN}"
>
> Only the first should be enough, why also the second? We generally try
> to avoid :remove, as issues can be usually solved in better ways.
>
> Alex
>

Ok will remove it in a V2. It seems that I had a wrong state if I must had
add this line, but I did
a "bitbake -c cleanall zvariant && bitbake core-image-sato" and I didn't
have any rootfs
issue.

--000000000000d087a605fa10c220
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 24 Apr 2023 at 09:47, Alexand=
er Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Sat, 22 Apr 2023 at 18:00, Frederic Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">fred=
eric.martinsons@gmail.com</a>&gt; wrote:<br>
<br>
&gt; +# zvariant is an indermediate product for the zbus project<br>
&gt; +# and so, it provided only a static lib (rlib) which fall only<br>
&gt; +# in -dev package<br>
&gt; +ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&gt; +RDEPENDS:${PN}-ptest:remove =3D &quot;${PN}&quot;<br>
<br>
Only the first should be enough, why also the second? We generally try<br>
to avoid :remove, as issues can be usually solved in better ways.<br>
<br>
Alex<br></blockquote><div><br></div><div>Ok will remove it in a V2. It seem=
s that I had a wrong state if I must had add this line, but I did</div><div=
>a &quot;bitbake -c cleanall zvariant &amp;&amp; bitbake core-image-sato&qu=
ot; and I didn&#39;t have any rootfs</div><div>issue.</div></div></div>

--000000000000d087a605fa10c220--

