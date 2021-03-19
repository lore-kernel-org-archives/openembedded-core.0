Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web10.6160.1616160303889237373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 06:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E50sBivd;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id 97so3027172uav.7
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 06:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l6kQ3diIgie65oEN6/m0p5Azp909w9l6zcy6uUhS0P8=;
        b=E50sBivdokCKO7r/9e+EBUr12iuGHdCtPHjw9dK583GkcvEN6/eNUq6T0pnlij/ReE
         vgt6uJvWLKaXlXm48viWBQOf0mZmubRvTEeg/ndyIuSCDcHZbZ18+wTilnsZpPhtP03j
         rhB7m5aiypYNeN4Fq/rlZFjE+Idal+eY07H3Vd7t3OwkarmTauvmd6aKq+rMymGywR/z
         sDPQWTJ3lpsgMSO4kNir5g+ffWBlwb12EUhkJAyZDFzh1ozfqRcP8OOa3/Vd09BtCgfF
         Eg6qiaflxJ/U7Zls4XV5+DzHbQAyLnImCX/HI52gXiAHxTFm9nDlEREZiCG9nAqtbsIC
         JWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l6kQ3diIgie65oEN6/m0p5Azp909w9l6zcy6uUhS0P8=;
        b=p6e7XYFpYHfzqI5jGhRrKbzQi1hs7rgT3xU/BKb2utiuQ+SySEooWpdj7vxjJTQ5pZ
         SJe+N9+FclAk9zZ+utIi2Ttt5e3XqpJMxz36hofinpIsz+BEwHCK4BdaH2arEIFgCCyu
         mbEKqmnnGbR3x9lcHY85Ma4a0QS2+drHO35uNKxJ4nRz0ePTd6FCOo9HlGnSGyHdPQwf
         VesNTfctwVJ0eazNofjdGzZ48xakQg+fyiDmBKXhAup0Pm61KIVlPO16R1jWh56UI/h9
         bHYa6sGqL1kB48Dth6UFaKoc/qRnWzCyP9D+gAEsF7ML7ulM/gaKJD3OAJiAlRbXTE+H
         p+xg==
X-Gm-Message-State: AOAM532FMP7ApJqUOXwYve1/wW/PRTER4+lIppqkY2aBsqPrlAJkq0bc
	HPFcyZXDA8KeeUoXIAd7BBzVTakzYzdMTk5U88U=
X-Google-Smtp-Source: ABdhPJyUD5F3GnYlNGw8E6i8QC9Dm4JkUlg5dcbX1kboCI5SE+WKBfPBCoyVriXhiVwsfPg8JloS70JHQ7HdHe4N0dw=
X-Received: by 2002:ab0:7150:: with SMTP id k16mr5197419uao.71.1616160302890;
 Fri, 19 Mar 2021 06:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210319131736.104420-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210319131736.104420-1-Martin.Jansa@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 19 Mar 2021 14:24:51 +0100
Message-ID: <CANNYZj_P_+2vE66iWKNVfCanjb2KVP238MngAPK3jBz3BDiDEA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] packagegroup-core-weston.bb: add pam to REQUIRED_DISTRO_FEATURES
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c1036605bde3a4aa"

--000000000000c1036605bde3a4aa
Content-Type: text/plain; charset="UTF-8"

This is required only if systemd is enabled:

REQUIRED_DISTRO_FEATURES = "wayland
${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam',
'', d)}"

Please take a look at weston recipes which already have this.

Alex

On Fri, 19 Mar 2021 at 14:17, Martin Jansa <Martin.Jansa@gmail.com> wrote:

> * weston, weston-init, weston-examples require pam
> * fixes:
>   ERROR: Nothing RPROVIDES 'weston-init' (but
> meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb RDEPENDS
> on or otherwise requires it)
>   weston-init was skipped: missing required distro feature 'pam' (not in
> DISTRO_FEATURES)
>   NOTE: Runtime target 'weston-init' is unbuildable, removing...
>   Missing or unbuildable dependency chain was: ['weston-init']
>   ERROR: Nothing RPROVIDES 'packagegroup-core-weston' (but
> meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb RDEPENDS
> on or otherwise requires it)
>   No eligible RPROVIDERs exist for 'packagegroup-core-weston'
>   NOTE: Runtime target 'packagegroup-core-weston' is unbuildable,
> removing...
>   Missing or unbuildable dependency chain was: ['packagegroup-core-weston']
>   ERROR: Nothing RPROVIDES 'weston-examples' (but
> meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb RDEPENDS
> on or otherwise requires it)
>   weston RPROVIDES weston-examples but was skipped: missing required
> distro feature 'pam' (not in DISTRO_FEATURES)
>   NOTE: Runtime target 'weston-examples' is unbuildable, removing...
>   Missing or unbuildable dependency chain was: ['weston-examples']
>   ERROR: Nothing RPROVIDES 'weston' (but
> meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb RDEPENDS
> on or otherwise requires it)
>   weston was skipped: missing required distro feature 'pam' (not in
> DISTRO_FEATURES)
>   NOTE: Runtime target 'weston' is unbuildable, removing...
>   Missing or unbuildable dependency chain was: ['weston']
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/packagegroups/
> packagegroup-core-weston.bb b/meta/recipes-graphics/packagegroups/
> packagegroup-core-weston.bb
> index 340c8e75ed..2614ddf410 100644
> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Packages required to set up a basic working
> Weston session"
>  PR = "r1"
>
>  inherit packagegroup features_check
> -REQUIRED_DISTRO_FEATURES = "wayland"
> +REQUIRED_DISTRO_FEATURES = "wayland pam"
>
>  RDEPENDS_${PN} = "\
>      weston \
> --
> 2.30.2
>
>
> 
>
>

--000000000000c1036605bde3a4aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is required only if systemd is enabled:</div><di=
v><br></div><div>REQUIRED_DISTRO_FEATURES =3D &quot;wayland ${@oe.utils.con=
ditional(&#39;VIRTUAL-RUNTIME_init_manager&#39;, &#39;systemd&#39;, &#39;pa=
m&#39;, &#39;&#39;, d)}&quot;</div><div><br></div><div>Please take a look a=
t weston recipes which already have this.<br></div><div><br></div><div>Alex=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Fri, 19 Mar 2021 at 14:17, Martin Jansa &lt;<a href=3D"mailto:=
Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">* weston, weston-init, weston=
-examples require pam<br>
* fixes:<br>
=C2=A0 ERROR: Nothing RPROVIDES &#39;weston-init&#39; (but meta/recipes-gr=
aphics/packagegroups/<a href=3D"http://packagegroup-core-weston.bb" rel=3D"=
noreferrer" target=3D"_blank">packagegroup-core-weston.bb</a> RDEPENDS on o=
r otherwise requires it)<br>
=C2=A0 weston-init was skipped: missing required distro feature &#39;pam&#=
39; (not in DISTRO_FEATURES)<br>
=C2=A0 NOTE: Runtime target &#39;weston-init&#39; is unbuildable, removing=
...<br>
=C2=A0 Missing or unbuildable dependency chain was: [&#39;weston-init&#39;=
]<br>
=C2=A0 ERROR: Nothing RPROVIDES &#39;packagegroup-core-weston&#39; (but me=
ta/recipes-graphics/packagegroups/<a href=3D"http://packagegroup-core-westo=
n.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-core-weston.bb</a> =
RDEPENDS on or otherwise requires it)<br>
=C2=A0 No eligible RPROVIDERs exist for &#39;packagegroup-core-weston&#39;=
<br>
=C2=A0 NOTE: Runtime target &#39;packagegroup-core-weston&#39; is unbuilda=
ble, removing...<br>
=C2=A0 Missing or unbuildable dependency chain was: [&#39;packagegroup-cor=
e-weston&#39;]<br>
=C2=A0 ERROR: Nothing RPROVIDES &#39;weston-examples&#39; (but meta/recipe=
s-graphics/packagegroups/<a href=3D"http://packagegroup-core-weston.bb" rel=
=
=3D"noreferrer" target=3D"_blank">packagegroup-core-weston.bb</a> RDEPENDS=
 on or otherwise requires it)<br>
=C2=A0 weston RPROVIDES weston-examples but was skipped: missing required =
distro feature &#39;pam&#39; (not in DISTRO_FEATURES)<br>
=C2=A0 NOTE: Runtime target &#39;weston-examples&#39; is unbuildable, remo=
ving...<br>
=C2=A0 Missing or unbuildable dependency chain was: [&#39;weston-examples&=
#39;]<br>
=C2=A0 ERROR: Nothing RPROVIDES &#39;weston&#39; (but meta/recipes-graphic=
s/packagegroups/<a href=3D"http://packagegroup-core-weston.bb" rel=3D"noref=
errer" target=3D"_blank">packagegroup-core-weston.bb</a> RDEPENDS on or oth=
erwise requires it)<br>
=C2=A0 weston was skipped: missing required distro feature &#39;pam&#39; (=
not in DISTRO_FEATURES)<br>
=C2=A0 NOTE: Runtime target &#39;weston&#39; is unbuildable, removing...<b=
r>
=C2=A0 Missing or unbuildable dependency chain was: [&#39;weston&#39;]<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/packagegroups/<a href=3D"http://packagegroup-c=
ore-weston.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-core-westo=
n.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/packagegroups/<a href=3D"http://package=
group-core-weston.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-cor=
e-weston.bb</a> b/meta/recipes-graphics/packagegroups/<a href=3D"http://pac=
kagegroup-core-weston.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup=
-core-weston.bb</a><br>
index 340c8e75ed..2614ddf410 100644<br>
--- a/meta/recipes-graphics/packagegroups/<a href=3D"http://packagegroup-c=
ore-weston.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-core-westo=
n.bb</a><br>
+++ b/meta/recipes-graphics/packagegroups/<a href=3D"http://packagegroup-c=
ore-weston.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-core-westo=
n.bb</a><br>
@@ -3,7 +3,7 @@ DESCRIPTION =3D &quot;Packages required to set up a basic =
working Weston session&quot;<br>
=C2=A0PR =3D &quot;r1&quot;<br>
<br>
=C2=A0inherit packagegroup features_check<br>
-REQUIRED_DISTRO_FEATURES =3D &quot;wayland&quot;<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;wayland pam&quot;<br>
<br>
=C2=A0RDEPENDS_${PN} =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0weston \<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000c1036605bde3a4aa--
