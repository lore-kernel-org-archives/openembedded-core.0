Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2707BC8303F
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 18:02:41 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.4181.1756404151866821763
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 11:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fCYkj8Oi;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-70d9eb2e655so15438456d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 11:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756404151; x=1757008951; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r318RpdwvwP4wP3y8v5JrBxibFFw62hDJ5j5bRmvNNA=;
        b=fCYkj8OiU5zEvd/PKV7+hodFviwuu2nbk4DtAEo7TN5NH3lA7v02baN6QV9RgTqFGX
         bCtDpWyAqMjbKFoTJ/uNCaorJkXEwEjoyYzNe2wOClJmrHafXHktL4STLuN4cC4cvXLF
         ytghAEQt5RpXg/tO69kD3Ya6IAEFVyPoe25jXdV9NqIMfmMHFiyoEG4iH4hhjBTUeoUk
         MjLQQp/Goj8ptwt3FLQwARTQteK/O3l4OyBiXUJClOma9mzeQCzYKQJR+8vxkuNbG1gz
         8bP42b6g3xdUDkS1mG8sSe8IXJlTd7ZPRYLh7aLvzTsSY76Gly8FpfLZZ5Ot8CObvjVk
         je4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756404151; x=1757008951;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r318RpdwvwP4wP3y8v5JrBxibFFw62hDJ5j5bRmvNNA=;
        b=hPnv/8mqH5lWg3dllVH8BPYt6o8/W1PwlQwYWoAV5Scw5dPEadE0GMqkiSsYtZRtSk
         LyA9RrSEltWUjQ4MC02S1rVEdw/dbzJTGKT2S5zHkGHnFze9AnpHaaUqFaiFpg9R8i34
         DHcFJXXRoD0+Ciw5l9hW0GXes7aWTwVxfcidvUUuKZhWrJ+TKwwD/NQbxB+62A3cxNOd
         pr7APWYclHCIxssl+jXzpFpLIpLzXrJYCeDDEN8em5KSWv3VyGiyRO5KkGN5uQeP5Dsi
         CMLATaXL5UhzuYt9mHYzzwTBbqRSMqCNl3wenPVSG94jBR+i6Yx5uxz3cLcO8KG+6/go
         l9zA==
X-Gm-Message-State: AOJu0YxetgD+yTEwb1ixzR04/niJ2vX0Q4MQErCwXOcZFf1XvW+gMDFf
	4SDch09oBKRwWYgWeKDCuPkKa+epEEGSAqMGEruHNPmNTNg65LxONCDZGiIOc2NFMbrvK8dpFJ2
	FRlIeWg5mc56qRXz3EnBltBxlEkBsDcA=
X-Gm-Gg: ASbGncsyNKd7KWxIUazTA2TpavY4PytV3KmUH95F2+hXi8SD1sFsoWE/5wttD/HHjM0
	bjsEQIyOqZKsOVeeh8weYyOOf3+giyaFyKBkJg5n7vCCKbPThdubt7OmZzDY5ST4yPl5BNVBD/i
	p9dVkBeKcbwvqoU6hG3b/ja6Jw/jc76G0UdLcNZwW2uyT3gdYQd1wdpnXxSSGBBSIHeFA0vgAKX
	+M1GZFMgdfGCUfGy3y5f5FUgP1YFO80xBvpOQ61toP6ay5GN3I=
X-Google-Smtp-Source: AGHT+IHsUQYGbpg8SnwjIl0uuT/5ZU1zQa2td0U06SLCeKnmMNGgSehZ5EUbMF9wSQ5JZ2BM8qXzRA0qAu2ErlKwCwo=
X-Received: by 2002:a05:6214:2421:b0:704:95c6:f5f1 with SMTP id
 6a1803df08f44-70d97200c8emr315510166d6.34.1756404150489; Thu, 28 Aug 2025
 11:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250828175323.858522-1-skandigraun@gmail.com>
In-Reply-To: <20250828175323.858522-1-skandigraun@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Aug 2025 20:02:19 +0200
X-Gm-Features: Ac12FXwa89nBgfcYBPv046J2p6RQsS4QcRk0RcHymiB_MN8vDcy_4WXiW0Hufp0
Message-ID: <CANNYZj_OZWmGvYmpRP6Ve28MKmmUYhU=gjdwFtfCabwi+oV4Pg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] xf86-input-mouse: stop checking for new versions
To: skandigraun@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000078d873063d70b563"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 18:02:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222585

--00000000000078d873063d70b563
Content-Type: text/plain; charset="UTF-8"

I guess the recipe should be removed rather?

Alex

On Thu 28. Aug 2025 at 19.53, Gyorgy Sarvari via lists.openembedded.org
<skandigraun=gmail.com@lists.openembedded.org> wrote:

> The application has dropped Linux support in their latest release[1].
>
> Keep the recipe in the latest supported version.
>
> [1]:
> https://gitlab.freedesktop.org/xorg/driver/xf86-input-mouse/-/commit/d719d0588c580ac0ffb8546e864c05c521b1ab9d
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb
> b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb
> index 92e54d9701..6f578155e1 100644
> --- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb
> +++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb
> @@ -12,3 +12,5 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=d213a69053dffe9bcab94abf60013d33"
>
>  SRC_URI[sha256sum] =
> "4fde8ae9b44352e2a208584c36528ee3ed13cf5fe4417208a9785daccefd9968"
>  XORG_DRIVER_COMPRESSOR = ".tar.xz"
> +
> +RECIPE_NO_UPDATE_REASON = "new version does not support Linux"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222584):
> https://lists.openembedded.org/g/openembedded-core/message/222584
> Mute This Topic: https://lists.openembedded.org/mt/114939437/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000078d873063d70b563
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I guess the recipe should be removed rather?</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gma=
il_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u 28. Aug 2025 at 19.53, Gyorgy Sarvari via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:g=
mail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)">The application has dropped Linux support i=
n their latest release[1].<br>
<br>
Keep the recipe in the latest supported version.<br>
<br>
[1]: <a href=3D"https://gitlab.freedesktop.org/xorg/driver/xf86-input-mouse=
/-/commit/d719d0588c580ac0ffb8546e864c05c521b1ab9d" rel=3D"noreferrer" targ=
et=3D"_blank">https://gitlab.freedesktop.org/xorg/driver/xf86-input-mouse/-=
/commit/d719d0588c580ac0ffb8546e864c05c521b1ab9d</a><br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/xorg-driver/<a href=3D"http://xf86-input-mouse_=
1.9.5.bb" rel=3D"noreferrer" target=3D"_blank">xf86-input-mouse_1.9.5.bb</a=
> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-graphics/xorg-driver/<a href=3D"http://xf86-input=
-mouse_1.9.5.bb" rel=3D"noreferrer" target=3D"_blank">xf86-input-mouse_1.9.=
5.bb</a> b/meta/recipes-graphics/xorg-driver/<a href=3D"http://xf86-input-m=
ouse_1.9.5.bb" rel=3D"noreferrer" target=3D"_blank">xf86-input-mouse_1.9.5.=
bb</a><br>
index 92e54d9701..6f578155e1 100644<br>
--- a/meta/recipes-graphics/xorg-driver/<a href=3D"http://xf86-input-mouse_=
1.9.5.bb" rel=3D"noreferrer" target=3D"_blank">xf86-input-mouse_1.9.5.bb</a=
><br>
+++ b/meta/recipes-graphics/xorg-driver/<a href=3D"http://xf86-input-mouse_=
1.9.5.bb" rel=3D"noreferrer" target=3D"_blank">xf86-input-mouse_1.9.5.bb</a=
><br>
@@ -12,3 +12,5 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd213a6905=
3dffe9bcab94abf60013d33&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;4fde8ae9b44352e2a208584c36528ee3ed13cf5f=
e4417208a9785daccefd9968&quot;<br>
=C2=A0XORG_DRIVER_COMPRESSOR =3D &quot;.tar.xz&quot;<br>
+<br>
+RECIPE_NO_UPDATE_REASON =3D &quot;new version does not support Linux&quot;=
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#222584): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/222584" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/222584</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/114939437/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/114939437/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000078d873063d70b563--

