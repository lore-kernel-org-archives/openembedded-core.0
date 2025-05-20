Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1EBC3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 16:29:23 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.25518.1747758556597056771
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 09:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=GG8r/QS/;
 spf=pass (domain: snapchat.com, ip: 209.85.218.53, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad53cd163d9so708419066b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 09:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1747758555; x=1748363355; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N5wLHEqcGBwK80meCr96BSl8nKR/l/pfRtK6Y4nE1zU=;
        b=GG8r/QS/XnJCHCmT3IrrOwhnWX5qyGsQ78KdS9qs8nI3Qgt0XO2HgaVa0i2k0/SprZ
         xnah8oruPLPWHeLLJD2waxddeQ9qKWDIGPcGydUUH4us3iUJ7Guds4utpzIJ+y0nIwTt
         pmqq1IqoHoIv2f/EqIm+fpAx+i4zEXIUPm0SQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747758555; x=1748363355;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5wLHEqcGBwK80meCr96BSl8nKR/l/pfRtK6Y4nE1zU=;
        b=hM43MmWa8K6tse266zLU+IbLTB838YYurqtzh/6kSxixtTEktucYf2DKw6GTq8K0p3
         9DGwXlvHd9FDHxmNlx5mQ9qJV/QxCYa682ifRO7P+n6v8Un4fSD1cScrC79S7o2er9w+
         cjLiF929RJr7PqaABGsDP7vnIG+dS4vNhATbTCwOL8QC7vTTB+A+eop1z0WYcyG7zMdt
         TIdjIoLS+Yz4M1EVlH+klQ43c0EJYUiTJYP0ieRCmNGyNX5dt9qOkDgUOrfqFezx3mRT
         KRy+k16n91yZJW1IQuNRiwSSY70/v0XomQFac0M+sJssQ7cfmykTMM1C5yybrABOE7Q/
         aSYw==
X-Gm-Message-State: AOJu0YwfJdX3XjyzZcF5tujeO4g0J7HorMTAzhXpQlqoo8RbHw1zOzZ5
	Pmla5vIU4T0a1129kLjLWQg7iTVDN/2N94OCcGa28s2vESEbjalFaWZfn5VuAqyXP5UzzX/PQnZ
	vQebm+flKBFJEOu/AwWetbbIBEaDwo9J+MtJrZfWLAA==
X-Gm-Gg: ASbGncvk/oUcF61P7M7X15dLALK2gwPWVxn6ozDfgYWoEyNDhwsSQLwPtfYjN/32PPi
	wKdmTEGtZwpfupLcT/NO7eZWMTZSCnQRdw4xGWI1/1m01WayGG4NmV8tl3Fhcm6Vq1GpEO6k4H8
	qKhMKcM14moCveRSrERSlrhB+t82DbWlrKdw==
X-Google-Smtp-Source: AGHT+IFiN+DZSbQu5QVzEr4I4D/KPfUYbw4wAgYkuFqYsW9E5qI0ig/wvg0jnRTlwstZkDVxlMp6QTaro093QI9cXZc=
X-Received: by 2002:a17:907:3da5:b0:ad5:8182:de9c with SMTP id
 a640c23a62f3a-ad58182e07amr571485766b.38.1747758554774; Tue, 20 May 2025
 09:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250110180331.2537602-1-ross.burton@arm.com>
In-Reply-To: <20250110180331.2537602-1-ross.burton@arm.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Tue, 20 May 2025 18:29:04 +0200
X-Gm-Features: AX0GCFvmef0ur1u5LoO0cb0yqScR4b1Ak9u8DDKb9zdzDpOjzywaW9FTq-QJRRY
Message-ID: <CAHUKmYZF_V2gensPG_NvEFeF71C81_vdAKxTMUx474Wqtvj8Ww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/4] classes/nativesdk: also override TUNE_PKGARCH
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cfa366063593bfbf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 16:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216925

--000000000000cfa366063593bfbf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
I was using TUNE_PKGARCH to retrieve the architecture of the final embedded
target, in a nativesdk recipe which only creates a cmake file pointing to
the right sysroot path (cmake toolchain file). This obviously stopped
working with this patch, however I'm not sure what the clean way to fix
this is.

Do I understand correctly that any recipe which needs to be aware of the
actual target architecture should inherit cross-canadian.bbclass instead
of nativesdk.bbclass? Or should I add something like
"TARGET_ACTUAL_PKGARCH" to nativesdk.bbclass?

Thanks,
=C3=89tienne

On Fri, Jan 10, 2025 at 7:06=E2=80=AFPM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> The nativesdk class overrides PACKAGE_ARCH and unsets TUNE_FEATURES, but
> as recipes might want to look at TUNE_PKGARCH too (for example, when
> setting QEMU_EXTRAOPTIONS) we should also override that variable.
>
> Otherwise, a nativesdk recipe will have the TUNE_PKGARCH of the target,
> which leads to errors (eg passing mips arguments to an arm qemu).
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes-recipe/nativesdk.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes-recipe/nativesdk.bbclass
> b/meta/classes-recipe/nativesdk.bbclass
> index b0634de5829..4e57349aa08 100644
> --- a/meta/classes-recipe/nativesdk.bbclass
> +++ b/meta/classes-recipe/nativesdk.bbclass
> @@ -32,6 +32,7 @@ RECIPE_SYSROOT =3D "${WORKDIR}/recipe-sysroot"
>  #
>  PACKAGE_ARCH =3D "${SDK_ARCH}-${SDKPKGSUFFIX}"
>  PACKAGE_ARCHS =3D "${SDK_PACKAGE_ARCHS}"
> +TUNE_PKGARCH =3D "${SDK_ARCH}"
>
>  #
>  # We need chrpath >=3D 0.14 to ensure we can deal with 32 and 64 bit
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209660):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_209660&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DWUka6gPzHbL9TE5ZAoD4BQvCgcMYKkOu1IrPrjksrmUBAk0vuk3BpV1t8oaEwTyf&s=3DTPt=
FgHj79RNEq6iL3Uxa01OjFr0K74vmPh3nxxZZQZY&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_110539749_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DWUka6gPzHbL9T=
E5ZAoD4BQvCgcMYKkOu1IrPrjksrmUBAk0vuk3BpV1t8oaEwTyf&s=3DmifiNwos_7bKHeewrpc=
qyuofX-FvX7RPlxDhY5ySxfE&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DWUka6g=
PzHbL9TE5ZAoD4BQvCgcMYKkOu1IrPrjksrmUBAk0vuk3BpV1t8oaEwTyf&s=3DUJRePpE8mfPK=
pZE3UsDr_Y1qxcxp6nZVq7rHvR5YqXc&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cfa366063593bfbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br>I was using TUNE_PKGARCH to retrieve the architectu=
re of the final embedded target, in a nativesdk recipe which only creates a=
 cmake file pointing to the right sysroot path (cmake toolchain file). This=
 obviously stopped working with=C2=A0this patch, however I&#39;m not sure w=
hat the clean way to fix this is.<br><br>Do I understand correctly that any=
 recipe which needs to be aware of the actual target architecture should in=
herit cross-canadian.bbclass instead of=C2=A0nativesdk.bbclass? Or should I=
 add something like &quot;TARGET_ACTUAL_PKGARCH&quot; to nativesdk.bbclass?=
<br><br>Thanks,<br>=C3=89tienne</div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 10, 2025 a=
t 7:06=E2=80=AFPM Ross Burton via <a href=3D"http://lists.openembedded.org"=
>lists.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lis=
ts.openembedded.org">arm.com@lists.openembedded.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">The nativesdk class over=
rides PACKAGE_ARCH and unsets TUNE_FEATURES, but<br>
as recipes might want to look at TUNE_PKGARCH too (for example, when<br>
setting QEMU_EXTRAOPTIONS) we should also override that variable.<br>
<br>
Otherwise, a nativesdk recipe will have the TUNE_PKGARCH of the target,<br>
which leads to errors (eg passing mips arguments to an arm qemu).<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/nativesdk.bbclass | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/na=
tivesdk.bbclass<br>
index b0634de5829..4e57349aa08 100644<br>
--- a/meta/classes-recipe/nativesdk.bbclass<br>
+++ b/meta/classes-recipe/nativesdk.bbclass<br>
@@ -32,6 +32,7 @@ RECIPE_SYSROOT =3D &quot;${WORKDIR}/recipe-sysroot&quot;<=
br>
=C2=A0#<br>
=C2=A0PACKAGE_ARCH =3D &quot;${SDK_ARCH}-${SDKPKGSUFFIX}&quot;<br>
=C2=A0PACKAGE_ARCHS =3D &quot;${SDK_PACKAGE_ARCHS}&quot;<br>
+TUNE_PKGARCH =3D &quot;${SDK_ARCH}&quot;<br>
<br>
=C2=A0#<br>
=C2=A0# We need chrpath &gt;=3D 0.14 to ensure we can deal with 32 and 64 b=
it<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#209660): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_20=
9660&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DWUka6gPzHbL9TE5ZAo=
D4BQvCgcMYKkOu1IrPrjksrmUBAk0vuk3BpV1t8oaEwTyf&amp;s=3DTPtFgHj79RNEq6iL3Uxa=
01OjFr0K74vmPh3nxxZZQZY&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_209660&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DWUka6gPzHbL9TE5ZAoD4BQvCgcMYKkOu1IrPrjksrmUBAk0vuk3BpV1t8oaEwT=
yf&amp;s=3DTPtFgHj79RNEq6iL3Uxa01OjFr0K74vmPh3nxxZZQZY&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_110539749_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DWUka6gPzHbL9TE5ZAoD4BQvCgcMYKkOu1IrPrjksrmUBAk=
0vuk3BpV1t8oaEwTyf&amp;s=3DmifiNwos_7bKHeewrpcqyuofX-FvX7RPlxDhY5ySxfE&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_110539749_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DWUka6gPzHbL9TE5ZAoD4BQvCgcMYKkO=
u1IrPrjksrmUBAk0vuk3BpV1t8oaEwTyf&amp;s=3DmifiNwos_7bKHeewrpcqyuofX-FvX7RPl=
xDhY5ySxfE&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DWUka6gPzHbL9TE5ZAoD4BQvCgcMYKkOu1IrPrjksrmU=
BAk0vuk3BpV1t8oaEwTyf&amp;s=3DUJRePpE8mfPKpZE3UsDr_Y1qxcxp6nZVq7rHvR5YqXc&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DWUka6gPzHbL9TE5ZAoD4=
BQvCgcMYKkOu1IrPrjksrmUBAk0vuk3BpV1t8oaEwTyf&amp;s=3DUJRePpE8mfPKpZE3UsDr_Y=
1qxcxp6nZVq7rHvR5YqXc&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000cfa366063593bfbf--

