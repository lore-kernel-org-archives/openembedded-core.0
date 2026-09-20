Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1ADFC982D7
	for <webhook@archiver.kernel.org>; Sun, 20 Sep 2026 01:30:24 +0000 (UTC)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22830.1789867818089449642
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 18:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=i6ahwZsZ;
 spf=pass (domain: gmail.com, ip: 74.125.224.141, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aaf2ecfso1567223d50.1
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 18:30:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789867817; cv=none;
        d=google.com; s=arc-20260327;
        b=d4VY9B1mHXLybvkMmN1AcwQnHRrE1QCabD52zZ7+M6TP9rU/UMusAe02vz6HRSweh5
         wYVd1/z1BbIHLgDIXcfSsRqXkbgq09vU5dKjNlHTtPhyDZArweqtxUa7o4+kRc3fgc54
         37Pbv+8s0J1ZnbNYZsN4bUE4Zh+YdnszgCsNi9mxQtxPSCbKcy9igj0+NKkmJ6KwFQCQ
         hwzraByCEykqhP8HLM4q8tJL3tvgYdN8PEqY2zMUkYadYUA6dFzB7mtpIvPc3tKf7k12
         dvUci0PtoowzEQf7piGQVtvtRlWNGCmFNVWGA04KqUaLxUfmJsb7U0wVasdOM46OBMT+
         +RHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kZOMlvx1iAoeMz8zxKUF28Tk5mGiehs9mjnS97E14Jc=;
        fh=2tRbkh9USu5x3C+6pK/CbohOrqrZJdfRQMueNE2H0s4=;
        b=CwzqxTRXFyESmwfo2s9caOifpjyeh2ZHTRtjyBUFdJzbU+Wz95tIAFbtMRrwbIZugl
         TfO0DTET5QjB6Za8WWvONfHZlJiZGsgjtN7M9+0wVDPHoJ/SnnCHPU9Q6/r8GfNucKRJ
         DhSFF14FM+kUFsMbkAbfFvKL8XhDeqriu0aQ54UMSLCA8MTKT71B+FDapQlQI8SegBWT
         NPy6CG5Eb82H/t2kC98jU6ECnrwMZOXHLZlwPi6l3GvTVzPaFOAG8XKYH4/qsmaNEh6Z
         GsTQ0dlbk3zvSP/nFF1EY1RVNrLwjjUA69V2NdWVneLHeCQKUBI4Z5Nk7CzONWv28QZ4
         +xug==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789867817; x=1790472617; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZOMlvx1iAoeMz8zxKUF28Tk5mGiehs9mjnS97E14Jc=;
        b=i6ahwZsZswjMy9w596noPTTxQ3UbC+VnapYQIy6XzkppfEPXbNwE1WMM0+bIeWWU/g
         UKyuApK7KYG980kO48+cvculGsvSTqxqvmQ2A5wf95wV+wi9sDkwH+dsQSlL/MPIsiBK
         IXISxgKSp4jPPa1tquBuW4Gsywy+Xjk63xeH22t+RH/uhtWjYsbchFOK3tIpqOM6ae33
         HF6x6zXYsCKQixtLXvDKGg5Mlcgbguy6JrKiNZk5AV43Svrt/gFoMT1u/xeWGKhiA+Km
         BeNm0dqbAu5IIsImxT9s6mUPnhy6cM0gZfovTsWOmIaY5qwlVucP4AOKQ0UDOYzv5B6U
         bFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789867817; x=1790472617;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kZOMlvx1iAoeMz8zxKUF28Tk5mGiehs9mjnS97E14Jc=;
        b=fMPB99XLdfdnEXnUiGZkt5annh0nLE1ZIiGJOu6fQvhlghfi/L5vTpgn3QqQIboT/e
         6iqY4a5ukWyoHpj9QI+tcezR4z3bfv2vkDOspK46DHQDMuboHzedxM+Y9q3jn1FxPyDw
         4uHbE1ETEeacxTJ5NAqRlGlZLOW9t/lb8JpQk75fRlKjPONLiaB65WoouJbbcWZ37Q5f
         Icw2HgNBmdVZSJqwgyH+1uLRraFhtlTaW+ybWMypYPFpIL73OTCaz/rnIGsoMz7y8RL9
         v1T0puzKY+SHri9dX5536l3OaT+FZXIVnNPiowGcbdJyiPBm921vPwUBxI+vw7isesec
         6jjA==
X-Gm-Message-State: AFuF++mHmQlyOrlyh60wSMAuQy0ixhE3yALdvxaXZorBHL7NX66/3JpU
	s+aB/zEjToofUGXcRuo815InE2lEh0ezDSG7CiYL/88FT8JXOGcHdZz0IaqwN3uLHmTpKtpRD4N
	ImnJjZv0aunHEI/FQnGYc+KDxXlDSr5o=
X-Gm-Gg: AYBFou1VDj1CT2TgwehNO/+MJ51qONTbcdoNTDIHilnoMa/liohQeI1kel8qilGX+ZF
	BjXsjk40emfuLpT2P6Y+G9ZSZyaPsFaOgBGYs/5q+agzOzjT9ffgOJSptPOiml28mmVdGDdpWjT
	emmnnOutCH4CFVAvruUzGo/cDr7QXrkdLoJ0H7r0lJWzcgJ8Ok+5oKHAuONy1ZPTuERffOmKSyf
	IEduoF1UUpBnU5nGNwb0wZuMS93GdmTQom2f1SOBsBzp/I5wdUatpZOOzH5nkmxCE6TpU0cBhGC
	KE5nfGWsEO7IjwreWEk8gg0bo1TT3thkgDBj0VzC5AMzU7Z2LHC945M5AkptGioVceDhU2sOewB
	J93bU0nf+mcP6pam94WCCsd0RwxiERcolzYRjtrEEF/9gj0Yo9ONCpGk4eAfegv/klGvK8lv95W
	kkhMucpqLM6ps6VXR8U0Unltf7KiZUvJB/j3PHxxHQR/aIiR1wULuH00ahPqOjoZwvm9fv/AOhC
	iQWea9Iy8eXL3BoSB0r8dZl5T19xzxmWTrCich50B+hjnE0+SAnSOVsTBY=
X-Received: by 2002:a05:690e:148d:b0:66f:c1be:84d6 with SMTP id
 956f58d0204a3-6717fdc02fbmr2502429d50.68.1789867817134; Sat, 19 Sep 2026
 18:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260915190244.2983746-1-tgamblin@baylibre.com> <20260915190244.2983746-15-tgamblin@baylibre.com>
In-Reply-To: <20260915190244.2983746-15-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Sep 2026 18:29:51 -0700
X-Gm-Features: AcwNN1UxTGY4QKwASbbNAJmTQupspUsZyDZM-W0rcdpVly93VDizeH2sGMDg5TE
Message-ID: <CAMKF1spG2Ey=uUkV10DS5pqJs8-De1Vfd+P_Hz3PNos+DmH2Sw@mail.gmail.com>
Subject: Re: [OE-core][RFC PATCH 14/14] tune-riscv.inc: append zifencei
 extension to profiles
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, mark.hatle@kernel.crashing.org
Content-Type: multipart/alternative; boundary="0000000000006f6f22065be01355"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2026 01:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246250

--0000000000006f6f22065be01355
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 12:03=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.=
com>
wrote:

> Only riscv64gc enables this by default, but we need it for the Linux
> Kernel. Append it to the official profile strings.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  meta/conf/machine/include/riscv/tune-riscv.inc | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc
> b/meta/conf/machine/include/riscv/tune-riscv.inc
> index 64d1f89dc6..9357dc67a0 100644
> --- a/meta/conf/machine/include/riscv/tune-riscv.inc
> +++ b/meta/conf/machine/include/riscv/tune-riscv.inc
> @@ -4,13 +4,15 @@ DEFAULTTUNE ?=3D "riscv64gc"
>
>  AVAILTUNES +=3D "rva23u64 rva22u64 rva20u64 riscv64gcv riscv64gc riscv32=
gc
> riscv64nc riscv64nf riscv32nf"
>
> -TUNE_FEATURES:tune-rva20u64 :=3D "${@oe.tune.riscv_isa_to_tune("rva20u64=
")}"
> +# zifencei isn't part of these profiles per gcc's -march expansion, but
> the
> +# Linux kernel requires it, so add it on top of the profile's extensions=
.
> +TUNE_FEATURES:tune-rva20u64 :=3D "${@oe.tune.riscv_isa_to_tune("rva20u64=
")}
> zifencei"
>  PACKAGE_EXTRA_ARCHS:tune-rva20u64 =3D "${TUNE_RISCV_PKGARCH}"
>
> -TUNE_FEATURES:tune-rva22u64 :=3D "${@oe.tune.riscv_isa_to_tune("rva22u64=
")}"
> +TUNE_FEATURES:tune-rva22u64 :=3D "${@oe.tune.riscv_isa_to_tune("rva22u64=
")}
> zifencei"
>  PACKAGE_EXTRA_ARCHS:tune-rva22u64 =3D "${TUNE_RISCV_PKGARCH}"
>
> -TUNE_FEATURES:tune-rva23u64 :=3D "${@oe.tune.riscv_isa_to_tune("rva23u64=
")}"
> +TUNE_FEATURES:tune-rva23u64 :=3D "${@oe.tune.riscv_isa_to_tune("rva23u64=
")}
> zifencei"
>  PACKAGE_EXTRA_ARCHS:tune-rva23u64 =3D "${TUNE_RISCV_PKGARCH}"
>
>
Fold this into patch 0005 so bisecting is not broken in future least
someone lands in between 0005 patch
and 0013, since The rva* tunes have no zifencei until this patch.


>  # Default
> --
> 2.55.0
>
>

--0000000000006f6f22065be01355
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 15,=
 2026 at 12:03=E2=80=AFPM Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@bay=
libre.com">tgamblin@baylibre.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Only riscv64gc enables this by default, bu=
t we need it for the Linux<br>
Kernel. Append it to the official profile strings.<br>
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com" =
target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/riscv/tune-riscv.inc | 8 +++++---<br>
=C2=A01 file changed, 5 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/mac=
hine/include/riscv/tune-riscv.inc<br>
index 64d1f89dc6..9357dc67a0 100644<br>
--- a/meta/conf/machine/include/riscv/tune-riscv.inc<br>
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc<br>
@@ -4,13 +4,15 @@ DEFAULTTUNE ?=3D &quot;riscv64gc&quot;<br>
<br>
=C2=A0AVAILTUNES +=3D &quot;rva23u64 rva22u64 rva20u64 riscv64gcv riscv64gc=
 riscv32gc riscv64nc riscv64nf riscv32nf&quot;<br>
<br>
-TUNE_FEATURES:tune-rva20u64 :=3D &quot;${@oe.tune.riscv_isa_to_tune(&quot;=
rva20u64&quot;)}&quot;<br>
+# zifencei isn&#39;t part of these profiles per gcc&#39;s -march expansion=
, but the<br>
+# Linux kernel requires it, so add it on top of the profile&#39;s extensio=
ns.<br>
+TUNE_FEATURES:tune-rva20u64 :=3D &quot;${@oe.tune.riscv_isa_to_tune(&quot;=
rva20u64&quot;)} zifencei&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS:tune-rva20u64 =3D &quot;${TUNE_RISCV_PKGARCH}&quo=
t;<br>
<br>
-TUNE_FEATURES:tune-rva22u64 :=3D &quot;${@oe.tune.riscv_isa_to_tune(&quot;=
rva22u64&quot;)}&quot;<br>
+TUNE_FEATURES:tune-rva22u64 :=3D &quot;${@oe.tune.riscv_isa_to_tune(&quot;=
rva22u64&quot;)} zifencei&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS:tune-rva22u64 =3D &quot;${TUNE_RISCV_PKGARCH}&quo=
t;<br>
<br>
-TUNE_FEATURES:tune-rva23u64 :=3D &quot;${@oe.tune.riscv_isa_to_tune(&quot;=
rva23u64&quot;)}&quot;<br>
+TUNE_FEATURES:tune-rva23u64 :=3D &quot;${@oe.tune.riscv_isa_to_tune(&quot;=
rva23u64&quot;)} zifencei&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS:tune-rva23u64 =3D &quot;${TUNE_RISCV_PKGARCH}&quo=
t;<br>
<br></blockquote><div><br></div><div>Fold this into patch 0005 so bisecting=
 is not broken in future least someone lands in between 0005 patch</div><di=
v>and 0013, since=C2=A0The rva* tunes have no zifencei until this patch.</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0# Default<br>
-- <br>
2.55.0<br>
<br>
</blockquote></div></div>

--0000000000006f6f22065be01355--

