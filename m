Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2907C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 08:48:18 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web12.4539.1641890897169368211
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 00:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K6pSyrdu;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id l15so16878181uai.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 00:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KdZ/X3jMTsBSJ95sDYQXlCgzjjCds0cTARTr98ljHBw=;
        b=K6pSyrdu1hklXy13bVPaIt9Ce3IDcJxi9rBPL2JciLXqqmTbMpx3vNZvbnqrAHIgv/
         JPNrtrOlDf9J9ZpMDreGRGyigH91xEOzAcYrpCcNZhc+snlY+nht8F8Nu1L3G+jBR+tp
         R0030SSCgJ/QLIZQz2NkmEThYiuJm4ye4iHa6r6UI7T5/v8aJsN25txl4xeFAySjj7f/
         yH8EfksZDT4/JCjK8xeRTvJGmrG4NJqAeXrw5fv/cnJacJSxlAeaz4oyGclyqn5GtXr7
         9IGtxxXsNJ00H4PV1JgkANMJzb1HrZrtyeQUc3lI+8hpiPmD+whpz9dCA6351dORV9H0
         AnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KdZ/X3jMTsBSJ95sDYQXlCgzjjCds0cTARTr98ljHBw=;
        b=I74do0xI0lXfGO/kB37guJqMEaDwvTFocx/h9BW1KFY2b1ESGNlGPl4B0MmQtYTYCw
         WPAPGp7um7d3z0A4NjqVHn9B71dmUrG0lBgUlgiKAqs/gQ0I0dMxhANuVv8SxzsaEVSm
         ztnVuQR8wL3coNPueQOTVi86rYrZc17wC+DZgA4mAjIC2+p5sTTP8ZX6OxsObJSpvDZ1
         GKG7hzXCQheOVol9nVAMdtnFXZo41KYbS2kMDwP2979D2qX/BiXHaRqdwzKyqoNdIJBw
         y7UsyxnXkklxF/2+MLWsrCu1IbbqkwCl1CfWpVnzqOhmA8vQBC4G6DAdbNPk/2Zt1oS7
         nemA==
X-Gm-Message-State: AOAM5321Zr0Og3QywHcnlPT4CW8GTMMQUDJRlfLmJK9x0K/TE1jXlNIq
	i2x6105NVeR9y4HnrkViiMypfEb9dfhjEpBdSmA=
X-Google-Smtp-Source: 
 ABdhPJzemoCOjw2opn3jgmea1Ii3Ao/+bczcwGqnpQKsF08xNDpYu2ODzqs717pV7/UAVpaCUv9Qc3o7eJM/EK1dQN0=
X-Received: by 2002:a05:6102:f0e:: with SMTP id
 v14mr1656674vss.45.1641890896281;
 Tue, 11 Jan 2022 00:48:16 -0800 (PST)
MIME-Version: 1.0
References: <20220109222732.2252416-1-alex@linutronix.de>
 <20220109222732.2252416-10-alex@linutronix.de>
 <CAMKF1sqW2NaY+=49oWG24=6mrrLjM_jam375tbHS_yo8xD2+hA@mail.gmail.com>
 <CANNYZj8jt-Wh4nyBNdXm5ykPjOkK1nvoLH7vcJwgZpPnxn=NeQ@mail.gmail.com>
 <CAMKF1sr4VpWwTqER4h4tYUm4p2v_di8BcmcE_As8GFkiEJO6kQ@mail.gmail.com>
 <CANNYZj9e6DDGBEL7_bcSdU=6z-faXOEjCnDcsJ-rAtEqK_aVrQ@mail.gmail.com>
 <CAMKF1sp3ujr7iaktTzxH0bSXT8MKJ5c06t4ObUro8m5zCczD5Q@mail.gmail.com>
 <CAMKF1srFMGqOXKSiU_J-D04g2-E45OGVY7kgeXwdXf0MgPKxmQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srFMGqOXKSiU_J-D04g2-E45OGVY7kgeXwdXf0MgPKxmQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Jan 2022 09:48:05 +0100
Message-ID: 
 <CANNYZj-tuaUGyHVuy2uFgsNHTsxTTyLQWFG38NcdYrNDNVqEaw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/14] epiphany: make libportal optional, and
 move it to meta-oe
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000a2056405d54a83ff"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 08:48:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160389

--000000000000a2056405d54a83ff
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Jan 2022 at 08:49, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Jan 10, 2022 at 12:54 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Mon, Jan 10, 2022 at 11:18 AM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > For epiphany you also need the oe-core patch. Nautilus should switch
> to an optional dependency via PACKAGECONFIG, similar to epiphany.
> >
> > I might have missed the OE-core patch perhaps, I will rebuild with
> > latest master-next perhaps and see if that helps
>
> digging a bit deeper reveals this
>
> ../nautilus-41.1/src/nautilus-files-view.c:95:10: fatal error:
> 'libportal/portal-gtk3.h' file not found
> #include <libportal/portal-gtk3.h>
>         ^~~~~~~~~~~~~~~~~~~~~~~~~
> 1 error generated.
>
> but libportal is staging it in
>
> % find ../ -name portal-gtk3.h
> ../recipe-sysroot/usr/include/libportal-gtk3/portal-gtk3.h
>
> and this is happening with 0.5 upgrade of libportal. I guess nautilus
> needs to be patches perhaps.
>

It's a lot easier to just turn the dependency into a PACKAGECONFIG, and in
due time upstream will address it. It's not an essential feature at all.

Alex

--000000000000a2056405d54a83ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 11 Jan 2022 at 08:49, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Mon, Jan 10, 2022 at 12:54 PM Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.=
com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Jan 10, 2022 at 11:18 AM Alexander Kanavin<br>
&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.k=
anavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; For epiphany you also need the oe-core patch. Nautilus should swi=
tch to an optional dependency via PACKAGECONFIG, similar to epiphany.<br>
&gt;<br>
&gt; I might have missed the OE-core patch perhaps, I will rebuild with<br>
&gt; latest master-next perhaps and see if that helps<br>
<br>
digging a bit deeper reveals this<br>
<br>
../nautilus-41.1/src/nautilus-files-view.c:95:10: fatal error:<br>
&#39;libportal/portal-gtk3.h&#39; file not found<br>
#include &lt;libportal/portal-gtk3.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~<br>
1 error generated.<br>
<br>
but libportal is staging it in<br>
<br>
% find ../ -name portal-gtk3.h<br>
../recipe-sysroot/usr/include/libportal-gtk3/portal-gtk3.h<br>
<br>
and this is happening with 0.5 upgrade of libportal. I guess nautilus<br>
needs to be patches perhaps.<br></blockquote></div><div class=3D"gmail_quot=
e"><br></div><div class=3D"gmail_quote">It&#39;s a lot easier to just turn =
the dependency into a PACKAGECONFIG, and in due time upstream will address =
it. It&#39;s not an essential feature at all.</div><div class=3D"gmail_quot=
e"><br></div><div class=3D"gmail_quote">Alex<br></div></div>

--000000000000a2056405d54a83ff--

