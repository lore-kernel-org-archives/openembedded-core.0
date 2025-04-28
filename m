Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9185BC3ABA4
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 16:16:20 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.52512.1745856974785451286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 09:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XkE8IGA8;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6064d4c14ebso1009649eaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 09:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745856974; x=1746461774; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1y6s7imu6gnrJrmM6s4C8/9JrE5fTdtBLxqrwQT0LY=;
        b=XkE8IGA8R9/sUux2eBhwhXDa0dqCQD4IZmkt0tpK8SO5sCMWML7Jg1Lwld8HYnWPJ3
         pOtHHbqUv63Ir046IpFfvT6yOKHwnz8GOw1NiQt5e9Yk6WKLCKBw2lWK0fX/ZU4mr+eN
         WEkdhV7lyrg/OWcmS69qhNPyGNjiXbA0CJ3XF8aEZBtpZVFvXKL3fKKtsM8V+Bj5tyfX
         2P7CLcIbhO/ay6DzHKFiv5i3GHUfxcP3oPOoa1QNtSD9RrhiOSy9VS5ybBLzInlqI53z
         HKzS//KXd8UJZcGLVxSPk+T5yS3mdpnHfbeSOrHfW8xlgpccLYQVun2k0+GRlyk74M4S
         BdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745856974; x=1746461774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1y6s7imu6gnrJrmM6s4C8/9JrE5fTdtBLxqrwQT0LY=;
        b=pv751txl8TMvhvC6UKz5j1fT0jcEXaAjIFQAO6vay7ukeJYNM/fKrhvohijMaSwdxl
         5cXSHG6iyhjCFFwQ7eboM8YMAu8388SHQfwOKo8yENIRW7Vg0LjTCvDi2iPUFGKREVAJ
         R1Gq3I7qtgH6c3zjb3P2Dk8y/Y+wncZUVsm8C1+WgsbOJu+YtQF4oqt9jqV6nX24OQ/z
         9CE2yKc4MTnnGVBaMhrCmtgUFSz7IMySC3yR8703HcdsL8F+EKcy3ISfzAJI1h3RnW0R
         0SFdy4+xHaDxfhEaFIPu/AKJ4Y7bOleNr5mzHQ93ZVsNW8m4hDb00s7chYTsUn2FP/eu
         syww==
X-Gm-Message-State: AOJu0Yy7RQGuCSQ/8dZr6fLvv9pXRJTqsk23jwAs/tIcymMnlvTSHEq9
	grPEDyRooLWdy55JLJznqmvW5dUVk7xKAHLqEJSo4jTEB5SD+6nA8CGEp2532o26WSc4n3/ACTv
	RPGH34uMFX9GuVSRUDOwIvhhRhm0=
X-Gm-Gg: ASbGnctHibNs6Z400YNARgO9k2DAXZsHAn9oKEE0L9w0YcOSciHqRwuxJue1mMUYaOE
	1rHl8W6aGWHvVvOycTv19Z1lsXmIdQ/GXeFnJUlFQ6Jlg3A5tfJ4nWN7mT6oFpo7Jm+PafEXfvV
	pyoAjMp7zGPCEDfZMNgRES
X-Google-Smtp-Source: AGHT+IHeAxsNT2a9s8rceQ4TmirC0di97lcComNFY+PGdKFRZEhXuEwRdruPhJNtioR4686igZCJKXYYbm1DRmuTkwc=
X-Received: by 2002:a05:6820:1a0b:b0:606:44f0:a963 with SMTP id
 006d021491bc7-60658e8dc4dmr6285994eaf.1.1745856973965; Mon, 28 Apr 2025
 09:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250422064651.824-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20250422064651.824-1-liuyd.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Apr 2025 09:15:47 -0700
X-Gm-Features: ATxdqUF6DGX7ze5OrIJU-Wj_CNVlyDwDg8fr8OXIQHjkAb2IAAyIHs4zNb3byP0
Message-ID: <CAMKF1srwLJYcKkbH1abn1OXtHYo4hjjsnDpMoE9RPiAwzx-AGw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: multilib-header fix for llvm-config.h
To: Liu Yiding <liuyd.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 16:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215620

Hi Yiding,

Can you show the diff between the two llvm-config.h files please ?
This can be problematic if we compile 32bit binaries which uses this
file. So it will be
good to try to build a 32bit binary using this headers on target.

On Mon, Apr 21, 2025 at 11:47=E2=80=AFPM Liu Yiding <liuyd.fnst@fujitsu.com=
> wrote:
>
> fix the issue that:
> | file /usr/include/llvm/Config/llvm-config.h conflicts between attempted=
 installs of lib32-llvm-dev-20.1.2-r0.core2_32 and llvm-dev-20.1.2-r0.core2=
_64
>
> reproduce steps:
> 1. Add in local.conf the following lines:
>
>   MACHINE ?=3D "qemux86-64"
>
>   require conf/multilib.conf
>
>   MULTILIBS ?=3D "multilib:lib32"
>
>   DEFAULTTUNE:virtclass-multilib-lib32 ?=3D "core2-32"
>
> 2. add lib32-llvm-dev llvm-dev to core-image-minimal.bb
>
>   IMAGE_INSTALL =3D "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL} l=
ib32-llvm-dev llvm-dev"
>
> 3. $ bitbake core-image-minimal
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  meta/recipes-devtools/llvm/llvm_20.1.2.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/llvm/llvm_20.1.2.bb b/meta/recipes-dev=
tools/llvm/llvm_20.1.2.bb
> index 98855fa4c1..5e2c0e0300 100644
> --- a/meta/recipes-devtools/llvm/llvm_20.1.2.bb
> +++ b/meta/recipes-devtools/llvm/llvm_20.1.2.bb
> @@ -12,7 +12,7 @@ DEPENDS =3D "libffi libxml2 zlib zstd libedit ninja-nat=
ive llvm-native"
>
>  RDEPENDS:${PN}:append:class-target =3D " ncurses-terminfo"
>
> -inherit cmake pkgconfig
> +inherit cmake pkgconfig multilib_header
>  # could be 'rcX' or 'git' or empty ( for release )
>  VER_SUFFIX =3D ""
>
> @@ -155,6 +155,8 @@ do_install() {
>      # Try to clean up datadir if it is empty, but don't fail if there ar=
e
>      # libclc files there
>      rmdir ${D}${datadir} || true
> +
> +    oe_multilib_header llvm/Config/llvm-config.h
>  }
>
>  do_install:append:class-native() {
> --
> 2.43.0
>

