Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE30C43334
	for <webhook@archiver.kernel.org>; Sat,  2 Jul 2022 08:28:55 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.48296.1656750530830505682
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jul 2022 01:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fqRsLN0w;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 y14-20020a17090a644e00b001ef775f7118so224074pjm.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jul 2022 01:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7XXt1PIL+K/xJvdxKJcBThgtk/KFsAWz9bJ7Q2lz1mw=;
        b=fqRsLN0whBmXdBhT7tAv5LjpxIJjxa2utds2tcEZwPZZ5RAOr++9u/8D2xqlSnT2VS
         fDGD+SCNVnKzuX/XasT7sLnvsOkyUUHRSNmTNzksPNBfoAwkDSfPmp4gQCiEYpa/m5Td
         vNYOd4qPi2MXYYdEoV3sXKJYtxHMgY7IsDjUB11OOut3ag+DuwP92i2xWHzqJ3JsIzAF
         k60sCDZBDzCv2PpKA+bKlWBIU48fG9YRjlcqTtB6IaHgbcP4DH9skIq4GZIpkf7M7txN
         jdt4r5XFym6NmSal2KHZxJlzaMkgY5n9ytm9ZNuj+SLrfbstvJMCr5DLnUyNIg70/L0I
         L94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7XXt1PIL+K/xJvdxKJcBThgtk/KFsAWz9bJ7Q2lz1mw=;
        b=fs1zYFAonNDjk9YXoDi3PqIiiYPnqFY9T8sBo5WuUGV1PXwhMpog9xfQOjk7/pI8MA
         yXFPLntsqNE2I0KRUkh9pQIb5XOyyHw+CeDu+szJLwpKnVlFBo0B1cRXfxG7a4yWucJE
         ebVy70vf2k5iDaX4+JMWb7A21nB6AbQGCD3s9IVYVj6Y9kb/ydFx8ISpC2KUVAHdFZzw
         u9BzA4rja12bESZvN0EnKJpKlDGEFQInNBQhILxiKWu0ojOnHpFGn8WmPlq2+YXg9R3d
         nI7Ho1AOnjMdTmsag/Zp5B2hNYGP53z+pj1vmfKgxfxRMGBJrfH0ITNRohyjgYw9+/e+
         RsvA==
X-Gm-Message-State: AJIora8+jbkQZomeJxj8OyKtF5O0JQpNvazFYjfjNPRopWl0FQpQccfH
	LnviK3S8Kz/rfngLcI77MKdOahd8ZhXo7zBCp7s=
X-Google-Smtp-Source: 
 AGRyM1tDpgDK1rfXJe/ZjRehTWd6BWFqW2piheb5vRqz3n07mmB6ouR47rcYcIYM+tgEUbiXU589UIBv0Vv5qwVrFHM=
X-Received: by 2002:a17:903:2285:b0:16a:2ee7:4779 with SMTP id
 b5-20020a170903228500b0016a2ee74779mr24143395plh.43.1656750530070; Sat, 02
 Jul 2022 01:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220701192449.1358325-1-alex@linutronix.de>
 <92f3c188-a784-3af2-9bb9-76353e60deb0@gmail.com>
 <CANNYZj_6PJ=E3M5X21eYhih3am62jvVE+G+vgjenKoSfRCL36g@mail.gmail.com>
 <CAJdd5Gai4N1MXGVOMhqceocjWGpr9D4zEjRgvu3vN8Lgi8WAzg@mail.gmail.com>
 <CANx9H-Db+K=hMKGJzwmRQbyz+VTLC=tcMviSj5kPzKkTCWKBTg@mail.gmail.com>
 <CANNYZj_OZ735VtV_QYH9H-0ckT_1faeOZ35H=qN5zXN8H8C4Xg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_OZ735VtV_QYH9H-0ckT_1faeOZ35H=qN5zXN8H8C4Xg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 2 Jul 2022 01:28:38 -0700
Message-ID: 
 <CANx9H-Dz+qoXt-uEkfj+fvYHcDbL74DsnTpHmEFpQo2kom8ZLw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer
 repositories/revisions save and restore tooling (aka 'layer configuration')
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>,
 Alexander Kanavin <alex@linutronix.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d38bd505e2ce4a7d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Jul 2022 08:28:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167546

--000000000000d38bd505e2ce4a7d
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 2, 2022 at 12:45 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Sat, 2 Jul 2022 at 07:58, Tim Orling <ticotimo@gmail.com> wrote:
> > One remaining question is how do we handle configuration? This seems to
> address manifest?
>
> Configuration will be handled with TEMPLATECONF and a set of templates
> in a product/platform layer. It's already in core, it's simple to
> understand and it works. We used it in a very large project. It also
> requires a certain bit of discipline, which is a good thing: you don't
> get to implement ugly local.conf hacks in a turing complete language,
> and must design your configuration (distro, machines and images)
> carefully in a static manner. Then local.conf must contain only DISTRO
> and MACHINE, and a 'confuguration' is essentially a choice of those
> two plus a set of enabled layers plus site-specific settings for
> sstate, downloads, proxies and parallelism level. Back to
> (maintainable) basics.
>

100% on board then. I will die on this mountain.


>
> And yes, I didn't want to open a discussion about this, I even didn't
> describe upfront how I'm going to do this to a customer who's
> supporting the work (if said customer is reading this, I appreciate
> the trust). I simply sat down and wrote the code. The principle is:
> make a tool that fits in a single commit and that I would want to
> personally use.
>
> Yes. 1000% yes. I need a way to quickly spin up layers and configuration
often in half a dozen ways per day.


> Alex
>

--000000000000d38bd505e2ce4a7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 2, 2022 at 12:45 AM Alexa=
nder Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Sat, 2 Jul 2022 at 07:58, Tim Orling &lt;<a href=3D"mailto:ticotim=
o@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt; One remaining question is how do we handle configuration? This seems t=
o address manifest?<br>
<br>
Configuration will be handled with TEMPLATECONF and a set of templates<br>
in a product/platform layer. It&#39;s already in core, it&#39;s simple to<b=
r>
understand and it works. We used it in a very large project. It also<br>
requires a certain bit of discipline, which is a good thing: you don&#39;t<=
br>
get to implement ugly local.conf hacks in a turing complete language,<br>
and must design your configuration (distro, machines and images)<br>
carefully in a static manner. Then local.conf must contain only DISTRO<br>
and MACHINE, and a &#39;confuguration&#39; is essentially a choice of those=
<br>
two plus a set of enabled layers plus site-specific settings for<br>
sstate, downloads, proxies and parallelism level. Back to<br>
(maintainable) basics.<br></blockquote><div><br></div><div>100% on board th=
en. I will die on this mountain.</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
And yes, I didn&#39;t want to open a discussion about this, I even didn&#39=
;t<br>
describe upfront how I&#39;m going to do this to a customer who&#39;s<br>
supporting the work (if said customer is reading this, I appreciate<br>
the trust). I simply sat down and wrote the code. The principle is:<br>
make a tool that fits in a single commit and that I would want to<br>
personally use.<br>
<br></blockquote><div>Yes. 1000% yes. I need a way to quickly spin up layer=
s and configuration often in half a dozen ways per day.</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
Alex<br>
</blockquote></div></div>

--000000000000d38bd505e2ce4a7d--

