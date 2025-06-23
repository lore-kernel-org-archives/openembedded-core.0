Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94875C7EE30
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 12:14:38 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.304.1750722820118464143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 16:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sifive.com header.s=google header.b=P+eIAH+u;
 spf=pass (domain: sifive.com, ip: 209.85.128.47, mailfrom: jimmy.ho@sifive.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450cf214200so42950645e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 16:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1750722818; x=1751327618; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=03xMjA+RuEJidezX3d4Dx5YyUKMzq/KclUFEEmmWZQI=;
        b=P+eIAH+u2Jxti+ueTVxhs5Q8yZwxF+Ty+f00kXn75k1aNjyUuNlX4c5p9Q+Wjg9fPP
         bnssPjC86HbEt55keAxabUMOfb10Wg595/vIeyymgUdnxfDiUOXkqZaSwR26x/yKKTmG
         CihRfhk34+Z+a0MgdXBBMobm5D7p4RHZuxEYchM+OYawxLcjOLgY8NvamYVlt50ozAMV
         nV1rw2dhm74oWES1dP6ikwJRSUmkUVEnQ/I+ha3lkPrqGSOQLEynxpe84M/uBmg49n64
         OYsuYEUm1eO4wMAI3mBo7V2FmMirTb6Cd1aqJlB9TVVvbdtFCh7u3WXT3llDIo+SSDkf
         hZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750722818; x=1751327618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03xMjA+RuEJidezX3d4Dx5YyUKMzq/KclUFEEmmWZQI=;
        b=uLns9SVwjHDTvsHbKCKmJDpic/SYt7IPz22tccQnXD3M/TFKjd4FPtQ9wea/l/sz4O
         /2l1Ck3dfTmZzt5fa3Bz/4JptMcFU9oVDka26zWeiQpxmtKNRRM0b0I1/Ph40h1XYdmK
         JoUwEFSxGfgdqDUv9CcZQ3KU/0sETDEA69i/G2gTFJuw/ynL653gp/3sVHshKX2Ou8P6
         NK/N9ySVw6Xhrq8Tsq09fO+udk4v8FNwVETB6W5ugHepnsyclpWUhal6hf/jrR+cp5xK
         FEASqxCA/jPy0Ab0hnpUHDABi+5vJ6zRnxN+xP1tSUNpOnCmOIsNnM/in+lVqMYGeMuq
         BBxg==
X-Gm-Message-State: AOJu0YyPCL6UN6iE7T/2Uq83dgLys68REaMzekE/ULIdurREVFFiJqa9
	3HVogQiZZKx55r3Ke+d4p4UJr9Ix16MwLQ9HTbixrhMwqjTPJIANljT+NHoRp0bEB9k8adaxVcJ
	nkC/TQm5i5HdFssu7RqrPKnruGMmR3hY1pH2hdgUHWw==
X-Gm-Gg: ASbGnctVKSLCqxewmupWu9URMjruOo7MVW0Wj3uPInl2Wj6LGkKWUjwdRfCm3+dfSQu
	VQFt81nnpWER0NkSL+Yj+WdEGM2bRJ49tE9yxGgb5fTPBraZ89L2ZFd+VYNXQPrlq9FGK9TK90M
	bYh2d9cf6R5MJQri3Y4viDqMouIZmWlu6FDjy/UChxvpREeg==
X-Google-Smtp-Source: AGHT+IHFksCK+8vIr/F1Tq3vE1lNvsc6bfOLrSQaYjIDrc0vkpdAabrIUc2P2J/OlVjeJdbSBM7j3fFjyyqAK3WEbDM=
X-Received: by 2002:a05:600c:1c92:b0:453:b44:eb69 with SMTP id
 5b1f17b1804b1-4537ab1d451mr20027795e9.13.1750722818422; Mon, 23 Jun 2025
 16:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250619082919.12390-1-jimmy.ho@sifive.com> <DAQMA3E0OM0S.N9VZOQHC3GPL@bootlin.com>
In-Reply-To: <DAQMA3E0OM0S.N9VZOQHC3GPL@bootlin.com>
From: Jimmy Ho <jimmy.ho@sifive.com>
Date: Tue, 24 Jun 2025 07:53:27 +0800
X-Gm-Features: Ac12FXx8fosuuUBzeUHSAZRDVONYVHjExTPNiLJR4ln9UmFuQtYj3NX5NvajSkQ
Message-ID: <CAJh9TS+gWrANUPuC5DPOoN5jsXdD=N7fHPZWDZ9Yf448CvpCaA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] nfsrootfs: disable warning message if bootargs root parameter have not been defined
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b14d60063845ebf6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 12:14:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219256

--000000000000b14d60063845ebf6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antonin:
thanks for suggestion
i will resend the patch

On Thu, Jun 19, 2025 at 11:32=E2=80=AFPM Antonin Godard <antonin.godard@boo=
tlin.com>
wrote:

> On Thu Jun 19, 2025 at 10:29 AM CEST, Jimmy Ho via lists.openembedded.org
> wrote:
> > we have case that don't define root in bootargs,
> > if [ ${bootparam_root} !=3D "/dev/nfs" ] will output warning
> "/init.d/85-nfsrootfs: line 4: [: !=3D: unary operator expected"
> > by checking  whether bootparam_root is defined can clear this warning
> message
> >
> > Signed-off-by: Jimmy Ho <jimmy.ho@sifive.com>
> > ---
> >  meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git
> a/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
> b/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
> > index e67ee4c25d..1e76258ce1 100644
> > --- a/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
> > +++ b/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
> > @@ -1,7 +1,7 @@
> >  #!/bin/sh
> >
> >  nfsrootfs_enabled() {
> > -     if [ ${bootparam_root} !=3D "/dev/nfs" ] || [ -z
> ${bootparam_nfsroot} ]; then
> > +     if [ -z ${bootparam_root} ] || [ ${bootparam_root} !=3D "/dev/nfs=
" ]
> || [ -z ${bootparam_nfsroot} ]; then
>
> I think a better way of fixing this would be to replace
>
>   [ ${bootparam_root} !=3D "/dev/nfs" ]
>
> by
>
>   [ "${bootparam_root}" !=3D "/dev/nfs" ]
>
> instead of an extra condition.
>
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000b14d60063845ebf6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Antonin:<div>thanks for suggestion=C2=A0</div><div>i wi=
ll resend the patch<br><table cellpadding=3D"0" class=3D"gmail-cf gmail-ix"=
 style=3D"font-family:&quot;Google Sans&quot;,Roboto,RobotoDraft,Helvetica,=
Arial,sans-serif;font-size:14px;border-collapse:collapse;table-layout:fixed=
;width:1541.36px"><tbody></tbody></table><table cellpadding=3D"0" class=3D"=
gmail-cf gmail-gJ" style=3D"border-collapse:collapse;margin-top:0px;width:a=
uto;font-family:&quot;Google Sans&quot;,Roboto,RobotoDraft,Helvetica,Arial,=
sans-serif;font-size:14px;display:block"></table></div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, Jun 19, 2025 at 11:32=E2=80=AFPM Antonin Godard &lt;<a href=3D"ma=
ilto:antonin.godard@bootlin.com">antonin.godard@bootlin.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu Jun 19, 2=
025 at 10:29 AM CEST, Jimmy Ho via <a href=3D"http://lists.openembedded.org=
" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br=
>
&gt; we have case that don&#39;t define root in bootargs,<br>
&gt; if [ ${bootparam_root} !=3D &quot;/dev/nfs&quot; ] will output warning=
 &quot;/init.d/85-nfsrootfs: line 4: [: !=3D: unary operator expected&quot;=
<br>
&gt; by checking=C2=A0 whether bootparam_root is defined can clear this war=
ning message <br>
&gt;<br>
&gt; Signed-off-by: Jimmy Ho &lt;<a href=3D"mailto:jimmy.ho@sifive.com" tar=
get=3D"_blank">jimmy.ho@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs | =
2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/nfsro=
otfs b/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs<br>
&gt; index e67ee4c25d..1e76258ce1 100644<br>
&gt; --- a/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs<br=
>
&gt; +++ b/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs<br=
>
&gt; @@ -1,7 +1,7 @@<br>
&gt;=C2=A0 #!/bin/sh<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 nfsrootfs_enabled() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if [ ${bootparam_root} !=3D &quot;/dev/nfs&quot; =
] || [ -z ${bootparam_nfsroot} ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ -z ${bootparam_root} ] || [ ${bootparam_root=
} !=3D &quot;/dev/nfs&quot; ] || [ -z ${bootparam_nfsroot} ]; then<br>
<br>
I think a better way of fixing this would be to replace<br>
<br>
=C2=A0 [ ${bootparam_root} !=3D &quot;/dev/nfs&quot; ]<br>
<br>
by<br>
<br>
=C2=A0 [ &quot;${bootparam_root}&quot; !=3D &quot;/dev/nfs&quot; ]<br>
<br>
instead of an extra condition.<br>
<br>
Antonin<br>
<br>
-- <br>
Antonin Godard, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--000000000000b14d60063845ebf6--

