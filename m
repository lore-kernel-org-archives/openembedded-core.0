Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFACC6FD1F
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 19:03:44 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.54291.1710961415821303555
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 12:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iBtPnQDW;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: joel.winarske@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5cfd95130c6so111690a12.1
        for <Openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 12:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710961415; x=1711566215; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SW5ThN0Ifo3/g6sxeruTLt7AV2FtUKuJV885yHs2sIE=;
        b=iBtPnQDWCKFiNjl1bipLzUGJuKkMy2pjoCFQqgBOWQw0xuXUBj3yfySfZe7t2L33o5
         55No/rmZmsSGF4fftzgQWCB6EgcBw/+Gqu0i3CNr0fJ6m5gCYLUpWvUQzomETyH19pAx
         fUT19W0nCr8KXQesZ3PUEfg+ziOBLnPpl6HOTA2e328qlKh2ftPvMIOvhbFyCcoe/gGf
         VMc0kgaepDkHhfz8ApR3mvEn3Lvb/Bppb6T2g5ApSzA+/m0xzsKTL95MYisOL3bZ/f05
         OZMFA+s8vAH/RUhGRBW67G9LvXZ98Vb5TG4H9E+ndaakvIZKKxa5n8ak/THnjTSdcW9J
         HE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710961415; x=1711566215;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SW5ThN0Ifo3/g6sxeruTLt7AV2FtUKuJV885yHs2sIE=;
        b=sS/3b7Ew0f/snhcUfOva+SsODy7AHm7zQEumZEUauiYgmZwNy3qJdDAiuT2Rx2Bac8
         eGLTwIQGsNDAb3ns3sSldwXAPOYBS5wfE5TaEh8/nfkYUUvuJ/w0CikwdSQtKV9724ZP
         MdEZsS5LkYD3KM60vsL3ZvJqvSDh4+zdaI7w6FW1iuEV5jHL2Bq8XijUDwPdSdsSWQqx
         WfUAI54NsaBzMpmc4uiJ0MkxMdjTgQThj9MmLgAI18q+7mG+ggpH/NehSZk7nR8wjHG6
         Jcd99nBYuFq/YTkkswAXWo0TMvlnlVkY8n9+1uZpCFiQpqGnaNILWPQV9QGhA/d/CSd5
         dz1w==
X-Gm-Message-State: AOJu0Yx+b3doZJqsB9LpqvWj5RuNyl2m14jdG4QSwlgJEODJha1mR1q/
	nsR4zssuYNR6coRLMqSm+J4ibF8UO1LUuciVhR063Shnga+2+OtlrNeDG7TgLA9S2b96xKk2skb
	WoxUzg8Jr1Dh9awQEe7aEMGdjSogui8Xe9HIHjQ==
X-Google-Smtp-Source: AGHT+IHWS8TyD2vBo0KVQ0su9W88hUWjJv8Id7OsQ78peMcZBJHfbPNAqMFbakQE2zK0cDiEUzrDn8uXt2/2YEN9DD4=
X-Received: by 2002:a17:90b:30d5:b0:29d:fb03:48b0 with SMTP id
 hi21-20020a17090b30d500b0029dfb0348b0mr5664096pjb.44.1710961414835; Wed, 20
 Mar 2024 12:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <CABKMkPKN__Jh6jvc_CfHtwp3HGbRsBJ3YxHxGb1RPPN2WWqRMw@mail.gmail.com>
In-Reply-To: <CABKMkPKN__Jh6jvc_CfHtwp3HGbRsBJ3YxHxGb1RPPN2WWqRMw@mail.gmail.com>
From: Joel Winarske <joel.winarske@gmail.com>
Date: Wed, 20 Mar 2024 12:03:23 -0700
Message-ID: <CABKMkPJEqBHRR1ab1O3VvwWB3Xr-2vTng-K84yZHqggObQJDOQ@mail.gmail.com>
Subject: Re: [master] riscv: libcamera stack smashing detected
To: OE-core <Openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000005b187e06141c3ffb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 19:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197402

--0000000000005b187e06141c3ffb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15449

On Wed, Mar 20, 2024 at 9:10=E2=80=AFAM Joel Winarske <joel.winarske@gmail.=
com>
wrote:

> In master there is a problem running the libcamera "cam" app on a RISC-V
> device:
>
> *** stack smashing detected ***: terminated
>
> If I remove the patches in the libcamera recipe, it builds and runs on
> target without issue.
>
> libcamera bug has the details:
> https://bugs.libcamera.org/show_bug.cgi?id=3D214
>
> Joel
>

--0000000000005b187e06141c3ffb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><a href=3D"https://bugzilla.yoctoproject.org/show_bug=
.cgi?id=3D15449">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15449<=
/a><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Wed, Mar 20, 2024 at 9:10=E2=80=AFAM Joel Winarske &lt;<a h=
ref=3D"mailto:joel.winarske@gmail.com">joel.winarske@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div>In master there is a problem running the libcamera &quot;cam&quot;=
 app on a RISC-V device:<br><pre id=3D"m_-3111826023075746143gmail-comment_=
text_0">*** stack smashing detected ***: terminated</pre></div><div><div>If=
 I remove the patches in the libcamera recipe, it builds and runs on target=
 without issue.<br></div><div><br></div>libcamera bug has the details:<br><=
/div><div><a href=3D"https://bugs.libcamera.org/show_bug.cgi?id=3D214" targ=
et=3D"_blank">https://bugs.libcamera.org/show_bug.cgi?id=3D214</a></div><di=
v><br></div>Joel<br></div>
</blockquote></div>

--0000000000005b187e06141c3ffb--

