Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9459DC7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 06:32:19 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.2727.1686033138013301019
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 23:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=SyUHghrm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-30d5931d17aso2454232f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 23:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686033136; x=1688625136;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9qiWeclegW81lhhEC37DWPlRwAL/h10zYvh+kat9hI=;
        b=SyUHghrmcjBiXPLtAyk/e2mSoUeJ53QcELGQC80WL8smU03R5hV7ieshFSNqAsjoKs
         AbYsbDuZ3LHqf1t98Ll15MCyQaE16R4vfGZZLhTHRIzwBMVvaLTBMig3Df0edSWl2/ng
         suaj7lWJ1yIXsaBdxRjeLeDEAqpYI0aWvHKEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686033136; x=1688625136;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i9qiWeclegW81lhhEC37DWPlRwAL/h10zYvh+kat9hI=;
        b=K596CJ+KE/LuukZ2/5nhkXkiRx34WYQKtJ0eFio/MICFypqkEmuC3IqRBXHzvyQaTB
         uOB6F9Ui/q0ojlnk2DMQOEEtRYRL1II8NH711wbIprFyJm9VVHE9h+/dsHuRMZ1FZeN2
         ZOIdTgmdMRFL8EK7Qen9NQOoDFc6h4lOC8r5HVQyIYb6YDs1kog9Cpg6WM+p5kzzc4KM
         cighTJulJSGhxNlUY8XiKn6TchKt88usOZOTT5zqsGWXXFo25H00HMG2qJqFnL5W1KaN
         o0eSl/0PY9dTZq2UWX7UaP50tfBGz/GMspfKYZCpdFtv+zo2tcRaNwiSo0F2bJK5ZPjY
         M0Fg==
X-Gm-Message-State: AC+VfDzdj0AFvgeOcggLHxjVIbFgaQG6TcAY6KaMCdXOaz5o8Qoa96xz
	xpk+RGqPMa78yoFXlOAdNU9lfw==
X-Google-Smtp-Source: ACHHUZ64b+zJbJluflPeLqockMIiFi8a0+HFFzYc71zVMS7z15d/JqaNRUYuf3YeyT5Jl2hck/7Zqg==
X-Received: by 2002:a5d:404c:0:b0:30a:b4e1:a89c with SMTP id w12-20020a5d404c000000b0030ab4e1a89cmr844168wrp.66.1686033136213;
        Mon, 05 Jun 2023 23:32:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7f10:3282:4c2:7240? ([2001:8b0:aba:5f3c:7f10:3282:4c2:7240])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c22cd00b003f709a7e46bsm16408488wmg.46.2023.06.05.23.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 23:32:15 -0700 (PDT)
Message-ID: <76fc64335d45702735bf1c168cf67f6af5e2d47c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] fix: reproducible builds for initramfs and
 UKI img
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Frieder Paape <frieder@konvera.io>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 06 Jun 2023 07:32:14 +0100
In-Reply-To: <DB7PR07MB4887C89CABD41DD04CDF9886D34DA@DB7PR07MB4887.eurprd07.prod.outlook.com>
References: 
	<DB7PR07MB4887C89CABD41DD04CDF9886D34DA@DB7PR07MB4887.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 06:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182414

On Mon, 2023-06-05 at 09:00 +0000, Frieder Paape wrote:
> I've encountered issues reproducing initramfs and UKI image builds,
> which will be fixed with this patch.
>=20
> 1. initramfs
> There's a symbolic link to /sbin/init, which is appended to the cpio arch=
ive after creation.
> The links timestamp needs to be static and the cpio append command needs =
the '--reproducible' flag to produce deterministic outcomes.
>=20
> 2. Unified Kernel Image
> '--preserve-dates' is required for a static 'Time/Date' entry.
> I've added '--enable-deterministic-archives' although in my case this
> didn't change anything.
>=20
> Signed-off-by: Frieder Paape <frieder@konvera.io>
> ---
>  meta/classes-recipe/image_types.bbclass       | 5 +++--
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 2 ++
>  2 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recip=
e/image_types.bbclass
> index bbddfaf272..f73b4d965e 100644
> --- a/meta/classes-recipe/image_types.bbclass
> +++ b/meta/classes-recipe/image_types.bbclass
> @@ -148,10 +148,11 @@ IMAGE_CMD:cpio () {
>  		if [ ! -L ${IMAGE_ROOTFS}/init ] && [ ! -e ${IMAGE_ROOTFS}/init ]; the=
n
>  			if [ -L ${IMAGE_ROOTFS}/sbin/init ] || [ -e ${IMAGE_ROOTFS}/sbin/init=
 ]; then
>  				ln -sf /sbin/init ${WORKDIR}/cpio_append/init
> +                                touch -h -r ${IMAGE_ROOTFS}/sbin/init ${=
WORKDIR}/cpio_append/init
>  			else
> -				touch ${WORKDIR}/cpio_append/init
> +                                touch -h -r ${IMAGE_ROOTFS} ${WORKDIR}/c=
pio_append/init
>  			fi
> -			(cd  ${WORKDIR}/cpio_append && echo ./init | cpio -oA -H newc -F ${IM=
GDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
> +			(cd  ${WORKDIR}/cpio_append && echo ./init | cpio --reproducible -oA =
-H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
>  		fi
>  	fi
>  }
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/=
wic/plugins/source/bootimg-efi.py
> index 43c6fd94d9..2bf7375887 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -351,6 +351,8 @@ class BootimgEFIPlugin(SourcePlugin):
> =20
>                  # https://www.freedesktop.org/software/systemd/man/syste=
md-stub.html
>                  objcopy_cmd =3D "%s-objcopy" % target_sys
> +                objcopy_cmd +=3D " --enable-deterministic-archives"
> +                objcopy_cmd +=3D " --preserve-dates"
>                  objcopy_cmd +=3D " --add-section .osrel=3D%s/usr/lib/os-=
release" % staging_dir_host
>                  objcopy_cmd +=3D " --change-section-vma .osrel=3D0x20000=
"
>                  objcopy_cmd +=3D " --add-section .cmdline=3D%s" % cmdlin=
e.name

I like the idea of this and agree it is something we should improve.
Unfortunately it caused testing failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5236/step=
s/14/logs/stdio

oe-selftest -r fitimage.FitImageTests.test_initramfs_bundle

should reproduce.

Cheers,

Richard

