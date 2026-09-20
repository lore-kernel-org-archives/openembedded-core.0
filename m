Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB13EC982CC
	for <webhook@archiver.kernel.org>; Sun, 20 Sep 2026 01:36:54 +0000 (UTC)
Received: from mail-yx2-f36.google.com (mail-yx2-f36.google.com [74.125.224.164])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22711.1789868205815917891
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 18:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CKgKeX8C;
 spf=pass (domain: gmail.com, ip: 74.125.224.164, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f36.google.com with SMTP id 956f58d0204a3-66e4aaf2ecfso1568582d50.1
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 18:36:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789868205; cv=none;
        d=google.com; s=arc-20260327;
        b=XPYI0R/QbddPArrYcTF6oL6ykg1RJSq64gwXXhhjL89O6cpOUISBDZJbz5rrAIfK1K
         9Qq/t8qreHO//Jvc5jaXP6p7HJFKZR6mxfJDj7ePUbVAITI7wTdQ+Lif4jypdafYJw5R
         5CumFqbMt15zUMY5F5EjX7mstNyzvGjNPnFaBM+1OZdHBVQJ2GJ3G0G5cy3S6rC7jywI
         5wtONCaLxhq9s1Gr/P3u6BHeBoBr0XfyhIS6oczSRO8rqnnoDpQjtjt1IHqNVxDrWY/K
         p9kLOahSzGwgaXbc6dR33tFj41JM+P4O2mraD/VbbewPcLnGAs0SHM/sLGYURYwzBlDq
         dU7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LApt9sd9I03xjpzUZwiuQyKiUS1S9j7Ivv/Oaok8ZG4=;
        fh=2tRbkh9USu5x3C+6pK/CbohOrqrZJdfRQMueNE2H0s4=;
        b=lbZXeovZg5d0dFuzC6GRMdC1AESwVFhn44VbleRDB55NaNoqwggu3Uth2lw1TQlsZH
         jrPMj+PK9a9KeHsYDgl/E0ATR1r4dtSFe3d1My7CSdD1mmOVLqHPs+eFlkbiupfaGTux
         rUybTXVkDz+dALOeOPrgnUwgqEJiv9kW66t/DlV9l0tcc98Ao1rJ8LwKf01gbWc8uGqJ
         GUI//kVRHOpZCOC3dkMdu79efzZpGR6yTjYF6hIvkD9/8oDDUSQTR8+xBzM8OizBOA1b
         ngGDGEbDqcdXZoYcWSTpAg0eIwWw/hRIhvC2hdAx2tR9o8dO13RJxLP8657msp24/FDw
         O6Tw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789868205; x=1790473005; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LApt9sd9I03xjpzUZwiuQyKiUS1S9j7Ivv/Oaok8ZG4=;
        b=CKgKeX8C0I9E86GRitnHFXks/ALHfYGIIwhCEwuWDpn/QcKNEQCIHbf7Rf/jDMc0di
         /loStsdKFDSMMOjVOSXla7AJVTLBBfE8NiCTUz8Z5Pkw++4udeGVo7MbpF62Bf6uv8+2
         urq9C4JCT1+5Ie24ciC7KESlV5At3tT1et2BX3JtOLauHd/3yQZ84NcNOPt8bemyMP56
         lYbBGfad1CXEqk7T4hFh1GLbP7VIls4GeswgtbaA1TMfcT+i5M87c1dhvAzvfpn7nkOX
         uNoE5x9HveQh8gldCsbYWFuIDJPuiGhTX3o2obS6suSRbO15yARXp0Pc7C1rDGFSmQhE
         qPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789868205; x=1790473005;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LApt9sd9I03xjpzUZwiuQyKiUS1S9j7Ivv/Oaok8ZG4=;
        b=cnztUM2aB2Vx3RbgDTciwBTk2IlU4bsUGAkyByj9tIdyo3NpOwXgy/BV22dmi882sz
         YlBYWgASMpANb+AxgnB0PJwwam7d9S3fquxOqylPBhMck9xZj4TGO2LhPq3RB5vZ13xz
         nWxYaBreqMMldQGfRSScAJyttluxDj8VT/VqFY4kuCcLLaH4ZdeZLCHiziNSrJMwziIN
         5gjfyqwelLl8rz0208oNO7gwE8zPhpKFRlabpKbABi9YmR+OqKtVA6pXmaFBGj4wtofW
         7wO4jgqwmU3a2gNysDk6FBVPSAiAPddgm364CK2IZTbr06xHYXx2sYpxHpfiBbsLItS5
         YYqg==
X-Gm-Message-State: AFuF++nfRnhmEzqs/6T8pycGJ3nI6rAYzYjoNCzL+O0832CoftncyJII
	TINJXHwl3Xu1yVbUADuj+Sk3k3QmHThOp8s1NphRaXW1Tv+B4/7XJ3IpaGPFY0krlc5SRRSpHiD
	s92Es3gV62i8JtbR/CIhowxnkDWWUMwvChmeP
X-Gm-Gg: AYBFou0EGVF44Q0LmVzj+AaegcmHHaVGwR1Zs6wM2Sb9JPUL0jERLIE1qVpWnEOfoYW
	RDUrzZJ7d1om85zTTSpJLTO1rZzdMnwNLuCULySEkL5RSojQTWBfLGoLMG7TaaEsJEU+Kv1cDo0
	Q+XmH8nqNzsyXwyFeCm2TVOFS40UrADOwaNK1DqB7cou5l7BWKkwhUSexT+wK+UzeKlGsp/bWwQ
	X1cSouXwZUWWQbZNaJrO7diTXsrjcdzudi7lWhsSEXQQOHH44evspaUpNdpCilDYEQE3FHaB6y2
	cegNMOBAkiwa2SCMzaW6t0icvz+NJTmt2iDCbNXpAwtAOiVbCfbHOMfRNaKF6aaFGKInlP97NtW
	K684gWkNa02VBHkZmDmbX7+He+2xI2ZQBNSGRxJx4AArP53vhwT0jyNrN1Iv6GqLjdO3hOcqMR1
	JXAQo0cCMBFMXI7Fb6nS+eIcuKFJpYQHVSBqdFVLnV+6Jm6nAz3u8in8Zm4l4DQBcCY0ATS576q
	2uZQoiv6OQye4EZpxFGHkchU17qgspXIjqg+7uIe4A7jq+WsxJybeifTng=
X-Received: by 2002:a05:690e:d46:b0:66f:c1be:84ef with SMTP id
 956f58d0204a3-6717fe33e43mr1830896d50.93.1789868204832; Sat, 19 Sep 2026
 18:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260915190244.2983746-1-tgamblin@baylibre.com> <20260915190244.2983746-7-tgamblin@baylibre.com>
In-Reply-To: <20260915190244.2983746-7-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Sep 2026 18:36:18 -0700
X-Gm-Features: AcwNN1WLgDC_Rts1hZ9N7IhDBlHHDdONuROdFfaz8mzlGaZkCidQElccp7aju0I
Message-ID: <CAMKF1srx3+XnbMpPP7wy6EgdGMyBd5etEWJiXvv=mcaiQYEdZw@mail.gmail.com>
Subject: Re: [OE-core][RFC PATCH 06/14] arch-riscv.inc: add rva22u64 extensions
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, mark.hatle@kernel.crashing.org
Content-Type: multipart/alternative; boundary="0000000000008b3dce065be02a81"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2026 01:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246252

--0000000000008b3dce065be02a81
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 12:03=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.=
com>
wrote:

> gcc reports the following extension string for '-march=3Drva22u64':
>
> |tgamblin@megalith
> ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedded-core (master)$
> riscv64-linux-gnu-gcc -march=3Drva22u64 -mabi=3Dlp64d -Q --help=3Dtarget =
| grep
> rv64
> |  -march=3D
>  rv64imafdcb_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_=
zicntr_zicsr_zihintpause_zmmul_za64rs_zaamo_zalrsc_zfhmin_zca_zcd_zba_zbb_z=
bs_zkt
>
> Add the following extensions needed to complete the profile:
>
> - za64rs
> - zfhmin
> - zic64b
> - zicbop
> - zicboz
> - zihintpause
> - zkt
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  .../conf/machine/include/riscv/arch-riscv.inc | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc
> b/meta/conf/machine/include/riscv/arch-riscv.inc
> index 7db400694c..c05cdf8c21 100644
> --- a/meta/conf/machine/include/riscv/arch-riscv.inc
> +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
> @@ -82,10 +82,22 @@ TUNE_RISCV_MARCH .=3D
> "${@bb.utils.contains("TUNE_FEATURES", "v", "v", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "v", "v",
> "", d)}"
>
>  # Now the special Z extensions
> +TUNEVALID[zic64b] =3D "Cache block size is 64 bytes extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zic64b=
",
> "_zic64b", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zic64b", "_zic64b", "", d)}"
> +
>  TUNEVALID[zicbom] =3D "Cache-block management extension"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zicbom=
",
> "_zicbom", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zicbom", "_zicbom", "", d)}"
>
> +TUNEVALID[zicbop] =3D "Cache-block prefetching extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zicbop=
",
> "_zicbop", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zicbop", "_zicbop", "", d)}"
> +
> +TUNEVALID[zicboz] =3D "Cache-block zeroing extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "zicboz=
",
> "_zicboz", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES",
> "zicboz", "_zicboz", "", d)}"
> +
>  TUNEVALID[ziccamoa] =3D "PMA guarantees for A-extension atomics extensio=
n."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ziccamoa",
> "_ziccamoa", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ziccamoa=
",
> "_ziccamoa", "", d)}"
> @@ -114,10 +126,18 @@ TUNEVALID[zifencei] =3D "Instruction-fetch fence
> extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zifencei",
> "_zifencei", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zifencei=
",
> "_zifencei", "", d)}"
>
> +TUNEVALID[zihintpause] =3D "Pause hint extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zihintpaus=
e",
> "_zihintpause", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES",
> "zihintpause", "_zihintpause", "", d)}"
> +
>  TUNEVALID[zmmul] =3D "Cheaper M subset (mul only) extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "m zmmul",
> "_zmmul", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "m zmmul"=
,
> "_zmmul", "", d)}"
>
> +TUNEVALID[za64rs] =3D "Reservation set size of at most 64 bytes extensio=
n."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "za64rs",
> "_za64rs", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "za64rs",
> "_za64rs", "", d)}"
> +
>  TUNEVALID[za128rs] =3D "Reservation set granularity (128-byte) extension=
."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "za128rs",
> "_za128rs", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "za128rs"=
,
> "_za128rs", "", d)}"
> @@ -130,6 +150,10 @@ TUNEVALID[zalrsc] =3D "Extended LR/SC semantics
> extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "a zalrsc",
> "_zalrsc", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "a zalrsc=
",
> "_zalrsc", "", d)}"
>
> +TUNEVALID[zfhmin] =3D "Minimal half-precision floating point extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zfhmin",
> "_zfhmin", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "zfhmin",
> "_zfhmin", "", d)}"
> +
>  TUNEVALID[zca] =3D "Compressed base integer ops extension."
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "c zca",
> "_zca", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "c zca",
> "_zca", "", d)}"
> @@ -154,6 +178,10 @@ TUNEVALID[zbs] =3D "Single-bit manipulation extensio=
n"
>  TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b zbs"=
,
> "_zbs", "", d)}"
>  TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b zb=
s",
> "_zbs", "", d)}"
>
> +TUNEVALID[zkt] =3D "Data-independent execution latency extension."
> +TUNE_RISCV_MARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b zkt"=
,
> "_zkt", "", d)}"
> +TUNE_RISCV_PKGARCH .=3D "${@bb.utils.contains_any("TUNE_FEATURES", "b zk=
t",
> "_zkt", "", d)}"
>

wrongly implies zkt from b, Zkt is mandated by the RVA22/23 profiles, not
by B
(the cover letter's "'zkt' is needed by 'b'" is incorrect). This silently
injects _zkt into -march and the
package arch of any b-enabled non-profile tune.

> +
>  # Construct TUNE_CCARGS
>  # This should result in a CCARG similar to:
>  #   -march=3Drv32imac -mabi=3Dilp32
> --
> 2.55.0
>
>

--0000000000008b3dce065be02a81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 15,=
 2026 at 12:03=E2=80=AFPM Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@bay=
libre.com">tgamblin@baylibre.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">gcc reports the following extension string=
 for &#39;-march=3Drva22u64&#39;:<br>
<br>
|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedde=
d-core (master)$ riscv64-linux-gnu-gcc -march=3Drva22u64 -mabi=3Dlp64d -Q -=
-help=3Dtarget | grep rv64<br>
|=C2=A0 -march=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rv64imafdcb_zic64b_z=
icbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zihintpaus=
e_zmmul_za64rs_zaamo_zalrsc_zfhmin_zca_zcd_zba_zbb_zbs_zkt<br>
<br>
Add the following extensions needed to complete the profile:<br>
<br>
- za64rs<br>
- zfhmin<br>
- zic64b<br>
- zicbop<br>
- zicboz<br>
- zihintpause<br>
- zkt<br>
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com" =
target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
---<br>
=C2=A0.../conf/machine/include/riscv/arch-riscv.inc | 28 ++++++++++++++++++=
+<br>
=C2=A01 file changed, 28 insertions(+)<br>
<br>
diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/mac=
hine/include/riscv/arch-riscv.inc<br>
index 7db400694c..c05cdf8c21 100644<br>
--- a/meta/conf/machine/include/riscv/arch-riscv.inc<br>
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc<br>
@@ -82,10 +82,22 @@ TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;=
TUNE_FEATURES&quot;, &quot;v&quot;, &quot;v&quot;, &quot;&quot;, d)}&quot;<=
br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURE=
S&quot;, &quot;v&quot;, &quot;v&quot;, &quot;&quot;, d)}&quot;<br>
<br>
=C2=A0# Now the special Z extensions<br>
+TUNEVALID[zic64b] =3D &quot;Cache block size is 64 bytes extension.&quot;<=
br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES&q=
uot;, &quot;zic64b&quot;, &quot;_zic64b&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zic64b&quot;, &quot;_zic64b&quot;, &quot;&quot;, d)}&quot;<br=
>
+<br>
=C2=A0TUNEVALID[zicbom] =3D &quot;Cache-block management extension&quot;<br=
>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;zicbom&quot;, &quot;_zicbom&quot;, &quot;&quot;, d)}&quot;=
<br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEA=
TURES&quot;, &quot;zicbom&quot;, &quot;_zicbom&quot;, &quot;&quot;, d)}&quo=
t;<br>
<br>
+TUNEVALID[zicbop] =3D &quot;Cache-block prefetching extension.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES&q=
uot;, &quot;zicbop&quot;, &quot;_zicbop&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zicbop&quot;, &quot;_zicbop&quot;, &quot;&quot;, d)}&quot;<br=
>
+<br>
+TUNEVALID[zicboz] =3D &quot;Cache-block zeroing extension.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES&q=
uot;, &quot;zicboz&quot;, &quot;_zicboz&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;zicboz&quot;, &quot;_zicboz&quot;, &quot;&quot;, d)}&quot;<br=
>
+<br>
=C2=A0TUNEVALID[ziccamoa] =3D &quot;PMA guarantees for A-extension atomics =
extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;ziccamoa&quot;, &quot;_ziccamoa&quot;, &quot;&quot;, d)}&quot;=
<br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURE=
S&quot;, &quot;ziccamoa&quot;, &quot;_ziccamoa&quot;, &quot;&quot;, d)}&quo=
t;<br>
@@ -114,10 +126,18 @@ TUNEVALID[zifencei] =3D &quot;Instruction-fetch fence=
 extension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;zifencei&quot;, &quot;_zifencei&quot;, &quot;&quot;, d)}&quot;=
<br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURE=
S&quot;, &quot;zifencei&quot;, &quot;_zifencei&quot;, &quot;&quot;, d)}&quo=
t;<br>
<br>
+TUNEVALID[zihintpause] =3D &quot;Pause hint extension.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;zihintpause&quot;, &quot;_zihintpause&quot;, &quot;&quot;, d)}&quot=
;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zihintpause&quot;, &quot;_zihintpause&quot;, &quot;&quot;, d)}&qu=
ot;<br>
+<br>
=C2=A0TUNEVALID[zmmul] =3D &quot;Cheaper M subset (mul only) extension.&quo=
t;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;m zmmul&quot;, &quot;_zmmul&quot;, &quot;&quot;, d)}&quot;<br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURE=
S&quot;, &quot;m zmmul&quot;, &quot;_zmmul&quot;, &quot;&quot;, d)}&quot;<b=
r>
<br>
+TUNEVALID[za64rs] =3D &quot;Reservation set size of at most 64 bytes exten=
sion.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;za64rs&quot;, &quot;_za64rs&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;za64rs&quot;, &quot;_za64rs&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
=C2=A0TUNEVALID[za128rs] =3D &quot;Reservation set granularity (128-byte) e=
xtension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;za128rs&quot;, &quot;_za128rs&quot;, &quot;&quot;, d)}&quot;<b=
r>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURE=
S&quot;, &quot;za128rs&quot;, &quot;_za128rs&quot;, &quot;&quot;, d)}&quot;=
<br>
@@ -130,6 +150,10 @@ TUNEVALID[zalrsc] =3D &quot;Extended LR/SC semantics e=
xtension.&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;a zalrsc&quot;, &quot;_zalrsc&quot;, &quot;&quot;, d)}&quot;<b=
r>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURE=
S&quot;, &quot;a zalrsc&quot;, &quot;_zalrsc&quot;, &quot;&quot;, d)}&quot;=
<br>
<br>
+TUNEVALID[zfhmin] =3D &quot;Minimal half-precision floating point extensio=
n.&quot;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quot;=
, &quot;zfhmin&quot;, &quot;_zfhmin&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&quo=
t;, &quot;zfhmin&quot;, &quot;_zfhmin&quot;, &quot;&quot;, d)}&quot;<br>
+<br>
=C2=A0TUNEVALID[zca] =3D &quot;Compressed base integer ops extension.&quot;=
<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURES&=
quot;, &quot;c zca&quot;, &quot;_zca&quot;, &quot;&quot;, d)}&quot;<br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains(&quot;TUNE_FEATURE=
S&quot;, &quot;c zca&quot;, &quot;_zca&quot;, &quot;&quot;, d)}&quot;<br>
@@ -154,6 +178,10 @@ TUNEVALID[zbs] =3D &quot;Single-bit manipulation exten=
sion&quot;<br>
=C2=A0TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATU=
RES&quot;, &quot;b zbs&quot;, &quot;_zbs&quot;, &quot;&quot;, d)}&quot;<br>
=C2=A0TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEA=
TURES&quot;, &quot;b zbs&quot;, &quot;_zbs&quot;, &quot;&quot;, d)}&quot;<b=
r>
<br>
+TUNEVALID[zkt] =3D &quot;Data-independent execution latency extension.&quo=
t;<br>
+TUNE_RISCV_MARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES&q=
uot;, &quot;b zkt&quot;, &quot;_zkt&quot;, &quot;&quot;, d)}&quot;<br>
+TUNE_RISCV_PKGARCH .=3D &quot;${@bb.utils.contains_any(&quot;TUNE_FEATURES=
&quot;, &quot;b zkt&quot;, &quot;_zkt&quot;, &quot;&quot;, d)}&quot;<br></b=
lockquote><div><br></div><div>wrongly implies zkt from b,=C2=A0Zkt is manda=
ted by the RVA22/23 profiles, not by B</div><div>(the cover letter&#39;s &q=
uot;&#39;zkt&#39; is needed by &#39;b&#39;&quot; is incorrect). This silent=
ly injects _zkt into -march and the</div><div>package arch of any b-enabled=
 non-profile tune.<span style=3D"background-color:transparent">=C2=A0</span=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0# Construct TUNE_CCARGS<br>
=C2=A0# This should result in a CCARG similar to:<br>
=C2=A0#=C2=A0 =C2=A0-march=3Drv32imac -mabi=3Dilp32<br>
-- <br>
2.55.0<br>
<br>
</blockquote></div></div>

--0000000000008b3dce065be02a81--

