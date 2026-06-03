Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A19CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 16:22:31 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24101.1780503745987511470
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 09:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nw7k7Z9f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490afc47455so14877375e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 09:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780503744; x=1781108544; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGzxCRn3/uKGGyJX0TcKgBebWsvBtbwcdVskHS7XPA8=;
        b=Nw7k7Z9fbWLIi6+6oAfWeI6BOAo9TNCvz01pUuwnvMi5r/XvpUPd2Z/NlBFgVxDcTt
         5hSkPUSqa+F10NFf3LK75jcYyHU7t5TME4OyKUeBgrIOcey9Vhz95MewFxWbcRDwwN+x
         Us4Jd+8tH5VR0lz4ULA01Dn//xAuLJGS7eV0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780503744; x=1781108544;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MGzxCRn3/uKGGyJX0TcKgBebWsvBtbwcdVskHS7XPA8=;
        b=XZppP1BeOLLhpWv1bNb84BP4D+zOYwkt7+VAQKUQtuNUQlmVn0moGzF3gMlyWUzC6y
         zVTDkZ9YTfxGWnVoyAgyEmeJq5xmGC8Y4k2Xdwl/P9mqq3xFMqUcOZld/D8Gwx/fv9gf
         KTSXTIpSjxTwk6tP+D6P/QnFAJ84AvPlOVTm5+sx9kCrZq120EaPYkJ4unKC/6dquJKZ
         LCbJWCtigwyqRVmPtuJkHLBzeCZbldXdca+hxTbulAsX9bmSjDxS7LofbOBfSaqpixv8
         4m+1Rmz71a4edcAE7nZPB8RchKwpEvtAFq8cxibIUrONRMXApBMonvt4wcPsoSgIcuV1
         /DaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8BV6jcxof5EK65UWVGNTwhg7Bor4TJze7xwS9jZ5re1GuFgWCYAR0d3AMUx/X7srHtonTZ0PY3WHz93Tv/hU+yNA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxjhkwEcldIlkJoluDSvAnFpcTcPK2RXjiNg0ZM3PLgLCcc+KlM
	ZkVpcwTz+jRCB4Ijej5H4m0erSmQmulr2vxsem4fqiHs3qugzcqInPSF6LNGn8px8tU=
X-Gm-Gg: Acq92OEPg70LaY8j3hJCFCVp/lJ2RbT08/NfpskDZEF9TUqtAeK3tqLMS5zcF+zz4jR
	lUxb77xKcSorFGhC2dcXV5/pWi3heUWhzWUUzxX4JWtJclXP6749QBzf0zU8xAusYfUpyEsTwod
	gY8e1pXd7f/VgqAsWl4ClcSeuF8n5F0y2Qe+jIpeykzDR9j92E1CaF5gl5BmSyfMhYr0EbAXMey
	3yDf1gscihF84sGLSrKq3NXpStx+Vn06b9LLx1Uu/rZ4dFj5ADcLdei+RBcEUgPmgqx3Ll0IYaR
	Y/6wx+RnlGHY0nrZL8x0jC8YWGi00B2UIjYfCXOxVywJJfFHRHZfLnHDvDu8F3O1XwYrABqXH4w
	k7hbZFRHDPtX4oYTCtH8LTWTjGkXHd16URIX/oNgOfONgjG/BMhrVsZ79dQgpxzk4uR56qlkGhB
	ycVG7bVMW0/TR8AEuvcxa3GCyqX6ilEKPxywOT4M0YazaFMiG1exq2kXOYqSQirBIHGcIhdNIOQ
	ChlSGkBm6+IG8KZ/Chx+VOe
X-Received: by 2002:a05:600c:5288:b0:490:5191:6e26 with SMTP id 5b1f17b1804b1-490b5ecbd41mr68143425e9.18.1780503744275;
        Wed, 03 Jun 2026 09:22:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:202c:df88:9261:8b8? ([2001:8b0:aba:5f3c:202c:df88:9261:8b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc391aaasm4556635e9.1.2026.06.03.09.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 09:22:23 -0700 (PDT)
Message-ID: <60c5fe270fc9834e2472b01cd80362cd9b0f5189.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel-fit-image: skip sstate creation for
 deploy
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tafil@tafhub.de, openembedded-core@lists.openembedded.org
Date: Wed, 03 Jun 2026 17:22:22 +0100
In-Reply-To: <20260603152328.48500-1-tafil@tafhub.de>
References: <20260603152328.48500-1-tafil@tafhub.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 16:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238102

On Wed, 2026-06-03 at 17:23 +0200, Tafil Avdyli via lists.openembedded.org =
wrote:
> When building completely from sstate (e.g. in pipeline), the
> linux-yocto-fitimage recipe deploys from sstate even if the
> INITRAMFS_IMAGE requires a rebuild.
>=20
> Using dm-verity or verity image classes, the initramfs image must be
> rebuilt after the rootfs. However, linux-yocto-fitimage:do_build was
> skipped and went straight for do_deploy from sstate and deployed a
> fitImage with an outdated initramfs with old roothash data while the
> image and INITRAMFS_IMAGE were being built.
>=20
> Skipping the do_deploy task in a sstate only build, successfully
> triggers linux-yocto-fitimage:do_build after
> INITRAMFS_IMAGE:do_image_complete.
> This also follows fitimage.bbclass[1] from meta-oe.
>=20
> [1]: https://git.openembedded.org/meta-openembedded/tree/meta-oe/classes/=
fitimage.bbclass?h=3Dwrynose#n522
>=20
> Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
> ---
> =C2=A0meta/classes-recipe/kernel-fit-image.bbclass | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-=
recipe/kernel-fit-image.bbclass
> index ae8f3c6688..03272bab51 100644
> --- a/meta/classes-recipe/kernel-fit-image.bbclass
> +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> @@ -241,3 +241,4 @@ do_deploy() {
> =C2=A0=C2=A0=C2=A0=C2=A0 fi
> =C2=A0}
> =C2=A0addtask deploy after do_compile before do_build
> +SSTATE_SKIP_CREATION:task-deploy =3D "1"

This is a workaround, it sounds like there is a missing dependency
somewhere to trigger the build needed?

Cheers,

Richard

