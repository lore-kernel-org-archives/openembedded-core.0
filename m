Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3294AC61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 12:42:30 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.9038.1676551348433753862
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 04:42:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d4GGsbT7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id m20-20020a05600c3b1400b003e1e754657aso4085056wms.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 04:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ixmZFfH2cXrk4TLZ3ZP2rtgbG7P8bCM6Xzx/PWHDDz8=;
        b=d4GGsbT7AqNwbB2AXiRVoKZG37VDZoqE8z8aMrV8JTFz1BM7GlSL6iOq9Py6QoHN6i
         GA/Z7Me5VzrBV7Tg6dFUmTYvdCJqY73YCx5Jtr+sYM6sMV1pHGWlxzIhPD0sTqFp4I9p
         7r9s1INI48wkoqmEh9QRoMI8H4JY/eoMM7LMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ixmZFfH2cXrk4TLZ3ZP2rtgbG7P8bCM6Xzx/PWHDDz8=;
        b=Na8JTV9eirgthfIeTlPrv5oekxgaUdzE79tO0CaSKiL7Q1xA16cfq1+zbZGnSuUdNW
         TFxDax3FbBRIqwPxA8ueBAb+JlT//8TK3LNxLQDpPlaYpuZOgQG8+BUe9Wr/ayCm3qlI
         c+frWMbDDMn/e7cJIjsTZ46kpoLtEOC9BZoJ2kqvMkwhgNjzgduz3K4PJvIRO1H/jQIK
         LPxDAaZi3c0I34HE4rPoOUHBAH+h4isNKLmaAdIPZi16CQ7dizMy8oN3blIgnT5pRk0+
         cae+BoureFvpJv+MYJofSzraA/eR61J1hmSXL0w72Z1w1gULh5Ep0/JwSam50pfGL1Fk
         A6iQ==
X-Gm-Message-State: AO0yUKUjma7bHwafjQ8VBHQN6CF1LKKJ4VXpJ+AMHLG90hxoTCkHXkgV
	yBDRhtCpZJSBK6NWo1Nh8z2jNg==
X-Google-Smtp-Source: AK7set+ATIsHdVkdXD5F+b41hsOLf45rcgNh7dVKHJ+rs50AN91xloOuJI8s2YeynQNDyFUSeYYJmw==
X-Received: by 2002:a05:600c:1987:b0:3dc:52fc:7f06 with SMTP id t7-20020a05600c198700b003dc52fc7f06mr4711344wmq.41.1676551346602;
        Thu, 16 Feb 2023 04:42:26 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d39a:5560:699e:2da6? ([2001:8b0:aba:5f3c:d39a:5560:699e:2da6])
        by smtp.gmail.com with ESMTPSA id hn30-20020a05600ca39e00b003db03725e86sm1618396wmb.8.2023.02.16.04.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:42:26 -0800 (PST)
Message-ID: <e5864a794c05bea8639b7e309d957508cce9bc2e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] wic: Fix populating of IMAGE_EFI_BOOT_FILES
 with uefi-kernel
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pavel Zhukov <pavel@zhukoff.net>, 
	openembedded-core@lists.openembedded.org
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Thu, 16 Feb 2023 12:42:25 +0000
In-Reply-To: <20230216122338.17270-1-pavel@zhukoff.net>
References: <20230216122338.17270-1-pavel@zhukoff.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 12:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177287

On Thu, 2023-02-16 at 13:23 +0100, Pavel Zhukov wrote:
> wic plugin crashed if IMAGE_EFI_BOOT_FILES is not empty and uefi-kernel
> loader specified because of preliminary return from the function.
> [Yocto #15033]
> Fixes:
> >   File "/mnt/builds/yocto/sources/scripts/lib/wic/plugins/source/bootim=
g-efi.py", line 371, in do_prepare_partition
> >     for src_path, dst_path in cls.install_task:
> >                               ^^^^^^^^^^^^^^^^
> > AttributeError: type object 'BootimgEFIPlugin' has no attribute 'instal=
l_task'. Did you mean: 'do_install_disk'?
>=20
> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/=
wic/plugins/source/bootimg-efi.py
> index 4b00913a70..d6aeab2aad 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -221,7 +221,7 @@ class BootimgEFIPlugin(SourcePlugin):
>              elif source_params['loader'] =3D=3D 'systemd-boot':
>                  cls.do_configure_systemdboot(hdddir, creator, cr_workdir=
, source_params)
>              elif source_params['loader'] =3D=3D 'uefi-kernel':
> -                return
> +                pass
>              else:
>                  raise WicError("unrecognized bootimg-efi loader: %s" % s=
ource_params['loader'])
>          except KeyError:

Thanks for finding that!

Is there some way we should be tweaking the wic tests to avoid this
regressing in future?

Cheers,

Richard

