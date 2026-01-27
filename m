Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2EFD340B6
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 16:44:31 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16303.1769532263525075571
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 08:44:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O5wrvXtS;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7947072d0f6so16078277b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 08:44:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769532262; cv=none;
        d=google.com; s=arc-20240605;
        b=Npl6f/33giZSQzRTA09VG9UwTAedjEsI7yOF7ps14BjIZ96XMVcIdPRCzgIssDk9qy
         58CxeqDN3YSAtHUbFoqf453ZYifFv/vUPwaUicDPCCvqmZQzkUu/B8t9CgJPUc+HSYnP
         HPaIWLLzaxFRXpTLXfC19jNLtAVwuvSzzTOTGPCLvUHsVp9g/yVi2XN2YXGlkwKZuTRc
         sgtU0SBlWOFjnjXQ5niaEc1s9Sq1oyNAN+L5J+HxRhSE5zKjDMoqER4KMuxTFLINvGNn
         i7x/gtTu3BTQEH4iPHhnRrE0sxyzQmPqzl63GZmVbOzjx4oBkbmEFLbHyUV02S7idmTR
         PRsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E8Ip4nNjVlffWHmG8ayu2OdVekA/tAZIRuvh0Os24+w=;
        fh=zcX3bZ/T0LOvS6nphuex0OH2KQxjIIsAJwAEKDVS3CM=;
        b=VRE1z+sfKOaXPHtonibZhsZCFPkZRl4tTvaFYjGGS4XhEnppbLOD+Y1YyYvc0YkqUJ
         yvmcpUbIL8+vzaIMEECBHwqhY8LD5x0C509QI7VCfNsnC0Ovyq679OUrqWXJfJ2iCck4
         En+OI+UaAbhFR/VEFKXiCUx+oDJ8LNWZQrA2HakymyDy1RhiCSP+Mjdxy9SqKljawpbq
         Zwjbu6pER3WXeZLKAHLOrx/TmJi3Iv95I92f42KQQP8oZwtpm9PjfVtrrASPeIGW5yoG
         aoKekFtBtG0tExgx/a1VwS6qYVrVKqd6ZyDzHRz0MwHay7C9Uf56qnP1+Zb4lHEMjDyr
         gN6A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769532262; x=1770137062; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E8Ip4nNjVlffWHmG8ayu2OdVekA/tAZIRuvh0Os24+w=;
        b=O5wrvXtSTllxQgF5UYFWJiAvH5KZcGdyR54Y9IQdr2SSXcb0pXs0JqdQWefuAHApWX
         UEBq30NaY6WXmrUMGftZev7UC9qGQB/An3PDzRn6uxd9JzGBLg0a0j4cKPAQSjUFsQ8N
         ssnyCxPZrjJTcdv07S4MbZB7miwvR6mp2+FK9AdKV2XMS0xChnMAwqpOAr2ytjXy+SXO
         4T4wDMSVl6bpleDjFjlJ0Ust6tyXvJua3+prbHmRci8tp5wyVjeDEpP3GkJahUEqx1m8
         zeiOB62d8SXj4ZC8k/4pzeTKUDDaMuFGKTJpBdTQHeOJdHWh0+jHHmMeZ1BqclyiyUl+
         DKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769532262; x=1770137062;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8Ip4nNjVlffWHmG8ayu2OdVekA/tAZIRuvh0Os24+w=;
        b=Mk+64kWtwooI4Y1fLP61ugv4mqWcfo2FueU1+V5AJPmH+XR64FrJdtdHtiY/xDa6LS
         Dv6aC3psO5uH5AVV/ogJGqWEJ55DiQ0UvTksWFxeqNVfI2d1ra73yMrDBj1xdGJtPBws
         AUpCkFKC1kZKOhW7TPVqPI5VD4IgfedaA6t2fnpw/skklkKWGxksuPyF+TE3dWJ7ReE2
         nCF1zjGS+zATZwnjCFbsAvzkRJvCAD6146sMBlG1Wu05jhU6tMyqHgsn1RsHYO939KWS
         7933KWaH13MQs33tdqc28qAKzfJXHOb9AtFJY9WAYbSDw7FhxseJeDGJanNiwBJU0Gsn
         xaVg==
X-Gm-Message-State: AOJu0Yx0H20/5pM3alK63BDNtNOC5GiJUJNXTAtdQElP0+GfkEjcSChI
	a5+3doUpvmW6sdy/1wAtPSrGQGSxHItNA1lebpwYsVFmaiYW3SfLVYTHSxmcX3Y0gzTVyDHfque
	VPLE3UhBIRJdwsycAb6nTiIWYTx3+knw=
X-Gm-Gg: AZuq6aJtLkXahGQP4vNLkQhC2DZzRh5cSA7Ze5A/0Ap2JwO0xMya/v62JkJGF0Pu8Wf
	CjPuNgny/el3JE9y7a/dGOgRmwTi7fwvmQ8vY/WKIBqkGjP9+rA8CIYCd9D9B2vUI/sGZtLpKQC
	6Vfgn6UXzOE3unSd3PVNQPeku6eEtprlA8khNNPEB6HgVtvmPaS/ABSNIa+BYiXYLNNqdy+y7/5
	UG2i1OZyMX6SolwbStdkVe3ZXk7gKEcreF3WXBRqFubW3h/CSk/LUt3AFt39oNyvmN7W5XRTof2
	ZcynCEj/yRHs/ud9tDNT0QvvnC+H8M9o0JNTNJpRAibCTreJNnS6ZIxVodVwqoYcODAkaCQf20x
	2zkKN9lj8id1ctXBqTXlJYEbtbr7mpN72i2YxKzjkCgmbuH3Aa9qR1pjN
X-Received: by 2002:a05:690c:34c9:b0:794:7ca5:6599 with SMTP id
 00721157ae682-7947ca57409mr13574607b3.17.1769532262260; Tue, 27 Jan 2026
 08:44:22 -0800 (PST)
MIME-Version: 1.0
References: <20260127151526.788157-1-yi.zhao@windriver.com>
In-Reply-To: <20260127151526.788157-1-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Jan 2026 08:43:55 -0800
X-Gm-Features: AZwV_QgG7xUuzJHcu1qqW9yIFbWiMLqYMegTs7zVPLxGETbMnz3AGAKjEdJ5Cg4
Message-ID: <CAMKF1sqJzqxU7MwazMApp3WK2+rj3n_Zx+yA0E3ykeMwWGYAzQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2 v4] blueprint-compiler: add recipe
To: yi.zhao@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org, liuyd.fnst@fujitsu.com
Content-Type: multipart/alternative; boundary="000000000000e925360649615558"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 16:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230057

--000000000000e925360649615558
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is 0.19.0 upgrade posted for meta-gnome, please bring that upgrade
here as well.

On Tue, Jan 27, 2026 at 7:15=E2=80=AFAM Yi Zhao via lists.openembedded.org =
<yi.zhao=3D
eng.windriver.com@lists.openembedded.org> wrote:

> Blueprint-compiler is a markup language and compiler for GTK 4 user
> interfaces.
>
> Move it from meta-openembedded to openembedded-core as it is required by
> epiphany 49.2.
>
> The original author Liu Yiding, is willing to continue maintaining the
> recipe. Add him as maintainer for this.
>
> CC: Liu Yiding <liuyd.fnst@fujitsu.com>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
> v2 changes: Add tag=3D${PV} in SRC_URI
> v3 changes: Fix python site path when enable multilib
> v4 changes: Fix python site path according to Alex's suggestion
>
>  meta/conf/distro/include/maintainers.inc         |  1 +
>  .../blueprint-compiler_0.18.0.bb                 | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 meta/recipes-gnome/blueprint-compiler/
> blueprint-compiler_0.18.0.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index e830648945..b231daf485 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -71,6 +71,7 @@ RECIPE_MAINTAINER:pn-binutils-testsuite =3D "Khem Raj <
> raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-binutils-crosssdk-${SDK_SYS} =3D "Khem Raj <
> raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-bison =3D "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-blktrace =3D "Unassigned <unassigned@yoctoproject.o=
rg
> >"
> +RECIPE_MAINTAINER:pn-blueprint-compiler =3D "Liu Yiding <
> liuyd.fnst@fujitsu.com>"
>  RECIPE_MAINTAINER:pn-bluez5 =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-bmaptool =3D "Trevor Woerner <twoerner@gmail.com>"
>  RECIPE_MAINTAINER:pn-boost =3D "Unassigned <unassigned@yoctoproject.org>=
"
> diff --git a/meta/recipes-gnome/blueprint-compiler/
> blueprint-compiler_0.18.0.bb b/meta/recipes-gnome/blueprint-compiler/
> blueprint-compiler_0.18.0.bb
> new file mode 100644
> index 0000000000..2a6636d8ac
> --- /dev/null
> +++ b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "A markup language for GTK user interface files."
> +HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/blueprint-compiler"
> +LICENSE =3D "LGPL-3.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3000208d539ec061b899bce1d9ce9=
404"
> +
> +SRC_URI =3D "git://
> gitlab.gnome.org/GNOME/blueprint-compiler;protocol=3Dhttps;branch=3Dmain;=
tag=3D${PV}
> <http://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=3Dhttps;branch=
=3Dmain;tag=3D$%7BPV%7D>
> "
> +SRCREV =3D "07c9c9df9cd1b6b4454ecba21ee58211e9144a4b"
> +
> +inherit meson pkgconfig python3targetconfig
> +
> +PACKAGES +=3D "${PN}-python"
> +
> +FILES:${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}"
> +RDEPENDS:${PN}-python =3D "python3-pygobject"
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230051):
> https://lists.openembedded.org/g/openembedded-core/message/230051
> Mute This Topic: https://lists.openembedded.org/mt/117489774/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e925360649615558
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is 0.19.0 upgrade posted for meta-gnome, please brin=
g that upgrade here as well.=C2=A0</div><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 27, 202=
6 at 7:15=E2=80=AFAM Yi Zhao via <a href=3D"http://lists.openembedded.org">=
lists.openembedded.org</a> &lt;yi.zhao=3D<a href=3D"mailto:eng.windriver.co=
m@lists.openembedded.org">eng.windriver.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Blueprint=
-compiler is a markup language and compiler for GTK 4 user<br>
interfaces.<br>
<br>
Move it from meta-openembedded to openembedded-core as it is required by<br=
>
epiphany 49.2.<br>
<br>
The original author Liu Yiding, is willing to continue maintaining the<br>
recipe. Add him as maintainer for this.<br>
<br>
CC: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"_bla=
nk">liuyd.fnst@fujitsu.com</a>&gt;<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
---<br>
v2 changes: Add tag=3D${PV} in SRC_URI<br>
v3 changes: Fix python site path when enable multilib<br>
v4 changes: Fix python site path according to Alex&#39;s suggestion<br>
<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 1 +<br>
=C2=A0.../<a href=3D"http://blueprint-compiler_0.18.0.bb" rel=3D"noreferrer=
" target=3D"_blank">blueprint-compiler_0.18.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 ++++++++++++++++<br>
=C2=A02 files changed, 17 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-gnome/blueprint-compiler/<a href=3D"h=
ttp://blueprint-compiler_0.18.0.bb" rel=3D"noreferrer" target=3D"_blank">bl=
ueprint-compiler_0.18.0.bb</a><br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index e830648945..b231daf485 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -71,6 +71,7 @@ RECIPE_MAINTAINER:pn-binutils-testsuite =3D &quot;Khem Ra=
j &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmai=
l.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-binutils-crosssdk-${SDK_SYS} =3D &quot;Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.=
com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-bison =3D &quot;Chen Qi &lt;<a href=3D"mailto:Qi=
.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;&quot;<=
br>
=C2=A0RECIPE_MAINTAINER:pn-blktrace =3D &quot;Unassigned &lt;<a href=3D"mai=
lto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.=
org</a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-blueprint-compiler =3D &quot;Liu Yiding &lt;<a href=
=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"_blank">liuyd.fnst@fujitsu.com=
</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-bluez5 =3D &quot;Unassigned &lt;<a href=3D"mailt=
o:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.or=
g</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-bmaptool =3D &quot;Trevor Woerner &lt;<a href=3D=
"mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&gt;&qu=
ot;<br>
=C2=A0RECIPE_MAINTAINER:pn-boost =3D &quot;Unassigned &lt;<a href=3D"mailto=
:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.org=
</a>&gt;&quot;<br>
diff --git a/meta/recipes-gnome/blueprint-compiler/<a href=3D"http://bluepr=
int-compiler_0.18.0.bb" rel=3D"noreferrer" target=3D"_blank">blueprint-comp=
iler_0.18.0.bb</a> b/meta/recipes-gnome/blueprint-compiler/<a href=3D"http:=
//blueprint-compiler_0.18.0.bb" rel=3D"noreferrer" target=3D"_blank">bluepr=
int-compiler_0.18.0.bb</a><br>
new file mode 100644<br>
index 0000000000..2a6636d8ac<br>
--- /dev/null<br>
+++ b/meta/recipes-gnome/blueprint-compiler/<a href=3D"http://blueprint-com=
piler_0.18.0.bb" rel=3D"noreferrer" target=3D"_blank">blueprint-compiler_0.=
18.0.bb</a><br>
@@ -0,0 +1,16 @@<br>
+SUMMARY =3D &quot;A markup language for GTK user interface files.&quot;<br=
>
+HOMEPAGE =3D &quot;<a href=3D"https://gitlab.gnome.org/GNOME/blueprint-com=
piler" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/=
blueprint-compiler</a>&quot;<br>
+LICENSE =3D &quot;LGPL-3.0-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D3000208d539ec061b899bce1d9=
ce9404&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://gitlab.gnome.org/GNOME/blueprint=
-compiler;protocol=3Dhttps;branch=3Dmain;tag=3D$%7BPV%7D" rel=3D"noreferrer=
" target=3D"_blank">gitlab.gnome.org/GNOME/blueprint-compiler;protocol=3Dht=
tps;branch=3Dmain;tag=3D${PV}</a>&quot;<br>
+SRCREV =3D &quot;07c9c9df9cd1b6b4454ecba21ee58211e9144a4b&quot;<br>
+<br>
+inherit meson pkgconfig python3targetconfig<br>
+<br>
+PACKAGES +=3D &quot;${PN}-python&quot;<br>
+<br>
+FILES:${PN}-python =3D &quot;${PYTHON_SITEPACKAGES_DIR}&quot;<br>
+RDEPENDS:${PN}-python =3D &quot;python3-pygobject&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#230051): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/230051" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/230051</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117489774/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117489774/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000e925360649615558--

