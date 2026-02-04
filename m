Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9C9E83EF9
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 13:52:27 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20809.1770213141279676431
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 05:52:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ULh09ZtW;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a79998d35aso7241045ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 05:52:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770213141; cv=none;
        d=google.com; s=arc-20240605;
        b=WZw9kwWudzPQz00xMCCvNY8qPFwS58ecfTmkec2DRjvgD3V8zEortTTmoKMPjUQ9Za
         hvDs1Si0Yk3gwaj1UA8HB/bRETmakph5bdzMlYJhYqzoLSJii3YzVfBlKRXUd4jrTwQb
         8EEz31EjQmG3O4hIjp170o91eFStmyzk0q0+4B4in2/SAiUrM6CB8Fx3F+Wf6jOM/joD
         ZXh0mDN1s1WMu5pb4FfBmC8VTEmGqPuJv8j/i5e2HwpsigQRm5BIFtlRysxFiU8SibLF
         R9yDqQ3jgytduUjUMbn5OcO7BfBKjeEGW0co4SMlOkYXLZZNdYcHmEbwo+cclu195mEK
         lrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vG20gvdib4Og3zhfR/sTVuNFczZaHh1H0SXEMfwHxRM=;
        fh=QoqqFwxpKbfGVLEmtDt3fqPmKSgrLC1MjLQFC6DQxlo=;
        b=WL6bD+rXESPE03JI+0GiL0QO6kCBNlfmhBvqqZNWzzS5z6VldSeZODpMvlJrqiTlPY
         YU9n/R7LyMX2mlG9gwsU0rptFNy7W+z9zFQ6DDF3vrOy7tzo6gooZOMWRIo3wXp2nlFq
         m8OtWB58vPC+PJKgYYRU3T4Ny1LhM3EVT5KWjO3T//qcm4ZYQHueJ4O6v32MeWf1HqVO
         VXImyzuINVtrTrqHP8dPXfUx1lxJl4sXVm0AGqdPovGYYiKfo0xy+JUfmvcwGtSSdefW
         xO5ZRR+sBNxsKVy2c72viiI9zU70TMi8btyDtPXrmfaatO7t0nBHlp4H806wega3/Oxb
         7Duw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770213141; x=1770817941; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vG20gvdib4Og3zhfR/sTVuNFczZaHh1H0SXEMfwHxRM=;
        b=ULh09ZtWi642r1ckXJQsHDlxSpbQKzT1owAHlFTkJWT/uM14VTs6bekxiIp+T2HmSi
         0dfkSZDSvXvOW7NKTf2dIAQlgOR4fG4yBlCScODvhXhOWYynwMNLZjUPPQadhZnTC+UV
         1H7JLiqaO3BipaSiCpR5AdmI9d5QL+SfJLONG77RsQkfApRy4IiEaEzwAF+T45S/Y15f
         Z1/TXvY2AMekjxuz6mfK16rxtoBfbgbaxXd7l0LPhzvviQoKQyJYt/E4/TLJ6GX7Y9wJ
         73BBzpVKJtmAzz62oBMN3Sue5ricfhrjp2u3qe8MkWSGgFaRY5XATH6iHxAFiUIIXrsp
         f3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770213141; x=1770817941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vG20gvdib4Og3zhfR/sTVuNFczZaHh1H0SXEMfwHxRM=;
        b=t21BkcxMKr68vTUiqWcH/Q8yPsQ/E0LM64vX3eCzxGBHYVtDK7bPBo+cm46rc7d4xA
         NupJCOARMZW4UZY1GRqOpNyo8WL/JhZrm193k9L4mRbW+gIIaWtjZ9rYMSzUeSpCLFFF
         5Bj9wgAz/sgqSzdwPQHUdEyjCvtcBlKDWyWZE0jNSgwRvhJSNz8JSberNoI3igphJCgy
         CgTkG82E0+d/Yt9l/LMFdyKLQJTCkRltMB/9yCL5BlbVzkdyE97w0PN0H6lMgSTFnJUB
         tIbK90zgV0lCheLYBQs+bTyeWG8JIXaXUHStDTU2Sbwswbf9LTAbDshM37tWJqgMroLa
         fHIw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ/Di7zx+8LiCzZsuX4BakLslyB1j1tramRDztWFThPUQ6ByKXdNsjIpWwG4z128+X8B0ooZy8eFkRwsMwz/1Iug==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzr8DSIn2zoMIGv3YJBtRAey5UQy0f7sYCSvPH8wDxTXLo2uzWW
	EE6ssAJVHN2HMg6hFjoyLw3h0MEEC/vIix5mzFO5hcsDNi6kUnpnMCgC9xiYmpxsojgAQTxxu9q
	ixxMqe4iy8joJL11OuOMIoxLinQAR0EGR7oXp
X-Gm-Gg: AZuq6aKBo5bt6Rr6qw4btx+Ez/nrJ/aJkjndcfQ25xkNfxjL6lB3ByIhbiga7nuC7gn
	Et4T+HFxVXSqjFjkvPehmiDZbCkHqip5pD17tqQ7zFZWa1FT1EGPNOoCk3GC8d0N5Tvjksep7vs
	xRaBGsWdDxPohgOjX2TSJBOew+J07NQdDAlJWtFzuu55faW6H1dpKdekNezybwKg0rxmyZT8Pj6
	R0ezR75ImsMPkqv4BC9LcvzJAsBGLZDPbwWGyRxLdVtGynFmLiAGrcuzZEiu6V6qZ1whPDBVv0D
	oyjAyg0Ph7VEm+hDaI4aWCvIVInm
X-Received: by 2002:a17:902:e54b:b0:271:479d:3dcb with SMTP id
 d9443c01a7336-2a933b9cd21mr30581235ad.6.1770213140364; Wed, 04 Feb 2026
 05:52:20 -0800 (PST)
MIME-Version: 1.0
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
 <443dd67d8398b30df2e6eb62ab06fc2433f62273.camel@pbarker.dev> <30102f29586e11b8f44d2af5c22a5cf89b95cf97.camel@pbarker.dev>
In-Reply-To: <30102f29586e11b8f44d2af5c22a5cf89b95cf97.camel@pbarker.dev>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Feb 2026 08:52:07 -0500
X-Gm-Features: AZwV_QhIBzxmV_byp8M5oo2VgCg0H2Cf6lgvcw9vl8344Li0KRgJuFKq_zXzhEQ
Message-ID: <CADkTA4OOD82---qGeOSoVFibNbtWFfbPnPG_+TByLeo6Qf1G7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 00/15] Enable rust support for linux kernel
To: Paul Barker <paul@pbarker.dev>
Cc: Harish.Sadineni@windriver.com, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, alistair.francis@wdc.com, 
	yoann.congal@smile.fr, elmehdi.younes@smile.fr, 
	richard.purdie@linuxfoundation.org, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006881b10649ffdd11"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 13:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230527

--0000000000006881b10649ffdd11
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 4, 2026 at 7:24=E2=80=AFAM Paul Barker <paul@pbarker.dev> wrote=
:

> On Wed, 2026-02-04 at 12:00 +0000, Paul Barker wrote:
> > On Thu, 2026-01-29 at 08:38 -0800, Sadineni, Harish via
> > lists.openembedded.org wrote:
> > > From: Harish Sadineni <Harish.Sadineni@windriver.com>
> > >
> > > v5:
> > > - Regression in autobuilder with v4 series is due to applying v4
> series together with following patch
> > >   "llvm: enable LLVMgold.so build by adding binutils dependency"(
> https://lists.openembedded.org/g/openembedded-core/message/229387)
> > >   is fixed by droping Alistair Francis's patch(
> https://lists.openembedded.org/g/openembedded-core/message/229091).
> > > - Updated patch "rust: install Rust library sources for 'make
> rustavailable' support" to install
> > >   rust standard library sources for rust-native.
> > >
> > > v4:
> > > - Resolved patchtest failures.
> > >
> > > v3:
> > > - Removed the DISTRO_FEATURES dependency for installing Rust library
> sources in the Rust recipe,
> > > - Extended support for on target rust kernel module developmet by
> installing Rust library sources and
> > >   introduced packaging of the Rust standard library sources in a
> dedicated ${PN}-src-lib package.
> > > - Integrated Alistair Francis's patch(
> https://lists.openembedded.org/g/openembedded-core/message/229091)
> > >   that uses the Rust bootstrap tool to install Rust library sources
> for rust-native.
> > > - Dropped the patch that added rust-kernel to native/nativesdk featur=
e
> filters in bitbake.conf.
> > > - Updated flags in the make-mod-scripts recipe to fix build failures
> when building Rust out-of-tree
> > >   module recipes.
> > > - Dropped the bindgen-cli patch extending BBCLASSEXTEND to include
> > >   nativesdk, as it has been merged into oe-core.
> > >
> > > v2:
> > > - Combined [PATCH 05/16][0] & [PATCH 06/16][1] from v1.
> > > - Updated commit message and added in code comments for patch "[PATCH
> 09/15] kernel-devsrc: copying
> > >   rust-kernel source to $kerneldir/build"
> > >
> > > [0] https://lists.openembedded.org/g/openembedded-core/message/228559
> > > [1] https://lists.openembedded.org/g/openembedded-core/message/228560
> > >
> > > v1:
> > > The previous series was RFC v4, "Enable Rust support for Linux kernel=
"
> > > (https://lists.openembedded.org/g/openembedded-core/message/226623).
> > >
> > > In addition, Yoann Congal posted RFC v2, "Kernel Rust out-of-tree
> module support"
> > > (https://lists.openembedded.org/g/openembedded-core/message/227281),
> which builds on top of RFC v4.
> > >
> > > The current patch series is a unified version that combines both
> efforts.
> > > Compared to the earlier series, the main changes are:
> > >
> > > -Kernel configuration fragments have been moved to yocto-kernel-cache=
.
> > > -The kernel fragments have been removed from SRC_URI and from the fil=
es
> > >  directory previously stored underrecipes-kernel/linux/files.
> > > -Updated the "[PATCH 11/16] selftest/cases/runtime_test: Add test for
> Linux Rust sample"
> > >  by appending KERNEL_EXTRA_FEATURES:append =3D
> 'features/kernel-sample/kernel-rust-sample.scc'
> > >  instead of adding this directly in the linux-yocto recipe.
> > >
> > >
> > > This patch series introduces Rust support into the linux-yocto kernel
> recipe and
> > > related build infrastructure in the Yocto Project. The goal is to
> enable building
> > > the Linux kernel with Rust components and provide support for buildin=
g
> kernel module
> > > which is written in rust and also provide support to build rust kerne=
l
> modules in sdk.
> > >
> > > And this series adds test for Linux Rust sample and also added suppor=
t
> > > for out-of-tree kernel module written in Rust as well as associated
> test.
> > >
> > > Summary of patches:
> > >
> > > - Patch 01: Add required dependencies ('clang-native',
> 'rust-native','bindgen-cli-native') to the kernel to support Rust binding
> generation.
> > > - Patch 02: Install the Rust standard library source ('library/') for
> native,target and sdk.
> > > - Patch 03: Updated `kernel-yocto.bbclass` to invoke `make
> rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
> > > - Patch 04: Add kernel configuration support for Rust (via
> 'kernel-rust.scc'), enabling the Rust build options in kernel config.
> > > - Patch 05: Fixed buildpaths errors when rust is enabled for kernel b=
y
> appending --remap-path-prefix to RUST_DEBUG_REMAP
> > > - Patch 06: split `HOSTCC` flag to align with to linux-yocto and fix
> build issue with make-mod-scripts recipe.
> > > - Patch 07: Disabling ccache when rust-kernel is enabled for
> linux-yocto.
> > > - Patch 08: Copy Rust kernel sources into kernel-devsrc build
> directory which will be required while running 'make prepare' in sdk.
> > > - Patch 09: Added oe-selftest case for the Linux Rust sample.
> > > - patch 10: Copying include/config/auto.conf in STAGING_KERNEL_BUILDD=
IR
> > > - patch 11: Export artifacts needed for out-of-tree Rust compilation
> > > - patch 12: Prepare out-of-tree rust module compilation
> > > - patch 13: Added rust-out-of-tree-module recipe in meta-skeleton lay=
er
> > > - Patch 14: Fixed buildpaths errors for rust-out-of-tree-module recip=
e
> by appending --remap-path-prefix to RUST_DEBUG_REMAP
> > > - patch 15: Added rust-out-of-tree selftest
> > >
> > > Patches have been build-tested successfully on:
> > > - qemuarm64
> > > - qemux86-64
> > >
> > > Benchmark test-result for x86-64:
> > >
> +-------------------------------+------------+-----------+-----------+---=
--------+
> > > > DISTRO_FEATURES               |   real     |   user    |    sys
> |  FS usage |
> > >
> +-------------------------------+------------+-----------+-----------+---=
--------+
> > > > rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s
> |   58 GB   |
> > > > rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s
> |   33 GB   |
> > >
> +-------------------------------+------------+-----------+-----------+---=
--------+
> >
> > We discussed these patches on Monday and have some feedback on the
> > design. Things are nearly correct, we do want to ensure that the user
> > experience is good before merging this though as people will quickly
> > start to depend on it.
> >
> > We think it would be better if Rust support was controlled by
> > KERNEL_FEATURES instead of DISTRO_FEATURES. This option now only impact=
s
> > the kernel and any kernel module recipes. It also may need to change
> > depending on MACHINE which makes it not a good fit for DISTRO_FEATURES =
-
> > e.g. one BSP may use an older LTS kernel with no required Rust code and
> > a different BSP may use a newer kernel and need a driver written in Rus=
t
> > for the board to function.
> >
> > We should add a new module-rust.bbclass instead of extending
> > module.bbclass with conditional logic. This can be included by any
> > modules which use Rust and handle any common setup. It can also check
> > for the presence of required files (scripts/target.json & rust/*) in th=
e
> > kernel's shared workdir, and perhaps the kernel config so that we can
> > give a sensible error message if they are missing. This means that
> > module-rust.bbclass doesn't need to check KERNEL_FEATURES for
> > rust-kernel, it can just look at the shared workdir (probably in
> > do_configure) to make sure that we're ready to build a Rust module.
>
> After I sent this, I spotted a patch for module.bbclass to check that
> CONFIG_MODULES is enabled [1]. Doing the same thing in a new
> module-rust.bbclass to check for CONFIG_RUST may be exactly what we
> need.
>

Except that I don't particularly like that check as it is in that patch,
so I wouldn't recommend copying it.

Make the invocation of the task conditional, not conditional checks
in the tasks.

Bruce



>
> [1]:
> https://lore.kernel.org/openembedded-core/20260204020908.864912-1-kai.kan=
g@windriver.com/T/#u
>
> >
> > If we can't use KERNEL_FEATURES, then perhaps a new KERNEL_RUST_SUPPORT
> > variable would work. In either case, this should only be checked in the
> > kernel recipe itself.
> >
> > Bruce - what do you think about KERNEL_FEATURES being used in this way?
> >
> > Best regards,
> >
>
> --
> Paul Barker
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000006881b10649ffdd11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 4, 2026 at 7:24=
=E2=80=AFAM Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev">paul@pbarke=
r.dev</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Wed, 2026-02-04 at 12:00 +0000, Paul Barker wrote:<br>
&gt; On Thu, 2026-01-29 at 08:38 -0800, Sadineni, Harish via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; From: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windr=
iver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; v5:<br>
&gt; &gt; - Regression in autobuilder with v4 series is due to applying v4 =
series together with following patch <br>
&gt; &gt;=C2=A0 =C2=A0&quot;llvm: enable LLVMgold.so build by adding binuti=
ls dependency&quot;(<a href=3D"https://lists.openembedded.org/g/openembedde=
d-core/message/229387" rel=3D"noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/message/229387</a>)<br>
&gt; &gt;=C2=A0 =C2=A0is fixed by droping Alistair Francis&#39;s patch(<a h=
ref=3D"https://lists.openembedded.org/g/openembedded-core/message/229091" r=
el=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/openem=
bedded-core/message/229091</a>).<br>
&gt; &gt; - Updated patch &quot;rust: install Rust library sources for &#39=
;make rustavailable&#39; support&quot; to install <br>
&gt; &gt;=C2=A0 =C2=A0rust standard library sources for rust-native. <br>
&gt; &gt; <br>
&gt; &gt; v4:<br>
&gt; &gt; - Resolved patchtest failures.<br>
&gt; &gt; <br>
&gt; &gt; v3:<br>
&gt; &gt; - Removed the DISTRO_FEATURES dependency for installing Rust libr=
ary sources in the Rust recipe,<br>
&gt; &gt; - Extended support for on target rust kernel module developmet by=
 installing Rust library sources and<br>
&gt; &gt;=C2=A0 =C2=A0introduced packaging of the Rust standard library sou=
rces in a dedicated ${PN}-src-lib package.<br>
&gt; &gt; - Integrated Alistair Francis&#39;s patch(<a href=3D"https://list=
s.openembedded.org/g/openembedded-core/message/229091" rel=3D"noreferrer" t=
arget=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message=
/229091</a>)<br>
&gt; &gt;=C2=A0 =C2=A0that uses the Rust bootstrap tool to install Rust lib=
rary sources for rust-native.<br>
&gt; &gt; - Dropped the patch that added rust-kernel to native/nativesdk fe=
ature filters in bitbake.conf.<br>
&gt; &gt; - Updated flags in the make-mod-scripts recipe to fix build failu=
res when building Rust out-of-tree<br>
&gt; &gt;=C2=A0 =C2=A0module recipes.<br>
&gt; &gt; - Dropped the bindgen-cli patch extending BBCLASSEXTEND to includ=
e<br>
&gt; &gt;=C2=A0 =C2=A0nativesdk, as it has been merged into oe-core.<br>
&gt; &gt; <br>
&gt; &gt; v2:<br>
&gt; &gt; - Combined [PATCH 05/16][0] &amp; [PATCH 06/16][1] from v1.<br>
&gt; &gt; - Updated commit message and added in code comments for patch &qu=
ot;[PATCH 09/15] kernel-devsrc: copying<br>
&gt; &gt;=C2=A0 =C2=A0rust-kernel source to $kerneldir/build&quot;<br>
&gt; &gt; <br>
&gt; &gt; [0] <a href=3D"https://lists.openembedded.org/g/openembedded-core=
/message/228559" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/message/228559</a><br>
&gt; &gt; [1] <a href=3D"https://lists.openembedded.org/g/openembedded-core=
/message/228560" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/message/228560</a><br>
&gt; &gt; <br>
&gt; &gt; v1:<br>
&gt; &gt; The previous series was RFC v4, &quot;Enable Rust support for Lin=
ux kernel&quot;<br>
&gt; &gt; (<a href=3D"https://lists.openembedded.org/g/openembedded-core/me=
ssage/226623" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/g/openembedded-core/message/226623</a>).<br>
&gt; &gt; <br>
&gt; &gt; In addition, Yoann Congal posted RFC v2, &quot;Kernel Rust out-of=
-tree module support&quot;<br>
&gt; &gt; (<a href=3D"https://lists.openembedded.org/g/openembedded-core/me=
ssage/227281" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/g/openembedded-core/message/227281</a>), which builds on top of RFC =
v4.<br>
&gt; &gt; <br>
&gt; &gt; The current patch series is a unified version that combines both =
efforts.<br>
&gt; &gt; Compared to the earlier series, the main changes are:<br>
&gt; &gt; <br>
&gt; &gt; -Kernel configuration fragments have been moved to yocto-kernel-c=
ache.<br>
&gt; &gt; -The kernel fragments have been removed from SRC_URI and from the=
 files<br>
&gt; &gt;=C2=A0 directory previously stored underrecipes-kernel/linux/files=
.<br>
&gt; &gt; -Updated the &quot;[PATCH 11/16] selftest/cases/runtime_test: Add=
 test for Linux Rust sample&quot;<br>
&gt; &gt;=C2=A0 by appending KERNEL_EXTRA_FEATURES:append =3D &#39;features=
/kernel-sample/kernel-rust-sample.scc&#39;<br>
&gt; &gt;=C2=A0 instead of adding this directly in the linux-yocto recipe.<=
br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; This patch series introduces Rust support into the linux-yocto ke=
rnel recipe and<br>
&gt; &gt; related build infrastructure in the Yocto Project. The goal is to=
 enable building<br>
&gt; &gt; the Linux kernel with Rust components and provide support for bui=
lding kernel module<br>
&gt; &gt; which is written in rust and also provide support to build rust k=
ernel modules in sdk.<br>
&gt; &gt; <br>
&gt; &gt; And this series adds test for Linux Rust sample and also added su=
pport<br>
&gt; &gt; for out-of-tree kernel module written in Rust as well as associat=
ed test.<br>
&gt; &gt; <br>
&gt; &gt; Summary of patches:<br>
&gt; &gt; <br>
&gt; &gt; - Patch 01: Add required dependencies (&#39;clang-native&#39;, &#=
39;rust-native&#39;,&#39;bindgen-cli-native&#39;) to the kernel to support =
Rust binding generation.<br>
&gt; &gt; - Patch 02: Install the Rust standard library source (&#39;librar=
y/&#39;) for=C2=A0 native,target and sdk.<br>
&gt; &gt; - Patch 03: Updated `kernel-yocto.bbclass` to invoke `make rustav=
ailable` during &#39;do_kernel_configme&#39;, ensuring Rust readiness.<br>
&gt; &gt; - Patch 04: Add kernel configuration support for Rust (via &#39;k=
ernel-rust.scc&#39;), enabling the Rust build options in kernel config.<br>
&gt; &gt; - Patch 05: Fixed buildpaths errors when rust is enabled for kern=
el by appending --remap-path-prefix to RUST_DEBUG_REMAP<br>
&gt; &gt; - Patch 06: split `HOSTCC` flag to align with to linux-yocto and =
fix build issue with make-mod-scripts recipe.<br>
&gt; &gt; - Patch 07: Disabling ccache when rust-kernel is enabled for linu=
x-yocto.<br>
&gt; &gt; - Patch 08: Copy Rust kernel sources into kernel-devsrc build dir=
ectory which will be required while running &#39;make prepare&#39; in sdk.<=
br>
&gt; &gt; - Patch 09: Added oe-selftest case for the Linux Rust sample.<br>
&gt; &gt; - patch 10: Copying include/config/auto.conf in STAGING_KERNEL_BU=
ILDDIR<br>
&gt; &gt; - patch 11: Export artifacts needed for out-of-tree Rust compilat=
ion<br>
&gt; &gt; - patch 12: Prepare out-of-tree rust module compilation<br>
&gt; &gt; - patch 13: Added rust-out-of-tree-module recipe in meta-skeleton=
 layer<br>
&gt; &gt; - Patch 14: Fixed buildpaths errors for rust-out-of-tree-module r=
ecipe by appending --remap-path-prefix to RUST_DEBUG_REMAP<br>
&gt; &gt; - patch 15: Added rust-out-of-tree selftest<br>
&gt; &gt; <br>
&gt; &gt; Patches have been build-tested successfully on:<br>
&gt; &gt; - qemuarm64<br>
&gt; &gt; - qemux86-64<br>
&gt; &gt; <br>
&gt; &gt; Benchmark test-result for x86-64:<br>
&gt; &gt; +-------------------------------+------------+-----------+-------=
----+-----------+<br>
&gt; &gt; &gt; DISTRO_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0real=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0user=C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 sys=C2=A0 =C2=A0 |=C2=A0 FS usage |<br>
&gt; &gt; +-------------------------------+------------+-----------+-------=
----+-----------+<br>
&gt; &gt; &gt; rust-kernel (enabled)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 46m=
1.720s=C2=A0 | 0m28.864s | 0m3.696s=C2=A0 |=C2=A0 =C2=A058 GB=C2=A0 =C2=A0|=
<br>
&gt; &gt; &gt; rust-kernel (disabled)=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 30m1.053=
s=C2=A0 | 0m20.091s | 0m2.748s=C2=A0 |=C2=A0 =C2=A033 GB=C2=A0 =C2=A0|<br>
&gt; &gt; +-------------------------------+------------+-----------+-------=
----+-----------+<br>
&gt; <br>
&gt; We discussed these patches on Monday and have some feedback on the<br>
&gt; design. Things are nearly correct, we do want to ensure that the user<=
br>
&gt; experience is good before merging this though as people will quickly<b=
r>
&gt; start to depend on it.<br>
&gt; <br>
&gt; We think it would be better if Rust support was controlled by<br>
&gt; KERNEL_FEATURES instead of DISTRO_FEATURES. This option now only impac=
ts<br>
&gt; the kernel and any kernel module recipes. It also may need to change<b=
r>
&gt; depending on MACHINE which makes it not a good fit for DISTRO_FEATURES=
 -<br>
&gt; e.g. one BSP may use an older LTS kernel with no required Rust code an=
d<br>
&gt; a different BSP may use a newer kernel and need a driver written in Ru=
st<br>
&gt; for the board to function.<br>
&gt; <br>
&gt; We should add a new module-rust.bbclass instead of extending<br>
&gt; module.bbclass with conditional logic. This can be included by any<br>
&gt; modules which use Rust and handle any common setup. It can also check<=
br>
&gt; for the presence of required files (scripts/target.json &amp; rust/*) =
in the<br>
&gt; kernel&#39;s shared workdir, and perhaps the kernel config so that we =
can<br>
&gt; give a sensible error message if they are missing. This means that<br>
&gt; module-rust.bbclass doesn&#39;t need to check KERNEL_FEATURES for<br>
&gt; rust-kernel, it can just look at the shared workdir (probably in<br>
&gt; do_configure) to make sure that we&#39;re ready to build a Rust module=
.<br>
<br>
After I sent this, I spotted a patch for module.bbclass to check that<br>
CONFIG_MODULES is enabled [1]. Doing the same thing in a new<br>
module-rust.bbclass to check for CONFIG_RUST may be exactly what we<br>
need.<br></blockquote><div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Except that I don&#39;t particularly like that check =
as it is in that patch,</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">so I wouldn&#39;t recommend copying it.</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Make the invocation of the task conditional, not co=
nditional=C2=A0checks</div><div class=3D"gmail_default" style=3D"font-size:=
small">in the tasks.</div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
[1]: <a href=3D"https://lore.kernel.org/openembedded-core/20260204020908.86=
4912-1-kai.kang@windriver.com/T/#u" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lore.kernel.org/openembedded-core/20260204020908.864912-1-kai.kang@wi=
ndriver.com/T/#u</a><br>
<br>
&gt; <br>
&gt; If we can&#39;t use KERNEL_FEATURES, then perhaps a new KERNEL_RUST_SU=
PPORT<br>
&gt; variable would work. In either case, this should only be checked in th=
e<br>
&gt; kernel recipe itself.<br>
&gt; <br>
&gt; Bruce - what do you think about KERNEL_FEATURES being used in this way=
?<br>
&gt; <br>
&gt; Best regards,<br>
&gt; <br>
<br>
-- <br>
Paul Barker<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000006881b10649ffdd11--

