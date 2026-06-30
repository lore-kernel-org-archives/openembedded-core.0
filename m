Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD5AC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 16:11:54 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25198.1782835912602367489
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 09:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PjAiwfTF;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-664b84118d5so3261280d50.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 09:11:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782835912; cv=none;
        d=google.com; s=arc-20260327;
        b=G4MBa/F41Pnv6KOHAw82xVvmzwsA8mo7aqeX68jxsKTJLO0cvcDTH4WmpKaY6EjPPT
         +Myu8e4zonC2jylx9tGMtDxNiAv4p9xM9mG+x5kD1Jbjqah9PZcLdAWfSIpAm5duwBfY
         zjc9lxhgc1c6J4AIiIBeS3yTum6Xp0eEfuj9l/X1C2H2OIj048HOmC1F7b+qFMph09kJ
         HU47LMtindM10HWkDJMZOhekr3lofAc2yKz+F91hF78BJeZ6g69GKjf1tuWqfxLr7NNr
         PdgIzsBsxplzaYf/2Oj/LsVWfr+pDRsdBhO3gSgx5RGu51PKUUax310m/Nr9UYQV+RMa
         FxhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YqIwEVb9p5X76YirbJclS4PUncpVObLug/QwB9pNLXg=;
        fh=2CzqPdtFyc42DpVGeYeV0WtoV3nwD//V5Vq6+ZAmc/E=;
        b=ZUtyied9cx5OWNk6JRzJ3jwUVf5k60YldDj6nKBom3krFW+zo1DCEp5vnetNG2hK39
         oCn5R3jAdDCMJdvxcWXFjy34uTe0fPZWMmG7lfJdUWwwBiH4o6SaNqsGvbHCVs5Y5lFi
         HM7nGY6OWKO+eediRBkdLOkBofqvZVIyMDR3h3bbd4G4DbbaVm3WsnGMRa2/B2gd0J+V
         DGYzau6Xq2siNxqn/Q3sTqI9O03xQugyElaxjfuUkaY2PwvtwpxsNqRgoWS/Pt4ehdDp
         3HuZxbDhvXAFHJYh0vl/2N5Y/wACky8Fkp91iRbOZ4jtBxl4yQx5JptNn05NvGpNyG6G
         76Dg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782835912; x=1783440712; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YqIwEVb9p5X76YirbJclS4PUncpVObLug/QwB9pNLXg=;
        b=PjAiwfTFjStcinXIH4+WKK3aL2zDrQ9IQbqFvH6NOlNYZ3esQVgpODCiKNxb38vgpv
         SNZPZbcGXqg6thOPtnHy2nrTRj4mKMWpzt5qrPWdul/vwc7ZWT6QlkTLmxMm77Kz8BVU
         SAluSXLVXKOeYNEdVVWM8Ct6o0DhGsGhNDDkxTro+k7sJwN4yMsLCrHNECnl4R1k7LRL
         30485eIka9QAwMPrOnQJIF9JJiGtqX6RZbuSd+hwiPqOY0k1A4oSFEBjvo5giD77ttNR
         wQ71S9ZrALG5saIWo5nTRLZ3n70tCKRtV+oAaXQo9QgftAj0TKKzMWfR5sRauE1GXjHB
         GQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782835912; x=1783440712;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqIwEVb9p5X76YirbJclS4PUncpVObLug/QwB9pNLXg=;
        b=A83m2OaaERfYJANERWBNjrode3VHeOHVZF6u41MikQWpC88BvCRxnSKgNFNPELOPl6
         LVtrvIH7bY6TKnThyanBKPk4ZYfkvjl0QW0w87m2G6Ds0kSMYhHKgKNuxnVRrXXnaXkn
         hFSIIzfPjeFlBQ3fKHGBaCFeMDqNfj23hIU7SacFchkyNujyQbKloI6l68WLlrAFvvN5
         QVfk59DAWtJOY8FSE8M+8j9AoxWgFqrKz8g3h8p103BFw9oGVZSwfDnNpb/S4r5noXGG
         WQQVvdu8gV32KrzLgnPHIrGPZuPotX2m+PJL0K0+jpslLMPXeJhtUODRKOUbus0QLGFI
         RrHw==
X-Gm-Message-State: AOJu0YzBbX1FLu03iwsOoi8a39NFE5+pMn9qXIB4exNp2SJDWRLOu8Nj
	gcgBrUs3bkHGwQLDxG63GyoqSFjToBXeOt6edm5g0eo2EVuPFSDuAzip2fAyImNMl+nBOiFISKH
	xUKpCAycRAVype/rnLbuW379T+337uClGdNI94sU=
X-Gm-Gg: AfdE7cleokXHTSv/qA0CQoZnPlnpn4/NKK5JY+UTONMtJ3fGlNtPbqIDXZxqOLl4Kw5
	/SGvAfPonAsx4OjBgNhk+YgaNJytdSzW3UBr/Om51F7hu1/pa1p9Ntj6cDRfxb/6FwzEPB5ZUG3
	YPZ/vaBn5co1VHAcv/0yEPjmuJcdvrVUL0mDWromdg12B9+SFZnw2aJG51ntzKPot9xG4lLgE6b
	LizdWlCIGLYQqN8L0TWV280JcR/nkBrFtB9NaEpiLqRHo+C7qmhx2Q08eSQFokSC+8dBTWNSZJZ
	MQlTt7tTq8wrDldfVIW5G2tTCb38IQulVgOZcqIT1NPukrDnyWbKh429DoumLfAx6BjJOEzO8T+
	sjSAiLI5UcWjI/6vGGp5u/YoJNzAa9M0pWxjhQbCT/h/T/8UkTRD6S98cQkF2qBqj9Irv4u+7
X-Received: by 2002:a05:690e:438c:b0:664:ae67:b674 with SMTP id
 956f58d0204a3-664f9aad18emr3285693d50.80.1782835911484; Tue, 30 Jun 2026
 09:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260630151704.2896341-2-alex.kiernan@gmail.com>
In-Reply-To: <20260630151704.2896341-2-alex.kiernan@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Jun 2026 09:11:40 -0700
X-Gm-Features: AVVi8Cfm9HO7MCiu9dvBaNejFZ9BLsZmR25eTT5DNDcIBOzeuxHZdd8JO7alCyI
Message-ID: <CAMKF1sr_emCmEW2R+kMMp5J9+V3JpyTbAKXnKPu_a2ed84UOWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] dhcpcd: Add PACKAGECONFIG for seccomp
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000032777406557ad519"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 16:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239907

--00000000000032777406557ad519
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Does this need libseccomp dependency too ?

On Tue, Jun 30, 2026, 8:17=E2=80=AFAM Alex Kiernan via lists.openembedded.o=
rg
<alex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:

> Pass --enable/disable-seccomp to the build based on DISTRO_FEATURES.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>  meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
> b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
> index 6ebfc195323d..58865e108d24 100644
> --- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
> +++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
> @@ -24,10 +24,11 @@ inherit pkgconfig autotools-brokensep systemd useradd
>
>  SYSTEMD_SERVICE:${PN} =3D "dhcpcd.service"
>
> -PACKAGECONFIG ?=3D "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d=
)}"
> +PACKAGECONFIG ?=3D "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6
> seccomp', d)}"
>
>  PACKAGECONFIG[udev] =3D "--with-udev,--without-udev,udev,udev"
>  PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6"
> +PACKAGECONFIG[seccomp] =3D "--enable-seccomp,--disable-seccomp"
>  # ntp conflicts with chrony
>  PACKAGECONFIG[ntp] =3D "--with-hook=3Dntp, , ,ntp"
>  PACKAGECONFIG[chrony] =3D "--with-hook=3Dntp, , ,chrony"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239905):
> https://lists.openembedded.org/g/openembedded-core/message/239905
> Mute This Topic: https://lists.openembedded.org/mt/120048679/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000032777406557ad519
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Does this need libseccomp dependency too ?</div><br><div =
class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Jun 30, 2026, 8:17=E2=80=AFAM Alex Kiernan via <a href=3D"ht=
tp://lists.openembedded.org">lists.openembedded.org</a> &lt;alex.kiernan=3D=
<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openemb=
edded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Pass --enable/disable-seccomp to the build based on DISTRO_FEATU=
RES.<br>
<br>
Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">alex.kiernan@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/dhcpcd/<a href=3D"http://dhcpcd_10.3.2.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">dhcpcd_10.3.2.bb</a> | 3 ++=
-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-connectivity/dhcpcd/<a href=3D"http://dhcpcd_10.3=
.2.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">dhcpcd_10.3.2.bb</a>=
 b/meta/recipes-connectivity/dhcpcd/<a href=3D"http://dhcpcd_10.3.2.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">dhcpcd_10.3.2.bb</a><br>
index 6ebfc195323d..58865e108d24 100644<br>
--- a/meta/recipes-connectivity/dhcpcd/<a href=3D"http://dhcpcd_10.3.2.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">dhcpcd_10.3.2.bb</a><br>
+++ b/meta/recipes-connectivity/dhcpcd/<a href=3D"http://dhcpcd_10.3.2.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">dhcpcd_10.3.2.bb</a><br>
@@ -24,10 +24,11 @@ inherit pkgconfig autotools-brokensep systemd useradd<b=
r>
<br>
=C2=A0SYSTEMD_SERVICE:${PN} =3D &quot;dhcpcd.service&quot;<br>
<br>
-PACKAGECONFIG ?=3D &quot;udev ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;=
, &#39;ipv6&#39;, d)}&quot;<br>
+PACKAGECONFIG ?=3D &quot;udev ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;=
, &#39;ipv6 seccomp&#39;, d)}&quot;<br>
<br>
=C2=A0PACKAGECONFIG[udev] =3D &quot;--with-udev,--without-udev,udev,udev&qu=
ot;<br>
=C2=A0PACKAGECONFIG[ipv6] =3D &quot;--enable-ipv6,--disable-ipv6&quot;<br>
+PACKAGECONFIG[seccomp] =3D &quot;--enable-seccomp,--disable-seccomp&quot;<=
br>
=C2=A0# ntp conflicts with chrony<br>
=C2=A0PACKAGECONFIG[ntp] =3D &quot;--with-hook=3Dntp, , ,ntp&quot;<br>
=C2=A0PACKAGECONFIG[chrony] =3D &quot;--with-hook=3Dntp, , ,chrony&quot;<br=
>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#239905): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/239905" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/239905</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120048679/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/120048679/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000032777406557ad519--

