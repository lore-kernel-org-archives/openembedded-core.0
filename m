Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89C1C982D7
	for <webhook@archiver.kernel.org>; Sun, 20 Sep 2026 01:35:24 +0000 (UTC)
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22877.1789868116612599735
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 18:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j389MkYh;
 spf=pass (domain: gmail.com, ip: 74.125.224.140, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66fded6b087so1866026d50.1
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 18:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789868116; cv=none;
        d=google.com; s=arc-20260327;
        b=fDypbQnquv+8nNwGrdxv/j0r1cYh8fEf/POn2svk24znXV1vFleN7tRTTULVT4+/+n
         dEfiZee2c0+aQDVvVrAxZ5gRpFZQhNcNDJG6vn7B+foyu0zl1jM6UaDmVYpC6/N7Ok1i
         FClbgShoaFGyvtbd9jbfrqCIV+U9OV4zwb1PgBootLy55HID6Wlk3JwMXiC7XIDYdkeE
         97JJ+uQY5C9VuwbJpTaTdu9VZwv+JGC85xqqbN8ej5NXqucTOJd94+Xn+Auoh61DoTmE
         5eDxiWZtgZ12DCLwr1HbIkiS4GKg1px5y+93phMV30sq4bWSs/jYvciDEaDPhCdSbOZP
         OqMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1cxbsCwiq7vd6ct2g9Ugw/h6SXNclx3pCeVDNof1Zho=;
        fh=2tRbkh9USu5x3C+6pK/CbohOrqrZJdfRQMueNE2H0s4=;
        b=KrTQlghmG4vWLzmfOUX6915CiDwfWqWZkmBReUi9A+MW/4Im+NTsY4x18JkWHvG8ax
         GJ3J18EYJjuP/OtuSP9g/viRFKR2qhJRM8upEjb09oBldRXpwkZ2kZWjbwHDZJow3Qbz
         EzT4b2KbhBr990aL7+IqPMzCp3B9/WCxLunweHnMil74PGNlSguTXeHKbbZUKtkO7lJm
         5eKsIC7CFTau5n/Bml2+dUvt76topjdaAzgJI7lnkVKtQiwqIIfEQ57EFSsXAKW11P2d
         uJWb/VkBpK9z45kROUfPBW9v5QqHHVUzGM8KWtlteiyyNxL+Ez27g+Uui6T//gN7Tzia
         3p4Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789868116; x=1790472916; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1cxbsCwiq7vd6ct2g9Ugw/h6SXNclx3pCeVDNof1Zho=;
        b=j389MkYhW7gKRDWRYtAYocwlizpyHEJE65Ykn2c3kqLBYrPuBMJE9egWke8kc5xa5c
         jq+9uBc+5Nuc8e+yUP4g7iapc10Q1QW5lG7BK4LlLMO/L3mrwVV1G4OG+beDHkB0UCZf
         z1VsFS2mtxaIWnthgUvG2YH2CDW2gV0dlt31M2SPUu441cXvIsMNcqenc3FDXjEyplBR
         rXc4hVL02bXXWwjNE0hFzQw94WP5yMTWrvA147OmayyjGN3EwhsFv/6ezHpSH8cpg637
         6ezZeUcFaYB855Gw7DwgWk7Zg8cQZFy8lYSZCCJRGsQkAmC+xMwNnAdGLQJ0LM88Ut/K
         KiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789868116; x=1790472916;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1cxbsCwiq7vd6ct2g9Ugw/h6SXNclx3pCeVDNof1Zho=;
        b=tyIdpNR8JuetUiUZlI+kYWRdWnsR1FT35vYvq0s1jsAsL/9hGy8gMFrjOHz5itJEN+
         Yis89vJpyJX0IvJNazN8bCBq7623HSXkcStkr/+rssiEAIOajGxVaF+8mdh4Qp+tJpS4
         dwXu1qdCoCUG47MIka9gcRFWkfvWX/LDNViYSDqvaH4BDzMlJhipxhErp1qs4vGPVZ9X
         9xbyAjMxWo287hDTsdG7J3hsgfixpHCDtdkYijo3E2GECJ+2BZzUmMsPWteLLbYA6mS0
         va7BUg2WRovNt1BJVDE4KtAEpHpDztRkNs+b4LTkGsjs8EhGpd9eH/zNGo1Vk6SCr75Y
         hkRg==
X-Gm-Message-State: AFuF++lD6oltRgXexc9Ht+ru5ZCigXJo5uBo1smyuhtDKjbVF2fvQ9Qo
	/nSb/KV6oNQzw5HGoMT5x3BhNf+/kvRJ6jOYbwBf7pf1Y6QiLSbr06MjI29U5lidwpQa+OsqOQO
	zJpkZcZF4JDo/UyCR8jSi5zq6lHDBD6k=
X-Gm-Gg: AYBFou0AH7Omz6aMZbBEO38999EE+VMxX6/2qDTzSpf+zdxFxBKZCddqNXRb3qsLdAj
	aISB/7wgx8AT9OIXTsdNxQBUYKWugojwILMJJdYslwLqTI046U4bFDgGrz6PPXOVR43B0A7+sxo
	YaNyruajPERzxn6BYFSZHhJ/BkrHn1sGupzSMc92szWdmE2gNmqNTm5gX2g9YW8YW6Xz/rpdpD5
	Gh1iLuE2LpUJIojuHbd/aolA61zoUQpGqKdwutscPqkEXZCr1pALOA5ie8wks14tFKJ0tni7cal
	uo6wsU3tAV3uRfcKYIdaKIT84h8XLin9IrBh45jSBo3Q8RHP25GFpU/o+l+VpRGII8E1NsD+OPl
	4sGdw0/j0zJLno4FvxYNaI/iOX6Pumgl1yXx3AESUDtDSLS4LDAUSqMEYCPnQI+kXOYr5V+Pna8
	40oKiuWUMlagy4bL9g4w5/XlOX5+kwXs2X42IcwPFDr7+DdNyQNRFV0uqrgods0g62eA4OlF43u
	dZJ6VRVA6KMHP2GNN52se9C3pYcuAxDQ9cO0WC2tNh+nI/uT9tTW1gtpK8=
X-Received: by 2002:a05:690e:4199:b0:671:16e9:6a5 with SMTP id
 956f58d0204a3-6717fc91c9bmr1741350d50.26.1789868115601; Sat, 19 Sep 2026
 18:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260915190244.2983746-1-tgamblin@baylibre.com> <20260915190244.2983746-4-tgamblin@baylibre.com>
In-Reply-To: <20260915190244.2983746-4-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Sep 2026 18:34:48 -0700
X-Gm-Features: AcwNN1Wv4k9UBBmXx1wYswx1YOTAS4Bg_uhbacJJpqZWVf3yRHZttSDzU8iurnA
Message-ID: <CAMKF1spY1S9js8+9kC2QeN5owVsonc6dHz-KxerkWWb0j2uDBw@mail.gmail.com>
Subject: Re: [OE-core][RFC PATCH 03/14] arch-riscv.inc: add missing RVA20 extensions
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, mark.hatle@kernel.crashing.org
Content-Type: multipart/alternative; boundary="00000000000039ad03065be025a4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2026 01:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246251

--00000000000039ad03065be025a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 12:03=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.=
com>
wrote:

> There are currently many RISC-V ISA extensions missing from the
> arch-riscv.inc file, even some which are required by core 'riscv64gc'
> extensions. For example:
>
> |tgamblin@megalith
> ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedded-core (master)$
> riscv64-linux-gnu-gcc -march=3Drv64imafdc_zicsr_zifencei -mabi=3Dlp64d -Q
> --help=3Dtarget | grep rv64
> |  -march=3D
>  rv64imafdc_zicsr_zifencei_zmmul_zaamo_zalrsc_zca_zcd
>
> versus:
>
> |TUNE_FEATURES        =3D "rv 64 i m a f d c zicsr zifencei"
>
> which is missing zmmul, zaamo, zalrsc, zca, and zcd. There are even more
> absent when comparing against the official RVA20 spec - passing
> '-march=3Drva20u64' to gcc and checking the ISA extension string shows:
>
> |tgamblin@alchemist ~ $ riscv64-linux-gnu-gcc -march=3Drva20u64 -mabi=3Dl=
p64d
> -Q --help=3Dtarget | grep rv64
> |  -march=3D
> rv64imafdc_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zmmul_za128rs_zaa=
mo_zalrsc_zca_zcd
>
> Add the following extensions to arch-riscv.inc, along with their
> conditional inclusions required:
>
> - za128rs
> - zaamo (required by 'a')
> - zalrsc (required by 'a')
> - zca (required by 'c')
> - zcd
> - ziccamoa
> - ziccif
> - zicclsm
> - ziccrse
> - zicntr
> - zmmul (required by 'm')
>
> We also need to change the extension ordering in the file, so that they
> appear in the same order as the compiler expects.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  .../conf/machine/include/riscv/arch-riscv.inc | 46 ++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc
> b/meta/conf/machine/include/riscv/arch-riscv.inc
> index 6f9b74974d..7db400694c 100644
> --- a/meta/conf/machine/include/riscv/arch-riscv.inc
> +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
> @@ -86,14 +86,58 @@ TUNEVALID[zicbom] =3D "Cache-block management extensi=
on"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zicbom=
",
> "_zicbom", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zicbom", "_zicbom", "", d)}"
>
> +TUNEVALID[ziccamoa] =3D "PMA guarantees for A-extension atomics extensio=
n."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ziccamoa",
> "_ziccamoa", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ziccamoa=
",
> "_ziccamoa", "", d)}"
> +
> +TUNEVALID[ziccif] =3D "Patching instructions at run time extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ziccif",
> "_ziccif", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ziccif",
> "_ziccif", "", d)}"
> +
> +TUNEVALID[zicclsm] =3D "Software that assumes misaligned access works
> extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zicclsm",
> "_zicclsm", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zicclsm"=
,
> "_zicclsm", "", d)}"
> +
> +TUNEVALID[ziccrse] =3D "Guarantees LR/SC forward progress extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ziccrse",
> "_ziccrse", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ziccrse"=
,
> "_ziccrse", "", d)}"
> +
> +TUNEVALID[zicntr] =3D "Cycle and instruction counting for profiling
> extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zicntr",
> "_zicntr", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zicntr",
> "_zicntr", "", d)}"
> +
>  TUNEVALID[zicsr] =3D "Control and status register access extension"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zicsr =
f
> d", "_zicsr", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zics=
r f
> d", "_zicsr", "", d)}"
>
> -TUNEVALID[zifencei] =3D "Instruction-fetch fence extension"
> +TUNEVALID[zifencei] =3D "Instruction-fetch fence extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zifencei",
> "_zifencei", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zifencei=
",
> "_zifencei", "", d)}"
>
> +TUNEVALID[zmmul] =3D "Cheaper M subset (mul only) extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "m zmmul",
> "_zmmul", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "m zmmul"=
,
> "_zmmul", "", d)}"
>

It uses contains (AND) where it means "implied by" (OR).
bb.utils.contains("TUNE_FEATURES", "m zmmul", ...)
fires only when both m and zmmul are present. Net effect: the commit
message's premise =E2=80=94 riscv64gc is missing zmmul/zaamo/zalrsc/zca/zcd
relative to gcc =E2=80=94 is not fixed, riscv64gc still yields
-march=3Drv64imafdc_zicsr_zifencei
while gcc expands rv64gc to ..._zmmul_zaamo_zalrsc_zca_zcd. Either switch
to contains_any
(and own the default-tune -march/pkgarch churn) or reword the commit messag=
e
because as-is the lines are dead for every non-profile tune.
zcd has the same issue (gcc implies it from c+d).


> +
> +TUNEVALID[za128rs] =3D "Reservation set granularity (128-byte) extension=
."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "za128rs",
> "_za128rs", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "za128rs"=
,
> "_za128rs", "", d)}"
> +
> +TUNEVALID[zaamo] =3D "Atomic read-modify-write memory operations extensi=
on."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "a zaamo",
> "_zaamo", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "a zaamo"=
,
> "_zaamo", "", d)}"
> +
> +TUNEVALID[zalrsc] =3D "Extended LR/SC semantics extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "a zalrsc",
> "_zalrsc", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "a zalrsc=
",
> "_zalrsc", "", d)}"
> +
> +TUNEVALID[zca] =3D "Compressed base integer ops extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "c zca",
> "_zca", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "c zca",
> "_zca", "", d)}"
> +
> +TUNEVALID[zcd] =3D "16-bit encodings for 64-bit FP extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zcd", "_zc=
d",
> "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zcd",
> "_zcd", "", d)}"
> +
>  TUNEVALID[zba] =3D "Address bit manipulation extension"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b zba"=
,
> "_zba", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b zb=
a",
> "_zba", "", d)}"
> --
> 2.55.0
>
>

--00000000000039ad03065be025a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 15,=
 2026 at 12:03=E2=80=AFPM Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@bay=
libre.com">tgamblin@baylibre.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">There are currently many RISC-V ISA extens=
ions missing from the<br>
arch-riscv.inc file, even some which are required by core &#39;riscv64gc&#3=
9;<br>
extensions. For example:<br>
<br>
|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedde=
d-core (master)$ riscv64-linux-gnu-gcc -march=3Drv64imafdc_zicsr_zifencei -=
mabi=3Dlp64d -Q --help=3Dtarget | grep rv64<br>
|=C2=A0 -march=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rv64imafdc_zicsr_zif=
encei_zmmul_zaamo_zalrsc_zca_zcd<br>
<br>
versus:<br>
<br>
|TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;rv 64 i m a f d c zicsr=
 zifencei&quot;<br>
<br>
which is missing zmmul, zaamo, zalrsc, zca, and zcd. There are even more<br=
>
absent when comparing against the official RVA20 spec - passing<br>
&#39;-march=3Drva20u64&#39; to gcc and checking the ISA extension string sh=
ows:<br>
<br>
|tgamblin@alchemist ~ $ riscv64-linux-gnu-gcc -march=3Drva20u64 -mabi=3Dlp6=
4d -Q --help=3Dtarget | grep rv64<br>
|=C2=A0 -march=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rv64imafdc_ziccamoa_ziccif=
_zicclsm_ziccrse_zicntr_zicsr_zmmul_za128rs_zaamo_zalrsc_zca_zcd<br>
<br>
Add the following extensions to arch-riscv.inc, along with their<br>
conditional inclusions required:<br>
<br>
- za128rs<br>
- zaamo (required by &#39;a&#39;)<br>
- zalrsc (required by &#39;a&#39;)<br>
- zca (required by &#39;c&#39;)<br>
- zcd<br>
- ziccamoa<br>
- ziccif<br>
- zicclsm<br>
- ziccrse<br>
- zicntr<br>
- zmmul (required by &#39;m&#39;)<br>
<br>
We also need to change the extension ordering in the file, so that they<br>
appear in the same order as the compiler expects.<br>
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com" =
target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
---<br>
=C2=A0.../conf/machine/include/riscv/arch-riscv.inc | 46 ++++++++++++++++++=
-<br>
=C2=A01 file changed, 45 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/mac=
hine/include/riscv/arch-riscv.inc<br>
index 6f9b74974d..7db400694c 100644<br>
--- a/meta/conf/machine/include/riscv/arch-riscv.inc<br>
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc<br>
@@ -86,14 +86,58 @@ TUNEVALID[zicbom] =3D &quot;Cache-block management exte=
nsion&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zicbom&quot;, &quot;_zicbom&quot;, &quot;&quot;, d)}&quot;=
<br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEA=
TURES&quot;, &quot;zicbom&quot;, &quot;_zicbom&quot;, &quot;&quot;, d)}&quo=
t;<br>
<br>
+TUNEVALID[ziccamoa] =3D &quot;PMA guarantees for A-extension atomics exten=
sion.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;ziccamoa&quot;, &quot;_ziccamoa&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;ziccamoa&quot;, &quot;_ziccamoa&quot;, &quot;&quot;, d)}&quot;<br=
>
+<br>
+TUNEVALID[ziccif] =3D &quot;Patching instructions at run time extension.&q=
uot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;ziccif&quot;, &quot;_ziccif&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;ziccif&quot;, &quot;_ziccif&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
+TUNEVALID[zicclsm] =3D &quot;Software that assumes misaligned access works=
 extension.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;zicclsm&quot;, &quot;_zicclsm&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zicclsm&quot;, &quot;_zicclsm&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
+TUNEVALID[ziccrse] =3D &quot;Guarantees LR/SC forward progress extension.&=
quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;ziccrse&quot;, &quot;_ziccrse&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;ziccrse&quot;, &quot;_ziccrse&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
+TUNEVALID[zicntr] =3D &quot;Cycle and instruction counting for profiling e=
xtension.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;zicntr&quot;, &quot;_zicntr&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zicntr&quot;, &quot;_zicntr&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
=C2=A0TUNEVALID[zicsr] =3D &quot;Control and status register access extensi=
on&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zicsr f d&quot;, &quot;_zicsr&quot;, &quot;&quot;, d)}&quo=
t;<br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEA=
TURES&quot;, &quot;zicsr f d&quot;, &quot;_zicsr&quot;, &quot;&quot;, d)}&q=
uot;<br>
<br>
-TUNEVALID[zifencei] =3D &quot;Instruction-fetch fence extension&quot;<br>
+TUNEVALID[zifencei] =3D &quot;Instruction-fetch fence extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zifencei&quot;, &quot;_zifencei&quot;, &quot;&quot;, d)}&quot;=
<br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURE=
S&quot;, &quot;zifencei&quot;, &quot;_zifencei&quot;, &quot;&quot;, d)}&quo=
t;<br>
<br>
+TUNEVALID[zmmul] =3D &quot;Cheaper M subset (mul only) extension.&quot;<br=
>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;m zmmul&quot;, &quot;_zmmul&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;m zmmul&quot;, &quot;_zmmul&quot;, &quot;&quot;, d)}&quot;<br></b=
lockquote><div><br></div><div>It=C2=A0uses contains (AND) where it means &q=
uot;implied by&quot; (OR). bb.utils.contains(&quot;TUNE_FEATURES&quot;, &qu=
ot;m zmmul&quot;, ...)=C2=A0</div><div>fires only when both m and zmmul are=
 present. Net effect: the commit message&#39;s premise =E2=80=94 riscv64gc =
is missing zmmul/zaamo/zalrsc/zca/zcd relative to gcc =E2=80=94 is not fixe=
d,=C2=A0riscv64gc still yields -march=3Drv64imafdc_zicsr_zifencei</div><div=
>while gcc expands rv64gc to ..._zmmul_zaamo_zalrsc_zca_zcd. Either switch =
to contains_any</div><div>(and own the default-tune -march/pkgarch churn) o=
r reword the commit message</div><div>because as-is the lines are dead for =
every non-profile tune.</div><div>zcd has the same issue (gcc implies it fr=
om c+d).</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
+<br>
+TUNEVALID[za128rs] =3D &quot;Reservation set granularity (128-byte) extens=
ion.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;za128rs&quot;, &quot;_za128rs&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;za128rs&quot;, &quot;_za128rs&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
+TUNEVALID[zaamo] =3D &quot;Atomic read-modify-write memory operations exte=
nsion.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;a zaamo&quot;, &quot;_zaamo&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;a zaamo&quot;, &quot;_zaamo&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
+TUNEVALID[zalrsc] =3D &quot;Extended LR/SC semantics extension.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;a zalrsc&quot;, &quot;_zalrsc&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;a zalrsc&quot;, &quot;_zalrsc&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
+TUNEVALID[zca] =3D &quot;Compressed base integer ops extension.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;c zca&quot;, &quot;_zca&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;c zca&quot;, &quot;_zca&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
+TUNEVALID[zcd] =3D &quot;16-bit encodings for 64-bit FP extension.&quot;<b=
r>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;zcd&quot;, &quot;_zcd&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zcd&quot;, &quot;_zcd&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
=C2=A0TUNEVALID[zba] =3D &quot;Address bit manipulation extension&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;b zba&quot;, &quot;_zba&quot;, &quot;&quot;, d)}&quot;<br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEA=
TURES&quot;, &quot;b zba&quot;, &quot;_zba&quot;, &quot;&quot;, d)}&quot;<b=
r>
-- <br>
2.55.0<br>
<br>
</blockquote></div></div>

--00000000000039ad03065be025a4--

