Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90AF3C3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 08:00:19 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.10266.1721289615285422506
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 01:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ENONNW3m;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-36786081ac8so338316f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 01:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721289614; x=1721894414; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MleLGB2KOrMCHYTiEs9RWaURn/2sq7fCooNmCIWW2Wg=;
        b=ENONNW3meuMOTIShpgIP6Vef/ZF7eko/Zjh6YEjHZOiGZ7b3G6tLzGCLEk6LrsH5lj
         EO6s1MNIKyLJaHhGO073VQ4NVa+grQEiBqj68E3cPQVqGcrggnlOgJz/BwxVTpKLH3FH
         gQfQRsqPkCCFL79WIAUS7WpLWsYa+5zlOlAI0Vpm6sBaANhmmdinarzKcOkGsVguIu4K
         IIT+N0fkzO7/dH6fwhw3OAWSQpgATNpTxvqndR2A9eymj0+6uXXqRqs6Aqa97OYOwS5D
         faxAK/prZb55YN0f0A+X4nBMY8foHSbV6vN4mVKS0gjcOmEM0s8nnHyQoSoWPDnw60KA
         qzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721289614; x=1721894414;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MleLGB2KOrMCHYTiEs9RWaURn/2sq7fCooNmCIWW2Wg=;
        b=cxyG6NItbohrfc7vsNuwB+74QkhvHLPw7S5ibE3GDta2n4LUpVbfcaLLIisoEDM3bq
         qNtJ64F40LfDQe6NIRi1VpRe9MGt1KpLAv7/fNd0HQjUBFUKucFGDATpA7NACx+/+y0v
         JLeMdXsxQXZ4vcBHFdcmFdC2lCRMvscPDpwRxx6XT9/Xn2Sc6CHoHiecL2f3EGmc66bm
         XfndIPvdgd77WlIKkJlmWigSQRICW9+Q9NnL2ZQrmHHCUgmEdbhVkCSa26RtRrgVYK8s
         ErtcujeCt32nWZNHjqqEHnmcR052kwmMa+qnIIT+WTdrD7UJm6pMbC7kM8mv3uZtV8U1
         4E+Q==
X-Gm-Message-State: AOJu0YxLMLTEpAQK5BNz3PZu50V+y+k04enQIB9tO4tRvAJT/EpvKIBv
	8cIOMsoUfIPlWCFfhF/J49Q8gZJVRIbz1M9/MyDwu3t5Kx9AP2nW
X-Google-Smtp-Source: AGHT+IGGNmc+dCz+JAynhMxlLPSnY2mYerrVE6EWBQFqYASiR30fkCvz/31yHGE/tR+qE37EOr3NEA==
X-Received: by 2002:a5d:4444:0:b0:368:3717:10b3 with SMTP id ffacd0b85a97d-36837171286mr2292525f8f.8.1721289613315;
        Thu, 18 Jul 2024 01:00:13 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a3c09csm1221335e9.9.2024.07.18.01.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 01:00:12 -0700 (PDT)
Message-ID: <f8486647cf50da429e45b457e483bb89a2f2a1b6.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/6] Use the kernel from sstate when
 building fitImages
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2024 10:00:12 +0200
In-Reply-To: <CA+chaQeGeXFd7rH2KjsYdtW50Nnre0DL8ykjjmWSRKNX89OrYg@mail.gmail.com>
References: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
	 <50bea4fa4fe781c4b584d746fec34c758d28599f.camel@gmail.com>
	 <CA+chaQeGeXFd7rH2KjsYdtW50Nnre0DL8ykjjmWSRKNX89OrYg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 08:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202191

Hi Martin

Thank you for looking at my patches.

On Mon, 2024-07-15 at 16:32 +0200, Martin Jansa wrote:
> Doesn't it still rebuild from scratch when IMAGE_VERSION_SUFFIX
> changes?

I wonder why this happens in WebOS. I think that this line
kernel_do_deploy[vardepsexclude] =3D "DATETIME"
prevents such unnecessary rebuilds.

So far we haven't had any problems with rebuilding kernels. The trouble
started when we started using fitImages with initramfs for some
devices.=C2=A0It is also worth noting that we build from sstate, but with a=
n
empty TMPDIR.

In such a scenario bitbake does:

 * The initramfs gets assembled. This is expected because images are
   not sstate cached. This runs quickly because all the packages which
   are required to build the initramfs come from sstate-cache.
 * Since the initramfs changes, the fitImage which includes it must be
   re-assembled as well.
 * Now the hassle starts: The do_assemble_fitimage_initramfs needs the
   kernel binaries (linux.bin, DTBs...) which are not available from
   sttate. Bitbake has to start with kernel do_fetch in case of an
   empty TMPDIR just to get the fitImage assembled.

With my patches the kernel binaries used for the fitImage come from
sstate (if the initramfs is not bundled).

I tested this like that:

cat build/conf/local.conf

KERNEL_IMAGETYPE =3D "Image"
KERNEL_IMAGETYPES +=3D " fitImage "
KERNEL_CLASSES =3D " kernel-fitimage "and RAM disk
IMAGE_FSTYPES +=3D "cpio.gz"
INITRAMFS_IMAGE =3D "core-image-minimal"
IMAGE_NAME_SUFFIX:pn-core-image-minimal =3D ""
UBOOT_RD_LOADADDRESS =3D "0x88000000"
UBOOT_RD_ENTRYPOINT =3D "0x88000000"
UBOOT_LOADADDRESS =3D "0x80080000"
UBOOT_ENTRYPOINT =3D "0x80080000"
FIT_DESC =3D "A model description"

# Allow to change the initramfs
FOO_VAR =3D "1"
INHERIT +=3D "image-buildinfo"
IMAGE_BUILDINFO_VARS:append =3D " FOO_VAR"


bitbake virtual/kernel

mv build/tmp build/tmp-old-1

bitbake virtual/kernel
-> bitbake does:
- setscene tasks
- core-image-minimal do_rootfs ...
- kernel do_deploy (from sstate)
- kernel do_deploy_fitimage_unbundled


bitbake virtual/kernel
-> bitbake does: nothing


# Enforce a re-build of the initramfs
mv build/tmp build/tmp-old-2
echo 'FOO_VAR =3D "1"' >> build/conf/local.conf

bitbake virtual/kernel
-> bitbake does:
- setscene tasks
- core-image-minimal do_rootfs ...
- kernel do_deploy (from sstate)
- kernel do_deploy_fitimage_unbundled


bitbake virtual/kernel
-> bitbake does: nothing


diff \
<(ls build/tmp-old-2/deploy/images/qemux86-64 -1) \
<(ls build/tmp/deploy/images/qemux86-64/ -1)
4,10c4,10
< core-image-minimal-qemux86-64-20240718065105.cpio.gz
< core-image-minimal-qemux86-64-20240718065105.ext4
< core-image-minimal-qemux86-64-20240718065105.manifest
< core-image-minimal-qemux86-64-20240718065105.qemuboot.conf
< core-image-minimal-qemux86-64-20240718065105.spdx.tar.zst
< core-image-minimal-qemux86-64-20240718065105.tar.bz2
< core-image-minimal-qemux86-64-20240718065105.testdata.json
---
> core-image-minimal-qemux86-64-20240718073341.cpio.gz
> core-image-minimal-qemux86-64-20240718073341.ext4
> core-image-minimal-qemux86-64-20240718073341.manifest
> core-image-minimal-qemux86-64-20240718073341.qemuboot.conf
> core-image-minimal-qemux86-64-20240718073341.spdx.tar.zst
> core-image-minimal-qemux86-64-20240718073341.tar.bz2
> core-image-minimal-qemux86-64-20240718073341.testdata.json
20c20
< fitImage-core-image-minimal-qemux86-64--6.6.35+git-r0-qemux86-64-
20240718065105.bin
---
> fitImage-core-image-minimal-qemux86-64--6.6.35+git-r0-qemux86-64-
20240718073341.bin
22c22
< fitImage-its-core-image-minimal-qemux86-64--6.6.35+git-r0-qemux86-64-
20240718065105.its
---
> fitImage-its-core-image-minimal-qemux86-64--6.6.35+git-r0-qemux86-64-
20240718073341.its



The answer is then: No it does not re-build. At least not in the
scenario which I would like to fix it, it does not rebuild from
scratch.

Does that make sense?

Regards,
Adrian

> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#201933):
> > https://lists.openembedded.org/g/openembedded-core/message/201933
> > Mute This Topic:
> > https://lists.openembedded.org/mt/107231736/3617156
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20


