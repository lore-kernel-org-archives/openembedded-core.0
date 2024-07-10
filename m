Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BE1C3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:46:30 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.10293.1720604786901714916
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BOHm8e+E;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-36798779d75so5297851f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 02:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720604785; x=1721209585; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AhKhB4PvQYxhl8XTlJ6IWmpdLrAFTbV6MAToRiYHOA=;
        b=BOHm8e+EeJLBB9wZWqQalJbzOj8zt59JztUer7ja8OTlxeHHjI1q+rIGxTn743mgtR
         +OB6IWXOC+6gzy0BGbTk6RJUhPL/kGx7KAo7OiJ1CFELlXbijBkPiqkebjEyUBg/LA2f
         pjsGQost71aqA6biElC7Tqt0uemKalMI1afjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720604785; x=1721209585;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/AhKhB4PvQYxhl8XTlJ6IWmpdLrAFTbV6MAToRiYHOA=;
        b=kbXu1wfgt4MEq7CDQqGSndOyKIhHntO+H0qa8pfclR3WYAOMpTvZdRbDmzrVF1MU3Z
         WSOOP222BkywL8U17z6C+aWDs/mCKONpFNrPg0mppwV/L2yF9zoA3uXFsXmSrqgQ5ewz
         x6MuTpAobFcAl3N+YHnn4rRTnWjK/TF/I+4tIjCLfy1N9j0JG6gehcGC0U4z+5/cgSWa
         hKAkofF0HXgL49l0l26Bpyu2MQjln+zNmWtT8qObhPixbdVhPe96dPkw64KYlQXWacYK
         geOLwt6V3HMFo/PS9i0ellSAT3ghjoSdCmcneHx1zMTvMmfKMRJ26tN1thz+JZthN1nR
         tvKg==
X-Forwarded-Encrypted: i=1; AJvYcCW+Jf+JkO+ut8wsEYBsmQOzFSqfxXh+XHJKqFkPYp0OGrDErWHt9kHsaDC/hx96jgeKoGRqyjN6zV3nwl1x91gBB91q3yB/of+Cl1Y8RRC+SjrsKE0R6mpw
X-Gm-Message-State: AOJu0YyjuVuzk1GUtyIMntNIGtGlRaDUq/3BfS4qGhJVXiDRt8Ha2nK+
	Z98VE/ivumlw/Xrz5ZfcMC+f/DfSDYp4Yzy8NXM91uYySI+OS/5Bf1LDASraxe4=
X-Google-Smtp-Source: AGHT+IEdqFd8mGgLAEffgdvrB7vp4NTFbeMg3a2ulsB4AVUXX9SbiVSLAA3K+pAgohrkDE3uQG3tYg==
X-Received: by 2002:a5d:4747:0:b0:367:9b1e:7b3b with SMTP id ffacd0b85a97d-367ceadc72emr3697522f8f.59.1720604785294;
        Wed, 10 Jul 2024 02:46:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:40c6:a25f:553:e199? ([2001:8b0:aba:5f3c:40c6:a25f:553:e199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde891d9sm4896503f8f.65.2024.07.10.02.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 02:46:24 -0700 (PDT)
Message-ID: <cc5bf2cb09ef50d38a28d50ab988743dd01d9eae.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 00/14] Use the kernel from sstate when
 building fitImages
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@gmail.com, openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2024 10:46:24 +0100
In-Reply-To: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
References: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201727

On Thu, 2024-07-04 at 09:09 +0200, Adrian Freihofer via lists.openembedded.=
org wrote:
> If the KERNEL_IMAGETYPES(S) contains fitImage, the kernel is always
> rebuilt when something changes in the initramfs, which happens
> frequently.
> This is even worse if the build runs from an empty TMPDIR. The kernel
> re-build starts by fetching the large kernel git repository and
> recompiling it from scratch.
>=20
> This cannot be improved if INITRAMFS_IMAGE_BUNDLE =3D "1". If the kernel
> Makefile is needed to generate the initramfs bundle the kernel build
> folder is required.
> But for a build configuration with INITRAMFS_IMAGE_BUNDLE =3D "" the
> build folder is not needed. Creating the initramfs bundle requires:
> linux.bin, DTBs and the initramfs which are available in the deploy
> directory. That means creating the fitImage can be done with artifacts
> which are already cached by the sstate.
>=20
> There is an extra commit providing a html file. This html file provides
> some graphics which show the changes in the kernel's task dependencies.
> I hope this simplifies the re-view of this patch series.
>=20
> Adrian Freihofer (14):
> =C2=A0 oe-selftest: wic fix deps of test_efi_plugin_unified_kernel_image_=
qemu
> =C2=A0 oe-selftest: fitimage refactor u-boot-tools-native
> =C2=A0 oe-selftest: fitimage drop test-mkimage-wrapper
> =C2=A0 oe-selftest: fitimage cleanup asserts
> =C2=A0 oe-selftest: fitimage fix test_initramfs_bundle
> =C2=A0 kernel-fitimage: fix handling of empty default dtb
> =C2=A0 kernel-fitimage: fix external dtb check
> =C2=A0 kernel: execute do_bundle_initramfs only when needed
> =C2=A0 kernel-fitimage: refactor do_assemble_fitimage_initramfs
> =C2=A0 kernel-fitimage: refactor creation of linux.bin
> =C2=A0 kernel-fitimage: fix intentation
> =C2=A0 kernel-fitimage: run unbundled fitimage after deploy
> =C2=A0 image: depends do_deploy_fitimage_unbundled
> =C2=A0 DO NOT MERGE: explanation and testing

I think there was a failure in automated testing from this series on generi=
carm64:

https://autobuilder.yoctoproject.org/typhoon/#/builders/165/builds/583
https://autobuilder.yoctoproject.org/typhoon/#/builders/166/builds/587

There was also:

https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/5730

but I think this was systemd upgrade related. I'm not 100% sure though.

Cheers,

Richard

