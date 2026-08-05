Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B0A5C55838
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 01:09:20 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30841.1785892158162864949
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 18:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Sd6yjLyM;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6688dfaed31so596567d50.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 18:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785892157; cv=none;
        d=google.com; s=arc-20260327;
        b=Y9aqVUeI2m8f2U6Snib5rWsqL+udATT+6Lzwvh9JBTulK5xt4AxWRpIjZxsc+My24G
         PcEQEexHS1iTz+/TWTjRkOP1vuC22o5SX0UQk+ixXQ1AVoMnYSke3FgcbXEVtfATISJs
         ByGG5uRVwr973SbpMQTCh4wnUGfvjSIh0fUuchJSxbzr0UUOd3BSdCBFqcdVnxVWdD4L
         D4XuU9w0LMpeourkGL3A7scveKbqEYXgHorRNO/NJK7R9D0lTnJopTm4vqKf1PKf8bsj
         sHiuYirBWbeSfHspRNd3z6YL6JQ7ulhY9godKVjedT1PMVKrnBKYMThZo2t9bgo2Qu+g
         VHIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RrjLkPHVR8NitLjtnuFyRbeYI8pSNCdEu3L+EccPj2Y=;
        fh=Ab5QchtAs08eZNSFiBl6MfJNprT6k/vVQ8w3IX57Q1U=;
        b=NQ7QdMSq0Sf3SbdX15HleyLU9zX0MTQdy+EKK58i/FWyA4P3+xTXzjb83gpJ9R5N6C
         k/xCXzO8sdqOrA2UBomq+6dj4vAfC9nBLNc92PhfmJI8jjV0+3RYgts9S7W14xZp4r1B
         cpPlL13uuU//w7N0yuttY/qwSnxd83qQpBl6SJuxRaMAAr49L0ZU4vkoS4hyrgoDohhl
         dXf2tlycBA2LzpMJd+BSEkCJSRH6ohj5PZyF1ld3gGyuBcDDoiHufMcsGcLlTHEztx8q
         v0tw4UWL8yVRtjrKg/wNr4QFvbfKnYVeHY0TcTiQ4RsuNd9EIJCKmGP+e28uz7VfUhQC
         QgOA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785892157; x=1786496957; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RrjLkPHVR8NitLjtnuFyRbeYI8pSNCdEu3L+EccPj2Y=;
        b=Sd6yjLyMM3+jqzx5by7dLlaXts4bq46lI0kmWCme+v38rMVb+a5YMYys61x0OAo50g
         5nhaXsa7CB7tvt0PfmXN6ylZv9jxPHQpDtX+THJ8tDNaHrvdhNQluE7cf9HrkSRM3FWE
         IakzMxlfR6PGkdBb3kRG32Uag6hH+OPH5F1CUZT0na4s4iHzXtsOzKx2ybtC4Oeu4AfY
         OUrjFx4gNKc6fG49RLcCDiQ7DuqFAbngJhV2M38q8EfULGeSuC0DRRm8MsChI7VcZ1GV
         Vvg6L3gYSVI9KF/mN4Q6IQo41mUrfA3OiXyOS1bWgj5bbtKU32bfodMeIOSGAnuFpakq
         gp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785892157; x=1786496957;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RrjLkPHVR8NitLjtnuFyRbeYI8pSNCdEu3L+EccPj2Y=;
        b=SurrLbK+BfGDO5czT55OWAh1Bv9x8bTHAhwnLxzPacSEvJlUl4ZaKNm7Xd45egtGVh
         XOO3xCloCuoSzt8P9uV14oiDY6dnNlDrjnPFO0LVweoqRoyJ+1/My68hgOkPCYY7AB1i
         HRizCIqqSYzB/u/5IMOn7GprRheY/5KaRV8BkGhgeLV1r/LmWWm824GV+d4D66DaNiqy
         bbUJOugcphLZApiOadrCi8MV4RMefjD47vMInHitVmUX3Z5F23E2mBR4/PXj/ydi3fHj
         Q70IDvO2nzhV/MVeet7xw4IJkLCS/jBreBiXTxO2TR40VuSE8IiP1UHg4fOtiU+uxxZp
         uIEg==
X-Gm-Message-State: AOJu0YynRGZav8nY84+AY1kch4GyTFFUQVBdu7ENtZKceUEIT/A02fxh
	9Hie8mM4+vkdF8oTtZcuxZUjyceEWcFfEvCWYtCgk3uzrhe10ljtv7ZtkkmnlqCagM9SruuFt4S
	GfWMy3wSmdbUHSWR2TQ/xYTtq0iErFx8=
X-Gm-Gg: AR+sD13VA67LMotuy+TQMdTukpl8VbJ2STEf2FkgDrA/aXFroW7BmH58jqfs7PSTlMx
	lan04ZNnIa76JTIz6nFWD0DmC5bIyzPXRtrOLnW0d1Pa6L10zFpBVoLrH8D87oHwkY87UxNPibE
	d2lIGfOoRCzOOrI9z4wsPjoIpgAOum1n2tHYwB8z1EdBil+2Ncgl3YqqwmtjWz3sPVLEeVtGTNL
	MvZJr6pOsUSytXYYv1zmVq1jtZsmzv9BGV969G+E9QZ/yTqhc9BG+ABKQUoYX4V6NExBTS94m3s
	QJT7dPrS4QbkmdCS4PpAjM0kndaHNE7p1M0jhzWKB6eGUI63U0QO9wmfVb3XwJLG/eahKt0Ejh5
	WQSVa+2fRgJHOYFVI4D5XmQeNb3+J6R7vWh0yiUuVhLdOeQaNTV5zhdkGZ39oeiY16Z3DKsMsdO
	XoRamhJSawriUrzqTdZgr2kg3vFi5u4UpLxTM3P/WbpE/g
X-Received: by 2002:a05:690e:43c3:b0:669:48b0:326c with SMTP id
 956f58d0204a3-6699abdc22amr1542613d50.36.1785892157089; Tue, 04 Aug 2026
 18:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260804114134.4028175-1-ross.burton@arm.com>
In-Reply-To: <20260804114134.4028175-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Aug 2026 18:08:52 -0700
X-Gm-Features: AUfX_myXWaw6whgm-edT7D6vo-PYQ18ByOz1xcMsjFPodYp72XhU6eKS3axZgjU
Message-ID: <CAMKF1spL4wUZ_ufSy4Z468nUQYyfXnx2H+bqvKixVk3-KHv=pg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: always use GCC to build
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a16b7c0658426bce"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 01:09:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242809

--000000000000a16b7c0658426bce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 4:41=E2=80=AFAM Ross Burton via lists.openembedded.o=
rg
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> Previously, u-boot was almost always built with GCC because the
> kernel-arch inherit set TOOLCHAIN to KERNEL_TOOLCHAIN, which defaulted
> to 'gcc'.
>
> However, since kernel-arch inherit was removed, u-boot in theory now
> respects the default toolchain. In practise, the recipe hard-codes CC
> to be gcc, and there are known caveats building u-boot with clang[2].
>

None of these caveats are relevant to u-boot and clang versions we use
isn't it?
so it seems to be workaround for some issue that is now brought forth which
was
latent before ? if so, why not fix that


>
> In the long term we should be able to make this recipe respect TOOLCHAIN,
> as the upstream u-boot CI does build and test with clang, but for now
> fix the build by restoring the explicit use of gcc.
>
> [1] oe-core 8fb5470841b ("u-boot: Separate out from kernel-arch.bbclass")
> [2] https://docs.u-boot-project.org/en/latest/build/clang.html
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
> b/meta/recipes-bsp/u-boot/u-boot.inc
> index 3e2f5aa1a5f..00a12f1bb91 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -3,6 +3,10 @@ PROVIDES =3D "virtual/bootloader"
>
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>
> +# u-boot is best built with gcc
> +# https://docs.u-boot-project.org/en/latest/build/clang.html
> +TOOLCHAIN =3D "gcc"
> +
>  DEPENDS +=3D "${@bb.utils.contains('UBOOT_ENV_SUFFIX', 'scr',
> 'u-boot-mkimage-native', '', d)}"
>  DEPENDS +=3D "${@ 'u-boot-mkenvimage-native' if
> bb.utils.to_boolean(d.getVar('UBOOT_INITIAL_ENV_BINARY')) else ''}"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#242718):
> https://lists.openembedded.org/g/openembedded-core/message/242718
> Mute This Topic: https://lists.openembedded.org/mt/120591917/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a16b7c0658426bce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 4, =
2026 at 4:41=E2=80=AFAM Ross Burton via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.c=
om@lists.openembedded.org">arm.com@lists.openembedded.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Previously, u-boot=
 was almost always built with GCC because the<br>
kernel-arch inherit set TOOLCHAIN to KERNEL_TOOLCHAIN, which defaulted<br>
to &#39;gcc&#39;.<br>
<br>
However, since kernel-arch inherit was removed, u-boot in theory now<br>
respects the default toolchain. In practise, the recipe hard-codes CC<br>
to be gcc, and there are known caveats building u-boot with clang[2].<br></=
blockquote><div><br></div><div>None of these caveats are relevant to u-boot=
 and clang=C2=A0versions we use isn&#39;t it?</div><div>so it seems to be w=
orkaround for some issue that is now brought forth which was</div><div>late=
nt before=C2=A0? if so, why not fix that</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
In the long term we should be able to make this recipe respect TOOLCHAIN,<b=
r>
as the upstream u-boot CI does build and test with clang, but for now<br>
fix the build by restoring the explicit use of gcc.<br>
<br>
[1] oe-core 8fb5470841b (&quot;u-boot: Separate out from kernel-arch.bbclas=
s&quot;)<br>
[2] <a href=3D"https://docs.u-boot-project.org/en/latest/build/clang.html" =
rel=3D"noreferrer" target=3D"_blank">https://docs.u-boot-project.org/en/lat=
est/build/clang.html</a><br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-bsp/u-boot/u-boot.inc | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc<br>
index 3e2f5aa1a5f..00a12f1bb91 100644<br>
--- a/meta/recipes-bsp/u-boot/u-boot.inc<br>
+++ b/meta/recipes-bsp/u-boot/u-boot.inc<br>
@@ -3,6 +3,10 @@ PROVIDES =3D &quot;virtual/bootloader&quot;<br>
<br>
=C2=A0PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
<br>
+# u-boot is best built with gcc<br>
+# <a href=3D"https://docs.u-boot-project.org/en/latest/build/clang.html" r=
el=3D"noreferrer" target=3D"_blank">https://docs.u-boot-project.org/en/late=
st/build/clang.html</a><br>
+TOOLCHAIN =3D &quot;gcc&quot;<br>
+<br>
=C2=A0DEPENDS +=3D &quot;${@bb.utils.contains(&#39;UBOOT_ENV_SUFFIX&#39;, &=
#39;scr&#39;, &#39;u-boot-mkimage-native&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0DEPENDS +=3D &quot;${@ &#39;u-boot-mkenvimage-native&#39; if bb.utils=
.to_boolean(d.getVar(&#39;UBOOT_INITIAL_ENV_BINARY&#39;)) else &#39;&#39;}&=
quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#242718): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/242718" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/242718</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120591917/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120591917/1997914</a><br>
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

--000000000000a16b7c0658426bce--

