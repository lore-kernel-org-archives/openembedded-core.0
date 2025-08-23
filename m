Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AED5CA0EFF
	for <webhook@archiver.kernel.org>; Sat, 23 Aug 2025 18:02:15 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.2091.1755972124937043777
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Aug 2025 11:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CSVmSJds;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 075081A0D3F;
	Sat, 23 Aug 2025 18:02:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D3483606A7;
	Sat, 23 Aug 2025 18:02:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4DB221C22D093;
	Sat, 23 Aug 2025 20:01:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755972121; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E/FD0g14CpGdv57NIwzoTxCMYxR4r+iEQVLpeBlJUjg=;
	b=CSVmSJds8ZAkO8i24p0azCccvz7p388ggqCAupZhAS3WLb3YxAKz/WA5vy3AvzWT/nAsSv
	7yiJaVv+GJ3KGkMqY+y3LQ9SLkE6k1RPSOgwETHwwLlOJ4TZ8wplp+xlLY5q0DzyaCGSQx
	B7/lNPlVqzJ50df8gm5bTUUjMFGHfRyqFfwQRijHR90CoI7fGCJvsFhdC1s4tfq+3+woLj
	DT9muNRwwtfB1dxceONLT7mc/cLa4U6njRGOfdG0S9B7ioNSJlDkFj9Dnml/TJ8zhOy7N7
	jFWPOhQdktaa2xZkcgbO9DsdQzO2G8MBjWV8KiJF8Acdu8HeB83p6uAQgG70xw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 23 Aug 2025 20:01:43 +0200
Message-Id: <DCA05S64WG23.38E7E260MAS7S@bootlin.com>
Subject: Re: [OE-core] [PATCH v6 00/14] mesa: lighten up target's libclc
 dependencies and fix panfrost support
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Markus Volk"
 <f_l_k@t-online.de>, "Trevor Woerner" <twoerner@gmail.com>, "Ross Burton"
 <ross.burton@arm.com>, "Otavio Salvador"
 <otavio.salvador@ossystems.com.br>, "Quentin Schulz"
 <quentin.schulz@cherry.de>, "Khem Raj" <raj.khem@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Quentin Schulz" <foss@0leil.net>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250822-mesa-libclc-panfrost-v6-0-393cf47e2fa2@cherry.de>
In-Reply-To: <20250822-mesa-libclc-panfrost-v6-0-393cf47e2fa2@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Aug 2025 18:02:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222347

On Fri Aug 22, 2025 at 2:53 PM CEST, Quentin Schulz wrote:
> @Otavio, can I add the new mesa-tools-native recipe under your
> maintainership in meta/conf/distro/include/maintainers.inc, it is after
> all still mesa?
>
> Panfrost support has been broken for a while already because it now
> requires libclc which isn't enforced by default. This fixes this
> oversight.
>
> While re-adding support for panfrost, the build time for libclc were a
> bit too much to my taste and I tried to figure out if we could lighten
> up the dependencies for the target recipe and it seems to be the case.
>
> libclc brings very expensive dependencies such as llvm and clang.
> Building clang and llvm for each target architecture is very expensive,
> but mesa allows to depend on prebuilt host binaries (mesa-clc and
> precomp-compiler). Those are built by mesa as well, but can be compiled
> in mesa-native instead of mesa, making the dependency expensive but only
> once regardless of the number of target architectures to build for.
> Ideally the mesa-clc and precomp-compiler would only be compiled in
> mesa-native if target mesa requires libclc support, however this is not
> possible as a target recipe cannot impact or depend on a native recipe's
> configuration. We thus have two choices, always build libclc in
> mesa-native with its heavy dependencies and impact every build or force
> the user to modify the mesa-native recipe in a custom layer (as a native
> recipe cannot use target's OVERRIDES). The latter is unacceptable so the
> former seems to be the only option. Another big downside is that
> mesa-native currently builds drivers (amd, nouveau, svga) which we may
> have absolutely no interest in building, increasing the build time and
> possibly dependencies list).
>
> A third choice is to spin-off the native mesa recipe with libclc support
> into a new recipe without drivers and only what's necessary to build
> mesa-clc and precomp-compiler binaries.
> This allows to keep a "clean" mesa-native recipe for whoever needs those
> drivers built-in (e.g. for testing, for qemu-native, or whatever else)
> and only bring the libclc dependency when required by the target recipe.
>
> Because libclc is now only built for the host, opencl support now needs
> to explicitly bring libclc and others to build as libclc won't bring it
> in the build environment anymore.
>
> Note that this was essentially only build tested (run tested on RK3588
> with panfrost though).
>
> Note that building gallium-llvm support on big.LITTLE architecture with
> TOOLCHAIN =3D "gcc" (the default) currently doesn't work as llvm doesn't
> support big.LITTLE architecture in -mcpu/-march which is passed to the
> CFLAGS/CXXFLAGS/LDFLAGS via the TUNE_CCARGS. I haven't investigated
> further than that but that prevents us from building opencl support for
> Rockchip most popular and powerful SoCs right now. One option could be
> to force this recipe to be built with clang toolchain only whenever
> gallium-llvm is specified in PACKAGECONFIG (not tested). Though that may
> be not straightforward seeing the comment in libclc recipe related to
> forcing the toolchain to clang.
> I'm also not sure mesa has a way to specify different args to LLVM-only
> drivers but that could be another option.
>
> Runtime tested on RK3588 and PX30 with kmscube.
> Partially runtime tested on PX30 with opencl-cts (and rusticl; it fails
> after some time but could be kernel related as it starts failing after
> [  968.625506] panfrost ff400000.gpu: gpu sched timeout, js=3D1, config=
=3D0x7b00, status=3D0x8, head=3D0xa68d200, tail=3D0xa68d200, sched_job=3D00=
00000019e6f20d
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---

Hi Quentin,

Thanks for the new version.

It looks like we have a build issue for riscv platforms:

ERROR: mesa-tools-native-2_25.2.1-r0 do_prepare_recipe_sysroot: The sstate =
manifest for task 'expat:populate_sysroot' (multilib variant '') could not =
be found.
The pkgarchs considered were: qemuriscv64, allarch, x86_64_x86_64-nativesdk=
.
But none of these manifests exists:
    /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-control/=
manifest-qemuriscv64-expat.populate_sysroot
    /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-control/=
manifest-allarch-expat.populate_sysroot
    /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-control/=
manifest-x86_64_x86_64-nativesdk-expat.populate_sysroot

https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/379
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/396
https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/362

Can you have a look at these, please?

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


