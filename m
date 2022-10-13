Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7BCC4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 08:14:11 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.5084.1665648840341262787
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 01:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ska6w9WP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 180BA6000C;
	Thu, 13 Oct 2022 08:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665648838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f03mGTz7siK7+oUavwhoUhhWXlWpaGnHEQTGbY2qZuc=;
	b=Ska6w9WPvjDRWdY/rR4++EwTZqpJR5cfNtf9izF75988wlA5x4LohMpiDs+iIELaMAqdmn
	eycHSKAXAzJ5XuSFYC4Bmgav9OvDnvng/HcH7QT4ZMliAQnqphzmDM/aszln1rd1M4Gbv4
	hQm8laqcoqkOYSSFFLfN+tgKhQKN5lrDPybkHGwi/RqS6X8HegzVeoSpx9H230BW99c+uU
	nwyNvEzNOIsp/jlzxIARM5h9vVxmxw7Gx/SqZgGBLGjbz3SA6U2TYKfCBzELq3bzwfNYKW
	CM/GzVpS4NJDDL9MEU/K74EtKazIcAc61JdqA+T4sy/7f9CjbVy6q6cgBDx2Ww==
Date: Thu, 13 Oct 2022 10:13:57 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core][PATCH] rust: update 1.63.0 -> 1.64.0
Message-ID: <Y0fIxWwQGhsEpgs/@mail.local>
References: <20221012071714.751-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221012071714.751-1-alex.kiernan@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 08:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171688

Hello,

On 12/10/2022 08:17:14+0100, Alex Kiernan wrote:
> Release notes:
>   https://blog.rust-lang.org/2022/09/22/Rust-1.64.0.html
> 

This causes the following failure:
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/5901/steps/12/logs/stdio

ERROR: rust-1.64.0-r0 do_patch: Applying patch 'crossbeam_atomic.patch' on target directory '/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/rust/1.64.0-r0/rustc-1.64.0-src'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/rust/1.64.0-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch crossbeam_atomic.patch
patching file vendor/crossbeam-utils/build.rs
patching file vendor/crossbeam-utils/.cargo-checksum.json
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file vendor/crossbeam-utils/.cargo-checksum.json
Patch crossbeam_atomic.patch does not apply (enforce with -f)

> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc   |  2 +-
>  .../{cargo_1.63.0.bb => cargo_1.64.0.bb}      |  0
>  ...ibstd-rs_1.63.0.bb => libstd-rs_1.64.0.bb} |  0
>  ....63.0.bb => rust-cross-canadian_1.64.0.bb} |  0
>  ...ust-llvm_1.63.0.bb => rust-llvm_1.64.0.bb} |  0
>  meta/recipes-devtools/rust/rust-snapshot.inc  | 22 +++++++++----------
>  meta/recipes-devtools/rust/rust-source.inc    |  2 +-
>  .../rust/{rust_1.63.0.bb => rust_1.64.0.bb}   |  0
>  8 files changed, 13 insertions(+), 13 deletions(-)
>  rename meta/recipes-devtools/cargo/{cargo_1.63.0.bb => cargo_1.64.0.bb} (100%)
>  rename meta/recipes-devtools/rust/{libstd-rs_1.63.0.bb => libstd-rs_1.64.0.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.63.0.bb => rust-cross-canadian_1.64.0.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust-llvm_1.63.0.bb => rust-llvm_1.64.0.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust_1.63.0.bb => rust_1.64.0.bb} (100%)
> 
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 59b226e62fcd..6bba92ac9696 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -27,7 +27,7 @@ GOVERSION ?= "1.19%"
>  # This can not use wildcards like 8.0.% since it is also used in mesa to denote
>  # llvm version being used, so always bump it with llvm recipe version bump
>  LLVMVERSION ?= "14.0.6"
> -RUSTVERSION ?= "1.63%"
> +RUSTVERSION ?= "1.64%"
>  
>  PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
>  PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
> diff --git a/meta/recipes-devtools/cargo/cargo_1.63.0.bb b/meta/recipes-devtools/cargo/cargo_1.64.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/cargo/cargo_1.63.0.bb
> rename to meta/recipes-devtools/cargo/cargo_1.64.0.bb
> diff --git a/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.64.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/libstd-rs_1.63.0.bb
> rename to meta/recipes-devtools/rust/libstd-rs_1.64.0.bb
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.63.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.64.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust-cross-canadian_1.63.0.bb
> rename to meta/recipes-devtools/rust/rust-cross-canadian_1.64.0.bb
> diff --git a/meta/recipes-devtools/rust/rust-llvm_1.63.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.64.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust-llvm_1.63.0.bb
> rename to meta/recipes-devtools/rust/rust-llvm_1.64.0.bb
> diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
> index b9d7edd6720f..e790705aba0c 100644
> --- a/meta/recipes-devtools/rust/rust-snapshot.inc
> +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
> @@ -5,21 +5,21 @@
>  ## The version is replicated here.
>  ## TODO: find a way to add additional SRC_URIs based on the contents of an
>  ##       earlier SRC_URI.
> -RS_VERSION = "1.62.0"
> -CARGO_VERSION = "1.62.0"
> +RS_VERSION = "1.63.0"
> +CARGO_VERSION = "1.63.0"
>  
>  # TODO: Add hashes for other architecture toolchains as well. Make a script?
> -SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "addfae87b6b1b521d98a50fdc5120990888a51bb397100062e9c558267c67c77"
> -SRC_URI[rustc-snapshot-x86_64.sha256sum] = "e7f71f4ef09334ddc9ec8cbf2f958d654e36f580c95f8fec6d5c816ce256dbd6"
> -SRC_URI[cargo-snapshot-x86_64.sha256sum] = "815c63119a9cf0282ff240c6444b6f867238763ee3dea182f10837ae7dbbb1d4"
> +SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "993c2c17bf76ac626bfb5b17bddce65fbdfc14f70d183f33773de0cd12df46d2"
> +SRC_URI[rustc-snapshot-x86_64.sha256sum] = "bdab9d9afa5c329c40f9ba568364815237fab8426477c12bfabad35ffc484ab5"
> +SRC_URI[cargo-snapshot-x86_64.sha256sum] = "f370d12e4c11f0c835becb738bcf00d363f29b76f8b424b4dcb005abcf15fc9a"
>  
> -SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "dd5df8a92af3e5d49a1122b9561821ebd72a9317884a37ecddae041e652a7563"
> -SRC_URI[rustc-snapshot-aarch64.sha256sum] = "0fa320a19d41dcfc592bc006f5e9eda8e3b972598a26c96ad64eedd868516df3"
> -SRC_URI[cargo-snapshot-aarch64.sha256sum] = "475038ecacca9ff586cad2082d5d950544b0d581a2a287facc7d899aae488813"
> +SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "f1d93b3d48258f701687c63ef9b226c07329fb92c2c5559283258687f958e9d0"
> +SRC_URI[rustc-snapshot-aarch64.sha256sum] = "d78799bb8f4177877f97b9051c9cba1fd85173f2e9cecab9486388fc6fa66259"
> +SRC_URI[cargo-snapshot-aarch64.sha256sum] = "4313ab44dccba4faed20db4aacc16def405773d1676e79d3e65ced4b99d710d4"
>  
> -SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "d6678b7c971f3adbe7f820adae669d03a314468441e2907747c76eca98e0be92"
> -SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "b66d0bc6dbfdc0d4b826f787ec4e772dea8e3d2015cecbe2105632d468c28dcb"
> -SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "016257f1641693008068bd086fec66d68550d1778f6aea9d06c9b263fca392d5"
> +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "3ae0b74ba428c569fcecebbb09060ad0bd434a5f1fc9ffd1329b56941a897b6e"
> +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "b3dc2c082e76b5effe0b158aac3831830168a1a6980b39347c355e49be63fcca"
> +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "a4cdc00a42fd767bf5a296f7126d9db22a0a609cd956bbf0cb3eae882add1be7"
>  
>  SRC_URI += " \
>      https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
> index ce6c983fc0b5..67f130d0ef4e 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -1,5 +1,5 @@
>  SRC_URI += "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=rust"
> -SRC_URI[rust.sha256sum] = "8f44af6dc44cc4146634a4dd5e4cc5470b3052a2337019b870c0e025e8987e0c"
> +SRC_URI[rust.sha256sum] = "e8170d318fac9d2fc17d5c3e648e7068f56e8db8d233d864aeffbef7c6542eac"
>  
>  SRC_URI:append:class-target:pn-rust = " \
>      file://hardcodepaths.patch \
> diff --git a/meta/recipes-devtools/rust/rust_1.63.0.bb b/meta/recipes-devtools/rust/rust_1.64.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust_1.63.0.bb
> rename to meta/recipes-devtools/rust/rust_1.64.0.bb
> -- 
> 2.35.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171648): https://lists.openembedded.org/g/openembedded-core/message/171648
> Mute This Topic: https://lists.openembedded.org/mt/94276338/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

