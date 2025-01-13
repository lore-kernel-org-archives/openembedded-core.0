Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285C1E7719E
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 11:10:16 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.14761.1736766614435659919
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 03:10:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zafpjo0x;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3eb7e725aa0so1479435b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 03:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736766614; x=1737371414; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O2Ygg1OVSr3zwVM+pYX5XddOD0ewq7PCem459RKK27I=;
        b=Zafpjo0xDbWzY/YIB+d661ZyAasBZ8wWeCZwSCvEaLh9kx28paJn4CoNzILacoYdO4
         vhhhnfCcI1W3RvxHfn6VXRsQng9J9AkQ8ImJRcBE8adltAuvJsfLJDysYAksMnzTIRaf
         0vn3ZRCZi1btx08qD/pv6eiCxNAivzDfkDynIHMf0qt0hCPwtafuK3GL20CN8BwH3Cub
         IOhRXyJdP1REMRXVCF39IWHOSCTMAogqladLK82cYwiZiAO19nqfjd8ieFQf9V6cvh/X
         SzYQvx1zUNnzuAm6KoWxxgTDyHTaugTCOdU3HB4AqIdLoVpWtSq240mg7Ne6jjHyANn6
         8vJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736766614; x=1737371414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O2Ygg1OVSr3zwVM+pYX5XddOD0ewq7PCem459RKK27I=;
        b=nNGm1ZsW9RK/npzuBJWgflstkwBT2kDJFk+mTxSybB8oW1MS88JYOaDKgw6t9HMRk4
         u85MD2+yldf1QDQL4nbZWk81U60sR6LhENQqr6VS2v0Wi5t8jWHpuoAWvVERhQ3+K/no
         ZHPt1H4PPVEc8uyYeMVMvsxxr3u+c7SZ3ifGDa74IX7MDoqWCKBiBb4MA2sRe37CVvSr
         US58xCYrcEvKEpFTIC4vY6CtXSTOlYKhp643dX2FezWc5WCUbZSx7AeEWlBhkX9yG7rq
         29Lkf3cNCZn0WLZBk0PjKNYloQoCYraTLR3C/SQ+PNr5LDCv5nznIXH9veyRuh2i9IWR
         YnSQ==
X-Gm-Message-State: AOJu0YxtcZFRw5zVBR5p5LCh2pBmM3mE6ftRlRSukihblqolyzMEgG1+
	ECwmGre+ERpkkKK3j9Q+3/V28YeymGe9wKbCAcakVxA2v5zM6wUpYMqqrvLOmTO/6MvKU0w4FEF
	6N2BT/zwUjiB2TsM0EQYetaZrniM=
X-Gm-Gg: ASbGncv5TFWwL4nbUjQ6xTyeIQHeLTyzCBNe2XswVRT1UiKFrPv0c5Qe5Hya4yz16i1
	Kdk+OW7dHVprHFCmumaMKQoxKLLakDihXf5+IPIs=
X-Google-Smtp-Source: AGHT+IFug9OwnaAhlaCMh6Co9ntTM2fsE2FGXu5/gAgJ+LIQ5RBBsib71NpAVgkZvR+MCgtuSe/JtJsURyi2WA5TSs0=
X-Received: by 2002:a05:6871:6508:b0:29e:3d40:ab48 with SMTP id
 586e51a60fabf-2aa069763c6mr11210247fac.34.1736766613582; Mon, 13 Jan 2025
 03:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20250111183134.22040-1-marex@denx.de>
In-Reply-To: <20250111183134.22040-1-marex@denx.de>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
Date: Mon, 13 Jan 2025 12:10:02 +0100
X-Gm-Features: AbW1kvZcvsD0QFfLpY1dGebFqu07g9TIe-1VeVJY2BLSpB393UBen0W8Vkul4Po
Message-ID: <CAB3asfjM6QDcOcWARN_GVF2DzDZWo2oUoyen95HskDoQ3av5nA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: kernel-fitimage: Fix dependency loop if
 UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
To: marex@denx.de
Cc: openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Sean Anderson <sean.anderson@seco.com>
Content-Type: multipart/alternative; boundary="0000000000000f7ccb062b947d89"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 11:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209708

--0000000000000f7ccb062b947d89
Content-Type: text/plain; charset="UTF-8"

Hi Marek

The issue is known and already discussed here:
https://lists.yoctoproject.org/g/yocto/message/64428. It probably hits many
users and a fix would be more than welcome.

A more general discussion about issues related to the
kernel-fitimage.bbclass is here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12912.

Am Sa., 11. Jan. 2025 um 19:32 Uhr schrieb Marek Vasut via
lists.openembedded.org <marex=denx.de@lists.openembedded.org>:

> In case both UBOOT_SIGN_ENABLE and UBOOT_ENV are enabled and
> kernel-fitimage.bbclass is in use to generate signed kernel
> fitImage, there is a circular dependency between uboot-sign
> and kernel-fitimage bbclasses . The loop looks like this:
>
> kernel-fitimage.bbclass:
> - do_populate_sysroot depends on do_assemble_fitimage
>   - do_assemble_fitimage depends on virtual/bootloader:do_populate_sysroot
>     - virtual/bootloader:do_populate_sysroot depends on
> virtual/bootloader:do_install
>       => The virtual/bootloader:do_install installs and the
>          virtual/bootloader:do_populate_sysroot places into
>          sysroot an U-Boot environment script embedded into
>          kernel fitImage during do_assemble_fitimage run .
>
> uboot-sign.bbclass:
> - DEPENDS on KERNEL_PN, which is really virtual/kernel. More accurately
>   - do_deploy depends on do_uboot_assemble_fitimage
>   - do_install depends on do_uboot_assemble_fitimage
>   - do_uboot_assemble_fitimage depends on
> virtual/kernel:do_populate_sysroot
>     => do_install depends on virtual/kernel:do_populate_sysroot
>
> => virtual/bootloader:do_install depends on
> virtual/kernel:do_populate_sysroot
>    virtual/kernel:do_populate_sysroot depends on
> virtual/bootloader:do_install
>
> Attempt to resolve the loop by making u-boot do_compile() task already
> deploy the
> U-Boot environment script used by kernel-fitimage.bbclass
> do_assemble_fitimage()
> into STAGING_DIR_HOST , and then by making kernel-fitimage.bbclass depend
> on
> virtual/bootloader:do_compile instead of
> virtual/bootloader:do_populate_sysroot .
>
> Make sure it is only uboot-sign.bbclass do_uboot_assemble_fitimage() task
> that
> depends on KERNEL_PN:do_populate_sysroot .
>
> Fixes: 5e12dc911d0c ("u-boot: Rework signing to remove interdependencies")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Sean Anderson <sean.anderson@seco.com>
> ---
>  meta/classes-recipe/kernel-fitimage.bbclass | 2 +-
>  meta/classes-recipe/uboot-sign.bbclass      | 3 +--
>  meta/recipes-bsp/u-boot/u-boot.inc          | 6 ++++++
>  3 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass
> b/meta/classes-recipe/kernel-fitimage.bbclass
> index 67c98adb23..81245446a2 100644
> --- a/meta/classes-recipe/kernel-fitimage.bbclass
> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> @@ -42,7 +42,7 @@ python __anonymous () {
>
>      ubootenv = d.getVar('UBOOT_ENV')
>      if ubootenv:
> -        d.appendVarFlag('do_assemble_fitimage', 'depends', '
> virtual/bootloader:do_populate_sysroot')
> +        d.appendVarFlag('do_assemble_fitimage', 'depends', '
> virtual/bootloader:do_compile')
>
This is definitely one of the problematic lines of code. See also
https://lists.yoctoproject.org/g/yocto/message/64428.

However, I guess even if you write the env script from the do_compile task
to the sysroot directory, the dependency here should be on
do_populate_sysroot so that the env file is properly cached by the sstate
cache.
But unfortunately this is not the only problem the fitimage-kernel.bbclass
has when it comes to building from sstate-cache with empty TMPDIR. This is
also broken in other places, which means that this patch theoretically
makes the situation with the sstate even worse. But since this doesn't work
anyway and the patch fixes the circular dependencies issue, the majority of
users would probably benefit from this patch. And to fix the problem
properly, you would probably have to rewrite the fitimage generation, as
discussed on https://bugzilla.yoctoproject.org/show_bug.cgi?id=12912.

Regards,
Adrian

>
>      #check if there are any dtb providers
>      providerdtb = d.getVar("PREFERRED_PROVIDER_virtual/dtb")
> diff --git a/meta/classes-recipe/uboot-sign.bbclass
> b/meta/classes-recipe/uboot-sign.bbclass
> index a17be745ce..e1a37b4343 100644
> --- a/meta/classes-recipe/uboot-sign.bbclass
> +++ b/meta/classes-recipe/uboot-sign.bbclass
> @@ -96,8 +96,6 @@ python() {
>      sign = d.getVar('UBOOT_SIGN_ENABLE') == '1'
>      if d.getVar('UBOOT_FITIMAGE_ENABLE') == '1' or sign:
>          d.appendVar('DEPENDS', " u-boot-tools-native dtc-native")
> -    if sign:
> -        d.appendVar('DEPENDS', " " + d.getVar('KERNEL_PN'))
>  }
>
>  concat_dtb() {
> @@ -350,6 +348,7 @@ uboot_assemble_fitimage_helper() {
>         fi
>  }
>
> +do_uboot_assemble_fitimage[depends] = "${@(d.getVar('KERNEL_PN') +
> ':do_populate_sysroot') if d.getVar('UBOOT_SIGN_ENABLE') == 1 else ''}"
>  do_uboot_assemble_fitimage() {
>         if [ "${UBOOT_SIGN_ENABLE}" = "1" ] ; then
>                 cp "${STAGING_DIR_HOST}/sysroot-only/fitImage"
> "${B}/fitImage-linux"
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
> b/meta/recipes-bsp/u-boot/u-boot.inc
> index 3270c22e8d..61f98ec5b5 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -72,6 +72,12 @@ do_compile () {
>      then
>          ${UBOOT_MKIMAGE} -C none -A ${UBOOT_ARCH} -T script -d
> ${UNPACKDIR}/${UBOOT_ENV_SRC} ${B}/${UBOOT_ENV_BINARY}
>      fi
> +
> +    if [ -n "${UBOOT_ENV}" ]
> +    then
> +        mkdir -p ${STAGING_DIR_HOST}/boot/
> +        install -m 644 ${B}/${UBOOT_ENV_BINARY}
> ${STAGING_DIR_HOST}/boot/${UBOOT_ENV_IMAGE}
> +    fi
>
 }
>
>  uboot_compile_config () {
> --
> 2.45.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209671):
> https://lists.openembedded.org/g/openembedded-core/message/209671
> Mute This Topic: https://lists.openembedded.org/mt/110557812/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> adrian.freihofer@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000000f7ccb062b947d89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Marek</div><div><br></div><div>The issue is known =
and already discussed here: <a href=3D"https://lists.yoctoproject.org/g/yoc=
to/message/64428">https://lists.yoctoproject.org/g/yocto/message/64428</a>.=
 It probably hits many users and a fix would be more than welcome.</div><di=
v><br></div><div>A more general discussion about issues related to the kern=
el-fitimage.bbclass is here: <a href=3D"https://bugzilla.yoctoproject.org/s=
how_bug.cgi?id=3D12912">https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D12912</a>.</div><br><div class=3D"gmail_quote gmail_quote_container"><di=
v dir=3D"ltr" class=3D"gmail_attr">Am Sa., 11. Jan. 2025 um 19:32=C2=A0Uhr =
schrieb Marek Vasut via <a href=3D"http://lists.openembedded.org">lists.ope=
nembedded.org</a> &lt;marex=3D<a href=3D"mailto:denx.de@lists.openembedded.=
org">denx.de@lists.openembedded.org</a>&gt;:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">In case both UBOOT_SIGN_ENABLE and UBOOT_ENV a=
re enabled and<br>
kernel-fitimage.bbclass is in use to generate signed kernel<br>
fitImage, there is a circular dependency between uboot-sign<br>
and kernel-fitimage bbclasses . The loop looks like this:<br>
<br>
kernel-fitimage.bbclass:<br>
- do_populate_sysroot depends on do_assemble_fitimage<br>
=C2=A0 - do_assemble_fitimage depends on virtual/bootloader:do_populate_sys=
root<br>
=C2=A0 =C2=A0 - virtual/bootloader:do_populate_sysroot depends on virtual/b=
ootloader:do_install<br>
=C2=A0 =C2=A0 =C2=A0 =3D&gt; The virtual/bootloader:do_install installs and=
 the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtual/bootloader:do_populate_sysroot pl=
aces into<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysroot an U-Boot environment script embe=
dded into<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel fitImage during do_assemble_fitima=
ge run .<br>
<br>
uboot-sign.bbclass:<br>
- DEPENDS on KERNEL_PN, which is really virtual/kernel. More accurately<br>
=C2=A0 - do_deploy depends on do_uboot_assemble_fitimage<br>
=C2=A0 - do_install depends on do_uboot_assemble_fitimage<br>
=C2=A0 - do_uboot_assemble_fitimage depends on virtual/kernel:do_populate_s=
ysroot<br>
=C2=A0 =C2=A0 =3D&gt; do_install depends on virtual/kernel:do_populate_sysr=
oot<br>
<br>
=3D&gt; virtual/bootloader:do_install depends on virtual/kernel:do_populate=
_sysroot<br>
=C2=A0 =C2=A0virtual/kernel:do_populate_sysroot depends on virtual/bootload=
er:do_install<br>
<br>
Attempt to resolve the loop by making u-boot do_compile() task already depl=
oy the<br>
U-Boot environment script used by kernel-fitimage.bbclass do_assemble_fitim=
age()<br>
into STAGING_DIR_HOST , and then by making kernel-fitimage.bbclass depend o=
n<br>
virtual/bootloader:do_compile instead of virtual/bootloader:do_populate_sys=
root .<br>
<br>
Make sure it is only uboot-sign.bbclass do_uboot_assemble_fitimage() task t=
hat<br>
depends on KERNEL_PN:do_populate_sysroot .<br>
<br>
Fixes: 5e12dc911d0c (&quot;u-boot: Rework signing to remove interdependenci=
es&quot;)<br>
Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=3D"_=
blank">marex@denx.de</a>&gt;<br>
---<br>
Cc: Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com" =
target=3D"_blank">alexandre.belloni@bootlin.com</a>&gt;<br>
Cc: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org=
" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
Cc: Sean Anderson &lt;<a href=3D"mailto:sean.anderson@seco.com" target=3D"_=
blank">sean.anderson@seco.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel-fitimage.bbclass | 2 +-<br>
=C2=A0meta/classes-recipe/uboot-sign.bbclass=C2=A0 =C2=A0 =C2=A0 | 3 +--<br=
>
=C2=A0meta/recipes-bsp/u-boot/u-boot.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 6 ++++++<br>
=C2=A03 files changed, 8 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass<br>
index 67c98adb23..81245446a2 100644<br>
--- a/meta/classes-recipe/kernel-fitimage.bbclass<br>
+++ b/meta/classes-recipe/kernel-fitimage.bbclass<br>
@@ -42,7 +42,7 @@ python __anonymous () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0ubootenv =3D d.getVar(&#39;UBOOT_ENV&#39;)<br>
=C2=A0 =C2=A0 =C2=A0if ubootenv:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVarFlag(&#39;do_assemble_fitimage&#39;=
, &#39;depends&#39;, &#39; virtual/bootloader:do_populate_sysroot&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVarFlag(&#39;do_assemble_fitimage&#39;=
, &#39;depends&#39;, &#39; virtual/bootloader:do_compile&#39;)<br></blockqu=
ote>This is definitely one of the problematic lines of code. See also <a hr=
ef=3D"https://lists.yoctoproject.org/g/yocto/message/64428">https://lists.y=
octoproject.org/g/yocto/message/64428</a>.<br><br>However, I guess even if =
you write the env script from the do_compile task to the sysroot directory,=
 the dependency here should be on do_populate_sysroot so that the env file =
is properly cached by the sstate cache.<br>But unfortunately this is not th=
e only problem the fitimage-kernel.bbclass has when it comes to building fr=
om sstate-cache with empty TMPDIR. This is also broken in other places, whi=
ch means that this patch theoretically makes the situation with the sstate =
even worse. But since this doesn&#39;t work anyway and the patch fixes the =
circular dependencies issue, the majority of users would probably benefit f=
rom this patch. And to fix the problem properly, you would probably have to=
 rewrite the fitimage generation, as discussed on <a href=3D"https://bugzil=
la.yoctoproject.org/show_bug.cgi?id=3D12912">https://bugzilla.yoctoproject.=
org/show_bug.cgi?id=3D12912</a>.</div><div class=3D"gmail_quote gmail_quote=
_container"><br></div><div class=3D"gmail_quote gmail_quote_container">Rega=
rds,</div><div class=3D"gmail_quote gmail_quote_container">Adrian<br></div>=
<div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0#check if there are any dtb providers<br>
=C2=A0 =C2=A0 =C2=A0providerdtb =3D d.getVar(&quot;PREFERRED_PROVIDER_virtu=
al/dtb&quot;)<br>
diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass<br>
index a17be745ce..e1a37b4343 100644<br>
--- a/meta/classes-recipe/uboot-sign.bbclass<br>
+++ b/meta/classes-recipe/uboot-sign.bbclass<br>
@@ -96,8 +96,6 @@ python() {<br>
=C2=A0 =C2=A0 =C2=A0sign =3D d.getVar(&#39;UBOOT_SIGN_ENABLE&#39;) =3D=3D &=
#39;1&#39;<br>
=C2=A0 =C2=A0 =C2=A0if d.getVar(&#39;UBOOT_FITIMAGE_ENABLE&#39;) =3D=3D &#3=
9;1&#39; or sign:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&#39;DEPENDS&#39;, &quot; u-b=
oot-tools-native dtc-native&quot;)<br>
-=C2=A0 =C2=A0 if sign:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;DEPENDS&#39;, &quot; &quot; +=
 d.getVar(&#39;KERNEL_PN&#39;))<br>
=C2=A0}<br>
<br>
=C2=A0concat_dtb() {<br>
@@ -350,6 +348,7 @@ uboot_assemble_fitimage_helper() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
+do_uboot_assemble_fitimage[depends] =3D &quot;${@(d.getVar(&#39;KERNEL_PN&=
#39;) + &#39;:do_populate_sysroot&#39;) if d.getVar(&#39;UBOOT_SIGN_ENABLE&=
#39;) =3D=3D 1 else &#39;&#39;}&quot;<br>
=C2=A0do_uboot_assemble_fitimage() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${UBOOT_SIGN_ENABLE}&quot; =3D &quot=
;1&quot; ] ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp &quot;${STAGING_=
DIR_HOST}/sysroot-only/fitImage&quot; &quot;${B}/fitImage-linux&quot;<br>
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc<br>
index 3270c22e8d..61f98ec5b5 100644<br>
--- a/meta/recipes-bsp/u-boot/u-boot.inc<br>
+++ b/meta/recipes-bsp/u-boot/u-boot.inc<br>
@@ -72,6 +72,12 @@ do_compile () {<br>
=C2=A0 =C2=A0 =C2=A0then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${UBOOT_MKIMAGE} -C none -A ${UBOOT_ARCH}=
 -T script -d ${UNPACKDIR}/${UBOOT_ENV_SRC} ${B}/${UBOOT_ENV_BINARY}<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 if [ -n &quot;${UBOOT_ENV}&quot; ]<br>
+=C2=A0 =C2=A0 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${STAGING_DIR_HOST}/boot/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 644 ${B}/${UBOOT_ENV_BINARY} ${STAG=
ING_DIR_HOST}/boot/${UBOOT_ENV_IMAGE}<br>
+=C2=A0 =C2=A0 fi <br></blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
=C2=A0}<br>
<br>
=C2=A0uboot_compile_config () {<br>
-- <br>
2.45.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#209671): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/209671" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/209671</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110557812/445=
4582" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110557812/4454582</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:adrian.freihofer@gmail.com=
" target=3D"_blank">adrian.freihofer@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000000f7ccb062b947d89--

