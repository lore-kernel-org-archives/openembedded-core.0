Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.1501.1615852201932635258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 16:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lkPcc+M8;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id l4so33569946qkl.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V4KUEjGKzRFFnwxciukc1BbSc4SqfXYMXrhpbFxv2gg=;
        b=lkPcc+M81RllocPX/iIdyPisFG30BaSjtSOeELQ19s3cNQrg1ZIt+rCK6XYl6Zv4ZI
         BHvdi/aBycatljPl5pZqE4nHBJuPgNBBR0ORk4h92paTo+UvXF2EzVOLoaeG+h1s5tto
         aVnuqx2aNVA3Z+d6eRDVwJ4YCSLRHizD+S77LkmrLJyGrFjlm6GR2hNYFE4exA8EQC19
         MzM55y/e/BaXyK4dPTddUYhnfmcgcQS5ysTIsp2N4aRcdp2y8WMd8aSFwtERCiHVTo8x
         7dxA1EuPWOpbLEqzlvXgtZY5/g3JlBoPCva+/rZidqHE1k7qvADib2f+QalIoQ2GlIu6
         d1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V4KUEjGKzRFFnwxciukc1BbSc4SqfXYMXrhpbFxv2gg=;
        b=Z7/6zazPHwJQ1/FLVxxcI8TJt8qZZAkql9JNIG9v3BrvpJ37RdseN1IWxI4r0IzQP+
         2VweRNsU+dEIl56B2ORFr9iRpPfpueFdnp2Fz7ICDpU+IOZBI/GbJlSHEwokycPMLEhT
         /DZMMvzVCDvjODC/7QPDDon1bX59XnlV7h+qMrON/gRFmicg322MNBw2ovxdOzFDApkk
         x4Ubjcuf7/VZGAXxZDDhi8bj638SS0cUOMsNSIIPF4cdFpKUrOPFCNNWN0V1avJjOvGR
         sVlW0oMBb6irW3u9f8uGeJNgCIuv/RFKYUZn441N2OJz9STy4TBPHn0hkgrykyJ9hkdC
         CrUg==
X-Gm-Message-State: AOAM533UdjWDWmcwLqZKYJfu6Dkxf1mqJs4xROGV59mOAcP4qdSpwYmL
	hbbb+18SSTSWQyw5hZhLlg0gYLJfte0PnkVS+tU=
X-Google-Smtp-Source: ABdhPJy1LTfIo6iEiBQzcaV/6beQd6+vUQb2BNgWJ23tRO+HA52Rr9v2cKsLCwMjckcvjDWqvzAw8JWlrS4R44WmbFY=
X-Received: by 2002:a05:620a:12ae:: with SMTP id x14mr28061796qki.25.1615852201021;
 Mon, 15 Mar 2021 16:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <a8c3bbca-1b5c-5353-9a0a-c7ecebc2fc32@broadcom.com>
In-Reply-To: <a8c3bbca-1b5c-5353-9a0a-c7ecebc2fc32@broadcom.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 15 Mar 2021 16:49:34 -0700
Message-ID: <CAMKF1spkj4K91vNUhu5+vEaujZ+odAyMYEkyWqnvSCct2Grung@mail.gmail.com>
Subject: Re: [OE-core] unwanted linux kernel image added to /boot directory
To: Scott Branden <scott.branden@broadcom.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 15, 2021 at 4:40 PM Scott Branden via
lists.openembedded.org
<scott.branden=broadcom.com@lists.openembedded.org> wrote:
>
> Hello,
>
> There seems to be a problem when a kernel module is added to an initramfs image.
>
> As soon as I add a recipe which installs an external kernel module into an initramfs image it automatically installs the linux kernel image in a /boot directory.
>
> This is really bad as it increases the size of the initramfs image.
>
> /boot/Image should not be installed in the image when an external kernel module is added to an image.
>
> Can someone suggest a fix to this issue?
>

try

IMAGE_INSTALL_remove = "kernel-image-${KERNEL_IMAGETYPE}"

or set

KERNEL_IMAGE = ""

> Thanks,
>  Scott
>
> 
>
