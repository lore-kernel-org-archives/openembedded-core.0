Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32D9C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 14:32:48 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.39415.1721053962512109519
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 07:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eUBizNwU;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52ed741fe46so1075510e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 07:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721053961; x=1721658761; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTSDWaJQBzE0AaEu6NMcy1zit5qopVfJX5+EpjOQUzE=;
        b=eUBizNwUiPnavqS89aARhb2zqE9HMJ4JaAAEBpj9EBpHRFf7EqxKvwYTn5OR7wAtRT
         B5omNvPxb42cpoP6hHV4PUnBatTco/avKDzsjCvRWlLjkgl5adelKRrYeyu3l4qm6gQ7
         gqYeD1vrd1gQmAG/4dD57BitxRNlWQu2I+EuFF0QCN67GgtNwx2uscnst1BaDxQaHu+O
         KIzX1LK+6or/9L7PKgt0wgM8p7/QvbX7OJgil0Mq8dORD8zl3h+MM6LQyTV86Aqo5xj/
         xcin4/pBPDNK9bU9eIp654g3LiXdxBB/19FMwMdWevqds9Cxq5RQRTCReIpxZjL8lGJt
         sXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721053961; x=1721658761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTSDWaJQBzE0AaEu6NMcy1zit5qopVfJX5+EpjOQUzE=;
        b=TCJRgiXJQApxzAmLTbqnvri65OoY9si1dQSlDi7k4tBeo5SvrZ9WbeJmcvs1MEElit
         7PWjls/I4UGTvBQsudh85kZDg/WUFiyPhxE7BgscY3X+7Y5j+3cVo4JL4bh9WhD+0Jpz
         NBPED0PceON2I9UNBcrzOqAJGmLU/rJOxjwNYTkzZXpSlm82ogm4RPSlkUM7DbD0ANGB
         7sc/jHx33/b+ntWwdcvo7rCt7zzIZcKf13QDIYKdE3TjGxKi+LKG+VRac9CoLnK2NRvn
         LQu5Y/Uy+FwSpjqqyHvUjAMdAcT+DI6PkmkWDCVtcq0Gg4pvBqkvmmf+l1SDuZKyYJQk
         3TIA==
X-Gm-Message-State: AOJu0YzaM+bTCSe37HJ/Jnv+mjNEXUa9LJEwyF+Et1Z1Oyzwj/28zLtV
	CBXjKbze8gifyuyEXayXm1WiuA9sa+wFqZdvELPAZzHDCL5PUcXB3mk509wmc42kRWkAzHu78Uz
	h3mmwGViAiImeYu74BVq7hKFRvJc=
X-Google-Smtp-Source: AGHT+IHr7B6yYxHkxDxi6lBmmcltk0UCP2+t68Q/ye+CxxvyGQRvZQ3VjALOlOZcbWnNX7hpO/TlLydLeB61IhUwv+A=
X-Received: by 2002:a05:6512:3d02:b0:52c:dbc2:ea1 with SMTP id
 2adb3069b0e04-52eb998fc1cmr13231273e87.6.1721053960279; Mon, 15 Jul 2024
 07:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240715141448.2158477-1-adrian.freihofer@gmail.com> <50bea4fa4fe781c4b584d746fec34c758d28599f.camel@gmail.com>
In-Reply-To: <50bea4fa4fe781c4b584d746fec34c758d28599f.camel@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 15 Jul 2024 16:32:26 +0200
Message-ID: <CA+chaQeGeXFd7rH2KjsYdtW50Nnre0DL8ykjjmWSRKNX89OrYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/6] Use the kernel from sstate when building fitImages
To: adrian.freihofer@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 14:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201934

Doesn't it still rebuild from scratch when IMAGE_VERSION_SUFFIX changes?

To be able to re-use the kernel from sstate even when
IMAGE_VERSION_SUFFIX changes I've implemented:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12937
which was unfortunately rejected due to lack of interest from other
people outside LGE, but maybe you could take advantage of that as
well.

On Mon, Jul 15, 2024 at 4:22=E2=80=AFPM Adrian Freihofer via
lists.openembedded.org
<adrian.freihofer=3Dgmail.com@lists.openembedded.org> wrote:
>
> Task dependeny changes
>
> Configuration: image, fitimage, initramfs, unbundled
>
> KERNEL_IMAGETYPE =3D "Image"
> KERNEL_IMAGETYPES +=3D " fitImage "
> KERNEL_CLASSES =3D " kernel-fitimage "
> IMAGE_FSTYPES +=3D "cpio.gz"
> INITRAMFS_IMAGE =3D "core-image-minimal-initramfs"
>
> branch: master
>
> core-image-minimal.do_build do_deploy do_assemble_fitimage_initramfs do_b=
undle_initramfs do_populate_sysroot do_assemble_fitimage do_compile do_kern=
el_generate_rsa_keys core-image-minimal.do_image_complete do_install
>
> branch: adrianf/kernel-fitimage-sstate
>
> core-image-minimal.do_build do_deploy do_deploy_fitimage_unbundled core-i=
mage-minimal.do_image_complete do_install do_populate_sysroot do_assemble_f=
itimage do_compile do_kernel_generate_rsa_keys
>
> Diff
>
> 2a3
> > "core-image-minimal.do_build" -> "do_deploy_fitimage_unbundled"
> 6,11d6
> < "do_assemble_fitimage_initramfs" [label=3D"do_assemble_fitimage_initram=
fs"]
> < "do_assemble_fitimage_initramfs" -> "core-image-minimal.do_image_comple=
te"
> < "do_assemble_fitimage_initramfs" -> "do_bundle_initramfs"
> < "do_bundle_initramfs" [label=3D"do_bundle_initramfs"]
> < "do_bundle_initramfs" -> "core-image-minimal.do_image_complete"
> < "do_bundle_initramfs" -> "do_install"
> 14,15c9,10
> < "do_deploy" -> "do_assemble_fitimage_initramfs"
> < "do_deploy" -> "do_bundle_initramfs"
> ---
> > "do_deploy" -> "core-image-minimal.do_image_complete"
> > "do_deploy" -> "do_install"
> 16a12,14
> > "do_deploy_fitimage_unbundled" [label=3D"do_deploy_fitimage_unbundled"]
> > "do_deploy_fitimage_unbundled" -> "core-image-minimal.do_image_complete=
"
> > "do_deploy_fitimage_unbundled" -> "do_deploy"
>
> Configuration: fitimage, initramfs, unbundled
>
> KERNEL_IMAGETYPE:forcevariable =3D "fitImage"
> KERNEL_CLASSES =3D " kernel-fitimage "
> IMAGE_FSTYPES +=3D "cpio.gz"
> INITRAMFS_IMAGE =3D "core-image-minimal-initramfs"
>
> branch: master
>
> core-image-minimal.do_build do_deploy do_assemble_fitimage_initramfs do_b=
undle_initramfs do_populate_sysroot do_assemble_fitimage do_compile do_kern=
el_generate_rsa_keys core-image-minimal.do_image_complete do_install
>
> branch: adrianf/kernel-fitimage-sstate
>
> core-image-minimal.do_build do_deploy do_deploy_fitimage_unbundled core-i=
mage-minimal.do_image_complete do_install do_populate_sysroot do_assemble_f=
itimage do_compile do_kernel_generate_rsa_keys
>
> Diff
>
> 2a3
> > "core-image-minimal.do_build" -> "do_deploy_fitimage_unbundled"
> 6,11d6
> < "do_assemble_fitimage_initramfs" [label=3D"do_assemble_fitimage_initram=
fs"]
> < "do_assemble_fitimage_initramfs" -> "core-image-minimal.do_image_comple=
te"
> < "do_assemble_fitimage_initramfs" -> "do_bundle_initramfs"
> < "do_bundle_initramfs" [label=3D"do_bundle_initramfs"]
> < "do_bundle_initramfs" -> "core-image-minimal.do_image_complete"
> < "do_bundle_initramfs" -> "do_install"
> 14,15c9,10
> < "do_deploy" -> "do_assemble_fitimage_initramfs"
> < "do_deploy" -> "do_bundle_initramfs"
> ---
> > "do_deploy" -> "core-image-minimal.do_image_complete"
> > "do_deploy" -> "do_install"
> 16a12,14
> > "do_deploy_fitimage_unbundled" [label=3D"do_deploy_fitimage_unbundled"]
> > "do_deploy_fitimage_unbundled" -> "core-image-minimal.do_image_complete=
"
> > "do_deploy_fitimage_unbundled" -> "do_deploy"
>
> Configuration: image, fitimage, initramfs, bundled
>
> KERNEL_IMAGETYPE =3D "Image"
> KERNEL_IMAGETYPES +=3D " fitImage "
> KERNEL_CLASSES =3D " kernel-fitimage "
> IMAGE_FSTYPES +=3D "cpio.gz"
> INITRAMFS_IMAGE =3D "core-image-minimal-initramfs"
> INITRAMFS_IMAGE_BUNDLE =3D "1"
>
> branch: master
>
> core-image-minimal.do_build do_deploy do_assemble_fitimage_initramfs do_b=
undle_initramfs do_populate_sysroot do_transform_bundled_initramfs do_assem=
ble_fitimage do_compile do_kernel_generate_rsa_keys core-image-minimal.do_i=
mage_complete do_install
>
> branch: adrianf/kernel-fitimage-sstate
>
> core-image-minimal.do_build do_deploy do_assemble_fitimage_initramfs do_b=
undle_initramfs do_populate_sysroot do_transform_bundled_initramfs do_assem=
ble_fitimage do_compile do_kernel_generate_rsa_keys core-image-minimal.do_i=
mage_complete do_install
>
> Diff
>
> Configuration: image, fitimage
>
> KERNEL_IMAGETYPE =3D "Image"
> KERNEL_IMAGETYPES +=3D " fitImage "
> KERNEL_CLASSES =3D " kernel-fitimage "
>
> branch: master
>
> core-image-minimal.do_build do_deploy do_assemble_fitimage_initramfs do_b=
undle_initramfs do_populate_sysroot do_assemble_fitimage do_compile do_kern=
el_generate_rsa_keys core-image-minimal.do_image_complete do_install
>
> branch: adrianf/kernel-fitimage-sstate
>
> core-image-minimal.do_build do_deploy do_deploy_fitimage_unbundled core-i=
mage-minimal.do_image_complete do_install do_populate_sysroot do_assemble_f=
itimage do_compile do_kernel_generate_rsa_keys
>
> Diff
>
> 2a3
> > "core-image-minimal.do_build" -> "do_deploy_fitimage_unbundled"
> 6,11d6
> < "do_assemble_fitimage_initramfs" [label=3D"do_assemble_fitimage_initram=
fs"]
> < "do_assemble_fitimage_initramfs" -> "core-image-minimal.do_image_comple=
te"
> < "do_assemble_fitimage_initramfs" -> "do_bundle_initramfs"
> < "do_bundle_initramfs" [label=3D"do_bundle_initramfs"]
> < "do_bundle_initramfs" -> "core-image-minimal.do_image_complete"
> < "do_bundle_initramfs" -> "do_install"
> 14,15c9,10
> < "do_deploy" -> "do_assemble_fitimage_initramfs"
> < "do_deploy" -> "do_bundle_initramfs"
> ---
> > "do_deploy" -> "core-image-minimal.do_image_complete"
> > "do_deploy" -> "do_install"
> 16a12,14
> > "do_deploy_fitimage_unbundled" [label=3D"do_deploy_fitimage_unbundled"]
> > "do_deploy_fitimage_unbundled" -> "core-image-minimal.do_image_complete=
"
> > "do_deploy_fitimage_unbundled" -> "do_deploy"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201933): https://lists.openembedded.org/g/openembedde=
d-core/message/201933
> Mute This Topic: https://lists.openembedded.org/mt/107231736/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

