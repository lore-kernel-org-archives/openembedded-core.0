Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5099CC83F1A
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 22:24:13 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.207.1752186251412706477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 15:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bbXTXVon;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-711d4689084so16164247b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 15:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752186250; x=1752791050; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iMKFuHgyQMlVccoWoSxoBs73AjkqK2u5oW70j1EDJ44=;
        b=bbXTXVonYeTTxVhUb1Mhiy1zE67Ofss0je/UWKh5Vyo0tZ4thQ9d7nYiQMBvy+2qA0
         wLjvqyk5OjZIUCrZLNAPVhXq/IdMoegrGmpLxk2drNLgCwDmZFfde+sdDcgS3vq/Y/0A
         eYFrLWRI4vuBR9AHmfXOqJhiCg919hFY29zL3JK2r89p2L/Ehw362dkEhBQ7gL48J8Ct
         b4Yaj4uOm83uzH/v578lYFcY4HckMiYaKDtd044jx0Z/vkk89l9LQAEwT5j88vJJ2HI2
         G239lYYt2vG5ouOiFsQGssyGOBRenVeitGMIwldJTPYclzzpOtKmjzBJu8UUMf9549lF
         lmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752186250; x=1752791050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iMKFuHgyQMlVccoWoSxoBs73AjkqK2u5oW70j1EDJ44=;
        b=p1Zv7VDrRl5w5aDE1Pn1+t7SkMOTJvkDzGxOHVUORci+0S7q16KKvmMlokJIp1K+tq
         0KFvEU9NJwz//ucPX40fl3UakiDsty2R9I/Ey1npDU/BhZmLKPdn6CVE9CO/38lVBfkF
         wpW6Wq9aYTxFh+BD1zJN0o6x5paEixfC5wkH4cF0g5e/Zozl4GFUAAgVhB7cJrRGZHpU
         Nvwd90C3XTwP/HvscoyD9Ga4pd6AtTzzOibmesfPqHwNJiaUGT8x7/NEzTQehZxiUwUt
         0BDz4RLaMGOK+tmtOyuyGF2kRpNnFEQ1Xst9/wxEfcXNLK/+qzPtEgvAP1/DTBN7+bfe
         SUSA==
X-Forwarded-Encrypted: i=1; AJvYcCUmNS3HshXkVy17r9RX5x0qVgqeZBSxaQ9foFgeXrHX+cF9fOmDn02nOFzJgd1cdG1S9JBFRQMUdBWiZQCWMUrzCw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyL6Rhf6lSUcKs3DXhEFnzxjKz+lirBzNt6/L9B17iDxgs4CAmf
	jqRpEgYBTtrOg0X9m2iAuUbIvn1K6FA/RUbDjT/XNqvmbMGFGoQUTzPM5bFRp9WxTGCDds53iPl
	L/WIyqEqFXJC6ry0yQxSvhT2EiaRSCI0=
X-Gm-Gg: ASbGncvAVAbdklBV5dvfzesF0l1APkaPlGcJc/P8Tu0o8a/dd6hTLa1PFNpyrStsUXT
	TjweY8fxXQKaewDLJ/X2mvaUC6dvO//8FBtP5mXtyuSdbfgChl5PtSGCifouaGKysqryrUHrZem
	rVs9bJKsUIYzD6ELRz9ZFcI00eQXnF4AzO2/U1SqRZ2cV1lnz8sXllbyAIxGNmYbahXjpI96owf
	3MTDYshMlZZ0CcBDK0tZW/bU9USshkUFLiES1q0
X-Google-Smtp-Source: AGHT+IG/lQb9dShpWuGpBi3ZH0FZ8RAbVskY1mfavFWWYoHf66pOKzBExFO7JMCV4+ZLnlPFXuBD4IYsTcLSwiVzag4=
X-Received: by 2002:a05:690c:6502:b0:717:7d22:8efb with SMTP id
 00721157ae682-717d59340dfmr23164017b3.0.1752186250339; Thu, 10 Jul 2025
 15:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250710153542.1196388-1-bruce.ashfield@gmail.com>
In-Reply-To: <20250710153542.1196388-1-bruce.ashfield@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Jul 2025 15:23:58 -0700
X-Gm-Features: Ac12FXxVH83j7x-OB7r_p-4jAoAJwm6ZNRq1ezy75wd0oJYm2QBdjr99NUtkZNE
Message-ID: <CAMKF1sq4XaRE35UKcpNzR-xwNU7avT9scPru6Lnw6Vs7Q2vqFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libc-headers: update to v6.15
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000008286606399aa7c6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 22:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220132

--00000000000008286606399aa7c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 8:35=E2=80=AFAM Bruce Ashfield via lists.openembedd=
ed.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> kernel 6.15+ will be our next reference point, so we bump the libc
> headers to match.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>
> Richard,
>
> I'll be following this with our new reference kernel in the next
> few days. But I was able to build all arches with glibc and muslc
> with this bump.
>
> I didn't see any fallout from packages that normally have to be
> tweaked when I bump tht headers.
>
> If we are lucky, this is a seamless update (one of the few), but
> either way, it needs some wider AB testing.
>
> If I go to 6.16 for the release / reference kernel, I'll bump once
> more, but again, either way it is good to have some valid points
> along the way to our final libc-headers version.
>

Ideally this should go with or after the kernel switch


> Bruce
>
>  .../{linux-libc-headers_6.12.bb =3D> linux-libc-headers_6.15.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.12.b=
b
> =3D> linux-libc-headers_6.15.bb} (80%)
>
> diff --git a/meta/recipes-kernel/linux-libc-headers/
> linux-libc-headers_6.12.bb b/meta/recipes-kernel/linux-libc-headers/
> linux-libc-headers_6.15.bb
> similarity index 80%
> rename from meta/recipes-kernel/linux-libc-headers/
> linux-libc-headers_6.12.bb
> rename to meta/recipes-kernel/linux-libc-headers/
> linux-libc-headers_6.15.bb
> index dd6add38de..70d2fd80ee 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb
> @@ -8,5 +8,5 @@ SRC_URI:append:libc-musl =3D "\
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>
> -SRC_URI[sha256sum] =3D
> "b1a2562be56e42afb3f8489d4c2a7ac472ac23098f1ef1c1e40da601f54625eb"
> +SRC_URI[sha256sum] =3D
> "7586962547803be7ecc4056efc927fb25214548722bd28171172f3599abb9764"
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220125):
> https://lists.openembedded.org/g/openembedded-core/message/220125
> Mute This Topic: https://lists.openembedded.org/mt/114084659/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000008286606399aa7c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 10, 2025 at 8:35=E2=80=AFAM=
 Bruce Ashfield via <a href=3D"http://lists.openembedded.org">lists.openemb=
edded.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.openem=
bedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.a=
shfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
<br>
kernel 6.15+ will be our next reference point, so we bump the libc<br>
headers to match.<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
<br>
Richard,<br>
<br>
I&#39;ll be following this with our new reference kernel in the next<br>
few days. But I was able to build all arches with glibc and muslc<br>
with this bump.<br>
<br>
I didn&#39;t see any fallout from packages that normally have to be<br>
tweaked when I bump tht headers.<br>
<br>
If we are lucky, this is a seamless update (one of the few), but<br>
either way, it needs some wider AB testing.<br>
<br>
If I go to 6.16 for the release / reference kernel, I&#39;ll bump once<br>
more, but again, either way it is good to have some valid points<br>
along the way to our final libc-headers version.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ideally this sho=
uld go with or after the kernel switch</div><div dir=3D"auto"><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><br>
Bruce<br>
<br>
=C2=A0.../{<a href=3D"http://linux-libc-headers_6.12.bb" rel=3D"noreferrer"=
 target=3D"_blank">linux-libc-headers_6.12.bb</a> =3D&gt; <a href=3D"http:/=
/linux-libc-headers_6.15.bb" rel=3D"noreferrer" target=3D"_blank">linux-lib=
c-headers_6.15.bb</a>}=C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-kernel/linux-libc-headers/{<a href=3D"http://linu=
x-libc-headers_6.12.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-hea=
ders_6.12.bb</a> =3D&gt; <a href=3D"http://linux-libc-headers_6.15.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-libc-headers_6.15.bb</a>} (80%)<br>
<br>
diff --git a/meta/recipes-kernel/linux-libc-headers/<a href=3D"http://linux=
-libc-headers_6.12.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-head=
ers_6.12.bb</a> b/meta/recipes-kernel/linux-libc-headers/<a href=3D"http://=
linux-libc-headers_6.15.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc=
-headers_6.15.bb</a><br>
similarity index 80%<br>
rename from meta/recipes-kernel/linux-libc-headers/<a href=3D"http://linux-=
libc-headers_6.12.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-heade=
rs_6.12.bb</a><br>
rename to meta/recipes-kernel/linux-libc-headers/<a href=3D"http://linux-li=
bc-headers_6.15.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-headers=
_6.15.bb</a><br>
index dd6add38de..70d2fd80ee 100644<br>
--- a/meta/recipes-kernel/linux-libc-headers/<a href=3D"http://linux-libc-h=
eaders_6.12.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-headers_6.1=
2.bb</a><br>
+++ b/meta/recipes-kernel/linux-libc-headers/<a href=3D"http://linux-libc-h=
eaders_6.15.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-headers_6.1=
5.bb</a><br>
@@ -8,5 +8,5 @@ SRC_URI:append:libc-musl =3D &quot;\<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc93980=
86aedcd7e46&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;b1a2562be56e42afb3f8489d4c2a7ac472ac23098f1ef=
1c1e40da601f54625eb&quot;<br>
+SRC_URI[sha256sum] =3D &quot;7586962547803be7ecc4056efc927fb25214548722bd2=
8171172f3599abb9764&quot;<br>
<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#220125): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/220125" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/220125</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/114084659/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/114084659/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000008286606399aa7c6--

