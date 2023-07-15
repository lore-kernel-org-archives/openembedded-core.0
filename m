Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE149EB64DC
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 04:57:10 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.6544.1689397022320043802
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 21:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ll2xpdyc;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b74209fb60so39535931fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 21:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689397020; x=1691989020;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sYW0n04a0EyQ8ZkI+akAJhw3jBPKHkBVbYeK6m+h5O4=;
        b=ll2xpdyc7MXCh8B6VzEGto1aIAXCKpLGcyJ/FR/AOrrzoehrRdJMKaMPc0W3nea7vg
         Tulo67FBNT5BG5zPaxxoZ/b7/UGBl4J3YbnC8NQXdVATbNBmXMvXih2iC1TejlC/2Rpn
         NE4L8vU9RDY2AFmxGZYRAwamPs3U6Memvlz0Jb6Xu8ij27pFnNpoJR907qDwaFunPqt9
         jeZjr/IZkMK7CiVMd952oeI1my4X1ABTj9vYFMSZXhCh50UzeB29Sz0AG4kerNhr3HYB
         Wjhvu+Qf4aU46BMuggifFDlSnoSmoupFPCLeEe8/nmP5d8AZr6eosDqk96K0BIlWaBS9
         4R3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689397020; x=1691989020;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYW0n04a0EyQ8ZkI+akAJhw3jBPKHkBVbYeK6m+h5O4=;
        b=hojaGRD48ctqQVLpejOLvl+32UKaAMA7nGszUXS7sIva3s0Z4FHTrw+7f0TJ8JXDQI
         rNLQpMDfR3QW1XqavywFtezIf5HgmL+SLSlERZjNiTJp9u3RKeszUBjayBmnE70WOZFR
         ecbKSjCfN2PyC03KqHaxsQK4/I3pFBiHiXq6culwtPEYBbh7ckARXP34ffpS3PCFvT5J
         Z+RVwTgdDWflnm7QoCm2/oADhuGW08r8xNTiTePjo9zxKlN1WX2XFxJ0MTse+76dLINz
         dMw8wqLyNBS/bU/UHTRZHPUDZgTWA1l1DG6MXU1t9liSHUGDS/+LS20JSzHOQxOSetqG
         Ekgg==
X-Gm-Message-State: ABy/qLaNCpY9N7mL4xItGswo2JtdtfRV66NBLmSVvXU/nF5KsmWm7/NZ
	4/WSL7G3KbdZBz0eCZiR7APhwCEHQeA5sf/EjJQ=
X-Google-Smtp-Source: APBJJlEZriCoy2W90tlVm+jnLaVsIlWMXkH3XMwAb6Ti5ZT1Tub6wp46U9ry4tybO9Sk1r8R6zygKsDN4KxYCnMeeCA=
X-Received: by 2002:a2e:98d2:0:b0:2b6:cd12:24f7 with SMTP id
 s18-20020a2e98d2000000b002b6cd1224f7mr5311578ljj.44.1689397019813; Fri, 14
 Jul 2023 21:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230714161823.20685-1-festevam@gmail.com> <CANNYZj-8RV6tz_7kEH6uz=yZeyd=bPts6AoBqTd5DL3rGGu+yg@mail.gmail.com>
 <20230714213719.GX2066889@bill-the-cat>
In-Reply-To: <20230714213719.GX2066889@bill-the-cat>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 15 Jul 2023 07:56:48 +0300
Message-ID: <CANNYZj8-vQbGEO3yMgRbk2j2L-XOc2EeG6=2w2GhFwUuZqD=mw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] u-boot: Switch to nobranch=1
To: Tom Rini <trini@konsulko.com>
Cc: Fabio Estevam <festevam@gmail.com>, Fabio Estevam <festevam@denx.de>, marex@denx.de, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000040412606007f65f3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 04:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184309

--00000000000040412606007f65f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Then we=E2=80=99ll consider options, such as moving variable bits out of .i=
nc or
introducing a variable that strips last number from PV. I would want to
avoid recipes fetching from dangling branch-less commits in core. The
commit being on a branch is a QA check by the fetcher.

Alex

On Sat 15. Jul 2023 at 0.37, Tom Rini <trini@konsulko.com> wrote:

> On Fri, Jul 14, 2023 at 07:53:03PM +0200, Alexander Kanavin wrote:
>
> > It's not in master branch, but it is in a branch, so please do not use
> > nobranch, and just adjust the branch parameter together with the
> > version update:
> >
> https://source.denx.de/u-boot/u-boot/-/commit/83cdab8b2c6ea0fc0860f8444d0=
83353b47f1d5c
>
> Won't this just make more churn later? The v2023.10 tag will be back on
> master (and we'll assume I don't goof it up), but if any of the "maybe
> we do an LTS? Hmm?" work comes through, then we start having to change
> things there, and then maybe can't as easily share inc files between
> something that tracks LTS and something that doesn't.
>
> --
> Tom
>

--00000000000040412606007f65f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Then we=E2=80=99ll consider options, such as moving varia=
ble bits out of .inc or introducing a variable that strips last number from=
 PV. I would want to avoid recipes fetching from dangling branch-less commi=
ts in core. The commit being on a branch is a QA check by the fetcher.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat 15. Jul 2023=
 at 0.37, Tom Rini &lt;<a href=3D"mailto:trini@konsulko.com">trini@konsulko=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding=
-left:1ex;border-left-color:rgb(204,204,204)">On Fri, Jul 14, 2023 at 07:53=
:03PM +0200, Alexander Kanavin wrote:<br>
<br>
&gt; It&#39;s not in master branch, but it is in a branch, so please do not=
 use<br>
&gt; nobranch, and just adjust the branch parameter together with the<br>
&gt; version update:<br>
&gt; <a href=3D"https://source.denx.de/u-boot/u-boot/-/commit/83cdab8b2c6ea=
0fc0860f8444d083353b47f1d5c" rel=3D"noreferrer" target=3D"_blank">https://s=
ource.denx.de/u-boot/u-boot/-/commit/83cdab8b2c6ea0fc0860f8444d083353b47f1d=
5c</a><br>
<br>
Won&#39;t this just make more churn later? The v2023.10 tag will be back on=
<br>
master (and we&#39;ll assume I don&#39;t goof it up), but if any of the &qu=
ot;maybe<br>
we do an LTS? Hmm?&quot; work comes through, then we start having to change=
<br>
things there, and then maybe can&#39;t as easily share inc files between<br=
>
something that tracks LTS and something that doesn&#39;t.<br>
<br>
-- <br>
Tom<br>
</blockquote></div></div>

--00000000000040412606007f65f3--

