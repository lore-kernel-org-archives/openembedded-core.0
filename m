Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD4BC00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 14:51:31 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.7962.1659711084734677332
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 07:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=I7wvg9CT;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1659711085;
  x=1691247085;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=2JspA+Q1udVtY5Ks95YTlW4CbDbkCiX+N5tQKn6jSvM=;
  b=I7wvg9CTPpsraiZ3k9xoQdMsjAmw2Hwwvq2e66ommyT7V6ZAjfTGZv+w
   03f6s79D3KOjzDdb3Fu6yA6Wnb23nGHEq12uHNVYp26mfbg/lhnoU++5b
   nFA2uyHxgFtWulwyLuJEblHFdJrxFliBvtaOs7MQdUrNzCGNhPy5f1EfT
   q6QZGPmFNaRgA8xEtQ3fwbwxmMvKOmeZdUffo6vxZ2B2ss6uOj5syiRlK
   wBYzAiLokhsmKlUR/OGTMWNaml0t1LfyxgSXp+FvKiT/NG5K85hyXUrKa
   NfyP+5Ayj3jRuXa1u86o+YG+1OzPtDjKHmTCAFVX8itcCgPqmbrbY/zck
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 18/29] rust-llvm: Enable nativesdk variant
Thread-Topic: [OE-core] [PATCH 18/29] rust-llvm: Enable nativesdk variant
Thread-Index: AQHYqM2Sx6Ix7jK+ikavNY+v9Lk+o62gY7Mw
Date: Fri, 5 Aug 2022 14:51:22 +0000
Message-ID: <ac705b7308ce4dc388c5021d03f11e9d@axis.com>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
 <20220805131252.3706794-18-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220805131252.3706794-18-richard.purdie@linuxfoundation.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 14:51:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168967

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie
> Sent: den 5 augusti 2022 15:13
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 18/29] rust-llvm: Enable nativesdk variant
>=20
> The allow nativesdk variants of the tools to build, enable a nativesdk

Typo: "The allow" -> "To allow"

> variant of rust-llvm.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/rust/rust-llvm.inc | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/rust/rust-llvm.inc b/meta/recipes-devt=
ools/rust/rust-llvm.inc
> index 9baad12dc8e..625eb570416 100644
> --- a/meta/recipes-devtools/rust/rust-llvm.inc
> +++ b/meta/recipes-devtools/rust/rust-llvm.inc
> @@ -47,6 +47,13 @@ EXTRA_OECMAKE:append:class-target =3D "\
>      -DLLVM_CONFIG_PATH=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-con=
fig \
>  "
>=20
> +EXTRA_OECMAKE:append:class-nativesdk =3D "\
> +    -DCMAKE_CROSSCOMPILING:BOOL=3DON \
> +    -DLLVM_BUILD_TOOLS=3DOFF \
> +    -DLLVM_TABLEGEN=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen=
 \
> +    -DLLVM_CONFIG_PATH=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-con=
fig \
> +"
> +
>  # The debug symbols are huge here (>2GB) so suppress them since they
>  # provide almost no value. If you really need them then override this
>  INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> @@ -68,4 +75,4 @@ FILES:${PN}-staticdev =3D+ "${libdir}/llvm-rust/*/*.a"
>  FILES:${PN} +=3D "${libdir}/libLLVM*.so.* ${libdir}/llvm-rust/lib/*.so.*=
 ${libdir}/llvm-rust/bin"
>  FILES:${PN}-dev +=3D "${datadir}/llvm ${libdir}/llvm-rust/lib/*.so ${lib=
dir}/llvm-rust/include ${libdir}/llvm-rust/share ${libdir}/llvm-rust/lib/cm=
ake"
>=20
> -BBCLASSEXTEND =3D "native"
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1

//Peter


