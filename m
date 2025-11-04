Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA5BCCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 13:06:02 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17075.1762261556710462219
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 05:05:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cGEY8Wxu;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b9f1d0126e6so1196444a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 05:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762261556; x=1762866356; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnEphqIdl7cy0dU1BEl5pGF/KDQlWVIbfoIDWzbeZJA=;
        b=cGEY8WxuzFv6iDLfsIhkuNIe28Ny1zgS3FtBotkOYq0HxiyhaFrFJGHxdXgQxMYVJG
         4mWeByh/xo0awOMSXs/4YOGm2oYDgaD7WLORN2czqN0vf0JNBh7HUQVvXGoW4bIibZAK
         VPm79QVNBy4iyeiO/jCQO1mKKLb2YGOBA5mFuycNHDUuOclnXwnLMkMNaCSSSYoP1zwm
         Crc2kJdykvEvVXiG6bCo1qQbDZmBf5uarXeR0T5CL/p+H+nG8/byMQprdR6OI337Cx88
         R/WWLwBbFrBCcvq3X+1AtQcbj9huA1/Ggv5aOIHSui3eommlvhfxll+pSuaA5/NyAuck
         YGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261556; x=1762866356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnEphqIdl7cy0dU1BEl5pGF/KDQlWVIbfoIDWzbeZJA=;
        b=p8mfUTD/rE897c8mm6RQG1ayZMs5LviBPHPsUAFaNyxSXzOJKXC3XqYjDZlc4h/xnv
         z9gjNLCKSJeL9HhwhsYiaC1sPWh2tREE3cRO5cWM1ymr1ItZ6mEXj8StMsgdSzj0eRD+
         pytBnSMV85e09olmjahlRoeVrEvfWbhG0QR7sE0XPNQNva1EmtYSkY1QdEjEufRsKEU3
         rXPMOWR2suphweBTVSZoM4t80erGqUadsBhfk1XcjvZi/n9unYHZovX9qY+17hd6L7ei
         MlskJxadD7cILjVwLNO/PPJ4yJq4CJfnGZl+ARH1ZQtVUaEz7CD8xVoR6b69Rsza/lKd
         NqyQ==
X-Gm-Message-State: AOJu0Yy176/ozObSBVP45d75JStLLxtaCGNlCdvGLD90WGP5IanCwqKq
	tizO30QkvaeWP1tumy3R5wy38pfs9E9Ww12ydPsih/evcgeBfkypdVlKscVqde/oikchWCEu81e
	jttVtC/g6ZvztO41DvDQkPRrhspRgI74=
X-Gm-Gg: ASbGnctsBbMGIuqcULSBS01laI0KporQ9bsNOWDkRDhTZ/FASEeXwMkI3oF/PG6LIYo
	cRxcelnWzDtWryxtNNHBHnSz3tYqSIiEp7kQ0pmTiD+PIuANVPQT96PIk4muGh+LpyJUQjAr3Jv
	uozJy08OCHcNMONXvePu+BZ/arephvwbQe8VzvOe4WExuxUgo211qkzqqmxIqRajJg98J73Ghdi
	pPlMWsD+YSvUWM5Q2ld8fY06NjPJYX3+YJjh2ZSIpSvyTcQu0evo86/m4KI5A==
X-Google-Smtp-Source: AGHT+IFUStBS1kZl8Ep2GeBg2YfaDiEirzUyh9QbCCNPDkP+m5u4QA0euUB5FT7ffzbp+rtSNZoIFg92KeLTHWpfwZE=
X-Received: by 2002:a05:6a20:4310:b0:334:8d0b:664e with SMTP id
 adf61e73a8af0-34e29d62124mr3825562637.19.1762261555818; Tue, 04 Nov 2025
 05:05:55 -0800 (PST)
MIME-Version: 1.0
References: <20251104073805.8102-1-peter.marko@siemens.com>
In-Reply-To: <20251104073805.8102-1-peter.marko@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 4 Nov 2025 08:05:44 -0500
X-Gm-Features: AWmQ_bnwd-6XevxeJPPQXhOaa2BJExzNACuYUznu2jw3ERU0NULEy5n-EA8ZGsU
Message-ID: <CADkTA4OnP1YKA6eJK1ABM-_4HmoRarH1vS_xiO3TG_zwj8QxZA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] yocto-bsp/6.17: correct branch name
To: Peter Marko <peter.marko@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000935720642c47e73"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 13:06:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225721

--0000000000000935720642c47e73
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've already fixed this.

If I decide to go forward with the series, it will be in my next full send.

Whoever is queuing patches, don't bother to grab this.

Bruce

On Tue, Nov 4, 2025 at 2:38=E2=80=AFAM Peter Marko <peter.marko@siemens.com=
> wrote:

> 6.16 in branch name for 6.17 kernel does not look correct.
> $ git branch -r --contains 459fdea93914f4db040bd8ebf8bce134a4cd6388
>   linux-yocto/v6.17/standard/genericarm64
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappen=
d
> b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend
> index 51b61b1552..603a967f2a 100644
> --- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend
> +++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend
> @@ -7,5 +7,5 @@ KMACHINE:beaglebone-yocto ?=3D "beaglebone"
>  KMACHINE:genericx86 ?=3D "common-pc"
>  KMACHINE:genericx86-64 ?=3D "common-pc-64"
>
> -KBRANCH:genericarm64 ?=3D "v6.16/standard/genericarm64"
> +KBRANCH:genericarm64 ?=3D "v6.17/standard/genericarm64"
>  SRCREV_machine:genericarm64 ?=3D "459fdea93914f4db040bd8ebf8bce134a4cd63=
88"
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000000935720642c47e73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">I&#=
39;ve already fixed this.</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>If I decide to go forward with the series, it will be in my next full send=
.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">Whoever is queuing=C2=
=A0patches, don&#39;t bother to grab this.</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">Bruce</div></div><br><div class=3D"gmail_quote gmail_quot=
e_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 4, 2025 at 2=
:38=E2=80=AFAM Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com">p=
eter.marko@siemens.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">6.16 in branch name for 6.17 kernel does not look cor=
rect.<br>
$ git branch -r --contains 459fdea93914f4db040bd8ebf8bce134a4cd6388<br>
=C2=A0 linux-yocto/v6.17/standard/genericarm64<br>
<br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
Cc: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend | 2 +-<=
br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend =
b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend<br>
index 51b61b1552..603a967f2a 100644<br>
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend<br>
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.17.bbappend<br>
@@ -7,5 +7,5 @@ KMACHINE:beaglebone-yocto ?=3D &quot;beaglebone&quot;<br>
=C2=A0KMACHINE:genericx86 ?=3D &quot;common-pc&quot;<br>
=C2=A0KMACHINE:genericx86-64 ?=3D &quot;common-pc-64&quot;<br>
<br>
-KBRANCH:genericarm64 ?=3D &quot;v6.16/standard/genericarm64&quot;<br>
+KBRANCH:genericarm64 ?=3D &quot;v6.17/standard/genericarm64&quot;<br>
=C2=A0SRCREV_machine:genericarm64 ?=3D &quot;459fdea93914f4db040bd8ebf8bce1=
34a4cd6388&quot;<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--0000000000000935720642c47e73--

