Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE49C77B7E
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 12:41:04 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.48533.1685364062956356612
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 05:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=W8UkqosY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-30aa1eb95a0so3183082f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 05:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685364061; x=1687956061;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Thihgq4biFmAzJF22SuUeoSQRjGA0ZnwbJvVp4Q7wUo=;
        b=W8UkqosYzlfFjrYiCoFcowY5AbnNFMCee+BSZXpWokqOh2rjDeXxA8CJRuh+M6Exo0
         zjhFv5uEafVNMyA6TpSl2CktDKN13ZQ1KEvyZFZgR/cQ8+iFoaaa5IRCDVHFIw32ubmJ
         uBCkM6xmZIhCSYShK2vz5BZzEV7z6PKtQcURs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685364061; x=1687956061;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Thihgq4biFmAzJF22SuUeoSQRjGA0ZnwbJvVp4Q7wUo=;
        b=eZ2mvCjXeFUPCh6mD83y/kLUj2Hh3BN7Kq1E0h0QwhYohiQ91FFgiw40zzNn9s+vXd
         B2ISflRdK28q+YVzKSJul5ExDzxyTEi43tQBOcvbS8BCHXe9+9nKwiT38Y/hsoMnlpy2
         aG5dN2zMME3MkZ/kLzBD81LFvKCAfHD7xLIUMkWm86SoWVc34nd9UmyiOljm/ZJvCGXy
         Bd5gPfio9i2vv7yQYdP4mc6QnVu10QmygnyIwFaiQwzujPk6SZboJqz9QWDDPzmp2D7T
         dNnEXshHqjbzs/3SaGSGl5UOvFGkjdIWr0z/sZI2j7KnLWvW2L3C/UqIQSjVf57af0rX
         1k9A==
X-Gm-Message-State: AC+VfDy3IP62DNT0m7v4dBZYkvPoMuzNi2pE9JAWvs5FAYRECbHe7FEr
	wrmAagA912TrmASC+ZG8uOyqpjR2/m3VgmE6vLo=
X-Google-Smtp-Source: ACHHUZ7TrqFpuSUV/nzKb0BTBtN5fg48U//2el+iWeoBpo+4v7+SkkLrNf+e+ygVReefi+WDedbjsQ==
X-Received: by 2002:a05:6000:104c:b0:309:4999:7549 with SMTP id c12-20020a056000104c00b0030949997549mr9969138wrx.46.1685364061423;
        Mon, 29 May 2023 05:41:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ec8d:e49e:8d5e:e7d5? ([2001:8b0:aba:5f3c:ec8d:e49e:8d5e:e7d5])
        by smtp.gmail.com with ESMTPSA id c4-20020adfe744000000b003047d5b8817sm13871955wrn.80.2023.05.29.05.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 05:41:01 -0700 (PDT)
Message-ID: <5e1bf6762dd751f6bf5c5e2463fb91da34efe563.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] u-boot: do_compile depends on the value of
 UBOOT_LOCALVERSION
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 29 May 2023 13:41:00 +0100
In-Reply-To: <20230528171515.832179-1-denis@denix.org>
References: <20230528171515.832179-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 12:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181872

On Sun, 2023-05-28 at 17:15 +0000, Denys Dmytriyenko wrote:
> UBOOT_LOCALVERSION is often used to pass SCM commit SHA to the code
> via populating .scmversion file at the start of do_compile(). Let's
> explicitly mark do_compile() as depending on the the value of this
> variable to avoid errors like this:
>=20
> $ echo 'UBOOT_LOCALVERSION =3D "${SRCPV}"' >> conf/local.conf
> $ bitbake u-boot
> Loading cache: 100%
> Loaded 0 entries from dependency cache.
> WARNING: /OE/poky-master/meta/recipes-bsp/u-boot/u-boot_2023.04.bb: Excep=
tion during build_dependencies for do_compile
> WARNING: /OE/poky-master/meta/recipes-bsp/u-boot/u-boot_2023.04.bb: Error=
 during finalise of /OE/poky-master/meta/recipes-bsp/u-boot/u-boot_2023.04.=
bb
> ERROR: ExpansionError during parsing /OE/poky-master/meta/recipes-bsp/u-b=
oot/u-boot_2023.04.bb
> Traceback (most recent call last):
>   File "Var <SRCPV>", line 1, in <module>
>   File "/OE/poky-master/bitbake/lib/bb/fetch2/__init__.py", line 784, in =
get_srcrev(d=3D<bb.data_smart.DataSmart object at 0x7fa0604a7100>, method_n=
ame=3D'sortable_revision'):
>          if not scms:
>     >        raise FetchError("SRCREV was used yet no valid SCM was found=
 in SRC_URI")
>=20
> bb.data_smart.ExpansionError: Failure expanding variable SRCPV, expressio=
n was ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: Fet=
cher failure: SRCREV was used yet no valid SCM was found in SRC_URI
> The variable dependency chain for the failure is: SRCPV -> UBOOT_LOCALVER=
SION -> do_compile
>=20
> ERROR: Parsing halted due to errors, see error messages above
>=20
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot=
/u-boot.inc
> index b3482dcef3..ec8108f5c9 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -23,6 +23,7 @@ PACKAGECONFIG[openssl] =3D ",,openssl-native"
>  # u-boot build system and appended to the u-boot version.  If the .scmve=
rsion
>  # file already exists it will not be overwritten.
>  UBOOT_LOCALVERSION ?=3D ""
> +do_compile[vardepvalue] =3D "${UBOOT_LOCALVERSION}"
> =20
>  require u-boot-configure.inc
> =20

How would I reproduce this?

The fix looks a bit like a workaround and I'd like to understand what
is really going on here.

Cheers,

Richard



