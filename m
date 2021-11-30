Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C45C433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 20:13:40 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web10.82600.1638303219612241825
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 12:13:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I8K1Hhfj;
 spf=pass (domain: gmail.com, ip: 209.85.221.180,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f180.google.com with SMTP id 84so14456395vkc.6
        for <Openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 12:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=akBRjqR0NxX3xQ0TSbvbIpTWYFnzdadcV8dPu+kz4nQ=;
        b=I8K1HhfjpYbvnEXr5ZlqbjfBnFXGfn0M7vlR6+Tgi6rzrKuyXPMEU/z4QAv5q9P96+
         c0bYs1Wpva73ADKDSgGP6E7kzfC55zgdA1pSFzJFnB6FuddSA8dnjYWwObXl7WmVasVO
         w1d4OsJrJ6CyVIy/ubsDme1CTNYAzEgN7Vya7gOUvKLwSSDoiKpfz1WJosez/TiIgfqv
         VMF+dEE3W1QE/KEtFvUon34FYrRzWyL9ADcHS0u9BOrzGNiOCYJn4lgKp2nF/B0cDRRC
         7KHw87nSctjrqtHeRwOKRx4ClMIiDKknThIyQvcZGRrwIDfmaOybhYC8VLIcPV52jn3R
         zf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=akBRjqR0NxX3xQ0TSbvbIpTWYFnzdadcV8dPu+kz4nQ=;
        b=sT4IWAdmloagOBPn0HwkAkCy0+VDQBVS9GVAPmPfKajioENvogIBMKX05kVDAK3Vjb
         LmXGLiT3OxW2d0soasrcu7h8w5VTcEOR7rkDg6pwloqQPrLsHJO84oOcTcnk/g9dCz7v
         tgpWIim0PhJJvx/1nPMA/vlwxqtAlMJdKaxKaEAqr1zWFSIifXP5m+G1AJ9R6HYQsOdj
         Hbh8I4LGYQdkU9JSC6ok2358rf5Hmy0MWYkgPbOXSCznozk37gOE+jQA0Toso0+eri38
         QW3wHOeX2Faz4fZI4yj4FN1AKLOyIq1rXylDYZOHbZSKCIX/psM7dXvDOiEAdKDCDGW0
         zvJw==
X-Gm-Message-State: AOAM533qhQQ2XU2hV69+0T+YugzUKeHFqTLvGqqr39znXXwDcuV+zO+a
	bfCi4B4pAsZhQ3pQ385Jvtj67fG4vXwu0eNXoho=
X-Google-Smtp-Source: 
 ABdhPJzbPvGjjqu//vIlL1IUNhQjWP9l1b0nx2QbvexMyiFHP7uRAROL56hL00GFQfcukCUkh1TDninFhGJQwKzv1U8=
X-Received: by 2002:a05:6122:14b4:: with SMTP id
 c20mr1779170vkq.30.1638303217317;
 Tue, 30 Nov 2021 12:13:37 -0800 (PST)
MIME-Version: 1.0
References: 
 <CABKMkPJoE74O2OnAe7WsLSu56Ww4ZfPfxksZ43-Np43otAhRWA@mail.gmail.com>
 <CANNYZj-DYfd_erYQYNzATL5K_rUMfDrrvzsWD2h0n_=_kXTBxA@mail.gmail.com>
 <CABKMkP+1pDhZqzGwz-6baUnhEhsOopGonP5d7njNJ0WxsfgLEA@mail.gmail.com>
 <CANNYZj8+jV09y-p1Fciw6xY_PHabj1DtEdG0ywxGpBOgHrUoyw@mail.gmail.com>
 <CABKMkP+P1cZbuTL-tDFB-TeLB=AAwCc_zWy_D-+C_cDkz19onQ@mail.gmail.com>
 <CANNYZj8EGG17430TY6en_xqcixWXTZ0PTgjfwKerre7EN2O+cA@mail.gmail.com>
 <CABKMkPLw3w+3SSXUVfnKcqfsM-QWeUJ=DpPap=aoXJ=Bt8mD=A@mail.gmail.com>
In-Reply-To: 
 <CABKMkPLw3w+3SSXUVfnKcqfsM-QWeUJ=DpPap=aoXJ=Bt8mD=A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Nov 2021 21:13:25 +0100
Message-ID: 
 <CANNYZj83cBVit2P32A7bRJizf7AS+3jEcBGS-k83gqy7kRQvrA@mail.gmail.com>
Subject: Re: [OE-core] [RFC] meson needs a pkg-config wrapper script
To: Joel Winarske <joel.winarske@gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004d7cd805d20731f7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 20:13:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158993

--0000000000004d7cd805d20731f7
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Nov 2021 at 21:00, Joel Winarske <joel.winarske@gmail.com> wrote:

> Yes, if the sys_root key value in meson.cross is present
> PKG_CONFIG_SYSROOT_DIR gets set.  Honister patch I confirmed with:
>
> https://github.com/jwinarske/manifests/blob/honister/rpi64/0001-Add-sys_root-to-properties-section.patch
>
> The issue is that meson doesn't pass PKG_CONFIG_SYSROOT_DIR to the shell
> environment that runs pkg-config, as with the pkg-config sandbox test it
> does work.
>

Both meson source code and its documentation indicate otherwise - if you
set sys_root property, it will get passed to pkg-config via environment as
PKG_CONFIG_SYSROOT_DIR:
https://github.com/mesonbuild/meson/blob/master/mesonbuild/dependencies/pkgconfig.py#L121

Alex

--0000000000004d7cd805d20731f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 30 Nov 2021 at 21:00, Joel Winarske &lt;<a href=3D"mailto:jo=
el.winarske@gmail.com">joel.winarske@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Yes, if=
 the sys_root key value in meson.cross is present PKG_CONFIG_SYSROOT_DIR ge=
ts set.=C2=A0 Honister patch I confirmed with:<br><a href=3D"https://github=
.com/jwinarske/manifests/blob/honister/rpi64/0001-Add-sys_root-to-propertie=
s-section.patch" target=3D"_blank">https://github.com/jwinarske/manifests/b=
lob/honister/rpi64/0001-Add-sys_root-to-properties-section.patch</a></div><=
div><br></div><div>The issue is that meson doesn&#39;t pass PKG_CONFIG_SYSR=
OOT_DIR to the shell environment that runs pkg-config, as with the pkg-conf=
ig sandbox test it does work.<br></div></div></blockquote><div><br></div><d=
iv>Both meson source code and its documentation indicate otherwise - if you=
 set sys_root property, it will get passed to pkg-config via environment as=
 PKG_CONFIG_SYSROOT_DIR:</div><div><a href=3D"https://github.com/mesonbuild=
/meson/blob/master/mesonbuild/dependencies/pkgconfig.py#L121">https://githu=
b.com/mesonbuild/meson/blob/master/mesonbuild/dependencies/pkgconfig.py#L12=
1</a></div><div><br></div><div></div><div>Alex<br></div><br></div></div>

--0000000000004d7cd805d20731f7--

