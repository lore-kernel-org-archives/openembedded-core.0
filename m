Return-Path: <joaohf@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61453CD4F4A
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 14:49:22 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10071.1779115753446210662
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 07:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gMWMf5l0;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: joaohf@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7b301fdb5d8so2146317b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 07:49:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779115752; cv=none;
        d=google.com; s=arc-20240605;
        b=GcZLVEK3ikJ+EETqkf2lhi+S2GBCM3S1zMI2hQ3UshlPoOFcKc6NvyMkyRnA7cGTEf
         gfAvzQ/l1c8B6VGrAdPfLokkGEcP6vlZ9G4m36r9N+yH3n16wnouelWNDhMO6I5l7V6G
         f8QfAyzVGlVgN9OwIaSxft/IiGTp6Gn0mu5N323ISt2stAdL3iehCXKFzdzrgh35Pkxs
         jqUgLl00O1m7m0BThC8Ok3J0QUWjhLzxqvDyAUZzqNwxmcaGDX1+mrNsie1Sx4SbaiP6
         m8/hEZAl8+xWmXGLn6uqp0laG0HBDPtfBp9ShRiCaoLDR395lbjC4sy4472nop8rYMMt
         CzVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Bx9QkqYcCH+ul1CrOTKccMQ/ATtJ24Dz/DIqDs6bW8M=;
        fh=8P6pgecEmxdRAMFrp7Ocjxw3uqQw4F9IqG5YpNgZhvM=;
        b=PXY6Skr0mNumrLLcIWtNaH/KRr/Ak3B5+sxLuOmNy20oM1AmatDUdGlsZAMbnP/ehZ
         aeI7KZi3OwcfGGOKjabi04SVnak6y8jqsnLYYKOH1bTR6qbzDltkc9nHrmcx8cKJZ95U
         p2pLe8hsp8QUYYcsSd6CgJJLIlQfHAP/qVJaAHk7oqbopEBDCbVoMh98IfbOc4ylYY6k
         arb4w8SocZizAmV+kHH5T7ZJ8uvFdY0y02GiXlaYXKyc+zHTPyVdZV9aWixVrsbm6WJt
         Aj0nM378D+6lgqDmctgnBePD2wnOs02FAzwRiESdF6g2Nb5ZyBgFG0HRkMu9NCx4J4sH
         i4tg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779115752; x=1779720552; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bx9QkqYcCH+ul1CrOTKccMQ/ATtJ24Dz/DIqDs6bW8M=;
        b=gMWMf5l0IPC/xRVZ5/dmzF18xpwpRLPsLte2WqCakSlGKh7w9Q1zvmpMW3KQ9re4Cc
         F/p/Uy2RGTy4mQATA4cqWr4g5yxuvZbaWcFdyMLI8clR7HFOsqZem/2iSf24pXK9zf2t
         S/diHTAsOW/HWIAQCva29WQgIjfapZhuzylaJJBynKiP7nQlX8yzvsOtIlnd4y7X90hB
         YMjvb8YX7LUdLGr9iEw9pKQfj7zeAR8Q6DQkiE6fT60Fn3zagsoPZI6LWYLO9ODhYIg4
         MW0RsH+I5zsUaqLL4+q+sJwktsSHrF4Ljwi2uq3SakXsMzGNG51Bn5veNI4UNl3ST+BF
         gkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779115752; x=1779720552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bx9QkqYcCH+ul1CrOTKccMQ/ATtJ24Dz/DIqDs6bW8M=;
        b=IvpmMJglXP/rjZgWz6+T7CEDwbwI5UTN9nIB5qrAKichj0c1zA5oxS1IebCU237BFo
         nDU9e2ShIOPxCDs0NgVlr0hLYmHJmbEWZHZFNNR2cVIphhF8EqQGxRJI2HN7Km5p9iXX
         5amwp8YSDOaA5cl71SB0w+kriRKN12A79xv/dc0c1n1aRlTDJAaTDPA3VXuRePZtOsQG
         QYe8xykZ4jA+VY1FSFNXs5o7CIOsDKOM4QC8g/VZ8xGaeZ/V7d/+BhSZd2WgtxeDkMsV
         lmS0dtL7MYLpukA/ebj3bVVzRIwmxUtMUAW56jDH/f3Ej6BNJwfp54jrpSVhc7QfxDhB
         vjPw==
X-Gm-Message-State: AOJu0Yx2ruDfsHAr42odldW2XOCHboLywWdfBBmKBBI/TITveMWCxNCO
	FpiFZrtgzwy7ppAsuOyD4ICMHVbpLtNCa3nd0gfBNa/zyUInn+Ev2yKPyaVl9ymn+AXURkqiGUW
	dlilgQKgi1UUG7FudcC4g8JUE8cgpmXZr9A==
X-Gm-Gg: Acq92OH8YkYDefRmfjb1m6mkWlPlTbgnO0LRDFxEBZ+sZ4TQ0MxShYMAbKri4yDtMnZ
	GdDX7umqjHXqedm1/pxDoGxwnmJZ39peCArww3U7yyfsWEmM6fqmn/P34uVsOHjfSSdRopQC7qz
	0x/1ApEMStyzvd98w1qX209Zg9ajv0hneIwWknV+M9dKudtOg/14I0kyDbXgjn8tZKKot5RZugb
	69V75d0/q1A9XEBF5y9t9XZZAJsGItgvqRspfIhLiZDGbjjid88oGvJ2uWYegltD0bgbQsyMtzV
	m5IRw89R90WMTxD9IL8K
X-Received: by 2002:a05:690c:6911:b0:79a:8e00:a5bf with SMTP id
 00721157ae682-7c958bd452cmr104720087b3.1.1779115752320; Mon, 18 May 2026
 07:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260518111659.282642-1-alex.kanavin@gmail.com>
In-Reply-To: <20260518111659.282642-1-alex.kanavin@gmail.com>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
Date: Mon, 18 May 2026 11:49:00 -0300
X-Gm-Features: AVHnY4ItUfGIsEbE5E8-7BsycS92tjDIlt78Mux4CCHc2rFTEer-pC4nWlElRtw
Message-ID: <CANFVK7-j-Sn02NKBZV-OkgXoX=atWsdhxNVrfVaddcFQfJpFWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3targetconfig: pull in nativesdk python
 when building nativesdk recipes
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000006e71fc065218aa02"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 14:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237249

--0000000000006e71fc065218aa02
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

This fix works for me. It makes sense.

wrynose branch also has the very same issue. Could this fix also be applied
there ?

Thanks

On Mon, May 18, 2026 at 8:17=E2=80=AFAM Alexander Kanavin via lists.openemb=
edded.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:

> From: Alexander Kanavin <alex@linutronix.de>
>
> For the class to work, target python needs to be present in the target
> sysroot. This was done only for :target builds but not for :nativesdk
> ones, and this patch addresses that.
>
> The issue was reported in
> https://lists.openembedded.org/g/openembedded-core/message/237188
> (but the proposed fix there isn't right).
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes-recipe/python3targetconfig.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes-recipe/python3targetconfig.bbclass
> b/meta/classes-recipe/python3targetconfig.bbclass
> index 2877665737..3b9333a4be 100644
> --- a/meta/classes-recipe/python3targetconfig.bbclass
> +++ b/meta/classes-recipe/python3targetconfig.bbclass
> @@ -8,6 +8,7 @@ inherit python3native
>
>  EXTRA_PYTHON_DEPENDS ?=3D ""
>  EXTRA_PYTHON_DEPENDS:class-target =3D "python3"
> +EXTRA_PYTHON_DEPENDS:class-nativesdk =3D "nativesdk-python3"
>  DEPENDS:append =3D " ${EXTRA_PYTHON_DEPENDS}"
>
>  setup_target_config() {
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237233):
> https://lists.openembedded.org/g/openembedded-core/message/237233
> Mute This Topic: https://lists.openembedded.org/mt/119370886/3616735
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> joaohf@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Jo=C3=A3o Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil

--0000000000006e71fc065218aa02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>This fix works for me. I=
t makes sense.</div><div><br></div><div>wrynose branch also has the very sa=
me issue. Could this fix also be applied there ?</div><div><br></div><div>T=
hanks</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, May 18, 2026 at 8:17=E2=80=AFAM Al=
exander Kanavin via <a href=3D"http://lists.openembedded.org">lists.openemb=
edded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembe=
dded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">From: Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&g=
t;<br>
<br>
For the class to work, target python needs to be present in the target<br>
sysroot. This was done only for :target builds but not for :nativesdk<br>
ones, and this patch addresses that.<br>
<br>
The issue was reported in<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/23718=
8" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/op=
enembedded-core/message/237188</a><br>
(but the proposed fix there isn&#39;t right).<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/python3targetconfig.bbclass | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/classes-recipe/python3targetconfig.bbclass b/meta/classes=
-recipe/python3targetconfig.bbclass<br>
index 2877665737..3b9333a4be 100644<br>
--- a/meta/classes-recipe/python3targetconfig.bbclass<br>
+++ b/meta/classes-recipe/python3targetconfig.bbclass<br>
@@ -8,6 +8,7 @@ inherit python3native<br>
<br>
=C2=A0EXTRA_PYTHON_DEPENDS ?=3D &quot;&quot;<br>
=C2=A0EXTRA_PYTHON_DEPENDS:class-target =3D &quot;python3&quot;<br>
+EXTRA_PYTHON_DEPENDS:class-nativesdk =3D &quot;nativesdk-python3&quot;<br>
=C2=A0DEPENDS:append =3D &quot; ${EXTRA_PYTHON_DEPENDS}&quot;<br>
<br>
=C2=A0setup_target_config() {<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#237233): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/237233" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/237233</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119370886/361=
6735" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119370886/3616735</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:joaohf@gmail.com" target=
=3D"_blank">joaohf@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Jo=C3=A3o Henrique Ferreira de Freitas - <a href=3D"http://j=
oaohf_at_gmail.com" target=3D"_blank">joaohf_at_gmail.com</a><br>Campinas-S=
P-Brasil</div></div>

--0000000000006e71fc065218aa02--

