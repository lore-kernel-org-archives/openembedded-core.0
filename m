Return-Path: <nathan@nathanrossi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A1B4C77B75
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 11:44:21 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.9367.1682077454589506434
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Apr 2023 04:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@nathanrossi.com header.s=google header.b=hkuOKNHL;
 spf=pass (domain: nathanrossi.com, ip: 209.85.218.45, mailfrom: nathan@nathanrossi.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-94eff00bcdaso252975866b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 04:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google; t=1682077453; x=1684669453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qo4T/q8o1EnaCGM2i6SVfFMbjsXdV6yfaRfGeMShgsU=;
        b=hkuOKNHL+kgGYG1JIlZ0YDDvfcN5yxWVNz+R6GUbGXhD0Yz3r1mNZl5piajpFF+/Sj
         S/CbSiRef9ZXRk1YTq0Gvtou2FRUASRT/op/FGht1NH2oWdaHEwTc1b/C2P402CGDtk5
         PZGwcNo3IPBVMqOE28klhY1mCNrlI8YYXxsaEW8CnptSDQsmQQjYQyBablgfnx1bnsee
         Lorij5cwlkdiB9fyQRBqDnViwUASnZBtfMmBzQ2f1IktEDV9wQMpLqmrrrzh5wh8G1vy
         RUgAc5w+EgfMXkS9QKvrTCdaR3i74/5U5pd//er6uc9k2RCPfxJ90SL+GCEfnbAA+TOj
         yU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682077453; x=1684669453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qo4T/q8o1EnaCGM2i6SVfFMbjsXdV6yfaRfGeMShgsU=;
        b=Mb8hCHuNKQOxPXSXBXWUsALbVphlQVhgM5oas/67MOm3cl4S4jDvuOi+ciwtzzyEwx
         +GTS60LhXS0q+XC6ADLrYiVq/Gm4XIOlhtssjbUfl9kJ/QDFyHHEkyIcZfDAnSSb1V7d
         SMsPJXCDwy9Nx8IX7BXYUFR3eWP2hjnhZLaGRqb65z0kOR83nXDwpvphyNYFB7SvC/bN
         cXXzlegdiqUthSfT4TYPomIkBbgC/MCLaVoftFl8lVExTZpPHxbKDNV+cC9FfQqDJt+Y
         nDdakcLLWkrx/tgXalG0mEqafRzu0R/KaGVkxKqs55uboGXa/Stc64mDWV1h+yIBDG3k
         ce6Q==
X-Gm-Message-State: AAQBX9fXDJz8rN13gR71EcJ3XkpK3t9o1Htl62Hx2WZx5RJE3YLx0WgI
	UWo2EwmTDomUirJuANRtzsi4wHWvxS1qmx98E7xejQ==
X-Google-Smtp-Source: AKy350YFSKBet/J2vRXPlSWuAnFE8psllO9RJP7BwZCTRL+QuStstbB3kx6E68zeFXmMs8Zt/I1Wzah0AU3BwDogiaI=
X-Received: by 2002:a17:906:1703:b0:8fd:2f01:86c0 with SMTP id
 c3-20020a170906170300b008fd2f0186c0mr2148252eje.2.1682077452969; Fri, 21 Apr
 2023 04:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230421084052.2675963-1-kubiznak@2n.com>
In-Reply-To: <20230421084052.2675963-1-kubiznak@2n.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Fri, 21 Apr 2023 21:44:01 +1000
Message-ID: <CA+aJhH16TxvXisfH=E4LMQJz3UzcqVdAcDpFCVxEZUe5HoKhAg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] devicetree.bbclass: Allow selection of dts
 files to build
To: =?UTF-8?B?UGV0ciBLdWJpesWIw6Fr?= <kubiznak@2n.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 11:44:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180283

On Fri, 21 Apr 2023 at 18:41, Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com> wro=
te:
>
> Add DT_FILES variable to allow the user of the class to select specific
> dts files to build. This is useful for packages featuring dts files
> for multiple machines.
>
> Since many machine configs contain a list of dtb files
> (e.g. KERNEL_DEVICETREE), DT_FILES works with both dts and dtb files.
>
> Signed-off-by: Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com>
> ---
>  meta/classes-recipe/devicetree.bbclass | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe=
/devicetree.bbclass
> index ed2a92e447..8f348f1370 100644
> --- a/meta/classes-recipe/devicetree.bbclass
> +++ b/meta/classes-recipe/devicetree.bbclass
> @@ -53,8 +53,10 @@ KERNEL_INCLUDE ??=3D " \
>
>  DT_INCLUDE[doc] =3D "Search paths to be made available to both the devic=
e tree compiler and preprocessor for inclusion."
>  DT_INCLUDE ?=3D "${DT_FILES_PATH} ${KERNEL_INCLUDE}"
> -DT_FILES_PATH[doc] =3D "Defaults to source directory, can be used to sel=
ect dts files that are not in source (e.g. generated)."
> +DT_FILES_PATH[doc] =3D "Path to the directory containing dts files to bu=
ild. Defaults to source directory."
>  DT_FILES_PATH ?=3D "${S}"
> +DT_FILES[doc] =3D "Space-separated list of dts or dtb files to build. If=
 empty, all dts files are built."

Worth noting in the doc string that DT_FILES paths are relative to
DT_FILES_PATH.

> +DT_FILES ?=3D ""
>
>  DT_PADDING_SIZE[doc] =3D "Size of padding on the device tree blob, used =
as extra space typically for additional properties during boot."
>  DT_PADDING_SIZE ??=3D "0x3000"
> @@ -125,7 +127,10 @@ def devicetree_compile(dtspath, includes, d):
>      subprocess.run(dtcargs, check =3D True, stdout=3Dsubprocess.PIPE, st=
derr=3Dsubprocess.STDOUT)
>
>  python devicetree_do_compile() {
> +    import re
>      includes =3D expand_includes("DT_INCLUDE", d)
> +    dtfiles =3D d.getVar("DT_FILES")

If this populates the variable dtfiles with DT_FILES already split it
can fall back to os.listdir if empty, this avoids the need for the "if
filter..." logic within the loop:

dtfiles =3D d.getVar("DT_FILES").split()
dtfiles =3D [<renaming for dtb> for dtfiles in dtfiles]
for dts in dtfiles or os.listdir(listpath):

> +    filter =3D [ re.sub("dtbo?", "dts", dtfile) for dtfile in dtfiles.sp=
lit() ]

This regex is a bit problematic, it will substitute any part of the
filename and not just the extension suffix. E.g. "test-dtbo.dts" ->
"test-dts.dts". The expression might need to be something similar to
"\.dtbo?$".

I am also curious why you need to handle this mapping of .dtb -> .dts.
Do you have an example recipe that is using this class in this way?
Because the ".dtb" in KERNEL_DEVICETREE is specifically because the
KERNEL_DEVICETREE variable is pointing at kernel makefile targets.

Regards,
Nathan

>      listpath =3D d.getVar("DT_FILES_PATH")
>      for dts in os.listdir(listpath):
>          dtspath =3D os.path.join(listpath, dts)
> @@ -134,6 +139,9 @@ python devicetree_do_compile() {
>                  continue # skip non-.dts files and non-overlay files
>          except:
>              continue # skip if can't determine if overlay
> +        if filter:
> +            if not(dts in filter):
> +                continue # skip if dts not in defined filter
>          devicetree_compile(dtspath, includes, d)
>  }
>
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180281): https://lists.openembedded.org/g/openembedde=
d-core/message/180281
> Mute This Topic: https://lists.openembedded.org/mt/98406619/3616963
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [na=
than@nathanrossi.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

