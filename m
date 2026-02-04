Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B5EE9538E
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 12:00:47 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18866.1770206443192883073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 04:00:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=eFvmdQdv;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=NfIrgPPu;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 50CEB14001DF;
	Wed,  4 Feb 2026 07:00:42 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 04 Feb 2026 07:00:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1770206442; x=1770292842; bh=eELJBjlphi
	rShO3a5+ZtxLCpQZVm0mJrgsrkDyJgORk=; b=eFvmdQdv2r2acBQwBBBCMEQtvK
	pauN6h16vRyJkZRIp+OvvHqjg0VFS0DTr4bTRZ6+QsKVlEBKcvw+buT158iEWNyN
	qwzlBB1BWYGeDzKjUcaZZpxHO3irTqfWpyoXt4+LWJXAZynXA8iCcyk7C7pZVBkI
	jbo9RQelPU0MqdF158npAS1OlbhlYS+Qi7Hromrg1yES8kjFmpaaXbf8bY7SG3/q
	OR2u5MjwOqURNPYd3dOykMvzd6AGRKBDaO3+8z8I4HXrOJZ7hOpgLKaPFSr1HvW3
	fP5YtNbyfNVIEs9ZPGryNLXuvpS5RrX394RVzpEmfUK5Xdt++sujQtM/CPkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770206442; x=1770292842; bh=eELJBjlphirShO3a5+ZtxLCpQZVm0mJrgsr
	kDyJgORk=; b=NfIrgPPufPtnCO3rnuWUN6yX/gtma/GkhN0AI01oxb64tYmPPh2
	ClMqJf5j/TraZ4qiwYwar8h+laXGWOSSmIvxMMewKEMC/R0gkOBMRFXrWbIvFfjZ
	JL//vTSFSEX29h6Kd7i9kdgOEEqoaAAmHNQfhpIaIG2STlwW8DJW+4Na4d5p2uCG
	A3KCenQRpEBGt4/7rPhbbq6FHwxl4BgLuizvBVDmbYVUcb3lwmgiu8RHJq3XbB//
	+t7vcssfN36NyH8TVFrLo9gJI1NeH7LqXMlD+AKX8hnK7EUJ43EDyW1+izfivMJZ
	JLyGpmSlrQB0Vs5k0xL8YFESQkAgKzBwzbw==
X-ME-Sender: <xms:6TSDaTzF5fVuTvpTjhiNtVlBiTCoAZqPIEtWlyNWsFKELbq9rgyHdg>
    <xme:6TSDad3CDDCzc3PMrI037VJmvIK_xxNwttys6EJp5_hUcwIeG2BfzbqhdOuI2iLJk
    3AEuA3B_av7sikzqCiFHoVhF5bA2Y7JWsHm6ZVG_ZZZ-gS3emcuYUQ>
X-ME-Received: <xmr:6TSDaQ9bW73vLYU2k1OWeTygCz0rwdVQA8lSuXJHU_Wbcvg2CyZvV7Sm437fEfSBs_OhD_5_cuErQueMv8zraeB-W2wdVuz7KQ86HQq_dlV2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedvfeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfevffgjfhgtfgggsehgtderre
    dtreejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghr
    rdguvghvqeenucggtffrrghtthgvrhhnpefhkefhuefgleefleduleelhfektedvffeitd
    dtueeukefhieduiedvfeeuhedutdenucffohhmrghinhepohhpvghnvghmsggvugguvggu
    rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeelpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehhrghrihhshhdrshgrughinhgvnhhiseifihhnug
    hrihhvvghrrdgtohhmpdhrtghpthhtohepsghruhgtvgdrrghshhhfihgvlhgusehgmhgr
    ihhlrdgtohhmpdhrtghpthhtoheprhgrnhguhidrmhgrtghlvghougesfihinhgurhhivh
    gvrhdrtghomhdprhgtphhtthhopehsuhhnuggvvghprdhkohhkkhhonhgurgesfihinhgu
    rhhivhgvrhdrtghomhdprhgtphhtthhopegrlhhishhtrghirhdrfhhrrghntghishesfi
    gutgdrtghomhdprhgtphhtthhopeihohgrnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhr
    pdhrtghpthhtohepvghlmhgvhhguihdrhihouhhnvghssehsmhhilhgvrdhfrhdprhgtph
    htthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdr
    ohhrghdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrd
    hophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:6TSDadr0FbV0kzwSEDAJZSmn7u28Mgmhv1RyfkPSmyX38cOfzyC_5w>
    <xmx:6TSDaaRMzRpYiu09FjwmHT5mkjXx2cCEtaYufJQyasNyctnRly0s6w>
    <xmx:6TSDaQOwFs0lRnJmTb1ThQ58PQi3wJAuG1yGVJOiruAwvfVq5T0usQ>
    <xmx:6TSDaYifllqcpIzkDwd1rlwwLM3YbSlan7hc_kQd4OoABP98W2UcOg>
    <xmx:6jSDaXpNeDcH31VeZ1UUIBNCQZueT0Qu37j5p5h0U-GH451vmKPYrRwN>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Feb 2026 07:00:40 -0500 (EST)
Message-ID: <443dd67d8398b30df2e6eb62ab06fc2433f62273.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v5 00/15] Enable rust support for linux kernel
From: Paul Barker <paul@pbarker.dev>
To: Harish.Sadineni@windriver.com, bruce.ashfield@gmail.com
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com, 
 alistair.francis@wdc.com, yoann.congal@smile.fr, elmehdi.younes@smile.fr, 
 richard.purdie@linuxfoundation.org,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Date: Wed, 04 Feb 2026 12:00:35 +0000
In-Reply-To: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-6N0wn8zkE3COkPiVUYNV"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 12:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230511


--=-6N0wn8zkE3COkPiVUYNV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-01-29 at 08:38 -0800, Sadineni, Harish via
lists.openembedded.org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> v5:
> - Regression in autobuilder with v4 series is due to applying v4 series t=
ogether with following patch=20
>   "llvm: enable LLVMgold.so build by adding binutils dependency"(https://=
lists.openembedded.org/g/openembedded-core/message/229387)
>   is fixed by droping Alistair Francis's patch(https://lists.openembedded=
.org/g/openembedded-core/message/229091).
> - Updated patch "rust: install Rust library sources for 'make rustavailab=
le' support" to install=20
>   rust standard library sources for rust-native.=20
>=20
> v4:
> - Resolved patchtest failures.
>=20
> v3:
> - Removed the DISTRO_FEATURES dependency for installing Rust library sour=
ces in the Rust recipe,
> - Extended support for on target rust kernel module developmet by install=
ing Rust library sources and
>   introduced packaging of the Rust standard library sources in a dedicate=
d ${PN}-src-lib package.
> - Integrated Alistair Francis's patch(https://lists.openembedded.org/g/op=
enembedded-core/message/229091)
>   that uses the Rust bootstrap tool to install Rust library sources for r=
ust-native.
> - Dropped the patch that added rust-kernel to native/nativesdk feature fi=
lters in bitbake.conf.
> - Updated flags in the make-mod-scripts recipe to fix build failures when=
 building Rust out-of-tree
>   module recipes.
> - Dropped the bindgen-cli patch extending BBCLASSEXTEND to include
>   nativesdk, as it has been merged into oe-core.
>=20
> v2:
> - Combined [PATCH 05/16][0] & [PATCH 06/16][1] from v1.
> - Updated commit message and added in code comments for patch "[PATCH 09/=
15] kernel-devsrc: copying
>   rust-kernel source to $kerneldir/build"
>=20
> [0] https://lists.openembedded.org/g/openembedded-core/message/228559
> [1] https://lists.openembedded.org/g/openembedded-core/message/228560
>=20
> v1:
> The previous series was RFC v4, "Enable Rust support for Linux kernel"
> (https://lists.openembedded.org/g/openembedded-core/message/226623).
>=20
> In addition, Yoann Congal posted RFC v2, "Kernel Rust out-of-tree module =
support"
> (https://lists.openembedded.org/g/openembedded-core/message/227281), whic=
h builds on top of RFC v4.
>=20
> The current patch series is a unified version that combines both efforts.
> Compared to the earlier series, the main changes are:
>=20
> -Kernel configuration fragments have been moved to yocto-kernel-cache.
> -The kernel fragments have been removed from SRC_URI and from the files
>  directory previously stored underrecipes-kernel/linux/files.
> -Updated the "[PATCH 11/16] selftest/cases/runtime_test: Add test for Lin=
ux Rust sample"
>  by appending KERNEL_EXTRA_FEATURES:append =3D 'features/kernel-sample/ke=
rnel-rust-sample.scc'
>  instead of adding this directly in the linux-yocto recipe.
>=20
>=20
> This patch series introduces Rust support into the linux-yocto kernel rec=
ipe and
> related build infrastructure in the Yocto Project. The goal is to enable =
building
> the Linux kernel with Rust components and provide support for building ke=
rnel module
> which is written in rust and also provide support to build rust kernel mo=
dules in sdk.
>=20
> And this series adds test for Linux Rust sample and also added support
> for out-of-tree kernel module written in Rust as well as associated test.
>=20
> Summary of patches:
>=20
> - Patch 01: Add required dependencies ('clang-native', 'rust-native','bin=
dgen-cli-native') to the kernel to support Rust binding generation.
> - Patch 02: Install the Rust standard library source ('library/') for  na=
tive,target and sdk.
> - Patch 03: Updated `kernel-yocto.bbclass` to invoke `make rustavailable`=
 during 'do_kernel_configme', ensuring Rust readiness.
> - Patch 04: Add kernel configuration support for Rust (via 'kernel-rust.s=
cc'), enabling the Rust build options in kernel config.
> - Patch 05: Fixed buildpaths errors when rust is enabled for kernel by ap=
pending --remap-path-prefix to RUST_DEBUG_REMAP
> - Patch 06: split `HOSTCC` flag to align with to linux-yocto and fix buil=
d issue with make-mod-scripts recipe.
> - Patch 07: Disabling ccache when rust-kernel is enabled for linux-yocto.
> - Patch 08: Copy Rust kernel sources into kernel-devsrc build directory w=
hich will be required while running 'make prepare' in sdk.
> - Patch 09: Added oe-selftest case for the Linux Rust sample.
> - patch 10: Copying include/config/auto.conf in STAGING_KERNEL_BUILDDIR
> - patch 11: Export artifacts needed for out-of-tree Rust compilation
> - patch 12: Prepare out-of-tree rust module compilation
> - patch 13: Added rust-out-of-tree-module recipe in meta-skeleton layer
> - Patch 14: Fixed buildpaths errors for rust-out-of-tree-module recipe by=
 appending --remap-path-prefix to RUST_DEBUG_REMAP
> - patch 15: Added rust-out-of-tree selftest
>=20
> Patches have been build-tested successfully on:
> - qemuarm64
> - qemux86-64
>=20
> Benchmark test-result for x86-64:
> +-------------------------------+------------+-----------+-----------+---=
--------+
> > DISTRO_FEATURES               |   real     |   user    |    sys    |  F=
S usage |
> +-------------------------------+------------+-----------+-----------+---=
--------+
> > rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  |   =
58 GB   |
> > rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  |   =
33 GB   |
> +-------------------------------+------------+-----------+-----------+---=
--------+

We discussed these patches on Monday and have some feedback on the
design. Things are nearly correct, we do want to ensure that the user
experience is good before merging this though as people will quickly
start to depend on it.

We think it would be better if Rust support was controlled by
KERNEL_FEATURES instead of DISTRO_FEATURES. This option now only impacts
the kernel and any kernel module recipes. It also may need to change
depending on MACHINE which makes it not a good fit for DISTRO_FEATURES -
e.g. one BSP may use an older LTS kernel with no required Rust code and
a different BSP may use a newer kernel and need a driver written in Rust
for the board to function.

We should add a new module-rust.bbclass instead of extending
module.bbclass with conditional logic. This can be included by any
modules which use Rust and handle any common setup. It can also check
for the presence of required files (scripts/target.json & rust/*) in the
kernel's shared workdir, and perhaps the kernel config so that we can
give a sensible error message if they are missing. This means that
module-rust.bbclass doesn't need to check KERNEL_FEATURES for
rust-kernel, it can just look at the shared workdir (probably in
do_configure) to make sure that we're ready to build a Rust module.

If we can't use KERNEL_FEATURES, then perhaps a new KERNEL_RUST_SUPPORT
variable would work. In either case, this should only be checked in the
kernel recipe itself.

Bruce - what do you think about KERNEL_FEATURES being used in this way?

Best regards,

--=20
Paul Barker


--=-6N0wn8zkE3COkPiVUYNV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaYM04xEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bhnEAP4gQrxtVzoPPi+9fSf1srn6aqS7nbTtgK0x
G/92Nr53oAD+JqHDXwTh4kjoG3X7bi/oEkmz3i1lkDb0ir2BTFFR+gQ=
=nABp
-----END PGP SIGNATURE-----

--=-6N0wn8zkE3COkPiVUYNV--

