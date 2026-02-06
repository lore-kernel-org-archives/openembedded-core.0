Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC3EDEE6B48
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 18:15:35 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.458.1770401735101066144
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 10:15:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fh7LbQrY;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-795176156b1so12334717b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 10:15:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770401734; cv=none;
        d=google.com; s=arc-20240605;
        b=cgAPNgk4Mgbr2cA7lG3Ty/S2AablOj553sCwbSzpyZg0T9M4Ur5oRZ6jbuttgYiLtW
         yKnu0vt0fNOwmtln7yBAB5XD/Oz0ohnhoIKJ5FQA1HuhMey+s3W3XeZuG5KicXQdABpB
         wbyMCg+XhIJNntENX6E8CxEn8tPwXJiaD+alS039h/S4YHnoaCHWxEFJZFdtNKwAcJTd
         IOFrzphRkM/YK3Zg7PtS41Gp1MiMkVCzcWhmRx7kznjlU1LumzkV3gVow32xZ16SnmLJ
         6IaPhvHqGrjLng+qJWgFRBF3sP6BKN/z8MsTfJtdmA2e+K6RMzO8a42S50o5otTTEGH5
         1LAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d5kmFDhj6BnviQ9IFbxNadNTu8c1CgP7nT6beTh4JD8=;
        fh=6lLjrNeyieZaYxy3e2DDMqWSLRok6Dpc3kYN/A1ue5g=;
        b=hhRfCGzEkb1WAdDUO9E7QEimXvwOxRu9GfbHsHH/UacSClS6wka8HQLES0UmCQC1jZ
         +IjSoVaIV3MU0mAirbhfwTZ0pyA9GO3mMXjH6VGRSvGc+Hc3MARpHhVKFWB2UxC/ksPl
         0NNbiA4U6H47BLe30PVGil19eEvtz9QeEwN/YYZ1ddMsHgWSo3ZsaVFdexeaNGs53Hz2
         6t/y+dNH/GCN9GSSp95GA7Ff/9gHfhtaTvMUbUXUSaS1T60wO81aK2AkBw2cZ2pBLPay
         jHmm+YoHa9tbxVWQfUdUSCIlK56X7SMjGpL6k3VkoPX6SYt7ePJHQCkZFjFJu/MLTpBK
         QGXQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770401734; x=1771006534; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d5kmFDhj6BnviQ9IFbxNadNTu8c1CgP7nT6beTh4JD8=;
        b=fh7LbQrYJW9hu2/W1mVUGyffjoXqQQUseKmvJpBcaGWxkEDSDnrqJWk/xQhhgeUegF
         T9EIl6VmT37LAMuW4jIBGvc/m8fOXgnqOTR4XVUG8DB9jvMlmOLXA2PvpqivBwY2zyyo
         WD0Hf8Go+EfvMJjY74gn1LBAXYhpGmuyFgt1xugfJw3Qj5jp77bgwFyQenvu4RerMmwe
         02yA+fEWg9dHGmTvzxPzcPtUEbcjH9vG6ORXoDnR7sbgfMgagO9PeBTH99YGx4aeCbUB
         JQDYPM7kz0LxhMwAN9ac/6uR9OsTjY7AcbcLOZuvjabgL7NqiSzOr2KpCd81w/W7kuUm
         iV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770401734; x=1771006534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5kmFDhj6BnviQ9IFbxNadNTu8c1CgP7nT6beTh4JD8=;
        b=p0d9MaqFK3udbDIZkN+YJZ5FCdvmHyMkZyzle0qLdhKxvg57vgeq2r4ZSwF5psAVIX
         gPBGYnLaR3ryys1nhPcRjvbvbrE+0zyBG4orpac7+/pgIib8qBjjkJ+FA03yB4gU5Aya
         JcSCExK3NOrqvctWukeuNYwBPo5YegLVmQgYqeHbwVKanOUphPYdNFsMuqRz4a6L3BsO
         GCkjo5TEwQp3ZIXOSOUwrL3V3S0uOKC6WoGfd6bAX66ALsListkKQeE+ED3pUQlwYK7k
         rB//fJCud282oRZN8nrJ1DxUgztgKLS6Ib+78KygwFcJtF2jaJay9pgotRUq36jJbhqC
         7DEw==
X-Forwarded-Encrypted: i=1; AJvYcCVbUTWIPrHA5JuWL71AS/s/bz2X59ATVY8k4pFVK+dDCFKX80zWxJUlLDSm9wpNQbvlLFVqxh9ZCBLN7zy5xf50Fg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzur/wHX71l1cmkqaXirRw7bgcAj3e36B9uV3/NqHAiocEA4kku
	LF2L10+tNBej3LApDWS9CAtZl4zoyr3qHB5ZJy27B970iuXFaOuMQGg7Gtq4iwH7UiO9wqQ3IIB
	uoNBTGV1VPoQLoqBtqhO6Usy6IoKMVWw=
X-Gm-Gg: AZuq6aJVkwq+BulMCq6fiDajW3096UJEz3OxocNk25HHlsBEbffBaQ9XgAW418mXm4F
	p/L2pCHIyY5yHSMBRwN5aC1t13OB15zFe+osGn7TTWyBLVBdGHkLo6jPFuZzNh8fFJ4m+IXU5+h
	gg1UJl3hiWedfwPZ+kq95N1dbgxPkCPtjebhv4NDRkagfW7OC6e/sW9R9dEyZzPi8wjSLrE5RJM
	jPW8SW1gNRSN/Qq72v4xF4A8pHFig/6YCZb0RUVPgs0cRdlZXhOXyEpMgje7W804RaHR0wSiRmO
	AjfNQq0CVODvwCkaPmTRI+sWuY8lWpKKgOmZKSiNKKbDBS93BX/7CrUAEW+CmX6U5ZMR+xJ7HAl
	+iK+gFja/IISurLENx3KHA6cMZ2s=
X-Received: by 2002:a05:690c:6c90:b0:794:cf56:5bc2 with SMTP id
 00721157ae682-7952ab52b49mr30134737b3.59.1770401734097; Fri, 06 Feb 2026
 10:15:34 -0800 (PST)
MIME-Version: 1.0
References: <20260203012028.4008229-1-rs@ti.com> <20260203012028.4008229-6-rs@ti.com>
In-Reply-To: <20260203012028.4008229-6-rs@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Feb 2026 10:15:07 -0800
X-Gm-Features: AZwV_Qj2iZXJ3XjpCvk6J_wte4m_a_FwRVWi035BqUhS9Roxb20XjCqgbEAfOPc
Message-ID: <CAMKF1sqEMoKd2U7sDVQNyPZH9Xd=MKx62c=o-iussWnVDk+zUg@mail.gmail.com>
Subject: Re: [oe-core][PATCHv15 5/6] xuser-account: merge with xserver-nodm-init
To: rs@ti.com
Cc: richard.purdie@linuxfoundation.org, mathieu.dubois-briand@bootlin.com, 
	alex@linutronix.de, otavio@ossystems.com.br, kexin.hao@windriver.com, 
	afd@ti.com, detheridge@ti.com, denis@denix.org, reatmon@ti.com, 
	openembedded-core@lists.openembedded.org, vijayp@ti.com
Content-Type: multipart/alternative; boundary="00000000000078805e064a2bc636"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 18:15:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230640

--00000000000078805e064a2bc636
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this also needs adjustments for fvwm and xscreensaver recipes in meta-oe

On Mon, Feb 2, 2026 at 5:20=E2=80=AFPM Randolph Sapp via lists.openembedded=
.org <rs=3D
ti.com@lists.openembedded.org> wrote:

> From: Randolph Sapp <rs@ti.com>
>
> Merge the xuser-account recipe with xserver-nodm-init, since:
>
>  - This is the only recipe dependent on it
>  - This matches the current behavior in weston-init
>  - Running x11 as root is no longer a supported path in
>    xserver-nodm-init
>  - The display manager configuration and user account name are heavily
>    connected
>  - The existing method of integration ignored this connection
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 -
>  .../xserver-nodm-init}/system-xuser.conf      |  0
>  .../x11-common/xserver-nodm-init_3.0.bb       | 20 +++++++++---
>  .../user-creation/xuser-account_0.1.bb        | 31 -------------------
>  4 files changed, 15 insertions(+), 37 deletions(-)
>  rename meta/{recipes-support/user-creation/files =3D>
> recipes-graphics/x11-common/xserver-nodm-init}/system-xuser.conf (100%)
>  delete mode 100644 meta/recipes-support/user-creation/
> xuser-account_0.1.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index a7425f7020..ec0a128901 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -935,7 +935,6 @@ RECIPE_MAINTAINER:pn-xserver-xf86-config =3D "Unassig=
ned
> <unassigned@yoctoproject.
>  RECIPE_MAINTAINER:pn-xserver-xorg =3D "Unassigned <
> unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-xset =3D "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-xtrans =3D "Unassigned <unassigned@yoctoproject.org=
>"
> -RECIPE_MAINTAINER:pn-xuser-account =3D "Randolph Sapp <rs@ti.com>"
>  RECIPE_MAINTAINER:pn-xvinfo =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-xwayland =3D "Unassigned <unassigned@yoctoproject.o=
rg
> >"
>  RECIPE_MAINTAINER:pn-xwininfo =3D "Unassigned <unassigned@yoctoproject.o=
rg
> >"
> diff --git a/meta/recipes-support/user-creation/files/system-xuser.conf
> b/meta/recipes-graphics/x11-common/xserver-nodm-init/system-xuser.conf
> similarity index 100%
> rename from meta/recipes-support/user-creation/files/system-xuser.conf
> rename to
> meta/recipes-graphics/x11-common/xserver-nodm-init/system-xuser.conf
> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
> b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
> index ed056df72f..0e9fe1e65a 100644
> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
> @@ -1,14 +1,15 @@
> -SUMMARY =3D "Simple Xserver Init Script (no dm)"
> +SUMMARY =3D "Simple Xserver Init Script and user account"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de204=
20"
>  SECTION =3D "x11"
>
>  SRC_URI =3D "file://emptty.conf.in \
> -           file://default.desktop"
> +           file://default.desktop \
> +           file://system-xuser.conf"
>
>  S =3D "${UNPACKDIR}"
>
> -inherit features_check
> +inherit features_check useradd
>
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> @@ -26,10 +27,19 @@ do_install() {
>
>      sed -i "s:@NO_CURSOR_ARG@:${NO_CURSOR_ARG}:"
> ${D}${sysconfdir}/emptty/conf
>      sed -i "s:@BLANK_ARGS@:${BLANK_ARGS}:" ${D}${sysconfdir}/emptty/conf
> +
> +    install -D -m 0644 ${S}/system-xuser.conf
> ${D}${sysconfdir}/dbus-1/system.d/system-xuser.conf
>  }
>
>  FILES:${PN} =3D "${sysconfdir}/emptty/conf \
> -               ${datadir}/xsessions/default.desktop"
> +               ${datadir}/xsessions/default.desktop \
> +               ${sysconfdir}/dbus-1/system.d/system-xuser.conf"
> +
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM:${PN} =3D "--create-home \
> +                       --groups
> video,tty,audio,input,shutdown,disk,nopasswdlogin \
> +                       --user-group xuser"
> +GROUPADD_PARAM:${PN} =3D "-r nopasswdlogin"
>
> -RDEPENDS:${PN} =3D "emptty xuser-account"
> +RDEPENDS:${PN} =3D "emptty"
>  RPROVIDES:${PN} +=3D "virtual-emptty-conf"
> diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb
> b/meta/recipes-support/user-creation/xuser-account_0.1.bb
> deleted file mode 100644
> index f1e4cb674f..0000000000
> --- a/meta/recipes-support/user-creation/xuser-account_0.1.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -SUMMARY =3D "Creates an 'xuser' account used for running X11"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de204=
20"
> -
> -SRC_URI =3D "file://system-xuser.conf"
> -
> -inherit allarch useradd
> -
> -S =3D "${UNPACKDIR}"
> -
> -do_configure() {
> -    :
> -}
> -
> -do_compile() {
> -    :
> -}
> -
> -do_install() {
> -    install -D -m 0644 ${UNPACKDIR}/system-xuser.conf
> ${D}${sysconfdir}/dbus-1/system.d/system-xuser.conf
> -}
> -
> -FILES:${PN} =3D "${sysconfdir}/dbus-1/system.d/system-xuser.conf"
> -
> -USERADD_PACKAGES =3D "${PN}"
> -USERADD_PARAM:${PN} =3D "--create-home \
> -                       --groups
> video,tty,audio,input,shutdown,disk,nopasswdlogin \
> -                       --user-group xuser"
> -GROUPADD_PARAM:${PN} =3D "-r nopasswdlogin"
> -
> -ALLOW_EMPTY:${PN} =3D "1"
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230410):
> https://lists.openembedded.org/g/openembedded-core/message/230410
> Mute This Topic: https://lists.openembedded.org/mt/117609025/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000078805e064a2bc636
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">this also needs adjustments for fvwm and xscreensaver reci=
pes in meta-oe</div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 2, 2026 at 5:20=E2=80=AFPM =
Randolph Sapp via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;rs=3D<a href=3D"mailto:ti.com@lists.openembedded.org">ti.co=
m@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">From: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com=
" target=3D"_blank">rs@ti.com</a>&gt;<br>
<br>
Merge the xuser-account recipe with xserver-nodm-init, since:<br>
<br>
=C2=A0- This is the only recipe dependent on it<br>
=C2=A0- This matches the current behavior in weston-init<br>
=C2=A0- Running x11 as root is no longer a supported path in<br>
=C2=A0 =C2=A0xserver-nodm-init<br>
=C2=A0- The display manager configuration and user account name are heavily=
<br>
=C2=A0 =C2=A0connected<br>
=C2=A0- The existing method of integration ignored this connection<br>
<br>
Signed-off-by: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D"_bl=
ank">rs@ti.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
1 -<br>
=C2=A0.../xserver-nodm-init}/system-xuser.conf=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
0<br>
=C2=A0.../x11-common/<a href=3D"http://xserver-nodm-init_3.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">xserver-nodm-init_3.0.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 20 +++++++++---<br>
=C2=A0.../user-creation/<a href=3D"http://xuser-account_0.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">xuser-account_0.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 31 -------------------<br>
=C2=A04 files changed, 15 insertions(+), 37 deletions(-)<br>
=C2=A0rename meta/{recipes-support/user-creation/files =3D&gt; recipes-grap=
hics/x11-common/xserver-nodm-init}/system-xuser.conf (100%)<br>
=C2=A0delete mode 100644 meta/recipes-support/user-creation/<a href=3D"http=
://xuser-account_0.1.bb" rel=3D"noreferrer" target=3D"_blank">xuser-account=
_0.1.bb</a><br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index a7425f7020..ec0a128901 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -935,7 +935,6 @@ RECIPE_MAINTAINER:pn-xserver-xf86-config =3D &quot;Unas=
signed &lt;unassigned@yoctoproject.<br>
=C2=A0RECIPE_MAINTAINER:pn-xserver-xorg =3D &quot;Unassigned &lt;<a href=3D=
"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproj=
ect.org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-xset =3D &quot;Unassigned &lt;<a href=3D"mailto:=
unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.org<=
/a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-xtrans =3D &quot;Unassigned &lt;<a href=3D"mailt=
o:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.or=
g</a>&gt;&quot;<br>
-RECIPE_MAINTAINER:pn-xuser-account =3D &quot;Randolph Sapp &lt;<a href=3D"=
mailto:rs@ti.com" target=3D"_blank">rs@ti.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-xvinfo =3D &quot;Unassigned &lt;<a href=3D"mailt=
o:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.or=
g</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-xwayland =3D &quot;Unassigned &lt;<a href=3D"mai=
lto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.=
org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-xwininfo =3D &quot;Unassigned &lt;<a href=3D"mai=
lto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.=
org</a>&gt;&quot;<br>
diff --git a/meta/recipes-support/user-creation/files/system-xuser.conf b/m=
eta/recipes-graphics/x11-common/xserver-nodm-init/system-xuser.conf<br>
similarity index 100%<br>
rename from meta/recipes-support/user-creation/files/system-xuser.conf<br>
rename to meta/recipes-graphics/x11-common/xserver-nodm-init/system-xuser.c=
onf<br>
diff --git a/meta/recipes-graphics/x11-common/<a href=3D"http://xserver-nod=
m-init_3.0.bb" rel=3D"noreferrer" target=3D"_blank">xserver-nodm-init_3.0.b=
b</a> b/meta/recipes-graphics/x11-common/<a href=3D"http://xserver-nodm-ini=
t_3.0.bb" rel=3D"noreferrer" target=3D"_blank">xserver-nodm-init_3.0.bb</a>=
<br>
index ed056df72f..0e9fe1e65a 100644<br>
--- a/meta/recipes-graphics/x11-common/<a href=3D"http://xserver-nodm-init_=
3.0.bb" rel=3D"noreferrer" target=3D"_blank">xserver-nodm-init_3.0.bb</a><b=
r>
+++ b/meta/recipes-graphics/x11-common/<a href=3D"http://xserver-nodm-init_=
3.0.bb" rel=3D"noreferrer" target=3D"_blank">xserver-nodm-init_3.0.bb</a><b=
r>
@@ -1,14 +1,15 @@<br>
-SUMMARY =3D &quot;Simple Xserver Init Script (no dm)&quot;<br>
+SUMMARY =3D &quot;Simple Xserver Init Script and user account&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/COPYING.MIT;md5=3D=
3da9cfbcb788c80a0384361b4de20420&quot;<br>
=C2=A0SECTION =3D &quot;x11&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;file://<a href=3D"http://emptty.conf.in" rel=3D"nor=
eferrer" target=3D"_blank">emptty.conf.in</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://default.desktop&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://default.desktop \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://system-xuser.conf&quot;<br=
>
<br>
=C2=A0S =3D &quot;${UNPACKDIR}&quot;<br>
<br>
-inherit features_check<br>
+inherit features_check useradd<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
<br>
@@ -26,10 +27,19 @@ do_install() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0sed -i &quot;s:@NO_CURSOR_ARG@:${NO_CURSOR_ARG}:&quot; =
${D}${sysconfdir}/emptty/conf<br>
=C2=A0 =C2=A0 =C2=A0sed -i &quot;s:@BLANK_ARGS@:${BLANK_ARGS}:&quot; ${D}${=
sysconfdir}/emptty/conf<br>
+<br>
+=C2=A0 =C2=A0 install -D -m 0644 ${S}/system-xuser.conf ${D}${sysconfdir}/=
dbus-1/system.d/system-xuser.conf<br>
=C2=A0}<br>
<br>
=C2=A0FILES:${PN} =3D &quot;${sysconfdir}/emptty/conf \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/xsession=
s/default.desktop&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/xsession=
s/default.desktop \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}/dbus-=
1/system.d/system-xuser.conf&quot;<br>
+<br>
+USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
+USERADD_PARAM:${PN} =3D &quot;--create-home \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0--groups video,tty,audio,input,shutdown,disk,nopasswdlogin \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0--user-group xuser&quot;<br>
+GROUPADD_PARAM:${PN} =3D &quot;-r nopasswdlogin&quot;<br>
<br>
-RDEPENDS:${PN} =3D &quot;emptty xuser-account&quot;<br>
+RDEPENDS:${PN} =3D &quot;emptty&quot;<br>
=C2=A0RPROVIDES:${PN} +=3D &quot;virtual-emptty-conf&quot;<br>
diff --git a/meta/recipes-support/user-creation/<a href=3D"http://xuser-acc=
ount_0.1.bb" rel=3D"noreferrer" target=3D"_blank">xuser-account_0.1.bb</a> =
b/meta/recipes-support/user-creation/<a href=3D"http://xuser-account_0.1.bb=
" rel=3D"noreferrer" target=3D"_blank">xuser-account_0.1.bb</a><br>
deleted file mode 100644<br>
index f1e4cb674f..0000000000<br>
--- a/meta/recipes-support/user-creation/<a href=3D"http://xuser-account_0.=
1.bb" rel=3D"noreferrer" target=3D"_blank">xuser-account_0.1.bb</a><br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-SUMMARY =3D &quot;Creates an &#39;xuser&#39; account used for running X11&=
quot;<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9c=
fbcb788c80a0384361b4de20420&quot;<br>
-<br>
-SRC_URI =3D &quot;file://system-xuser.conf&quot;<br>
-<br>
-inherit allarch useradd<br>
-<br>
-S =3D &quot;${UNPACKDIR}&quot;<br>
-<br>
-do_configure() {<br>
-=C2=A0 =C2=A0 :<br>
-}<br>
-<br>
-do_compile() {<br>
-=C2=A0 =C2=A0 :<br>
-}<br>
-<br>
-do_install() {<br>
-=C2=A0 =C2=A0 install -D -m 0644 ${UNPACKDIR}/system-xuser.conf ${D}${sysc=
onfdir}/dbus-1/system.d/system-xuser.conf<br>
-}<br>
-<br>
-FILES:${PN} =3D &quot;${sysconfdir}/dbus-1/system.d/system-xuser.conf&quot=
;<br>
-<br>
-USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
-USERADD_PARAM:${PN} =3D &quot;--create-home \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0--groups video,tty,audio,input,shutdown,disk,nopasswdlogin \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0--user-group xuser&quot;<br>
-GROUPADD_PARAM:${PN} =3D &quot;-r nopasswdlogin&quot;<br>
-<br>
-ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#230410): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/230410" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/230410</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117609025/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117609025/1997914</a><br>
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

--00000000000078805e064a2bc636--

