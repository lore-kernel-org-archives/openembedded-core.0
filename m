Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D375CE83F18
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 13:54:47 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20842.1770213280620077788
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 05:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sn4U2ppo;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a8a7269547so65728485ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 05:54:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770213280; cv=none;
        d=google.com; s=arc-20240605;
        b=gHw+Xoi5H0WSgG+GSVjyUhTlNPP/vGQ/Baf2qUlr4uhe8e1cWu9OV4AJnJSpejFseh
         xiwZUwBT8D7g+7NgCveZzxMsPcUF5+5DE4KXViaK2xp0WEIfIEyOJMiuLywG3nU234BJ
         7w129tQULnW6nOpAJvGB31uCwGfaqA5TB9Ud85XZ4F1Xpz4gG2wuksxIovxcRgXyZeuf
         yZnnrke+JPfpZHYHm3YbV3/tUs4jka7TCJF7jlPa1jgc7ln30iQ46sfXw0ClUPA2LMBI
         EwZBKG/U3A09qkhiNWypfZLFkzidMHPtnUJYON40PmxpEABpQIgC0v6c+0ePNLAK1s/W
         Ypsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+kCHhsiWxD+vCJTc2REKGm66fP+VxIfLDViJOULPJKI=;
        fh=DR6oe0LKaW6lnfVz74mrA24XNdzuMefUnZoLeokpCpU=;
        b=A99M3ISfB1gVxr/kwaZwBmOZ/qE6Pz4OZ16eROUdgo5R5poQqZIxcU8JkMjKpk1FM5
         Q5QOYPipq8XqkfosL0b767kEsse43VgcG9ahhZ9sbtW5LGwFhEJtq6rk2WohMuK1wBA/
         ewUWKgVYTlG3urteQZ0bXyUCLpd8vvndkGCgxiCoIii/zWyc6yLKWIEXjVJ37k3y2F9A
         cUWy++TqDJ3Wg7QVP3Aveuy0O2ia1b5hpf1vumDt+Fl3HXDfnoPqzn+sZ8vHOTL6t8VD
         1UR1SqaNbx3MySpFjS6w7woI/ZzkDf3/97lcj9XSiW64l98bVK6cVtc3WfUwUtuDEo6E
         jFaA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770213280; x=1770818080; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+kCHhsiWxD+vCJTc2REKGm66fP+VxIfLDViJOULPJKI=;
        b=Sn4U2ppo8XdKUFQgMEjlO/MenpuGBVKCfEGNKfVPY4Fe1oRY1GEHzrXgcSJzo/fP60
         nSJFXMSIfA48L8Uf0EkJ0uaSvLNt+ti0WTsEjpP4W8HYMDCsLliM3HY7R9y2F2dSX8vp
         Z+QpUBRW4G5dznXcfgWMuT3c35G0hyB14XorK3VGqo+kjmL/jK5hcQ0jrMHxJs5brkjF
         jqLDweydY7dA6ZHD1eHsxvTw2o3vIH0DeNuvrMPg9NHfeJ+jpCox67C3ne1DiIjAhnjb
         r70js/HbJxF09NGGGT4YSv5ookHURzky/laczt7jZIURR9m2CvJc1hMo805C4FK1ldU/
         2XAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770213280; x=1770818080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kCHhsiWxD+vCJTc2REKGm66fP+VxIfLDViJOULPJKI=;
        b=SYE8u30WCuoUSkAK5lwl7Lb3Y3sVvBHN7SZ/dhrv2M+97+97TrcAJinw3+Iy3qPWh6
         lWBYKN9eYnTlHxUQh/35Ib+UETfGl/AhRVtR1/QUw9SwEgsPAXFBm26MqLx+VEEsmVGE
         t93WnG9xKgRqEcbxVRfscrsXoj4vn/rJkjHRtZaDoWnomdHe3b3gkwqgc6eGyQ+YkTwa
         V9A0kODuyfWCkLxicXoGlZPzZKtTlAZFN+nb2Q/ZP2Cec4antp+rMDwIVFV9dAwQMsSG
         P79tPvVZIpifEkCkEyk6UnNLMjq4wN5vWBsELiT9zHW7yt5EBG7HGcW2kX9XnGs4IPMv
         o6Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUsNHuMFzDjZ6rU6mckb18FulRELss8EUsgsQuKXzATNcnFKPss0U5DhPEDDDJjdnHhHdb1iwyIDDia1Z/Bu+DsKQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw4BI/V3kXXrhb8b/VuyTl8JTjmhtfGFykHg/ySGfrJnK1wcvMo
	SAo5u5wkWF5xzCGecBm6IuenMp0bXUL9UFgemvCY1feYQ9GwCydVeoOsOC8CfrMCqjDWyYFxopk
	pqzDskv0RH++mNlb2n2fGxMbBS6adY2g=
X-Gm-Gg: AZuq6aLfhA9PNg2ShwMw7es+45DVnXD4yLJWQZeOrWyyXXaKJEaOu9neaAZV7YZW8DG
	UPVzmndWmsXayErF/x/DRmNCAiuix++PQwISWcNq/NP+DQeQrxOrtISqr46lRTfDbsSfPgFqLj/
	Y8S4TUN/wJUGBgHo+HesdZOXmhiYLay5lgmVcgU7Ax36z/0pBXKLYLaVoN410peNvRQMqQbFqjx
	ZW9TJQpQLSIQIj59o3zMvUxYdUruV383N/iY9PnLsIClhEYDa0v+Hp+aVSKFKT0pCvZaX1D6Azv
	dcoxLXvX8Z88S9df6t6s+khqqunM
X-Received: by 2002:a17:903:37cc:b0:2a0:bb05:df4f with SMTP id
 d9443c01a7336-2a933fcadc4mr31229365ad.44.1770213279919; Wed, 04 Feb 2026
 05:54:39 -0800 (PST)
MIME-Version: 1.0
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com> <443dd67d8398b30df2e6eb62ab06fc2433f62273.camel@pbarker.dev>
In-Reply-To: <443dd67d8398b30df2e6eb62ab06fc2433f62273.camel@pbarker.dev>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Feb 2026 08:54:27 -0500
X-Gm-Features: AZwV_QhxEXBA1lJVFQejL2bZCrRnvQBIYltd3Kbqfv8PJwmYRHsy1W9EE4XKcfw
Message-ID: <CADkTA4OceVix4FCRkejKCQXTYdMk6yV8Cf2-Y+v7x-e4oN4kDA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 00/15] Enable rust support for linux kernel
To: paul@pbarker.dev
Cc: Harish.Sadineni@windriver.com, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, alistair.francis@wdc.com, 
	yoann.congal@smile.fr, elmehdi.younes@smile.fr, 
	richard.purdie@linuxfoundation.org, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b9f4a30649ffe54d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 13:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230528

--000000000000b9f4a30649ffe54d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 4, 2026 at 7:00=E2=80=AFAM Paul Barker via lists.openembedded.o=
rg <paul=3D
pbarker.dev@lists.openembedded.org> wrote:

> On Thu, 2026-01-29 at 08:38 -0800, Sadineni, Harish via
> lists.openembedded.org wrote:
> > From: Harish Sadineni <Harish.Sadineni@windriver.com>
> >
> > v5:
> > - Regression in autobuilder with v4 series is due to applying v4 series
> together with following patch
> >   "llvm: enable LLVMgold.so build by adding binutils dependency"(
> https://lists.openembedded.org/g/openembedded-core/message/229387)
> >   is fixed by droping Alistair Francis's patch(
> https://lists.openembedded.org/g/openembedded-core/message/229091).
> > - Updated patch "rust: install Rust library sources for 'make
> rustavailable' support" to install
> >   rust standard library sources for rust-native.
> >
> > v4:
> > - Resolved patchtest failures.
> >
> > v3:
> > - Removed the DISTRO_FEATURES dependency for installing Rust library
> sources in the Rust recipe,
> > - Extended support for on target rust kernel module developmet by
> installing Rust library sources and
> >   introduced packaging of the Rust standard library sources in a
> dedicated ${PN}-src-lib package.
> > - Integrated Alistair Francis's patch(
> https://lists.openembedded.org/g/openembedded-core/message/229091)
> >   that uses the Rust bootstrap tool to install Rust library sources for
> rust-native.
> > - Dropped the patch that added rust-kernel to native/nativesdk feature
> filters in bitbake.conf.
> > - Updated flags in the make-mod-scripts recipe to fix build failures
> when building Rust out-of-tree
> >   module recipes.
> > - Dropped the bindgen-cli patch extending BBCLASSEXTEND to include
> >   nativesdk, as it has been merged into oe-core.
> >
> > v2:
> > - Combined [PATCH 05/16][0] & [PATCH 06/16][1] from v1.
> > - Updated commit message and added in code comments for patch "[PATCH
> 09/15] kernel-devsrc: copying
> >   rust-kernel source to $kerneldir/build"
> >
> > [0] https://lists.openembedded.org/g/openembedded-core/message/228559
> > [1] https://lists.openembedded.org/g/openembedded-core/message/228560
> >
> > v1:
> > The previous series was RFC v4, "Enable Rust support for Linux kernel"
> > (https://lists.openembedded.org/g/openembedded-core/message/226623).
> >
> > In addition, Yoann Congal posted RFC v2, "Kernel Rust out-of-tree modul=
e
> support"
> > (https://lists.openembedded.org/g/openembedded-core/message/227281),
> which builds on top of RFC v4.
> >
> > The current patch series is a unified version that combines both effort=
s.
> > Compared to the earlier series, the main changes are:
> >
> > -Kernel configuration fragments have been moved to yocto-kernel-cache.
> > -The kernel fragments have been removed from SRC_URI and from the files
> >  directory previously stored underrecipes-kernel/linux/files.
> > -Updated the "[PATCH 11/16] selftest/cases/runtime_test: Add test for
> Linux Rust sample"
> >  by appending KERNEL_EXTRA_FEATURES:append =3D
> 'features/kernel-sample/kernel-rust-sample.scc'
> >  instead of adding this directly in the linux-yocto recipe.
> >
> >
> > This patch series introduces Rust support into the linux-yocto kernel
> recipe and
> > related build infrastructure in the Yocto Project. The goal is to enabl=
e
> building
> > the Linux kernel with Rust components and provide support for building
> kernel module
> > which is written in rust and also provide support to build rust kernel
> modules in sdk.
> >
> > And this series adds test for Linux Rust sample and also added support
> > for out-of-tree kernel module written in Rust as well as associated tes=
t.
> >
> > Summary of patches:
> >
> > - Patch 01: Add required dependencies ('clang-native',
> 'rust-native','bindgen-cli-native') to the kernel to support Rust binding
> generation.
> > - Patch 02: Install the Rust standard library source ('library/') for
> native,target and sdk.
> > - Patch 03: Updated `kernel-yocto.bbclass` to invoke `make
> rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
> > - Patch 04: Add kernel configuration support for Rust (via
> 'kernel-rust.scc'), enabling the Rust build options in kernel config.
> > - Patch 05: Fixed buildpaths errors when rust is enabled for kernel by
> appending --remap-path-prefix to RUST_DEBUG_REMAP
> > - Patch 06: split `HOSTCC` flag to align with to linux-yocto and fix
> build issue with make-mod-scripts recipe.
> > - Patch 07: Disabling ccache when rust-kernel is enabled for linux-yoct=
o.
> > - Patch 08: Copy Rust kernel sources into kernel-devsrc build directory
> which will be required while running 'make prepare' in sdk.
> > - Patch 09: Added oe-selftest case for the Linux Rust sample.
> > - patch 10: Copying include/config/auto.conf in STAGING_KERNEL_BUILDDIR
> > - patch 11: Export artifacts needed for out-of-tree Rust compilation
> > - patch 12: Prepare out-of-tree rust module compilation
> > - patch 13: Added rust-out-of-tree-module recipe in meta-skeleton layer
> > - Patch 14: Fixed buildpaths errors for rust-out-of-tree-module recipe
> by appending --remap-path-prefix to RUST_DEBUG_REMAP
> > - patch 15: Added rust-out-of-tree selftest
> >
> > Patches have been build-tested successfully on:
> > - qemuarm64
> > - qemux86-64
> >
> > Benchmark test-result for x86-64:
> >
> +-------------------------------+------------+-----------+-----------+---=
--------+
> > > DISTRO_FEATURES               |   real     |   user    |    sys    |
> FS usage |
> >
> +-------------------------------+------------+-----------+-----------+---=
--------+
> > > rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  |
>  58 GB   |
> > > rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  |
>  33 GB   |
> >
> +-------------------------------+------------+-----------+-----------+---=
--------+
>
> We discussed these patches on Monday and have some feedback on the
> design. Things are nearly correct, we do want to ensure that the user
> experience is good before merging this though as people will quickly
> start to depend on it.
>
> We think it would be better if Rust support was controlled by
> KERNEL_FEATURES instead of DISTRO_FEATURES. This option now only impacts
> the kernel and any kernel module recipes. It also may need to change
> depending on MACHINE which makes it not a good fit for DISTRO_FEATURES -
> e.g. one BSP may use an older LTS kernel with no required Rust code and
> a different BSP may use a newer kernel and need a driver written in Rust
> for the board to function.
>
> We should add a new module-rust.bbclass instead of extending
> module.bbclass with conditional logic. This can be included by any
> modules which use Rust and handle any common setup. It can also check
> for the presence of required files (scripts/target.json & rust/*) in the
> kernel's shared workdir, and perhaps the kernel config so that we can
> give a sensible error message if they are missing. This means that
> module-rust.bbclass doesn't need to check KERNEL_FEATURES for
> rust-kernel, it can just look at the shared workdir (probably in
> do_configure) to make sure that we're ready to build a Rust module.
>
> If we can't use KERNEL_FEATURES, then perhaps a new KERNEL_RUST_SUPPORT
> variable would work. In either case, this should only be checked in the
> kernel recipe itself.
>
> Bruce - what do you think about KERNEL_FEATURES being used in this way?
>

It's a reasonable idea. KERNEL_FEATURES are supposed to abstract
the individual CONFIG_ items from spreading throughout the code base
so checking KERNEL_FEATURES is acceptable for coordinating different
parts of kernel infrastructure.

I'll just repeat my feedback that I sent earlier (and also to your other
reply in this email), that I prefer to make the tasks in the bbclasses
conditional, not have them checking for conditionals within the tasks.

Bruce



>
> Best regards,
>
> --
> Paul Barker
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230511):
> https://lists.openembedded.org/g/openembedded-core/message/230511
> Mute This Topic: https://lists.openembedded.org/mt/117528967/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000b9f4a30649ffe54d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 4, 2026 at 7:00=E2=80=
=AFAM Paul Barker via <a href=3D"http://lists.openembedded.org" target=3D"_=
blank">lists.openembedded.org</a> &lt;paul=3D<a href=3D"mailto:pbarker.dev@=
lists.openembedded.org" target=3D"_blank">pbarker.dev@lists.openembedded.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Thu, 2026-01-29 at 08:38 -0800, Sadineni, Harish via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; From: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windriver.=
com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;<br>
&gt; <br>
&gt; v5:<br>
&gt; - Regression in autobuilder with v4 series is due to applying v4 serie=
s together with following patch <br>
&gt;=C2=A0 =C2=A0&quot;llvm: enable LLVMgold.so build by adding binutils de=
pendency&quot;(<a href=3D"https://lists.openembedded.org/g/openembedded-cor=
e/message/229387" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/message/229387</a>)<br>
&gt;=C2=A0 =C2=A0is fixed by droping Alistair Francis&#39;s patch(<a href=
=3D"https://lists.openembedded.org/g/openembedded-core/message/229091" rel=
=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/openembe=
dded-core/message/229091</a>).<br>
&gt; - Updated patch &quot;rust: install Rust library sources for &#39;make=
 rustavailable&#39; support&quot; to install <br>
&gt;=C2=A0 =C2=A0rust standard library sources for rust-native. <br>
&gt; <br>
&gt; v4:<br>
&gt; - Resolved patchtest failures.<br>
&gt; <br>
&gt; v3:<br>
&gt; - Removed the DISTRO_FEATURES dependency for installing Rust library s=
ources in the Rust recipe,<br>
&gt; - Extended support for on target rust kernel module developmet by inst=
alling Rust library sources and<br>
&gt;=C2=A0 =C2=A0introduced packaging of the Rust standard library sources =
in a dedicated ${PN}-src-lib package.<br>
&gt; - Integrated Alistair Francis&#39;s patch(<a href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/message/229091" rel=3D"noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/2290=
91</a>)<br>
&gt;=C2=A0 =C2=A0that uses the Rust bootstrap tool to install Rust library =
sources for rust-native.<br>
&gt; - Dropped the patch that added rust-kernel to native/nativesdk feature=
 filters in bitbake.conf.<br>
&gt; - Updated flags in the make-mod-scripts recipe to fix build failures w=
hen building Rust out-of-tree<br>
&gt;=C2=A0 =C2=A0module recipes.<br>
&gt; - Dropped the bindgen-cli patch extending BBCLASSEXTEND to include<br>
&gt;=C2=A0 =C2=A0nativesdk, as it has been merged into oe-core.<br>
&gt; <br>
&gt; v2:<br>
&gt; - Combined [PATCH 05/16][0] &amp; [PATCH 06/16][1] from v1.<br>
&gt; - Updated commit message and added in code comments for patch &quot;[P=
ATCH 09/15] kernel-devsrc: copying<br>
&gt;=C2=A0 =C2=A0rust-kernel source to $kerneldir/build&quot;<br>
&gt; <br>
&gt; [0] <a href=3D"https://lists.openembedded.org/g/openembedded-core/mess=
age/228559" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/message/228559</a><br>
&gt; [1] <a href=3D"https://lists.openembedded.org/g/openembedded-core/mess=
age/228560" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/message/228560</a><br>
&gt; <br>
&gt; v1:<br>
&gt; The previous series was RFC v4, &quot;Enable Rust support for Linux ke=
rnel&quot;<br>
&gt; (<a href=3D"https://lists.openembedded.org/g/openembedded-core/message=
/226623" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.or=
g/g/openembedded-core/message/226623</a>).<br>
&gt; <br>
&gt; In addition, Yoann Congal posted RFC v2, &quot;Kernel Rust out-of-tree=
 module support&quot;<br>
&gt; (<a href=3D"https://lists.openembedded.org/g/openembedded-core/message=
/227281" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.or=
g/g/openembedded-core/message/227281</a>), which builds on top of RFC v4.<b=
r>
&gt; <br>
&gt; The current patch series is a unified version that combines both effor=
ts.<br>
&gt; Compared to the earlier series, the main changes are:<br>
&gt; <br>
&gt; -Kernel configuration fragments have been moved to yocto-kernel-cache.=
<br>
&gt; -The kernel fragments have been removed from SRC_URI and from the file=
s<br>
&gt;=C2=A0 directory previously stored underrecipes-kernel/linux/files.<br>
&gt; -Updated the &quot;[PATCH 11/16] selftest/cases/runtime_test: Add test=
 for Linux Rust sample&quot;<br>
&gt;=C2=A0 by appending KERNEL_EXTRA_FEATURES:append =3D &#39;features/kern=
el-sample/kernel-rust-sample.scc&#39;<br>
&gt;=C2=A0 instead of adding this directly in the linux-yocto recipe.<br>
&gt; <br>
&gt; <br>
&gt; This patch series introduces Rust support into the linux-yocto kernel =
recipe and<br>
&gt; related build infrastructure in the Yocto Project. The goal is to enab=
le building<br>
&gt; the Linux kernel with Rust components and provide support for building=
 kernel module<br>
&gt; which is written in rust and also provide support to build rust kernel=
 modules in sdk.<br>
&gt; <br>
&gt; And this series adds test for Linux Rust sample and also added support=
<br>
&gt; for out-of-tree kernel module written in Rust as well as associated te=
st.<br>
&gt; <br>
&gt; Summary of patches:<br>
&gt; <br>
&gt; - Patch 01: Add required dependencies (&#39;clang-native&#39;, &#39;ru=
st-native&#39;,&#39;bindgen-cli-native&#39;) to the kernel to support Rust =
binding generation.<br>
&gt; - Patch 02: Install the Rust standard library source (&#39;library/&#3=
9;) for=C2=A0 native,target and sdk.<br>
&gt; - Patch 03: Updated `kernel-yocto.bbclass` to invoke `make rustavailab=
le` during &#39;do_kernel_configme&#39;, ensuring Rust readiness.<br>
&gt; - Patch 04: Add kernel configuration support for Rust (via &#39;kernel=
-rust.scc&#39;), enabling the Rust build options in kernel config.<br>
&gt; - Patch 05: Fixed buildpaths errors when rust is enabled for kernel by=
 appending --remap-path-prefix to RUST_DEBUG_REMAP<br>
&gt; - Patch 06: split `HOSTCC` flag to align with to linux-yocto and fix b=
uild issue with make-mod-scripts recipe.<br>
&gt; - Patch 07: Disabling ccache when rust-kernel is enabled for linux-yoc=
to.<br>
&gt; - Patch 08: Copy Rust kernel sources into kernel-devsrc build director=
y which will be required while running &#39;make prepare&#39; in sdk.<br>
&gt; - Patch 09: Added oe-selftest case for the Linux Rust sample.<br>
&gt; - patch 10: Copying include/config/auto.conf in STAGING_KERNEL_BUILDDI=
R<br>
&gt; - patch 11: Export artifacts needed for out-of-tree Rust compilation<b=
r>
&gt; - patch 12: Prepare out-of-tree rust module compilation<br>
&gt; - patch 13: Added rust-out-of-tree-module recipe in meta-skeleton laye=
r<br>
&gt; - Patch 14: Fixed buildpaths errors for rust-out-of-tree-module recipe=
 by appending --remap-path-prefix to RUST_DEBUG_REMAP<br>
&gt; - patch 15: Added rust-out-of-tree selftest<br>
&gt; <br>
&gt; Patches have been build-tested successfully on:<br>
&gt; - qemuarm64<br>
&gt; - qemux86-64<br>
&gt; <br>
&gt; Benchmark test-result for x86-64:<br>
&gt; +-------------------------------+------------+-----------+-----------+=
-----------+<br>
&gt; &gt; DISTRO_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0real=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0user=C2=A0 =C2=A0=
 |=C2=A0 =C2=A0 sys=C2=A0 =C2=A0 |=C2=A0 FS usage |<br>
&gt; +-------------------------------+------------+-----------+-----------+=
-----------+<br>
&gt; &gt; rust-kernel (enabled)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 46m1.720=
s=C2=A0 | 0m28.864s | 0m3.696s=C2=A0 |=C2=A0 =C2=A058 GB=C2=A0 =C2=A0|<br>
&gt; &gt; rust-kernel (disabled)=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 30m1.053s=C2=
=A0 | 0m20.091s | 0m2.748s=C2=A0 |=C2=A0 =C2=A033 GB=C2=A0 =C2=A0|<br>
&gt; +-------------------------------+------------+-----------+-----------+=
-----------+<br>
<br>
We discussed these patches on Monday and have some feedback on the<br>
design. Things are nearly correct, we do want to ensure that the user<br>
experience is good before merging this though as people will quickly<br>
start to depend on it.<br>
<br>
We think it would be better if Rust support was controlled by<br>
KERNEL_FEATURES instead of DISTRO_FEATURES. This option now only impacts<br=
>
the kernel and any kernel module recipes. It also may need to change<br>
depending on MACHINE which makes it not a good fit for DISTRO_FEATURES -<br=
>
e.g. one BSP may use an older LTS kernel with no required Rust code and<br>
a different BSP may use a newer kernel and need a driver written in Rust<br=
>
for the board to function.<br>
<br>
We should add a new module-rust.bbclass instead of extending<br>
module.bbclass with conditional logic. This can be included by any<br>
modules which use Rust and handle any common setup. It can also check<br>
for the presence of required files (scripts/target.json &amp; rust/*) in th=
e<br>
kernel&#39;s shared workdir, and perhaps the kernel config so that we can<b=
r>
give a sensible error message if they are missing. This means that<br>
module-rust.bbclass doesn&#39;t need to check KERNEL_FEATURES for<br>
rust-kernel, it can just look at the shared workdir (probably in<br>
do_configure) to make sure that we&#39;re ready to build a Rust module.<br>
<br>
If we can&#39;t use KERNEL_FEATURES, then perhaps a new KERNEL_RUST_SUPPORT=
<br>
variable would work. In either case, this should only be checked in the<br>
kernel recipe itself.<br>
<br>
Bruce - what do you think about KERNEL_FEATURES being used in this way?<br>=
</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">It&#39;s a reasonable idea. KERNEL_FEATURES are supposed to ab=
stract</div><div class=3D"gmail_default" style=3D"font-size:small">the indi=
vidual CONFIG_ items from spreading throughout the code base</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">so checking KERNEL_FEATURES i=
s acceptable for coordinating=C2=A0different</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">parts of kernel infrastructure.</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">I&#39;ll just repeat my feedback that =
I sent earlier (and also to your other</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">reply in this email), that I prefer to make the tas=
ks in the bbclasses</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">conditional, not have them checking for conditionals within the tasks.=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#230511): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/230511" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/230511</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117528967/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117528967/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
</div>

--000000000000b9f4a30649ffe54d--

