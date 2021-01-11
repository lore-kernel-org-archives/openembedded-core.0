Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web08.1078.1610390683557076272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 10:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EBqDnQFX;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id s2so85296vsk.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Jan 2021 10:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QwbfbWQwLJ14BvwprxSmEQeT1d0+rtqjut2oh3x87lI=;
        b=EBqDnQFX3ktD6bBsC2vpWke1EzeBDcRGIyZQ9bxzqd60LVuERKS5DfnUqdsg96ZuwX
         LGFu2EYjP0C852bLyqj6Kz74WbMG3aXJqO4Uk6VeRj1j8iMtRK7aebVB27VfWk0odevo
         MtfY3aSAIbMSecPqhpKVDpAuINjN5RipTTWU9Q2ZgVsBJb9kVnTs+Sw0WAr2KurX3dLG
         JOtSIldc88hvcXBznWyLI8ironBRHBnFolaSQ67oqpZy0ISSKMqFv4IdMHZUEXWjnLWr
         JKZmDVgj3zG/AjYMKjhp7pRyXXmmml/BobQY+TYH/pvDv/+yh0GglFFBTFNF4X0V5s7S
         HKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QwbfbWQwLJ14BvwprxSmEQeT1d0+rtqjut2oh3x87lI=;
        b=n9iEhs/aBFQPeyQkR7SHSF0HJANnTj5vlbIPZ8b1apinlMVYicO/TqNe2B5Dtee6V2
         yo1EKMvaBoIxBwqpX+U5OwtAhLibvaCE9KXsfzwEV247il4d1eP2hUlLwKk5jha5BXDq
         ycCCrEIL+chXBfW6Pd7G7iqd40wukfqK2kgZhRYlEUUFhZv2jFgipwN4Be6WEjYa7yT2
         XDpKYsXs/wZPCmU3jNNXGuRq/eZbdUDy/79vZHQ0xWdgUOQhLH/gPOsNBx/5ZsbIIzIh
         F89jSDDmpV3d73/yKSJEXEHwZDZ5pRVGHWcFtu0xInoCraKxeiElnl4z8CR0EJsjrknp
         QRmg==
X-Gm-Message-State: AOAM531WXfetfPfuV6tnK10Bq0LrQq+GGBNqvbyEuhCAOWXasxvL2lAd
	6t51auaCr9bWiSA5claUCFSbfbhVPrmPhil4b6M=
X-Google-Smtp-Source: ABdhPJxDNcjxFbgBN2QGfHjOCkq/cldEIlvLka9VBS5omyARU1uZH4+fp99UZ/c7RZ/3a18W8gcdSCjvnWBH1ro+ZiQ=
X-Received: by 2002:a67:c89e:: with SMTP id v30mr825013vsk.54.1610390682602;
 Mon, 11 Jan 2021 10:44:42 -0800 (PST)
MIME-Version: 1.0
References: <1610369123-220800-1-git-send-email-michael.ho@bmw.de>
 <CANNYZj994v93KxdpRZrpQ3p2sCTkhk6DJDRGhCPh4uw6fDMo3g@mail.gmail.com>
 <B5AACA79-EC38-460D-BA56-6BB7350CF7C5@bmw.de> <CANNYZj8n=-2kD8cXufcyiG+59Y6R7zyZNSLOtxOzsD277pcBxQ@mail.gmail.com>
 <48E89C79-DCF6-4AB8-B362-0846382C3208@bmw.de>
In-Reply-To: <48E89C79-DCF6-4AB8-B362-0846382C3208@bmw.de>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 11 Jan 2021 19:44:31 +0100
Message-ID: <CANNYZj9ysR=FRKbZ8jC9mkNHtVkA0AZfA5EXk68jGwSTV-pTcA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rootfs_ipk: allow do_populate_sdk in parallel to do_rootfs
To: Michael Ho <Michael.Ho@bmw.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000096110f05b8a44c1d"

--00000000000096110f05b8a44c1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Right, then don't bother with deb. The level of support for deb in Yocto is
significantly less than for rpm/ipk, and we do not require feature parity
for all three.

Thanks,
Alex

On Mon, 11 Jan 2021 at 17:25, <Michael.Ho@bmw.de> wrote:

> Hello Alex,
>
>
>
> Seems to not be so quick to change for the deb packages. First I had
> issues building the sdk on
> the master branch as it runs some postinst scripts that leak out of the
> yocto sandbox and into
> the host system [1]. Not sure if that=E2=80=99s a recent regression as I=
 don=E2=80=99t
> normally use deb packages
> in Yocto.
>
>
>
> Then I found that apt will fight over a lock file written into the
> recipe-sysroots-native directory [2].
> I am not so familiar with apt-get to resolve that trivially. I=E2=80=99l=
l try to
> re-visit it another day.
>
>
>
> Kind regards,
>
> Michael
>
>
>
> [1]
>
> Setting up nativesdk-shadow (4.8.1-r0) ...
>
> mkdir: cannot create directory =E2=80=98/usr/lib/opkg=E2=80=99: Permissi=
on denied
>
> dpkg: error processing package nativesdk-shadow (--configure):
>
>  installed nativesdk-shadow package post-installation script subprocess
> returned error exit status 1
>
>
>
> [2]
>
> E: Could not get lock
> /nvme/poky/build-deb/tmp/work/qemux86_64-poky-linux/core-image-minimal/1=
.0-r0/recipe-sysroot-native/var/cache/apt/archives/lock
> - open (11: Resource temporarily unavailable)
>
>
>
> --
>
> *BMW Car IT GmbH*
> Michael Ho
> Spezialist Entwicklung =E2=80=93 Build and Release Engineering
> Lise-Meitner-Stra=C3=9Fe 14
> 89081 Ulm
>
> Tel.: =C2=AD+49-731-37804-071
>
> Mobil: +49-152-54980-471
> Fax: +49-731-37804-001
> Mail: michael.ho@bmw-carit.de
> Web: http://www.bmw-carit.de
> ------------------------------------------------------------------------=
-
> BMW Car IT GmbH
> Gesch=C3=A4ftsf=C3=BChrer: Kai-Uwe Balszuweit und Michael B=C3=B6ttrich
> Sitz und Registergericht: M=C3=BCnchen HRB 134810
> ------------------------------------------------------------------------=
-
>
>
>
>
>
> *From: *Alexander Kanavin <alex.kanavin@gmail.com>
> *Date: *Monday, 11. January 2021 at 15:45
> *To: *"Ho Michael, JC-3UL" <Michael.Ho@bmw.de>
> *Cc: *OE-core <openembedded-core@lists.openembedded.org>
> *Subject: *Re: [OE-core] [PATCH] rootfs_ipk: allow do_populate_sdk in
> parallel to do_rootfs
>
>
>
> If you can fix the deb packaging easily, then please do so, but it is no=
t
> mandatory, and don't spend too much time if it turns out to be a time si=
nk.
>
>
>
> Alex
>
>
>
> On Mon, 11 Jan 2021 at 15:01, <Michael.Ho@bmw.de> wrote:
>
> Hello Alexander,
>
>
>
> Did a quick test and it seems the rpm packaging classes don=E2=80=99t ha=
ve this
> issue. The rootfs_deb bbclass however has the same lock files like with
> rootfs_ipk.
>
> Should I try to patch this too to keep them aligned?
>
>
>
> Kind regards,
>
> Michael
>
>
>
> --
>
> *BMW Car IT GmbH*
> Michael Ho
> Spezialist Entwicklung =E2=80=93 Build and Release Engineering
> Lise-Meitner-Stra=C3=9Fe 14
> 89081 Ulm
>
> Tel.: =C2=AD+49-731-37804-071
>
> Mobil: +49-152-54980-471
> Fax: +49-731-37804-001
> Mail: michael.ho@bmw-carit.de
> Web: http://www.bmw-carit.de
> ------------------------------------------------------------------------=
-
> BMW Car IT GmbH
> Gesch=C3=A4ftsf=C3=BChrer: Kai-Uwe Balszuweit und Michael B=C3=B6ttrich
> Sitz und Registergericht: M=C3=BCnchen HRB 134810
> ------------------------------------------------------------------------=
-
>
>
>
>
>
> *From: *Alexander Kanavin <alex.kanavin@gmail.com>
> *Date: *Monday, 11. January 2021 at 13:46
> *To: *"Ho Michael, JC-3UL" <Michael.Ho@bmw.de>
> *Cc: *OE-core <openembedded-core@lists.openembedded.org>
> *Subject: *Re: [OE-core] [PATCH] rootfs_ipk: allow do_populate_sdk in
> parallel to do_rootfs
>
>
>
> Does deb/rpm packaging already have this feature?
>
>
>
> Alex
>
>
>
> On Mon, 11 Jan 2021 at 13:45, Michael Ho <Michael.Ho@bmw.de> wrote:
>
> From: Michael Ho <Michael.Ho@bmw.de>
>
> Switch do_populate_sdk for the ipk package manager to use a separate tar=
get
> opkg config file and separate the lockfiles restricting do_rootfs and
> do_populate_sdk from running in parallel.
>
> This way if an image recipe includes a dependency to do_populate_sdk by
> default then it will run in parallel to do_rootfs saving time compared t=
o
> the
> sequential execution.
>
> Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
> ---
>  meta/classes/package_ipk.bbclass       | 1 +
>  meta/classes/rootfs_ipk.bbclass        | 4 ++--
>  meta/lib/oe/package_manager/ipk/sdk.py | 6 ++++++
>  3 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/package_ipk.bbclass
> b/meta/classes/package_ipk.bbclass
> index 79cb36c..d31dba0 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -4,6 +4,7 @@ IMAGE_PKGTYPE ?=3D "ipk"
>
>  IPKGCONF_TARGET =3D "${WORKDIR}/opkg.conf"
>  IPKGCONF_SDK =3D  "${WORKDIR}/opkg-sdk.conf"
> +IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.conf"
>
>  PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
>
> diff --git a/meta/classes/rootfs_ipk.bbclass
> b/meta/classes/rootfs_ipk.bbclass
> index f1e0219..245c256 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -14,8 +14,8 @@ do_rootfs[recrdeptask] +=3D "do_package_write_ipk
> do_package_qa"
>  do_rootfs[vardeps] +=3D "PACKAGE_FEED_URIS PACKAGE_FEED_BASE_PATHS
> PACKAGE_FEED_ARCHS"
>
>  do_rootfs[lockfiles] +=3D "${WORKDIR}/ipk.lock"
> -do_populate_sdk[lockfiles] +=3D "${WORKDIR}/ipk.lock"
> -do_populate_sdk_ext[lockfiles] +=3D "${WORKDIR}/ipk.lock"
> +do_populate_sdk[lockfiles] +=3D "${WORKDIR}/sdk-ipk.lock"
> +do_populate_sdk_ext[lockfiles] +=3D "${WORKDIR}/sdk-ipk.lock"
>
>  OPKG_PREPROCESS_COMMANDS =3D ""
>
> diff --git a/meta/lib/oe/package_manager/ipk/sdk.py
> b/meta/lib/oe/package_manager/ipk/sdk.py
> index 37af034..e2ca415 100644
> --- a/meta/lib/oe/package_manager/ipk/sdk.py
> +++ b/meta/lib/oe/package_manager/ipk/sdk.py
> @@ -14,6 +14,12 @@ class PkgSdk(Sdk):
>      def __init__(self, d, manifest_dir=3DNone):
>          super(PkgSdk, self).__init__(d, manifest_dir)
>
> +        # In sdk_list_installed_packages the call to opkg is hardcoded =
to
> +        # always use IPKGCONF_TARGET and there's no exposed API to chan=
ge
> this
> +        # so simply override IPKGCONF_TARGET to use this separated conf=
ig
> file.
> +        ipkgconf_sdk_target =3D d.getVar("IPKGCONF_SDK_TARGET")
> +        d.setVar("IPKGCONF_TARGET", ipkgconf_sdk_target)
> +
>          self.target_conf =3D self.d.getVar("IPKGCONF_TARGET")
>          self.host_conf =3D self.d.getVar("IPKGCONF_SDK")
>
> --
> 2.7.4
>
>
>=20
>
>

--00000000000096110f05b8a44c1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right, then don&#39;t bother with deb. The level of s=
upport for deb in Yocto is significantly less than for rpm/ipk, and we do n=
ot require feature parity for all three.</div><div><br></div><div>Thanks,<b=
r></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, 11 Jan 2021 at 17:25, &lt;<a href=3D"mai=
lto:Michael.Ho@bmw.de">Michael.Ho@bmw.de</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">





<div style=3D"overflow-wrap: break-word;" lang=3D"en-DE">
<div class=3D"gmail-m_-6787189458296363001WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-AU">Hello Alex,<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU"><u></u>=C2=A0<u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">Seems to not be so quick to ch=
ange for the deb packages. First I had issues building the sdk on<br>
the master branch as it runs some postinst scripts that leak out of the yo=
cto sandbox and into<br>
the host system [1]. Not sure if that=E2=80=99s a recent regression as I d=
on=E2=80=99t normally use deb packages<br>
in Yocto.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU"><u></u>=C2=A0<u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">Then I found that apt will fig=
ht over a lock file written into the recipe-sysroots-native directory [2].<=
br>
I am not so familiar with apt-get to resolve that trivially. I=E2=80=99ll =
try to re-visit it another day.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU"><u></u>=C2=A0<u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">Kind regards,<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">Michael<u></u><u></u></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU"><u></u>=C2=A0<u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">[1] <u></u>
<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">Setting up nativesdk-shadow (4=
.8.1-r0) ...<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">mkdir: cannot create directory=
 =E2=80=98/usr/lib/opkg=E2=80=99: Permission denied<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">dpkg: error processing package=
 nativesdk-shadow (--configure):<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">=C2=A0installed nativesdk-shad=
ow package post-installation script subprocess returned error exit status 1=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU"><u></u>=C2=A0<u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">[2]<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">E: Could not get lock /nvme/po=
ky/build-deb/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/recip=
e-sysroot-native/var/cache/apt/archives/lock - open (11: Resource temporari=
ly
 unavailable)<u></u><u></u></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-AU"><u></u>=C2=A0<u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">--=C2=A0<u></u><u></u></span><=
/p>
<div>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.5pt;font-family:&quo=
t;Arial&quot;,sans-serif;color:rgb(51,51,51)" lang=3D"EN-AU">BMW Car IT Gmb=
H</span></b><span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,s=
ans-serif;color:rgb(51,51,51)" lang=3D"EN-AU"><br>
<span style=3D"background:white none repeat scroll 0% 0%">Michael Ho</span=
><br>
Spezialist Entwicklung =E2=80=93 Build and Release Engineering<br>
<span style=3D"background:white none repeat scroll 0% 0%">Lise-Meitner-Str=
a=C3=9Fe 14</span><br>
<span style=3D"background:white none repeat scroll 0% 0%">89081 Ulm</span>=
<br>
<br>
<span style=3D"background:white none repeat scroll 0% 0%">Tel.:=C2=A0=C2=
=AD+49-731-37804-071<u></u><u></u></span></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:rgb(51,51,51);background:white none repeat scro=
ll 0% 0%" lang=3D"EN-AU">Mobil: +49-152-54980-471</span><span style=3D"font=
-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:rgb(51,51,51)" =
lang=3D"EN-AU"><br>
<span style=3D"background:white none repeat scroll 0% 0%">Fax: +49-731-378=
04-001</span><br>
<span style=3D"background:white none repeat scroll 0% 0%">Mail:=C2=A0</spa=
n></span><span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans=
-serif" lang=3D"EN-AU"><a href=3D"mailto:michael.ho@bmw-carit.de" target=3D=
"_blank"><span style=3D"color:rgb(5,99,193)">michael.ho@bmw-carit.de</span>=
</a><span style=3D"color:rgb(51,51,51);background:white none repeat scroll =
0% 0%">=C2=A0</span><span style=3D"color:rgb(51,51,51)"><br>
<span style=3D"background:white none repeat scroll 0% 0%">Web:=C2=A0</span=
></span></span><span lang=3D"EN-AU"><a href=3D"http://www.bmw-carit.de/" ta=
rget=3D"_blank"><span style=3D"font-size:10.5pt;font-family:&quot;Arial&quo=
t;,sans-serif;color:rgb(50,108,166)">http://www.bmw-carit.de</span></a></sp=
an><span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif=
;color:rgb(51,51,51)" lang=3D"EN-AU"><br>
<span style=3D"background:white none repeat scroll 0% 0%">----------------=
---------------------------------------------------------</span><br>
<span style=3D"background:white none repeat scroll 0% 0%">BMW Car IT GmbH<=
/span><br>
<span style=3D"background:white none repeat scroll 0% 0%">Gesch=C3=A4ftsf=
=C3=BChrer:=C2=A0Kai-Uwe Balszuweit und</span></span><span style=3D"font-s=
ize:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:rgb(153,153,153)"=
 lang=3D"EN-AU">=C2=A0</span><span style=3D"font-size:10.5pt;font-family:&q=
uot;Arial&quot;,sans-serif" lang=3D"EN-AU">Michael
 B=C3=B6ttrich<span style=3D"color:rgb(51,51,51)"><br>
<span style=3D"background:white none repeat scroll 0% 0%">Sitz und Registe=
rgericht: M=C3=BCnchen HRB 134810</span><br>
<span style=3D"background:white none repeat scroll 0% 0%">----------------=
---------------------------------------------------------</span></span></sp=
an><span style=3D"font-size:8pt;font-family:&quot;BMWType V2 Light&quot;" l=
ang=3D"EN-AU"><u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-AU"><u></u>=C2=A0<u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-AU"><u></u>=C2=A0<u></u></span></p=
>
<div style=3D"border-color:rgb(181,196,223) currentcolor currentcolor;bord=
er-style:solid none none;border-width:1pt medium medium;padding:3pt 0cm 0cm=
">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From:=
 </span></b><span style=3D"font-size:12pt;color:black">Alexander Kanavin &l=
t;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@=
gmail.com</a>&gt;<br>
<b>Date: </b>Monday, 11. January 2021 at 15:45<br>
<b>To: </b>&quot;Ho Michael, JC-3UL&quot; &lt;<a href=3D"mailto:Michael.Ho=
@bmw.de" target=3D"_blank">Michael.Ho@bmw.de</a>&gt;<br>
<b>Cc: </b>OE-core &lt;<a href=3D"mailto:openembedded-core@lists.openembed=
ded.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;=
<br>
<b>Subject: </b>Re: [OE-core] [PATCH] rootfs_ipk: allow do_populate_sdk in=
 parallel to do_rootfs<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">If you can fix the deb packaging easily, then pleas=
e do so, but it is not mandatory, and don&#39;t spend too much time if it t=
urns out to be a time sink.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Alex<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, 11 Jan 2021 at 15:01, &lt;<a href=3D"mailto=
:Michael.Ho@bmw.de" target=3D"_blank">Michael.Ho@bmw.de</a>&gt; wrote:<u></=
u><u></u></p>
</div>
<blockquote style=3D"border-color:currentcolor currentcolor currentcolor r=
gb(204,204,204);border-style:none none none solid;border-width:medium mediu=
m medium 1pt;padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">Hello Alexander,</span><u></u>=
<u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">=C2=A0</span><u></u><u></u></p=
>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span lang=3D"EN-AU">D=
id a quick test and it seems the rpm packaging classes don=E2=80=99t have t=
his issue. The rootfs_deb bbclass however has the same lock files like with=
 rootfs_ipk.</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">Should I try to patch this too=
 to keep them aligned?</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">=C2=A0</span><u></u><u></u></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">Kind regards,</span><u></u><u>=
</u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">Michael</span><u></u><u></u></=
p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">=C2=A0</span><u></u><u></u></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">--=C2=A0</span><u></u><u></u><=
/p>
<div>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.5pt;font-family:&quo=
t;Arial&quot;,sans-serif;color:rgb(51,51,51)" lang=3D"EN-AU">BMW Car IT Gmb=
H</span></b><span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,s=
ans-serif;color:rgb(51,51,51)" lang=3D"EN-AU"><br>
<span style=3D"background:white none repeat scroll 0% 0%">Michael Ho</span=
><br>
Spezialist Entwicklung =E2=80=93 Build and Release Engineering<br>
<span style=3D"background:white none repeat scroll 0% 0%">Lise-Meitner-Str=
a=C3=9Fe 14</span><br>
<span style=3D"background:white none repeat scroll 0% 0%">89081 Ulm</span>=
<br>
<br>
<span style=3D"background:white none repeat scroll 0% 0%">Tel.:=C2=A0=C2=
=AD+49-731-37804-071</span></span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:rgb(51,51,51);background:white none repeat scro=
ll 0% 0%" lang=3D"EN-AU">Mobil: +49-152-54980-471</span><span style=3D"font=
-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:rgb(51,51,51)" =
lang=3D"EN-AU"><br>
<span style=3D"background:white none repeat scroll 0% 0%">Fax: +49-731-378=
04-001</span><br>
<span style=3D"background:white none repeat scroll 0% 0%">Mail:=C2=A0</spa=
n></span><span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans=
-serif" lang=3D"EN-AU"><a href=3D"mailto:michael.ho@bmw-carit.de" target=3D=
"_blank"><span style=3D"color:rgb(5,99,193)">michael.ho@bmw-carit.de</span>=
</a><span style=3D"color:rgb(51,51,51);background:white none repeat scroll =
0% 0%">=C2=A0</span><span style=3D"color:rgb(51,51,51)"><br>
<span style=3D"background:white none repeat scroll 0% 0%">Web:=C2=A0</span=
></span></span><span lang=3D"EN-AU"><a href=3D"http://www.bmw-carit.de/" ta=
rget=3D"_blank"><span style=3D"font-size:10.5pt;font-family:&quot;Arial&quo=
t;,sans-serif;color:rgb(50,108,166)">http://www.bmw-carit.de</span></a></sp=
an><span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif=
;color:rgb(51,51,51)" lang=3D"EN-AU"><br>
<span style=3D"background:white none repeat scroll 0% 0%">----------------=
---------------------------------------------------------</span><br>
<span style=3D"background:white none repeat scroll 0% 0%">BMW Car IT GmbH<=
/span><br>
<span style=3D"background:white none repeat scroll 0% 0%">Gesch=C3=A4ftsf=
=C3=BChrer:=C2=A0Kai-Uwe Balszuweit und</span></span><span style=3D"font-s=
ize:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:rgb(153,153,153)"=
 lang=3D"EN-AU">=C2=A0</span><span style=3D"font-size:10.5pt;font-family:&q=
uot;Arial&quot;,sans-serif" lang=3D"EN-AU">Michael
 B=C3=B6ttrich<span style=3D"color:rgb(51,51,51)"><br>
<span style=3D"background:white none repeat scroll 0% 0%">Sitz und Registe=
rgericht: M=C3=BCnchen HRB 134810</span><br>
<span style=3D"background:white none repeat scroll 0% 0%">----------------=
---------------------------------------------------------</span></span></sp=
an><u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">=C2=A0</span><u></u><u></u></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">=C2=A0</span><u></u><u></u></p=
>
<div style=3D"border-style:solid none none;border-width:1pt medium medium;=
padding:3pt 0cm 0cm;border-color:currentcolor">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From:
</span></b><span style=3D"font-size:12pt;color:black">Alexander Kanavin &l=
t;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@=
gmail.com</a>&gt;<br>
<b>Date: </b>Monday, 11. January 2021 at 13:46<br>
<b>To: </b>&quot;Ho Michael, JC-3UL&quot; &lt;<a href=3D"mailto:Michael.Ho=
@bmw.de" target=3D"_blank">Michael.Ho@bmw.de</a>&gt;<br>
<b>Cc: </b>OE-core &lt;<a href=3D"mailto:openembedded-core@lists.openembed=
ded.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;=
<br>
<b>Subject: </b>Re: [OE-core] [PATCH] rootfs_ipk: allow do_populate_sdk in=
 parallel to do_rootfs</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">Does deb/rpm packaging already have this feature?<u=
></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Alex<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, 11 Jan 2021 at 13:45, Michael Ho &lt;<a hre=
f=3D"mailto:Michael.Ho@bmw.de" target=3D"_blank">Michael.Ho@bmw.de</a>&gt; =
wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-style:none none none solid;border-width:medium=
 medium medium 1pt;padding:0cm 0cm 0cm 6pt;margin:5pt 0cm 5pt 4.8pt;border-=
color:currentcolor currentcolor currentcolor rgb(204,204,204)">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">From: Michael Ho &lt;<=
a href=3D"mailto:Michael.Ho@bmw.de" target=3D"_blank">Michael.Ho@bmw.de</a>=
&gt;<br>
<br>
Switch do_populate_sdk for the ipk package manager to use a separate targe=
t<br>
opkg config file and separate the lockfiles restricting do_rootfs and<br>
do_populate_sdk from running in parallel.<br>
<br>
This way if an image recipe includes a dependency to do_populate_sdk by<br=
>
default then it will run in parallel to do_rootfs saving time compared to =
the<br>
sequential execution.<br>
<br>
Signed-off-by: Michael Ho &lt;<a href=3D"mailto:Michael.Ho@bmw.de" target=
=3D"_blank">Michael.Ho@bmw.de</a>&gt;<br>
---<br>
=C2=A0meta/classes/package_ipk.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0meta/classes/rootfs_ipk.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<=
br>
=C2=A0meta/lib/oe/package_manager/ipk/sdk.py | 6 ++++++<br>
=C2=A03 files changed, 9 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.b=
bclass<br>
index 79cb36c..d31dba0 100644<br>
--- a/meta/classes/package_ipk.bbclass<br>
+++ b/meta/classes/package_ipk.bbclass<br>
@@ -4,6 +4,7 @@ IMAGE_PKGTYPE ?=3D &quot;ipk&quot;<br>
<br>
=C2=A0IPKGCONF_TARGET =3D &quot;${WORKDIR}/opkg.conf&quot;<br>
=C2=A0IPKGCONF_SDK =3D=C2=A0 &quot;${WORKDIR}/opkg-sdk.conf&quot;<br>
+IPKGCONF_SDK_TARGET =3D &quot;${WORKDIR}/opkg-sdk-target.conf&quot;<br>
<br>
=C2=A0PKGWRITEDIRIPK =3D &quot;${WORKDIR}/deploy-ipks&quot;<br>
<br>
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbc=
lass<br>
index f1e0219..245c256 100644<br>
--- a/meta/classes/rootfs_ipk.bbclass<br>
+++ b/meta/classes/rootfs_ipk.bbclass<br>
@@ -14,8 +14,8 @@ do_rootfs[recrdeptask] +=3D &quot;do_package_write_ipk d=
o_package_qa&quot;<br>
=C2=A0do_rootfs[vardeps] +=3D &quot;PACKAGE_FEED_URIS PACKAGE_FEED_BASE_PA=
THS PACKAGE_FEED_ARCHS&quot;<br>
<br>
=C2=A0do_rootfs[lockfiles] +=3D &quot;${WORKDIR}/ipk.lock&quot;<br>
-do_populate_sdk[lockfiles] +=3D &quot;${WORKDIR}/ipk.lock&quot;<br>
-do_populate_sdk_ext[lockfiles] +=3D &quot;${WORKDIR}/ipk.lock&quot;<br>
+do_populate_sdk[lockfiles] +=3D &quot;${WORKDIR}/sdk-ipk.lock&quot;<br>
+do_populate_sdk_ext[lockfiles] +=3D &quot;${WORKDIR}/sdk-ipk.lock&quot;<b=
r>
<br>
=C2=A0OPKG_PREPROCESS_COMMANDS =3D &quot;&quot;<br>
<br>
diff --git a/meta/lib/oe/package_manager/ipk/sdk.py b/meta/lib/oe/package_=
manager/ipk/sdk.py<br>
index 37af034..e2ca415 100644<br>
--- a/meta/lib/oe/package_manager/ipk/sdk.py<br>
+++ b/meta/lib/oe/package_manager/ipk/sdk.py<br>
@@ -14,6 +14,12 @@ class PkgSdk(Sdk):<br>
=C2=A0 =C2=A0 =C2=A0def __init__(self, d, manifest_dir=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super(PkgSdk, self).__init__(d, manifest=
_dir)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # In sdk_list_installed_packages the call to =
opkg is hardcoded to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # always use IPKGCONF_TARGET and there&#39;s =
no exposed API to change this<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # so simply override IPKGCONF_TARGET to use t=
his separated config file.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ipkgconf_sdk_target =3D d.getVar(&quot;IPKGCO=
NF_SDK_TARGET&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;IPKGCONF_TARGET&quot;, ipkgcon=
f_sdk_target)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.target_conf =3D self.d.getVar(&quot=
;IPKGCONF_TARGET&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.host_conf =3D self.d.getVar(&quot;I=
PKGCONF_SDK&quot;)<br>
<br>
-- <br>
2.7.4<br>
<br>
<br>
<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>

</blockquote></div>

--00000000000096110f05b8a44c1d--
