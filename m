Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D83AEF5862
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:45:25 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24725.1771951515836784529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 08:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jroAUiKF;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b904e1cd038so827301666b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 08:45:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771951514; cv=none;
        d=google.com; s=arc-20240605;
        b=Y2vX1ckjDdcJ/XTsAKoqOkXCI27KTe1bTu6AHQUGA3fbK+6mhSHsl4gYcMnrf13aeD
         fAg/Ema9z5ojlKUGQ47k8W0NaPMlLB4LwEiJptDBt6ptYFvITNmaK8Fhgv6JyH9W9fVL
         N94jHGiqJ2hymRAWHfoUlkGbt7TQVtjLXMEOy7cyFWiwxDpgSmGif6aS2YUlrGimfOcw
         8Z4fGgKTBDhkS+SKOJNVyAIEoBQ8Lnhh5LxAYwbZjHMG9QQ7KEKgUXzqF31ATtrjfgH8
         /Cdt7yrUf9ykmdUBEMwjyDyu0ea/Zg8yG+bABFk7eQvSxxzDdQfIXKR42uJ14lhrvpNX
         mbDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cZR1jHmSsUtmMWLrA+hY2P8dfpyempypuxD0p83ZvSo=;
        fh=RC+f0MDCDpy2YPiLj7RJliEH8iZ1Eg3yt4j6bjoY8GM=;
        b=T3s7L9VTY55yOPLbq9ZE7hN9F3AabMbO9pFA5zfq3f/jPHJQhcPAAHsGnszdbhx8Uz
         wuHOk0T4gDKe31YdAVaVKtcOdPWqH6tKiJPPY2Fu+2pU/1rXnewZK4TIfEfx4F3JVHs6
         LIgK4DfC43LXvxUhQ1q7FhZPbbfTAVirsGp11Y+8KKl1E9Fjl47K7nsXJxBhFlzUsQZu
         qfbGjJGoajcjKx/+b/8JowBSgXc8/nhh+phrBxyitrEDTSqLnPorTcBMvdUWaw375nJg
         HrG55U3uqbFzebOvIpoOuxL5sV93peU8JuXBz6xRM2xGyy+xo40OHUkp55fwF2IHe6qK
         VAog==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771951514; x=1772556314; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cZR1jHmSsUtmMWLrA+hY2P8dfpyempypuxD0p83ZvSo=;
        b=jroAUiKFg7iedVJDHYfUx1fIhQcbre9CKH4VbIlUNPqW5w8zzBWqgEQkCgZplgwF48
         pMtA8eRJNjb5JV7iPFhv67M+/dOjLsJIP8eulz5jx0rEwANbxo0nKgX6uDNeaO02rZTm
         t5JUKEGNO1z30nVUg2r9Hp+cfJFhEHOaUigpgbRUJVO1yoVD2bP3CsehGGzWnS7SYM3e
         GV4ziDk3QZBRpI6/0/h4VfIgNNE4QnvMUuYWg7MgTdK/BpVG34xBnTKh4LjrOiAG8tAY
         M6kpVf04Qt3jb4kc95R8nSyGY7AlzxRXbbAZnfUsCdGRSejAF8FAV2/kfE7aFfrzUcZi
         llwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771951514; x=1772556314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZR1jHmSsUtmMWLrA+hY2P8dfpyempypuxD0p83ZvSo=;
        b=GfTrqzXXW5GryAxeqVR8gRB0UZkCwLOau48xhODFyZqYnJLXiSXgyVi+zBdiTbnbt5
         6dIMr5R83GijPNsVBLX22s5obIfNHExztj8DCAJiN+JeOYECTPNp71oyxJcWCHM/p/Ll
         EEFuQcH22jIP5vy0Ck2hSHDHQfVspM0RMJIVNdb0BSQy7TtozjZiR5QBjmzEnY07Q8NV
         Looe6E30jKsWYMwBcDQ1n+6uX6XrVWtPcHluILDx9y7s2O5KDbWLe8q5elsmvvf6/0Jm
         GZ5XmrZyAoJ8kdRCSG+FXOwFDS8/jIbCci7CxxcUl1VIrB2qQO2VdJJr8umNT84MbPAI
         37UA==
X-Gm-Message-State: AOJu0YzMxfKS8XoY26okPLcBcEjVB23aOmc98Y1s6hGrHDwtsHXLWtFd
	lT65JX41xKpOeSPFkbE7VCxT6AEQeuzkU4qpHjJJMNWS7JbgZAcmDJ5kdT8JiZkZwD2VLVtXpAS
	z/a5B5yPjn1CHd5nlQNoQtt1fqmbsLCEnnjC3
X-Gm-Gg: AZuq6aKlO5DIZjbLTEM4K2HBXV7a7/l1FcVYSlpfWNNC6BS/6JFxFs7FMi2m3rzzbp3
	g6aiOcphM03x//Ngy0LQBHhLsaYp52LJbGuO4Dm65CFS2Yh8ZGEKeUIwoGP7Zl51er3eUXqJBOe
	wWEml0znbrsrN30hYp74sAFOZhTzi9Bz3Wxm/bE8VizNoHUke7m6NPeOXj5wByy6qZrOkyFWHww
	30qC3q5AZUggMTfBG+RnAyrOlt01Uc/59CT2p9+IrAhB4V/tHHSHql7GKyEQjovqwb1QHicBCL7
	Ykp44y7UPw==
X-Received: by 2002:a17:906:c147:b0:b8e:d162:2410 with SMTP id
 a640c23a62f3a-b90819d2abbmr885563466b.17.1771951513303; Tue, 24 Feb 2026
 08:45:13 -0800 (PST)
MIME-Version: 1.0
References: <20260222120910.318167-1-adrian.freihofer@siemens.com> <20260222120910.318167-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260222120910.318167-3-adrian.freihofer@siemens.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 24 Feb 2026 16:45:01 +0000
X-Gm-Features: AaiRm518KnEMkyqZJTVfc_fkkTZLj_z7pnPaM91e_OXVdjkrJYYt0LLse1P_954
Message-ID: <CANPvuRm+0t+YXXvREiQBTEwfcD0zoviANMXuAMex16aepuxDMA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] kernel.bbclass: remove dependency on
 initramfs when not bundled
To: adrian.freihofer@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000827ee6064b949cb5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 16:45:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231893

--000000000000827ee6064b949cb5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

This is a very nice improvement for those who build initramfs.

Thanks.

Jose

Adrian Freihofer via lists.openembedded.org <adrian.freihofer=3D
siemens.com@lists.openembedded.org> escreveu (domingo, 22/02/2026 =C3=A0(s)
12:09):

> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Previously, the kernel recipe depended on the initramfs image even when
> INITRAMFS_IMAGE_BUNDLE was not enabled. This caused the kernel to be
> rebuilt whenever the initramfs image changed, regardless of whether the
> kernel actually included the initramfs.
>
> The problematic chain was:
>   linux:do_deploy ->
>   linux:do_bundle_initramfs ->
>   image-initramfs:do_image_complete
>
> The original intent (acc. to the comment) was to ensure the initramfs
> image was available for tools like wic. However, apart from bundling the
> initramfs in the kernel, there is probably no reason why the kernel
> should depend on the initramfs. And it is therefore simply wrong if it
> does so anyway. Thus, use cases that may be broken by these change are
> based on a bug, not a feature. This needs to be fixed by adding a
> dependency on the initramfs in the right place, not in the kernel where
> this destroys the kernel's sstate-caching.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 77 ++++++++++++++----------------
>  1 file changed, 35 insertions(+), 42 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index f989b31c47..7a5ccb585a 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -149,16 +149,13 @@ set -e
>  """ % (type, type, type))
>
>
> -    image =3D d.getVar('INITRAMFS_IMAGE')
> -    # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is se=
t
> to 0,
> -    # the do_bundle_initramfs does nothing, but the INITRAMFS_IMAGE is
> built
> -    # standalone for use by wic and other tools.
> -    if image:
> +    if d.getVar('INITRAMFS_IMAGE') and
> bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
>          if d.getVar('INITRAMFS_MULTICONFIG'):
>              d.appendVarFlag('do_bundle_initramfs', 'mcdepends', '
> mc:${BB_CURRENT_MC}:${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_=
complete')
>          else:
>              d.appendVarFlag('do_bundle_initramfs', 'depends', '
> ${INITRAMFS_IMAGE}:do_image_complete')
> -    if image and bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE'))=
:
> +
> +        bb.build.addtask('do_bundle_initramfs', 'do_deploy',
> 'do_install', d)
>          bb.build.addtask('do_transform_bundled_initramfs', 'do_deploy',
> 'do_bundle_initramfs', d)
>
>      # NOTE: setting INITRAMFS_TASK is for backward compatibility
> @@ -305,39 +302,37 @@ copy_initramfs() {
>  }
>
>  do_bundle_initramfs () {
> -       if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" =
=3D
> x1 ]; then
> -               echo "Creating a kernel image with a bundled initramfs...=
"
> -               copy_initramfs
> -               # Backing up kernel image relies on its type(regular file
> or symbolic link)
> -               tmp_path=3D""
> -               for imageType in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
> -                       if [ -h ${KERNEL_OUTPUT_DIR}/$imageType ] ; then
> -                               linkpath=3D`readlink -n
> ${KERNEL_OUTPUT_DIR}/$imageType`
> -                               realpath=3D`readlink -fn
> ${KERNEL_OUTPUT_DIR}/$imageType`
> -                               mv -f $realpath $realpath.bak
> -                               tmp_path=3D$tmp_path"
> "$imageType"#"$linkpath"#"$realpath
> -                       elif [ -f ${KERNEL_OUTPUT_DIR}/$imageType ]; then
> -                               mv -f ${KERNEL_OUTPUT_DIR}/$imageType
> ${KERNEL_OUTPUT_DIR}/$imageType.bak
> -                               tmp_path=3D$tmp_path" "$imageType"##"
> -                       fi
> -               done
> -
>  use_alternate_initrd=3DCONFIG_INITRAMFS_SOURCE=3D${B}/usr/${INITRAMFS_IM=
AGE_NAME}.cpio
> -               kernel_do_compile
> -               # Restoring kernel image
> -               for tp in $tmp_path ; do
> -                       imageType=3D`echo $tp|cut -d "#" -f 1`
> -                       linkpath=3D`echo $tp|cut -d "#" -f 2`
> -                       realpath=3D`echo $tp|cut -d "#" -f 3`
> -                       if [ -n "$realpath" ]; then
> -                               mv -f $realpath $realpath.initramfs
> -                               mv -f $realpath.bak $realpath
> -                               ln -sf $linkpath.initramfs
> ${B}/${KERNEL_OUTPUT_DIR}/$imageType.initramfs
> -                       else
> -                               mv -f ${KERNEL_OUTPUT_DIR}/$imageType
> ${KERNEL_OUTPUT_DIR}/$imageType.initramfs
> -                               mv -f ${KERNEL_OUTPUT_DIR}/$imageType.bak
> ${KERNEL_OUTPUT_DIR}/$imageType
> -                       fi
> -               done
> -       fi
> +       echo "Creating a kernel image with a bundled initramfs..."
> +       copy_initramfs
> +       # Backing up kernel image relies on its type(regular file or
> symbolic link)
> +       tmp_path=3D""
> +       for imageType in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
> +               if [ -h ${KERNEL_OUTPUT_DIR}/$imageType ] ; then
> +                       linkpath=3D`readlink -n
> ${KERNEL_OUTPUT_DIR}/$imageType`
> +                       realpath=3D`readlink -fn
> ${KERNEL_OUTPUT_DIR}/$imageType`
> +                       mv -f $realpath $realpath.bak
> +                       tmp_path=3D$tmp_path"
> "$imageType"#"$linkpath"#"$realpath
> +               elif [ -f ${KERNEL_OUTPUT_DIR}/$imageType ]; then
> +                       mv -f ${KERNEL_OUTPUT_DIR}/$imageType
> ${KERNEL_OUTPUT_DIR}/$imageType.bak
> +                       tmp_path=3D$tmp_path" "$imageType"##"
> +               fi
> +       done
> +
>  use_alternate_initrd=3DCONFIG_INITRAMFS_SOURCE=3D${B}/usr/${INITRAMFS_IM=
AGE_NAME}.cpio
> +       kernel_do_compile
> +       # Restoring kernel image
> +       for tp in $tmp_path ; do
> +               imageType=3D`echo $tp|cut -d "#" -f 1`
> +               linkpath=3D`echo $tp|cut -d "#" -f 2`
> +               realpath=3D`echo $tp|cut -d "#" -f 3`
> +               if [ -n "$realpath" ]; then
> +                       mv -f $realpath $realpath.initramfs
> +                       mv -f $realpath.bak $realpath
> +                       ln -sf $linkpath.initramfs
> ${B}/${KERNEL_OUTPUT_DIR}/$imageType.initramfs
> +               else
> +                       mv -f ${KERNEL_OUTPUT_DIR}/$imageType
> ${KERNEL_OUTPUT_DIR}/$imageType.initramfs
> +                       mv -f ${KERNEL_OUTPUT_DIR}/$imageType.bak
> ${KERNEL_OUTPUT_DIR}/$imageType
> +               fi
> +       done
>  }
>  do_bundle_initramfs[dirs] =3D "${B}"
>
> @@ -357,8 +352,6 @@ python do_devshell:prepend () {
>      os.environ["LDFLAGS"] =3D ''
>  }
>
> -addtask bundle_initramfs after do_install before do_deploy
> -
>  KERNEL_DEBUG_TIMESTAMPS ??=3D "0"
>
>  kernel_do_compile() {
> @@ -860,7 +853,7 @@ kernel_do_deploy() {
>  # ensure we get the right values for both
>  do_deploy[prefuncs] +=3D "read_subpackage_metadata"
>
> -addtask deploy after do_populate_sysroot do_packagedata
> +addtask deploy after do_install do_populate_sysroot do_packagedata
>
>  EXPORT_FUNCTIONS do_deploy
>
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#231630):
> https://lists.openembedded.org/g/openembedded-core/message/231630
> Mute This Topic: https://lists.openembedded.org/mt/117939109/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000827ee6064b949cb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Adrian,<br><br>This is a very nice imp=
rovement=C2=A0for those who build initramfs.<br><br>Thanks.<br><br>Jose</di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">Adrian Freihofer via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;adrian.freihofer=3D<a href=3D"mailto:s=
iemens.com@lists.openembedded.org">siemens.com@lists.openembedded.org</a>&g=
t; escreveu (domingo, 22/02/2026 =C3=A0(s) 12:09):<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">From: Adrian Freihofer &lt;<a href=3D"ma=
ilto:adrian.freihofer@siemens.com" target=3D"_blank">adrian.freihofer@sieme=
ns.com</a>&gt;<br>
<br>
Previously, the kernel recipe depended on the initramfs image even when<br>
INITRAMFS_IMAGE_BUNDLE was not enabled. This caused the kernel to be<br>
rebuilt whenever the initramfs image changed, regardless of whether the<br>
kernel actually included the initramfs.<br>
<br>
The problematic chain was:<br>
=C2=A0 linux:do_deploy -&gt;<br>
=C2=A0 linux:do_bundle_initramfs -&gt;<br>
=C2=A0 image-initramfs:do_image_complete<br>
<br>
The original intent (acc. to the comment) was to ensure the initramfs<br>
image was available for tools like wic. However, apart from bundling the<br=
>
initramfs in the kernel, there is probably no reason why the kernel<br>
should depend on the initramfs. And it is therefore simply wrong if it<br>
does so anyway. Thus, use cases that may be broken by these change are<br>
based on a bug, not a feature. This needs to be fixed by adding a<br>
dependency on the initramfs in the right place, not in the kernel where<br>
this destroys the kernel&#39;s sstate-caching.<br>
<br>
Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@siem=
ens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 77 ++++++++++++++---------------=
-<br>
=C2=A01 file changed, 35 insertions(+), 42 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index f989b31c47..7a5ccb585a 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -149,16 +149,13 @@ set -e<br>
=C2=A0&quot;&quot;&quot; % (type, type, type))<br>
<br>
<br>
-=C2=A0 =C2=A0 image =3D d.getVar(&#39;INITRAMFS_IMAGE&#39;)<br>
-=C2=A0 =C2=A0 # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUND=
LE is set to 0,<br>
-=C2=A0 =C2=A0 # the do_bundle_initramfs does nothing, but the INITRAMFS_IM=
AGE is built<br>
-=C2=A0 =C2=A0 # standalone for use by wic and other tools.<br>
-=C2=A0 =C2=A0 if image:<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;INITRAMFS_IMAGE&#39;) and bb.utils.to_boole=
an(d.getVar(&#39;INITRAMFS_IMAGE_BUNDLE&#39;)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if d.getVar(&#39;INITRAMFS_MULTICONFIG&#3=
9;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_bun=
dle_initramfs&#39;, &#39;mcdepends&#39;, &#39; mc:${BB_CURRENT_MC}:${INITRA=
MFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_bun=
dle_initramfs&#39;, &#39;depends&#39;, &#39; ${INITRAMFS_IMAGE}:do_image_co=
mplete&#39;)<br>
-=C2=A0 =C2=A0 if image and bb.utils.to_boolean(d.getVar(&#39;INITRAMFS_IMA=
GE_BUNDLE&#39;)):<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&#39;do_bundle_initramfs&#39;=
, &#39;do_deploy&#39;, &#39;do_install&#39;, d)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.addtask(&#39;do_transform_bundle=
d_initramfs&#39;, &#39;do_deploy&#39;, &#39;do_bundle_initramfs&#39;, d)<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0# NOTE: setting INITRAMFS_TASK is for backward compatib=
ility<br>
@@ -305,39 +302,37 @@ copy_initramfs() {<br>
=C2=A0}<br>
<br>
=C2=A0do_bundle_initramfs () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -z &quot;${INITRAMFS_IMAGE}&quot; -a x&q=
uot;${INITRAMFS_IMAGE_BUNDLE}&quot; =3D x1 ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Creating=
 a kernel image with a bundled initramfs...&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0copy_initramfs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Backing up kernel=
 image relies on its type(regular file or symbolic link)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp_path=3D&quot;&q=
uot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for imageType in ${=
KERNEL_IMAGETYPE_FOR_MAKE} ; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ -h ${KERNEL_OUTPUT_DIR}/$imageType ] ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linkpath=3D`readlink -n ${KERNEL_OUTP=
UT_DIR}/$imageType`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0realpath=3D`readlink -fn ${KERNEL_OUT=
PUT_DIR}/$imageType`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f $realpath $realpath.bak<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp_path=3D$tmp_path&quot; &quot;$ima=
geType&quot;#&quot;$linkpath&quot;#&quot;$realpath<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0elif [ -f ${KERNEL_OUTPUT_DIR}/$imageType ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f ${KERNEL_OUTPUT_DIR}/$imageType=
 ${KERNEL_OUTPUT_DIR}/$imageType.bak<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp_path=3D$tmp_path&quot; &quot;$ima=
geType&quot;##&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0use_alternate_initr=
d=3DCONFIG_INITRAMFS_SOURCE=3D${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_do_compile<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Restoring kernel =
image<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for tp in $tmp_path=
 ; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0imageType=3D`echo $tp|cut -d &quot;#&quot; -f 1`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0linkpath=3D`echo $tp|cut -d &quot;#&quot; -f 2`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0realpath=3D`echo $tp|cut -d &quot;#&quot; -f 3`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ -n &quot;$realpath&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f $realpath $realpath.initramfs<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f $realpath.bak $realpath<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf $linkpath.initramfs ${B}/${KER=
NEL_OUTPUT_DIR}/$imageType.initramfs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f ${KERNEL_OUTPUT_DIR}/$imageType=
 ${KERNEL_OUTPUT_DIR}/$imageType.initramfs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f ${KERNEL_OUTPUT_DIR}/$imageType=
.bak ${KERNEL_OUTPUT_DIR}/$imageType<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Creating a kernel image with a bundl=
ed initramfs...&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0copy_initramfs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Backing up kernel image relies on its type(re=
gular file or symbolic link)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tmp_path=3D&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for imageType in ${KERNEL_IMAGETYPE_FOR_MAKE} ;=
 do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -h ${KERNEL_OU=
TPUT_DIR}/$imageType ] ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0linkpath=3D`readlink -n ${KERNEL_OUTPUT_DIR}/$imageType`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0realpath=3D`readlink -fn ${KERNEL_OUTPUT_DIR}/$imageType`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mv -f $realpath $realpath.bak<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tmp_path=3D$tmp_path&quot; &quot;$imageType&quot;#&quot;$linkpath=
&quot;#&quot;$realpath<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ -f ${KERNEL_=
OUTPUT_DIR}/$imageType ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mv -f ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$image=
Type.bak<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tmp_path=3D$tmp_path&quot; &quot;$imageType&quot;##&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0use_alternate_initrd=3DCONFIG_INITRAMFS_SOURCE=
=3D${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_do_compile<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Restoring kernel image<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for tp in $tmp_path ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0imageType=3D`echo $=
tp|cut -d &quot;#&quot; -f 1`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linkpath=3D`echo $t=
p|cut -d &quot;#&quot; -f 2`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0realpath=3D`echo $t=
p|cut -d &quot;#&quot; -f 3`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$real=
path&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mv -f $realpath $realpath.initramfs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mv -f $realpath.bak $realpath<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ln -sf $linkpath.initramfs ${B}/${KERNEL_OUTPUT_DIR}/$imageType.i=
nitramfs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mv -f ${KERNEL_OUTPUT_DIR}/$imageType ${KERNEL_OUTPUT_DIR}/$image=
Type.initramfs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mv -f ${KERNEL_OUTPUT_DIR}/$imageType.bak ${KERNEL_OUTPUT_DIR}/$i=
mageType<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0}<br>
=C2=A0do_bundle_initramfs[dirs] =3D &quot;${B}&quot;<br>
<br>
@@ -357,8 +352,6 @@ python do_devshell:prepend () {<br>
=C2=A0 =C2=A0 =C2=A0os.environ[&quot;LDFLAGS&quot;] =3D &#39;&#39;<br>
=C2=A0}<br>
<br>
-addtask bundle_initramfs after do_install before do_deploy<br>
-<br>
=C2=A0KERNEL_DEBUG_TIMESTAMPS ??=3D &quot;0&quot;<br>
<br>
=C2=A0kernel_do_compile() {<br>
@@ -860,7 +853,7 @@ kernel_do_deploy() {<br>
=C2=A0# ensure we get the right values for both<br>
=C2=A0do_deploy[prefuncs] +=3D &quot;read_subpackage_metadata&quot;<br>
<br>
-addtask deploy after do_populate_sysroot do_packagedata<br>
+addtask deploy after do_install do_populate_sysroot do_packagedata<br>
<br>
=C2=A0EXPORT_FUNCTIONS do_deploy<br>
<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#231630): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/231630" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/231630</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117939109/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117939109/5052612</a><br>
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

--000000000000827ee6064b949cb5--

