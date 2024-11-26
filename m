Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20942D59D86
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 00:51:58 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.35300.1732582309117569846
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 16:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zy6P2rbK;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-71d4ba17cd2so848319a34.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 16:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732582308; x=1733187108; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LSbnynNFsQaTJWf6NkV7aLaVlzibZSVSmZiAbxR4J2Q=;
        b=Zy6P2rbKgnRII8H8X03DDMfyukBIsoI46/jx0+7bkaT+1UmIRDZA3K4EUQK9zta86b
         66rtNSwdQENrGXTX/Mo9eAJVFeBGV2wNdniph3yG826dBrXb1zu2ogp3XROycoY4W4up
         WSDMwhKBCJHtUgNVKgojt0AaEsUigscGdtxkKtEqpOn+cWLPpitE0RQakxacEY1wsEm+
         j7mzSPzHr4/lOOpxsHdu6ZZojMP3jyD845kOX6PG0+CASdHWEg6jZVE1LmDwzac38N6d
         m8kafWdf+5N4nNP0S2lGj6e98X97Kzo3baNqGkNivAi7dNaZZ4K2FXntqWEsG8YIdfyE
         k60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732582308; x=1733187108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSbnynNFsQaTJWf6NkV7aLaVlzibZSVSmZiAbxR4J2Q=;
        b=UlMVsmxVQe8jTCuEIjMTODTQhoo6OswTkSinYFgrevChoknEsncfGm/QgK1P9l4gf6
         QFEmZ9VPovwdUrbRAmZrpTP6u4WrNj7R88GHzD1p3W1NM1UwtxwurD3aaE12/SmRiiRW
         gWs0HHldZLGadBKx9FrmapIrI5Kvp/y9Yr+5AlB036Eckl+xxUKVGRpBWKXbMpZQWBoZ
         2RU577zO485IJaavfjiXLzLO4kYe71OjQOFsb4Btjb5R3fPK89zDVWnGX4OiPdDNFC8S
         08qIYN/xxxjTC3rY8XUTfe6kfdGDocYGvr+sWcCVF8nQbQLYHP1OHsr2/UfBEwx2EF/X
         sHCw==
X-Gm-Message-State: AOJu0YwOmAuLy5ZW+0RSqTOAaLnU8yIQV5Pht72YjTre3pBfWQdQkqfu
	0/z9+tRnMTN9S4yY8ahrjng2iYICEa/fI2s+bBGh+1V1W9L7L9tftjLd6bOPMIV9dx6MsF1D895
	x01nUXmKGpCKypYtny7VMEn+kyHI=
X-Gm-Gg: ASbGncsgdbIRcO1Zb1qlJGo32jHFU0m2am/MZxse+oAwP/NTAUllZcaLRuWFXFfuLn0
	75vBz0oyPP3fc8nwwRQ2LqKE7kUCUnFFoSjrUWD8YmerbpFN953CK+2yabBAmWgFh
X-Google-Smtp-Source: AGHT+IFoF34pe9yVGPreE/EFUH065S83PyaqZmCKey6BEFkshChR5DwMThVhaZSifH1MtJqeZOpoA9z0DDRA9zNwuNQ=
X-Received: by 2002:a05:6830:7103:b0:71d:3fe2:2053 with SMTP id
 46e09a7af769-71d3fe2254dmr9302675a34.21.1732582308218; Mon, 25 Nov 2024
 16:51:48 -0800 (PST)
MIME-Version: 1.0
References: <20241126000836.6901-1-hiagofranco@gmail.com> <20241126000836.6901-2-hiagofranco@gmail.com>
In-Reply-To: <20241126000836.6901-2-hiagofranco@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Nov 2024 16:51:37 -0800
Message-ID: <CAMKF1spfQeh1i07Wwg5ndJ7uJpQ=Pz1eeCWc1J1KBLUfY78=9A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/3] hwdata: add recipe from meta-openembedded
To: hiagofranco@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Denys Dmytriyenko <denis@denix.org>, Ross Burton <Ross.Burton@arm.com>, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: multipart/alternative; boundary="000000000000068d090627c641af"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 00:51:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207807

--000000000000068d090627c641af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Don=E2=80=99t forget to send a patch to remove it from meta-oe once it get =
merged
into core layer here

On Mon, Nov 25, 2024 at 4:10=E2=80=AFPM Hiago De Franco via lists.openembed=
ded.org
<hiagofranco=3Dgmail.com@lists.openembedded.org> wrote:

> From: Hiago De Franco <hiago.franco@toradex.com>
>
> Move hwdata recipe from meta-openembedded to openembedded-core.
>
> libdisplay-info is now a requirement for Weston, since commit
> a16598b038b2 ("backend-drm: make libdisplay-info mandatory"). However,
> in order to build libdisplay-info, hwdata is required. Since Weston is
> built inside openembedded-core, move hwdata in order to be able to
> upgrade Weston, so oe-core has no dependency on meta-oe.
>
> hwdata contains various hardware identification and configuration data.
>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
>  meta/conf/distro/include/maintainers.inc    |  1 +
>  meta/recipes-support/hwdata/hwdata_0.389.bb | 30 +++++++++++++++++++++
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta/recipes-support/hwdata/hwdata_0.389.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index d61b88f7de6c..04208ebbf22b 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -262,6 +262,7 @@ RECIPE_MAINTAINER:pn-harfbuzz =3D "Anuj Mittal <
> anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-hdparm =3D "Denys Dmytriyenko <denis@denix.org>"
>  RECIPE_MAINTAINER:pn-help2man =3D "Hongxu Jia <hongxu.jia@windriver.com>=
"
>  RECIPE_MAINTAINER:pn-hicolor-icon-theme =3D "Anuj Mittal <
> anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-hwdata =3D "Hiago De Franco <hiago.franco@toradex.c=
om
> >"
>  RECIPE_MAINTAINER:pn-hwlatdetect =3D "Alexander Kanavin <
> alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-i2c-tools =3D "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-icecc-create-env =3D "Joshua Watt <
> JPEWhacker@gmail.com>"
> diff --git a/meta/recipes-support/hwdata/hwdata_0.389.bb
> b/meta/recipes-support/hwdata/hwdata_0.389.bb
> new file mode 100644
> index 000000000000..8ab455cd2e99
> --- /dev/null
> +++ b/meta/recipes-support/hwdata/hwdata_0.389.bb
> @@ -0,0 +1,30 @@
> +SUMMARY =3D "Hardware identification and configuration data"
> +DESCRIPTION =3D "hwdata contains various hardware identification and \
> +configuration data, such as the pci.ids and usb.ids databases."
> +HOMEPAGE =3D "https://github.com/vcrhonek/hwdata"
> +SECTION =3D "System/Base"
> +
> +LICENSE =3D "GPL-2.0-or-later | XFree86-1.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1556547711e8246992b999edd9445=
a57"
> +
> +SRC_URI =3D "git://
> github.com/vcrhonek/${BPN}.git;branch=3Dmaster;protocol=3Dhttps
> <http://github.com/vcrhonek/$%7BBPN%7D.git;branch=3Dmaster;protocol=3Dhtt=
ps>"
> +SRCREV =3D "5313a12eb992a354c17fc895c1d69c8c42b09a06"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit allarch
> +
> +do_configure() {
> +    ${S}/configure --datadir=3D${datadir} --libdir=3D${libdir}
> +}
> +
> +do_compile[noexec] =3D "1"
> +
> +do_install() {
> +    oe_runmake install DESTDIR=3D${D}
> +}
> +
> +FILES:${PN} =3D "${libdir}/* \
> +               ${datadir}/* "
> +
> +BBCLASSEXTEND +=3D "native"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207804):
> https://lists.openembedded.org/g/openembedded-core/message/207804
> Mute This Topic: https://lists.openembedded.org/mt/109782305/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000068d090627c641af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Don=E2=80=99t forget to send a patch to remove it from me=
ta-oe once it get merged into core layer here=C2=A0</div><div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 25, 202=
4 at 4:10=E2=80=AFPM Hiago De Franco via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;hiagofranco=3D<a href=3D"mailto:gmai=
l.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">From: Hiago De Franco &lt;<a hre=
f=3D"mailto:hiago.franco@toradex.com" target=3D"_blank">hiago.franco@torade=
x.com</a>&gt;<br>
<br>
Move hwdata recipe from meta-openembedded to openembedded-core.<br>
<br>
libdisplay-info is now a requirement for Weston, since commit<br>
a16598b038b2 (&quot;backend-drm: make libdisplay-info mandatory&quot;). How=
ever,<br>
in order to build libdisplay-info, hwdata is required. Since Weston is<br>
built inside openembedded-core, move hwdata in order to be able to<br>
upgrade Weston, so oe-core has no dependency on meta-oe.<br>
<br>
hwdata contains various hardware identification and configuration data.<br>
<br>
Signed-off-by: Hiago De Franco &lt;<a href=3D"mailto:hiago.franco@toradex.c=
om" target=3D"_blank">hiago.franco@toradex.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0meta/recipes-support/hwdata/<a href=3D"http://hwdata_0.389.bb" rel=3D=
"noreferrer" target=3D"_blank">hwdata_0.389.bb</a> | 30 +++++++++++++++++++=
++<br>
=C2=A02 files changed, 31 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/hwdata/<a href=3D"http://hwda=
ta_0.389.bb" rel=3D"noreferrer" target=3D"_blank">hwdata_0.389.bb</a><br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index d61b88f7de6c..04208ebbf22b 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -262,6 +262,7 @@ RECIPE_MAINTAINER:pn-harfbuzz =3D &quot;Anuj Mittal &lt=
;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@int=
el.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-hdparm =3D &quot;Denys Dmytriyenko &lt;<a href=
=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;&quot;=
<br>
=C2=A0RECIPE_MAINTAINER:pn-help2man =3D &quot;Hongxu Jia &lt;<a href=3D"mai=
lto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a=
>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-hicolor-icon-theme =3D &quot;Anuj Mittal &lt;<a =
href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.c=
om</a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-hwdata =3D &quot;Hiago De Franco &lt;<a href=3D"mailt=
o:hiago.franco@toradex.com" target=3D"_blank">hiago.franco@toradex.com</a>&=
gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-hwlatdetect =3D &quot;Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.=
com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-i2c-tools =3D &quot;Anuj Mittal &lt;<a href=3D"m=
ailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt=
;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-icecc-create-env =3D &quot;Joshua Watt &lt;<a hr=
ef=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JPEWhacker@gmail.com</=
a>&gt;&quot;<br>
diff --git a/meta/recipes-support/hwdata/<a href=3D"http://hwdata_0.389.bb"=
 rel=3D"noreferrer" target=3D"_blank">hwdata_0.389.bb</a> b/meta/recipes-su=
pport/hwdata/<a href=3D"http://hwdata_0.389.bb" rel=3D"noreferrer" target=
=3D"_blank">hwdata_0.389.bb</a><br>
new file mode 100644<br>
index 000000000000..8ab455cd2e99<br>
--- /dev/null<br>
+++ b/meta/recipes-support/hwdata/<a href=3D"http://hwdata_0.389.bb" rel=3D=
"noreferrer" target=3D"_blank">hwdata_0.389.bb</a><br>
@@ -0,0 +1,30 @@<br>
+SUMMARY =3D &quot;Hardware identification and configuration data&quot;<br>
+DESCRIPTION =3D &quot;hwdata contains various hardware identification and =
\<br>
+configuration data, such as the pci.ids and usb.ids databases.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/vcrhonek/hwdata" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/vcrhonek/hwdata</a>&quot;<b=
r>
+SECTION =3D &quot;System/Base&quot;<br>
+<br>
+LICENSE =3D &quot;GPL-2.0-or-later | XFree86-1.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D1556547711e8246992b999edd9=
445a57&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/vcrhonek/$%7BBPN%7D.g=
it;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/vcrhonek/${BPN}.git;branch=3Dmaster;protocol=3Dhttps</a>&quot;<br=
>
+SRCREV =3D &quot;5313a12eb992a354c17fc895c1d69c8c42b09a06&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit allarch<br>
+<br>
+do_configure() {<br>
+=C2=A0 =C2=A0 ${S}/configure --datadir=3D${datadir} --libdir=3D${libdir}<b=
r>
+}<br>
+<br>
+do_compile[noexec] =3D &quot;1&quot;<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 oe_runmake install DESTDIR=3D${D}<br>
+}<br>
+<br>
+FILES:${PN} =3D &quot;${libdir}/* \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/* &quot;=
<br>
+<br>
+BBCLASSEXTEND +=3D &quot;native&quot;<br>
-- <br>
2.39.5<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#207804): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/207804" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/207804</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109782305/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109782305/1997914</a><br>
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

--000000000000068d090627c641af--

