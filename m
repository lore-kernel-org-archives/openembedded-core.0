Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 945B76011C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 07:27:28 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f188so29417149wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 23:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HPENBDiL/kEFwlxJ5K75R0vc+TQrUzOw6Vi1ecp2P+0=;
	b=uYq6aYRc7sBRM/0zXJx4yIXjQmtA091uUr3jw61p0BGr3C5G2M659HDOCqo2OOwATm
	hC8gu41WDaqzoyX7Giu1HxT6HC7zaQd7VpHRbxuOdLBl3BVw3sEBXjI0Nu0TQXlJYERa
	bgt0xcsbRx6yWyDNHHG3452FHltLDtDoLU1bA5dTvlVQAdgcTG2Ay7nmv5mNh90IVBVv
	ufpg8qGva71mpEDQwTd7bppscdTSU6eGefCeNQcmGkWbRADD7a/PmPif8sH6b2Ivg4Yl
	mQThTONPozIore5MEVRs+5ze/dyAMQOcXF5rzgKM9wiv939oT8FcS1MQArMOq0ftAIEe
	yJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HPENBDiL/kEFwlxJ5K75R0vc+TQrUzOw6Vi1ecp2P+0=;
	b=NeNzcJY2yxBdPzgdtxLRlavQNeh01eyB/EYbGhOVd3ztD5IzxfKSXeLF22nLXQyN0W
	qaMOZdq83UMmuhZaol7DpkP0wikyEb4JLcT4lmaB21XodytwRH0LSfD6s0QGdV+1T7xn
	yc76drYfCRnWo/gJZcfmpzk9HHodKDf8m0ReWFAY3o6Nfunxdp0BOK75wL3yqHXPetAo
	xNekZhz1BnMMMBn+IcLecDJ2LylFHAu/yu7Gc+cEwB7PdkQTftobbZvSdwyTy2Kq9nej
	pHd9cTy9bzrC0DQTscrFl67lKtdTX3Nf5k8ag+Dbl4Mt3Im4brqlDLqsq3QjFsuNXgke
	HusQ==
X-Gm-Message-State: AJcUukcc3nbXQkfS4rdpuklGIRh81jgdzNOxDcmdaZ1+KDbW8VCNyVd6
	x1dlD2YMfBTI11WISJ/J0kRtvUOYH08fI0XWPLs=
X-Google-Smtp-Source: AFSGD/UpzkNYPj9xj8oKAvGoMiBxMgG1AxPIbNKrZMmdJtfnRr3e3POhVpzR3Jrm8vkn2FxGgaFfSeTxF64O5ejkTTY=
X-Received: by 2002:a1c:af08:: with SMTP id y8mr34925286wme.94.1546500449226; 
	Wed, 02 Jan 2019 23:27:29 -0800 (PST)
MIME-Version: 1.0
References: <20190103071008.5065-1-raj.khem@gmail.com>
In-Reply-To: <20190103071008.5065-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 3 Jan 2019 08:27:18 +0100
Message-ID: <CA+chaQdzAnqqXEmzbwS_3Mayq_9vZ1nQMFvQ1_xhWkD4WiUaag@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] feature-arm-thumb.inc: Do not tie generating thumb ISA to -march
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
X-List-Received-Date: Thu, 03 Jan 2019 07:27:28 -0000
Content-Type: multipart/alternative; boundary="000000000000ebd4f7057e88b1ca"

--000000000000ebd4f7057e88b1ca
Content-Type: text/plain; charset="UTF-8"

I think this will include it not only in -march parameter but also in
TUNE_PKGARCH.
So the packages built with and without thumb ISA will have the same file
name and package feed which is wrong.

It should probably be fixed only when adding march to TUNE_CCARGS:
meta/conf/machine/include/arm/arch-armv4.inc:TUNE_CCARGS .=
"${@bb.utils.contains('TUNE_FEATURES', 'armv4', '
-march=armv4${ARMPKGSFX_THUMB}', '', d)}"
meta/conf/machine/include/arm/arch-armv5.inc:TUNE_CCARGS .=
"${@bb.utils.contains('TUNE_FEATURES', 'armv5', '
-march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}', '', d)}"
meta/conf/machine/include/arm/arch-armv6.inc:TUNE_CCARGS .=
"${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=armv6', '', d)}"
meta/conf/machine/include/arm/arch-armv7a.inc:TUNE_CCARGS .=
"${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=armv7-a', '', d)}"
meta/conf/machine/include/arm/arch-armv7ve.inc:TUNE_CCARGS .=
"${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -march=armv7ve', '',
d)}"


On Thu, Jan 3, 2019 at 8:10 AM Khem Raj <raj.khem@gmail.com> wrote:

> -march=armv5't'e means that CPU can execute thumb ISA, we do not need to
> tie this to exclusively generating thumb ISA, this change means that
> when we have thumb in tune features then it can use 't' in -march
> options irrespective of ISA being thumb or arm.
>
> This fixes derivative of armv5 tunes and paves way for gcc9 where e.g.
> armv5e is dropped and minimum arch supported is armv5te
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/machine/include/arm/feature-arm-thumb.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> index 0b47ccad02..36bda6c67a 100644
> --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> @@ -24,7 +24,7 @@ python () {
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '
> -m${ARM_M_OPT}', '', d)}"
>
>  # Add suffix from ARM_THUMB_SUFFIX only if after all this we still set
> ARM_M_OPT to thumb
> -ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb',
> '${ARM_THUMB_SUFFIX}', '', d) if d.getVar('ARM_M_OPT') == 'thumb' else ''}"
> +ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb',
> '${ARM_THUMB_SUFFIX}', '', d)}"
>
>  # what about armv7m devices which don't support -marm (e.g. Cortex-M3)?
>  TARGET_CC_KERNEL_ARCH += "${@bb.utils.contains('TUNE_FEATURES', 'thumb',
> '-mno-thumb-interwork -marm', '', d)}"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000ebd4f7057e88b1ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">I think this will includ=
e it not only in -march parameter but also in TUNE_PKGARCH.</div><div dir=
=3D"ltr">So the packages built with and without thumb ISA will have the sam=
e file name and package feed which is wrong.</div><div dir=3D"ltr"><br></di=
v><div>It should probably be fixed only when adding march to TUNE_CCARGS:</=
div><div><div>meta/conf/machine/include/arm/arch-armv4.inc:TUNE_CCARGS .=3D=
 &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;armv4&#39;, &#39;=
 -march=3Darmv4${ARMPKGSFX_THUMB}&#39;, &#39;&#39;, d)}&quot;</div><div>met=
a/conf/machine/include/arm/arch-armv5.inc:TUNE_CCARGS .=3D &quot;${@bb.util=
s.contains(&#39;TUNE_FEATURES&#39;, &#39;armv5&#39;, &#39; -march=3Darmv5${=
ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}&#39;, &#39;&#39;, d)}&quot;</div><div>meta=
/conf/machine/include/arm/arch-armv6.inc:TUNE_CCARGS .=3D &quot;${@bb.utils=
.contains(&#39;TUNE_FEATURES&#39;, &#39;armv6&#39;, &#39; -march=3Darmv6&#3=
9;, &#39;&#39;, d)}&quot;</div><div>meta/conf/machine/include/arm/arch-armv=
7a.inc:TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;,=
 &#39;armv7a&#39;, &#39; -march=3Darmv7-a&#39;, &#39;&#39;, d)}&quot;</div>=
<div>meta/conf/machine/include/arm/arch-armv7ve.inc:TUNE_CCARGS .=3D &quot;=
${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;armv7ve&#39;, &#39; -mar=
ch=3Darmv7ve&#39;, &#39;&#39;, d)}&quot;</div></div><div><br></div></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Jan 3, 2019 at =
8:10 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">-march=3Darmv5&#39;t&#39;e means that CPU can execute thumb ISA, we do no=
t need to<br>
tie this to exclusively generating thumb ISA, this change means that<br>
when we have thumb in tune features then it can use &#39;t&#39; in -march<b=
r>
options irrespective of ISA being thumb or arm.<br>
<br>
This fixes derivative of armv5 tunes and paves way for gcc9 where e.g.<br>
armv5e is dropped and minimum arch supported is armv5te<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/arm/feature-arm-thumb.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/con=
f/machine/include/arm/feature-arm-thumb.inc<br>
index 0b47ccad02..36bda6c67a 100644<br>
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc<br>
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc<br>
@@ -24,7 +24,7 @@ python () {<br>
=C2=A0TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, =
&#39;thumb&#39;, &#39; -m${ARM_M_OPT}&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=C2=A0# Add suffix from ARM_THUMB_SUFFIX only if after all this we still se=
t ARM_M_OPT to thumb<br>
-ARMPKGSFX_THUMB .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &=
#39;thumb&#39;, &#39;${ARM_THUMB_SUFFIX}&#39;, &#39;&#39;, d) if d.getVar(&=
#39;ARM_M_OPT&#39;) =3D=3D &#39;thumb&#39; else &#39;&#39;}&quot;<br>
+ARMPKGSFX_THUMB .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &=
#39;thumb&#39;, &#39;${ARM_THUMB_SUFFIX}&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=C2=A0# what about armv7m devices which don&#39;t support -marm (e.g. Corte=
x-M3)?<br>
=C2=A0TARGET_CC_KERNEL_ARCH +=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATU=
RES&#39;, &#39;thumb&#39;, &#39;-mno-thumb-interwork -marm&#39;, &#39;&#39;=
, d)}&quot;<br>
-- <br>
2.20.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000ebd4f7057e88b1ca--
