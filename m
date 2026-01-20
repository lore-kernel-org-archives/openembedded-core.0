Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B03D2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 09:13:33 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2655.1768900407985218994
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 01:13:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IbatV8Lo;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so4526816f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 01:13:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768900406; cv=none;
        d=google.com; s=arc-20240605;
        b=hoLtc6U6U3MT1cVaQYiubQ/1SfNuaeSUUkqHIK+W4aXuLT9gqYHgD3ly2YU7Mz/fQc
         vR/p2kXvJOCkaPiT0B7AXZYNH+IUcUm57whp2TwbCyH2OsJ9J0h0zevpIZKgvpgaLavV
         qsYtI5aOgBYWigwtfEOw300EDrSklONlZ4UeFsY5KZXBZtno3yuBV6wivbg1rqxD2deg
         JJv+1EbpxHh8p5O79CVcTdtQPGAF8uJyHLAzPEGRh3c7vVG4IDGQrMKm02ek5ZqehTA0
         mi/JJ9eHX3LbDxXSC6qt6TnEA4Cg8SmxunUc02pFX1IPVUH6VVzIQDXeInl9yKlKve0z
         rVOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZnFDkJ+viPESvNcuwEmBhVC1WzyLPVfW54OIN1IfMqU=;
        fh=6irEZha/lyQ3HYzOyzz/XoTRlEv55OlHAKTGuuXF/dc=;
        b=Z4JzaFRbjrCCU3tGKGiAG7IIN7U22ABpuiXoGILo9fMsJcj2P35sUYUIQ5DxpR7RpD
         EHjPaDAQ8L4mNac4FFPmB9FDzMD6DJP6x1WuxwFVFzdKJPrue3GOwCSGF0O+DcPed8cW
         p8CDqkRT1AfLNrMWovMQLnOoH+w0wpwCCCP7vVy0CXo2Lnj5Kzh259l5104rQcnOXbPK
         E+yhTU6CjUWl6v3wqdl8esFORDDlICOOfxs7L4WuOwI6UofUvVNlTLTjQrmGj54/SpHg
         VYaAPwpYw/qmcGt7HpVwJZ4UgN7zKi7tNO9efLuBIwu47Udz3F994JEhAtqEmwnnOAzI
         fEPw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768900406; x=1769505206; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnFDkJ+viPESvNcuwEmBhVC1WzyLPVfW54OIN1IfMqU=;
        b=IbatV8LoEshCT4v8hVCvmOw6q0A6INC1HNHagpyRM1RVMZkwb4M0bLXFRXYO3/HRJl
         Y1x8gyhCa5kI5SFqNRcMnTlD5YVzjUijioAhcZOSUIfJK6eTFeahVMzRZMnug3BazNbj
         PsEEzm/dzLWVDG6BtArhhUAJmIHJKUuNUV6PM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768900406; x=1769505206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnFDkJ+viPESvNcuwEmBhVC1WzyLPVfW54OIN1IfMqU=;
        b=ft+Bho+ioYZH2c5wFlkDH7CCUCtjhNS56ZjcreAWFX6V5hgc2jKcan6qCD1p2FIxb1
         siMqN9dANFb63S/2WtoyorwCCXUtIm2qr7FJBtn7oSc+5JmPj7T06TMWJLU5X5MK6ywp
         VaOe132cvP2+Dm7i+O3GkciB/9ZAj0XHnNoApe97SmO47rz1dM8E0hd7XYX6AWpCnDH2
         tDTmQzMAowMMQJrAs2wEKXVU40EroQk25C1yiLlGUTwdjuale5UvTtQA4xHOwmmFz3YY
         Z+/2KRTRxoKNKU4991mFc/VCgV1iYnB9/Iclyp5gsA5kwfLtCxhHhJM8F8VSmOEBtGQ4
         /Wsw==
X-Gm-Message-State: AOJu0YxvD8Gcuef/3WciN9ub7dwnFvSqFVp6/V+pLFKIUH+msbcEfftG
	1aI1hM4+PthzPpposEzqFHpsexgfmMtdDTGz+v3hnUGMjzYXyhMtT6d65IdW9ueAF4hppaopBT/
	JR+m4nA/n+QlS2rTPla08M3rTCV+LH+pE/Iwc+mCbBQ==
X-Gm-Gg: AZuq6aK13OrRurse31fpczaLzzC8bjVV6q9grdUyoJbstqOejYdRO+c4GZQG6nZAhtJ
	G3Uh/C/FTFklMFRfbvnhYYwjE2lEwVQ2wwKQNqBdpxixVTBIPOF0O8rQqZTHI9CgJYg/SU3TT9a
	xN/AjIZ2IhS+m905grfn5XS8T0jRMXGZXUeFK08YwWqvjrPR8gpcyuyWRImcS9YpjV+RavOSxsO
	WObUabejWDTQCQQU1SQWUAk/BPxjeo/8Eysel4qpWYW/qJlpaRVUTdE14W+FE9relgs9oP1Jg==
X-Received: by 2002:a05:6000:2007:b0:431:266:d135 with SMTP id
 ffacd0b85a97d-43569bcfa4cmr20724588f8f.52.1768900406305; Tue, 20 Jan 2026
 01:13:26 -0800 (PST)
MIME-Version: 1.0
References: <20260107045240.170121-1-hprajapati@mvista.com> <256810.1768887388424073608@lists.openembedded.org>
In-Reply-To: <256810.1768887388424073608@lists.openembedded.org>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 20 Jan 2026 10:12:59 +0100
X-Gm-Features: AZwV_QjkQPmrd5iq4nuJtH4eA7PJwVZ5BeTOLDPYMxKjhEF5oA2MY2ry30os6rg
Message-ID: <CAMSfU+62Kh1t6Be66SnUeL=OEE8JmEhm37qyT1wRy4WGrErwRw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] curl: fix CVE-2025-10148
To: hprajapati@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005c79060648ce38d7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 09:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229655

--0000000000005c79060648ce38d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 20 janv. 2026 =C3=A0 06:36, Hitendra Prajapati via lists.openembedd=
ed.org
<hprajapati=3Dmvista.com@lists.openembedded.org> a =C3=A9crit :

> Hi Team,
> Any update on this ?
>

Hello,

I'm currently focussed on getting Kirkstone 4.0.33 built. And, while I will
send a scarthgap patch series soon, this one is not included, sorry.
It does look good. I will definitely consider it for the next scartgap
release (5.0.16 built on 2026-02-09).

Regards,


>
> Regards,
> Hitendra
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229643):
> https://lists.openembedded.org/g/openembedded-core/message/229643
> Mute This Topic: https://lists.openembedded.org/mt/117129750/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000005c79060648ce38d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 20=
 janv. 2026 =C3=A0=C2=A006:36, Hitendra Prajapati via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;hprajapati=3D<a href=3D=
"mailto:mvista.com@lists.openembedded.org">mvista.com@lists.openembedded.or=
g</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div>Hi Team,</div>
<div>Any update on this ?</div></blockquote><div><br></div><div>Hello,</div=
><div><br></div><div>I&#39;m currently focussed on getting Kirkstone=C2=A04=
.0.33 built.=C2=A0And, while I will send a scarthgap=C2=A0patch series soon=
, this one is not included, sorry.</div><div>It does look good. I will defi=
nitely consider it for the next scartgap release (5.0.16 built on 2026-02-0=
9).</div><div><br></div><div>Regards,</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<div>=C2=A0</div>
<div>Regards,</div>
<div>Hitendra</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229643): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229643" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229643</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117129750/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117129750/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000005c79060648ce38d7--

