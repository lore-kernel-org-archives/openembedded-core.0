Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7476C3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 14:22:28 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.39129.1721053343948480979
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 07:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uv+PJCON;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-36798e62aeeso2805964f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 07:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721053342; x=1721658142; darn=lists.openembedded.org;
        h=mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ur3oEOv2RJtIe0zxtO8UglSSJq3+fxzcSRZJXbG8n50=;
        b=Uv+PJCONi2uJKgC4iUyACYXA4NOSXsaYkQCbDofF6UC4dBvhx7l8rgu19QM1o49LVJ
         ZHB+UEVSHo8WPq6oH6sEK2dBJIGmUKpUp+Bu66UA2B8FpBuzlEnYZNcTHzZQjhrOaP00
         G8g86KHtwy5HssNC5TrDbq5IggXzkpkjlDkUslVkPjPXt6aIVjMpQTrb+Z7oG/CsbncC
         CyxgcAOZoBWmrR4BoyzM0w8OhFk9idPq8YlFza/zN4Yr4mt05kNSO2w8htP/cTldT/tD
         uD4GQhXGo5ycU0n41b4kPB0N0A3peZshhyyc9XmHNIzCZNg8qq6IYDV/kkMJpjBoQLl2
         wvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721053342; x=1721658142;
        h=mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ur3oEOv2RJtIe0zxtO8UglSSJq3+fxzcSRZJXbG8n50=;
        b=Jsobpk+zhOLbl+RoxIdfG1RsJao7BMskSzU80Xl5fNqGRTkiBpLNDIvscsyGhb2GW6
         PcPU2ICGuQt956PPdSnkyLxtjmpAE7q0f3DVQhJ4YinoU8OWuMUltdqDHmDaRGqFZZds
         jDjW7enIyiqZIYxamQraBQgbu78Ww3Q8w3nmql82wyw5bt0dTl9NUlm1/CIGbe20qxWT
         vaRIRGm4In2VKzd1yIekUJWDXYo8et5tHtLmF+VqdQHUxiyD/T8z7d4EUF2/482YEVBB
         THfoz7WkKz9P/bIyRz/NnC0Q9QQstW5Mn9qCp7RbvJuA7xLZIW+duo+xQwkKMpLtvVF6
         2OyA==
X-Gm-Message-State: AOJu0YyDthK50bfxeJm9uG1AI4ET3vaQqgP7MNVQ5Jb6IjsikglUNWiB
	w99ghkpOQTeaQkAmvjqSH3ZGJW2TPyrYEt0MuJjnJDgoAiwi0VMU29QTfQ==
X-Google-Smtp-Source: AGHT+IESlYfSgJCoBPYu+OMU33SwM05DF9sLvAN2YXrCRBTdOBDHSQ7WYs9foCFURxIiKFd/lmrM5A==
X-Received: by 2002:a5d:598d:0:b0:367:97b9:d5ed with SMTP id ffacd0b85a97d-367cea46aa2mr16352478f8f.9.1721053341587;
        Mon, 15 Jul 2024 07:22:21 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccad8sm6557741f8f.60.2024.07.15.07.22.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 07:22:21 -0700 (PDT)
Message-ID: <50bea4fa4fe781c4b584d746fec34c758d28599f.camel@gmail.com>
Subject: Re: [PATCH v2 0/6] Use the kernel from sstate when building
 fitImages
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2024 16:22:20 +0200
In-Reply-To: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
References: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
Content-Type: multipart/alternative; boundary="=-fAxqXsR572/11P8GeCw4"
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 14:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201933

--=-fAxqXsR572/11P8GeCw4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


 task-depends      Task dependeny changes=20

Configuration: image, fitimage, initramfs, unbundled=20

KERNEL_IMAGETYPE =3D "Image"
KERNEL_IMAGETYPES +=3D " fitImage "
KERNEL_CLASSES =3D " kernel-fitimage "
IMAGE_FSTYPES +=3D "cpio.gz"
INITRAMFS_IMAGE =3D "core-image-minimal-initramfs"
branch: master=20





depends
undefined


core-image-minimal.do_build
undefined
core-image-minimal.do_build




do_deploy
undefined
do_deploy




core-image-minimal.do_build->do_deploy
undefined
undefined



do_assemble_fitimage_initramfs
undefined
do_assemble_fitimage_initramfs




do_deploy->do_assemble_fitimage_initramfs
undefined
undefined



do_bundle_initramfs
undefined
do_bundle_initramfs




do_deploy->do_bundle_initramfs
undefined
undefined



do_populate_sysroot
undefined
do_populate_sysroot




do_deploy->do_populate_sysroot
undefined
undefined



do_assemble_fitimage
undefined
do_assemble_fitimage




do_compile
undefined
do_compile




do_assemble_fitimage->do_compile
undefined
undefined



do_kernel_generate_rsa_keys
undefined
do_kernel_generate_rsa_keys




do_assemble_fitimage->do_kernel_generate_rsa_keys
undefined
undefined



do_kernel_generate_rsa_keys->do_compile
undefined
undefined



core-image-minimal.do_image_complete
undefined
core-image-minimal.do_image_complete




do_assemble_fitimage_initramfs->core-image-minimal.do_image_complete
undefined
undefined



do_assemble_fitimage_initramfs->do_bundle_initramfs
undefined
undefined



do_bundle_initramfs->core-image-minimal.do_image_complete
undefined
undefined



do_install
undefined
do_install




do_bundle_initramfs->do_install
undefined
undefined



do_install->do_assemble_fitimage
undefined
undefined



do_install->do_compile
undefined
undefined



do_populate_sysroot->do_install
undefined
undefined



branch: adrianf/kernel-fitimage-sstate=20





depends
undefined


core-image-minimal.do_build
undefined
core-image-minimal.do_build




do_deploy
undefined
do_deploy




core-image-minimal.do_build->do_deploy
undefined
undefined



do_deploy_fitimage_unbundled
undefined
do_deploy_fitimage_unbundled




core-image-minimal.do_build->do_deploy_fitimage_unbundled
undefined
undefined



core-image-minimal.do_image_complete
undefined
core-image-minimal.do_image_complete




do_deploy->core-image-minimal.do_image_complete
undefined
undefined



do_install
undefined
do_install




do_deploy->do_install
undefined
undefined



do_populate_sysroot
undefined
do_populate_sysroot




do_deploy->do_populate_sysroot
undefined
undefined



do_deploy_fitimage_unbundled->do_deploy
undefined
undefined



do_deploy_fitimage_unbundled->core-image-minimal.do_image_complete
undefined
undefined



do_assemble_fitimage
undefined
do_assemble_fitimage




do_compile
undefined
do_compile




do_assemble_fitimage->do_compile
undefined
undefined



do_kernel_generate_rsa_keys
undefined
do_kernel_generate_rsa_keys




do_assemble_fitimage->do_kernel_generate_rsa_keys
undefined
undefined



do_kernel_generate_rsa_keys->do_compile
undefined
undefined



do_install->do_assemble_fitimage
undefined
undefined



do_install->do_compile
undefined
undefined



do_populate_sysroot->do_install
undefined
undefined



Diff=20

2a3
> "core-image-minimal.do_build" -> "do_deploy_fitimage_unbundled"
6,11d6
< "do_assemble_fitimage_initramfs"
[label=3D"do_assemble_fitimage_initramfs"]
< "do_assemble_fitimage_initramfs" -> "core-image-
minimal.do_image_complete"
< "do_assemble_fitimage_initramfs" -> "do_bundle_initramfs"
< "do_bundle_initramfs" [label=3D"do_bundle_initramfs"]
< "do_bundle_initramfs" -> "core-image-minimal.do_image_complete"
< "do_bundle_initramfs" -> "do_install"
14,15c9,10
< "do_deploy" -> "do_assemble_fitimage_initramfs"
< "do_deploy" -> "do_bundle_initramfs"
---
> "do_deploy" -> "core-image-minimal.do_image_complete"
> "do_deploy" -> "do_install"
16a12,14
> "do_deploy_fitimage_unbundled" [label=3D"do_deploy_fitimage_unbundled"]
> "do_deploy_fitimage_unbundled" -> "core-image-
minimal.do_image_complete"
> "do_deploy_fitimage_unbundled" -> "do_deploy"
Configuration: fitimage, initramfs, unbundled=20

KERNEL_IMAGETYPE:forcevariable =3D "fitImage"
KERNEL_CLASSES =3D " kernel-fitimage "
IMAGE_FSTYPES +=3D "cpio.gz"
INITRAMFS_IMAGE =3D "core-image-minimal-initramfs"
branch: master=20





depends
undefined


core-image-minimal.do_build
undefined
core-image-minimal.do_build




do_deploy
undefined
do_deploy




core-image-minimal.do_build->do_deploy
undefined
undefined



do_assemble_fitimage_initramfs
undefined
do_assemble_fitimage_initramfs




do_deploy->do_assemble_fitimage_initramfs
undefined
undefined



do_bundle_initramfs
undefined
do_bundle_initramfs




do_deploy->do_bundle_initramfs
undefined
undefined



do_populate_sysroot
undefined
do_populate_sysroot




do_deploy->do_populate_sysroot
undefined
undefined



do_assemble_fitimage
undefined
do_assemble_fitimage




do_compile
undefined
do_compile




do_assemble_fitimage->do_compile
undefined
undefined



do_kernel_generate_rsa_keys
undefined
do_kernel_generate_rsa_keys




do_assemble_fitimage->do_kernel_generate_rsa_keys
undefined
undefined



do_kernel_generate_rsa_keys->do_compile
undefined
undefined



core-image-minimal.do_image_complete
undefined
core-image-minimal.do_image_complete




do_assemble_fitimage_initramfs->core-image-minimal.do_image_complete
undefined
undefined



do_assemble_fitimage_initramfs->do_bundle_initramfs
undefined
undefined



do_bundle_initramfs->core-image-minimal.do_image_complete
undefined
undefined



do_install
undefined
do_install




do_bundle_initramfs->do_install
undefined
undefined



do_install->do_assemble_fitimage
undefined
undefined



do_install->do_compile
undefined
undefined



do_populate_sysroot->do_install
undefined
undefined



branch: adrianf/kernel-fitimage-sstate=20





depends
undefined


core-image-minimal.do_build
undefined
core-image-minimal.do_build




do_deploy
undefined
do_deploy




core-image-minimal.do_build->do_deploy
undefined
undefined



do_deploy_fitimage_unbundled
undefined
do_deploy_fitimage_unbundled




core-image-minimal.do_build->do_deploy_fitimage_unbundled
undefined
undefined



core-image-minimal.do_image_complete
undefined
core-image-minimal.do_image_complete




do_deploy->core-image-minimal.do_image_complete
undefined
undefined



do_install
undefined
do_install




do_deploy->do_install
undefined
undefined



do_populate_sysroot
undefined
do_populate_sysroot




do_deploy->do_populate_sysroot
undefined
undefined



do_deploy_fitimage_unbundled->do_deploy
undefined
undefined



do_deploy_fitimage_unbundled->core-image-minimal.do_image_complete
undefined
undefined



do_assemble_fitimage
undefined
do_assemble_fitimage




do_compile
undefined
do_compile




do_assemble_fitimage->do_compile
undefined
undefined



do_kernel_generate_rsa_keys
undefined
do_kernel_generate_rsa_keys




do_assemble_fitimage->do_kernel_generate_rsa_keys
undefined
undefined



do_kernel_generate_rsa_keys->do_compile
undefined
undefined



do_install->do_assemble_fitimage
undefined
undefined



do_install->do_compile
undefined
undefined



do_populate_sysroot->do_install
undefined
undefined



Diff=20

2a3
> "core-image-minimal.do_build" -> "do_deploy_fitimage_unbundled"
6,11d6
< "do_assemble_fitimage_initramfs"
[label=3D"do_assemble_fitimage_initramfs"]
< "do_assemble_fitimage_initramfs" -> "core-image-
minimal.do_image_complete"
< "do_assemble_fitimage_initramfs" -> "do_bundle_initramfs"
< "do_bundle_initramfs" [label=3D"do_bundle_initramfs"]
< "do_bundle_initramfs" -> "core-image-minimal.do_image_complete"
< "do_bundle_initramfs" -> "do_install"
14,15c9,10
< "do_deploy" -> "do_assemble_fitimage_initramfs"
< "do_deploy" -> "do_bundle_initramfs"
---
> "do_deploy" -> "core-image-minimal.do_image_complete"
> "do_deploy" -> "do_install"
16a12,14
> "do_deploy_fitimage_unbundled" [label=3D"do_deploy_fitimage_unbundled"]
> "do_deploy_fitimage_unbundled" -> "core-image-
minimal.do_image_complete"
> "do_deploy_fitimage_unbundled" -> "do_deploy"
Configuration: image, fitimage, initramfs, bundled=20

KERNEL_IMAGETYPE =3D "Image"
KERNEL_IMAGETYPES +=3D " fitImage "
KERNEL_CLASSES =3D " kernel-fitimage "
IMAGE_FSTYPES +=3D "cpio.gz"
INITRAMFS_IMAGE =3D "core-image-minimal-initramfs"
INITRAMFS_IMAGE_BUNDLE =3D "1"
branch: master=20





depends
undefined


core-image-minimal.do_build
undefined
core-image-minimal.do_build




do_deploy
undefined
do_deploy




core-image-minimal.do_build->do_deploy
undefined
undefined



do_assemble_fitimage_initramfs
undefined
do_assemble_fitimage_initramfs




do_deploy->do_assemble_fitimage_initramfs
undefined
undefined



do_bundle_initramfs
undefined
do_bundle_initramfs




do_deploy->do_bundle_initramfs
undefined
undefined



do_populate_sysroot
undefined
do_populate_sysroot




do_deploy->do_populate_sysroot
undefined
undefined



do_transform_bundled_initramfs
undefined
do_transform_bundled_initramfs




do_deploy->do_transform_bundled_initramfs
undefined
undefined



do_assemble_fitimage
undefined
do_assemble_fitimage




do_compile
undefined
do_compile




do_assemble_fitimage->do_compile
undefined
undefined



do_kernel_generate_rsa_keys
undefined
do_kernel_generate_rsa_keys




do_assemble_fitimage->do_kernel_generate_rsa_keys
undefined
undefined



do_kernel_generate_rsa_keys->do_compile
undefined
undefined



core-image-minimal.do_image_complete
undefined
core-image-minimal.do_image_complete




do_assemble_fitimage_initramfs->core-image-minimal.do_image_complete
undefined
undefined



do_assemble_fitimage_initramfs->do_bundle_initramfs
undefined
undefined



do_bundle_initramfs->core-image-minimal.do_image_complete
undefined
undefined



do_install
undefined
do_install




do_bundle_initramfs->do_install
undefined
undefined



do_install->do_assemble_fitimage
undefined
undefined



do_install->do_compile
undefined
undefined



do_populate_sysroot->do_install
undefined
undefined



do_transform_bundled_initramfs->do_bundle_initramfs
undefined
undefined



branch: adrianf/kernel-fitimage-sstate=20





depends
undefined


core-image-minimal.do_build
undefined
core-image-minimal.do_build




do_deploy
undefined
do_deploy




core-image-minimal.do_build->do_deploy
undefined
undefined



do_assemble_fitimage_initramfs
undefined
do_assemble_fitimage_initramfs




do_deploy->do_assemble_fitimage_initramfs
undefined
undefined



do_bundle_initramfs
undefined
do_bundle_initramfs




do_deploy->do_bundle_initramfs
undefined
undefined



do_populate_sysroot
undefined
do_populate_sysroot




do_deploy->do_populate_sysroot
undefined
undefined



do_transform_bundled_initramfs
undefined
do_transform_bundled_initramfs




do_deploy->do_transform_bundled_initramfs
undefined
undefined



do_assemble_fitimage
undefined
do_assemble_fitimage




do_compile
undefined
do_compile




do_assemble_fitimage->do_compile
undefined
undefined



do_kernel_generate_rsa_keys
undefined
do_kernel_generate_rsa_keys




do_assemble_fitimage->do_kernel_generate_rsa_keys
undefined
undefined



do_kernel_generate_rsa_keys->do_compile
undefined
undefined



core-image-minimal.do_image_complete
undefined
core-image-minimal.do_image_complete




do_assemble_fitimage_initramfs->core-image-minimal.do_image_complete
undefined
undefined



do_assemble_fitimage_initramfs->do_bundle_initramfs
undefined
undefined



do_bundle_initramfs->core-image-minimal.do_image_complete
undefined
undefined



do_install
undefined
do_install




do_bundle_initramfs->do_install
undefined
undefined



do_install->do_assemble_fitimage
undefined
undefined



do_install->do_compile
undefined
undefined



do_populate_sysroot->do_install
undefined
undefined



do_transform_bundled_initramfs->do_bundle_initramfs
undefined
undefined



Diff=20

Configuration: image, fitimage=20

KERNEL_IMAGETYPE =3D "Image"
KERNEL_IMAGETYPES +=3D " fitImage "
KERNEL_CLASSES =3D " kernel-fitimage "
branch: master=20





depends
undefined


core-image-minimal.do_build
undefined
core-image-minimal.do_build




do_deploy
undefined
do_deploy




core-image-minimal.do_build->do_deploy
undefined
undefined



do_assemble_fitimage_initramfs
undefined
do_assemble_fitimage_initramfs




do_deploy->do_assemble_fitimage_initramfs
undefined
undefined



do_bundle_initramfs
undefined
do_bundle_initramfs




do_deploy->do_bundle_initramfs
undefined
undefined



do_populate_sysroot
undefined
do_populate_sysroot




do_deploy->do_populate_sysroot
undefined
undefined



do_assemble_fitimage
undefined
do_assemble_fitimage




do_compile
undefined
do_compile




do_assemble_fitimage->do_compile
undefined
undefined



do_kernel_generate_rsa_keys
undefined
do_kernel_generate_rsa_keys




do_assemble_fitimage->do_kernel_generate_rsa_keys
undefined
undefined



do_kernel_generate_rsa_keys->do_compile
undefined
undefined



core-image-minimal.do_image_complete
undefined
core-image-minimal.do_image_complete




do_assemble_fitimage_initramfs->core-image-minimal.do_image_complete
undefined
undefined



do_assemble_fitimage_initramfs->do_bundle_initramfs
undefined
undefined



do_bundle_initramfs->core-image-minimal.do_image_complete
undefined
undefined



do_install
undefined
do_install




do_bundle_initramfs->do_install
undefined
undefined



do_install->do_assemble_fitimage
undefined
undefined



do_install->do_compile
undefined
undefined



do_populate_sysroot->do_install
undefined
undefined



branch: adrianf/kernel-fitimage-sstate=20





depends
undefined


core-image-minimal.do_build
undefined
core-image-minimal.do_build




do_deploy
undefined
do_deploy




core-image-minimal.do_build->do_deploy
undefined
undefined



do_deploy_fitimage_unbundled
undefined
do_deploy_fitimage_unbundled




core-image-minimal.do_build->do_deploy_fitimage_unbundled
undefined
undefined



core-image-minimal.do_image_complete
undefined
core-image-minimal.do_image_complete




do_deploy->core-image-minimal.do_image_complete
undefined
undefined



do_install
undefined
do_install




do_deploy->do_install
undefined
undefined



do_populate_sysroot
undefined
do_populate_sysroot




do_deploy->do_populate_sysroot
undefined
undefined



do_deploy_fitimage_unbundled->do_deploy
undefined
undefined



do_deploy_fitimage_unbundled->core-image-minimal.do_image_complete
undefined
undefined



do_assemble_fitimage
undefined
do_assemble_fitimage




do_compile
undefined
do_compile




do_assemble_fitimage->do_compile
undefined
undefined



do_kernel_generate_rsa_keys
undefined
do_kernel_generate_rsa_keys




do_assemble_fitimage->do_kernel_generate_rsa_keys
undefined
undefined



do_kernel_generate_rsa_keys->do_compile
undefined
undefined



do_install->do_assemble_fitimage
undefined
undefined



do_install->do_compile
undefined
undefined



do_populate_sysroot->do_install
undefined
undefined



Diff=20

2a3
> "core-image-minimal.do_build" -> "do_deploy_fitimage_unbundled"
6,11d6
< "do_assemble_fitimage_initramfs"
[label=3D"do_assemble_fitimage_initramfs"]
< "do_assemble_fitimage_initramfs" -> "core-image-
minimal.do_image_complete"
< "do_assemble_fitimage_initramfs" -> "do_bundle_initramfs"
< "do_bundle_initramfs" [label=3D"do_bundle_initramfs"]
< "do_bundle_initramfs" -> "core-image-minimal.do_image_complete"
< "do_bundle_initramfs" -> "do_install"
14,15c9,10
< "do_deploy" -> "do_assemble_fitimage_initramfs"
< "do_deploy" -> "do_bundle_initramfs"
---
> "do_deploy" -> "core-image-minimal.do_image_complete"
> "do_deploy" -> "do_install"
16a12,14
> "do_deploy_fitimage_unbundled" [label=3D"do_deploy_fitimage_unbundled"]
> "do_deploy_fitimage_unbundled" -> "core-image-
minimal.do_image_complete"
> "do_deploy_fitimage_unbundled" -> "do_deploy"
=20

--=-fAxqXsR572/11P8GeCw4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; =
border-left:2px #729fcf solid;padding-left:1ex"></blockquote>
      <title>task-depends</title>
      <meta charset=3D"utf-8">
      <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scal=
e=3D1.0">
     =20
      <link rel=3D"stylesheet" href=3D"file:////home/adrian/.vscode/extensi=
ons/shd101wyy.markdown-preview-enhanced-0.8.13/crossnote/dependencies/katex=
/katex.min.css">
     =20
     =20
     =20
     =20
     =20
      <style>
      code[class*=3Dlanguage-],pre[class*=3Dlanguage-]{color:#333;backgroun=
d:0 0;font-family:Consolas,"Liberation Mono",Menlo,Courier,monospace;text-a=
lign:left;white-space:pre;word-spacing:normal;word-break:normal;word-wrap:n=
ormal;line-height:1.4;-moz-tab-size:8;-o-tab-size:8;tab-size:8;-webkit-hyph=
ens:none;-moz-hyphens:none;-ms-hyphens:none;hyphens:none}pre[class*=3Dlangu=
age-]{padding:.8em;overflow:auto;border-radius:3px;background:#f5f5f5}:not(=
pre)>code[class*=3Dlanguage-]{padding:.1em;border-radius:.3em;white-space:n=
ormal;background:#f5f5f5}.token.blockquote,.token.comment{color:#969896}.to=
ken.cdata{color:#183691}.token.doctype,.token.macro.property,.token.punctua=
tion,.token.variable{color:#333}.token.builtin,.token.important,.token.keyw=
ord,.token.operator,.token.rule{color:#a71d5d}.token.attr-value,.token.rege=
x,.token.string,.token.url{color:#183691}.token.atrule,.token.boolean,.toke=
n.code,.token.command,.token.constant,.token.entity,.token.number,.token.pr=
operty,.token.symbol{color:#0086b3}.token.prolog,.token.selector,.token.tag=
{color:#63a35c}.token.attr-name,.token.class,.token.class-name,.token.funct=
ion,.token.id,.token.namespace,.token.pseudo-class,.token.pseudo-element,.t=
oken.url-reference .token.variable{color:#795da3}.token.entity{cursor:help}=
.token.title,.token.title .token.punctuation{font-weight:700;color:#1d3e81}=
.token.list{color:#ed6a43}.token.inserted{background-color:#eaffea;color:#5=
5a532}.token.deleted{background-color:#ffecec;color:#bd2c00}.token.bold{fon=
t-weight:700}.token.italic{font-style:italic}.language-json .token.property=
{color:#183691}.language-markup .token.tag .token.punctuation{color:#333}.l=
anguage-css .token.function,code.language-css{color:#0086b3}.language-yaml =
.token.atrule{color:#63a35c}code.language-yaml{color:#183691}.language-ruby=
 .token.function{color:#333}.language-markdown .token.url{color:#795da3}.la=
nguage-makefile .token.symbol{color:#795da3}.language-makefile .token.varia=
ble{color:#183691}.language-makefile .token.builtin{color:#0086b3}.language=
-bash .token.keyword{color:#0086b3}pre[data-line]{position:relative;padding=
:1em 0 1em 3em}pre[data-line] .line-highlight-wrapper{position:absolute;top=
:0;left:0;background-color:transparent;display:block;width:100%}pre[data-li=
ne] .line-highlight{position:absolute;left:0;right:0;padding:inherit 0;marg=
in-top:1em;background:hsla(24,20%,50%,.08);background:linear-gradient(to ri=
ght,hsla(24,20%,50%,.1) 70%,hsla(24,20%,50%,0));pointer-events:none;line-he=
ight:inherit;white-space:pre}pre[data-line] .line-highlight:before,pre[data=
-line] .line-highlight[data-end]:after{content:attr(data-start);position:ab=
solute;top:.4em;left:.6em;min-width:1em;padding:0 .5em;background-color:hsl=
a(24,20%,50%,.4);color:#f4f1ef;font:bold 65%/1.5 sans-serif;text-align:cent=
er;vertical-align:.3em;border-radius:999px;text-shadow:none;box-shadow:0 1p=
x #fff}pre[data-line] .line-highlight[data-end]:after{content:attr(data-end=
);top:auto;bottom:.4em}html body{font-family:'Helvetica Neue',Helvetica,'Se=
goe UI',Arial,freesans,sans-serif;font-size:16px;line-height:1.6;color:#333=
;background-color:#fff;overflow:initial;box-sizing:border-box;word-wrap:bre=
ak-word}html body>:first-child{margin-top:0}html body h1,html body h2,html =
body h3,html body h4,html body h5,html body h6{line-height:1.2;margin-top:1=
em;margin-bottom:16px;color:#000}html body h1{font-size:2.25em;font-weight:=
300;padding-bottom:.3em}html body h2{font-size:1.75em;font-weight:400;paddi=
ng-bottom:.3em}html body h3{font-size:1.5em;font-weight:500}html body h4{fo=
nt-size:1.25em;font-weight:600}html body h5{font-size:1.1em;font-weight:600=
}html body h6{font-size:1em;font-weight:600}html body h1,html body h2,html =
body h3,html body h4,html body h5{font-weight:600}html body h5{font-size:1e=
m}html body h6{color:#5c5c5c}html body strong{color:#000}html body del{colo=
r:#5c5c5c}html body a:not([href]){color:inherit;text-decoration:none}html b=
ody a{color:#08c;text-decoration:none}html body a:hover{color:#00a3f5;text-=
decoration:none}html body img{max-width:100%}html body>p{margin-top:0;margi=
n-bottom:16px;word-wrap:break-word}html body>ol,html body>ul{margin-bottom:=
16px}html body ol,html body ul{padding-left:2em}html body ol.no-list,html b=
ody ul.no-list{padding:0;list-style-type:none}html body ol ol,html body ol =
ul,html body ul ol,html body ul ul{margin-top:0;margin-bottom:0}html body l=
i{margin-bottom:0}html body li.task-list-item{list-style:none}html body li>=
p{margin-top:0;margin-bottom:0}html body .task-list-item-checkbox{margin:0 =
.2em .25em -1.8em;vertical-align:middle}html body .task-list-item-checkbox:=
hover{cursor:pointer}html body blockquote{margin:16px 0;font-size:inherit;p=
adding:0 15px;color:#5c5c5c;background-color:#f0f0f0;border-left:4px solid =
#d6d6d6}html body blockquote>:first-child{margin-top:0}html body blockquote=
>:last-child{margin-bottom:0}html body hr{height:4px;margin:32px 0;backgrou=
nd-color:#d6d6d6;border:0 none}html body table{margin:10px 0 15px 0;border-=
collapse:collapse;border-spacing:0;display:block;width:100%;overflow:auto;w=
ord-break:normal;word-break:keep-all}html body table th{font-weight:700;col=
or:#000}html body table td,html body table th{border:1px solid #d6d6d6;padd=
ing:6px 13px}html body dl{padding:0}html body dl dt{padding:0;margin-top:16=
px;font-size:1em;font-style:italic;font-weight:700}html body dl dd{padding:=
0 16px;margin-bottom:16px}html body code{font-family:Menlo,Monaco,Consolas,=
'Courier New',monospace;font-size:.85em;color:#000;background-color:#f0f0f0=
;border-radius:3px;padding:.2em 0}html body code::after,html body code::bef=
ore{letter-spacing:-.2em;content:'\00a0'}html body pre>code{padding:0;margi=
n:0;word-break:normal;white-space:pre;background:0 0;border:0}html body .hi=
ghlight{margin-bottom:16px}html body .highlight pre,html body pre{padding:1=
em;overflow:auto;line-height:1.45;border:#d6d6d6;border-radius:3px}html bod=
y .highlight pre{margin-bottom:0;word-break:normal}html body pre code,html =
body pre tt{display:inline;max-width:initial;padding:0;margin:0;overflow:in=
itial;line-height:inherit;word-wrap:normal;background-color:transparent;bor=
der:0}html body pre code:after,html body pre code:before,html body pre tt:a=
fter,html body pre tt:before{content:normal}html body blockquote,html body =
dl,html body ol,html body p,html body pre,html body ul{margin-top:0;margin-=
bottom:16px}html body kbd{color:#000;border:1px solid #d6d6d6;border-bottom=
:2px solid #c7c7c7;padding:2px 4px;background-color:#f0f0f0;border-radius:3=
px}@media print{html body{background-color:#fff}html body h1,html body h2,h=
tml body h3,html body h4,html body h5,html body h6{color:#000;page-break-af=
ter:avoid}html body blockquote{color:#5c5c5c}html body pre{page-break-insid=
e:avoid}html body table{display:table}html body img{display:block;max-width=
:100%;max-height:100%}html body code,html body pre{word-wrap:break-word;whi=
te-space:pre}}.markdown-preview{width:100%;height:100%;box-sizing:border-bo=
x}.markdown-preview ul{list-style:disc}.markdown-preview ul ul{list-style:c=
ircle}.markdown-preview ul ul ul{list-style:square}.markdown-preview ol{lis=
t-style:decimal}.markdown-preview ol ol,.markdown-preview ul ol{list-style-=
type:lower-roman}.markdown-preview ol ol ol,.markdown-preview ol ul ol,.mar=
kdown-preview ul ol ol,.markdown-preview ul ul ol{list-style-type:lower-alp=
ha}.markdown-preview .newpage,.markdown-preview .pagebreak{page-break-befor=
e:always}.markdown-preview pre.line-numbers{position:relative;padding-left:=
3.8em;counter-reset:linenumber}.markdown-preview pre.line-numbers>code{posi=
tion:relative}.markdown-preview pre.line-numbers .line-numbers-rows{positio=
n:absolute;pointer-events:none;top:1em;font-size:100%;left:0;width:3em;lett=
er-spacing:-1px;border-right:1px solid #999;-webkit-user-select:none;-moz-u=
ser-select:none;-ms-user-select:none;user-select:none}.markdown-preview pre=
.line-numbers .line-numbers-rows>span{pointer-events:none;display:block;cou=
nter-increment:linenumber}.markdown-preview pre.line-numbers .line-numbers-=
rows>span:before{content:counter(linenumber);color:#999;display:block;paddi=
ng-right:.8em;text-align:right}.markdown-preview .mathjax-exps .MathJax_Dis=
play{text-align:center!important}.markdown-preview:not([data-for=3Dpreview]=
) .code-chunk .code-chunk-btn-group{display:none}.markdown-preview:not([dat=
a-for=3Dpreview]) .code-chunk .status{display:none}.markdown-preview:not([d=
ata-for=3Dpreview]) .code-chunk .output-div{margin-bottom:16px}.markdown-pr=
eview .md-toc{padding:0}.markdown-preview .md-toc .md-toc-link-wrapper .md-=
toc-link{display:inline;padding:.25rem 0}.markdown-preview .md-toc .md-toc-=
link-wrapper .md-toc-link div,.markdown-preview .md-toc .md-toc-link-wrappe=
r .md-toc-link p{display:inline}.markdown-preview .md-toc .md-toc-link-wrap=
per.highlighted .md-toc-link{font-weight:800}.scrollbar-style::-webkit-scro=
llbar{width:8px}.scrollbar-style::-webkit-scrollbar-track{border-radius:10p=
x;background-color:transparent}.scrollbar-style::-webkit-scrollbar-thumb{bo=
rder-radius:5px;background-color:rgba(150,150,150,.66);border:4px solid rgb=
a(150,150,150,.66);background-clip:content-box}html body[for=3Dhtml-export]=
:not([data-presentation-mode]){position:relative;width:100%;height:100%;top=
:0;left:0;margin:0;padding:0;overflow:auto}html body[for=3Dhtml-export]:not=
([data-presentation-mode]) .markdown-preview{position:relative;top:0;min-he=
ight:100vh}@media screen and (min-width:914px){html body[for=3Dhtml-export]=
:not([data-presentation-mode]) .markdown-preview{padding:2em calc(50% - 457=
px + 2em)}}@media screen and (max-width:914px){html body[for=3Dhtml-export]=
:not([data-presentation-mode]) .markdown-preview{padding:2em}}@media screen=
 and (max-width:450px){html body[for=3Dhtml-export]:not([data-presentation-=
mode]) .markdown-preview{font-size:14px!important;padding:1em}}@media print=
{html body[for=3Dhtml-export]:not([data-presentation-mode]) #sidebar-toc-bt=
n{display:none}}html body[for=3Dhtml-export]:not([data-presentation-mode]) =
#sidebar-toc-btn{position:fixed;bottom:8px;left:8px;font-size:28px;cursor:p=
ointer;color:inherit;z-index:99;width:32px;text-align:center;opacity:.4}htm=
l body[for=3Dhtml-export]:not([data-presentation-mode])[html-show-sidebar-t=
oc] #sidebar-toc-btn{opacity:1}html body[for=3Dhtml-export]:not([data-prese=
ntation-mode])[html-show-sidebar-toc] .md-sidebar-toc{position:fixed;top:0;=
left:0;width:300px;height:100%;padding:32px 0 48px 0;font-size:14px;box-sha=
dow:0 0 4px rgba(150,150,150,.33);box-sizing:border-box;overflow:auto;backg=
round-color:inherit}html body[for=3Dhtml-export]:not([data-presentation-mod=
e])[html-show-sidebar-toc] .md-sidebar-toc::-webkit-scrollbar{width:8px}htm=
l body[for=3Dhtml-export]:not([data-presentation-mode])[html-show-sidebar-t=
oc] .md-sidebar-toc::-webkit-scrollbar-track{border-radius:10px;background-=
color:transparent}html body[for=3Dhtml-export]:not([data-presentation-mode]=
)[html-show-sidebar-toc] .md-sidebar-toc::-webkit-scrollbar-thumb{border-ra=
dius:5px;background-color:rgba(150,150,150,.66);border:4px solid rgba(150,1=
50,150,.66);background-clip:content-box}html body[for=3Dhtml-export]:not([d=
ata-presentation-mode])[html-show-sidebar-toc] .md-sidebar-toc a{text-decor=
ation:none}html body[for=3Dhtml-export]:not([data-presentation-mode])[html-=
show-sidebar-toc] .md-sidebar-toc .md-toc{padding:0 16px}html body[for=3Dht=
ml-export]:not([data-presentation-mode])[html-show-sidebar-toc] .md-sidebar=
-toc .md-toc .md-toc-link-wrapper .md-toc-link{display:inline;padding:.25re=
m 0}html body[for=3Dhtml-export]:not([data-presentation-mode])[html-show-si=
debar-toc] .md-sidebar-toc .md-toc .md-toc-link-wrapper .md-toc-link div,ht=
ml body[for=3Dhtml-export]:not([data-presentation-mode])[html-show-sidebar-=
toc] .md-sidebar-toc .md-toc .md-toc-link-wrapper .md-toc-link p{display:in=
line}html body[for=3Dhtml-export]:not([data-presentation-mode])[html-show-s=
idebar-toc] .md-sidebar-toc .md-toc .md-toc-link-wrapper.highlighted .md-to=
c-link{font-weight:800}html body[for=3Dhtml-export]:not([data-presentation-=
mode])[html-show-sidebar-toc] .markdown-preview{left:300px;width:calc(100% =
- 300px);padding:2em calc(50% - 457px - 300px / 2);margin:0;box-sizing:bord=
er-box}@media screen and (max-width:1274px){html body[for=3Dhtml-export]:no=
t([data-presentation-mode])[html-show-sidebar-toc] .markdown-preview{paddin=
g:2em}}@media screen and (max-width:450px){html body[for=3Dhtml-export]:not=
([data-presentation-mode])[html-show-sidebar-toc] .markdown-preview{width:1=
00%}}html body[for=3Dhtml-export]:not([data-presentation-mode]):not([html-s=
how-sidebar-toc]) .markdown-preview{left:50%;transform:translateX(-50%)}htm=
l body[for=3Dhtml-export]:not([data-presentation-mode]):not([html-show-side=
bar-toc]) .md-sidebar-toc{display:none}
/* Please visit the URL below for more information: */
/*   <a href=3D"https://shd101wyy.github.io/markdown-preview-enhanced/#/cus=
tomize-css">https://shd101wyy.github.io/markdown-preview-enhanced/#/customi=
ze-css</a> */

      </style>
      <!-- The content below will be included at the end of the <head> elem=
ent. -->
   =20
   =20
      <div class=3D"crossnote markdown-preview  ">
     =20
<h1 id=3D"task-dependeny-changes">Task dependeny changes </h1>
<h2 id=3D"configuration-image-fitimage-initramfs-unbundled">Configuration: =
image, fitimage, initramfs, unbundled </h2>
<pre data-role=3D"codeBlock" data-info=3D"raw" class=3D"language-raw raw"><=
code>KERNEL_IMAGETYPE =3D "Image"
KERNEL_IMAGETYPES +=3D " fitImage "
KERNEL_CLASSES =3D " kernel-fitimage "
IMAGE_FSTYPES +=3D "cpio.gz"
INITRAMFS_IMAGE =3D "core-image-minimal-initramfs"
</code></pre><h3 id=3D"branch-master">branch: master </h3>
<div><!--?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?-->

<!-- Generated by graphviz version 9.0.0 (20230911.1827)
 -->
<!-- Title: depends Pages: 1 -->
<svg width=3D"533pt" height=3D"548pt" viewBox=3D"0.00 0.00 532.69 548.00" x=
mlns=3D"http://www.w3.org/2000/svg" xmlns:xlink=3D"http://www.w3.org/1999/x=
link">
<g id=3D"graph0" class=3D"graph" transform=3D"scale(1 1) rotate(0) translat=
e(4 544)">
<title>depends</title>
<polygon fill=3D"white" stroke=3D"none" points=3D"-4,4 -4,-544 528.69,-544 =
528.69,4 -4,4"></polygon>
<!-- core&#45;image&#45;minimal.do_build -->
<g id=3D"node1" class=3D"node">
<title>core-image-minimal.do_build</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"343" cy=3D"-522" rx=3D"123" r=
y=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"343" y=3D"-516.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">core-image-minimal.do_build</text>
</g>
<!-- do_deploy -->
<g id=3D"node2" class=3D"node">
<title>do_deploy</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"343" cy=3D"-450" rx=3D"49.82"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"343" y=3D"-444.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_deploy</text>
</g>
<!-- core&#45;image&#45;minimal.do_build&#45;&gt;do_deploy -->
<g id=3D"edge1" class=3D"edge">
<title>core-image-minimal.do_build-&gt;do_deploy</title>
<path fill=3D"none" stroke=3D"black" d=3D"M343,-503.7C343,-496.41 343,-487.=
73 343,-479.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"346.5,-479.62 343,-469.6=
2 339.5,-479.62 346.5,-479.62"></polygon>
</g>
<!-- do_assemble_fitimage_initramfs -->
<g id=3D"node6" class=3D"node">
<title>do_assemble_fitimage_initramfs</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"182" cy=3D"-378" rx=3D"133.24=
" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"182" y=3D"-372.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_assemble_fitimage_initramfs</text>
</g>
<!-- do_deploy&#45;&gt;do_assemble_fitimage_initramfs -->
<g id=3D"edge8" class=3D"edge">
<title>do_deploy-&gt;do_assemble_fitimage_initramfs</title>
<path fill=3D"none" stroke=3D"black" d=3D"M311.95,-435.5C288.98,-425.52 257=
.25,-411.72 230.88,-400.26"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"232.28,-397.05 221.72,-3=
96.27 229.49,-403.47 232.28,-397.05"></polygon>
</g>
<!-- do_bundle_initramfs -->
<g id=3D"node8" class=3D"node">
<title>do_bundle_initramfs</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"243" cy=3D"-306" rx=3D"88.2" =
ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"243" y=3D"-300.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_bundle_initramfs</text>
</g>
<!-- do_deploy&#45;&gt;do_bundle_initramfs -->
<g id=3D"edge9" class=3D"edge">
<title>do_deploy-&gt;do_bundle_initramfs</title>
<path fill=3D"none" stroke=3D"black" d=3D"M343.1,-431.76C342.41,-412.63 338=
.82,-381.63 324,-360 315.21,-347.19 302.21,-336.72 289.19,-328.57"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"290.99,-325.57 280.59,-3=
23.55 287.47,-331.62 290.99,-325.57"></polygon>
</g>
<!-- do_populate_sysroot -->
<g id=3D"node10" class=3D"node">
<title>do_populate_sysroot</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"437" cy=3D"-306" rx=3D"87.69"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"437" y=3D"-300.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_populate_sysroot</text>
</g>
<!-- do_deploy&#45;&gt;do_populate_sysroot -->
<g id=3D"edge10" class=3D"edge">
<title>do_deploy-&gt;do_populate_sysroot</title>
<path fill=3D"none" stroke=3D"black" d=3D"M354.15,-432.15C370.24,-407.84 40=
0.15,-362.66 419.29,-333.75"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"422.13,-335.8 424.73,-32=
5.53 416.29,-331.94 422.13,-335.8"></polygon>
</g>
<!-- do_assemble_fitimage -->
<g id=3D"node3" class=3D"node">
<title>do_assemble_fitimage</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"343" cy=3D"-162" rx=3D"94.86"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"343" y=3D"-156.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_assemble_fitimage</text>
</g>
<!-- do_compile -->
<g id=3D"node4" class=3D"node">
<title>do_compile</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"343" cy=3D"-18" rx=3D"54.93" =
ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"343" y=3D"-12.95" font-family=3D"Times,se=
rif" font-size=3D"14.00">do_compile</text>
</g>
<!-- do_assemble_fitimage&#45;&gt;do_compile -->
<g id=3D"edge2" class=3D"edge">
<title>do_assemble_fitimage-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M275.06,-149.15C251.71,-141.46 22=
7.95,-128.82 214,-108 205.09,-94.71 205.09,-85.29 214,-72 229.39,-49.03 256=
.72,-36.01 282.27,-28.63"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"282.82,-32.1 291.61,-26.=
18 281.04,-25.33 282.82,-32.1"></polygon>
</g>
<!-- do_kernel_generate_rsa_keys -->
<g id=3D"node5" class=3D"node">
<title>do_kernel_generate_rsa_keys</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"343" cy=3D"-90" rx=3D"120.45"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"343" y=3D"-84.95" font-family=3D"Times,se=
rif" font-size=3D"14.00">do_kernel_generate_rsa_keys</text>
</g>
<!-- do_assemble_fitimage&#45;&gt;do_kernel_generate_rsa_keys -->
<g id=3D"edge3" class=3D"edge">
<title>do_assemble_fitimage-&gt;do_kernel_generate_rsa_keys</title>
<path fill=3D"none" stroke=3D"black" d=3D"M343,-143.7C343,-136.41 343,-127.=
73 343,-119.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"346.5,-119.62 343,-109.6=
2 339.5,-119.62 346.5,-119.62"></polygon>
</g>
<!-- do_kernel_generate_rsa_keys&#45;&gt;do_compile -->
<g id=3D"edge13" class=3D"edge">
<title>do_kernel_generate_rsa_keys-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M343,-71.7C343,-64.41 343,-55.73 =
343,-47.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"346.5,-47.62 343,-37.62 =
339.5,-47.62 346.5,-47.62"></polygon>
</g>
<!-- core&#45;image&#45;minimal.do_image_complete -->
<g id=3D"node7" class=3D"node">
<title>core-image-minimal.do_image_complete</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"166" cy=3D"-234" rx=3D"166" r=
y=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"166" y=3D"-228.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">core-image-minimal.do_image_complete</text>
</g>
<!-- do_assemble_fitimage_initramfs&#45;&gt;core&#45;image&#45;minimal.do_i=
mage_complete -->
<g id=3D"edge4" class=3D"edge">
<title>do_assemble_fitimage_initramfs-&gt;core-image-minimal.do_image_compl=
ete</title>
<path fill=3D"none" stroke=3D"black" d=3D"M166.39,-359.77C158.62,-350.03 15=
0.05,-337.18 146,-324 139.78,-303.79 145.49,-280.45 152.38,-262.74"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"155.55,-264.23 156.24,-2=
53.66 149.11,-261.49 155.55,-264.23"></polygon>
</g>
<!-- do_assemble_fitimage_initramfs&#45;&gt;do_bundle_initramfs -->
<g id=3D"edge5" class=3D"edge">
<title>do_assemble_fitimage_initramfs-&gt;do_bundle_initramfs</title>
<path fill=3D"none" stroke=3D"black" d=3D"M197.08,-359.7C204.17,-351.56 212=
.77,-341.69 220.6,-332.7"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"223.17,-335.08 227.1,-32=
5.25 217.89,-330.49 223.17,-335.08"></polygon>
</g>
<!-- do_bundle_initramfs&#45;&gt;core&#45;image&#45;minimal.do_image_comple=
te -->
<g id=3D"edge6" class=3D"edge">
<title>do_bundle_initramfs-&gt;core-image-minimal.do_image_complete</title>
<path fill=3D"none" stroke=3D"black" d=3D"M224.36,-288.05C215.04,-279.58 20=
3.58,-269.17 193.29,-259.82"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"195.87,-257.43 186.12,-2=
53.29 191.16,-262.61 195.87,-257.43"></polygon>
</g>
<!-- do_install -->
<g id=3D"node9" class=3D"node">
<title>do_install</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"417" cy=3D"-234" rx=3D"47.26"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"417" y=3D"-228.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_install</text>
</g>
<!-- do_bundle_initramfs&#45;&gt;do_install -->
<g id=3D"edge7" class=3D"edge">
<title>do_bundle_initramfs-&gt;do_install</title>
<path fill=3D"none" stroke=3D"black" d=3D"M281.61,-289.46C309.31,-278.32 34=
6.6,-263.32 375.04,-251.88"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"376.09,-255.23 384.06,-2=
48.25 373.47,-248.74 376.09,-255.23"></polygon>
</g>
<!-- do_install&#45;&gt;do_assemble_fitimage -->
<g id=3D"edge11" class=3D"edge">
<title>do_install-&gt;do_assemble_fitimage</title>
<path fill=3D"none" stroke=3D"black" d=3D"M399.83,-216.76C390.76,-208.18 37=
9.43,-197.46 369.27,-187.86"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"371.87,-185.49 362.2,-18=
1.16 367.06,-190.58 371.87,-185.49"></polygon>
</g>
<!-- do_install&#45;&gt;do_compile -->
<g id=3D"edge12" class=3D"edge">
<title>do_install-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M431.51,-216.68C456.85,-186.12 50=
3.57,-119.11 472,-72 456.6,-49.03 429.28,-36.01 403.73,-28.63"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"404.95,-25.33 394.39,-26=
.18 403.17,-32.1 404.95,-25.33"></polygon>
</g>
<!-- do_populate_sysroot&#45;&gt;do_install -->
<g id=3D"edge14" class=3D"edge">
<title>do_populate_sysroot-&gt;do_install</title>
<path fill=3D"none" stroke=3D"black" d=3D"M432.05,-287.7C429.92,-280.24 427=
.37,-271.32 424.99,-262.97"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"428.41,-262.21 422.3,-25=
3.56 421.68,-264.14 428.41,-262.21"></polygon>
</g>
</g>
</svg>
</div><h3 id=3D"branch-adrianfkernel-fitimage-sstate">branch: adrianf/kerne=
l-fitimage-sstate </h3>
<div><!--?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?-->

<!-- Generated by graphviz version 9.0.0 (20230911.1827)
 -->
<!-- Title: depends Pages: 1 -->
<svg width=3D"572pt" height=3D"548pt" viewBox=3D"0.00 0.00 571.69 548.00" x=
mlns=3D"http://www.w3.org/2000/svg" xmlns:xlink=3D"http://www.w3.org/1999/x=
link">
<g id=3D"graph0" class=3D"graph" transform=3D"scale(1 1) rotate(0) translat=
e(4 544)">
<title>depends</title>
<polygon fill=3D"white" stroke=3D"none" points=3D"-4,4 -4,-544 567.69,-544 =
567.69,4 -4,4"></polygon>
<!-- core&#45;image&#45;minimal.do_build -->
<g id=3D"node1" class=3D"node">
<title>core-image-minimal.do_build</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"271" cy=3D"-522" rx=3D"123" r=
y=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"271" y=3D"-516.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">core-image-minimal.do_build</text>
</g>
<!-- do_deploy -->
<g id=3D"node2" class=3D"node">
<title>do_deploy</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"350" cy=3D"-378" rx=3D"49.82"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"350" y=3D"-372.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_deploy</text>
</g>
<!-- core&#45;image&#45;minimal.do_build&#45;&gt;do_deploy -->
<g id=3D"edge1" class=3D"edge">
<title>core-image-minimal.do_build-&gt;do_deploy</title>
<path fill=3D"none" stroke=3D"black" d=3D"M296.99,-503.98C309.1,-494.74 322=
.65,-482.28 331,-468 341.73,-449.62 346.43,-425.94 348.47,-407.63"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"351.96,-407.99 349.35,-3=
97.72 344.98,-407.37 351.96,-407.99"></polygon>
</g>
<!-- do_deploy_fitimage_unbundled -->
<g id=3D"node3" class=3D"node">
<title>do_deploy_fitimage_unbundled</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"193" cy=3D"-450" rx=3D"129.15=
" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"193" y=3D"-444.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_deploy_fitimage_unbundled</text>
</g>
<!-- core&#45;image&#45;minimal.do_build&#45;&gt;do_deploy_fitimage_unbundl=
ed -->
<g id=3D"edge2" class=3D"edge">
<title>core-image-minimal.do_build-&gt;do_deploy_fitimage_unbundled</title>
<path fill=3D"none" stroke=3D"black" d=3D"M252.11,-504.05C242.67,-495.58 23=
1.07,-485.17 220.65,-475.82"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"223.15,-473.36 213.37,-4=
69.29 218.48,-478.57 223.15,-473.36"></polygon>
</g>
<!-- core&#45;image&#45;minimal.do_image_complete -->
<g id=3D"node7" class=3D"node">
<title>core-image-minimal.do_image_complete</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"166" cy=3D"-306" rx=3D"166" r=
y=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"166" y=3D"-300.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">core-image-minimal.do_image_complete</text>
</g>
<!-- do_deploy&#45;&gt;core&#45;image&#45;minimal.do_image_complete -->
<g id=3D"edge5" class=3D"edge">
<title>do_deploy-&gt;core-image-minimal.do_image_complete</title>
<path fill=3D"none" stroke=3D"black" d=3D"M316.68,-364.32C290,-354.17 252.0=
2,-339.72 220.86,-327.87"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"222.16,-324.62 211.57,-3=
24.34 219.67,-331.17 222.16,-324.62"></polygon>
</g>
<!-- do_install -->
<g id=3D"node8" class=3D"node">
<title>do_install</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"418" cy=3D"-234" rx=3D"47.26"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"418" y=3D"-228.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_install</text>
</g>
<!-- do_deploy&#45;&gt;do_install -->
<g id=3D"edge6" class=3D"edge">
<title>do_deploy-&gt;do_install</title>
<path fill=3D"none" stroke=3D"black" d=3D"M353.9,-359.63C358.44,-341.2 366.=
89,-311.56 379,-288 383.93,-278.4 390.53,-268.67 396.9,-260.21"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"399.55,-262.5 402.95,-25=
2.47 394.04,-258.19 399.55,-262.5"></polygon>
</g>
<!-- do_populate_sysroot -->
<g id=3D"node9" class=3D"node">
<title>do_populate_sysroot</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"476" cy=3D"-306" rx=3D"87.69"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"476" y=3D"-300.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_populate_sysroot</text>
</g>
<!-- do_deploy&#45;&gt;do_populate_sysroot -->
<g id=3D"edge7" class=3D"edge">
<title>do_deploy-&gt;do_populate_sysroot</title>
<path fill=3D"none" stroke=3D"black" d=3D"M376.41,-362.33C393.86,-352.63 41=
7.05,-339.75 436.65,-328.86"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"438.17,-332.02 445.21,-3=
24.1 434.77,-325.9 438.17,-332.02"></polygon>
</g>
<!-- do_deploy_fitimage_unbundled&#45;&gt;do_deploy -->
<g id=3D"edge9" class=3D"edge">
<title>do_deploy_fitimage_unbundled-&gt;do_deploy</title>
<path fill=3D"none" stroke=3D"black" d=3D"M230.2,-432.41C253.9,-421.85 284.=
61,-408.15 309.01,-397.27"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"310.29,-400.54 318,-393.=
27 307.44,-394.14 310.29,-400.54"></polygon>
</g>
<!-- do_deploy_fitimage_unbundled&#45;&gt;core&#45;image&#45;minimal.do_ima=
ge_complete -->
<g id=3D"edge8" class=3D"edge">
<title>do_deploy_fitimage_unbundled-&gt;core-image-minimal.do_image_complet=
e</title>
<path fill=3D"none" stroke=3D"black" d=3D"M189.69,-431.59C185.13,-407.61 17=
6.86,-364.14 171.4,-335.42"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"174.84,-334.77 169.53,-3=
25.6 167.96,-336.08 174.84,-334.77"></polygon>
</g>
<!-- do_assemble_fitimage -->
<g id=3D"node4" class=3D"node">
<title>do_assemble_fitimage</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"344" cy=3D"-162" rx=3D"94.86"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"344" y=3D"-156.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_assemble_fitimage</text>
</g>
<!-- do_compile -->
<g id=3D"node5" class=3D"node">
<title>do_compile</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"344" cy=3D"-18" rx=3D"54.93" =
ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"344" y=3D"-12.95" font-family=3D"Times,se=
rif" font-size=3D"14.00">do_compile</text>
</g>
<!-- do_assemble_fitimage&#45;&gt;do_compile -->
<g id=3D"edge3" class=3D"edge">
<title>do_assemble_fitimage-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M276.06,-149.15C252.71,-141.46 22=
8.95,-128.82 215,-108 206.09,-94.71 206.09,-85.29 215,-72 230.39,-49.03 257=
.72,-36.01 283.27,-28.63"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"283.82,-32.1 292.61,-26.=
18 282.04,-25.33 283.82,-32.1"></polygon>
</g>
<!-- do_kernel_generate_rsa_keys -->
<g id=3D"node6" class=3D"node">
<title>do_kernel_generate_rsa_keys</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"344" cy=3D"-90" rx=3D"120.45"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"344" y=3D"-84.95" font-family=3D"Times,se=
rif" font-size=3D"14.00">do_kernel_generate_rsa_keys</text>
</g>
<!-- do_assemble_fitimage&#45;&gt;do_kernel_generate_rsa_keys -->
<g id=3D"edge4" class=3D"edge">
<title>do_assemble_fitimage-&gt;do_kernel_generate_rsa_keys</title>
<path fill=3D"none" stroke=3D"black" d=3D"M344,-143.7C344,-136.41 344,-127.=
73 344,-119.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"347.5,-119.62 344,-109.6=
2 340.5,-119.62 347.5,-119.62"></polygon>
</g>
<!-- do_kernel_generate_rsa_keys&#45;&gt;do_compile -->
<g id=3D"edge12" class=3D"edge">
<title>do_kernel_generate_rsa_keys-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M344,-71.7C344,-64.41 344,-55.73 =
344,-47.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"347.5,-47.62 344,-37.62 =
340.5,-47.62 347.5,-47.62"></polygon>
</g>
<!-- do_install&#45;&gt;do_assemble_fitimage -->
<g id=3D"edge10" class=3D"edge">
<title>do_install-&gt;do_assemble_fitimage</title>
<path fill=3D"none" stroke=3D"black" d=3D"M400.83,-216.76C391.76,-208.18 38=
0.43,-197.46 370.27,-187.86"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"372.87,-185.49 363.2,-18=
1.16 368.06,-190.58 372.87,-185.49"></polygon>
</g>
<!-- do_install&#45;&gt;do_compile -->
<g id=3D"edge11" class=3D"edge">
<title>do_install-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M432.51,-216.68C457.85,-186.12 50=
4.57,-119.11 473,-72 457.6,-49.03 430.28,-36.01 404.73,-28.63"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"405.95,-25.33 395.39,-26=
.18 404.17,-32.1 405.95,-25.33"></polygon>
</g>
<!-- do_populate_sysroot&#45;&gt;do_install -->
<g id=3D"edge13" class=3D"edge">
<title>do_populate_sysroot-&gt;do_install</title>
<path fill=3D"none" stroke=3D"black" d=3D"M461.96,-288.05C455.02,-279.68 44=
6.5,-269.4 438.82,-260.13"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"441.55,-257.94 432.47,-2=
52.47 436.16,-262.41 441.55,-257.94"></polygon>
</g>
</g>
</svg>
</div><h2 id=3D"diff">Diff </h2>
<pre data-role=3D"codeBlock" data-info=3D"patch" class=3D"language-patch pa=
tch"><code>2a3
&gt; "core-image-minimal.do_build" -&gt; "do_deploy_fitimage_unbundled"
6,11d6
&lt; "do_assemble_fitimage_initramfs" [label=3D"do_assemble_fitimage_initra=
mfs"]
&lt; "do_assemble_fitimage_initramfs" -&gt; "core-image-minimal.do_image_co=
mplete"
&lt; "do_assemble_fitimage_initramfs" -&gt; "do_bundle_initramfs"
&lt; "do_bundle_initramfs" [label=3D"do_bundle_initramfs"]
&lt; "do_bundle_initramfs" -&gt; "core-image-minimal.do_image_complete"
&lt; "do_bundle_initramfs" -&gt; "do_install"
14,15c9,10
&lt; "do_deploy" -&gt; "do_assemble_fitimage_initramfs"
&lt; "do_deploy" -&gt; "do_bundle_initramfs"
---
&gt; "do_deploy" -&gt; "core-image-minimal.do_image_complete"
&gt; "do_deploy" -&gt; "do_install"
16a12,14
&gt; "do_deploy_fitimage_unbundled" [label=3D"do_deploy_fitimage_unbundled"=
]
&gt; "do_deploy_fitimage_unbundled" -&gt; "core-image-minimal.do_image_comp=
lete"
&gt; "do_deploy_fitimage_unbundled" -&gt; "do_deploy"
</code></pre><h2 id=3D"configuration-fitimage-initramfs-unbundled">Configur=
ation: fitimage, initramfs, unbundled </h2>
<pre data-role=3D"codeBlock" data-info=3D"raw" class=3D"language-raw raw"><=
code>KERNEL_IMAGETYPE:forcevariable =3D "fitImage"
KERNEL_CLASSES =3D " kernel-fitimage "
IMAGE_FSTYPES +=3D "cpio.gz"
INITRAMFS_IMAGE =3D "core-image-minimal-initramfs"
</code></pre><h3 id=3D"branch-master-1">branch: master </h3>
<div><!--?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?-->

<!-- Generated by graphviz version 9.0.0 (20230911.1827)
 -->
<!-- Title: depends Pages: 1 -->
<svg width=3D"533pt" height=3D"548pt" viewBox=3D"0.00 0.00 532.69 548.00" x=
mlns=3D"http://www.w3.org/2000/svg" xmlns:xlink=3D"http://www.w3.org/1999/x=
link">
<g id=3D"graph0" class=3D"graph" transform=3D"scale(1 1) rotate(0) translat=
e(4 544)">
<title>depends</title>
<polygon fill=3D"white" stroke=3D"none" points=3D"-4,4 -4,-544 528.69,-544 =
528.69,4 -4,4"></polygon>
<!-- core&#45;image&#45;minimal.do_build -->
<g id=3D"node1" class=3D"node">
<title>core-image-minimal.do_build</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"343" cy=3D"-522" rx=3D"123" r=
y=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"343" y=3D"-516.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">core-image-minimal.do_build</text>
</g>
<!-- do_deploy -->
<g id=3D"node2" class=3D"node">
<title>do_deploy</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"343" cy=3D"-450" rx=3D"49.82"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"343" y=3D"-444.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_deploy</text>
</g>
<!-- core&#45;image&#45;minimal.do_build&#45;&gt;do_deploy -->
<g id=3D"edge1" class=3D"edge">
<title>core-image-minimal.do_build-&gt;do_deploy</title>
<path fill=3D"none" stroke=3D"black" d=3D"M343,-503.7C343,-496.41 343,-487.=
73 343,-479.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"346.5,-479.62 343,-469.6=
2 339.5,-479.62 346.5,-479.62"></polygon>
</g>
<!-- do_assemble_fitimage_initramfs -->
<g id=3D"node6" class=3D"node">
<title>do_assemble_fitimage_initramfs</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"182" cy=3D"-378" rx=3D"133.24=
" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"182" y=3D"-372.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_assemble_fitimage_initramfs</text>
</g>
<!-- do_deploy&#45;&gt;do_assemble_fitimage_initramfs -->
<g id=3D"edge8" class=3D"edge">
<title>do_deploy-&gt;do_assemble_fitimage_initramfs</title>
<path fill=3D"none" stroke=3D"black" d=3D"M311.95,-435.5C288.98,-425.52 257=
.25,-411.72 230.88,-400.26"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"232.28,-397.05 221.72,-3=
96.27 229.49,-403.47 232.28,-397.05"></polygon>
</g>
<!-- do_bundle_initramfs -->
<g id=3D"node8" class=3D"node">
<title>do_bundle_initramfs</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"243" cy=3D"-306" rx=3D"88.2" =
ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"243" y=3D"-300.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_bundle_initramfs</text>
</g>
<!-- do_deploy&#45;&gt;do_bundle_initramfs -->
<g id=3D"edge9" class=3D"edge">
<title>do_deploy-&gt;do_bundle_initramfs</title>
<path fill=3D"none" stroke=3D"black" d=3D"M343.1,-431.76C342.41,-412.63 338=
.82,-381.63 324,-360 315.21,-347.19 302.21,-336.72 289.19,-328.57"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"290.99,-325.57 280.59,-3=
23.55 287.47,-331.62 290.99,-325.57"></polygon>
</g>
<!-- do_populate_sysroot -->
<g id=3D"node10" class=3D"node">
<title>do_populate_sysroot</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"437" cy=3D"-306" rx=3D"87.69"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"437" y=3D"-300.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_populate_sysroot</text>
</g>
<!-- do_deploy&#45;&gt;do_populate_sysroot -->
<g id=3D"edge10" class=3D"edge">
<title>do_deploy-&gt;do_populate_sysroot</title>
<path fill=3D"none" stroke=3D"black" d=3D"M354.15,-432.15C370.24,-407.84 40=
0.15,-362.66 419.29,-333.75"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"422.13,-335.8 424.73,-32=
5.53 416.29,-331.94 422.13,-335.8"></polygon>
</g>
<!-- do_assemble_fitimage -->
<g id=3D"node3" class=3D"node">
<title>do_assemble_fitimage</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"343" cy=3D"-162" rx=3D"94.86"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"343" y=3D"-156.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_assemble_fitimage</text>
</g>
<!-- do_compile -->
<g id=3D"node4" class=3D"node">
<title>do_compile</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"343" cy=3D"-18" rx=3D"54.93" =
ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"343" y=3D"-12.95" font-family=3D"Times,se=
rif" font-size=3D"14.00">do_compile</text>
</g>
<!-- do_assemble_fitimage&#45;&gt;do_compile -->
<g id=3D"edge2" class=3D"edge">
<title>do_assemble_fitimage-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M275.06,-149.15C251.71,-141.46 22=
7.95,-128.82 214,-108 205.09,-94.71 205.09,-85.29 214,-72 229.39,-49.03 256=
.72,-36.01 282.27,-28.63"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"282.82,-32.1 291.61,-26.=
18 281.04,-25.33 282.82,-32.1"></polygon>
</g>
<!-- do_kernel_generate_rsa_keys -->
<g id=3D"node5" class=3D"node">
<title>do_kernel_generate_rsa_keys</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"343" cy=3D"-90" rx=3D"120.45"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"343" y=3D"-84.95" font-family=3D"Times,se=
rif" font-size=3D"14.00">do_kernel_generate_rsa_keys</text>
</g>
<!-- do_assemble_fitimage&#45;&gt;do_kernel_generate_rsa_keys -->
<g id=3D"edge3" class=3D"edge">
<title>do_assemble_fitimage-&gt;do_kernel_generate_rsa_keys</title>
<path fill=3D"none" stroke=3D"black" d=3D"M343,-143.7C343,-136.41 343,-127.=
73 343,-119.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"346.5,-119.62 343,-109.6=
2 339.5,-119.62 346.5,-119.62"></polygon>
</g>
<!-- do_kernel_generate_rsa_keys&#45;&gt;do_compile -->
<g id=3D"edge13" class=3D"edge">
<title>do_kernel_generate_rsa_keys-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M343,-71.7C343,-64.41 343,-55.73 =
343,-47.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"346.5,-47.62 343,-37.62 =
339.5,-47.62 346.5,-47.62"></polygon>
</g>
<!-- core&#45;image&#45;minimal.do_image_complete -->
<g id=3D"node7" class=3D"node">
<title>core-image-minimal.do_image_complete</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"166" cy=3D"-234" rx=3D"166" r=
y=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"166" y=3D"-228.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">core-image-minimal.do_image_complete</text>
</g>
<!-- do_assemble_fitimage_initramfs&#45;&gt;core&#45;image&#45;minimal.do_i=
mage_complete -->
<g id=3D"edge4" class=3D"edge">
<title>do_assemble_fitimage_initramfs-&gt;core-image-minimal.do_image_compl=
ete</title>
<path fill=3D"none" stroke=3D"black" d=3D"M166.39,-359.77C158.62,-350.03 15=
0.05,-337.18 146,-324 139.78,-303.79 145.49,-280.45 152.38,-262.74"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"155.55,-264.23 156.24,-2=
53.66 149.11,-261.49 155.55,-264.23"></polygon>
</g>
<!-- do_assemble_fitimage_initramfs&#45;&gt;do_bundle_initramfs -->
<g id=3D"edge5" class=3D"edge">
<title>do_assemble_fitimage_initramfs-&gt;do_bundle_initramfs</title>
<path fill=3D"none" stroke=3D"black" d=3D"M197.08,-359.7C204.17,-351.56 212=
.77,-341.69 220.6,-332.7"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"223.17,-335.08 227.1,-32=
5.25 217.89,-330.49 223.17,-335.08"></polygon>
</g>
<!-- do_bundle_initramfs&#45;&gt;core&#45;image&#45;minimal.do_image_comple=
te -->
<g id=3D"edge6" class=3D"edge">
<title>do_bundle_initramfs-&gt;core-image-minimal.do_image_complete</title>
<path fill=3D"none" stroke=3D"black" d=3D"M224.36,-288.05C215.04,-279.58 20=
3.58,-269.17 193.29,-259.82"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"195.87,-257.43 186.12,-2=
53.29 191.16,-262.61 195.87,-257.43"></polygon>
</g>
<!-- do_install -->
<g id=3D"node9" class=3D"node">
<title>do_install</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"417" cy=3D"-234" rx=3D"47.26"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"417" y=3D"-228.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_install</text>
</g>
<!-- do_bundle_initramfs&#45;&gt;do_install -->
<g id=3D"edge7" class=3D"edge">
<title>do_bundle_initramfs-&gt;do_install</title>
<path fill=3D"none" stroke=3D"black" d=3D"M281.61,-289.46C309.31,-278.32 34=
6.6,-263.32 375.04,-251.88"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"376.09,-255.23 384.06,-2=
48.25 373.47,-248.74 376.09,-255.23"></polygon>
</g>
<!-- do_install&#45;&gt;do_assemble_fitimage -->
<g id=3D"edge11" class=3D"edge">
<title>do_install-&gt;do_assemble_fitimage</title>
<path fill=3D"none" stroke=3D"black" d=3D"M399.83,-216.76C390.76,-208.18 37=
9.43,-197.46 369.27,-187.86"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"371.87,-185.49 362.2,-18=
1.16 367.06,-190.58 371.87,-185.49"></polygon>
</g>
<!-- do_install&#45;&gt;do_compile -->
<g id=3D"edge12" class=3D"edge">
<title>do_install-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M431.51,-216.68C456.85,-186.12 50=
3.57,-119.11 472,-72 456.6,-49.03 429.28,-36.01 403.73,-28.63"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"404.95,-25.33 394.39,-26=
.18 403.17,-32.1 404.95,-25.33"></polygon>
</g>
<!-- do_populate_sysroot&#45;&gt;do_install -->
<g id=3D"edge14" class=3D"edge">
<title>do_populate_sysroot-&gt;do_install</title>
<path fill=3D"none" stroke=3D"black" d=3D"M432.05,-287.7C429.92,-280.24 427=
.37,-271.32 424.99,-262.97"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"428.41,-262.21 422.3,-25=
3.56 421.68,-264.14 428.41,-262.21"></polygon>
</g>
</g>
</svg>
</div><h3 id=3D"branch-adrianfkernel-fitimage-sstate-1">branch: adrianf/ker=
nel-fitimage-sstate </h3>
<div><!--?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?-->

<!-- Generated by graphviz version 9.0.0 (20230911.1827)
 -->
<!-- Title: depends Pages: 1 -->
<svg width=3D"572pt" height=3D"548pt" viewBox=3D"0.00 0.00 571.69 548.00" x=
mlns=3D"http://www.w3.org/2000/svg" xmlns:xlink=3D"http://www.w3.org/1999/x=
link">
<g id=3D"graph0" class=3D"graph" transform=3D"scale(1 1) rotate(0) translat=
e(4 544)">
<title>depends</title>
<polygon fill=3D"white" stroke=3D"none" points=3D"-4,4 -4,-544 567.69,-544 =
567.69,4 -4,4"></polygon>
<!-- core&#45;image&#45;minimal.do_build -->
<g id=3D"node1" class=3D"node">
<title>core-image-minimal.do_build</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"271" cy=3D"-522" rx=3D"123" r=
y=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"271" y=3D"-516.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">core-image-minimal.do_build</text>
</g>
<!-- do_deploy -->
<g id=3D"node2" class=3D"node">
<title>do_deploy</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"350" cy=3D"-378" rx=3D"49.82"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"350" y=3D"-372.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_deploy</text>
</g>
<!-- core&#45;image&#45;minimal.do_build&#45;&gt;do_deploy -->
<g id=3D"edge1" class=3D"edge">
<title>core-image-minimal.do_build-&gt;do_deploy</title>
<path fill=3D"none" stroke=3D"black" d=3D"M296.99,-503.98C309.1,-494.74 322=
.65,-482.28 331,-468 341.73,-449.62 346.43,-425.94 348.47,-407.63"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"351.96,-407.99 349.35,-3=
97.72 344.98,-407.37 351.96,-407.99"></polygon>
</g>
<!-- do_deploy_fitimage_unbundled -->
<g id=3D"node3" class=3D"node">
<title>do_deploy_fitimage_unbundled</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"193" cy=3D"-450" rx=3D"129.15=
" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"193" y=3D"-444.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_deploy_fitimage_unbundled</text>
</g>
<!-- core&#45;image&#45;minimal.do_build&#45;&gt;do_deploy_fitimage_unbundl=
ed -->
<g id=3D"edge2" class=3D"edge">
<title>core-image-minimal.do_build-&gt;do_deploy_fitimage_unbundled</title>
<path fill=3D"none" stroke=3D"black" d=3D"M252.11,-504.05C242.67,-495.58 23=
1.07,-485.17 220.65,-475.82"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"223.15,-473.36 213.37,-4=
69.29 218.48,-478.57 223.15,-473.36"></polygon>
</g>
<!-- core&#45;image&#45;minimal.do_image_complete -->
<g id=3D"node7" class=3D"node">
<title>core-image-minimal.do_image_complete</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"166" cy=3D"-306" rx=3D"166" r=
y=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"166" y=3D"-300.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">core-image-minimal.do_image_complete</text>
</g>
<!-- do_deploy&#45;&gt;core&#45;image&#45;minimal.do_image_complete -->
<g id=3D"edge5" class=3D"edge">
<title>do_deploy-&gt;core-image-minimal.do_image_complete</title>
<path fill=3D"none" stroke=3D"black" d=3D"M316.68,-364.32C290,-354.17 252.0=
2,-339.72 220.86,-327.87"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"222.16,-324.62 211.57,-3=
24.34 219.67,-331.17 222.16,-324.62"></polygon>
</g>
<!-- do_install -->
<g id=3D"node8" class=3D"node">
<title>do_install</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"418" cy=3D"-234" rx=3D"47.26"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"418" y=3D"-228.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_install</text>
</g>
<!-- do_deploy&#45;&gt;do_install -->
<g id=3D"edge6" class=3D"edge">
<title>do_deploy-&gt;do_install</title>
<path fill=3D"none" stroke=3D"black" d=3D"M353.9,-359.63C358.44,-341.2 366.=
89,-311.56 379,-288 383.93,-278.4 390.53,-268.67 396.9,-260.21"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"399.55,-262.5 402.95,-25=
2.47 394.04,-258.19 399.55,-262.5"></polygon>
</g>
<!-- do_populate_sysroot -->
<g id=3D"node9" class=3D"node">
<title>do_populate_sysroot</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"476" cy=3D"-306" rx=3D"87.69"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"476" y=3D"-300.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_populate_sysroot</text>
</g>
<!-- do_deploy&#45;&gt;do_populate_sysroot -->
<g id=3D"edge7" class=3D"edge">
<title>do_deploy-&gt;do_populate_sysroot</title>
<path fill=3D"none" stroke=3D"black" d=3D"M376.41,-362.33C393.86,-352.63 41=
7.05,-339.75 436.65,-328.86"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"438.17,-332.02 445.21,-3=
24.1 434.77,-325.9 438.17,-332.02"></polygon>
</g>
<!-- do_deploy_fitimage_unbundled&#45;&gt;do_deploy -->
<g id=3D"edge9" class=3D"edge">
<title>do_deploy_fitimage_unbundled-&gt;do_deploy</title>
<path fill=3D"none" stroke=3D"black" d=3D"M230.2,-432.41C253.9,-421.85 284.=
61,-408.15 309.01,-397.27"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"310.29,-400.54 318,-393.=
27 307.44,-394.14 310.29,-400.54"></polygon>
</g>
<!-- do_deploy_fitimage_unbundled&#45;&gt;core&#45;image&#45;minimal.do_ima=
ge_complete -->
<g id=3D"edge8" class=3D"edge">
<title>do_deploy_fitimage_unbundled-&gt;core-image-minimal.do_image_complet=
e</title>
<path fill=3D"none" stroke=3D"black" d=3D"M189.69,-431.59C185.13,-407.61 17=
6.86,-364.14 171.4,-335.42"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"174.84,-334.77 169.53,-3=
25.6 167.96,-336.08 174.84,-334.77"></polygon>
</g>
<!-- do_assemble_fitimage -->
<g id=3D"node4" class=3D"node">
<title>do_assemble_fitimage</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"344" cy=3D"-162" rx=3D"94.86"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"344" y=3D"-156.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_assemble_fitimage</text>
</g>
<!-- do_compile -->
<g id=3D"node5" class=3D"node">
<title>do_compile</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"344" cy=3D"-18" rx=3D"54.93" =
ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"344" y=3D"-12.95" font-family=3D"Times,se=
rif" font-size=3D"14.00">do_compile</text>
</g>
<!-- do_assemble_fitimage&#45;&gt;do_compile -->
<g id=3D"edge3" class=3D"edge">
<title>do_assemble_fitimage-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M276.06,-149.15C252.71,-141.46 22=
8.95,-128.82 215,-108 206.09,-94.71 206.09,-85.29 215,-72 230.39,-49.03 257=
.72,-36.01 283.27,-28.63"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"283.82,-32.1 292.61,-26.=
18 282.04,-25.33 283.82,-32.1"></polygon>
</g>
<!-- do_kernel_generate_rsa_keys -->
<g id=3D"node6" class=3D"node">
<title>do_kernel_generate_rsa_keys</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"344" cy=3D"-90" rx=3D"120.45"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"344" y=3D"-84.95" font-family=3D"Times,se=
rif" font-size=3D"14.00">do_kernel_generate_rsa_keys</text>
</g>
<!-- do_assemble_fitimage&#45;&gt;do_kernel_generate_rsa_keys -->
<g id=3D"edge4" class=3D"edge">
<title>do_assemble_fitimage-&gt;do_kernel_generate_rsa_keys</title>
<path fill=3D"none" stroke=3D"black" d=3D"M344,-143.7C344,-136.41 344,-127.=
73 344,-119.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"347.5,-119.62 344,-109.6=
2 340.5,-119.62 347.5,-119.62"></polygon>
</g>
<!-- do_kernel_generate_rsa_keys&#45;&gt;do_compile -->
<g id=3D"edge12" class=3D"edge">
<title>do_kernel_generate_rsa_keys-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M344,-71.7C344,-64.41 344,-55.73 =
344,-47.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"347.5,-47.62 344,-37.62 =
340.5,-47.62 347.5,-47.62"></polygon>
</g>
<!-- do_install&#45;&gt;do_assemble_fitimage -->
<g id=3D"edge10" class=3D"edge">
<title>do_install-&gt;do_assemble_fitimage</title>
<path fill=3D"none" stroke=3D"black" d=3D"M400.83,-216.76C391.76,-208.18 38=
0.43,-197.46 370.27,-187.86"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"372.87,-185.49 363.2,-18=
1.16 368.06,-190.58 372.87,-185.49"></polygon>
</g>
<!-- do_install&#45;&gt;do_compile -->
<g id=3D"edge11" class=3D"edge">
<title>do_install-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M432.51,-216.68C457.85,-186.12 50=
4.57,-119.11 473,-72 457.6,-49.03 430.28,-36.01 404.73,-28.63"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"405.95,-25.33 395.39,-26=
.18 404.17,-32.1 405.95,-25.33"></polygon>
</g>
<!-- do_populate_sysroot&#45;&gt;do_install -->
<g id=3D"edge13" class=3D"edge">
<title>do_populate_sysroot-&gt;do_install</title>
<path fill=3D"none" stroke=3D"black" d=3D"M461.96,-288.05C455.02,-279.68 44=
6.5,-269.4 438.82,-260.13"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"441.55,-257.94 432.47,-2=
52.47 436.16,-262.41 441.55,-257.94"></polygon>
</g>
</g>
</svg>
</div><h2 id=3D"diff-1">Diff </h2>
<pre data-role=3D"codeBlock" data-info=3D"patch" class=3D"language-patch pa=
tch"><code>2a3
&gt; "core-image-minimal.do_build" -&gt; "do_deploy_fitimage_unbundled"
6,11d6
&lt; "do_assemble_fitimage_initramfs" [label=3D"do_assemble_fitimage_initra=
mfs"]
&lt; "do_assemble_fitimage_initramfs" -&gt; "core-image-minimal.do_image_co=
mplete"
&lt; "do_assemble_fitimage_initramfs" -&gt; "do_bundle_initramfs"
&lt; "do_bundle_initramfs" [label=3D"do_bundle_initramfs"]
&lt; "do_bundle_initramfs" -&gt; "core-image-minimal.do_image_complete"
&lt; "do_bundle_initramfs" -&gt; "do_install"
14,15c9,10
&lt; "do_deploy" -&gt; "do_assemble_fitimage_initramfs"
&lt; "do_deploy" -&gt; "do_bundle_initramfs"
---
&gt; "do_deploy" -&gt; "core-image-minimal.do_image_complete"
&gt; "do_deploy" -&gt; "do_install"
16a12,14
&gt; "do_deploy_fitimage_unbundled" [label=3D"do_deploy_fitimage_unbundled"=
]
&gt; "do_deploy_fitimage_unbundled" -&gt; "core-image-minimal.do_image_comp=
lete"
&gt; "do_deploy_fitimage_unbundled" -&gt; "do_deploy"
</code></pre><h2 id=3D"configuration-image-fitimage-initramfs-bundled">Conf=
iguration: image, fitimage, initramfs, bundled </h2>
<pre data-role=3D"codeBlock" data-info=3D"raw" class=3D"language-raw raw"><=
code>KERNEL_IMAGETYPE =3D "Image"
KERNEL_IMAGETYPES +=3D " fitImage "
KERNEL_CLASSES =3D " kernel-fitimage "
IMAGE_FSTYPES +=3D "cpio.gz"
INITRAMFS_IMAGE =3D "core-image-minimal-initramfs"
INITRAMFS_IMAGE_BUNDLE =3D "1"
</code></pre><h3 id=3D"branch-master-2">branch: master </h3>
<div><!--?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?-->

<!-- Generated by graphviz version 9.0.0 (20230911.1827)
 -->
<!-- Title: depends Pages: 1 -->
<svg width=3D"649pt" height=3D"548pt" viewBox=3D"0.00 0.00 648.93 548.00" x=
mlns=3D"http://www.w3.org/2000/svg" xmlns:xlink=3D"http://www.w3.org/1999/x=
link">
<g id=3D"graph0" class=3D"graph" transform=3D"scale(1 1) rotate(0) translat=
e(4 544)">
<title>depends</title>
<polygon fill=3D"white" stroke=3D"none" points=3D"-4,4 -4,-544 644.93,-544 =
644.93,4 -4,4"></polygon>
<!-- core&#45;image&#45;minimal.do_build -->
<g id=3D"node1" class=3D"node">
<title>core-image-minimal.do_build</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"375.24" cy=3D"-522" rx=3D"123=
" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"375.24" y=3D"-516.95" font-family=3D"Time=
s,serif" font-size=3D"14.00">core-image-minimal.do_build</text>
</g>
<!-- do_deploy -->
<g id=3D"node2" class=3D"node">
<title>do_deploy</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"375.24" cy=3D"-450" rx=3D"49.=
82" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"375.24" y=3D"-444.95" font-family=3D"Time=
s,serif" font-size=3D"14.00">do_deploy</text>
</g>
<!-- core&#45;image&#45;minimal.do_build&#45;&gt;do_deploy -->
<g id=3D"edge1" class=3D"edge">
<title>core-image-minimal.do_build-&gt;do_deploy</title>
<path fill=3D"none" stroke=3D"black" d=3D"M375.24,-503.7C375.24,-496.41 375=
.24,-487.73 375.24,-479.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"378.74,-479.62 375.24,-4=
69.62 371.74,-479.62 378.74,-479.62"></polygon>
</g>
<!-- do_assemble_fitimage_initramfs -->
<g id=3D"node6" class=3D"node">
<title>do_assemble_fitimage_initramfs</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"133.24" cy=3D"-378" rx=3D"133=
.24" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"133.24" y=3D"-372.95" font-family=3D"Time=
s,serif" font-size=3D"14.00">do_assemble_fitimage_initramfs</text>
</g>
<!-- do_deploy&#45;&gt;do_assemble_fitimage_initramfs -->
<g id=3D"edge8" class=3D"edge">
<title>do_deploy-&gt;do_assemble_fitimage_initramfs</title>
<path fill=3D"none" stroke=3D"black" d=3D"M337.16,-437.99C300.1,-427.27 243=
.05,-410.76 198.71,-397.94"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"199.76,-394.6 189.18,-39=
5.18 197.82,-401.32 199.76,-394.6"></polygon>
</g>
<!-- do_bundle_initramfs -->
<g id=3D"node8" class=3D"node">
<title>do_bundle_initramfs</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"294.24" cy=3D"-306" rx=3D"88.=
2" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"294.24" y=3D"-300.95" font-family=3D"Time=
s,serif" font-size=3D"14.00">do_bundle_initramfs</text>
</g>
<!-- do_deploy&#45;&gt;do_bundle_initramfs -->
<g id=3D"edge9" class=3D"edge">
<title>do_deploy-&gt;do_bundle_initramfs</title>
<path fill=3D"none" stroke=3D"black" d=3D"M350.88,-433.96C337.77,-424.62 32=
2.44,-411.45 313.24,-396 302.35,-377.71 297.66,-354.03 295.66,-335.69"></pa=
th>
<polygon fill=3D"black" stroke=3D"black" points=3D"299.15,-335.42 294.81,-3=
25.76 292.18,-336.02 299.15,-335.42"></polygon>
</g>
<!-- do_populate_sysroot -->
<g id=3D"node10" class=3D"node">
<title>do_populate_sysroot</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"553.24" cy=3D"-306" rx=3D"87.=
69" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"553.24" y=3D"-300.95" font-family=3D"Time=
s,serif" font-size=3D"14.00">do_populate_sysroot</text>
</g>
<!-- do_deploy&#45;&gt;do_populate_sysroot -->
<g id=3D"edge10" class=3D"edge">
<title>do_deploy-&gt;do_populate_sysroot</title>
<path fill=3D"none" stroke=3D"black" d=3D"M423.08,-444.53C482.22,-437.91 57=
7.7,-423.23 599.24,-396 614.77,-376.36 598.29,-350.67 580.89,-331.94"></pat=
h>
<polygon fill=3D"black" stroke=3D"black" points=3D"583.51,-329.62 574,-324.=
95 578.53,-334.53 583.51,-329.62"></polygon>
</g>
<!-- do_transform_bundled_initramfs -->
<g id=3D"node11" class=3D"node">
<title>do_transform_bundled_initramfs</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"456.24" cy=3D"-378" rx=3D"133=
.75" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"456.24" y=3D"-372.95" font-family=3D"Time=
s,serif" font-size=3D"14.00">do_transform_bundled_initramfs</text>
</g>
<!-- do_deploy&#45;&gt;do_transform_bundled_initramfs -->
<g id=3D"edge11" class=3D"edge">
<title>do_deploy-&gt;do_transform_bundled_initramfs</title>
<path fill=3D"none" stroke=3D"black" d=3D"M393.62,-433.12C403.64,-424.46 41=
6.26,-413.55 427.54,-403.8"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"429.81,-406.47 435.09,-3=
97.28 425.23,-401.17 429.81,-406.47"></polygon>
</g>
<!-- do_assemble_fitimage -->
<g id=3D"node3" class=3D"node">
<title>do_assemble_fitimage</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"415.24" cy=3D"-162" rx=3D"94.=
86" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"415.24" y=3D"-156.95" font-family=3D"Time=
s,serif" font-size=3D"14.00">do_assemble_fitimage</text>
</g>
<!-- do_compile -->
<g id=3D"node4" class=3D"node">
<title>do_compile</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"415.24" cy=3D"-18" rx=3D"54.9=
3" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"415.24" y=3D"-12.95" font-family=3D"Times=
,serif" font-size=3D"14.00">do_compile</text>
</g>
<!-- do_assemble_fitimage&#45;&gt;do_compile -->
<g id=3D"edge2" class=3D"edge">
<title>do_assemble_fitimage-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M347.3,-149.15C323.95,-141.46 300=
.19,-128.82 286.24,-108 277.33,-94.71 277.33,-85.29 286.24,-72 301.63,-49.0=
3 328.96,-36.01 354.51,-28.63"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"355.06,-32.1 363.85,-26.=
18 353.29,-25.33 355.06,-32.1"></polygon>
</g>
<!-- do_kernel_generate_rsa_keys -->
<g id=3D"node5" class=3D"node">
<title>do_kernel_generate_rsa_keys</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"415.24" cy=3D"-90" rx=3D"120.=
45" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"415.24" y=3D"-84.95" font-family=3D"Times=
,serif" font-size=3D"14.00">do_kernel_generate_rsa_keys</text>
</g>
<!-- do_assemble_fitimage&#45;&gt;do_kernel_generate_rsa_keys -->
<g id=3D"edge3" class=3D"edge">
<title>do_assemble_fitimage-&gt;do_kernel_generate_rsa_keys</title>
<path fill=3D"none" stroke=3D"black" d=3D"M415.24,-143.7C415.24,-136.41 415=
.24,-127.73 415.24,-119.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"418.74,-119.62 415.24,-1=
09.62 411.74,-119.62 418.74,-119.62"></polygon>
</g>
<!-- do_kernel_generate_rsa_keys&#45;&gt;do_compile -->
<g id=3D"edge14" class=3D"edge">
<title>do_kernel_generate_rsa_keys-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M415.24,-71.7C415.24,-64.41 415.2=
4,-55.73 415.24,-47.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"418.74,-47.62 415.24,-37=
.62 411.74,-47.62 418.74,-47.62"></polygon>
</g>
<!-- core&#45;image&#45;minimal.do_image_complete -->
<g id=3D"node7" class=3D"node">
<title>core-image-minimal.do_image_complete</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"195.24" cy=3D"-234" rx=3D"166=
" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"195.24" y=3D"-228.95" font-family=3D"Time=
s,serif" font-size=3D"14.00">core-image-minimal.do_image_complete</text>
</g>
<!-- do_assemble_fitimage_initramfs&#45;&gt;core&#45;image&#45;minimal.do_i=
mage_complete -->
<g id=3D"edge4" class=3D"edge">
<title>do_assemble_fitimage_initramfs-&gt;core-image-minimal.do_image_compl=
ete</title>
<path fill=3D"none" stroke=3D"black" d=3D"M140.84,-359.59C151.41,-335.4 170=
.63,-291.36 183.17,-262.65"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"186.37,-264.06 187.16,-2=
53.5 179.96,-261.26 186.37,-264.06"></polygon>
</g>
<!-- do_assemble_fitimage_initramfs&#45;&gt;do_bundle_initramfs -->
<g id=3D"edge5" class=3D"edge">
<title>do_assemble_fitimage_initramfs-&gt;do_bundle_initramfs</title>
<path fill=3D"none" stroke=3D"black" d=3D"M171.4,-360.41C194.24,-350.48 223=
.44,-337.78 247.64,-327.26"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"248.86,-330.55 256.63,-3=
23.35 246.06,-324.13 248.86,-330.55"></polygon>
</g>
<!-- do_bundle_initramfs&#45;&gt;core&#45;image&#45;minimal.do_image_comple=
te -->
<g id=3D"edge6" class=3D"edge">
<title>do_bundle_initramfs-&gt;core-image-minimal.do_image_complete</title>
<path fill=3D"none" stroke=3D"black" d=3D"M270.53,-288.23C257.98,-279.36 24=
2.36,-268.32 228.61,-258.59"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"230.87,-255.91 220.68,-2=
52.99 226.83,-261.62 230.87,-255.91"></polygon>
</g>
<!-- do_install -->
<g id=3D"node9" class=3D"node">
<title>do_install</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"489.24" cy=3D"-234" rx=3D"47.=
26" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"489.24" y=3D"-228.95" font-family=3D"Time=
s,serif" font-size=3D"14.00">do_install</text>
</g>
<!-- do_bundle_initramfs&#45;&gt;do_install -->
<g id=3D"edge7" class=3D"edge">
<title>do_bundle_initramfs-&gt;do_install</title>
<path fill=3D"none" stroke=3D"black" d=3D"M336.55,-289.81C368.66,-278.29 41=
2.66,-262.49 445.19,-250.81"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"446.09,-254.21 454.32,-2=
47.54 443.72,-247.62 446.09,-254.21"></polygon>
</g>
<!-- do_install&#45;&gt;do_assemble_fitimage -->
<g id=3D"edge12" class=3D"edge">
<title>do_install-&gt;do_assemble_fitimage</title>
<path fill=3D"none" stroke=3D"black" d=3D"M472.08,-216.76C463,-208.18 451.6=
7,-197.46 441.52,-187.86"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"444.11,-185.49 434.44,-1=
81.16 439.3,-190.58 444.11,-185.49"></polygon>
</g>
<!-- do_install&#45;&gt;do_compile -->
<g id=3D"edge13" class=3D"edge">
<title>do_install-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M503.75,-216.68C529.09,-186.12 57=
5.82,-119.11 544.24,-72 528.85,-49.03 501.52,-36.01 475.97,-28.63"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"477.19,-25.33 466.63,-26=
.18 475.42,-32.1 477.19,-25.33"></polygon>
</g>
<!-- do_populate_sysroot&#45;&gt;do_install -->
<g id=3D"edge15" class=3D"edge">
<title>do_populate_sysroot-&gt;do_install</title>
<path fill=3D"none" stroke=3D"black" d=3D"M537.75,-288.05C529.93,-279.5 520=
.3,-268.97 511.69,-259.56"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"514.5,-257.44 505.17,-25=
2.42 509.34,-262.17 514.5,-257.44"></polygon>
</g>
<!-- do_transform_bundled_initramfs&#45;&gt;do_bundle_initramfs -->
<g id=3D"edge16" class=3D"edge">
<title>do_transform_bundled_initramfs-&gt;do_bundle_initramfs</title>
<path fill=3D"none" stroke=3D"black" d=3D"M417.85,-360.41C394.86,-350.48 36=
5.48,-337.78 341.13,-327.26"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"342.65,-324.1 332.08,-32=
3.35 339.87,-330.53 342.65,-324.1"></polygon>
</g>
</g>
</svg>
</div><h3 id=3D"branch-adrianfkernel-fitimage-sstate-2">branch: adrianf/ker=
nel-fitimage-sstate </h3>
<div><!--?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?-->

<!-- Generated by graphviz version 9.0.0 (20230911.1827)
 -->
<!-- Title: depends Pages: 1 -->
<svg width=3D"649pt" height=3D"548pt" viewBox=3D"0.00 0.00 648.93 548.00" x=
mlns=3D"http://www.w3.org/2000/svg" xmlns:xlink=3D"http://www.w3.org/1999/x=
link">
<g id=3D"graph0" class=3D"graph" transform=3D"scale(1 1) rotate(0) translat=
e(4 544)">
<title>depends</title>
<polygon fill=3D"white" stroke=3D"none" points=3D"-4,4 -4,-544 644.93,-544 =
644.93,4 -4,4"></polygon>
<!-- core&#45;image&#45;minimal.do_build -->
<g id=3D"node1" class=3D"node">
<title>core-image-minimal.do_build</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"375.24" cy=3D"-522" rx=3D"123=
" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"375.24" y=3D"-516.95" font-family=3D"Time=
s,serif" font-size=3D"14.00">core-image-minimal.do_build</text>
</g>
<!-- do_deploy -->
<g id=3D"node2" class=3D"node">
<title>do_deploy</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"375.24" cy=3D"-450" rx=3D"49.=
82" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"375.24" y=3D"-444.95" font-family=3D"Time=
s,serif" font-size=3D"14.00">do_deploy</text>
</g>
<!-- core&#45;image&#45;minimal.do_build&#45;&gt;do_deploy -->
<g id=3D"edge1" class=3D"edge">
<title>core-image-minimal.do_build-&gt;do_deploy</title>
<path fill=3D"none" stroke=3D"black" d=3D"M375.24,-503.7C375.24,-496.41 375=
.24,-487.73 375.24,-479.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"378.74,-479.62 375.24,-4=
69.62 371.74,-479.62 378.74,-479.62"></polygon>
</g>
<!-- do_assemble_fitimage_initramfs -->
<g id=3D"node6" class=3D"node">
<title>do_assemble_fitimage_initramfs</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"133.24" cy=3D"-378" rx=3D"133=
.24" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"133.24" y=3D"-372.95" font-family=3D"Time=
s,serif" font-size=3D"14.00">do_assemble_fitimage_initramfs</text>
</g>
<!-- do_deploy&#45;&gt;do_assemble_fitimage_initramfs -->
<g id=3D"edge8" class=3D"edge">
<title>do_deploy-&gt;do_assemble_fitimage_initramfs</title>
<path fill=3D"none" stroke=3D"black" d=3D"M337.16,-437.99C300.1,-427.27 243=
.05,-410.76 198.71,-397.94"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"199.76,-394.6 189.18,-39=
5.18 197.82,-401.32 199.76,-394.6"></polygon>
</g>
<!-- do_bundle_initramfs -->
<g id=3D"node8" class=3D"node">
<title>do_bundle_initramfs</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"294.24" cy=3D"-306" rx=3D"88.=
2" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"294.24" y=3D"-300.95" font-family=3D"Time=
s,serif" font-size=3D"14.00">do_bundle_initramfs</text>
</g>
<!-- do_deploy&#45;&gt;do_bundle_initramfs -->
<g id=3D"edge9" class=3D"edge">
<title>do_deploy-&gt;do_bundle_initramfs</title>
<path fill=3D"none" stroke=3D"black" d=3D"M350.88,-433.96C337.77,-424.62 32=
2.44,-411.45 313.24,-396 302.35,-377.71 297.66,-354.03 295.66,-335.69"></pa=
th>
<polygon fill=3D"black" stroke=3D"black" points=3D"299.15,-335.42 294.81,-3=
25.76 292.18,-336.02 299.15,-335.42"></polygon>
</g>
<!-- do_populate_sysroot -->
<g id=3D"node10" class=3D"node">
<title>do_populate_sysroot</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"553.24" cy=3D"-306" rx=3D"87.=
69" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"553.24" y=3D"-300.95" font-family=3D"Time=
s,serif" font-size=3D"14.00">do_populate_sysroot</text>
</g>
<!-- do_deploy&#45;&gt;do_populate_sysroot -->
<g id=3D"edge10" class=3D"edge">
<title>do_deploy-&gt;do_populate_sysroot</title>
<path fill=3D"none" stroke=3D"black" d=3D"M423.08,-444.53C482.22,-437.91 57=
7.7,-423.23 599.24,-396 614.77,-376.36 598.29,-350.67 580.89,-331.94"></pat=
h>
<polygon fill=3D"black" stroke=3D"black" points=3D"583.51,-329.62 574,-324.=
95 578.53,-334.53 583.51,-329.62"></polygon>
</g>
<!-- do_transform_bundled_initramfs -->
<g id=3D"node11" class=3D"node">
<title>do_transform_bundled_initramfs</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"456.24" cy=3D"-378" rx=3D"133=
.75" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"456.24" y=3D"-372.95" font-family=3D"Time=
s,serif" font-size=3D"14.00">do_transform_bundled_initramfs</text>
</g>
<!-- do_deploy&#45;&gt;do_transform_bundled_initramfs -->
<g id=3D"edge11" class=3D"edge">
<title>do_deploy-&gt;do_transform_bundled_initramfs</title>
<path fill=3D"none" stroke=3D"black" d=3D"M393.62,-433.12C403.64,-424.46 41=
6.26,-413.55 427.54,-403.8"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"429.81,-406.47 435.09,-3=
97.28 425.23,-401.17 429.81,-406.47"></polygon>
</g>
<!-- do_assemble_fitimage -->
<g id=3D"node3" class=3D"node">
<title>do_assemble_fitimage</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"415.24" cy=3D"-162" rx=3D"94.=
86" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"415.24" y=3D"-156.95" font-family=3D"Time=
s,serif" font-size=3D"14.00">do_assemble_fitimage</text>
</g>
<!-- do_compile -->
<g id=3D"node4" class=3D"node">
<title>do_compile</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"415.24" cy=3D"-18" rx=3D"54.9=
3" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"415.24" y=3D"-12.95" font-family=3D"Times=
,serif" font-size=3D"14.00">do_compile</text>
</g>
<!-- do_assemble_fitimage&#45;&gt;do_compile -->
<g id=3D"edge2" class=3D"edge">
<title>do_assemble_fitimage-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M347.3,-149.15C323.95,-141.46 300=
.19,-128.82 286.24,-108 277.33,-94.71 277.33,-85.29 286.24,-72 301.63,-49.0=
3 328.96,-36.01 354.51,-28.63"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"355.06,-32.1 363.85,-26.=
18 353.29,-25.33 355.06,-32.1"></polygon>
</g>
<!-- do_kernel_generate_rsa_keys -->
<g id=3D"node5" class=3D"node">
<title>do_kernel_generate_rsa_keys</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"415.24" cy=3D"-90" rx=3D"120.=
45" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"415.24" y=3D"-84.95" font-family=3D"Times=
,serif" font-size=3D"14.00">do_kernel_generate_rsa_keys</text>
</g>
<!-- do_assemble_fitimage&#45;&gt;do_kernel_generate_rsa_keys -->
<g id=3D"edge3" class=3D"edge">
<title>do_assemble_fitimage-&gt;do_kernel_generate_rsa_keys</title>
<path fill=3D"none" stroke=3D"black" d=3D"M415.24,-143.7C415.24,-136.41 415=
.24,-127.73 415.24,-119.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"418.74,-119.62 415.24,-1=
09.62 411.74,-119.62 418.74,-119.62"></polygon>
</g>
<!-- do_kernel_generate_rsa_keys&#45;&gt;do_compile -->
<g id=3D"edge14" class=3D"edge">
<title>do_kernel_generate_rsa_keys-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M415.24,-71.7C415.24,-64.41 415.2=
4,-55.73 415.24,-47.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"418.74,-47.62 415.24,-37=
.62 411.74,-47.62 418.74,-47.62"></polygon>
</g>
<!-- core&#45;image&#45;minimal.do_image_complete -->
<g id=3D"node7" class=3D"node">
<title>core-image-minimal.do_image_complete</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"195.24" cy=3D"-234" rx=3D"166=
" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"195.24" y=3D"-228.95" font-family=3D"Time=
s,serif" font-size=3D"14.00">core-image-minimal.do_image_complete</text>
</g>
<!-- do_assemble_fitimage_initramfs&#45;&gt;core&#45;image&#45;minimal.do_i=
mage_complete -->
<g id=3D"edge4" class=3D"edge">
<title>do_assemble_fitimage_initramfs-&gt;core-image-minimal.do_image_compl=
ete</title>
<path fill=3D"none" stroke=3D"black" d=3D"M140.84,-359.59C151.41,-335.4 170=
.63,-291.36 183.17,-262.65"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"186.37,-264.06 187.16,-2=
53.5 179.96,-261.26 186.37,-264.06"></polygon>
</g>
<!-- do_assemble_fitimage_initramfs&#45;&gt;do_bundle_initramfs -->
<g id=3D"edge5" class=3D"edge">
<title>do_assemble_fitimage_initramfs-&gt;do_bundle_initramfs</title>
<path fill=3D"none" stroke=3D"black" d=3D"M171.4,-360.41C194.24,-350.48 223=
.44,-337.78 247.64,-327.26"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"248.86,-330.55 256.63,-3=
23.35 246.06,-324.13 248.86,-330.55"></polygon>
</g>
<!-- do_bundle_initramfs&#45;&gt;core&#45;image&#45;minimal.do_image_comple=
te -->
<g id=3D"edge6" class=3D"edge">
<title>do_bundle_initramfs-&gt;core-image-minimal.do_image_complete</title>
<path fill=3D"none" stroke=3D"black" d=3D"M270.53,-288.23C257.98,-279.36 24=
2.36,-268.32 228.61,-258.59"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"230.87,-255.91 220.68,-2=
52.99 226.83,-261.62 230.87,-255.91"></polygon>
</g>
<!-- do_install -->
<g id=3D"node9" class=3D"node">
<title>do_install</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"489.24" cy=3D"-234" rx=3D"47.=
26" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"489.24" y=3D"-228.95" font-family=3D"Time=
s,serif" font-size=3D"14.00">do_install</text>
</g>
<!-- do_bundle_initramfs&#45;&gt;do_install -->
<g id=3D"edge7" class=3D"edge">
<title>do_bundle_initramfs-&gt;do_install</title>
<path fill=3D"none" stroke=3D"black" d=3D"M336.55,-289.81C368.66,-278.29 41=
2.66,-262.49 445.19,-250.81"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"446.09,-254.21 454.32,-2=
47.54 443.72,-247.62 446.09,-254.21"></polygon>
</g>
<!-- do_install&#45;&gt;do_assemble_fitimage -->
<g id=3D"edge12" class=3D"edge">
<title>do_install-&gt;do_assemble_fitimage</title>
<path fill=3D"none" stroke=3D"black" d=3D"M472.08,-216.76C463,-208.18 451.6=
7,-197.46 441.52,-187.86"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"444.11,-185.49 434.44,-1=
81.16 439.3,-190.58 444.11,-185.49"></polygon>
</g>
<!-- do_install&#45;&gt;do_compile -->
<g id=3D"edge13" class=3D"edge">
<title>do_install-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M503.75,-216.68C529.09,-186.12 57=
5.82,-119.11 544.24,-72 528.85,-49.03 501.52,-36.01 475.97,-28.63"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"477.19,-25.33 466.63,-26=
.18 475.42,-32.1 477.19,-25.33"></polygon>
</g>
<!-- do_populate_sysroot&#45;&gt;do_install -->
<g id=3D"edge15" class=3D"edge">
<title>do_populate_sysroot-&gt;do_install</title>
<path fill=3D"none" stroke=3D"black" d=3D"M537.75,-288.05C529.93,-279.5 520=
.3,-268.97 511.69,-259.56"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"514.5,-257.44 505.17,-25=
2.42 509.34,-262.17 514.5,-257.44"></polygon>
</g>
<!-- do_transform_bundled_initramfs&#45;&gt;do_bundle_initramfs -->
<g id=3D"edge16" class=3D"edge">
<title>do_transform_bundled_initramfs-&gt;do_bundle_initramfs</title>
<path fill=3D"none" stroke=3D"black" d=3D"M417.85,-360.41C394.86,-350.48 36=
5.48,-337.78 341.13,-327.26"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"342.65,-324.1 332.08,-32=
3.35 339.87,-330.53 342.65,-324.1"></polygon>
</g>
</g>
</svg>
</div><h2 id=3D"diff-2">Diff </h2>
<pre data-role=3D"codeBlock" data-info=3D"patch" class=3D"language-patch pa=
tch"><code></code></pre><h2 id=3D"configuration-image-fitimage">Configurati=
on: image, fitimage </h2>
<pre data-role=3D"codeBlock" data-info=3D"raw" class=3D"language-raw raw"><=
code>KERNEL_IMAGETYPE =3D "Image"
KERNEL_IMAGETYPES +=3D " fitImage "
KERNEL_CLASSES =3D " kernel-fitimage "
</code></pre><h3 id=3D"branch-master-3">branch: master </h3>
<div><!--?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?-->

<!-- Generated by graphviz version 9.0.0 (20230911.1827)
 -->
<!-- Title: depends Pages: 1 -->
<svg width=3D"533pt" height=3D"548pt" viewBox=3D"0.00 0.00 532.69 548.00" x=
mlns=3D"http://www.w3.org/2000/svg" xmlns:xlink=3D"http://www.w3.org/1999/x=
link">
<g id=3D"graph0" class=3D"graph" transform=3D"scale(1 1) rotate(0) translat=
e(4 544)">
<title>depends</title>
<polygon fill=3D"white" stroke=3D"none" points=3D"-4,4 -4,-544 528.69,-544 =
528.69,4 -4,4"></polygon>
<!-- core&#45;image&#45;minimal.do_build -->
<g id=3D"node1" class=3D"node">
<title>core-image-minimal.do_build</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"343" cy=3D"-522" rx=3D"123" r=
y=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"343" y=3D"-516.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">core-image-minimal.do_build</text>
</g>
<!-- do_deploy -->
<g id=3D"node2" class=3D"node">
<title>do_deploy</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"343" cy=3D"-450" rx=3D"49.82"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"343" y=3D"-444.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_deploy</text>
</g>
<!-- core&#45;image&#45;minimal.do_build&#45;&gt;do_deploy -->
<g id=3D"edge1" class=3D"edge">
<title>core-image-minimal.do_build-&gt;do_deploy</title>
<path fill=3D"none" stroke=3D"black" d=3D"M343,-503.7C343,-496.41 343,-487.=
73 343,-479.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"346.5,-479.62 343,-469.6=
2 339.5,-479.62 346.5,-479.62"></polygon>
</g>
<!-- do_assemble_fitimage_initramfs -->
<g id=3D"node6" class=3D"node">
<title>do_assemble_fitimage_initramfs</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"182" cy=3D"-378" rx=3D"133.24=
" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"182" y=3D"-372.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_assemble_fitimage_initramfs</text>
</g>
<!-- do_deploy&#45;&gt;do_assemble_fitimage_initramfs -->
<g id=3D"edge8" class=3D"edge">
<title>do_deploy-&gt;do_assemble_fitimage_initramfs</title>
<path fill=3D"none" stroke=3D"black" d=3D"M311.95,-435.5C288.98,-425.52 257=
.25,-411.72 230.88,-400.26"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"232.28,-397.05 221.72,-3=
96.27 229.49,-403.47 232.28,-397.05"></polygon>
</g>
<!-- do_bundle_initramfs -->
<g id=3D"node8" class=3D"node">
<title>do_bundle_initramfs</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"243" cy=3D"-306" rx=3D"88.2" =
ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"243" y=3D"-300.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_bundle_initramfs</text>
</g>
<!-- do_deploy&#45;&gt;do_bundle_initramfs -->
<g id=3D"edge9" class=3D"edge">
<title>do_deploy-&gt;do_bundle_initramfs</title>
<path fill=3D"none" stroke=3D"black" d=3D"M343.1,-431.76C342.41,-412.63 338=
.82,-381.63 324,-360 315.21,-347.19 302.21,-336.72 289.19,-328.57"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"290.99,-325.57 280.59,-3=
23.55 287.47,-331.62 290.99,-325.57"></polygon>
</g>
<!-- do_populate_sysroot -->
<g id=3D"node10" class=3D"node">
<title>do_populate_sysroot</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"437" cy=3D"-306" rx=3D"87.69"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"437" y=3D"-300.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_populate_sysroot</text>
</g>
<!-- do_deploy&#45;&gt;do_populate_sysroot -->
<g id=3D"edge10" class=3D"edge">
<title>do_deploy-&gt;do_populate_sysroot</title>
<path fill=3D"none" stroke=3D"black" d=3D"M354.15,-432.15C370.24,-407.84 40=
0.15,-362.66 419.29,-333.75"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"422.13,-335.8 424.73,-32=
5.53 416.29,-331.94 422.13,-335.8"></polygon>
</g>
<!-- do_assemble_fitimage -->
<g id=3D"node3" class=3D"node">
<title>do_assemble_fitimage</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"343" cy=3D"-162" rx=3D"94.86"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"343" y=3D"-156.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_assemble_fitimage</text>
</g>
<!-- do_compile -->
<g id=3D"node4" class=3D"node">
<title>do_compile</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"343" cy=3D"-18" rx=3D"54.93" =
ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"343" y=3D"-12.95" font-family=3D"Times,se=
rif" font-size=3D"14.00">do_compile</text>
</g>
<!-- do_assemble_fitimage&#45;&gt;do_compile -->
<g id=3D"edge2" class=3D"edge">
<title>do_assemble_fitimage-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M275.06,-149.15C251.71,-141.46 22=
7.95,-128.82 214,-108 205.09,-94.71 205.09,-85.29 214,-72 229.39,-49.03 256=
.72,-36.01 282.27,-28.63"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"282.82,-32.1 291.61,-26.=
18 281.04,-25.33 282.82,-32.1"></polygon>
</g>
<!-- do_kernel_generate_rsa_keys -->
<g id=3D"node5" class=3D"node">
<title>do_kernel_generate_rsa_keys</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"343" cy=3D"-90" rx=3D"120.45"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"343" y=3D"-84.95" font-family=3D"Times,se=
rif" font-size=3D"14.00">do_kernel_generate_rsa_keys</text>
</g>
<!-- do_assemble_fitimage&#45;&gt;do_kernel_generate_rsa_keys -->
<g id=3D"edge3" class=3D"edge">
<title>do_assemble_fitimage-&gt;do_kernel_generate_rsa_keys</title>
<path fill=3D"none" stroke=3D"black" d=3D"M343,-143.7C343,-136.41 343,-127.=
73 343,-119.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"346.5,-119.62 343,-109.6=
2 339.5,-119.62 346.5,-119.62"></polygon>
</g>
<!-- do_kernel_generate_rsa_keys&#45;&gt;do_compile -->
<g id=3D"edge13" class=3D"edge">
<title>do_kernel_generate_rsa_keys-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M343,-71.7C343,-64.41 343,-55.73 =
343,-47.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"346.5,-47.62 343,-37.62 =
339.5,-47.62 346.5,-47.62"></polygon>
</g>
<!-- core&#45;image&#45;minimal.do_image_complete -->
<g id=3D"node7" class=3D"node">
<title>core-image-minimal.do_image_complete</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"166" cy=3D"-234" rx=3D"166" r=
y=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"166" y=3D"-228.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">core-image-minimal.do_image_complete</text>
</g>
<!-- do_assemble_fitimage_initramfs&#45;&gt;core&#45;image&#45;minimal.do_i=
mage_complete -->
<g id=3D"edge4" class=3D"edge">
<title>do_assemble_fitimage_initramfs-&gt;core-image-minimal.do_image_compl=
ete</title>
<path fill=3D"none" stroke=3D"black" d=3D"M166.39,-359.77C158.62,-350.03 15=
0.05,-337.18 146,-324 139.78,-303.79 145.49,-280.45 152.38,-262.74"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"155.55,-264.23 156.24,-2=
53.66 149.11,-261.49 155.55,-264.23"></polygon>
</g>
<!-- do_assemble_fitimage_initramfs&#45;&gt;do_bundle_initramfs -->
<g id=3D"edge5" class=3D"edge">
<title>do_assemble_fitimage_initramfs-&gt;do_bundle_initramfs</title>
<path fill=3D"none" stroke=3D"black" d=3D"M197.08,-359.7C204.17,-351.56 212=
.77,-341.69 220.6,-332.7"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"223.17,-335.08 227.1,-32=
5.25 217.89,-330.49 223.17,-335.08"></polygon>
</g>
<!-- do_bundle_initramfs&#45;&gt;core&#45;image&#45;minimal.do_image_comple=
te -->
<g id=3D"edge6" class=3D"edge">
<title>do_bundle_initramfs-&gt;core-image-minimal.do_image_complete</title>
<path fill=3D"none" stroke=3D"black" d=3D"M224.36,-288.05C215.04,-279.58 20=
3.58,-269.17 193.29,-259.82"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"195.87,-257.43 186.12,-2=
53.29 191.16,-262.61 195.87,-257.43"></polygon>
</g>
<!-- do_install -->
<g id=3D"node9" class=3D"node">
<title>do_install</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"417" cy=3D"-234" rx=3D"47.26"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"417" y=3D"-228.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_install</text>
</g>
<!-- do_bundle_initramfs&#45;&gt;do_install -->
<g id=3D"edge7" class=3D"edge">
<title>do_bundle_initramfs-&gt;do_install</title>
<path fill=3D"none" stroke=3D"black" d=3D"M281.61,-289.46C309.31,-278.32 34=
6.6,-263.32 375.04,-251.88"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"376.09,-255.23 384.06,-2=
48.25 373.47,-248.74 376.09,-255.23"></polygon>
</g>
<!-- do_install&#45;&gt;do_assemble_fitimage -->
<g id=3D"edge11" class=3D"edge">
<title>do_install-&gt;do_assemble_fitimage</title>
<path fill=3D"none" stroke=3D"black" d=3D"M399.83,-216.76C390.76,-208.18 37=
9.43,-197.46 369.27,-187.86"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"371.87,-185.49 362.2,-18=
1.16 367.06,-190.58 371.87,-185.49"></polygon>
</g>
<!-- do_install&#45;&gt;do_compile -->
<g id=3D"edge12" class=3D"edge">
<title>do_install-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M431.51,-216.68C456.85,-186.12 50=
3.57,-119.11 472,-72 456.6,-49.03 429.28,-36.01 403.73,-28.63"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"404.95,-25.33 394.39,-26=
.18 403.17,-32.1 404.95,-25.33"></polygon>
</g>
<!-- do_populate_sysroot&#45;&gt;do_install -->
<g id=3D"edge14" class=3D"edge">
<title>do_populate_sysroot-&gt;do_install</title>
<path fill=3D"none" stroke=3D"black" d=3D"M432.05,-287.7C429.92,-280.24 427=
.37,-271.32 424.99,-262.97"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"428.41,-262.21 422.3,-25=
3.56 421.68,-264.14 428.41,-262.21"></polygon>
</g>
</g>
</svg>
</div><h3 id=3D"branch-adrianfkernel-fitimage-sstate-3">branch: adrianf/ker=
nel-fitimage-sstate </h3>
<div><!--?xml version=3D"1.0" encoding=3D"UTF-8" standalone=3D"no"?-->

<!-- Generated by graphviz version 9.0.0 (20230911.1827)
 -->
<!-- Title: depends Pages: 1 -->
<svg width=3D"572pt" height=3D"548pt" viewBox=3D"0.00 0.00 571.69 548.00" x=
mlns=3D"http://www.w3.org/2000/svg" xmlns:xlink=3D"http://www.w3.org/1999/x=
link">
<g id=3D"graph0" class=3D"graph" transform=3D"scale(1 1) rotate(0) translat=
e(4 544)">
<title>depends</title>
<polygon fill=3D"white" stroke=3D"none" points=3D"-4,4 -4,-544 567.69,-544 =
567.69,4 -4,4"></polygon>
<!-- core&#45;image&#45;minimal.do_build -->
<g id=3D"node1" class=3D"node">
<title>core-image-minimal.do_build</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"271" cy=3D"-522" rx=3D"123" r=
y=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"271" y=3D"-516.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">core-image-minimal.do_build</text>
</g>
<!-- do_deploy -->
<g id=3D"node2" class=3D"node">
<title>do_deploy</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"350" cy=3D"-378" rx=3D"49.82"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"350" y=3D"-372.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_deploy</text>
</g>
<!-- core&#45;image&#45;minimal.do_build&#45;&gt;do_deploy -->
<g id=3D"edge1" class=3D"edge">
<title>core-image-minimal.do_build-&gt;do_deploy</title>
<path fill=3D"none" stroke=3D"black" d=3D"M296.99,-503.98C309.1,-494.74 322=
.65,-482.28 331,-468 341.73,-449.62 346.43,-425.94 348.47,-407.63"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"351.96,-407.99 349.35,-3=
97.72 344.98,-407.37 351.96,-407.99"></polygon>
</g>
<!-- do_deploy_fitimage_unbundled -->
<g id=3D"node3" class=3D"node">
<title>do_deploy_fitimage_unbundled</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"193" cy=3D"-450" rx=3D"129.15=
" ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"193" y=3D"-444.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_deploy_fitimage_unbundled</text>
</g>
<!-- core&#45;image&#45;minimal.do_build&#45;&gt;do_deploy_fitimage_unbundl=
ed -->
<g id=3D"edge2" class=3D"edge">
<title>core-image-minimal.do_build-&gt;do_deploy_fitimage_unbundled</title>
<path fill=3D"none" stroke=3D"black" d=3D"M252.11,-504.05C242.67,-495.58 23=
1.07,-485.17 220.65,-475.82"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"223.15,-473.36 213.37,-4=
69.29 218.48,-478.57 223.15,-473.36"></polygon>
</g>
<!-- core&#45;image&#45;minimal.do_image_complete -->
<g id=3D"node7" class=3D"node">
<title>core-image-minimal.do_image_complete</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"166" cy=3D"-306" rx=3D"166" r=
y=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"166" y=3D"-300.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">core-image-minimal.do_image_complete</text>
</g>
<!-- do_deploy&#45;&gt;core&#45;image&#45;minimal.do_image_complete -->
<g id=3D"edge5" class=3D"edge">
<title>do_deploy-&gt;core-image-minimal.do_image_complete</title>
<path fill=3D"none" stroke=3D"black" d=3D"M316.68,-364.32C290,-354.17 252.0=
2,-339.72 220.86,-327.87"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"222.16,-324.62 211.57,-3=
24.34 219.67,-331.17 222.16,-324.62"></polygon>
</g>
<!-- do_install -->
<g id=3D"node8" class=3D"node">
<title>do_install</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"418" cy=3D"-234" rx=3D"47.26"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"418" y=3D"-228.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_install</text>
</g>
<!-- do_deploy&#45;&gt;do_install -->
<g id=3D"edge6" class=3D"edge">
<title>do_deploy-&gt;do_install</title>
<path fill=3D"none" stroke=3D"black" d=3D"M353.9,-359.63C358.44,-341.2 366.=
89,-311.56 379,-288 383.93,-278.4 390.53,-268.67 396.9,-260.21"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"399.55,-262.5 402.95,-25=
2.47 394.04,-258.19 399.55,-262.5"></polygon>
</g>
<!-- do_populate_sysroot -->
<g id=3D"node9" class=3D"node">
<title>do_populate_sysroot</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"476" cy=3D"-306" rx=3D"87.69"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"476" y=3D"-300.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_populate_sysroot</text>
</g>
<!-- do_deploy&#45;&gt;do_populate_sysroot -->
<g id=3D"edge7" class=3D"edge">
<title>do_deploy-&gt;do_populate_sysroot</title>
<path fill=3D"none" stroke=3D"black" d=3D"M376.41,-362.33C393.86,-352.63 41=
7.05,-339.75 436.65,-328.86"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"438.17,-332.02 445.21,-3=
24.1 434.77,-325.9 438.17,-332.02"></polygon>
</g>
<!-- do_deploy_fitimage_unbundled&#45;&gt;do_deploy -->
<g id=3D"edge9" class=3D"edge">
<title>do_deploy_fitimage_unbundled-&gt;do_deploy</title>
<path fill=3D"none" stroke=3D"black" d=3D"M230.2,-432.41C253.9,-421.85 284.=
61,-408.15 309.01,-397.27"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"310.29,-400.54 318,-393.=
27 307.44,-394.14 310.29,-400.54"></polygon>
</g>
<!-- do_deploy_fitimage_unbundled&#45;&gt;core&#45;image&#45;minimal.do_ima=
ge_complete -->
<g id=3D"edge8" class=3D"edge">
<title>do_deploy_fitimage_unbundled-&gt;core-image-minimal.do_image_complet=
e</title>
<path fill=3D"none" stroke=3D"black" d=3D"M189.69,-431.59C185.13,-407.61 17=
6.86,-364.14 171.4,-335.42"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"174.84,-334.77 169.53,-3=
25.6 167.96,-336.08 174.84,-334.77"></polygon>
</g>
<!-- do_assemble_fitimage -->
<g id=3D"node4" class=3D"node">
<title>do_assemble_fitimage</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"344" cy=3D"-162" rx=3D"94.86"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"344" y=3D"-156.95" font-family=3D"Times,s=
erif" font-size=3D"14.00">do_assemble_fitimage</text>
</g>
<!-- do_compile -->
<g id=3D"node5" class=3D"node">
<title>do_compile</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"344" cy=3D"-18" rx=3D"54.93" =
ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"344" y=3D"-12.95" font-family=3D"Times,se=
rif" font-size=3D"14.00">do_compile</text>
</g>
<!-- do_assemble_fitimage&#45;&gt;do_compile -->
<g id=3D"edge3" class=3D"edge">
<title>do_assemble_fitimage-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M276.06,-149.15C252.71,-141.46 22=
8.95,-128.82 215,-108 206.09,-94.71 206.09,-85.29 215,-72 230.39,-49.03 257=
.72,-36.01 283.27,-28.63"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"283.82,-32.1 292.61,-26.=
18 282.04,-25.33 283.82,-32.1"></polygon>
</g>
<!-- do_kernel_generate_rsa_keys -->
<g id=3D"node6" class=3D"node">
<title>do_kernel_generate_rsa_keys</title>
<ellipse fill=3D"none" stroke=3D"black" cx=3D"344" cy=3D"-90" rx=3D"120.45"=
 ry=3D"18"></ellipse>
<text text-anchor=3D"middle" x=3D"344" y=3D"-84.95" font-family=3D"Times,se=
rif" font-size=3D"14.00">do_kernel_generate_rsa_keys</text>
</g>
<!-- do_assemble_fitimage&#45;&gt;do_kernel_generate_rsa_keys -->
<g id=3D"edge4" class=3D"edge">
<title>do_assemble_fitimage-&gt;do_kernel_generate_rsa_keys</title>
<path fill=3D"none" stroke=3D"black" d=3D"M344,-143.7C344,-136.41 344,-127.=
73 344,-119.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"347.5,-119.62 344,-109.6=
2 340.5,-119.62 347.5,-119.62"></polygon>
</g>
<!-- do_kernel_generate_rsa_keys&#45;&gt;do_compile -->
<g id=3D"edge12" class=3D"edge">
<title>do_kernel_generate_rsa_keys-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M344,-71.7C344,-64.41 344,-55.73 =
344,-47.54"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"347.5,-47.62 344,-37.62 =
340.5,-47.62 347.5,-47.62"></polygon>
</g>
<!-- do_install&#45;&gt;do_assemble_fitimage -->
<g id=3D"edge10" class=3D"edge">
<title>do_install-&gt;do_assemble_fitimage</title>
<path fill=3D"none" stroke=3D"black" d=3D"M400.83,-216.76C391.76,-208.18 38=
0.43,-197.46 370.27,-187.86"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"372.87,-185.49 363.2,-18=
1.16 368.06,-190.58 372.87,-185.49"></polygon>
</g>
<!-- do_install&#45;&gt;do_compile -->
<g id=3D"edge11" class=3D"edge">
<title>do_install-&gt;do_compile</title>
<path fill=3D"none" stroke=3D"black" d=3D"M432.51,-216.68C457.85,-186.12 50=
4.57,-119.11 473,-72 457.6,-49.03 430.28,-36.01 404.73,-28.63"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"405.95,-25.33 395.39,-26=
.18 404.17,-32.1 405.95,-25.33"></polygon>
</g>
<!-- do_populate_sysroot&#45;&gt;do_install -->
<g id=3D"edge13" class=3D"edge">
<title>do_populate_sysroot-&gt;do_install</title>
<path fill=3D"none" stroke=3D"black" d=3D"M461.96,-288.05C455.02,-279.68 44=
6.5,-269.4 438.82,-260.13"></path>
<polygon fill=3D"black" stroke=3D"black" points=3D"441.55,-257.94 432.47,-2=
52.47 436.16,-262.41 441.55,-257.94"></polygon>
</g>
</g>
</svg>
</div><h2 id=3D"diff-3">Diff </h2>
<pre data-role=3D"codeBlock" data-info=3D"patch" class=3D"language-patch pa=
tch"><code>2a3
&gt; "core-image-minimal.do_build" -&gt; "do_deploy_fitimage_unbundled"
6,11d6
&lt; "do_assemble_fitimage_initramfs" [label=3D"do_assemble_fitimage_initra=
mfs"]
&lt; "do_assemble_fitimage_initramfs" -&gt; "core-image-minimal.do_image_co=
mplete"
&lt; "do_assemble_fitimage_initramfs" -&gt; "do_bundle_initramfs"
&lt; "do_bundle_initramfs" [label=3D"do_bundle_initramfs"]
&lt; "do_bundle_initramfs" -&gt; "core-image-minimal.do_image_complete"
&lt; "do_bundle_initramfs" -&gt; "do_install"
14,15c9,10
&lt; "do_deploy" -&gt; "do_assemble_fitimage_initramfs"
&lt; "do_deploy" -&gt; "do_bundle_initramfs"
---
&gt; "do_deploy" -&gt; "core-image-minimal.do_image_complete"
&gt; "do_deploy" -&gt; "do_install"
16a12,14
&gt; "do_deploy_fitimage_unbundled" [label=3D"do_deploy_fitimage_unbundled"=
]
&gt; "do_deploy_fitimage_unbundled" -&gt; "core-image-minimal.do_image_comp=
lete"
&gt; "do_deploy_fitimage_unbundled" -&gt; "do_deploy"
</code></pre>
      </div>
     =20
     =20
   =20
   =20
   =20
   =20
   =20
   =20
 =20
    <div><span></span></div></body></html>

--=-fAxqXsR572/11P8GeCw4--

