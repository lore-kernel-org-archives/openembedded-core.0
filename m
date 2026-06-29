Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF26C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 09:52:22 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88798.1782726735076933533
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 02:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2P/FMeu8;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47231f1f8f3so2097478f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 02:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782726733; cv=none;
        d=google.com; s=arc-20260327;
        b=JLO0QtktJn/uh1+jvML8DzsJw4vjDZR41CNn07ZndCCVTmps46ujWIysVCJf7ROyNg
         4QK+A+z4SlFFXndw6aNn03we1Pi5nlANefqYttMQxxB8TZVoQPexG1Qty2qIY5R73jPh
         bKyq8vFcTEQrrxOalwbHns4Di7mtnK1YlFdcegixOY4m6qLN2MVZSpVAneNtXMSWuy0Y
         rS/2bxBCk4LRZnyk2u0SD2ZJkGIp/wR11K1j9PF07801KQZp3nEtLRvevBcL0tgGshWE
         wHb5vcxCu/1k/dwMdWspsVKpBHBQSwKOt40jDMkEpraDoOdhhss4H9HmLndTahobueeR
         phFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YxY/lHidr8k5SedNM22B83dsnv0K33ApaPceC5SvXKU=;
        fh=CBzNg/NL21DWTHY4T0WFOKUAyqx0HIPJNzSHf+IjR2E=;
        b=aKyVWNYs2WtsQo4kWlKRJke7D/y9okDxvAIws1PPbalvEzRqGWBdTXG7lRnwB0YN80
         VB5WH4w0gTG9tyTCToGap6guIKBJGgMAOD6HLGtdagaXfpsHHdxBs+DXwzklDnn4Dani
         UYUUkW0JzH47Iwsc0G74ZPvxSpgVjbl6L6kqCqu69ktVMC3WGUogCMrmQg1Xg5VP6m72
         jYftLkQZbBcKmblMvZ1P8REUgS0iqpxDX+z3wXJnH7m1v/cKGSxZuv9JByT0xN06irPD
         jF2eyhAgMPRm+73BpQLaSfLuDZPLwvsRuAREo+TOWfm123fDoMdmmL52P3IRZmqjuX0Z
         ixhA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782726733; x=1783331533; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YxY/lHidr8k5SedNM22B83dsnv0K33ApaPceC5SvXKU=;
        b=2P/FMeu8HI32qlM3nSaM9lGHDADV8v7WTVExi5eXingx00pX0JS/zgHzgcbLxQOtMa
         0/k2/Vis124YoDOElukhNsRdnoQrEClR7cZcZFFt0wvybsWaX4Fy71bNk2XWDn9DfMmO
         VNqj1pDFUZ6QAZppavxWArL7A1O5PmhTxvP9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726733; x=1783331533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxY/lHidr8k5SedNM22B83dsnv0K33ApaPceC5SvXKU=;
        b=J15B8cLLyXlTW0KFD4xv8a2xbYeO2Mjf1meNJR+huTPCmoieGWkFl0FErXr/m4Y82J
         pLyYnmC1oEIH/E2dV0sMYYjmMO/RfaXldtRbmZos4Fyu2YMELz2/YfLJMYkbCsNcOZO1
         eqP4/ZMyBCMYpEpaGoJvX6WM2qqc9vcmxodjRf7BJKkTzaF4788OqV6gwKLvedKed8E7
         fkEYbtIenpFx5Pon6CmPXTMcHQr/G1OuO6pkcKALuOhzN7u0bANKwMJGrVhUX/zfVJO/
         Fb0cELkJV5E20pi7GwJ490GQ5+D04rkU3K6oZUnIokMhyg9ZfHI2fi7hHm0DsmFvRJsg
         1Yjw==
X-Gm-Message-State: AOJu0Yzfwsejyvwt8olMHe1Yu+IbnQgcQueYEtKLRpsoaHU15Ri7dS9e
	RXoTYEIe9gb8zeTimTHN/XaToOxccmZR3CpVxTI+WfrxsBSYHCTr5Yxr6ZRV0gw+CZeZYo94u7G
	XM/8Rd5fJxOFr1HPq2MT02o77TIq1ZitPa1qa7MZaUg==
X-Gm-Gg: AfdE7clGgf1gbaDvmwTEpTCm22J36ZNDR2dpfccUVyiqhsUlYZuCrIzsaPKX7b60ojm
	RgE4Poto7RBBi6ilfvgLBFvpg0HjohfRXE7l03KgOFl4DhFmd2lKR5F+NJnAlQJzdDUuODTuB8/
	A13TBWg/INdrUYn0vCzugZUHXDpILquK/75qeKc3OgD75HF7zOWdmKlKs1fEapjeGC/oHXNOciO
	L0aqxc6OG/oW8n3ZL856u56vCLQb9sC7up6hTIJlCi5vZdI4rwLtF3CMp5rEuYQFMXobHKo9SWT
	olv46adcTQ==
X-Received: by 2002:a05:6000:4913:b0:46d:8169:bb39 with SMTP id
 ffacd0b85a97d-46dc1b9c344mr24796307f8f.37.1782726732890; Mon, 29 Jun 2026
 02:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260629084157.299017-1-daniel.turull@ericsson.com>
In-Reply-To: <20260629084157.299017-1-daniel.turull@ericsson.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 29 Jun 2026 11:51:46 +0200
X-Gm-Features: AVVi8CeK8OKTU1Bfmhaam2BVFzfNAPC492nFUMVMqs9LhdpbgJfFCVzW7NeTseA
Message-ID: <CAMSfU+5ipfW1CCFQ7=7ndWW1nQAsbaJcj9ditV9gwkPr=2sgfw@mail.gmail.com>
Subject: Re: [OE-core] [wrynose][PATCH] systemd-systemctl-native: disable
 libpam meson option
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a561720655616956"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 09:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239742

--000000000000a561720655616956
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 29 juin 2026 =C3=A0 10:42, Daniel Turull via lists.openembedded.org
<daniel.turull=3Dericsson.com@lists.openembedded.org> a =C3=A9crit :

> From: Daniel Turull <daniel.turull@ericsson.com>
>
> When building on rhel8.10 we got the following crash during do_compile
>
> systemctl-259.5/src/shared/pam-util.c
> | ../sources/systemd-systemctl-259.5/src/shared/pam-util.c:3:10: fatal
> error: security/pam_ext.h: No such file or directory
> |     3 | #include <security/pam_ext.h>
> |       |          ^~~~~~~~~~~~~~~~~~~~
> | compilation terminated.
> | ninja: build stopped: subcommand failed.
> | INFO: autodetecting backend as ninja
>
> libpam is not needed for systemctl task done by bitbake, therfore
> disable MESON option.
>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
>

Hello,

What would be the corresponding master commit? "systemd: upgrade to 261"?

Regards,


> ---
>  meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
> b/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
> index 3d01d60e9c..3c0dcd35a3 100644
> --- a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
> +++ b/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
> @@ -12,6 +12,7 @@ MESON_TARGET =3D "systemctl:executable"
>  MESON_INSTALL_TAGS =3D "systemctl"
>  EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse"
>  EXTRA_OEMESON +=3D "-Dsysvinit-path=3D -Dsysvrcnd-path=3D"
> +EXTRA_OEMESON +=3D "-Dpam=3Ddisabled"
>
>  # Systemctl is supposed to operate on target, but the target sysroot is
> not
>  # determined at run-time, but rather set during configure
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239737):
> https://lists.openembedded.org/g/openembedded-core/message/239737
> Mute This Topic: https://lists.openembedded.org/mt/120027421/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000a561720655616956
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 29=
 juin 2026 =C3=A0=C2=A010:42, Daniel Turull via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;daniel.turull=3D<a href=3D"ma=
ilto:ericsson.com@lists.openembedded.org">ericsson.com@lists.openembedded.o=
rg</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">From: Daniel Turull &lt;<a href=3D"mailto:daniel.turull@eric=
sson.com" target=3D"_blank">daniel.turull@ericsson.com</a>&gt;<br>
<br>
When building on rhel8.10 we got the following crash during do_compile<br>
<br>
systemctl-259.5/src/shared/pam-util.c<br>
| ../sources/systemd-systemctl-259.5/src/shared/pam-util.c:3:10: fatal erro=
r: security/pam_ext.h: No such file or directory<br>
|=C2=A0 =C2=A0 =C2=A03 | #include &lt;security/pam_ext.h&gt;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~=
~~~~~~~~~<br>
| compilation terminated.<br>
| ninja: build stopped: subcommand failed.<br>
| INFO: autodetecting backend as ninja<br>
<br>
libpam is not needed for systemctl task done by bitbake, therfore<br>
disable MESON option.<br>
<br>
Signed-off-by: Daniel Turull &lt;<a href=3D"mailto:daniel.turull@ericsson.c=
om" target=3D"_blank">daniel.turull@ericsson.com</a>&gt;<br></blockquote><d=
iv><br></div><div>Hello,</div><div><br></div><div>What would be the corresp=
onding master commit? &quot;systemd: upgrade to 261&quot;?</div><div><br></=
div><div>Regards,</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd-systemctl-native_=
259.5.bb" rel=3D"noreferrer" target=3D"_blank">systemd-systemctl-native_259=
.5.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-systemctl-=
native_259.5.bb" rel=3D"noreferrer" target=3D"_blank">systemd-systemctl-nat=
ive_259.5.bb</a> b/meta/recipes-core/systemd/<a href=3D"http://systemd-syst=
emctl-native_259.5.bb" rel=3D"noreferrer" target=3D"_blank">systemd-systemc=
tl-native_259.5.bb</a><br>
index 3d01d60e9c..3c0dcd35a3 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd-systemctl-native_=
259.5.bb" rel=3D"noreferrer" target=3D"_blank">systemd-systemctl-native_259=
.5.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-systemctl-native_=
259.5.bb" rel=3D"noreferrer" target=3D"_blank">systemd-systemctl-native_259=
.5.bb</a><br>
@@ -12,6 +12,7 @@ MESON_TARGET =3D &quot;systemctl:executable&quot;<br>
=C2=A0MESON_INSTALL_TAGS =3D &quot;systemctl&quot;<br>
=C2=A0EXTRA_OEMESON +=3D &quot;-Dlink-systemctl-shared=3Dfalse&quot;<br>
=C2=A0EXTRA_OEMESON +=3D &quot;-Dsysvinit-path=3D -Dsysvrcnd-path=3D&quot;<=
br>
+EXTRA_OEMESON +=3D &quot;-Dpam=3Ddisabled&quot;<br>
<br>
=C2=A0# Systemctl is supposed to operate on target, but the target sysroot =
is not<br>
=C2=A0# determined at run-time, but rather set during configure<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#239737): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/239737" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/239737</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120027421/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120027421/4316185</a><br>
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

--000000000000a561720655616956--

