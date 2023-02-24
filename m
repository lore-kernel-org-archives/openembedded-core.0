Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2075FC77B71
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 16:05:31 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.21491.1677254724970886718
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 08:05:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aq8K4vr0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id l1so14142183wry.10
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 08:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfxTjF9P7ecGUXJTpEtYXVj02PSq/nk7CjjR1a0uHnw=;
        b=aq8K4vr0ViLjudjGJIWZLd4wpIqaIsecWKJjrF1ydSnVQ+VDu9uoVMTbKdhMaW+Ttq
         vsh8kWOGCa3G5vYzSXzfKPboniXfmjkeBOBNIS7DNBPMpixjdLk6pbpRvtEDQOqmVG6p
         4+hIl9q0z/eccMRe2jx5XbCC7HHNc3LRhLmtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bfxTjF9P7ecGUXJTpEtYXVj02PSq/nk7CjjR1a0uHnw=;
        b=wUsqp+cFcNQMvf2a+nSbqOH+9EAE4HyU5tJfaZ4geJTonhlMf8d025914N+fgiDfzM
         XqfIZr2wYJ34VoaTKhmD1rT0+y+2emrDIzkSj7UEvJtonBe3aA674/iKNwfCuqTsZ1wq
         VKl8EiyO+YNZKBnnD5E031Kxm5wpiVUak/DNc7xuFueWBMAwiVgPcO1ErEQQ2RyzFaNU
         pUYGh455XYuTwTVrPs5WdicMDaUQZ1keWbuSr6mIc/u5RzAkeIZW97UBvZ5FaQTTBw6k
         MbyXjEqFNJyaUARuXw3AqvaxvhsdLW24F7t20bAJMyj8JV3jUS9yJOjdG1hws0J8jPxY
         OBhw==
X-Gm-Message-State: AO0yUKUJRIuejVg0HNJx0X6Zvp0zCr4LsHDjPSloR1gP9eHKKTvj64Qi
	qbIZrYLNZhmxHsuGyL3nb/+1+qvIPNvEnXH0
X-Google-Smtp-Source: AK7set914Yqk7LZhK7ZiesiPcGyrlFOXIhwBxk0/tm50g8ly37mcVzfV/dbSfnCDJZx7i/K+di1+Pw==
X-Received: by 2002:a5d:64aa:0:b0:2c3:f0a6:43ee with SMTP id m10-20020a5d64aa000000b002c3f0a643eemr188320wrp.20.1677254723289;
        Fri, 24 Feb 2023 08:05:23 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7? ([2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7])
        by smtp.gmail.com with ESMTPSA id u16-20020a05600c441000b003eafc47eb09sm3217813wmn.43.2023.02.24.08.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 08:05:22 -0800 (PST)
Message-ID: <eb51a596433feb6d1e7c80584adce82f4503339b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 03/11] build-appliance-image: add support for
 qemu
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2023 16:05:22 +0000
In-Reply-To: <20230221204445.23931-4-twoerner@gmail.com>
References: <20230221204445.23931-1-twoerner@gmail.com>
	 <20230221204445.23931-4-twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 16:05:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177690

On Tue, 2023-02-21 at 15:44 -0500, Trevor Woerner wrote:
> Add ext4 explicitly to the list of IMAGE_FSTYPES so the build appliance c=
an be
> run with runqemu.
>=20
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/recipes-core/images/build-appliance-image_15.0.0.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/m=
eta/recipes-core/images/build-appliance-image_15.0.0.bb
> index 064e7a1ed82f..e28096758b9b 100644
> --- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> +++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "An image containing the build system itself"
> -DESCRIPTION =3D "An image containing the build system that you can boot =
and run using either VirtualBox, VMware Player or VMware Workstation."
> +DESCRIPTION =3D "An image containing the build system that you can boot =
and run using any of qemu, VirtualBox, VMware Player or VMware Workstation.=
"
>  HOMEPAGE =3D "http://www.yoctoproject.org/documentation/build-appliance"
> =20
>  LICENSE =3D "MIT"
> @@ -20,7 +20,7 @@ IMAGE_ROOTFS_EXTRA_SPACE =3D "41943040"
>  APPEND +=3D "rootfstype=3Dext4 quiet"
> =20
>  DEPENDS =3D "zip-native python3-pip-native"
> -IMAGE_FSTYPES =3D "wic.vmdk wic.vhd wic.vhdx"
> +IMAGE_FSTYPES =3D "ext4 wic.vmdk wic.vhd wic.vhdx"
> =20
>  inherit core-image setuptools3
> =20

I've held off this one since whilst it isn't wrong as such, the ext
images aren't exactly optimal. I think our hope was that we could use
the vmdk or vhdx images with qemu instead and then directly test the
ones we publicly share. Do you know if that could work? It may then
mean people don't need to handle multiple files too?

Cheers,

Richard




