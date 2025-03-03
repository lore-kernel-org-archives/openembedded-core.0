Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 926D8C282C6
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 11:20:34 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web11.50806.1741000832691527435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 03:20:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SIOh649E;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-86b2b14303fso1765064241.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 03:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741000831; x=1741605631; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qgA6L1HKM5mmrJ9rWhbajsniu9gHW41tFB3EM4i/pug=;
        b=SIOh649E4UyUy5yn4K6zY1Z5V1BB7RBOsUk+PYNK+VVe8fJSIZQwO+qF5N3T6Efg3U
         r9ukWS/CEVmb31loNehyeYPqOiAydV3AclFMIszSDneCIIykvV35k9JviJg+I5ugi4Mo
         i+oUHAlPs4ZSB9TTNytnwdk67jY8KUVH47Y7q1eZvjZ5JbDmXLF4kkND+jeesloIdO+I
         rRJOhWLt5QQJb4GBF1j8U35+4JdFbata0IauLDREEgb+XYOk2bHRjzZ5ANO0wvs70A0F
         LUCsXatkNrV1czj8o0thyB/avirdag++GCGKvtSkT5tBsfNNeUHsSB5lt7vA6eQTj6bh
         EHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741000831; x=1741605631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgA6L1HKM5mmrJ9rWhbajsniu9gHW41tFB3EM4i/pug=;
        b=DOr2y9MbFJdXnhXnbmNlBkrJ/FWtqn84yEA4uEizE1QzbbHK57gDNhphm6oXg+buJb
         U2PAXafsJuIJsQgonSfd9pdKQ11KxtSOYAEfYIsrGIheMvzBr8SOiooKvlF0PaIXgZD/
         ZwpbI0l47kzZyu53X3yasvNwIqagVe038I/M0Ekj3czh6pM1D9KfVJ07bCRfOSmGFWDU
         luwVyAUxCLb13ESjyDqDdMTR5T9MZcdKlKeIEWu6rE4fY+NQI+0/OKAVHXURWs2Ycom3
         GaONNjpuvGHDW6LSbwmqhzEHsq7NHEkMqzQBqXBqBnNWafw0s9Edww3qH7PgseNbdYBY
         vLHA==
X-Gm-Message-State: AOJu0YwFcj+RTXzXjGtyZxGytf++E0b3mXjBk3d47/5TdQ94MkQK3tUP
	SC1PgIVU7sJsmpjnun7N8l7D8P0it4baDhbpmobyo1IaL3bjijzfm1XsWqBpbxnR4Jm0nSh/iq5
	mqIpvaLD6bcG4ly0TqvA3grk+m+WKBRtD
X-Gm-Gg: ASbGnctBAcACg1K4koLmb2pQqL5YRKyK+GLBpgjjOjckv+Nz5Q3tKou3k+f12M7q3FJ
	YV5GeAo6Im0IbgtNqZqBBJ9GF2/rs3FBetqMCxQkMxKNHt+ekK/xSuPP/KZqQfUS9t8HjRpHX0q
	Qb6sL4i7tWMWdqOmCv4GZC+/gtpt/f
X-Google-Smtp-Source: AGHT+IEL7eh6o0/SAWDAN4OZp7PSz5BnGrxa31Lix1OsmpYfh+PIoh6Ysmc26H8BVsInh+1FiYAw/Gn3lcCBWxqvX28=
X-Received: by 2002:a05:6102:80a6:b0:4b6:d108:cac1 with SMTP id
 ada2fe7eead31-4c0448c55a1mr7507360137.9.1741000831279; Mon, 03 Mar 2025
 03:20:31 -0800 (PST)
MIME-Version: 1.0
References: <20250228155301.1033479-2-jose.quaresma@foundries.io> <18989.1740815368979555054@lists.openembedded.org>
In-Reply-To: <18989.1740815368979555054@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 3 Mar 2025 11:20:20 +0000
X-Gm-Features: AQ5f1Jo5j4cMSVd1dPdL4M4I83EZlHpxWHkIjqUNi6lAX-PGZrwtqyfHgBTg3o8
Message-ID: <CANPvuRnG5GTouOVBUa-t8_8E4r=XuycGWk4xpX8n7KNM2-4Y4A@mail.gmail.com>
Subject: Re: [OE-core] [RFC OE-core][PATCH 2/4] goarch: switch the default
 linking to static
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001a3529062f6e586e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 11:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212203

--0000000000001a3529062f6e586e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hongxu via lists.openembedded.org <hongxu.jia=3D
eng.windriver.com@lists.openembedded.org> escreveu (s=C3=A1bado, 1/03/2025 =
=C3=A0(s)
07:49):

> I am also working to upgrade go to 1.24.0 and fix the buildpath issue, I
> will send review later
>

Thanks for working and fixing the buildpath issue.
I think this patch still makes some sense and I will probably submit it
again but not now.

Jose


>
> //Hongxu
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212086):
> https://lists.openembedded.org/g/openembedded-core/message/212086
> Mute This Topic: https://lists.openembedded.org/mt/111436384/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000001a3529062f6e586e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">hongxu via <a h=
ref=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;hongxu=
.jia=3D<a href=3D"mailto:eng.windriver.com@lists.openembedded.org">eng.wind=
river.com@lists.openembedded.org</a>&gt; escreveu (s=C3=A1bado, 1/03/2025 =
=C3=A0(s) 07:49):<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div>I am also working to upgrade go to 1.24.0 and fix the buildpath issu=
e, I will send review later</div></blockquote><div><br>Thanks for working a=
nd fixing the buildpath issue.<br>I think this patch=C2=A0still makes some =
sense and I will probably submit it again but not now.<br><br>Jose<br>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<div>=C2=A0</div>
<div>//Hongxu</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#212086): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/212086" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/212086</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111436384/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111436384/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--0000000000001a3529062f6e586e--

