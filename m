Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A842BC5AD4E
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 00:45:29 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20284.1786322723713237497
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 17:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HRABEzsP;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b15dcaca31so1257992e87.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 17:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786322722; cv=none;
        d=google.com; s=arc-20260327;
        b=UmrheNLnh6OdNgq+HAMcErlyR1QA7IPs3vn0nI3WhHQGT6DgNAP6rhIYlr1NhOEgj7
         WWtK/wDgK33nxtBz7+bvHalC2PCCwS7OdYtNvYydQzlEELiSCRa9IsSLN98CGt6lTMHt
         iceNw9wCDFYJEOsKqq3ri6F0IPX5ZgNUDPn0fHj8FKxCRoE9OmcBs2s8Gx/MGWg921ZQ
         oDpd4kzX3p/Dj5WvWJ9rK1QM/5PjA0SLIOHZZy98R40sq8SBPygvVRXU4SVfza7/bOt0
         zfvM/5OSo9J3pL5eSwVW7neXniheCRwktOv8HOvl5OkNX3D9HLEbIS/Mqm4G+BHj9Kzg
         iG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H1cPjRNz7RD1EzF3Gbx8oTqXikLhioHLtpe4Zt7W+WI=;
        fh=r2HniydW6rAF8eOyyIsBLfvKd1mq7Lta9RXtVye45zM=;
        b=eozEfZ0PyTn4XYCyXNqqbu6O6HB7hwIEd9y5avxczA8YQEzQ1zMnCqciIzYHClAHLb
         A66hdEIWVcmYXChtAkBRoUnmuPFboWitaVKJxBKzauISwD2eWKoGdVCWqTAekmppn2R2
         lYUmT5SQA/6WrC0F5oLOZv3TQ9lZWNegT0ejHxIjtaL/xtVhkQxiliUVk0n1BJKo+lYP
         o20h7WgYQWKHnlILxdtPGbhYTss21deFSRkZX54oddqIR4xmSvKPlieH9OwtlMiFipZc
         HOQca1/RUpZ+Vi1KNU07+ik9S4dRVxN90CULIYtOf2TH7/c3T1m6fRy0uPoglwrwqGVA
         124Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786322722; x=1786927522; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H1cPjRNz7RD1EzF3Gbx8oTqXikLhioHLtpe4Zt7W+WI=;
        b=HRABEzsPN99nVtF6NLCwfy25OkiWLO7MK51zDrtpHLNaengVGNrgvz5jUEkD037Xzk
         c2CIXnNkVjevsebuAGgx7HdeBvbpbn99Iq0NM7zmrYIEs2R/uAqUxL+YBhbiV6hq2NNG
         wFqg9igEMHNm+L3V23VEQ5F4jxa0DjGhJ/zJ05OCDuhH1NVxirZqqtzn0oi4EcSK3JSi
         KJORMCg9eiu3eDri6stbehJdlPARXrLrQtifOD9FSfw708Lmc7Kx9vBDqbL4YhQnZpY7
         JLGeiajmaeDTq2j4zu1C0EBR5/2INYgjZ1F6H3CR1h6aRiluQSLRHHnunGxDvgXYsY89
         293Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786322722; x=1786927522;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H1cPjRNz7RD1EzF3Gbx8oTqXikLhioHLtpe4Zt7W+WI=;
        b=cO6Kgva93NCKekNhXA8LFEUPMWnxG66D0Q5Rv0V8YuMKWVlTpeJn3fMTujFuMjZASp
         GDWMUecBQt0mcM8umGia4NvZCnEsmLf5bbR/9cFekDp9+MPyZUMada5NLyH7aJJohWvv
         ixDsPpp+ASKPFJdk/2qP3RX/vjUIywAsb+za/dZEPmihsHeGq4TqxFTKPLJ/FJUBs8xi
         zofCRXq6IA5/gu+a4/+asrYZbxAt1qEZBoAMATohkTYmAg1OMi7REMf6p7ktfsK216mb
         CV7cebKEUkGlSCdmpPhCadz0mjZLvbIlJqc0WGvZ+XZTsb0A5iPmyheqgagvKzjbsHUw
         Vs5g==
X-Gm-Message-State: AOJu0YyxM3k0q9lQdQXMosh2X1EUbFjormJkBtll0dZaOaK5pjpggSNl
	220+o/9ee4nxo1MWdZUa8NGbqi8+PkNkD3zVNv6q4Xz4qNEFIaCHGn3Dv1XDUsZBx/aQjKzWo++
	c8nm40w8SVK5P2w80v3RudvLY4HDMeFY=
X-Gm-Gg: AR+sD11vqUNF6udEm87488+d5JdUPbfQgwwE5Xwt3KKIGQlET59VAw1CLDg0tg+BShu
	HIFjf3WB79M3QWM6oWGIhhv0Cr2NBMyzX/ooLBWmVe7AZoGckNefUv7yNzkVAtjm2iQb7wbZdwo
	U8LMFkM6kX6nDzkPNVAsGMtkhiaCn/FFt/YLkAT1QyO4/Ocdps6rWSoYtMTBr3lzG2IAf57kElQ
	J847ebjhlRQ14FchDNtTx4iNV6yuF2GSa31BzFZB4qL/zFMuWXcPaofimcCzUgZuRn8Ux4zth1W
	zBI4G7KQEp9hK15iBFvEsl3t7v9FFptOG3/o5XJh/vb8
X-Received: by 2002:a05:6512:128d:b0:5b2:a1f2:465c with SMTP id
 2adb3069b0e04-5b2f4cc9127mr5191231e87.29.1786322721305; Sun, 09 Aug 2026
 17:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260809232107.367378-3-tim.orling@konsulko.com> <20260809232107.367378-5-tim.orling@konsulko.com>
In-Reply-To: <20260809232107.367378-5-tim.orling@konsulko.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 9 Aug 2026 17:45:03 -0700
X-Gm-Features: AUfX_mwHiHKhrGJDxBWi8ZWfr7eio0FXEkYaaDsDj_uqaufyPBopYkUVkjNtrXA
Message-ID: <CANx9H-BeRd_NPk-YWA_KCAO0C+_ZhHDeezx8dcaWqo=smDQrKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/5] python3-attrs: fix CVE_PRODUCT
To: tim.orling@konsulko.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000041f7620658a6abb5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 00:45:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243088

--00000000000041f7620658a6abb5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This might not be correct. Hold off until we verify the CPE upstream.

On Sun, Aug 9, 2026 at 4:21=E2=80=AFPM Tim Orling via lists.openembedded.or=
g
<tim.orling=3Dkonsulko.com@lists.openembedded.org> wrote:

> From: Tim Orling <tim.orling@konsulko.com>
>
> No new CVEs are caught, but attrs_project:attrs matches the CPE upstream.
>
> AI-Generated: Claude Sonnet 5
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  meta/recipes-devtools/python/python3-attrs_26.1.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3-attrs_26.1.0.bb
> b/meta/recipes-devtools/python/python3-attrs_26.1.0.bb
> index 03621e41a6..1c28809728 100644
> --- a/meta/recipes-devtools/python/python3-attrs_26.1.0.bb
> +++ b/meta/recipes-devtools/python/python3-attrs_26.1.0.bb
> @@ -7,6 +7,8 @@ SRC_URI[sha256sum] =3D
> "d03ceb89cb322a8fd706d4fb91940737b6642aa36998fe130a9bc96c98
>
>  inherit pypi ptest-python-pytest python_hatchling
>
> +CVE_PRODUCT =3D "attrs_project:attrs"
> +
>  DEPENDS +=3D " \
>      python3-hatch-vcs-native \
>      python3-hatch-fancy-pypi-readme-native \
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#243084):
> https://lists.openembedded.org/g/openembedded-core/message/243084
> Mute This Topic: https://lists.openembedded.org/mt/120677496/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000041f7620658a6abb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This might not be correct. Hold off until we verify the CP=
E upstream.</div><br><div class=3D"gmail_quote gmail_quote_container"><div =
dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 9, 2026 at 4:21=E2=80=AFPM Tim=
 Orling via <a href=3D"http://lists.openembedded.org">lists.openembedded.or=
g</a> &lt;tim.orling=3D<a href=3D"mailto:konsulko.com@lists.openembedded.or=
g">konsulko.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">From: Tim Orling &lt;<a href=3D"mailt=
o:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.com</a>&gt=
;<br>
<br>
No new CVEs are caught, but attrs_project:attrs matches the CPE upstream.<b=
r>
<br>
AI-Generated: Claude Sonnet 5<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" ta=
rget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-attrs_26.1.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-attrs_26.1.0.bb</a> | 2 ++<=
br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-attrs_2=
6.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-attrs_26.1.0.bb</a> =
b/meta/recipes-devtools/python/<a href=3D"http://python3-attrs_26.1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-attrs_26.1.0.bb</a><br>
index 03621e41a6..1c28809728 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-attrs_26.1.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-attrs_26.1.0.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-attrs_26.1.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-attrs_26.1.0.bb</a><br>
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] =3D &quot;d03ceb89cb322a8fd706d4fb919407=
37b6642aa36998fe130a9bc96c98<br>
<br>
=C2=A0inherit pypi ptest-python-pytest python_hatchling<br>
<br>
+CVE_PRODUCT =3D &quot;attrs_project:attrs&quot;<br>
+<br>
=C2=A0DEPENDS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-hatch-vcs-native \<br>
=C2=A0 =C2=A0 =C2=A0python3-hatch-fancy-pypi-readme-native \<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#243084): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/243084" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/243084</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120677496/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/120677496/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000041f7620658a6abb5--

