Return-Path: <joaohf@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id CCDCC61566
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 00:40:02 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id bz8so382025wib.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 16:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=A/sarjFw8iDUsXh+4DYy3FMVvz9TEnGhKPn/q8MIrj8=;
	b=PlvmUc/qCszdEUfI5QlD17RNl1OoXCirjOGULxhiWG9YoxidjCtLsYwFKRfk5DsYCL
	xCaHeqOo4WpkCw2FePTNht+5FlqxHT/SjiYJaY4UZL9/+stycxPLT5vNEyCbHSvm/gNf
	8NqO4CN2AN5PfNi2Kyx++TOmcEJ0P9jbw5g1jqoUEomqMNPB3sxRjQG3eekZVO9h4cLt
	4ahIGllNyyMWsHk6R3N/NHmBuU/zrn7f7+zCBpzmn+QrmNMfILttWEAemfditPhJGwXq
	/7pE8fC1T5FKxfJWJwOUHDCv6Up/2YhXNOAVDAwRLc/GyQKsxV4GgG1HKEJSWDv+rsDq
	Sp9g==
MIME-Version: 1.0
X-Received: by 10.180.37.237 with SMTP id b13mr586274wik.52.1386895201745;
	Thu, 12 Dec 2013 16:40:01 -0800 (PST)
Received: by 10.217.89.10 with HTTP; Thu, 12 Dec 2013 16:40:01 -0800 (PST)
In-Reply-To: <1386139839-10522-1-git-send-email-yanjun.zhu@windriver.com>
References: <1386139839-10522-1-git-send-email-yanjun.zhu@windriver.com>
Date: Thu, 12 Dec 2013 22:40:01 -0200
Message-ID: <CANFVK7-ZvZ+Ogoz1BiSJeR2G3PL3ORueYE4J=zuYT=Bwm=pPGw@mail.gmail.com>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
To: Zhu Yanjun <yanjun.zhu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boot-directdisk: add the support of vmdk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Dec 2013 00:40:03 -0000
Content-Type: multipart/alternative; boundary=e89a8f64673dd73f7204ed5fb377

--e89a8f64673dd73f7204ed5fb377
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Is ${IMAGE_FSTYPE} correct?

I can't find this variable.

Maybe IMAGE_FSTYPES ?

Thanks.


On Wed, Dec 4, 2013 at 4:50 AM, Zhu Yanjun <yanjun.zhu@windriver.com> wrote=
:

> ---
>  meta/classes/boot-directdisk.bbclass |   24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/boot-directdisk.bbclass
> b/meta/classes/boot-directdisk.bbclass
> index 5535728..b2bd210 100644
> --- a/meta/classes/boot-directdisk.bbclass
> +++ b/meta/classes/boot-directdisk.bbclass
> @@ -88,6 +88,15 @@ build_boot_dd() {
>                 grubefi_hddimg_populate $HDDDIR
>         fi
>
> +       if [ ${IMAGE_FSTYPE} =3D "vmdk" ]; then
> +               if [ x${AUTO_SYSLINUXMENU} =3D x1 ] ; then
> +                       install -m 0644
> ${STAGING_DIR}/${MACHINE}/usr/share/syslinux/vesamenu.c32
> ${HDDDIR}${SYSLINUXDIR}/vesamenu.c32
> +                       if [ x${SYSLINUX_SPLASH} !=3D x ] ; then
> +                               install -m 0644 ${SYSLINUX_SPLASH}
> ${HDDDIR}${SYSLINUXDIR}/splash.lss
> +                       fi
> +               fi
> +       fi
> +
>         BLOCKS=3D`du -bks $HDDDIR | cut -f 1`
>         BLOCKS=3D`expr $BLOCKS + ${BOOTDD_EXTRA_SPACE}`
>
> @@ -119,17 +128,22 @@ build_boot_dd() {
>         parted $IMAGE mkpart primary fat16 0 ${END1}B
>         parted $IMAGE unit B mkpart primary ext2 ${END2}B ${END3}B
>         parted $IMAGE set 1 boot on
> -       parted $IMAGE print
> +
> +       if [ ${IMAGE_FSTYPE} !=3D "vmdk" ]; then
> +               parted $IMAGE print
> +       fi
>
>         awk "BEGIN { printf \"$(echo ${DISK_SIGNATURE} | fold -w 2 | tac =
|
> paste -sd '' | sed 's/\(..\)/\\x&/g')\" }" | \
>                 dd of=3D$IMAGE bs=3D1 seek=3D440 conv=3Dnotrunc
>
>         OFFSET=3D`expr $END2 / 512`
> -       if [ "${PCBIOS}" =3D "1" ]; then
> -               dd if=3D${STAGING_DATADIR}/syslinux/mbr.bin of=3D$IMAGE
> conv=3Dnotrunc
> +       if [ ${IMAGE_FSTYPE} !=3D "vmdk" ]; then
> +               if [ "${PCBIOS}" =3D "1" ]; then
> +                       dd if=3D${STAGING_DATADIR}/syslinux/mbr.bin
> of=3D$IMAGE conv=3Dnotrunc
> +               fi
> +               dd if=3D$HDDIMG of=3D$IMAGE conv=3Dnotrunc seek=3D1 bs=3D=
512
>         fi
> -       dd if=3D$HDDIMG of=3D$IMAGE conv=3Dnotrunc seek=3D1 bs=3D512
> -       dd if=3D${ROOTFS} of=3D$IMAGE conv=3Dnotrunc seek=3D$OFFSET bs=3D=
512
> +       dd if=3D${ROOTFS} of=3D$IMAGE conv=3Dnotrunc seek=3D$OFFSET bs=3D=
512
>
>         cd ${DEPLOY_DIR_IMAGE}
>         rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
> --
> 1.7.9.5
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



--=20
Jo=C3=A3o Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil

--e89a8f64673dd73f7204ed5fb377
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi,<br><br></div>Is ${IMAGE_FSTYPE} correct=
? <br><br></div>I can&#39;t find this variable.<br><br>Maybe IMAGE_FSTYPES =
?<br><br></div>Thanks.<br></div><div class=3D"gmail_extra"><br><br><div cla=
ss=3D"gmail_quote">
On Wed, Dec 4, 2013 at 4:50 AM, Zhu Yanjun <span dir=3D"ltr">&lt;<a href=3D=
"mailto:yanjun.zhu@windriver.com" target=3D"_blank">yanjun.zhu@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
---<br>
=C2=A0meta/classes/boot-directdisk.bbclass | =C2=A0 24 +++++++++++++++++++-=
----<br>
=C2=A01 file changed, 19 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-direc=
tdisk.bbclass<br>
index 5535728..b2bd210 100644<br>
--- a/meta/classes/boot-directdisk.bbclass<br>
+++ b/meta/classes/boot-directdisk.bbclass<br>
@@ -88,6 +88,15 @@ build_boot_dd() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grubefi_hddimg_popu=
late $HDDDIR<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
+ =C2=A0 =C2=A0 =C2=A0 if [ ${IMAGE_FSTYPE} =3D &quot;vmdk&quot; ]; then<br=
>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ x${AUTO_SYSLINUXMEN=
U} =3D x1 ] ; then<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 install -m 0644 ${STAGING_DIR}/${MACHINE}/usr/share/syslinux/vesamenu.c=
32 ${HDDDIR}${SYSLINUXDIR}/vesamenu.c32<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if [ x${SYSLINUX_SPLASH} !=3D x ] ; then<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${SYSLINUX_SPLASH} ${HDDDIR=
}${SYSLINUXDIR}/splash.lss<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fi<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+ =C2=A0 =C2=A0 =C2=A0 fi<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 BLOCKS=3D`du -bks $HDDDIR | cut -f 1`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 BLOCKS=3D`expr $BLOCKS + ${BOOTDD_EXTRA_SPACE}`=
<br>
<br>
@@ -119,17 +128,22 @@ build_boot_dd() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 parted $IMAGE mkpart primary fat16 0 ${END1}B<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 parted $IMAGE unit B mkpart primary ext2 ${END2=
}B ${END3}B<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 parted $IMAGE set 1 boot on<br>
- =C2=A0 =C2=A0 =C2=A0 parted $IMAGE print<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 if [ ${IMAGE_FSTYPE} !=3D &quot;vmdk&quot; ]; then<b=
r>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parted $IMAGE print<br>
+ =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 awk &quot;BEGIN { printf \&quot;$(echo ${DISK_S=
IGNATURE} | fold -w 2 | tac | paste -sd &#39;&#39; | sed &#39;s/\(..\)/\\x&=
amp;/g&#39;)\&quot; }&quot; | \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dd of=3D$IMAGE bs=
=3D1 seek=3D440 conv=3Dnotrunc<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFSET=3D`expr $END2 / 512`<br>
- =C2=A0 =C2=A0 =C2=A0 if [ &quot;${PCBIOS}&quot; =3D &quot;1&quot; ]; then=
<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dd if=3D${STAGING_DATADI=
R}/syslinux/mbr.bin of=3D$IMAGE conv=3Dnotrunc<br>
+ =C2=A0 =C2=A0 =C2=A0 if [ ${IMAGE_FSTYPE} !=3D &quot;vmdk&quot; ]; then<b=
r>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${PCBIOS}&quo=
t; =3D &quot;1&quot; ]; then<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dd if=3D${STAGING_DATADIR}/syslinux/mbr.bin of=3D$IMAGE conv=3Dnotrunc<=
br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dd if=3D$HDDIMG of=3D$IM=
AGE conv=3Dnotrunc seek=3D1 bs=3D512<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
- =C2=A0 =C2=A0 =C2=A0 dd if=3D$HDDIMG of=3D$IMAGE conv=3Dnotrunc seek=3D1 =
bs=3D512<br>
- =C2=A0 =C2=A0 =C2=A0 dd if=3D${ROOTFS} of=3D$IMAGE conv=3Dnotrunc seek=3D=
$OFFSET bs=3D512<br>
+ =C2=A0 =C2=A0 =C2=A0 dd if=3D${ROOTFS} of=3D$IMAGE conv=3Dnotrunc seek=3D=
$OFFSET bs=3D512<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${DEPLOY_DIR_IMAGE}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hd=
ddirect<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div dir=
=3D"ltr">Jo=C3=A3o Henrique Ferreira de Freitas - <a href=3D"http://joaohf_=
at_gmail.com" target=3D"_blank">joaohf_at_gmail.com</a><br>Campinas-SP-Bras=
il</div>
</div>

--e89a8f64673dd73f7204ed5fb377--
