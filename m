Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E388C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 13:49:46 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92537.1782740979839342139
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 06:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lX+XTxjV;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-664f0a76a74so451935d50.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 06:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782740979; cv=none;
        d=google.com; s=arc-20260327;
        b=l99HWR3yADuCXdQjFCqZvBpzk2vGO1sXwlp6Dm7HSS4mU19CpIdwq7Fs7Ao7KWcMzS
         ykyWXge+5vOUJXYjM+qHzekQ+FO7zjoquujptpA7Y0VEPKv2RP5H+6rr3y5zANju1T1E
         eq0lBJLFG/ntl/1tZfPGTz60qf5/JiQfeEti1ipzlDha5SWpMv/D+8TSa0anywgrbJDQ
         Vy5KJpGQMV+PaL1sg0ZJxJVMk0HazCmINQreQuFKLnjDfsUCkzOCq84u77q0qegACXqV
         PaQ93c0s73JLA06Azwp5UHMTm5IUiOJA0yQVEjoKmmoghDPVNVD/gKQ0cl29ne0rnVwL
         UZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Iro27UIJgQTkSRHa3Atn7zqwej1W4cD2YUXpAUqUgJM=;
        fh=SrlRS7oOP3jU3GVCj/08LnTUcPkwFGHIQ4rihm6Gv2s=;
        b=aGPXA77VjyV4c9ldoheSpvrY4mw6rXKpXUD4iiBzGjDf2m0tZm/Z1z3qeYToSQPfD2
         /8RmzWvNiwRyu+CRFi9xMeIksrImbaeJRiBktqKoHWyT6pVMg8innPlKXl0hNbEXVZcn
         rzcI/N2GpPtKSTbp8dXriA3U/WY8cGM5PtJd7Zm3wUuS+xZt709D6TVWBe1aQJlxIO6f
         C380uxjcpzMzAaafZV8o1hRQXWTXMGiMWdc4vEL2Ba2YQVUqbKwU9ITS0Ddzgf/BQ1BU
         3SWurU2OmEatiSwpdMb5Z2dReYTnxNB2b15JJzxVtxipfSVF/OeQfsGlzHmTWWE47unt
         6ODw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782740979; x=1783345779; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Iro27UIJgQTkSRHa3Atn7zqwej1W4cD2YUXpAUqUgJM=;
        b=lX+XTxjViT8cevJFoqYDTbCcGJHMVP+NJaIaotDM+LZyQy6waA06PZlkn+0SQ19za4
         Q6ouWbTcyK3oyjMRwW5wYWT6dSo2HbHSYXGik5mm/yXy0o1zWP6NqkF0gTKABgLr3shf
         LJyUb0vwk0cT/I04hwgjv5KSIX+AAgIstVcHm12NGol6TscbVRvu6Qzj4285V/9Y0chO
         L94IlevmpmO1ojWzZcrxrSBZARG8WqWGE3wvO2u6CeIuuTDnTGlho44SlEBH0esLVpce
         ld7YQRh1Nj9Pc9wr88gtQVzxDN3oXkz34exWvm3tBMSTY5tVxA20wOEHCnChHsc+oQDo
         CIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782740979; x=1783345779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iro27UIJgQTkSRHa3Atn7zqwej1W4cD2YUXpAUqUgJM=;
        b=rsk162EcAQkxC3teuAESPC1tylnMp5tuS7AzPB0j+Ea9Lh5seIq8/IrC8nlKihbYhn
         TsWGBaXvL/Qcm2Ba9kQakVAbcdr0PHqN9N2s0uu0b8MBWe/sLtAYrRplhNbhtUUULtp4
         abLqTP/x8/Bn9wEmif9KqDH7CZpcUV0suqITURvO5vulfCkwlrHdu78AMBeqHQ+eHnm8
         2rarxXno6Mg5OxbJnWqpu8d2yj08eE6SeHu/Ceu6WgvyAHXwwS06KA7Da2f/olG7ny1T
         cC6FPY0Z7gIGCYyZOEbdkcge+6i9Z6b0pZYRFLcm99A7NH9u9g/+kKjheWXRG9y2U7+F
         +qLg==
X-Gm-Message-State: AOJu0YzOPeuHHlujsekUgH/ZWPm7slWdTloOWdFQXD6euSKRh/XfmH1F
	TyCZlIP6TQEpYm/dQ7J8linI4kOkzs7W1RnbTAFgf1itl/hx1xaH6Bz/yM0erTdazvwNNa+sZ0c
	GyyF1HmiBngWI6SLsVDT+ukm99Y9s/hc=
X-Gm-Gg: AfdE7ckgAuL4jvRzBPhzLI1HoId+ejJZJhPK3EviAbUzXD56zZszVtC2xZv6po/YcnJ
	VCiwHrMg9XiQ0g1AV7ig0OQkwa3QU57xFYCvS3gmtFIGdBcDlPgH2frXw9SMKr1c8c+YkUDvveO
	fTwSTZno0ygKD8XUw2D1tg4HQ8A1Y2oXhm0GYvMHBBsBM38c4nqQnQi8rIK9Y5cnoV8jX2p490/
	7FTjJNFk9EG/lcDFGNTFiNJqU3sBNPFQZ/TAid6QofpAZD8uT7ayJq3NLxxovCYqWYDdm05/J2a
	RKPK+aXzt/4Lo3tcADnBCf0nIXnbcHjjThkRXEZMVT7h+zpFOgxHqUK243Y8SaQF6A8W/cho0uV
	e1GsU4y2edgbuIfYoLYxoe1nskgFng2p/CAblw3MR74DIZb9ZYQSThqeQ1fPMK/98CI0c6A==
X-Received: by 2002:a53:b98d:0:b0:664:ae6d:ad3a with SMTP id
 956f58d0204a3-664ae6daf43mr6891716d50.84.1782740978676; Mon, 29 Jun 2026
 06:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260629122310.542373-1-joaomarcos.costa@bootlin.com>
In-Reply-To: <20260629122310.542373-1-joaomarcos.costa@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Jun 2026 06:49:27 -0700
X-Gm-Features: AVVi8CfSbgcuFeoTB9XioA0Um5nnE2abe441z6PV-QlfXXW8FQJbpOKFFtU4NI4
Message-ID: <CAMKF1sqHFLskkPo_+-ofey7LssZDHWfGNVQqTSo18DL1UQZsnw@mail.gmail.com>
Subject: Re: [PATCH] webkitgtk: allow usign clang to compile for arm target
To: =?UTF-8?Q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000c2b936065564ba7a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 13:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239783

--000000000000c2b936065564ba7a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks good

On Mon, Jun 29, 2026, 5:23=E2=80=AFAM Jo=C3=A3o Marcos Costa <
joaomarcos.costa@bootlin.com> wrote:

> This commit reverts:
> be459bf17d: "webkitgtk: Use gcc to compile for arm target"
>
> The issue #132322 [1] was resolved, and the corresponding fix [2] is
> available in LLVM's v22.1.8 (currently used in oe-core master). It is
> actually available since v22.1.0.
>
> [1] https://github.com/llvm/llvm-project/issues/132322
> [2] https://github.com/llvm/llvm-project/commit/5e803587eee0
>
> I tested it with MACHINE=3D"qemuarm", and it builds correctly.
>
> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.50.6.bb | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb
> index 5d2c970b29..0cfeaf9ae7 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb
> @@ -172,9 +172,6 @@ src_package_preprocess () {
>              ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
>  }
>
> -# Clang-20 issue - https://github.com/llvm/llvm-project/issues/132322
> -TOOLCHAIN:arm
> <https://github.com/llvm/llvm-project/issues/132322-TOOLCHAIN:arm> =3D "g=
cc"
> -
>  # Pass -g1 to massively reduce the size of the
>  # debug symbols (4.3GB to 700M at time of writing)
>  # workaround error:
> --
> 2.47.0
>
>

--000000000000c2b936065564ba7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Looks good</div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 29, 2026, 5:2=
3=E2=80=AFAM Jo=C3=A3o Marcos Costa &lt;<a href=3D"mailto:joaomarcos.costa@=
bootlin.com">joaomarcos.costa@bootlin.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">This commit reverts:<br>
be459bf17d: &quot;webkitgtk: Use gcc to compile for arm target&quot;<br>
<br>
The issue #132322 [1] was resolved, and the corresponding fix [2] is<br>
available in LLVM&#39;s v22.1.8 (currently used in oe-core master). It is<b=
r>
actually available since v22.1.0.<br>
<br>
[1] <a href=3D"https://github.com/llvm/llvm-project/issues/132322" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://github.com/llvm/llvm-projec=
t/issues/132322</a><br>
[2] <a href=3D"https://github.com/llvm/llvm-project/commit/5e803587eee0" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/llvm/llvm-=
project/commit/5e803587eee0</a><br>
<br>
I tested it with MACHINE=3D&quot;qemuarm&quot;, and it builds correctly.<br=
>
<br>
Signed-off-by: Jo=C3=A3o Marcos Costa &lt;<a href=3D"mailto:joaomarcos.cost=
a@bootlin.com" target=3D"_blank" rel=3D"noreferrer">joaomarcos.costa@bootli=
n.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.50.6.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">webkitgtk_2.50.6.bb</a> | 3 --=
-<br>
=C2=A01 file changed, 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.50.6.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">webkitgtk_2.50.6.bb</a> b=
/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.50.6.bb" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">webkitgtk_2.50.6.bb</a><br>
index 5d2c970b29..0cfeaf9ae7 100644<br>
--- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.50.6.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">webkitgtk_2.50.6.bb</a><br>
+++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.50.6.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">webkitgtk_2.50.6.bb</a><br>
@@ -172,9 +172,6 @@ src_package_preprocess () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${B}/WebKitGTK/DerivedSourc=
es/webkit/*.cpp<br>
=C2=A0}<br>
<br>
-# Clang-20 issue - <a href=3D"https://github.com/llvm/llvm-project/issues/=
132322-TOOLCHAIN:arm" rel=3D"noreferrer noreferrer" target=3D"_blank">https=
://github.com/llvm/llvm-project/issues/132322<br>
-TOOLCHAIN:arm</a> =3D &quot;gcc&quot;<br>
-<br>
=C2=A0# Pass -g1 to massively reduce the size of the<br>
=C2=A0# debug symbols (4.3GB to 700M at time of writing)<br>
=C2=A0# workaround error:<br>
-- <br>
2.47.0<br>
<br>
</blockquote></div>

--000000000000c2b936065564ba7a--

