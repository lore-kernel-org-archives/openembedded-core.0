Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55018E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 14:14:45 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.11820.1733926476237231400
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 06:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jQm/IIEj;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21654fdd5daso30702265ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 06:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733926476; x=1734531276; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n3Svtlpus1vl4PLqypq82JbFm/dGEMMKA2qyOBJu1tM=;
        b=jQm/IIEjExiQRyXXw83vW0qZ4bJjXiPR7LBsQS97KRBQOrlekK7RDi1JvHLYYBxQ/E
         ktw+tuX+sxfx/o++Oc6p8WqVxkH1txBDS+465txWHqbyehGjyNVby+2gY5NYAoxBwgXB
         q3L7NcjLs0YzN4HJ1pOoUCSQUGmUu+iSbFjiRLBDb2cdppdJg55BJd0Oy6YTVS1Qr4Bc
         N0kHB0HhBQZN3dnKXtBa3jMlygCqcDp/W7IlfnMyTldMTWrFunNyz9JatB2tXGskaJPw
         AM1UnWPIlQcB9649XdJ+xSKPyKx+tTjW2rODEZIv8zzWMTHWYwCE2S0fQVDN/Drb4eYe
         vINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733926476; x=1734531276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3Svtlpus1vl4PLqypq82JbFm/dGEMMKA2qyOBJu1tM=;
        b=H7F0rmbxuO4Yp/ohVoE/sCGWBSMm8sPfDLf/VqQSyJwhC8FU3+yRE05sPJNpvVvhzq
         WDUBZi23TX1deXHgqDC8PncgZ+W9w1sHczu/CtMUZdU0/XRv4m7GrIZiQTmOzYclUrIM
         ERwM2bbozRkhwtaij3eHH0FFCxSIrZdI55Fat3MpZDW9YL2BsUnZuWpmgVfAVV9EPfsT
         r3d3+HcfFVs+CmMFsHeoXcIbqFJAFDc3x4GQOu6ACRCLoOz1Cgxuh7CF5rczO5fVJ8YA
         krRGz1XZ2ijVeoANPj9NOQw/6pUZCAhbFHd2ddIlDxzJKjDVBHpFhBl67xwio/E//5Te
         Wyaw==
X-Forwarded-Encrypted: i=1; AJvYcCWUO1L1NjHmXFleiAZuV3sVBzGvTmiFFVD4pCa46duSpYNRDuETnU+t2ksimkZ3USipsVX/TFjCJoMKYtZ0u3wC4g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzZBhlHpJSJexeWh+xjMg22nolvHdzgQzrBt4UPuovhg6THWKth
	JFP+Q6rStVrQgqApB/MfIqsuwgOqsl2QgV7/1QCCSmmFtGQx4tsxa+PUu6GicH8bLkAZDKHEdhF
	MYLb6UbWPLWxETvQjhlmLLFwDGALaViH6
X-Gm-Gg: ASbGncub22FY/bRmqMesNqDDzLrxmy1VH/mbDoGFtAgKHq7DuWJXyaEEWbDX5SSDY2s
	rfcVExnPUr26Qg8VaEkhaHil4VaUkiwZRroo=
X-Google-Smtp-Source: AGHT+IGmQaZM78tgjlSsVSuvhcrKVFitAzLanN26dvGe+8gUF5nNAoeWvWkEnL755Fr3PIdHW7buJP3jONUCqiM9QkA=
X-Received: by 2002:a17:902:e848:b0:215:b5c6:9ed3 with SMTP id
 d9443c01a7336-21778393285mr52853775ad.12.1733926475418; Wed, 11 Dec 2024
 06:14:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1733864271.git.bruce.ashfield@gmail.com>
 <96fdaf0aab7a75c7dbf9e5bee583ac3c6353f262.1733864271.git.bruce.ashfield@gmail.com>
 <D68RW5L3YYXZ.1QVI9872WFLMS@bootlin.com>
In-Reply-To: <D68RW5L3YYXZ.1QVI9872WFLMS@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 11 Dec 2024 09:14:22 -0500
Message-ID: <CADkTA4MkW7ZS4Ez=NgJrTmfYZgGiSkfo0FDHn-_5xMznux2ZBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/6] poky/poky-tiny: update default to v6.12
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a2593f0628ff37cb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 14:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208583

--000000000000a2593f0628ff37cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 4:44=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Tue Dec 10, 2024 at 10:06 PM CET, Bruce Ashfield via
> lists.openembedded.org wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > The 6.12 kernel is a LTS and our next reference kernel, so
> > we bump our default to it.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
>
> Hi Bruce,
>
> > --- a/meta-poky/conf/distro/poky.conf
> > +++ b/meta-poky/conf/distro/poky.conf
> > @@ -19,8 +19,8 @@ POKY_DEFAULT_EXTRA_RRECOMMENDS =3D
> "kernel-module-af-packet"
> >
> >  DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT}
> ${POKY_DEFAULT_DISTRO_FEATURES}"
> >
> > -PREFERRED_VERSION_linux-yocto ?=3D "6.10%"
> > -PREFERRED_VERSION_linux-yocto-rt ?=3D "6.10%"
> > +PREFERRED_VERSION_linux-yocto ?=3D "6.12"
> > +PREFERRED_VERSION_linux-yocto-rt ?=3D "6.12%"
> >
>
> Is removing the '%' match in PREFERRED_VERSION_linux-yocto wanted ? I
> believe this is responsible for a lot of new warnings, such as:
>

Richard already fixed it on his test branches, I've also fixed it locally.

Bruce


>
> stdio: WARNING: preferred version 6.12 of linux-yocto not available (for
> item linux-yocto)
> stdio: WARNING: versions of linux-yocto available: 6.12.3+git 6.6.64+git
> stdio: WARNING: preferred version 6.12 of linux-yocto not available (for
> item virtual/kernel)
> stdio: WARNING: versions of linux-yocto available: 6.12.3+git 6.6.64+git
> stdio: WARNING: preferred version 6.12 of linux-yocto not available (for
> item kernel-module-tun)
> stdio: WARNING: versions of linux-yocto available: 6.12.3+git 6.6.64+git
> ...
>
>
> https://valkyrie.yoctoproject.org/#/builders/29/builds/623/steps/13/logs/=
warnings
>
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a2593f0628ff37cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 11, 2024 at 4:44=
=E2=80=AFAM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-bria=
nd@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Tue Dec 10, 2024 at 10:=
06 PM CET, Bruce Ashfield via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;<br>
&gt; The 6.12 kernel is a LTS and our next reference kernel, so<br>
&gt; we bump our default to it.<br>
&gt;<br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gma=
il.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Bruce,<br>
<br>
&gt; --- a/meta-poky/conf/distro/poky.conf<br>
&gt; +++ b/meta-poky/conf/distro/poky.conf<br>
&gt; @@ -19,8 +19,8 @@ POKY_DEFAULT_EXTRA_RRECOMMENDS =3D &quot;kernel-modu=
le-af-packet&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DISTRO_FEATURES ?=3D &quot;${DISTRO_FEATURES_DEFAULT} ${POKY_DEF=
AULT_DISTRO_FEATURES}&quot;<br>
&gt;=C2=A0 <br>
&gt; -PREFERRED_VERSION_linux-yocto ?=3D &quot;6.10%&quot;<br>
&gt; -PREFERRED_VERSION_linux-yocto-rt ?=3D &quot;6.10%&quot;<br>
&gt; +PREFERRED_VERSION_linux-yocto ?=3D &quot;6.12&quot;<br>
&gt; +PREFERRED_VERSION_linux-yocto-rt ?=3D &quot;6.12%&quot;<br>
&gt;=C2=A0 <br>
<br>
Is removing the &#39;%&#39; match in PREFERRED_VERSION_linux-yocto wanted ?=
 I<br>
believe this is responsible for a lot of new warnings, such as:<br></blockq=
uote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sm=
all">Richard already fixed it on his test branches, I&#39;ve also fixed it =
locally.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
stdio: WARNING: preferred version 6.12 of linux-yocto not available (for it=
em linux-yocto)<br>
stdio: WARNING: versions of linux-yocto available: 6.12.3+git 6.6.64+git<br=
>
stdio: WARNING: preferred version 6.12 of linux-yocto not available (for it=
em virtual/kernel)<br>
stdio: WARNING: versions of linux-yocto available: 6.12.3+git 6.6.64+git<br=
>
stdio: WARNING: preferred version 6.12 of linux-yocto not available (for it=
em kernel-module-tun)<br>
stdio: WARNING: versions of linux-yocto available: 6.12.3+git 6.6.64+git<br=
>
...<br>
<br>
<a href=3D"https://valkyrie.yoctoproject.org/#/builders/29/builds/623/steps=
/13/logs/warnings" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yo=
ctoproject.org/#/builders/29/builds/623/steps/13/logs/warnings</a><br>
<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000a2593f0628ff37cb--

