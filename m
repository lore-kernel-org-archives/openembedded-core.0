Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A4CE95394
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 12:24:37 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19242.1770207867288432699
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 04:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=LsmJ+XQC;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=HbvtGg5r;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5E822140012D;
	Wed,  4 Feb 2026 07:24:26 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 04 Feb 2026 07:24:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1770207866; x=1770294266; bh=CSPJDORa2T
	PIDypuObHL8KfXMWftO9nFmzuOnuwUfa4=; b=LsmJ+XQCfl60u3FJd+n3K7gQx0
	H8qJxAzeQS8ZItzI1JwwzzGuYKkQuJXGL01Sd0bzRMMpTQCUg/Yq7LjCp0KN4z7R
	xtQYrTaZMO9e9WsFgY+WBgafiO12ZLYPeriTNj14rBeJJNx7lLEklSX9Q8oOJ8kO
	uMxq59aqm3y50J50YDUzuGghZufHrXle8NSFDChwi9T9qPHNMs7vwbid6RGIublS
	zmFO4HAd5PBx4d2KeXyH3pO9lThXOwxNueVgaRIseo01KMnTmdqMhXaUGk1KB+N8
	cp5JcIINnX+uF5duvUKRmLfTHWv8+/o+p8QEDSdTp+p4XwAHaNV8c9OVJMLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770207866; x=1770294266; bh=CSPJDORa2TPIDypuObHL8KfXMWftO9nFmzu
	OnuwUfa4=; b=HbvtGg5rhl3ys0/i1tohJ12cHbRBrBClmlVKC4PX8tTHDvy1T/1
	rvB0AlOS0A7UGKaduQnF/Rt09r0bWHtfcas8cLtlc0MJXKdRdbv/oCLR+HCyAOF9
	HhsGv/yJv4xlQ/SIUb7Iuf/q4i2Wgyg/nG0sB4qV5Ka1oyZrY+ggXRN+OyeBs0JH
	YTMMjOIz5bPCH1p3nrqVF6BPnyzT5kMA0+MrgsCsPdI4pbK9hjuuZxThNke0RhdP
	U8v7dg6sk7KdtEhvu6cV2SiZR4YlzEkiB4HOqFqVW2tPh1VIYP4d1xZlisYXbCQi
	S35mhTqlI1+EfVQCkhEWKjRnbpoTFGlyK1A==
X-ME-Sender: <xms:eTqDaULgxupO9UIWjeCWMU0XDSza7bi5uZqZhkABjgQwDwUU30RgGg>
    <xme:eTqDaWuotM9A63EYnkyug2A0sayAmhiIGN_Wg2rSpzdAEPLL1OqFvrvK9yg177diW
    DTdJVQpAMNll_h85FIohx-8DB7oX0g4mEKAz0V7rOUuRIukXARO1QEn>
X-ME-Received: <xmr:eTqDaYWs_VJugQkgOXFb27Fcoo_25NP_ULTkH62hH8WagN5qG3fxTjpG0EdutXKT2j9DvBk1s1rP6SXtRXQx0SJ2AZVApXQR47LhWTa6ltEo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedvgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfevffgjfhgtfgggsehgtderre
    dtreejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghr
    rdguvghvqeenucggtffrrghtthgvrhhnpeetueehgfegteejtdeiiedvteffledtheektd
    fgtdefffeiteekgeevgfehfeeggeenucffohhmrghinhepohhpvghnvghmsggvugguvggu
    rdhorhhgpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghp
    thhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephhgrrhhishhhrdhsrg
    guihhnvghnihesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopegsrhhutggvrdgr
    shhhfhhivghlugesghhmrghilhdrtghomhdprhgtphhtthhopehrrghnugihrdhmrggtlh
    gvohguseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtohepshhunhguvggvphdrkhho
    khhkohhnuggrseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtoheprghlihhsthgrih
    hrrdhfrhgrnhgtihhsseifuggtrdgtohhmpdhrtghpthhtohephihorghnnhdrtghonhhg
    rghlsehsmhhilhgvrdhfrhdprhgtphhtthhopegvlhhmvghhughirdihohhunhgvshessh
    hmihhlvgdrfhhrpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhig
    fhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqd
    gtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:eTqDaRioKq0Dh2dijEIIgpOF7tSGCX0Ti4RmQEW8QLJ215YXsS2uaw>
    <xmx:eTqDaQpSz1W1G4PLqq1GxcudPwlj2FvRxMe7PyHOdHm5ZCl2IVTmzw>
    <xmx:eTqDaXGg1CucTUxiqC5Jq3o_nkfZ8s_SmPDiblaGmSfiWD-nS5Vb1w>
    <xmx:eTqDaV7S4GAKBk4wlgkWjs9J9gNRoj27r31ZitH8MZ7KwRzdT4jPEw>
    <xmx:ejqDaUNsQ-5lPFwTNiKzQpOCFh2WQEWyRqMmcEwDSesT6ZGHI-lOobYJ>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Feb 2026 07:24:24 -0500 (EST)
Message-ID: <30102f29586e11b8f44d2af5c22a5cf89b95cf97.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v5 00/15] Enable rust support for linux kernel
From: Paul Barker <paul@pbarker.dev>
To: Harish.Sadineni@windriver.com, bruce.ashfield@gmail.com
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com, 
 alistair.francis@wdc.com, yoann.congal@smile.fr, elmehdi.younes@smile.fr, 
 richard.purdie@linuxfoundation.org,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Date: Wed, 04 Feb 2026 12:24:21 +0000
In-Reply-To: <443dd67d8398b30df2e6eb62ab06fc2433f62273.camel@pbarker.dev>
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
	 <443dd67d8398b30df2e6eb62ab06fc2433f62273.camel@pbarker.dev>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-CG6mr7rv6ncHdyR1quWf"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 12:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230516


--=-CG6mr7rv6ncHdyR1quWf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-02-04 at 12:00 +0000, Paul Barker wrote:
> On Thu, 2026-01-29 at 08:38 -0800, Sadineni, Harish via
> lists.openembedded.org wrote:
> > From: Harish Sadineni <Harish.Sadineni@windriver.com>
> >=20
> > v5:
> > - Regression in autobuilder with v4 series is due to applying v4 series=
 together with following patch=20
> >   "llvm: enable LLVMgold.so build by adding binutils dependency"(https:=
//lists.openembedded.org/g/openembedded-core/message/229387)
> >   is fixed by droping Alistair Francis's patch(https://lists.openembedd=
ed.org/g/openembedded-core/message/229091).
> > - Updated patch "rust: install Rust library sources for 'make rustavail=
able' support" to install=20
> >   rust standard library sources for rust-native.=20
> >=20
> > v4:
> > - Resolved patchtest failures.
> >=20
> > v3:
> > - Removed the DISTRO_FEATURES dependency for installing Rust library so=
urces in the Rust recipe,
> > - Extended support for on target rust kernel module developmet by insta=
lling Rust library sources and
> >   introduced packaging of the Rust standard library sources in a dedica=
ted ${PN}-src-lib package.
> > - Integrated Alistair Francis's patch(https://lists.openembedded.org/g/=
openembedded-core/message/229091)
> >   that uses the Rust bootstrap tool to install Rust library sources for=
 rust-native.
> > - Dropped the patch that added rust-kernel to native/nativesdk feature =
filters in bitbake.conf.
> > - Updated flags in the make-mod-scripts recipe to fix build failures wh=
en building Rust out-of-tree
> >   module recipes.
> > - Dropped the bindgen-cli patch extending BBCLASSEXTEND to include
> >   nativesdk, as it has been merged into oe-core.
> >=20
> > v2:
> > - Combined [PATCH 05/16][0] & [PATCH 06/16][1] from v1.
> > - Updated commit message and added in code comments for patch "[PATCH 0=
9/15] kernel-devsrc: copying
> >   rust-kernel source to $kerneldir/build"
> >=20
> > [0] https://lists.openembedded.org/g/openembedded-core/message/228559
> > [1] https://lists.openembedded.org/g/openembedded-core/message/228560
> >=20
> > v1:
> > The previous series was RFC v4, "Enable Rust support for Linux kernel"
> > (https://lists.openembedded.org/g/openembedded-core/message/226623).
> >=20
> > In addition, Yoann Congal posted RFC v2, "Kernel Rust out-of-tree modul=
e support"
> > (https://lists.openembedded.org/g/openembedded-core/message/227281), wh=
ich builds on top of RFC v4.
> >=20
> > The current patch series is a unified version that combines both effort=
s.
> > Compared to the earlier series, the main changes are:
> >=20
> > -Kernel configuration fragments have been moved to yocto-kernel-cache.
> > -The kernel fragments have been removed from SRC_URI and from the files
> >  directory previously stored underrecipes-kernel/linux/files.
> > -Updated the "[PATCH 11/16] selftest/cases/runtime_test: Add test for L=
inux Rust sample"
> >  by appending KERNEL_EXTRA_FEATURES:append =3D 'features/kernel-sample/=
kernel-rust-sample.scc'
> >  instead of adding this directly in the linux-yocto recipe.
> >=20
> >=20
> > This patch series introduces Rust support into the linux-yocto kernel r=
ecipe and
> > related build infrastructure in the Yocto Project. The goal is to enabl=
e building
> > the Linux kernel with Rust components and provide support for building =
kernel module
> > which is written in rust and also provide support to build rust kernel =
modules in sdk.
> >=20
> > And this series adds test for Linux Rust sample and also added support
> > for out-of-tree kernel module written in Rust as well as associated tes=
t.
> >=20
> > Summary of patches:
> >=20
> > - Patch 01: Add required dependencies ('clang-native', 'rust-native','b=
indgen-cli-native') to the kernel to support Rust binding generation.
> > - Patch 02: Install the Rust standard library source ('library/') for  =
native,target and sdk.
> > - Patch 03: Updated `kernel-yocto.bbclass` to invoke `make rustavailabl=
e` during 'do_kernel_configme', ensuring Rust readiness.
> > - Patch 04: Add kernel configuration support for Rust (via 'kernel-rust=
.scc'), enabling the Rust build options in kernel config.
> > - Patch 05: Fixed buildpaths errors when rust is enabled for kernel by =
appending --remap-path-prefix to RUST_DEBUG_REMAP
> > - Patch 06: split `HOSTCC` flag to align with to linux-yocto and fix bu=
ild issue with make-mod-scripts recipe.
> > - Patch 07: Disabling ccache when rust-kernel is enabled for linux-yoct=
o.
> > - Patch 08: Copy Rust kernel sources into kernel-devsrc build directory=
 which will be required while running 'make prepare' in sdk.
> > - Patch 09: Added oe-selftest case for the Linux Rust sample.
> > - patch 10: Copying include/config/auto.conf in STAGING_KERNEL_BUILDDIR
> > - patch 11: Export artifacts needed for out-of-tree Rust compilation
> > - patch 12: Prepare out-of-tree rust module compilation
> > - patch 13: Added rust-out-of-tree-module recipe in meta-skeleton layer
> > - Patch 14: Fixed buildpaths errors for rust-out-of-tree-module recipe =
by appending --remap-path-prefix to RUST_DEBUG_REMAP
> > - patch 15: Added rust-out-of-tree selftest
> >=20
> > Patches have been build-tested successfully on:
> > - qemuarm64
> > - qemux86-64
> >=20
> > Benchmark test-result for x86-64:
> > +-------------------------------+------------+-----------+-----------+-=
----------+
> > > DISTRO_FEATURES               |   real     |   user    |    sys    | =
 FS usage |
> > +-------------------------------+------------+-----------+-----------+-=
----------+
> > > rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  | =
  58 GB   |
> > > rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  | =
  33 GB   |
> > +-------------------------------+------------+-----------+-----------+-=
----------+
>=20
> We discussed these patches on Monday and have some feedback on the
> design. Things are nearly correct, we do want to ensure that the user
> experience is good before merging this though as people will quickly
> start to depend on it.
>=20
> We think it would be better if Rust support was controlled by
> KERNEL_FEATURES instead of DISTRO_FEATURES. This option now only impacts
> the kernel and any kernel module recipes. It also may need to change
> depending on MACHINE which makes it not a good fit for DISTRO_FEATURES -
> e.g. one BSP may use an older LTS kernel with no required Rust code and
> a different BSP may use a newer kernel and need a driver written in Rust
> for the board to function.
>=20
> We should add a new module-rust.bbclass instead of extending
> module.bbclass with conditional logic. This can be included by any
> modules which use Rust and handle any common setup. It can also check
> for the presence of required files (scripts/target.json & rust/*) in the
> kernel's shared workdir, and perhaps the kernel config so that we can
> give a sensible error message if they are missing. This means that
> module-rust.bbclass doesn't need to check KERNEL_FEATURES for
> rust-kernel, it can just look at the shared workdir (probably in
> do_configure) to make sure that we're ready to build a Rust module.

After I sent this, I spotted a patch for module.bbclass to check that
CONFIG_MODULES is enabled [1]. Doing the same thing in a new
module-rust.bbclass to check for CONFIG_RUST may be exactly what we
need.

[1]: https://lore.kernel.org/openembedded-core/20260204020908.864912-1-kai.=
kang@windriver.com/T/#u

>=20
> If we can't use KERNEL_FEATURES, then perhaps a new KERNEL_RUST_SUPPORT
> variable would work. In either case, this should only be checked in the
> kernel recipe itself.
>=20
> Bruce - what do you think about KERNEL_FEATURES being used in this way?
>=20
> Best regards,
>=20

--=20
Paul Barker


--=-CG6mr7rv6ncHdyR1quWf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaYM6dREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0btBcAQD0j/tZE/biRhNGnIoTvbRBQBTXjgpnCAqo
fFCn57Cx+wEA6hTh6uRTNS6ZAaUT6F4/AJlCnk2P/0jK/jerBAR7WAI=
=UJ/3
-----END PGP SIGNATURE-----

--=-CG6mr7rv6ncHdyR1quWf--

