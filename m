Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFAEBC46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 17:51:17 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.58743.1695059472725921581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 10:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RpxiZe9E;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-31dcf18f9e2so4605763f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 10:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695059471; x=1695664271; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=flYOouJ4YSF/bXi5VymvJy1KBHNky679jNxUTc740vQ=;
        b=RpxiZe9EQdo6GhEpQcpOQOW1ZkcSjeENrtEynDv/QJ94Ud6FDUQ1T2W9vCb/qhCKjp
         nuNEOaE2qycOQP0siLdpcWuJI7u3Sy6Pyg11HJlctbJsz5Yo3GC6LhZZSr4E7k7pSqXO
         sANa7++K0fXMR2RdSPP11nHcpoVjjAOUDC/eqOhSnLPVqjErHDz8oC0r75thKe9bdBRm
         QUrLjq7RdBUu94aF0ihQVfmjLNqcbEF/6OzHbOHHakINhEswFngA1Mip33QL68sqgsL/
         Flnm4QQbo/QsMbGpS3hIfgxcNzdZWgLdeZVff5LlrI31ETXpGu6NRmWoifEHC9Fo3Jst
         QwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695059471; x=1695664271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flYOouJ4YSF/bXi5VymvJy1KBHNky679jNxUTc740vQ=;
        b=Eg9nZWcNY+f3JL/LDSC0g42Al3h29IOm/gTfjQBKQ1LhXNy36gomPsR4nzRM6TrYAi
         V897jVngksXThATsHRpBnGViQzWFxfVwLWQIkk9mwFz7f3fkAXmnD8wAAso9W58/8vP8
         D1kEpY5bkbUilOutqSGiW2P0HgZOmF7Oo+Cv3gvW5Skx2E00zTv50PLaTwYKiE5YpLzj
         wewqeAOXIVr638SsmrRA+pwtanPf3VnNefKIQ/JzQMrg7yFuFLlbiAWXDm6nnuNE1H90
         f62GdsKIF5d+q4rt48fka7hga34yc6VC5zxCvHS5d9g2esU1SE8m0SS0emNPCo3FqorK
         Bc/g==
X-Gm-Message-State: AOJu0YyONx6UIJCSNCUu3ZaCEPe5Whsa/GR9Y1bBr2mnqAvzymCLmKHD
	51my95o2s5mdMpsdEwKXE0Jvn4eH2mtANQNTo+0=
X-Google-Smtp-Source: AGHT+IGe0A7XQDmVX8ppF5K0ku86Y4ha0AZpRZQVDT2aqpIYGjyYzgrehvMwe0wya+n1og2fS+TRIJqJ0EX3cRx87+4=
X-Received: by 2002:adf:a188:0:b0:321:63d0:1f0e with SMTP id
 u8-20020adfa188000000b0032163d01f0emr643549wru.20.1695059470770; Mon, 18 Sep
 2023 10:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230915204234.3547739-1-martin.jansa@gmail.com>
 <CAOSpxda40yQJrJCXhS-rtQ9T89auc52zwibD6qjCWYKSLZfB5g@mail.gmail.com>
 <DC0F0107-7850-4099-A201-6F6C1DB5D0CB@arm.com> <CAOSpxdYY8WWTknuN8Dayi8Q1fF1Q_=gJ67E7W3gJDEbx_eNG3g@mail.gmail.com>
 <CA+chaQeQ5F1HWdrS76XMS3NmTxgOcMUTWzHqrh5wZ3176qKb5A@mail.gmail.com> <CAOSpxdZFRS1P4+ZY1jQM=Y02DV+-6+C2drWthBdNJ8u5TxK_cA@mail.gmail.com>
In-Reply-To: <CAOSpxdZFRS1P4+ZY1jQM=Y02DV+-6+C2drWthBdNJ8u5TxK_cA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Sep 2023 19:50:59 +0200
Message-ID: <CA+chaQd0UnUM9N5omspxTHiU+CSYo3g=8ZkaaAXHZspKdcq9Cg@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH] gcc: backport a fix for ICE caused
 by CVE-2023-4039.patch
To: Steve Sakoman <steve@sakoman.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a0e5f90605a5c94a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 17:51:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187841

--000000000000a0e5f90605a5c94a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2023 at 7:21=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:

> On Mon, Sep 18, 2023 at 7:10=E2=80=AFAM Martin Jansa <martin.jansa@gmail.=
com>
> wrote:
> >
> > I've intentionally sent it only for mickledore as the gcc version in
> kirkstone and dunfell isn't affected by this (at least my reproducer isn'=
t).
>
> So, just to clarify, is it OK to take the CVE-2023-4039.patch for
> kirkstone and dunfell?
>

I think so.

--000000000000a0e5f90605a5c94a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Sep 18, 2023 at 7:21=E2=80=AFPM S=
teve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>=
&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Mon, Sep 18, 2023 at 7:10=E2=80=AFAM Martin Jansa=
 &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jan=
sa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I&#39;ve intentionally sent it only for mickledore as the gcc version =
in kirkstone and dunfell isn&#39;t affected by this (at least my reproducer=
 isn&#39;t).<br>
<br>
So, just to clarify, is it OK to take the CVE-2023-4039.patch for<br>
kirkstone and dunfell?<br></blockquote><div><br></div><div>I think so.=C2=
=A0</div></div></div>

--000000000000a0e5f90605a5c94a--

