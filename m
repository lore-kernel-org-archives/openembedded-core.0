Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23E7C982CC
	for <webhook@archiver.kernel.org>; Sun, 20 Sep 2026 01:24:54 +0000 (UTC)
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22772.1789867494002850463
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 18:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OPxbiNGz;
 spf=pass (domain: gmail.com, ip: 74.125.224.140, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aa8d881so1901772d50.1
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 18:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789867493; cv=none;
        d=google.com; s=arc-20260327;
        b=dJvlxfGvIgXv76jTzedU8kalwnzqgX/OH4xczM2zMPk0M98NR6iiLtZUnecm4cXL3/
         RLUxp/3xAA8h5EoGdmvUtcwDSAZlS0RCQW5/w69x/udCECRBZQs9s5P4m+2YZzJ8Tz1U
         V5Wh7WClPDode9EYBBFMVoGiZDx6JSB+7Nv+cIkOuKT0mU61CalPp6RbBP5xkv4P6epN
         Pp8Tgm/P5RwjUetPThDtqKMS37qdUNS+4/rKNqzecFlt4tj0wOv0fz3kU+mDrSSM8uEh
         SyJ+0pDWfBb7i1QP0D4Mh605//W37ZwCNdn3gEfJScDtVKoBHxtY6AKA2XmvYN2skIJE
         jZ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LkvVrYhulODynsuithuIXNZSkRbe3WLvzvNdUS641a4=;
        fh=2tRbkh9USu5x3C+6pK/CbohOrqrZJdfRQMueNE2H0s4=;
        b=qH/il/IEG7RpLUAFMNuiQaE+66tkhQ/a1vJcAde5MraYei7xzFuh1cfBkKmkAms63a
         jWpuSuECXbT0HAdnCSYkzUwZTISF59YG5BigXTDWWimRMyAtk8VbQewnOhdCZ5VryZXi
         pmxqddsoZ8QL7Ed1/z5CVsLBPjyHHdV1By0y7zov/Nz2HTsttRGljz6mhrwOeXE0cA30
         l/8pzDSnnZhk51/4TuRzPDnkTI24C6w3iWS+E6Wd+dIOkl4VunLwsg5nZU/HZ3pTGFVK
         I3bCa4HD8bkDJDZQm+B/NLGsiK4U809KCX2Bys/Lh7SG/jjv/53L54E9ckzr8svrZ5na
         sGPg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789867493; x=1790472293; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkvVrYhulODynsuithuIXNZSkRbe3WLvzvNdUS641a4=;
        b=OPxbiNGzTLi8i0qkRxMLT71IzDbxBTNnsYtPS/gA1l+cG21oy/4pP+MzSproebA2eQ
         bGD4/5se1fZfCkr65LlowKEiTmAEHW0SZxCmYn8iWfJfJG3kdWS+z7+C63mZbhJMAGRR
         aJaCkHX4HnGPEJwzPr0V+gM/5brcV+5CLpbvFcVdAE12Gvd4CR5rV47aZIUNha5dU9i8
         I/n5xMKyXz8NJS2dAXegJFC6rX9DMn7vJGkByG78ku8pNArS+PVuuH+JQ7IUcJ2jRMBl
         UARe7DxhkbhUAhaa8EGsy4bQ9DcoLRyIUqONOe1BOe+/nAd9JZhzeOGKYwjXNsQ/2vnX
         bOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789867493; x=1790472293;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LkvVrYhulODynsuithuIXNZSkRbe3WLvzvNdUS641a4=;
        b=JlT9c1AlIPA+i/x71aIhCdeGh6B7GNv6q4a69a7LOqFlrIbEdMFcGUnic0CcFqrNO9
         +jbG++L33rw4bukkQXzIF9ra6I/y4O5lTFM4I/2L+ZKhv4Z33wFfjBNmqt9IXWNnRBYE
         TD6A8PW5Ha6Uy95IojgMQ3Q4FY5MHICTxDbSSYe0kGp4fVGm1Vcus1FmUJpV3pIutN56
         pFn2nPMy8S+9MKn5xdpRejg7kWBwR2qyUgYJ3SDDF4tI0Nq+TUWJTCvekUFe5WGXS+TW
         WwxBpfMgn38nI2BH5LvE4CDw01ZAaWZb/DhcdFkQuUEt3CrHekvTc1MsJLL8q3X5b5x7
         Q9NA==
X-Gm-Message-State: AFuF++lwa3tnYXsGQxkDnfDm3Q/7Aj3ifynoehgQTPcdUOc/lNVVh1CF
	9MgLXxseut1akOZWfV13/j3nKWjpA7Ue1LguQ9UOoSuKWL9tEd3vsPUKOAHnQEh0aE2NMa1Qfg1
	MAguQcsazN4FwBz5iFtycrs1ZIfPzO3Q=
X-Gm-Gg: AYBFou3tCnr/IpeXsfJcxTlU+I1zxoTutu9SuNrTyXYhhkdJJ7mNN/i+lE0slcoCv6P
	0oNzCDbhOs4R+6noeBh6yAlcuUqmb4VbIPbNpPIazfUuld9QfB8echXxPDusvXg4WmWAPYgfqu0
	MJBvOGAyFI2AyMNaNwCdS/jXxpST4MOmj66ytXB8Nc07I0uKUnmE9UjCFHcL0Q8ly/OlAthf0c+
	OxJmuxqgoKXoxCjBIrb7sSMjY57gupbJlsGGSGJ3leRX6x4ymwvnJFpOni0vO3DxcPBdGiF0XSm
	y+4QBj8Xi/vd/R3ICa5/iZm//MKzrDbO6gk9yKYwb8VlLHsK+YLkLjBpTAUX1XXd61VF3xbWvEf
	ZNh6hiMxRsRHFfy/XnzlUZzdlqE/5TlcDTbpecy4IMOubqk8INK4JnalEiSshStn6ln0PA5bFW3
	uKbCTVK65/fTcA/fYOXVwAh+2EoOK3oykNoJaW4sdVLkS+tkP913SNxFECu5rGPbwIG6r8bMyrv
	XUvwHY4z1rVQTX/R+bOgXw30HL7j6FpPPXaTxNj7ySEWv7uHJEAWib1IP1U1abaCFyh5A==
X-Received: by 2002:a05:690e:120c:b0:66f:9995:d0c6 with SMTP id
 956f58d0204a3-6717fcaa404mr2502789d50.25.1789867493010; Sat, 19 Sep 2026
 18:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260915190244.2983746-1-tgamblin@baylibre.com> <20260915190244.2983746-2-tgamblin@baylibre.com>
In-Reply-To: <20260915190244.2983746-2-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Sep 2026 18:24:26 -0700
X-Gm-Features: AcwNN1X9Q4BiW0WrN2lD9pKpCDQ0dQcPuTpbTRjmDMY95dxVLXCYHPhHShbx86s
Message-ID: <CAMKF1sowF7EcEBZKeuASK4FGhzzSzrhXj1uVZQ5db5ykQoM26w@mail.gmail.com>
Subject: Re: [OE-core][RFC PATCH 01/14] tune-riscv: be explicit about
 riscv64gc default
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, mark.hatle@kernel.crashing.org
Content-Type: multipart/alternative; boundary="0000000000001db27c065be000c5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2026 01:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246247

--0000000000001db27c065be000c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 12:02=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.=
com>
wrote:

> The string 'riscv64' is a generic descriptor for the 64-bit RISC-V ISA,
> and can mean different things under different contexts. In the case of
> tune-riscv.inc, it has served as an alias for the 'riscv64gc' profile
> which packages are typically built against, resulting in the following
> output (from a typical bitbake preamble):
>
> |TUNE_FEATURES        =3D "rv 64 i m a f d c zicsr zifencei"
>
> Modify tune-riscv.inc to avoid overloading the 'riscv64' string in this
> way, instead setting DEFAULTTUNE to 'riscv64gc', and changing other
> occurrences to match. TUNE_FEATURES remains the same under this
> adjustment, but the .inc file is clearer which profile is being
> targeted.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  meta/conf/machine/include/riscv/tune-riscv.inc | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc
> b/meta/conf/machine/include/riscv/tune-riscv.inc
> index 12c1125c8b..f55c122fe3 100644
> --- a/meta/conf/machine/include/riscv/tune-riscv.inc
> +++ b/meta/conf/machine/include/riscv/tune-riscv.inc
> @@ -1,15 +1,15 @@
>  require conf/machine/include/riscv/arch-riscv.inc
>
> -DEFAULTTUNE ?=3D "riscv64"
> +DEFAULTTUNE ?=3D "riscv64gc"
>
> -AVAILTUNES +=3D "riscv64 riscv32 riscv64nc riscv64nf riscv32nf"
> +AVAILTUNES +=3D "riscv64gc riscv32gc riscv64nc riscv64nf riscv32nf"
>
>  # Default
> -TUNE_FEATURES:tune-riscv64 :=3D "${@oe.tune.riscv_isa_to_tune("rv64gc")}=
"
> -PACKAGE_EXTRA_ARCHS:tune-riscv64 =3D "${TUNE_RISCV_PKGARCH}"
> +TUNE_FEATURES:tune-riscv64gc :=3D "${@oe.tune.riscv_isa_to_tune("rv64gc"=
)}"
> +PACKAGE_EXTRA_ARCHS:tune-riscv64gc =3D "${TUNE_RISCV_PKGARCH}"
>
>  TUNE_FEATURES:tune-riscv32 :=3D "${@oe.tune.riscv_isa_to_tune("rv32gc")}=
"
>

AVAILTUNES (riscv32 =E2=86=92 riscv32gc) and PACKAGE_EXTRA_ARCHS:tune-riscv=
32 =E2=86=92
:tune-riscv32gc, are renamed but not TUNE_FEATURES:tune-riscv32.


> -PACKAGE_EXTRA_ARCHS:tune-riscv32 =3D "${TUNE_RISCV_PKGARCH}"
> +PACKAGE_EXTRA_ARCHS:tune-riscv32gc =3D "${TUNE_RISCV_PKGARCH}"
>
>  # No float
>  TUNE_FEATURES:tune-riscv64nf :=3D
> "${@oe.tune.riscv_isa_to_tune("rv64imac_zicsr_zifencei")}"
> --
> 2.55.0
>
>

--0000000000001db27c065be000c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 15,=
 2026 at 12:02=E2=80=AFPM Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@bay=
libre.com">tgamblin@baylibre.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">The string &#39;riscv64&#39; is a generic =
descriptor for the 64-bit RISC-V ISA,<br>
and can mean different things under different contexts. In the case of<br>
tune-riscv.inc, it has served as an alias for the &#39;riscv64gc&#39; profi=
le<br>
which packages are typically built against, resulting in the following<br>
output (from a typical bitbake preamble):<br>
<br>
|TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;rv 64 i m a f d c zicsr=
 zifencei&quot;<br>
<br>
Modify tune-riscv.inc to avoid overloading the &#39;riscv64&#39; string in =
this<br>
way, instead setting DEFAULTTUNE to &#39;riscv64gc&#39;, and changing other=
<br>
occurrences to match. TUNE_FEATURES remains the same under this<br>
adjustment, but the .inc file is clearer which profile is being<br>
targeted.<br>
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com" =
target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/riscv/tune-riscv.inc | 10 +++++-----<br>
=C2=A01 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/mac=
hine/include/riscv/tune-riscv.inc<br>
index 12c1125c8b..f55c122fe3 100644<br>
--- a/meta/conf/machine/include/riscv/tune-riscv.inc<br>
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc<br>
@@ -1,15 +1,15 @@<br>
=C2=A0require conf/machine/include/riscv/arch-riscv.inc<br>
<br>
-DEFAULTTUNE ?=3D &quot;riscv64&quot;<br>
+DEFAULTTUNE ?=3D &quot;riscv64gc&quot;<br>
<br>
-AVAILTUNES +=3D &quot;riscv64 riscv32 riscv64nc riscv64nf riscv32nf&quot;<=
br>
+AVAILTUNES +=3D &quot;riscv64gc riscv32gc riscv64nc riscv64nf riscv32nf&qu=
ot;<br>
<br>
=C2=A0# Default<br>
-TUNE_FEATURES:tune-riscv64 :=3D &quot;${@oe.tune.riscv_isa_to_tune(&quot;r=
v64gc&quot;)}&quot;<br>
-PACKAGE_EXTRA_ARCHS:tune-riscv64 =3D &quot;${TUNE_RISCV_PKGARCH}&quot;<br>
+TUNE_FEATURES:tune-riscv64gc :=3D &quot;${@oe.tune.riscv_isa_to_tune(&quot=
;rv64gc&quot;)}&quot;<br>
+PACKAGE_EXTRA_ARCHS:tune-riscv64gc =3D &quot;${TUNE_RISCV_PKGARCH}&quot;<b=
r>
<br>
=C2=A0TUNE_FEATURES:tune-riscv32 :=3D &quot;${@oe.tune.riscv_isa_to_tune(&q=
uot;rv32gc&quot;)}&quot;<br></blockquote><div><br></div><div>AVAILTUNES (ri=
scv32 =E2=86=92 riscv32gc) and PACKAGE_EXTRA_ARCHS:tune-riscv32 =E2=86=92 :=
tune-riscv32gc, are renamed but not TUNE_FEATURES:tune-riscv32.=C2=A0</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-PACKAGE_EXTRA_ARCHS:tune-riscv32 =3D &quot;${TUNE_RISCV_PKGARCH}&quot;<br>
+PACKAGE_EXTRA_ARCHS:tune-riscv32gc =3D &quot;${TUNE_RISCV_PKGARCH}&quot;<b=
r>
<br>
=C2=A0# No float<br>
=C2=A0TUNE_FEATURES:tune-riscv64nf :=3D &quot;${@oe.tune.riscv_isa_to_tune(=
&quot;rv64imac_zicsr_zifencei&quot;)}&quot;<br>
-- <br>
2.55.0<br>
<br>
</blockquote></div></div>

--0000000000001db27c065be000c5--

