Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8ACC982D7
	for <webhook@archiver.kernel.org>; Sun, 20 Sep 2026 01:26:44 +0000 (UTC)
Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22792.1789867595712705771
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 18:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UoYtNLha;
 spf=pass (domain: gmail.com, ip: 74.125.224.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66fabb1a601so1588603d50.3
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 18:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789867595; cv=none;
        d=google.com; s=arc-20260327;
        b=s9+NiFSoV5nwgeIeibW3f/R6VpVgY1bWDeQDGaA64Ocu/MiHH7dZYjLAXiZ9T8QtNY
         n/kEqNz/y0Pe9Yvatcl/zcogDlX6BowLHWYGhkjv7bHRUDpFXawch/kJ7mMaGdsod1/Y
         pnArAZJTYSHq4/Q/ysfaZwEF4DB+Ju41/BUasFKx5UPkCYvNzjYbkv7BF2ViYMA0vwnv
         X8ug7yC9nD31Yj39vSF88iQ2UI2TvnlgXYX0LF5nIjspou3dqff4WeIvjVVuZ01e9Eql
         AI7HZKjrv1DI1ffasf3DAJaxmbIhamRr3fFimJjxdajXK9Mem8hS4keZRwxe+iKW7SQ4
         OnuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ffvSXM/NKij0Wi50g6nuA3BZlLIS2b/WxAGj6MuftmI=;
        fh=2tRbkh9USu5x3C+6pK/CbohOrqrZJdfRQMueNE2H0s4=;
        b=DtAqe/0+s13NLRJo7b1dtqVuUz5IX+zjWTWVlBqQneqIPYKL7gED3Lr+4vykggRcQj
         ZiZrIX+ueVbu43bdJmpfu+nEfD4xdZHHc3oDqLydO+nMEA6V7mi4uiEWaRwxxWY2ZePl
         ZS9qvfkTqHzHYaPsYDO3rqVchpLim5JDXOrdOBPfjxdmjN70g4jtS1FQWSvOz3zFeQGo
         6LfRJkIAzT0JaXIuFnyNx80DnSDLoI1Wkj6sqopyAFwru0kRpqrytwiVCs/oCspK870Z
         k0oqCIZOrPA6OeKoaPzvuPWnB/QaESQFmf1+rujsODWfSvmDUigQT2uy8atB6qFW3V54
         UAGQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789867595; x=1790472395; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ffvSXM/NKij0Wi50g6nuA3BZlLIS2b/WxAGj6MuftmI=;
        b=UoYtNLhan87Mwq3B8Vis1QdHL7avF0HQXawxXvox76LdrTzDPb2KHO2dn92HR/Szyf
         mon10N9+jO7JjktIQAFIeMbHCcJ+nuGtaI0xlUR8Xi9xbFjvOThvUGykHtUwUVkPHbKq
         f1NOGQbcdUoz4zrccLlec82RpyJE0Bn/4DOW4Hzc0yRkcrYztg4zycPEc9J9xGha3HyG
         dJyjhm0dB/eGJCpfcIfCktQgq3/JxOixV6aK/fEglpSeEHFBWyDsnbWBe5Bj2AlhZqOY
         D9mGFkSKTeFAus7YT3vsEbC9VKcbRXGp+ooKGpVEH10QO3LNSJPX4DkhQ8AVBPBPualg
         3lrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789867595; x=1790472395;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ffvSXM/NKij0Wi50g6nuA3BZlLIS2b/WxAGj6MuftmI=;
        b=AMFSkdVFRbrKSWBGesFnRDxrS82V3MaYM3mQRZ0Rxk9nv5fXTT+jf6c9kz2Uhkb9aK
         ZkvIECvNP4kicT4Fato3bH9xJpWWyZcrv5T0olqC1LHWjO5hKpR0f6K9pw0/EalNGMd5
         4Pqc/plFz8wfxKrbANqk/Wm+lQlWKLnjIULDTKboHXEEk2Z9Hbw5A/oO4VbUuOxxL73J
         hN0kxck75YE2P9Wl75IovFN7zPlnClbwbAjF5vXP0bTsENb1pi85LhOnsICJ43QbnOZQ
         pkeWMCYKjgZX/THIX7tFSBJWw5lxMSMaNwRKBFnEjIMyzDsjFEO+YdgNzxeNjOQ7NCef
         lRKQ==
X-Gm-Message-State: AFuF++no6j0U3iUUGXcnZ25h23h8nFZGoa322uN3LfTpu6DWfkFbfKFb
	Ds3xy43GqKb6GjQ+Vm4BE/kIZdgIzIWCXqpwBzeob3xsAfRn57kpqa2V9teVL7ug1nbPLB1aHpH
	e/92qhQF1frgVOxVOcxlJre68gLeEEcM=
X-Gm-Gg: AYBFou1OSu3JzyFBnDWTic/osa3UonG5WjMNURh8sJ7TkdbDoOZH+x7YV9A4K/KdwRJ
	tXWz4Lj8mg5Gtuf2ql7+mbKvZskKUeG2UI4LFWdNQXlz8B8s6bMl2G9RG86UR8fUYTbe3gKlsEP
	DYxv3OLjgVe9aUHAptJ8EpRfyze91TcBfLJON7RD25K2p0CehUlYZEqg64XMBbL3/YVWtnWCV/r
	aLyD6/11jC4kPxRhAP4MSdijjxFR7N/JQ8288LV9FU7tHSunPkRXBJOaiLBR+LmFSMSsgfIf1J/
	bT0YUhhaK1rbL06ajdnGD6G5b3FfOhEN25qqdz/J1z8YbEPPfRDsinkI3aDNj21DuOrFQjY0YfM
	lSBpniLNkivTHmdebvuCVSzI5rG/LARlHfpYlIl5ovooESAe5P60MxW5dYFlfnxZ55TQH2pUQGS
	tz2dTmsKWCD6X0ljLthGI4SeaqH570D32nZvpsPtYKyau1iGgPM3eyc4O4OpfXJ0SmmP4N6df7i
	AujZBzO7aaDMG2m27L86YzozyowIdy1we5em8SdA7hfDYFFu8nzHe02RZU=
X-Received: by 2002:a53:ac82:0:b0:672:a52c:db2e with SMTP id
 956f58d0204a3-672a52ce2afmr348407d50.102.1789867594775; Sat, 19 Sep 2026
 18:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260915190244.2983746-1-tgamblin@baylibre.com> <20260915190244.2983746-3-tgamblin@baylibre.com>
In-Reply-To: <20260915190244.2983746-3-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Sep 2026 18:26:08 -0700
X-Gm-Features: AcwNN1UK0QkWghKVsaGuvwL5QiGBPMhyvzTID0IM6MKhQ7S-NzbFdyS4VGT_F0M
Message-ID: <CAMKF1sq4ZA86JDZBE_PQ4rYcdbAfABwZNNP=0KJvZ894S59HnA@mail.gmail.com>
Subject: Re: [OE-core][RFC PATCH 02/14] tune-riscv.inc: add 'riscv64gcv' tune
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, mark.hatle@kernel.crashing.org
Content-Type: multipart/alternative; boundary="0000000000002e82d1065be00610"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2026 01:26:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246248

--0000000000002e82d1065be00610
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 12:03=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.=
com>
wrote:

> Add a new RISC-V tune option which adds the 'v' (vector) extension,
> compared to the default.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  meta/conf/machine/include/riscv/tune-riscv.inc | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc
> b/meta/conf/machine/include/riscv/tune-riscv.inc
> index f55c122fe3..3eb057680a 100644
> --- a/meta/conf/machine/include/riscv/tune-riscv.inc
> +++ b/meta/conf/machine/include/riscv/tune-riscv.inc
> @@ -2,12 +2,15 @@ require conf/machine/include/riscv/arch-riscv.inc
>
>  DEFAULTTUNE ?=3D "riscv64gc"
>
> -AVAILTUNES +=3D "riscv64gc riscv32gc riscv64nc riscv64nf riscv32nf"
> +AVAILTUNES +=3D "riscv64gcv riscv64gc riscv32gc riscv64nc riscv64nf
> riscv32nf"
>
>  # Default
>  TUNE_FEATURES:tune-riscv64gc :=3D "${@oe.tune.riscv_isa_to_tune("rv64gc"=
)}"
>  PACKAGE_EXTRA_ARCHS:tune-riscv64gc =3D "${TUNE_RISCV_PKGARCH}"
>
> +TUNE_FEATURES:tune-riscv64gcv :=3D
> "${@oe.tune.riscv_isa_to_tune("rv64gcv")}"
> +PACKAGE_EXTRA_ARCHS:tune-riscv64gcv =3D "${TUNE_RISCV_PKGARCH}"
> +
>  TUNE_FEATURES:tune-riscv32 :=3D "${@oe.tune.riscv_isa_to_tune("rv32gc")}=
"
>  PACKAGE_EXTRA_ARCHS:tune-riscv32gc =3D "${TUNE_RISCV_PKGARCH}"
>
>
So riscv32gc has no TUNE_FEATURES and riscv32 has no PACKAGE_EXTRA_ARCHS.
Nothing later in the series fixes it AFAICT. And
meta/conf/machine/qemuriscv32.conf:5 still says DEFAULTTUNE ?=3D "riscv32",
so qemuriscv32 ends up with an empty PACKAGE_EXTRA_ARCHS after this patch.


> --
> 2.55.0
>
>

--0000000000002e82d1065be00610
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 15,=
 2026 at 12:03=E2=80=AFPM Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@bay=
libre.com">tgamblin@baylibre.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Add a new RISC-V tune option which adds th=
e &#39;v&#39; (vector) extension,<br>
compared to the default.<br>
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com" =
target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/riscv/tune-riscv.inc | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/mac=
hine/include/riscv/tune-riscv.inc<br>
index f55c122fe3..3eb057680a 100644<br>
--- a/meta/conf/machine/include/riscv/tune-riscv.inc<br>
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc<br>
@@ -2,12 +2,15 @@ require conf/machine/include/riscv/arch-riscv.inc<br>
<br>
=C2=A0DEFAULTTUNE ?=3D &quot;riscv64gc&quot;<br>
<br>
-AVAILTUNES +=3D &quot;riscv64gc riscv32gc riscv64nc riscv64nf riscv32nf&qu=
ot;<br>
+AVAILTUNES +=3D &quot;riscv64gcv riscv64gc riscv32gc riscv64nc riscv64nf r=
iscv32nf&quot;<br>
<br>
=C2=A0# Default<br>
=C2=A0TUNE_FEATURES:tune-riscv64gc :=3D &quot;${@oe.tune.riscv_isa_to_tune(=
&quot;rv64gc&quot;)}&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS:tune-riscv64gc =3D &quot;${TUNE_RISCV_PKGARCH}&qu=
ot;<br>
<br>
+TUNE_FEATURES:tune-riscv64gcv :=3D &quot;${@oe.tune.riscv_isa_to_tune(&quo=
t;rv64gcv&quot;)}&quot;<br>
+PACKAGE_EXTRA_ARCHS:tune-riscv64gcv =3D &quot;${TUNE_RISCV_PKGARCH}&quot;<=
br>
+<br>
=C2=A0TUNE_FEATURES:tune-riscv32 :=3D &quot;${@oe.tune.riscv_isa_to_tune(&q=
uot;rv32gc&quot;)}&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS:tune-riscv32gc =3D &quot;${TUNE_RISCV_PKGARCH}&qu=
ot;<br>
<br></blockquote><div><br></div><div>So riscv32gc has no TUNE_FEATURES and =
riscv32 has no PACKAGE_EXTRA_ARCHS. Nothing later in the series fixes it AF=
AICT. And meta/conf/machine/qemuriscv32.conf:5 still says DEFAULTTUNE ?=3D =
&quot;riscv32&quot;, so qemuriscv32 ends up with an empty PACKAGE_EXTRA_ARC=
HS after this patch.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
-- <br>
2.55.0<br>
<br>
</blockquote></div></div>

--0000000000002e82d1065be00610--

