Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9660CCFC291
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 16:19:57 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15084.1763741994953929506
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 08:19:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GvrG/kSd;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso3669194a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 08:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763741993; x=1764346793; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xiJ2ikZLnMpIOrPzKMNkQTilnVYsWyD1gNo1t1z/ih8=;
        b=GvrG/kSdFfxvR71h97thBbk0/c7bUHzCbT2X3JVsqGFY+a5vVu5xfcmw+a6s6/TX/N
         Z1rDy6r2wxUnbixXBu2y39eH6MrFDvF9iFw7PncaMSabVu6i1RSBl9XkpufapSSLJT3u
         spkh1SpVv2zbWeaWqNj3t3dlxm9xeeg/efmoztL1oUYxsKVK9WgWJndjPM9nPERHyHfl
         Bo7i99B9C5Lf7kL8K3fZf8UdaxNHfIB3LBEpmmMNqN4t1j7K1UEIOmiaHRakW25EXbo8
         rU2KcfByjov3PxUWyNbuvhpccb9Fofml6y6ektR3FJbLXA99NxG9B4Yov04c2f4cNrML
         575w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741993; x=1764346793;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiJ2ikZLnMpIOrPzKMNkQTilnVYsWyD1gNo1t1z/ih8=;
        b=vatQ1t5AtWqE4T5q1iXf16jEjCxbhpAFK6j69t+TtwON8B9lJnVp7kZDM//uh+LcY2
         z8Rlw1Iva2uOARdjyWYkfj75maoXRsKaFi28+pUYtU814OLQKmBhdsx4FNA5F3VxdgjQ
         jjG8X0UkoNd4RDexd1WaJYiubNdDYd094Iyfx/h+MhVO4PcqA6SAjqxb4O+u3PEm4bky
         R2e47R20yvSXdmDYnLXe40S7BL3uISO7xlhWujeR+JvkgYAKlzgSnGlnk7uu0wR2n54f
         77W/eE3z8l/8hHjLSYRt1Hx03e0/Z96XTVpF3le0kRfHUJ4gmVef20/s9q0mBra5YTNu
         OY0Q==
X-Gm-Message-State: AOJu0YwdZdpp2FSdBk3sSNnRE/Yv/GA8BHGuJvSjXu42sTkHlfzkUkCf
	TA6erzdPYND6ZSbt8fRZk2ka7YfwlD3IeoXCRNuf+pf1azGVIIw/4AX+mGPH8IwwQYmEWd4s6Jn
	bd0FL8c2t1MzI4LqhZU3UZmjQpf/7rXE=
X-Gm-Gg: ASbGnctoDvRe1diPjkvqLfg6aUZzSb/ShgILsvdf1Nv5CfijrBRESDLDcHqXLOFuI12
	vlnFc2sddPTD8rWnw6OBp3+zpgkfQwuQErbt6eJGW2L1ISF9sPK9se+sgSUnoPLvCBELIAucQGC
	nSESX6iH3W+7JsqBDTwbnNCFrMCHH67RBn4xqDHlRWXRRAvqJuJKfVEJHmZwXfy23OX6Z0Djh+r
	tQJEUJ1gYbHNdPDSovfARtqdyoc+eGdCR1+U02ywSUoNub+2YFO3z5oP2BF4L8ibVuYa8O1
X-Google-Smtp-Source: AGHT+IHS/Cy1AnQKPxgnT5una3dMNjshoOmkDJSrjYMiPIn4qde31QWukymrvT14EjrFbTMBOVqBdpuEZt7cPe6DjJ8=
X-Received: by 2002:a17:907:96a6:b0:b50:a389:7aa4 with SMTP id
 a640c23a62f3a-b7671547e0fmr284556666b.13.1763741992581; Fri, 21 Nov 2025
 08:19:52 -0800 (PST)
MIME-Version: 1.0
References: <20251121061252.2644203-1-vpuar@qti.qualcomm.com>
In-Reply-To: <20251121061252.2644203-1-vpuar@qti.qualcomm.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 21 Nov 2025 16:19:39 +0000
X-Gm-Features: AWmQ_bkR8vTzKB1zMB0E6axtJI8pR4GYzRSS6fqBgizF6yrfAtOWMD64KGfIMyQ
Message-ID: <CANPvuRkC16oj=twxLvfbx76P+yqvZOKE63Q=U=6LTAgwuGmM5A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] udev-extraconf: Split automount and autonet
 into seperate packages
To: vpuar@qti.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f180e706441d2edb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 16:19:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226689

--000000000000f180e706441d2edb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vivek

Vivek Puar via lists.openembedded.org <vpuar=3D
qti.qualcomm.com@lists.openembedded.org> escreveu (sexta, 21/11/2025 =C3=A0=
(s)
06:13):

> Created two subpackages (${PN}-automount and ${PN}-autonet) to separate
> udev rules and scripts for automount and autonet functionality. This
> allows
> selective installation, and reduces unnecessary dependencies for systems
> that only need one feature.
>
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> ---
>  meta/recipes-core/udev/udev-extraconf_1.1.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb
> b/meta/recipes-core/udev/udev-extraconf_1.1.bb
> index 2ba6606c05..7a63773d69 100644
> --- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
> +++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
> @@ -59,3 +59,16 @@ CONFFILES:${PN} =3D "${sysconfdir}/udev/mount.ignoreli=
st"
>  RPROVIDES:${PN} =3D "udev-extra-rules"
>  RREPLACES:${PN} =3D "udev-extra-rules"
>  RCONFLICTS:${PN} =3D "udev-extra-rules"
> +
> +PACKAGES =3D+ "${PN}-automount ${PN}-autonet"
> +
> +FILES:${PN}-automount =3D " \
> +    ${sysconfdir}/udev/rules.d/automount.rules \
> +    ${sysconfdir}/udev/scripts/mount.sh \
> +    ${sysconfdir}/udev/mount.ignorelist \
> +"
> +
> +FILES:${PN}-autonet =3D " \
> +    ${sysconfdir}/udev/rules.d/autonet.rules \
> +    ${sysconfdir}/udev/scripts/network.sh \
> +"
>

Can you also all these new packages in the runtime depends so the
behaviour is like before?

RDEPENDS:${PN} =3D "${PN}-automount ${PN}-autonet"

Thanks for the patch.

Jose

--=20
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226649):
> https://lists.openembedded.org/g/openembedded-core/message/226649
> Mute This Topic: https://lists.openembedded.org/mt/116404291/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000f180e706441d2edb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Vivek</div><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">Vivek Puar via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;vpuar=3D<=
a href=3D"mailto:qti.qualcomm.com@lists.openembedded.org">qti.qualcomm.com@=
lists.openembedded.org</a>&gt; escreveu (sexta, 21/11/2025 =C3=A0(s) 06:13)=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Created two su=
bpackages (${PN}-automount and ${PN}-autonet) to separate<br>
udev rules and scripts for automount and autonet functionality. This allows=
 <br>
selective installation, and reduces unnecessary dependencies for systems <b=
r>
that only need one feature.<br>
<br>
Signed-off-by: Vivek Puar &lt;<a href=3D"mailto:vpuar@qti.qualcomm.com" tar=
get=3D"_blank">vpuar@qti.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/udev/<a href=3D"http://udev-extraconf_1.1.bb" rel=
=3D"noreferrer" target=3D"_blank">udev-extraconf_1.1.bb</a> | 13 ++++++++++=
+++<br>
=C2=A01 file changed, 13 insertions(+)<br>
<br>
diff --git a/meta/recipes-core/udev/<a href=3D"http://udev-extraconf_1.1.bb=
" rel=3D"noreferrer" target=3D"_blank">udev-extraconf_1.1.bb</a> b/meta/rec=
ipes-core/udev/<a href=3D"http://udev-extraconf_1.1.bb" rel=3D"noreferrer" =
target=3D"_blank">udev-extraconf_1.1.bb</a><br>
index 2ba6606c05..7a63773d69 100644<br>
--- a/meta/recipes-core/udev/<a href=3D"http://udev-extraconf_1.1.bb" rel=
=3D"noreferrer" target=3D"_blank">udev-extraconf_1.1.bb</a><br>
+++ b/meta/recipes-core/udev/<a href=3D"http://udev-extraconf_1.1.bb" rel=
=3D"noreferrer" target=3D"_blank">udev-extraconf_1.1.bb</a><br>
@@ -59,3 +59,16 @@ CONFFILES:${PN} =3D &quot;${sysconfdir}/udev/mount.ignor=
elist&quot;<br>
=C2=A0RPROVIDES:${PN} =3D &quot;udev-extra-rules&quot;<br>
=C2=A0RREPLACES:${PN} =3D &quot;udev-extra-rules&quot;<br>
=C2=A0RCONFLICTS:${PN} =3D &quot;udev-extra-rules&quot;<br>
+<br>
+PACKAGES =3D+ &quot;${PN}-automount ${PN}-autonet&quot;<br>
+<br>
+FILES:${PN}-automount =3D &quot; \<br>
+=C2=A0 =C2=A0 ${sysconfdir}/udev/rules.d/automount.rules \<br>
+=C2=A0 =C2=A0 ${sysconfdir}/udev/scripts/mount.sh \<br>
+=C2=A0 =C2=A0 ${sysconfdir}/udev/mount.ignorelist \<br>
+&quot;<br>
+<br>
+FILES:${PN}-autonet =3D &quot; \<br>
+=C2=A0 =C2=A0 ${sysconfdir}/udev/rules.d/autonet.rules \<br>
+=C2=A0 =C2=A0 ${sysconfdir}/udev/scripts/network.sh \<br>
+&quot;<br></blockquote><div><br></div><div>Can you also all these new pack=
ages in the runtime depends so the behaviour=C2=A0is like before?</div><div=
>=C2=A0<br>RDEPENDS:${PN} =3D &quot;${PN}-automount ${PN}-autonet&quot;<br>=
<br>Thanks=C2=A0for the patch.<br><br>Jose<br><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#226649): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/226649" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/226649</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116404291/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116404291/5052612</a><br>
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

--000000000000f180e706441d2edb--

