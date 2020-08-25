Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web10.14345.1598364172718215254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 07:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OBf5mQZV;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id a13so6380277vso.12
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 07:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s5z44yU4MHrx8wFgUcvouLk7/68VnvmT/p0s90I2qFQ=;
        b=OBf5mQZVjhtHD6U7LrhrxKDCwdeHFRRzQeJUCuqg1kgeY0xP9tNEeS5kCw8sDfag6q
         I/phH/jwRhej8HYogbfCLvXiuhIX01whvIvL3X4X74P6uJ4BEd0n8pET+yfa+SDAilf8
         KvKsuWqt/0oRvoClolHpHMTygOW6Mel/2SNRcygb8MHKLOxazekd6YQeyu/8LthhGH0h
         8WN97SJt+PxrHBe2CzzdC9G5uCa/B/Q8xrjiB1G0ku8dncRe0vJvsgfh753rlrwHeoSf
         xDHNwpZ1XZ3iH+majSV1Ep1FG3D4SzBNxe3Zxry7ip+BW/LiiH448yLfvMp7A3sKIA2o
         vrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s5z44yU4MHrx8wFgUcvouLk7/68VnvmT/p0s90I2qFQ=;
        b=nrtARdc/rv/s6524EfRm9pFe+Sz1eP7LbxW62QJi4pDkel1xo5JdciJXQ8O9QmNLpa
         mAo8oDWxHGtQUk2D0E7Azopqu5iqsmKWbjKD4dz6TGNX2OzZsVhbLY90Q9sGHkhKTT9L
         kw9fuqG5vXw8g6grFQPoO0IkNtoFCsyU6Af3E9rpIDhInfg5YLRH1mdPH1rei6mhSQOw
         b20Z5bskhckZVk4gsTmp2nddBHtJUjbNsT1IPuTprs1Zgf5IDurS/J9yep1kwxOhTWEE
         Io8Vw50zrbcShKEs4xlm+wtrAurlHVK1XaPmDA5JJaAONrcAiqt6fRXKtbjq72N8Sv/m
         urgQ==
X-Gm-Message-State: AOAM532kNaOvA9ydir8paA14NK5DT1PIcEM0J027o5BqOIpj5ND111gx
	SVbkkluzFwEuiujaJUaMeb+XQRcLQDEqSNAZDEU=
X-Google-Smtp-Source: ABdhPJyOPBgQkq3yyC/vDzVuIIHtfAIxifxjctgIg6gTvpt7gWrV7B9bKUtVRTBBm9cgq7KvwNFhbtTeFUbh8/rJocY=
X-Received: by 2002:a67:fb0f:: with SMTP id d15mr5733223vsr.83.1598364171818;
 Tue, 25 Aug 2020 07:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200825134300.887457-1-pab@pabigot.com>
In-Reply-To: <20200825134300.887457-1-pab@pabigot.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 25 Aug 2020 16:02:40 +0200
Message-ID: <CANNYZj80RRCVB+69DfWP=m0nWLcp0PbKdocCfSKcuujts-KUFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] bluez5: fix builds that require ell support
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000aedad605adb4288c"

--000000000000aedad605adb4288c
Content-Type: text/plain; charset="UTF-8"

This doesn't make it clear, is ell (external or internal) required for all
bluez builds now, or is it still optional? Adding mandatory dependencies
should be better justified.

Alex

On Tue, 25 Aug 2020 at 15:43, Peter A. Bigot <pab@pabigot.com> wrote:

> Shortly after the recipe was updated to add ell as a mesh dependency
> the way ell was integrated into bluez5 was changed.  Use the external
> ell dependency rather than the default to build one internal to
> bluez5.
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc
> b/meta/recipes-connectivity/bluez5/bluez5.inc
> index eee7a53cd61..9b38bda5a79 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -6,7 +6,7 @@ LICENSE = "GPLv2+ & LGPLv2.1+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>
>  file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
>
>  file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e"
> -DEPENDS = "dbus glib-2.0"
> +DEPENDS = "dbus ell glib-2.0"
>  PROVIDES += "bluez-hcidump"
>  RPROVIDES_${PN} += "bluez-hcidump"
>
> @@ -42,8 +42,8 @@ PACKAGECONFIG[sixaxis] =
> "--enable-sixaxis,--disable-sixaxis"
>  PACKAGECONFIG[tools] = "--enable-tools,--disable-tools"
>  PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
>  PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
> -PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c ell"
> -PACKAGECONFIG[btpclient] = "--enable-btpclient,--disable-btpclient, ell"
> +PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c"
> +PACKAGECONFIG[btpclient] = "--enable-btpclient,--disable-btpclient"
>  PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
>
>  SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
> @@ -63,6 +63,7 @@ EXTRA_OECONF = "\
>    --enable-test \
>    --enable-datafiles \
>    --enable-library \
> +  --enable-external-ell \
>    --without-zsh-completion-dir \
>  "
>
> --
> 2.25.1
>
> 
>

--000000000000aedad605adb4288c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This doesn&#39;t make it clear, is ell (external or i=
nternal) required for all bluez builds now, or is it still optional? Adding=
 mandatory dependencies should be better justified.<br></div><div><br></div=
><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Tue, 25 Aug 2020 at 15:43, Peter A. Bigot &lt;<a hre=
f=3D"mailto:pab@pabigot.com">pab@pabigot.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Shortly after the recipe was up=
dated to add ell as a mesh dependency<br>
the way ell was integrated into bluez5 was changed.=C2=A0 Use the external=
<br>
ell dependency rather than the default to build one internal to<br>
bluez5.<br>
---<br>
=C2=A0meta/recipes-connectivity/bluez5/bluez5.inc | 7 ++++---<br>
=C2=A01 file changed, 4 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-co=
nnectivity/bluez5/bluez5.inc<br>
index eee7a53cd61..9b38bda5a79 100644<br>
--- a/meta/recipes-connectivity/bluez5/bluez5.inc<br>
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc<br>
@@ -6,7 +6,7 @@ LICENSE =3D &quot;GPLv2+ &amp; LGPLv2.1+&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D12f884d2ae1ff87c09e5=
b7ccc2c4ca7e \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://COPYING.LIB;md5=3Dfb504b67c50331fc78734fed90fb0e09 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://src/main.c;beginline=3D1;endline=3D24;md5=3D9bc54b93cd7e17bf03f5=
2513f39f926e&quot;<br>
-DEPENDS =3D &quot;dbus glib-2.0&quot;<br>
+DEPENDS =3D &quot;dbus ell glib-2.0&quot;<br>
=C2=A0PROVIDES +=3D &quot;bluez-hcidump&quot;<br>
=C2=A0RPROVIDES_${PN} +=3D &quot;bluez-hcidump&quot;<br>
<br>
@@ -42,8 +42,8 @@ PACKAGECONFIG[sixaxis] =3D &quot;--enable-sixaxis,--disa=
ble-sixaxis&quot;<br>
=C2=A0PACKAGECONFIG[tools] =3D &quot;--enable-tools,--disable-tools&quot;<=
br>
=C2=A0PACKAGECONFIG[threads] =3D &quot;--enable-threads,--disable-threads&=
quot;<br>
=C2=A0PACKAGECONFIG[deprecated] =3D &quot;--enable-deprecated,--disable-de=
precated&quot;<br>
-PACKAGECONFIG[mesh] =3D &quot;--enable-mesh,--disable-mesh, json-c ell&qu=
ot;<br>
-PACKAGECONFIG[btpclient] =3D &quot;--enable-btpclient,--disable-btpclient=
, ell&quot;<br>
+PACKAGECONFIG[mesh] =3D &quot;--enable-mesh,--disable-mesh, json-c&quot;<=
br>
+PACKAGECONFIG[btpclient] =3D &quot;--enable-btpclient,--disable-btpclient=
&quot;<br>
=C2=A0PACKAGECONFIG[udev] =3D &quot;--enable-udev,--disable-udev,udev&quot=
;<br>
<br>
=C2=A0SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.ta=
r.xz \<br>
@@ -63,6 +63,7 @@ EXTRA_OECONF =3D &quot;\<br>
=C2=A0 =C2=A0--enable-test \<br>
=C2=A0 =C2=A0--enable-datafiles \<br>
=C2=A0 =C2=A0--enable-library \<br>
+=C2=A0 --enable-external-ell \<br>
=C2=A0 =C2=A0--without-zsh-completion-dir \<br>
=C2=A0&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div>

--000000000000aedad605adb4288c--
