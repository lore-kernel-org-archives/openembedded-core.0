Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30830CCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 06:40:04 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.12163.1760942397748147943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Oct 2025 23:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U7e0hBQT;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47100eae3e5so36929315e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Oct 2025 23:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760942396; x=1761547196; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NKlK15GH8k1FoRhSs+A8Fh3ClnNy6U/AIJhT3pWolQQ=;
        b=U7e0hBQTlFsJlGX7r400ked23Z2XhReGv+5Q5ddCMuI50LYshRf5Y8Q0cwlnm9nbFD
         fAfFCL1y9bxhFkItX6a/0tjNuXcNVO5s+xia7m5OFHW6A8RU4CBG1U59WbIzl8aUwBJu
         hOPD39eMaAsB+EQa8gn6TQvkA6wcuqlyHlglKjMswxAcxpWYhCZPZA480vWw+rYr9UQx
         bI0/OsRpQRRil+IbZQDamqUqLvRpmvp4XVgSTp4lUv85003Joql1592waBo43FkwtNx6
         Vr+uVyacUWdwAqWQu5JtGYP2D7EuWpLiB4jHtF/EkXr9vYea4iqhrAqN8wikqDKs8ZIZ
         DlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760942396; x=1761547196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKlK15GH8k1FoRhSs+A8Fh3ClnNy6U/AIJhT3pWolQQ=;
        b=L2qBHH4DT4MfCIFIbGJsIKQ9yh1eAQoXl2FXSVWKguF92xJKOEDxE6PRolPtamuVoW
         XeMNbh7/j444MXFgk3I3UBMqLZBlExYt7ShzjXePAYPeM9SNcAeCVljVLz8W+aUZ+lEl
         QKghnpDdlTbQQQH5UFVX00+OoxMO+RG7sjVg+um9rEmK0nqrKJA0EhR091uvVGa4KE5K
         AkbQVyfaeKQPOIM21twWiLtz48RFRHhsmO+m0BNisZDp+15oH7Gxi8Ro99oOWxy6cwWV
         ZLLNL9zYXA5nY8SyWu+LkvHjNDTmrruqDAgbQAFGQFYc5e5rDLDqVgF3qNnG7JNzIATf
         9NZA==
X-Gm-Message-State: AOJu0Yyjr6MTt9llg4VxYAOVLAT9hvKMh3e1Q5JV7q7B2xbboSgRzMVj
	6DrzQCZ6Og0hKHn1KewvcYIFAtXwxxJAQPUwcMfCn/TWxN3fwlDmy4QD1u0HXsUrB66NXkfxtt4
	/kwWVqv/jGaQjXHZskFPrJ1FYu5Nq2t0=
X-Gm-Gg: ASbGncumaoUEOt5d5aRPY44YCunn+nvAW4RKCeT9pwulhIzWnKo6f8Qkfn36T573xfr
	7hff1FtrjfQLsgZEAHcuPD6pFXzBxKCJO1BcpBM4ataTVYh7AdOO1OHNSvFgjg8Scp0VDUwfKR2
	M16aG6/snvPH9cpUTv1IPC7d8Fo811OLpALsv4EWFwc+e+Q5FlpZUZowEcU3jpYeyS8K+5x3SZ8
	QaXOu/Cp1xonu7tiRPzPAyOGCRvG/p4To+b4JjSn8TNn0eSRGcCsyZbz1ir6DRBMV/EVWImHpCZ
	RlqHbh5b3L64+A==
X-Google-Smtp-Source: AGHT+IFDl2LbevJA3MVHvLajkptpW6cMPaCqD/8WhRBokCSvQTKOomaQnP13V4cRh09YxuMx4lWkneD9dvq8DyLRelA=
X-Received: by 2002:a05:6000:2586:b0:426:d81f:483c with SMTP id
 ffacd0b85a97d-42704daed1amr8498954f8f.33.1760942396025; Sun, 19 Oct 2025
 23:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251016135758.32738-1-reatmon@ti.com>
In-Reply-To: <20251016135758.32738-1-reatmon@ti.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
Date: Mon, 20 Oct 2025 08:39:44 +0200
X-Gm-Features: AS18NWCwOPT9bfqQdFQa4mWz06ShZCz_o9pJkpOx0lelTWR7bfKOh4-WPdQtXLo
Message-ID: <CAB3asfjtYEyO5MSjJx6DZ+5Z8SZ95DCmk_RLz48v=-utKy_W0A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel-fit-image: Split signing variables
To: reatmon@ti.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fc2de60641915946"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 06:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225097

--000000000000fc2de60641915946
Content-Type: text/plain; charset="UTF-8"

Am Do., 16. Okt. 2025 um 15:58 Uhr schrieb Ryan Eatmon via
lists.openembedded.org <reatmon=ti.com@lists.openembedded.org>:

> Right now all signing is done with a single variable: UBOOT_SIGN_ENABLE.
> This has the side effect of not allowing for signing the fitImage while
> not signing the uboot files.
>
> This patch creates three new variables specific to KERNEL_FITIMAGE and
> defaults them to the corresponding UBOOT variables.  That way all
> existing code will remain the same, but we can selectively control just
> signing the fitImage without also signing the uboot files.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta/classes-recipe/kernel-fit-image.bbclass | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-fit-image.bbclass
> b/meta/classes-recipe/kernel-fit-image.bbclass
> index f04aee1807..29f4098ccc 100644
> --- a/meta/classes-recipe/kernel-fit-image.bbclass
> +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> @@ -35,6 +35,10 @@ do_configure[noexec] = "1"
>  UBOOT_MKIMAGE_KERNEL_TYPE ?= "kernel"
>  KERNEL_IMAGEDEST ?= "/boot"
>
> +KERNEL_FITIMAGE_SIGN_ENABLE ?= "${UBOOT_SIGN_ENABLE}"
> +KERNEL_FITIMAGE_SIGN_KEYNAME ?= "${UBOOT_SIGN_KEYNAME}"
> +KERNEL_FITIMAGE_SIGN_KEYDIR ?= "${UBOOT_SIGN_KEYDIR}"
> +
>

This kind of introduces a new namespace KERNEL_FITIMAGE_.
However, there are already namespaces which we could re-use.
Would that be better?

FIT_KERNEL_SIGN_ENABLE ?= "${UBOOT_SIGN_ENABLE}"
FIT_KERNEL_SIGN_KEYNAME ?= "${UBOOT_SIGN_KEYNAME}"
FIT_KERNEL_SIGN_KEYDIR ?= "${UBOOT_SIGN_KEYDIR}"

It would also be interesting to understand your use case, because signing
the FIT
image usually requires a bootloader which can verify the signature at
run-time.
Your patch basically removes the deployment of the public key into
u-boot's DTB.
Do you use a different bootloader?

Regards
Adrian



>  python do_compile() {
>      import shutil
>      import oe.fitimage
> @@ -50,11 +54,11 @@ python do_compile() {
>      root_node = oe.fitimage.ItsNodeRootKernel(
>          d.getVar("FIT_DESC"), d.getVar("FIT_ADDRESS_CELLS"),
>          d.getVar('HOST_PREFIX'), d.getVar('UBOOT_ARCH'),
> d.getVar("FIT_CONF_PREFIX"),
> -        oe.types.boolean(d.getVar('UBOOT_SIGN_ENABLE')),
> d.getVar("UBOOT_SIGN_KEYDIR"),
> +        oe.types.boolean(d.getVar('KERNEL_FITIMAGE_SIGN_ENABLE')),
> d.getVar("KERNEL_FITIMAGE_SIGN_KEYDIR"),
>          d.getVar("UBOOT_MKIMAGE"), d.getVar("UBOOT_MKIMAGE_DTCOPTS"),
>          d.getVar("UBOOT_MKIMAGE_SIGN"),
> d.getVar("UBOOT_MKIMAGE_SIGN_ARGS"),
>          d.getVar('FIT_HASH_ALG'), d.getVar('FIT_SIGN_ALG'),
> d.getVar('FIT_PAD_ALG'),
> -        d.getVar('UBOOT_SIGN_KEYNAME'),
> +        d.getVar('KERNEL_FITIMAGE_SIGN_KEYNAME'),
>          oe.types.boolean(d.getVar('FIT_SIGN_INDIVIDUAL')),
> d.getVar('UBOOT_SIGN_IMG_KEYNAME')
>      )
>
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224965):
> https://lists.openembedded.org/g/openembedded-core/message/224965
> Mute This Topic: https://lists.openembedded.org/mt/115789309/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> adrian.freihofer@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000fc2de60641915946
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">Am Do., 16. Okt. 2025 um 15:58=C2=A0Uhr schri=
eb Ryan Eatmon via <a href=3D"http://lists.openembedded.org">lists.openembe=
dded.org</a> &lt;reatmon=3D<a href=3D"mailto:ti.com@lists.openembedded.org"=
>ti.com@lists.openembedded.org</a>&gt;:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Right now all signing is done with a single variabl=
e: UBOOT_SIGN_ENABLE.<br>
This has the side effect of not allowing for signing the fitImage while<br>
not signing the uboot files.<br>
<br>
This patch creates three new variables specific to KERNEL_FITIMAGE and<br>
defaults them to the corresponding UBOOT variables.=C2=A0 That way all<br>
existing code will remain the same, but we can selectively control just<br>
signing the fitImage without also signing the uboot files.<br>
<br>
Signed-off-by: Ryan Eatmon &lt;<a href=3D"mailto:reatmon@ti.com" target=3D"=
_blank">reatmon@ti.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel-fit-image.bbclass | 8 ++++++--<br>
=C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-re=
cipe/kernel-fit-image.bbclass<br>
index f04aee1807..29f4098ccc 100644<br>
--- a/meta/classes-recipe/kernel-fit-image.bbclass<br>
+++ b/meta/classes-recipe/kernel-fit-image.bbclass<br>
@@ -35,6 +35,10 @@ do_configure[noexec] =3D &quot;1&quot;<br>
=C2=A0UBOOT_MKIMAGE_KERNEL_TYPE ?=3D &quot;kernel&quot;<br>
=C2=A0KERNEL_IMAGEDEST ?=3D &quot;/boot&quot;<br>
<br>
+KERNEL_FITIMAGE_SIGN_ENABLE ?=3D &quot;${UBOOT_SIGN_ENABLE}&quot;<br>
+KERNEL_FITIMAGE_SIGN_KEYNAME ?=3D &quot;${UBOOT_SIGN_KEYNAME}&quot;<br>
+KERNEL_FITIMAGE_SIGN_KEYDIR ?=3D &quot;${UBOOT_SIGN_KEYDIR}&quot;<br>
+<br></blockquote><div><br></div><div>This kind of introduces a new namespa=
ce=C2=A0KERNEL_FITIMAGE_.</div><div>However, there are already namespaces w=
hich we could re-use.</div><div>Would that be better?</div><div><br></div><=
div>FIT_KERNEL_SIGN_ENABLE ?=3D &quot;${UBOOT_SIGN_ENABLE}&quot;<br>FIT_KER=
NEL_SIGN_KEYNAME ?=3D &quot;${UBOOT_SIGN_KEYNAME}&quot;<br>FIT_KERNEL_SIGN_=
KEYDIR ?=3D &quot;${UBOOT_SIGN_KEYDIR}&quot;</div><div><br></div><div>It wo=
uld also be interesting to understand your use case, because signing the FI=
T</div><div>image usually requires a bootloader which can verify the signat=
ure at run-time.</div><div>Your patch basically removes the deployment of t=
he public key into u-boot&#39;s=C2=A0DTB.</div><div>Do you use a different =
bootloader?</div><div></div><div><br></div><div>Regards</div><div>Adrian</d=
iv><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
=C2=A0python do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0import shutil<br>
=C2=A0 =C2=A0 =C2=A0import oe.fitimage<br>
@@ -50,11 +54,11 @@ python do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0root_node =3D oe.fitimage.ItsNodeRootKernel(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.getVar(&quot;FIT_DESC&quot;), d.getVar(=
&quot;FIT_ADDRESS_CELLS&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.getVar(&#39;HOST_PREFIX&#39;), d.getVar=
(&#39;UBOOT_ARCH&#39;),=C2=A0 d.getVar(&quot;FIT_CONF_PREFIX&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.types.boolean(d.getVar(&#39;UBOOT_SIGN_ENAB=
LE&#39;)), d.getVar(&quot;UBOOT_SIGN_KEYDIR&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.types.boolean(d.getVar(&#39;KERNEL_FITIMAGE=
_SIGN_ENABLE&#39;)), d.getVar(&quot;KERNEL_FITIMAGE_SIGN_KEYDIR&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.getVar(&quot;UBOOT_MKIMAGE&quot;), d.ge=
tVar(&quot;UBOOT_MKIMAGE_DTCOPTS&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.getVar(&quot;UBOOT_MKIMAGE_SIGN&quot;),=
 d.getVar(&quot;UBOOT_MKIMAGE_SIGN_ARGS&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.getVar(&#39;FIT_HASH_ALG&#39;), d.getVa=
r(&#39;FIT_SIGN_ALG&#39;), d.getVar(&#39;FIT_PAD_ALG&#39;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(&#39;UBOOT_SIGN_KEYNAME&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(&#39;KERNEL_FITIMAGE_SIGN_KEYNAME&#39=
;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe.types.boolean(d.getVar(&#39;FIT_SIGN_I=
NDIVIDUAL&#39;)), d.getVar(&#39;UBOOT_SIGN_IMG_KEYNAME&#39;)<br>
=C2=A0 =C2=A0 =C2=A0)<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#224965): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/224965" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/224965</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115789309/445=
4582" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115789309/4454582</a><br>
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

--000000000000fc2de60641915946--

