Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3898C4167B
	for <webhook@archiver.kernel.org>; Sat, 25 Nov 2023 16:47:44 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.28054.1700930856739516424
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Nov 2023 08:47:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pj84PgE0;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1fa289a3b6aso225946fac.3
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 08:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700930856; x=1701535656; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lnb7+VgdBPQReMBYSu9RA70O9XugaqicTFp70SasmRI=;
        b=Pj84PgE0WJ+PZbMVSD6qlrw7NVtIaYnKyB8dbzkPUt26fJHjg7xaYeXPR40W5tBkRD
         jg9LBvds6HbYmmTp7MK6CIB+ySu5Mh+Kh+NCSmGRN1ywW9KLszPkVsyMII8JAPKUDWZE
         dtx5cGz3k/eLiXy+J1WgUJUgYKgbtxpk54aDeEFlfAmsMyHf8Uz3vBbZ9fDaHR/NvWW6
         DKQiy+1dRZw3hy3BDMg3nn/CABr9qRbfMRRG9+FVZeD1Jto7i4IhITjmSWfJFBXrAlfq
         cNHJ/IQSB31vRmmbGvjqPdk1n/eIsnu/Js8Oc8HCLznum0cDLWzlWV9kxm58HHKUnERc
         sdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700930856; x=1701535656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lnb7+VgdBPQReMBYSu9RA70O9XugaqicTFp70SasmRI=;
        b=Ujbs/OhaN6x6mImY2Z6iM/xA5tjVRujRyiVA9F8YdSJcWYElSrGCRLc+EZy7MbVA6U
         UcBAGK333WuwpAdaKzJSHCSjh+rcZunEVvp6nGvVsp4N+1MmuWzgyLdzvJwk6hI6CY/x
         YVdXNVFwTH2C9cYuLBt+0wJrOqsBlgcEEOxR/s0qFc+4BuuSsqdJ2flzPZTQXolRmLfe
         CJJxpUnBszL7OcwOWdk6BJNSKCTAxkeNjHTJ73ppCFLBa/al+jon/I6vOO9/s11EDY+I
         K72vJWKwhpqotpnC/VLAaJyh/nYO56pOWtXIINs4g1rvnRG+eycUt6PPfIxAuXN2eJrJ
         NCgg==
X-Gm-Message-State: AOJu0Yy/q0gP5+FH6/Z3Fym2rjvCbcXoFysJot54kJuXp64Ct06wwU9z
	hkMTL9ASVjuo3ee6y9jPJkV8pN1CaQofgC+uXdw=
X-Google-Smtp-Source: AGHT+IHTNwv/ioFb7WNO03ri3JRMC4IFRx2T6Yr+R6MXGYGc82CZwLC+9Wh4weRWYjMU1Nj0IxnAWlXtLa5HgZaTFzs=
X-Received: by 2002:a05:6870:c690:b0:1fa:2f8:c734 with SMTP id
 cv16-20020a056870c69000b001fa02f8c734mr5436654oab.5.1700930855797; Sat, 25
 Nov 2023 08:47:35 -0800 (PST)
MIME-Version: 1.0
References: <20231125073823.159294-1-raj.khem@gmail.com> <20231125073823.159294-3-raj.khem@gmail.com>
 <PA4PR08MB7411F95FD927EE786C9FB2CAE8BFA@PA4PR08MB7411.eurprd08.prod.outlook.com>
In-Reply-To: <PA4PR08MB7411F95FD927EE786C9FB2CAE8BFA@PA4PR08MB7411.eurprd08.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Nov 2023 08:47:24 -0800
Message-ID: <CAMKF1srDkA24P72x5MzBRVfkrWgDg6dLTAjeS=HxKm7sDxvmaA@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] vte: Separate out gtk4 pieces of vte into
 individual packages
To: Ross Burton <ross.burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007287ff060afcd36d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 16:47:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191235

--0000000000007287ff060afcd36d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Seems to do so for the test case and for development or build time it=E2=80=
=99s
fine to have them both be installed since they can live side by side
without issues

On Sat, Nov 25, 2023 at 6:04=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

> Does this allow installing the gtk4 libraries without gtk3? Looks like th=
e
> GIR files will mean pulling in both.
>
> Ross
> ------------------------------
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* Saturday, November 25, 2023 7:38:21 AM
> *To:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>
> *Cc:* Khem Raj <raj.khem@gmail.com>; Ross Burton <Ross.Burton@arm.com>
> *Subject:* [PATCH v10 3/3] vte: Separate out gtk4 pieces of vte into
> individual packages
>
> This avoids adding gtk4 dependencies when image may only desire the gtk3
> pieces of vte.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Ross Burton <ross.burton@arm.com>
> ---
> v10: Added new
>
>  meta/recipes-support/vte/vte_0.74.1.bb | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/vte/vte_0.74.1.bb
> b/meta/recipes-support/vte/vte_0.74.1.bb
> index 8a7054a13cd..91c331d44cc 100644
> --- a/meta/recipes-support/vte/vte_0.74.1.bb
> +++ b/meta/recipes-support/vte/vte_0.74.1.bb
> @@ -36,7 +36,15 @@ PACKAGECONFIG[gtk4] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,=
gtk4"
>  PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
>  PACKAGECONFIG[systemd] =3D "-D_systemd=3Dtrue,-D_systemd=3Dfalse,systemd=
"
>
> -PACKAGES =3D+ "libvte ${PN}-prompt"
> +PACKAGES =3D+ "libvte-gtk4 ${PN}-gtk4 ${PN}-gtk4-dev libvte ${PN}-prompt=
"
> +FILES:libvte-gtk4 =3D "${libdir}/lib*gtk4.so.*
> ${libdir}/girepository-1.0/Vte-3.91.typelib"
> +FILES:${PN}-gtk4 =3D"${bindir}/vte-2.91-gtk4"
> +FILES:${PN}-gtk4-dev =3D "${libdir}/lib*gtk4.so \
> +                        ${libdir}/pkgconfig/vte-2.91-gtk4.pc \
> +                        ${datadir}/vala/vapi/vte-2.91-gtk4.deps \
> +                        ${datadir}/vala/vapi/vte-2.91-gtk4.vapi \
> +                        ${includedir}/vte-2.91-gtk4 \
> +                        "
>  FILES:${PN} +=3D"${systemd_user_unitdir}"
>  FILES:libvte =3D "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
>  FILES:${PN}-prompt =3D " \
> --
> 2.43.0
>
>

--0000000000007287ff060afcd36d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Seems to do so for the test case and for development or b=
uild time it=E2=80=99s fine to have them both be installed since they can l=
ive side=C2=A0by side without issues=C2=A0</div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Nov 25, 2023 at 6:04=
=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Bur=
ton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">



<div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">Does this allow installing the gtk4 libraries without gtk3=
? Looks like the GIR files will mean pulling in both.</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">Ross</div>
</div>
</div>
<div id=3D"m_5557539945681723539ms-outlook-mobile-signature">
<div></div>
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_5557539945681723539divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b> =
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt;<br>
<b>Sent:</b> Saturday, November 25, 2023 7:38:21 AM<br>
<b>To:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.openembedded.org</a>&gt;<br>
<b>Cc:</b> Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;; Ross Burton &lt;<a href=3D"mailto:Ross.Bur=
ton@arm.com" target=3D"_blank">Ross.Burton@arm.com</a>&gt;<br>
<b>Subject:</b> [PATCH v10 3/3] vte: Separate out gtk4 pieces of vte into i=
ndividual packages</font>
<div>=C2=A0</div>
</div></div><div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>This avoids adding gtk4 dependencies when image may only desire the gt=
k3<br>
pieces of vte.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank=
">ross.burton@arm.com</a>&gt;<br>
---<br>
v10: Added new<br>
<br>
=C2=A0meta/recipes-support/vte/<a href=3D"http://vte_0.74.1.bb" target=3D"_=
blank">vte_0.74.1.bb</a> | 10 +++++++++-<br>
=C2=A01 file changed, 9 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-support/vte/<a href=3D"http://vte_0.74.1.bb" targ=
et=3D"_blank">vte_0.74.1.bb</a> b/meta/recipes-support/vte/<a href=3D"http:=
//vte_0.74.1.bb" target=3D"_blank">vte_0.74.1.bb</a><br>
index 8a7054a13cd..91c331d44cc 100644<br>
--- a/meta/recipes-support/vte/<a href=3D"http://vte_0.74.1.bb" target=3D"_=
blank">vte_0.74.1.bb</a><br>
+++ b/meta/recipes-support/vte/<a href=3D"http://vte_0.74.1.bb" target=3D"_=
blank">vte_0.74.1.bb</a><br>
@@ -36,7 +36,15 @@ PACKAGECONFIG[gtk4] =3D &quot;-Dgtk4=3Dtrue,-Dgtk4=3Dfal=
se,gtk4&quot;<br>
=C2=A0PACKAGECONFIG[gnutls] =3D &quot;-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnut=
ls&quot;<br>
=C2=A0PACKAGECONFIG[systemd] =3D &quot;-D_systemd=3Dtrue,-D_systemd=3Dfalse=
,systemd&quot;<br>
=C2=A0<br>
-PACKAGES =3D+ &quot;libvte ${PN}-prompt&quot;<br>
+PACKAGES =3D+ &quot;libvte-gtk4 ${PN}-gtk4 ${PN}-gtk4-dev libvte ${PN}-pro=
mpt&quot;<br>
+FILES:libvte-gtk4 =3D &quot;${libdir}/lib*gtk4.so.* ${libdir}/girepository=
-1.0/Vte-3.91.typelib&quot;<br>
+FILES:${PN}-gtk4 =3D&quot;${bindir}/vte-2.91-gtk4&quot;<br>
+FILES:${PN}-gtk4-dev =3D &quot;${libdir}/lib*gtk4.so \<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${libdir=
}/pkgconfig/vte-2.91-gtk4.pc \<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${datadi=
r}/vala/vapi/vte-2.91-gtk4.deps \<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${datadi=
r}/vala/vapi/vte-2.91-gtk4.vapi \<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${includ=
edir}/vte-2.91-gtk4 \<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;<b=
r>
=C2=A0FILES:${PN} +=3D&quot;${systemd_user_unitdir}&quot;<br>
=C2=A0FILES:libvte =3D &quot;${libdir}/*.so.* ${libdir}/girepository-1.0/*&=
quot;<br>
=C2=A0FILES:${PN}-prompt =3D &quot; \<br>
-- <br>
2.43.0<br>
<br>
</div>
</span></font></div>
</div>

</blockquote></div></div>

--0000000000007287ff060afcd36d--

