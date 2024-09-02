Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0282CA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 12:01:48 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.36900.1725278505353448532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 05:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XtYNfF0+;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5334b0e1a8eso5441607e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 05:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725278503; x=1725883303; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=axoBAs5/rDUOSL+2JAjT3BP0V7n/Je+4UiqD+LCtGbM=;
        b=XtYNfF0+9eAbeNc7Ll5j+4dcYCDQbZy6R9qz+o3J8oRDmGqlkM8cW4OyjI6PGBATkm
         pDTIBwF1clzpjcc3/d2faQlZMOT6Zzvl+VJY/aG1oGR8IpvYXPebT2Il21UA4lNcD3wf
         3AP5gnYHgObhVUBaSuW4R05fi5ZyF89lmu9sRCZfBf/ApABtKhXnT/L4AT42EUBAxboh
         WhyhXZmFy4X2XOaUupC4P0TVbfa5U/khCBJIoeCMDsthnkWqoLI+FckNeytKq+HcrNe/
         txccF+cthOjGTEqMKhfoeCuCla8ybPsGXkkQvTWliwD769hzjYrgjXihYu1jKpveKAHE
         Ijsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725278503; x=1725883303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axoBAs5/rDUOSL+2JAjT3BP0V7n/Je+4UiqD+LCtGbM=;
        b=B5hQJ+35aRYODQ4q9e06NBO6oIBXExAU3CTmlcMZHAPthEmoNKgBlLdpya2MPpXujU
         Ga9BSKPZRZBMQ9K5ffjdjuWdbqc49Nq7DFya5A8KNcLSODPkySjK65Fxt5t6KHrQ7SX0
         Jf4x1vHj9uUlTekGVIdT19e0kvN6o/osUgPrVapT1APNGhGpkZlt8iGfN0wC8rswA23/
         EFK2e7YAzANr9rpE5AxUBUU8UHTWB950thi+5I4kbn2cPni2Vg3HErq771b0+qQmJ5S7
         GGWUdrqAbncdUav/rcQpD/IvbwKi1t9y9QtfxKkKtfAQf6CYBMH8QnqI/sp0lCZG4NZN
         sl3A==
X-Gm-Message-State: AOJu0Yw7hsOB/ZmT0BxOxGyflf1ordOS8+EdpzhPvHymHqLDN2dG2kMb
	S0NdgjoBMovynagy5TAyWVFYnJeRGm+7gtQ9L94NnJoUQg1EUluMxXYoqXqdNh6gXG4eqrrp0uX
	c7Ln+TI2Ggz+UoArjmBuQU/naOZM=
X-Google-Smtp-Source: AGHT+IE4cCP5MSHYpswJ3AOYzYIGm4cXnaezjxazMViVNkFzEicHOwxEeESYFKJch0D4KbBdnCL8NIYTugVK1q1leh0=
X-Received: by 2002:a05:6512:3d28:b0:52c:e670:7a12 with SMTP id
 2adb3069b0e04-53546bc2c75mr6116533e87.60.1725278502697; Mon, 02 Sep 2024
 05:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240902105825.40177-1-mikko.rapeli@linaro.org>
 <20240902105825.40177-3-mikko.rapeli@linaro.org> <CANNYZj-cgTaKagNxx2mxTkPsp4U-JNNGrruUDUSPbn_cFz6+nw@mail.gmail.com>
 <ZtWgPF0JN4uyjU1u@nuoska>
In-Reply-To: <ZtWgPF0JN4uyjU1u@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Sep 2024 14:01:31 +0200
Message-ID: <CANNYZj9ke4yEQh0hAxk4fUazaEzQMP7JUKv6LYRv16CTwXpqFQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] uki.bbclass: add class for building Unified
 Kernel Images (UKI)
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org, 
	Michelle Lin <michelle.linto91@gmail.com>, Erik Schilling <erik.schilling@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000004ac167062121b43e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 12:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204098

--0000000000004ac167062121b43e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon 2. Sep 2024 at 13.23, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:

> Hi,
>
> On Mon, Sep 02, 2024 at 01:11:27PM +0200, Alexander Kanavin wrote:
> > Should this also have a wic based selftest or some other way to ensure =
it
> > works?
>
> Yes, but that depends on the UEFI / Arm System Ready compatible firmware.
>
> For qemu, this can be setup using meta-arm and qemuarm64-secureboot machi=
ne
> config. The patches for UEFI secure boot are currently in review and if
> approved
> I will switch those to boot uki binaries, patches are ready but not
> submitted
> yet.
>
> I don't know if poky alone can provide UEFI firmware to boot with.



Doesn=E2=80=99t ovmf recipe provide exactly that? Can you check (grep poky)=
 if
there are existing tests that involve ovmf (I believe there are but can=E2=
=80=99t
check from a smartphone)?

Alex

>
>
> Cheers,
>
> -Mikko
>

--0000000000004ac167062121b43e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>On Mon 2. Sep 2024 at 13.23, Mikko Rapeli &lt;<a href=3D"mailto:mikko.=
rapeli@linaro.org">mikko.rapeli@linaro.org</a>&gt; wrote:<br></div><div><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)">Hi,<br>
<br>
On Mon, Sep 02, 2024 at 01:11:27PM +0200, Alexander Kanavin wrote:<br>
&gt; Should this also have a wic based selftest or some other way to ensure=
 it<br>
&gt; works?<br>
<br>
Yes, but that depends on the UEFI / Arm System Ready compatible firmware.<b=
r>
<br>
For qemu, this can be setup using meta-arm and qemuarm64-secureboot machine=
<br>
config. The patches for UEFI secure boot are currently in review and if app=
roved<br>
I will switch those to boot uki binaries, patches are ready but not submitt=
ed<br>
yet.<br>
<br>
I don&#39;t know if poky alone can provide UEFI firmware to boot with.</blo=
ckquote><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Doesn=E2=80=99t ovmf recipe provide exactly that? Can you check (gre=
p poky) if there are existing tests that involve ovmf (I believe there are =
but can=E2=80=99t check from a smartphone)?</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Alex</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;paddin=
g-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
-Mikko<br>
</blockquote></div></div>

--0000000000004ac167062121b43e--

