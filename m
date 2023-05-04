Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592BDC7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 11:38:16 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.47125.1683200289115673846
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 04:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=fboCGWKe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f1958d3a53so3926595e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 04:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683200287; x=1685792287;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cf5q5knVCHpb0DdDs5o0smZzpga9LwVajocFkRdGb6I=;
        b=fboCGWKeemMSbdOjFFyZWunZn635TfwqRNQtaxTAZT28d+X3f+OtWqEAOnLkS3tVN8
         eY+58W7YfP4/pDQRiZ8mcjlkHXEqSpZSlibIB3piuCJe6lSe2Od+mkdaXXS7mOsDSm+Z
         CgMb2bB2Bjo9nxBOAJoi5pAU6/EadEVxuFp8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683200287; x=1685792287;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cf5q5knVCHpb0DdDs5o0smZzpga9LwVajocFkRdGb6I=;
        b=a1G9+q9DT2Lz6MRVLv/aNBtsLo4vb1Zb4mGqO1hE8eEeDR1bfQjJNE3m85Dm6S7P/e
         kba5RptOjA8SIJfmmZULIDLccZMnai/shyqhxV+OW0cEo8XGiYd4aGgvmzOO9h9QBWq/
         y1xy5j4LepzcSWHOKj7xUkL5vusZ7oPsqyChxmVaq6tM4/9NycRDRG3j9SaKwKrOdWFZ
         oHlW0CS8AF2WwWx/mQ7aRMz8ckS3tEPHZog3hKv4+2PZDyJj9asW48tRu1zqdVDxIZdB
         sq8F4zyvaI0/4ALghrnRHz2svEQoJuTe1iiyUQXDaWutihreAyqcdgCa/MkTnp7CX8Ga
         a2Bw==
X-Gm-Message-State: AC+VfDyYcQM60lGpDbtl+ZUWxw0msmsUCHVyT0AU4+pubHl+z1YEB50K
	KLECM54SrL+AkGhcsOlSdfMnmQ==
X-Google-Smtp-Source: ACHHUZ7lfJV1yX6Ks36diPQSRf4PtPDAGoU/GSyxx0JxIrM/F8GSLkMOciHEaf8mKT6iE1LqRQuI0w==
X-Received: by 2002:adf:e54e:0:b0:306:42e2:5ec3 with SMTP id z14-20020adfe54e000000b0030642e25ec3mr2456464wrm.6.1683200287518;
        Thu, 04 May 2023 04:38:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6749:5fda:5dc0:e535? ([2001:8b0:aba:5f3c:6749:5fda:5dc0:e535])
        by smtp.gmail.com with ESMTPSA id c3-20020a7bc843000000b003f31d44f0cbsm4675031wml.29.2023.05.04.04.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 04:38:07 -0700 (PDT)
Message-ID: <2826abbfbfb636f23354faddf7d35def35a7dc13.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v4] devicetree.bbclass: Allow selection of dts
 files to build
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr =?UTF-8?Q?Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>, 
	openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Date: Thu, 04 May 2023 12:38:06 +0100
In-Reply-To: <20230426072204.3255437-1-kubiznak@2n.com>
References: <20230426072204.3255437-1-kubiznak@2n.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 11:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180865

On Wed, 2023-04-26 at 09:22 +0200, Petr Kubiz=C5=88=C3=A1k wrote:
> Add DT_FILES variable to allow the user of the class to select specific
> dts files to build. This is useful for packages featuring dts files
> for multiple machines.
>=20
> To make DT_FILES consistent with KERNEL_DEVICETREE, the list works
> with both dts and dtb files.
>=20
> Signed-off-by: Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com>
> ---
>  meta/classes-recipe/devicetree.bbclass | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe=
/devicetree.bbclass
> index ed2a92e447..bd50d7fa1d 100644
> --- a/meta/classes-recipe/devicetree.bbclass
> +++ b/meta/classes-recipe/devicetree.bbclass
> @@ -53,8 +53,10 @@ KERNEL_INCLUDE ??=3D " \
> =20
>  DT_INCLUDE[doc] =3D "Search paths to be made available to both the devic=
e tree compiler and preprocessor for inclusion."
>  DT_INCLUDE ?=3D "${DT_FILES_PATH} ${KERNEL_INCLUDE}"
> -DT_FILES_PATH[doc] =3D "Defaults to source directory, can be used to sel=
ect dts files that are not in source (e.g. generated)."
> +DT_FILES_PATH[doc] =3D "Path to the directory containing dts files to bu=
ild. Defaults to source directory."
>  DT_FILES_PATH ?=3D "${S}"
> +DT_FILES[doc] =3D "Space-separated list of dts or dtb files (relative to=
 DT_FILES_PATH) to build. If empty, all dts files are built."
> +DT_FILES ?=3D ""
> =20
>  DT_PADDING_SIZE[doc] =3D "Size of padding on the device tree blob, used =
as extra space typically for additional properties during boot."
>  DT_PADDING_SIZE ??=3D "0x3000"
> @@ -125,9 +127,12 @@ def devicetree_compile(dtspath, includes, d):
>      subprocess.run(dtcargs, check =3D True, stdout=3Dsubprocess.PIPE, st=
derr=3Dsubprocess.STDOUT)
> =20
>  python devicetree_do_compile() {
> +    import re
>      includes =3D expand_includes("DT_INCLUDE", d)
> +    dtfiles =3D d.getVar("DT_FILES").split()
> +    dtfiles =3D [ re.sub(r"\.dtbo?$", ".dts", dtfile) for dtfile in dtfi=
les ]
>      listpath =3D d.getVar("DT_FILES_PATH")
> -    for dts in os.listdir(listpath):
> +    for dts in dtfiles or os.listdir(listpath):
>          dtspath =3D os.path.join(listpath, dts)
>          try:
>              if not(os.path.isfile(dtspath)) or not(dts.endswith(".dts") =
or devicetree_source_is_overlay(dtspath)):

I've taken this but could you send a patch to the documentation to add
this variable to the glossary and to the devicetree class section
please?

Thanks,

Richard

