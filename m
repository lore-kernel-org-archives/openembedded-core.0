Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDBBFD9E1F
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 22:59:34 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83126.1772146766519861068
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 14:59:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Uhj4AkPR;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4398f8403edso1050571f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 14:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772146765; x=1772751565; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gi7TpcmA5r97fD4+ta/OWcN5pjyEAYlEQabOAgG9PW0=;
        b=Uhj4AkPR0yOJetJpgfz/7NIBZz5cwiEE8nhn8nSaMk22H+lcGzpHRurW3fyYYuDjmd
         W5p6Qd8qD8D4EtjG8ODGXosbPQGyFeReEo9MwHh/F7iyuiapYCaiUWT8jLGStT0hO5zC
         s0AOYa/HDiZlc2Xj/WsHZnE3ZHglfaqXlnM5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772146765; x=1772751565;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gi7TpcmA5r97fD4+ta/OWcN5pjyEAYlEQabOAgG9PW0=;
        b=mhSV+GRBajnp4w+9zxTLGNHHUIYEPyowZtKeBAfjrZEcMGgTuIyOjCS0AB5vg98svg
         j/xhsi6OHd68lwVuEyzKKgu4jr93JpWRrgtLJIoUb+3elLZgpWZipI7DBbDthkE/klWM
         c0+t3uEO6RD/NbrlheRt4XE3Ihq+2T5qxzCLonMEgZn47THcbkRofmMrAGh0m375wEk9
         F2wBNuSq4xDthSneLgRWphngM+uwkThIq4zW6Mv2hsqAapdJVmz8eIgbFo1DavNnC51d
         lml8uX10wC7u7wSHgj5OJudDU8kJdnmwjfQF4pklOftDSfRhSzWgN421ekrkbN54VE9F
         qVeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWExXTCUHImedaRJSZ+jwkyShMakvvDtndI6QQ7qX0vl3+7dAHoEFaLBrlK4Gi1DcqHYapOprwvsDsVhuYw+b1Iw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywbu0Mc/7OsyQtsx6NdwclO0kDe4typbzWJQNK7yRshOMn16b6U
	cm8Jvn8/yUdc/I7VIXsaNfsy8OihYWFwe7s2RwO0VnG0H+2Lek8KjxIPbaaUCXN5Z/A=
X-Gm-Gg: ATEYQzxO3SbtWP15lEkgwwmtrToarDyMeew3I6aY7X4M7wAbsNm9T3eS+HRK414/Xbc
	MQX63ZzpESx5es6ZczqU+YKJ/82h72EQTSu4vLcrVvP41XwP5UHp22nXwd4+FRCbFZl+Qubo2+v
	fo1vhLWJLzrpqlQFpXJBYw19TZNLbYmCQQPd4XyxMe2mjShpOqk5Am8b1AwcvitIAyywaU3K8EO
	EQcb/tqLDwzN4n4TQSJKcofyA6bSMVfowAzGclFxpVFx3+W+Ej8th7Omr72YfqTvz7fptCTQmTo
	Udo4HypGIKzsnY3gnMxntesHCDV75SJAEHijBzgHCJWLefmiyTm0tWBvltAFezoA+jgaF+GYHdV
	dUQlblwuFupJ6DC4MP26YSD+998iyaP7crodCg1WB4C2rYuuE9ruBjuYMyIZJhEHu/7FUUsARLF
	reeKb8o1iU89dtYveK25/yGyhx4hnfamLP25oD7ncFua5yhzWngQu1r0MKuNL40MNUdYWn+nXch
	biDkKggSMaMACpg
X-Received: by 2002:a05:6000:2313:b0:439:84cb:288d with SMTP id ffacd0b85a97d-4399de2cb36mr898373f8f.41.1772146764839;
        Thu, 26 Feb 2026 14:59:24 -0800 (PST)
Received: from localhost (2a01cb001331aa002c0b752a8b25831e.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2c0b:752a:8b25:831e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60f764sm2605032f8f.3.2026.02.26.14.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 14:59:24 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 23:59:24 +0100
Message-Id: <DGP9LKHSGZYC.3KL8OSVGZH43N@smile.fr>
Subject: Re: [OE-core] [PATCH v6 07/14] kernel: Disable ccache when kernel
 rust support is enabled
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Randy.MacLeod@windriver.com>, <Sundeep.Kokkonda@windriver.com>,
 <bruce.ashfield@gmail.com>, <paul@pbarker.dev>, <elmehdi.younes@smile.fr>
To: <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
 <20260212181039.1826154-3-Harish.Sadineni@windriver.com>
In-Reply-To: <20260212181039.1826154-3-Harish.Sadineni@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 22:59:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232067

On Thu Feb 12, 2026 at 7:10 PM CET, Harish via lists.openembedded.org Sadin=
eni wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> Currently, a ccache enabled build fails with:
>   |   HOSTRUSTC scripts/generate_rust_target
>   |   HOSTCC  scripts/kallsyms
>   |   HOSTCC  scripts/sorttable
>   |   HOSTCC  scripts/asn1_compiler
>   |   TOUCH   include/generated/gcc-plugins.h
>   |   DESCEND objtool
>   | error: multiple input filenames provided (first two filenames are gcc=
 and
> .../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target=
.rs)
>
> Linux rust build infrastructure does not currently support ccache (Opened=
 bug[0]).
>
> Quick summary: There are 2 issues: $HOSTCC is not escaped and rustc
> expect a path (and not a command)
>
> Disable ccache if KERNEL_RUST_SUPPORT is 'True' for kernel and kernel mod=
ule builds, including
> auxiliary tooling such as make-mod-scripts.
>
> More details in: https://lists.openembedded.org/g/openembedded-core/messa=
ge/229336
>
> [0]: https://github.com/Rust-for-Linux/linux/issues/1224

FYI, a patch has been submitted for this:
https://lore.kernel.org/rust-for-linux/20260225102819.16553-1-mo@sdhn.cc/
(It has a negative review though...)

> Co-developed-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> Cc: Alban MOIZAN <alban.moizan@smile.fr>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/classes-recipe/kernel-yocto-rust.bbclass              | 7 +++++++
>  .../make-mod-scripts/make-mod-scripts_1.0.bb               | 7 +++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes=
-recipe/kernel-yocto-rust.bbclass
> index fd9ee91c79..608ccc4609 100644
> --- a/meta/classes-recipe/kernel-yocto-rust.bbclass
> +++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
> @@ -16,3 +16,10 @@ do_kernel_configme[depends] +=3D "${RUST_KERNEL_TASK_D=
EPENDS}"
>  do_kernel_configme:append () {
>          oe_runmake -C ${S} O=3D${B} rustavailable
>  }
> +
> +# Linux rust build infrastructure does not currently support ccache
> +# see https://github.com/Rust-for-Linux/linux/issues/1224
> +# Quick summary: There are 2 issues: $HOSTCC is not escaped and rustc ex=
pect a path (and not a command)
> +# More details in: https://lists.openembedded.org/g/openembedded-core/me=
ssage/229336
> +# Disable ccache for kernel build if kernel rust support is enabled to w=
orkaround this.
> +CCACHE_DISABLE ?=3D "1"
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb=
 b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> index 874e16e642..6226382001 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -36,3 +36,10 @@ do_configure() {
>  		-C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} $t
>  	done
>  }
> +
> +# Linux rust build infrastructure does not currently support ccache
> +# see https://github.com/Rust-for-Linux/linux/issues/1224
> +# Quick summary: There are 2 issues: $HOSTCC is not escaped and rustc ex=
pect a path (and not a command)
> +# More details in: https://lists.openembedded.org/g/openembedded-core/me=
ssage/229336
> +# Disable ccache for kernel build if kernel rust support is enabled to w=
orkaround this
> +CCACHE_DISABLE ?=3D "${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True',=
 '1', '0', d)}"


--=20
Yoann Congal
Smile ECS


