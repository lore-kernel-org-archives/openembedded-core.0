Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91782C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 16:22:26 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web12.53783.1638807745982003874
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 08:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dG8hvSxK;
 spf=pass (domain: gmail.com, ip: 209.85.221.171,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id m19so7168186vko.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 08:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nr7RiuQyfykTpHFowuPbqxOnmy2cWmfO0d9p9Mh9IUY=;
        b=dG8hvSxKBOA1cyUgAjMMDyxlGy0i4/2OamdXxl9gKmFCOi48ZNtA3Tcl4O3TrL8Odk
         1TcWB2+rWyeJHAG+yhtkC6eiLPBJXLaacpZsOY5rd4mZuX29/WdwbqKdb1ga91WYUMHj
         d1SC4orq79IOKaKfg/CuWAz1rBKi46VHBCnINHs1eMsyocA1/o71s3jbxSrysDSqhcYn
         ExL/JgC3LKZAqYJ/RaE0r/KP7htLfcpLWqrZ6Gt2M+WqKmSl2jP9f4xmubYuC3fYX23j
         RD/S28WJzVj0Sac6YIuAkOIIPMfug8uBcbmQ6GxEkleHsOqJKCRb0jGMdITrnnivDe43
         Vrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nr7RiuQyfykTpHFowuPbqxOnmy2cWmfO0d9p9Mh9IUY=;
        b=blJyAv2imQiPbvK4Bda/xbwbhiSwu7ZC6liVtXkPWnY4FJ9FwTy00dCyCv1DOK9b21
         jYCgK3icfFfBxfs9x0hnVgS0L6f4gkh+tYnFQm5pSNHsQaxuw++1ZD3xZE1yhXx872+1
         XAjyOL3Ao+xcd2TvnTbKkK9mbJ8mHSFuLzMXdQvl563yeM4zQ3hsMRMvUCVOJnwyQnaO
         TimmCMVsa1vxs10MvR4BzCF/Xtpj3D428D/h5aY94RDbT/ha/sdC5WGU/TGweBqf0rnC
         qtAP3MBCQ8ln/F7o/DGywz93HYnunCPQqJoz1kHGBg9lZ7dJlTW/g/tid9iqpN1MBKrr
         15BA==
X-Gm-Message-State: AOAM532giaKZgC7Ip/0fruUUVoU4RgEVvwBSAhArt3PobMCNhxg6e0Xq
	rg/4teD4giby9KYRlLn+rPo1NHkEoc3iHn8Rehs=
X-Google-Smtp-Source: 
 ABdhPJwNr6mEVIU1Vg+CRmMP2A6ecj6WowWNIjfQ74fODvHHG326q2YiVkbxw1ndHMO9gas5DgKAU+v1HCTBthJt9jk=
X-Received: by 2002:a05:6122:14b4:: with SMTP id
 c20mr42332673vkq.30.1638807745124;
 Mon, 06 Dec 2021 08:22:25 -0800 (PST)
MIME-Version: 1.0
References: <20211204071323.2480163-1-alex@linutronix.de>
 <20211204071323.2480163-5-alex@linutronix.de>
 <b5d775737830c3ca7864bf650eac4b5ac2cbe19a.camel@linuxfoundation.org>
 <CAMKF1sq9wA5knwViKTFqEo6-YY1jm0fKgQ0JyWRRS7-=jYtw=g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sq9wA5knwViKTFqEo6-YY1jm0fKgQ0JyWRRS7-=jYtw=g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Dec 2021 17:22:13 +0100
Message-ID: 
 <CANNYZj89dFBTTL6T7_6vaPNhCoQoxSVu++c-gE7aj78ygTWnVA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/26] python3: drop unneeded multiprocessing
 module patch
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Hongxu Jia <hongxu.jia@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000080ddf305d27ca9d8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 16:22:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159254

--00000000000080ddf305d27ca9d8
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Dec 2021 at 17:13, Khem Raj <raj.khem@gmail.com> wrote:

> There is a slightly different explanation here. libpthread was merged into
> libc
>
>> so this fix becomes a null-op on glibc. Not sure if musl has a separate
>> pthread
>> but if so we could/should test that?
>
>
> Musl has always been a single shared object from day one infact glibc is
> now moving in that direction so it will work fine on musl
>

Yep, I just verified this on qemux86 and qemux86-64.

Alex

--00000000000080ddf305d27ca9d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 6 Dec 2021 at 17:13, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">There is a slightly different explanation her=
e. libpthread was merged into libc<br><div><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
so this fix becomes a null-op on glibc. Not sure if musl has a separate pth=
read<br>
but if so we could/should test that?</blockquote><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Musl has always been a single shared object from day on=
e infact glibc is now moving in that direction so it will work fine on musl=
=C2=A0</div></div></div></blockquote></div><div class=3D"gmail_quote"><br><=
/div><div class=3D"gmail_quote">Yep, I just verified this on qemux86 and qe=
mux86-64.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quo=
te">Alex<br></div></div>

--00000000000080ddf305d27ca9d8--

