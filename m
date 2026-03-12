Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762E1106ACF0
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 22:21:07 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2848.1773354065244785885
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 15:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lZVXfFqH;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-485345e1013so19740205e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 15:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773354063; x=1773958863; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/b0rE/HPNT2vp2ggjuronSAdj0653i2qq0e/sISxgU0=;
        b=lZVXfFqHbRmxLrYwNFne/YagM7m4tmFkzzo7W7jgLJU67eGGq3kbanPZIxrgeKDh7g
         kWT+g2mU7KhQTYTlRHCzA4bsB4bXbfdag4/CMTKTC/9TfeSTT1SJTyx2tLS/fgppxIZ0
         fiFrvrT7SCmPEqb9kfShel76nnqZIwzCkECAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773354063; x=1773958863;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/b0rE/HPNT2vp2ggjuronSAdj0653i2qq0e/sISxgU0=;
        b=PvO+nKmWgKS1kSgSP063+HqGhf/0u3uVhrh6RcTpz4TMltVIY8l/UAT3xZ085ziqa4
         K1p8zyO8FvgG6WawiVtbi05pesvyMBPNXMuDl7Gk1WgggSNEWUV1u7gxczXje4orHEJu
         ls6xRJrnkWJLnUOIlTGFbDnjUDVDeol8a31ZDVjuUO1OduKi2zJMeGuw5CmxGWPUZhT3
         cp312HBZIrJqRPDyEjXGLpXzeEYDttqUfdG/dyOrueHHPXOWXKV26pyHf4YN1jIKk5Aq
         WwQkgLnLJlNAIm2HB1UUzsQd7r05324BimTSlEyHeecoc5+WdOq+UeZ/QhcN7hsh+iwX
         UJ8g==
X-Forwarded-Encrypted: i=1; AJvYcCWxTKKNudAmh0d4CgOFRKGTBJpinHcpv6TwR3XCnPgcTb7SSw/ZClmOzQ4xGKzHUsFLpSF30XZCPNzQuQrl7tqadA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy1HZ/eAUMDMPzC+ZgrClLyrOuKSLWlsZsqhaBUffwUKDs3GNYW
	g8yBZ5AXXprQc3Z55eiCRu1tNrz/o8r0mZ/xbg2yc+dbXb8Kvb8u50APKR6WJ1Dma5Y=
X-Gm-Gg: ATEYQzyFN6ABGTMZEheB4uKOMavdGMMedyV+YU6dXP/OQklCVeG4JO3i9W/VuRCChLm
	zs8KFIsciRaZQK0xolTjj0ic+gpBASnzESc8OOOWIHTGcGEWkSKuZJOCfsEWx0nTNOA8UdgnBBu
	/rYtizMsFybgOgCINfK2ucsB+6jP7A3EttRodAce/TQx6H72twLsn06DfEloJ4jYgxebnhWKEIn
	X8dV76az00mYLBPtbzVlaS+ffuWGohWIcD6j9kLT3kM5OGcImGjm1qtq9GDPWPzvBUTXzjVnG5J
	jii82Al/6plPDUPQRnInOGNhckUHI5DzBmi/ypQ7VisSLAnsjJErJtq0h9BCD+Fkx/8z9cf9zrc
	hlNKLTvyVaekMCukNZpuApNGG6wBMUkgSzEA9kMNmycdz06DcIxk5F167gap+tGKLKYQ/8d4KaE
	CiT7y+JyS4xEH3GEBNnrr1Y0Tc0LZVXQjNuT91d4CgLURjRoSt+WU8xfZpHaIZZ40GhDKmNjKYy
	NkvMBgA0aB5IWnm
X-Received: by 2002:a05:6000:2210:b0:439:5fe4:421a with SMTP id ffacd0b85a97d-439fe1aef95mr9785097f8f.30.1773354063134;
        Thu, 12 Mar 2026 15:21:03 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a9a19e6457d4ef2f.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a9a1:9e64:57d4:ef2f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2187aasm10500342f8f.30.2026.03.12.15.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 15:21:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 23:21:02 +0100
Message-Id: <DH15JTHEOBMI.IF3H1ZQR30SP@smile.fr>
Cc: <Randy.MacLeod@windriver.com>, <Sundeep.Kokkonda@windriver.com>,
 <paul@pbarker.dev>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>, "Bruce Ashfield"
 <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [PATCH v7 01/14] linux-yocto: conditionally add
 clang/rust/bindgen-cli-native to DEPENDS
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
 <20260304174324.1186644-2-Harish.Sadineni@windriver.com>
 <3cc131eb7aae470b98fdbb1bf8c3476685505d2f.camel@linuxfoundation.org>
In-Reply-To: <3cc131eb7aae470b98fdbb1bf8c3476685505d2f.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 22:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233006

On Thu Mar 12, 2026 at 2:34 PM CET, Richard Purdie wrote:
> On Wed, 2026-03-04 at 09:43 -0800, Sadineni, Harish via lists.openembedde=
d.org wrote:
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>=20
>> Conditionally add 'clang-native', 'rust-native' and 'bindgen-cli-native'=
 to 'DEPENDS'
>> when Kernel Rust Support is enabled.
>>=20
>> These tools are required for building Rust-enabled kernels and for
>> generating Rust FFI bindings via bindgen during the kernel build.
>>=20
>> This ensures the additional dependencies are only pulled in when
>> Rust support is explicitly enabled, avoiding unnecessary native
>> dependencies for non-Rust kernel builds.
>>=20
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> ---
>> =C2=A0meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
>> =C2=A01 file changed, 3 insertions(+)
>>=20
>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-ke=
rnel/linux/linux-yocto.inc
>> index 4d0a726bb6..b7961bbcdf 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> @@ -76,11 +76,14 @@ do_install:append(){
>> =C2=A0KERNEL_FEATURES:append:qemuall =3D " features/kernel-sample/kernel=
-sample.scc"
>> =C2=A0
>> =C2=A0KERNEL_DEBUG ?=3D ""
>> +KERNEL_RUST_SUPPORT ?=3D ""
>> =C2=A0# These used to be version specific, but are now common dependenci=
es.=C2=A0 New
>> =C2=A0# tools / dependencies will continue to be added in version specif=
ic recipes.
>> =C2=A0DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "=
powerpc" ], "elfutils-native", "", d)}'
>> =C2=A0DEPENDS +=3D "openssl-native util-linux-native"
>> =C2=A0DEPENDS +=3D "gmp-native libmpc-native"
>> +RUST_KERNEL_DEPENDS ?=3D "${@bb.utils.contains('KERNEL_RUST_SUPPORT', '=
True', 'clang-native rust-native bindgen-cli-native', '', d)}"
>> +DEPENDS +=3D "${RUST_KERNEL_DEPENDS}"
>> =C2=A0
>> =C2=A0# Some options depend on CONFIG_PAHOLE_VERSION, so need to make pa=
hole-native available before do_kernel_configme
>> =C2=A0do_kernel_configme[depends] +=3D '${@bb.utils.contains("KERNEL_DEB=
UG", "True", "pahole-native:do_populate_sysroot", "", d)}'
>
> I get the feeling we're still not quite agreeing on how to make the
> enabling of the feature work. I'm suggesting we do something like this:
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-reci=
pe/kernel-yocto.bbclass
> index e53bf151941..9cc7568ab09 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -269,6 +269,9 @@ do_kernel_metadata() {
>         KERNEL_FEATURES_FINAL=3D""
>         if [ -n "${KERNEL_FEATURES}" ]; then
>                 for feature in ${KERNEL_FEATURES}; do
> +                        if [ "$feature" =3D "rust" ]; then
> +                                feature=3D"features/kernel-rust/kernel-r=
ust.scc"
> +                        fi
>                         feature_as_specified=3D"$feature"
>                         feature=3D"$(echo $feature_as_specified | cut -d:=
 -f1)"
>                         feature_specifier=3D"$(echo $feature_as_specified=
 | cut -d: -f2)"
>
> which means you can then simply add to your config:
>
> KERNEL_FEATURES +=3D "rust"
>
> and things should be enabled. This patch would then become:
>
> RUST_KERNEL_DEPENDS ?=3D "${@bb.utils.contains('KERNEL_FEATURES', 'rust',=
 'clang-native rust-native bindgen-cli-native', '', d)}"
>
> Is there some reason we can't do something like this?

I did try and it worked: See "TO SQUASH: switch linux-yocto rust enabling t=
o KERNEL_FEATURES"
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dycongal/=
master/kernel-rust&id=3D17d4d7979e9bcf3a1c56c37357940a802a0ff570

Harish, while you rebase over the recently merged rust upgrade. Can you
look at this suggestion and see if that work for you? If you like it
(and I hope you do), please squash it in the right commits of your
series.

Regards,

>
> Cheers,
>
> Richard


--=20
Yoann Congal
Smile ECS


