Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5E6C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 09:15:10 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.20792.1680167700102302332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 02:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nVF92PXL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A8793FF802;
	Thu, 30 Mar 2023 09:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680167698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TENdsh3DXeCED5IjvtRNVrcgp0bEZUohB+syEChbuPU=;
	b=nVF92PXLRed8v1brrhB5G4nFrHEkwVpaQ3UBKWsOeM0omrGmciEP1i4za6f64kXM50G4Am
	kWXLkxqGSItLNfAVbOS+ZHE8p5Jt4ypBiqzD1yL7vbqAy7kO3uPL5D1fJvftXfZbjBiW6Y
	KNWGSuFtrkmI/KYENZabZnQPji3n0Gko2raDv3E3lZFGQwv/a/3dp1kXAa1QhwmKIByqm9
	2b69YyZkk/fUZJYstl7Si2Bop88ZPeDULxg6r685IdRUWJXdLBsrUew0jZkilyV12VAFV8
	f1ptmctyokEpG2xbLDaUL5M1Tr1cdy/GUfgyRA3YsZPGKj0A7Al46M2TUdBEmA==
Date: Thu, 30 Mar 2023 11:14:57 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org, alex.kiernan@gmail.com
Subject: Re: [OE-core] [PATCH V4 5/5] meta-selftest: provide a recipe for
 zvariant
Message-ID: <2023033009145701b67168@mail.local>
References: <cover.1680103647.git.frederic.martinsons@gmail.com>
 <8d69fe1e3f390a7e8fa568abdc20e5d0ee634fc1.1680103647.git.frederic.martinsons@gmail.com>
 <20230330090324705e693e@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330090324705e693e@mail.local>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 09:15:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179310

On 30/03/2023 11:03:25+0200, Alexandre Belloni wrote:
> Hello,
> 
> Because I4m carrying your other series, this fails with:
> 
> ERROR: zvariant-3.12.0-r0 do_fetch: No checksum specified for '/srv/autobuilder/autobuilder.yocto.io/current_sources/anes-0.1.6.crate', please add at least one to the recipe:
> SRC_URI[anes.sha256sum] = "4b46cbb362ab8752921c97e041f5e366ee6297bd428a31275b9fcf1e380f7299"
> ERROR: zvariant-3.12.0-r0 do_fetch: Bitbake Fetcher Error: NoChecksumError('Missing SRC_URI checksum', 'https://crates.io/api/v1/crates/anes/0.1.6/download')
> 
> I think I'll fix it locally but we'll need to come up with a plan when
> merging.

Actually, could you handle the list of checksum? It is quite long.

> 
> On 29/03/2023 17:30:34+0200, Frederic Martinsons wrote:
> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> > 
> > This recipe is for showing a "real world" example of
> > a crate that depends on some git repositories.
> > 
> > Usually, this kind of crate is built within a global
> > workspace (here it is the zbus project) and so
> > doesn't need a Cargo.lock on its own.
> > 
> > For the sake of the demonstration, I had to tweak things
> > a little to be able to compile zvariant in standalone
> > (no relative path in dependency, no symlink to LICENSE
> > provide a Cargo.lock)
> > 
> > The use case where the crate had some git repository
> > in dependency is very common for "private" crate that
> > are not aimed to be published on crates.io.
> > When the project grow bigger, it is common to have
> > a bin and multiple lib developped in parallel, and these
> > libs are surely on a git repostitory.
> > 
> > A test case have been also added to check for:
> >   - the previous patch about git subpath parameter and devtool
> >   - the correctness of overriding dependencies (first patch of the
> > series)
> > 
> > Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> > ---
> >  .../zvariant/zvariant-crates.inc              |  140 ++
> >  .../0001-Tweak-zvariant-crate-config.patch    | 1292 +++++++++++++++++
> >  .../zvariant/zvariant_3.12.0.bb               |   26 +
> >  meta/lib/oeqa/selftest/cases/devtool.py       |   93 ++
> >  4 files changed, 1551 insertions(+)
> >  create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant-crates.inc
> >  create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak-zvariant-crate-config.patch
> >  create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb
> > 
> > diff --git a/meta-selftest/recipes-extended/zvariant/zvariant-crates.inc b/meta-selftest/recipes-extended/zvariant/zvariant-crates.inc
> > new file mode 100644
> > index 0000000000..41f50b1b0c
> > --- /dev/null
> > +++ b/meta-selftest/recipes-extended/zvariant/zvariant-crates.inc
> > @@ -0,0 +1,140 @@
> > +SRC_URI += " \
> > +    crate://crates.io/anes/0.1.6 \
> > +    crate://crates.io/anyhow/1.0.70 \
> > +    crate://crates.io/arrayvec/0.7.2 \
> > +    crate://crates.io/atty/0.2.14 \
> > +    crate://crates.io/autocfg/1.1.0 \
> > +    crate://crates.io/bitflags/1.3.2 \
> > +    crate://crates.io/bumpalo/3.12.0 \
> > +    crate://crates.io/byteorder/1.4.3 \
> > +    crate://crates.io/cast/0.3.0 \
> > +    crate://crates.io/cfg-if/1.0.0 \
> > +    crate://crates.io/chrono/0.4.24 \
> > +    crate://crates.io/ciborium-io/0.2.0 \
> > +    crate://crates.io/ciborium-ll/0.2.0 \
> > +    crate://crates.io/ciborium/0.2.0 \
> > +    crate://crates.io/clap/3.2.23 \
> > +    crate://crates.io/clap_lex/0.2.4 \
> > +    crate://crates.io/criterion-plot/0.5.0 \
> > +    crate://crates.io/criterion/0.4.0 \
> > +    crate://crates.io/crossbeam-channel/0.5.7 \
> > +    crate://crates.io/crossbeam-deque/0.8.3 \
> > +    crate://crates.io/crossbeam-epoch/0.9.14 \
> > +    crate://crates.io/crossbeam-utils/0.8.15 \
> > +    crate://crates.io/either/1.8.1 \
> > +    crate://crates.io/enumflags2/0.7.5 \
> > +    crate://crates.io/enumflags2_derive/0.7.4 \
> > +    crate://crates.io/form_urlencoded/1.1.0 \
> > +    crate://crates.io/futures-channel/0.3.27 \
> > +    crate://crates.io/futures-core/0.3.27 \
> > +    crate://crates.io/futures-executor/0.3.27 \
> > +    crate://crates.io/futures-macro/0.3.27 \
> > +    crate://crates.io/futures-task/0.3.27 \
> > +    crate://crates.io/futures-util/0.3.27 \
> > +    crate://crates.io/getrandom/0.2.8 \
> > +    crate://crates.io/half/1.8.2 \
> > +    crate://crates.io/hashbrown/0.12.3 \
> > +    crate://crates.io/heck/0.3.3 \
> > +    crate://crates.io/hermit-abi/0.1.19 \
> > +    crate://crates.io/hermit-abi/0.2.6 \
> > +    crate://crates.io/idna/0.3.0 \
> > +    crate://crates.io/indexmap/1.9.2 \
> > +    crate://crates.io/itertools/0.10.5 \
> > +    crate://crates.io/itertools/0.9.0 \
> > +    crate://crates.io/itoa/1.0.6 \
> > +    crate://crates.io/js-sys/0.3.61 \
> > +    crate://crates.io/lazy_static/1.4.0 \
> > +    crate://crates.io/libc/0.2.140 \
> > +    crate://crates.io/log/0.4.17 \
> > +    crate://crates.io/memchr/2.5.0 \
> > +    crate://crates.io/memoffset/0.8.0 \
> > +    crate://crates.io/num-integer/0.1.45 \
> > +    crate://crates.io/num-traits/0.2.15 \
> > +    crate://crates.io/num_cpus/1.15.0 \
> > +    crate://crates.io/once_cell/1.17.1 \
> > +    crate://crates.io/oorandom/11.1.3 \
> > +    crate://crates.io/os_str_bytes/6.5.0 \
> > +    crate://crates.io/percent-encoding/2.2.0 \
> > +    crate://crates.io/pin-project-lite/0.2.9 \
> > +    crate://crates.io/pin-utils/0.1.0 \
> > +    crate://crates.io/pkg-config/0.3.26 \
> > +    crate://crates.io/plotters-backend/0.3.4 \
> > +    crate://crates.io/plotters-svg/0.3.3 \
> > +    crate://crates.io/plotters/0.3.4 \
> > +    crate://crates.io/ppv-lite86/0.2.17 \
> > +    crate://crates.io/proc-macro-crate/0.1.5 \
> > +    crate://crates.io/proc-macro-crate/1.3.1 \
> > +    crate://crates.io/proc-macro-error-attr/1.0.4 \
> > +    crate://crates.io/proc-macro-error/1.0.4 \
> > +    crate://crates.io/proc-macro2/1.0.53 \
> > +    crate://crates.io/quote/1.0.26 \
> > +    crate://crates.io/rand/0.8.5 \
> > +    crate://crates.io/rand_chacha/0.3.1 \
> > +    crate://crates.io/rand_core/0.6.4 \
> > +    crate://crates.io/rayon-core/1.11.0 \
> > +    crate://crates.io/rayon/1.7.0 \
> > +    crate://crates.io/regex-syntax/0.6.29 \
> > +    crate://crates.io/regex/1.7.2 \
> > +    crate://crates.io/ryu/1.0.13 \
> > +    crate://crates.io/same-file/1.0.6 \
> > +    crate://crates.io/scopeguard/1.1.0 \
> > +    crate://crates.io/serde/1.0.158 \
> > +    crate://crates.io/serde_bytes/0.11.9 \
> > +    crate://crates.io/serde_derive/1.0.158 \
> > +    crate://crates.io/serde_json/1.0.94 \
> > +    crate://crates.io/serde_repr/0.1.12 \
> > +    crate://crates.io/slab/0.4.8 \
> > +    crate://crates.io/static_assertions/1.1.0 \
> > +    crate://crates.io/strum/0.18.0 \
> > +    crate://crates.io/strum_macros/0.18.0 \
> > +    crate://crates.io/syn/1.0.109 \
> > +    crate://crates.io/syn/2.0.8 \
> > +    crate://crates.io/system-deps/1.3.2 \
> > +    crate://crates.io/textwrap/0.16.0 \
> > +    crate://crates.io/thiserror-impl/1.0.40 \
> > +    crate://crates.io/thiserror/1.0.40 \
> > +    crate://crates.io/time-core/0.1.0 \
> > +    crate://crates.io/time-macros/0.2.8 \
> > +    crate://crates.io/time/0.3.20 \
> > +    crate://crates.io/tinytemplate/1.2.1 \
> > +    crate://crates.io/tinyvec/1.6.0 \
> > +    crate://crates.io/tinyvec_macros/0.1.1 \
> > +    crate://crates.io/toml/0.5.11 \
> > +    crate://crates.io/toml_datetime/0.6.1 \
> > +    crate://crates.io/toml_edit/0.19.8 \
> > +    crate://crates.io/unicode-bidi/0.3.13 \
> > +    crate://crates.io/unicode-ident/1.0.8 \
> > +    crate://crates.io/unicode-normalization/0.1.22 \
> > +    crate://crates.io/unicode-segmentation/1.10.1 \
> > +    crate://crates.io/url/2.3.1 \
> > +    crate://crates.io/uuid/1.3.0 \
> > +    crate://crates.io/version-compare/0.0.10 \
> > +    crate://crates.io/version_check/0.9.4 \
> > +    crate://crates.io/walkdir/2.3.3 \
> > +    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
> > +    crate://crates.io/wasm-bindgen-backend/0.2.84 \
> > +    crate://crates.io/wasm-bindgen-macro-support/0.2.84 \
> > +    crate://crates.io/wasm-bindgen-macro/0.2.84 \
> > +    crate://crates.io/wasm-bindgen-shared/0.2.84 \
> > +    crate://crates.io/wasm-bindgen/0.2.84 \
> > +    crate://crates.io/web-sys/0.3.61 \
> > +    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> > +    crate://crates.io/winapi-util/0.1.5 \
> > +    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> > +    crate://crates.io/winapi/0.3.9 \
> > +    crate://crates.io/winnow/0.4.0 \
> > +    crate://crates.io/zvariant_derive/3.12.0 \
> > +    crate://crates.io/zvariant_utils/1.0.0 \
> > +    git://github.com/gtk-rs/glib;protocol=https;nobranch=1;name=glib;destsuffix=glib;type=git-dependency \
> > +    git://github.com/gtk-rs/sys;protocol=https;nobranch=1;name=glib-sys;destsuffix=glib-sys;subpath=glib-sys;type=git-dependency \
> > +    git://github.com/gtk-rs/sys;protocol=https;nobranch=1;name=gobject-sys;destsuffix=gobject-sys;subpath=gobject-sys;type=git-dependency \
> > +"
> > +
> > +SRCREV_FORMAT .= "_glib"
> > +SRCREV_glib = "c9ee583cea07830c099cdcccd33eda9ef705ea93"
> > +
> > +SRCREV_FORMAT .= "_glib-sys"
> > +SRCREV_glib-sys = "5f35e26c65d24f8f018f643218de0f5807ba5f01"
> > +
> > +SRCREV_FORMAT .= "_gobject-sys"
> > +SRCREV_gobject-sys = "5f35e26c65d24f8f018f643218de0f5807ba5f01"
> > diff --git a/meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak-zvariant-crate-config.patch b/meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak-zvariant-crate-config.patch
> > new file mode 100644
> > index 0000000000..ac6c5117bb
> > --- /dev/null
> > +++ b/meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak-zvariant-crate-config.patch
> > @@ -0,0 +1,1292 @@
> > +From e85ce4136694899f0010d48f47c5e905c3a9d461 Mon Sep 17 00:00:00 2001
> > +From: Frederic Martinsons <frederic.martinsons@gmail.com>
> > +Date: Thu, 23 Mar 2023 07:12:37 +0100
> > +Subject: [PATCH] Tweak zvariant crate config
> > +
> > +This library crate is a part of zbus project, and is aimed to
> > +be published amongst the whole project.
> > +
> > +Nevertheless, this recipe is for showing example of real
> > +code which uses a local registry via git url inside yocto
> > +environment.
> > +
> > +I didn't find a real example of binary crate that uses git
> > +dependency but it seems to me a very common use case
> > +when we are working on multiple local crates that are not
> > +aimed to be published on public registry.
> > +
> > +Long story short, this patch add a modified Cargo.toml
> > +to use the zvariant_derive dependency from crates.io instead
> > +of zbus local one and a pre generated Cargo.lock in order
> > +to make cargo patch process inside cargo_common.bbclass work
> > +
> > +It also copied the LICENCE file from zbus project instead
> > +of symlink to it.
> > +
> > +Upstream-Status: Inappropriate
> > +Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> > +---
> > + zvariant/Cargo.lock | 1198 +++++++++++++++++++++++++++++++++++++++++++
> > + zvariant/Cargo.toml |    2 +-
> > + zvariant/LICENSE    |   24 +-
> > + 3 files changed, 1222 insertions(+), 2 deletions(-)
> > + create mode 100644 zvariant/Cargo.lock
> > + mode change 120000 => 100644 zvariant/LICENSE
> > +
> > +diff --git a/zvariant/Cargo.lock b/zvariant/Cargo.lock
> > +new file mode 100644
> > +index 00000000..02a83d42
> > +--- /dev/null
> > ++++ b/zvariant/Cargo.lock
> > +@@ -0,0 +1,1198 @@
> > ++# This file is automatically @generated by Cargo.
> > ++# It is not intended for manual editing.
> > ++version = 3
> > ++
> > ++[[package]]
> > ++name = "anes"
> > ++version = "0.1.6"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "4b46cbb362ab8752921c97e041f5e366ee6297bd428a31275b9fcf1e380f7299"
> > ++
> > ++[[package]]
> > ++name = "anyhow"
> > ++version = "1.0.70"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "7de8ce5e0f9f8d88245311066a578d72b7af3e7088f32783804676302df237e4"
> > ++
> > ++[[package]]
> > ++name = "arrayvec"
> > ++version = "0.7.2"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "8da52d66c7071e2e3fa2a1e5c6d088fec47b593032b254f5e980de8ea54454d6"
> > ++dependencies = [
> > ++ "serde",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "atty"
> > ++version = "0.2.14"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8"
> > ++dependencies = [
> > ++ "hermit-abi 0.1.19",
> > ++ "libc",
> > ++ "winapi",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "autocfg"
> > ++version = "1.1.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
> > ++
> > ++[[package]]
> > ++name = "bitflags"
> > ++version = "1.3.2"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
> > ++
> > ++[[package]]
> > ++name = "bumpalo"
> > ++version = "3.12.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "0d261e256854913907f67ed06efbc3338dfe6179796deefc1ff763fc1aee5535"
> > ++
> > ++[[package]]
> > ++name = "byteorder"
> > ++version = "1.4.3"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610"
> > ++
> > ++[[package]]
> > ++name = "cast"
> > ++version = "0.3.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "37b2a672a2cb129a2e41c10b1224bb368f9f37a2b16b612598138befd7b37eb5"
> > ++
> > ++[[package]]
> > ++name = "cfg-if"
> > ++version = "1.0.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
> > ++
> > ++[[package]]
> > ++name = "chrono"
> > ++version = "0.4.24"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "4e3c5919066adf22df73762e50cffcde3a758f2a848b113b586d1f86728b673b"
> > ++dependencies = [
> > ++ "num-integer",
> > ++ "num-traits",
> > ++ "serde",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "ciborium"
> > ++version = "0.2.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "b0c137568cc60b904a7724001b35ce2630fd00d5d84805fbb608ab89509d788f"
> > ++dependencies = [
> > ++ "ciborium-io",
> > ++ "ciborium-ll",
> > ++ "serde",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "ciborium-io"
> > ++version = "0.2.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "346de753af073cc87b52b2083a506b38ac176a44cfb05497b622e27be899b369"
> > ++
> > ++[[package]]
> > ++name = "ciborium-ll"
> > ++version = "0.2.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "213030a2b5a4e0c0892b6652260cf6ccac84827b83a85a534e178e3906c4cf1b"
> > ++dependencies = [
> > ++ "ciborium-io",
> > ++ "half",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "clap"
> > ++version = "3.2.23"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "71655c45cb9845d3270c9d6df84ebe72b4dad3c2ba3f7023ad47c144e4e473a5"
> > ++dependencies = [
> > ++ "bitflags",
> > ++ "clap_lex",
> > ++ "indexmap",
> > ++ "textwrap",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "clap_lex"
> > ++version = "0.2.4"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "2850f2f5a82cbf437dd5af4d49848fbdfc27c157c3d010345776f952765261c5"
> > ++dependencies = [
> > ++ "os_str_bytes",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "criterion"
> > ++version = "0.4.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "e7c76e09c1aae2bc52b3d2f29e13c6572553b30c4aa1b8a49fd70de6412654cb"
> > ++dependencies = [
> > ++ "anes",
> > ++ "atty",
> > ++ "cast",
> > ++ "ciborium",
> > ++ "clap",
> > ++ "criterion-plot",
> > ++ "itertools 0.10.5",
> > ++ "lazy_static",
> > ++ "num-traits",
> > ++ "oorandom",
> > ++ "plotters",
> > ++ "rayon",
> > ++ "regex",
> > ++ "serde",
> > ++ "serde_derive",
> > ++ "serde_json",
> > ++ "tinytemplate",
> > ++ "walkdir",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "criterion-plot"
> > ++version = "0.5.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "6b50826342786a51a89e2da3a28f1c32b06e387201bc2d19791f622c673706b1"
> > ++dependencies = [
> > ++ "cast",
> > ++ "itertools 0.10.5",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "crossbeam-channel"
> > ++version = "0.5.7"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "cf2b3e8478797446514c91ef04bafcb59faba183e621ad488df88983cc14128c"
> > ++dependencies = [
> > ++ "cfg-if",
> > ++ "crossbeam-utils",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "crossbeam-deque"
> > ++version = "0.8.3"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "ce6fd6f855243022dcecf8702fef0c297d4338e226845fe067f6341ad9fa0cef"
> > ++dependencies = [
> > ++ "cfg-if",
> > ++ "crossbeam-epoch",
> > ++ "crossbeam-utils",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "crossbeam-epoch"
> > ++version = "0.9.14"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "46bd5f3f85273295a9d14aedfb86f6aadbff6d8f5295c4a9edb08e819dcf5695"
> > ++dependencies = [
> > ++ "autocfg",
> > ++ "cfg-if",
> > ++ "crossbeam-utils",
> > ++ "memoffset",
> > ++ "scopeguard",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "crossbeam-utils"
> > ++version = "0.8.15"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "3c063cd8cc95f5c377ed0d4b49a4b21f632396ff690e8470c29b3359b346984b"
> > ++dependencies = [
> > ++ "cfg-if",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "either"
> > ++version = "1.8.1"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "7fcaabb2fef8c910e7f4c7ce9f67a1283a1715879a7c230ca9d6d1ae31f16d91"
> > ++
> > ++[[package]]
> > ++name = "enumflags2"
> > ++version = "0.7.5"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "e75d4cd21b95383444831539909fbb14b9dc3fdceb2a6f5d36577329a1f55ccb"
> > ++dependencies = [
> > ++ "enumflags2_derive",
> > ++ "serde",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "enumflags2_derive"
> > ++version = "0.7.4"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "f58dc3c5e468259f19f2d46304a6b28f1c3d034442e14b322d2b850e36f6d5ae"
> > ++dependencies = [
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 1.0.109",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "form_urlencoded"
> > ++version = "1.1.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "a9c384f161156f5260c24a097c56119f9be8c798586aecc13afbcbe7b7e26bf8"
> > ++dependencies = [
> > ++ "percent-encoding",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "futures-channel"
> > ++version = "0.3.27"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "164713a5a0dcc3e7b4b1ed7d3b433cabc18025386f9339346e8daf15963cf7ac"
> > ++dependencies = [
> > ++ "futures-core",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "futures-core"
> > ++version = "0.3.27"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "86d7a0c1aa76363dac491de0ee99faf6941128376f1cf96f07db7603b7de69dd"
> > ++
> > ++[[package]]
> > ++name = "futures-executor"
> > ++version = "0.3.27"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "1997dd9df74cdac935c76252744c1ed5794fac083242ea4fe77ef3ed60ba0f83"
> > ++dependencies = [
> > ++ "futures-core",
> > ++ "futures-task",
> > ++ "futures-util",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "futures-macro"
> > ++version = "0.3.27"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "3eb14ed937631bd8b8b8977f2c198443447a8355b6e3ca599f38c975e5a963b6"
> > ++dependencies = [
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 1.0.109",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "futures-task"
> > ++version = "0.3.27"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "fd65540d33b37b16542a0438c12e6aeead10d4ac5d05bd3f805b8f35ab592879"
> > ++
> > ++[[package]]
> > ++name = "futures-util"
> > ++version = "0.3.27"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "3ef6b17e481503ec85211fed8f39d1970f128935ca1f814cd32ac4a6842e84ab"
> > ++dependencies = [
> > ++ "futures-core",
> > ++ "futures-macro",
> > ++ "futures-task",
> > ++ "pin-project-lite",
> > ++ "pin-utils",
> > ++ "slab",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "getrandom"
> > ++version = "0.2.8"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d7277a768d396b31"
> > ++dependencies = [
> > ++ "cfg-if",
> > ++ "libc",
> > ++ "wasi",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "glib"
> > ++version = "0.10.0"
> > ++source = "git+https://github.com/gtk-rs/glib?rev=c9ee583cea0#c9ee583cea07830c099cdcccd33eda9ef705ea93"
> > ++dependencies = [
> > ++ "bitflags",
> > ++ "futures-channel",
> > ++ "futures-core",
> > ++ "futures-executor",
> > ++ "futures-task",
> > ++ "futures-util",
> > ++ "glib-macros",
> > ++ "glib-sys",
> > ++ "gobject-sys",
> > ++ "libc",
> > ++ "once_cell",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "glib-macros"
> > ++version = "0.10.0"
> > ++source = "git+https://github.com/gtk-rs/glib?rev=c9ee583cea0#c9ee583cea07830c099cdcccd33eda9ef705ea93"
> > ++dependencies = [
> > ++ "anyhow",
> > ++ "heck",
> > ++ "itertools 0.9.0",
> > ++ "proc-macro-crate 0.1.5",
> > ++ "proc-macro-error",
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 1.0.109",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "glib-sys"
> > ++version = "0.10.0"
> > ++source = "git+https://github.com/gtk-rs/sys#5f35e26c65d24f8f018f643218de0f5807ba5f01"
> > ++dependencies = [
> > ++ "libc",
> > ++ "system-deps",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "gobject-sys"
> > ++version = "0.10.0"
> > ++source = "git+https://github.com/gtk-rs/sys#5f35e26c65d24f8f018f643218de0f5807ba5f01"
> > ++dependencies = [
> > ++ "glib-sys",
> > ++ "libc",
> > ++ "system-deps",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "half"
> > ++version = "1.8.2"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "eabb4a44450da02c90444cf74558da904edde8fb4e9035a9a6a4e15445af0bd7"
> > ++
> > ++[[package]]
> > ++name = "hashbrown"
> > ++version = "0.12.3"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888"
> > ++
> > ++[[package]]
> > ++name = "heck"
> > ++version = "0.3.3"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "6d621efb26863f0e9924c6ac577e8275e5e6b77455db64ffa6c65c904e9e132c"
> > ++dependencies = [
> > ++ "unicode-segmentation",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "hermit-abi"
> > ++version = "0.1.19"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33"
> > ++dependencies = [
> > ++ "libc",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "hermit-abi"
> > ++version = "0.2.6"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "ee512640fe35acbfb4bb779db6f0d80704c2cacfa2e39b601ef3e3f47d1ae4c7"
> > ++dependencies = [
> > ++ "libc",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "idna"
> > ++version = "0.3.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "e14ddfc70884202db2244c223200c204c2bda1bc6e0998d11b5e024d657209e6"
> > ++dependencies = [
> > ++ "unicode-bidi",
> > ++ "unicode-normalization",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "indexmap"
> > ++version = "1.9.2"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "1885e79c1fc4b10f0e172c475f458b7f7b93061064d98c3293e98c5ba0c8b399"
> > ++dependencies = [
> > ++ "autocfg",
> > ++ "hashbrown",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "itertools"
> > ++version = "0.9.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "284f18f85651fe11e8a991b2adb42cb078325c996ed026d994719efcfca1d54b"
> > ++dependencies = [
> > ++ "either",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "itertools"
> > ++version = "0.10.5"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "b0fd2260e829bddf4cb6ea802289de2f86d6a7a690192fbe91b3f46e0f2c8473"
> > ++dependencies = [
> > ++ "either",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "itoa"
> > ++version = "1.0.6"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "453ad9f582a441959e5f0d088b02ce04cfe8d51a8eaf077f12ac6d3e94164ca6"
> > ++
> > ++[[package]]
> > ++name = "js-sys"
> > ++version = "0.3.61"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "445dde2150c55e483f3d8416706b97ec8e8237c307e5b7b4b8dd15e6af2a0730"
> > ++dependencies = [
> > ++ "wasm-bindgen",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "lazy_static"
> > ++version = "1.4.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
> > ++
> > ++[[package]]
> > ++name = "libc"
> > ++version = "0.2.140"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "99227334921fae1a979cf0bfdfcc6b3e5ce376ef57e16fb6fb3ea2ed6095f80c"
> > ++
> > ++[[package]]
> > ++name = "log"
> > ++version = "0.4.17"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e"
> > ++dependencies = [
> > ++ "cfg-if",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "memchr"
> > ++version = "2.5.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d"
> > ++
> > ++[[package]]
> > ++name = "memoffset"
> > ++version = "0.8.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "d61c719bcfbcf5d62b3a09efa6088de8c54bc0bfcd3ea7ae39fcc186108b8de1"
> > ++dependencies = [
> > ++ "autocfg",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "num-integer"
> > ++version = "0.1.45"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9"
> > ++dependencies = [
> > ++ "autocfg",
> > ++ "num-traits",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "num-traits"
> > ++version = "0.2.15"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e7e0372b38c6cdcd"
> > ++dependencies = [
> > ++ "autocfg",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "num_cpus"
> > ++version = "1.15.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "0fac9e2da13b5eb447a6ce3d392f23a29d8694bff781bf03a16cd9ac8697593b"
> > ++dependencies = [
> > ++ "hermit-abi 0.2.6",
> > ++ "libc",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "once_cell"
> > ++version = "1.17.1"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "b7e5500299e16ebb147ae15a00a942af264cf3688f47923b8fc2cd5858f23ad3"
> > ++
> > ++[[package]]
> > ++name = "oorandom"
> > ++version = "11.1.3"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "0ab1bc2a289d34bd04a330323ac98a1b4bc82c9d9fcb1e66b63caa84da26b575"
> > ++
> > ++[[package]]
> > ++name = "os_str_bytes"
> > ++version = "6.5.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "ceedf44fb00f2d1984b0bc98102627ce622e083e49a5bacdb3e514fa4238e267"
> > ++
> > ++[[package]]
> > ++name = "percent-encoding"
> > ++version = "2.2.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "478c572c3d73181ff3c2539045f6eb99e5491218eae919370993b890cdbdd98e"
> > ++
> > ++[[package]]
> > ++name = "pin-project-lite"
> > ++version = "0.2.9"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "e0a7ae3ac2f1173085d398531c705756c94a4c56843785df85a60c1a0afac116"
> > ++
> > ++[[package]]
> > ++name = "pin-utils"
> > ++version = "0.1.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
> > ++
> > ++[[package]]
> > ++name = "pkg-config"
> > ++version = "0.3.26"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "6ac9a59f73473f1b8d852421e59e64809f025994837ef743615c6d0c5b305160"
> > ++
> > ++[[package]]
> > ++name = "plotters"
> > ++version = "0.3.4"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "2538b639e642295546c50fcd545198c9d64ee2a38620a628724a3b266d5fbf97"
> > ++dependencies = [
> > ++ "num-traits",
> > ++ "plotters-backend",
> > ++ "plotters-svg",
> > ++ "wasm-bindgen",
> > ++ "web-sys",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "plotters-backend"
> > ++version = "0.3.4"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "193228616381fecdc1224c62e96946dfbc73ff4384fba576e052ff8c1bea8142"
> > ++
> > ++[[package]]
> > ++name = "plotters-svg"
> > ++version = "0.3.3"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "f9a81d2759aae1dae668f783c308bc5c8ebd191ff4184aaa1b37f65a6ae5a56f"
> > ++dependencies = [
> > ++ "plotters-backend",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "ppv-lite86"
> > ++version = "0.2.17"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
> > ++
> > ++[[package]]
> > ++name = "proc-macro-crate"
> > ++version = "0.1.5"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "1d6ea3c4595b96363c13943497db34af4460fb474a95c43f4446ad341b8c9785"
> > ++dependencies = [
> > ++ "toml",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "proc-macro-crate"
> > ++version = "1.3.1"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "7f4c021e1093a56626774e81216a4ce732a735e5bad4868a03f3ed65ca0c3919"
> > ++dependencies = [
> > ++ "once_cell",
> > ++ "toml_edit",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "proc-macro-error"
> > ++version = "1.0.4"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
> > ++dependencies = [
> > ++ "proc-macro-error-attr",
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 1.0.109",
> > ++ "version_check",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "proc-macro-error-attr"
> > ++version = "1.0.4"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
> > ++dependencies = [
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "version_check",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "proc-macro2"
> > ++version = "1.0.53"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "ba466839c78239c09faf015484e5cc04860f88242cff4d03eb038f04b4699b73"
> > ++dependencies = [
> > ++ "unicode-ident",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "quote"
> > ++version = "1.0.26"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "4424af4bf778aae2051a77b60283332f386554255d722233d09fbfc7e30da2fc"
> > ++dependencies = [
> > ++ "proc-macro2",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "rand"
> > ++version = "0.8.5"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
> > ++dependencies = [
> > ++ "libc",
> > ++ "rand_chacha",
> > ++ "rand_core",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "rand_chacha"
> > ++version = "0.3.1"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
> > ++dependencies = [
> > ++ "ppv-lite86",
> > ++ "rand_core",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "rand_core"
> > ++version = "0.6.4"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
> > ++dependencies = [
> > ++ "getrandom",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "rayon"
> > ++version = "1.7.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "1d2df5196e37bcc87abebc0053e20787d73847bb33134a69841207dd0a47f03b"
> > ++dependencies = [
> > ++ "either",
> > ++ "rayon-core",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "rayon-core"
> > ++version = "1.11.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "4b8f95bd6966f5c87776639160a66bd8ab9895d9d4ab01ddba9fc60661aebe8d"
> > ++dependencies = [
> > ++ "crossbeam-channel",
> > ++ "crossbeam-deque",
> > ++ "crossbeam-utils",
> > ++ "num_cpus",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "regex"
> > ++version = "1.7.2"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "cce168fea28d3e05f158bda4576cf0c844d5045bc2cc3620fa0292ed5bb5814c"
> > ++dependencies = [
> > ++ "regex-syntax",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "regex-syntax"
> > ++version = "0.6.29"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1"
> > ++
> > ++[[package]]
> > ++name = "ryu"
> > ++version = "1.0.13"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "f91339c0467de62360649f8d3e185ca8de4224ff281f66000de5eb2a77a79041"
> > ++
> > ++[[package]]
> > ++name = "same-file"
> > ++version = "1.0.6"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
> > ++dependencies = [
> > ++ "winapi-util",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "scopeguard"
> > ++version = "1.1.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
> > ++
> > ++[[package]]
> > ++name = "serde"
> > ++version = "1.0.158"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "771d4d9c4163ee138805e12c710dd365e4f44be8be0503cb1bb9eb989425d9c9"
> > ++dependencies = [
> > ++ "serde_derive",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "serde_bytes"
> > ++version = "0.11.9"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "416bda436f9aab92e02c8e10d49a15ddd339cea90b6e340fe51ed97abb548294"
> > ++dependencies = [
> > ++ "serde",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "serde_derive"
> > ++version = "1.0.158"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "e801c1712f48475582b7696ac71e0ca34ebb30e09338425384269d9717c62cad"
> > ++dependencies = [
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 2.0.8",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "serde_json"
> > ++version = "1.0.94"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "1c533a59c9d8a93a09c6ab31f0fd5e5f4dd1b8fc9434804029839884765d04ea"
> > ++dependencies = [
> > ++ "itoa",
> > ++ "ryu",
> > ++ "serde",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "serde_repr"
> > ++version = "0.1.12"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "bcec881020c684085e55a25f7fd888954d56609ef363479dc5a1305eb0d40cab"
> > ++dependencies = [
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 2.0.8",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "slab"
> > ++version = "0.4.8"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "6528351c9bc8ab22353f9d776db39a20288e8d6c37ef8cfe3317cf875eecfc2d"
> > ++dependencies = [
> > ++ "autocfg",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "static_assertions"
> > ++version = "1.1.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
> > ++
> > ++[[package]]
> > ++name = "strum"
> > ++version = "0.18.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "57bd81eb48f4c437cadc685403cad539345bf703d78e63707418431cecd4522b"
> > ++
> > ++[[package]]
> > ++name = "strum_macros"
> > ++version = "0.18.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "87c85aa3f8ea653bfd3ddf25f7ee357ee4d204731f6aa9ad04002306f6e2774c"
> > ++dependencies = [
> > ++ "heck",
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 1.0.109",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "syn"
> > ++version = "1.0.109"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
> > ++dependencies = [
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "unicode-ident",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "syn"
> > ++version = "2.0.8"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "bcc02725fd69ab9f26eab07fad303e2497fad6fb9eba4f96c4d1687bdf704ad9"
> > ++dependencies = [
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "unicode-ident",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "system-deps"
> > ++version = "1.3.2"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "0f3ecc17269a19353b3558b313bba738b25d82993e30d62a18406a24aba4649b"
> > ++dependencies = [
> > ++ "heck",
> > ++ "pkg-config",
> > ++ "strum",
> > ++ "strum_macros",
> > ++ "thiserror",
> > ++ "toml",
> > ++ "version-compare",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "textwrap"
> > ++version = "0.16.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "222a222a5bfe1bba4a77b45ec488a741b3cb8872e5e499451fd7d0129c9c7c3d"
> > ++
> > ++[[package]]
> > ++name = "thiserror"
> > ++version = "1.0.40"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "978c9a314bd8dc99be594bc3c175faaa9794be04a5a5e153caba6915336cebac"
> > ++dependencies = [
> > ++ "thiserror-impl",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "thiserror-impl"
> > ++version = "1.0.40"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "f9456a42c5b0d803c8cd86e73dd7cc9edd429499f37a3550d286d5e86720569f"
> > ++dependencies = [
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 2.0.8",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "time"
> > ++version = "0.3.20"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "cd0cbfecb4d19b5ea75bb31ad904eb5b9fa13f21079c3b92017ebdf4999a5890"
> > ++dependencies = [
> > ++ "serde",
> > ++ "time-core",
> > ++ "time-macros",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "time-core"
> > ++version = "0.1.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "2e153e1f1acaef8acc537e68b44906d2db6436e2b35ac2c6b42640fff91f00fd"
> > ++
> > ++[[package]]
> > ++name = "time-macros"
> > ++version = "0.2.8"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "fd80a657e71da814b8e5d60d3374fc6d35045062245d80224748ae522dd76f36"
> > ++dependencies = [
> > ++ "time-core",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "tinytemplate"
> > ++version = "1.2.1"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "be4d6b5f19ff7664e8c98d03e2139cb510db9b0a60b55f8e8709b689d939b6bc"
> > ++dependencies = [
> > ++ "serde",
> > ++ "serde_json",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "tinyvec"
> > ++version = "1.6.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50"
> > ++dependencies = [
> > ++ "tinyvec_macros",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "tinyvec_macros"
> > ++version = "0.1.1"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
> > ++
> > ++[[package]]
> > ++name = "toml"
> > ++version = "0.5.11"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234"
> > ++dependencies = [
> > ++ "serde",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "toml_datetime"
> > ++version = "0.6.1"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "3ab8ed2edee10b50132aed5f331333428b011c99402b5a534154ed15746f9622"
> > ++
> > ++[[package]]
> > ++name = "toml_edit"
> > ++version = "0.19.8"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "239410c8609e8125456927e6707163a3b1fdb40561e4b803bc041f466ccfdc13"
> > ++dependencies = [
> > ++ "indexmap",
> > ++ "toml_datetime",
> > ++ "winnow",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "unicode-bidi"
> > ++version = "0.3.13"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "92888ba5573ff080736b3648696b70cafad7d250551175acbaa4e0385b3e1460"
> > ++
> > ++[[package]]
> > ++name = "unicode-ident"
> > ++version = "1.0.8"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "e5464a87b239f13a63a501f2701565754bae92d243d4bb7eb12f6d57d2269bf4"
> > ++
> > ++[[package]]
> > ++name = "unicode-normalization"
> > ++version = "0.1.22"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
> > ++dependencies = [
> > ++ "tinyvec",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "unicode-segmentation"
> > ++version = "1.10.1"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "1dd624098567895118886609431a7c3b8f516e41d30e0643f03d94592a147e36"
> > ++
> > ++[[package]]
> > ++name = "url"
> > ++version = "2.3.1"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "0d68c799ae75762b8c3fe375feb6600ef5602c883c5d21eb51c09f22b83c4643"
> > ++dependencies = [
> > ++ "form_urlencoded",
> > ++ "idna",
> > ++ "percent-encoding",
> > ++ "serde",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "uuid"
> > ++version = "1.3.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "1674845326ee10d37ca60470760d4288a6f80f304007d92e5c53bab78c9cfd79"
> > ++dependencies = [
> > ++ "serde",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "version-compare"
> > ++version = "0.0.10"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "d63556a25bae6ea31b52e640d7c41d1ab27faba4ccb600013837a3d0b3994ca1"
> > ++
> > ++[[package]]
> > ++name = "version_check"
> > ++version = "0.9.4"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
> > ++
> > ++[[package]]
> > ++name = "walkdir"
> > ++version = "2.3.3"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "36df944cda56c7d8d8b7496af378e6b16de9284591917d307c9b4d313c44e698"
> > ++dependencies = [
> > ++ "same-file",
> > ++ "winapi-util",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "wasi"
> > ++version = "0.11.0+wasi-snapshot-preview1"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
> > ++
> > ++[[package]]
> > ++name = "wasm-bindgen"
> > ++version = "0.2.84"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "31f8dcbc21f30d9b8f2ea926ecb58f6b91192c17e9d33594b3df58b2007ca53b"
> > ++dependencies = [
> > ++ "cfg-if",
> > ++ "wasm-bindgen-macro",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "wasm-bindgen-backend"
> > ++version = "0.2.84"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "95ce90fd5bcc06af55a641a86428ee4229e44e07033963a2290a8e241607ccb9"
> > ++dependencies = [
> > ++ "bumpalo",
> > ++ "log",
> > ++ "once_cell",
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 1.0.109",
> > ++ "wasm-bindgen-shared",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "wasm-bindgen-macro"
> > ++version = "0.2.84"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "4c21f77c0bedc37fd5dc21f897894a5ca01e7bb159884559461862ae90c0b4c5"
> > ++dependencies = [
> > ++ "quote",
> > ++ "wasm-bindgen-macro-support",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "wasm-bindgen-macro-support"
> > ++version = "0.2.84"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "2aff81306fcac3c7515ad4e177f521b5c9a15f2b08f4e32d823066102f35a5f6"
> > ++dependencies = [
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 1.0.109",
> > ++ "wasm-bindgen-backend",
> > ++ "wasm-bindgen-shared",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "wasm-bindgen-shared"
> > ++version = "0.2.84"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "0046fef7e28c3804e5e38bfa31ea2a0f73905319b677e57ebe37e49358989b5d"
> > ++
> > ++[[package]]
> > ++name = "web-sys"
> > ++version = "0.3.61"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "e33b99f4b23ba3eec1a53ac264e35a755f00e966e0065077d6027c0f575b0b97"
> > ++dependencies = [
> > ++ "js-sys",
> > ++ "wasm-bindgen",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "winapi"
> > ++version = "0.3.9"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
> > ++dependencies = [
> > ++ "winapi-i686-pc-windows-gnu",
> > ++ "winapi-x86_64-pc-windows-gnu",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "winapi-i686-pc-windows-gnu"
> > ++version = "0.4.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
> > ++
> > ++[[package]]
> > ++name = "winapi-util"
> > ++version = "0.1.5"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
> > ++dependencies = [
> > ++ "winapi",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "winapi-x86_64-pc-windows-gnu"
> > ++version = "0.4.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
> > ++
> > ++[[package]]
> > ++name = "winnow"
> > ++version = "0.4.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "deac0939bd6e4f24ab5919fbf751c97a8cfc8543bb083a305ed5c0c10bb241d1"
> > ++dependencies = [
> > ++ "memchr",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "zvariant"
> > ++version = "3.12.0"
> > ++dependencies = [
> > ++ "arrayvec",
> > ++ "byteorder",
> > ++ "chrono",
> > ++ "criterion",
> > ++ "enumflags2",
> > ++ "glib",
> > ++ "libc",
> > ++ "rand",
> > ++ "serde",
> > ++ "serde_bytes",
> > ++ "serde_json",
> > ++ "serde_repr",
> > ++ "static_assertions",
> > ++ "time",
> > ++ "url",
> > ++ "uuid",
> > ++ "zvariant_derive",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "zvariant_derive"
> > ++version = "3.12.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "34c20260af4b28b3275d6676c7e2a6be0d4332e8e0aba4616d34007fd84e462a"
> > ++dependencies = [
> > ++ "proc-macro-crate 1.3.1",
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 1.0.109",
> > ++ "zvariant_utils",
> > ++]
> > ++
> > ++[[package]]
> > ++name = "zvariant_utils"
> > ++version = "1.0.0"
> > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum = "53b22993dbc4d128a17a3b6c92f1c63872dd67198537ee728d8b5d7c40640a8b"
> > ++dependencies = [
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 1.0.109",
> > ++]
> > +diff --git a/zvariant/Cargo.toml b/zvariant/Cargo.toml
> > +index 45367729..6981862a 100644
> > +--- a/zvariant/Cargo.toml
> > ++++ b/zvariant/Cargo.toml
> > +@@ -27,7 +27,7 @@ byteorder = "1.4.3"
> > + serde = { version = "1.0", features = ["derive"] }
> > + arrayvec = { version = "0.7.2", features = ["serde"], optional = true }
> > + enumflags2 = { version = "0.7.5", features = ["serde"], optional = true }
> > +-zvariant_derive = { version = "=3.12.0", path = "../zvariant_derive" }
> > ++zvariant_derive = "3.12.0"
> > + serde_bytes = { version = "0.11", optional = true }
> > + static_assertions = "1.1.0"
> > + libc = "0.2.137"
> > +diff --git a/zvariant/LICENSE b/zvariant/LICENSE
> > +deleted file mode 120000
> > +index ea5b6064..00000000
> > +--- a/zvariant/LICENSE
> > ++++ /dev/null
> > +@@ -1 +0,0 @@
> > +-../LICENSE
> > +\ No newline at end of file
> > +diff --git a/zvariant/LICENSE b/zvariant/LICENSE
> > +new file mode 100644
> > +index 00000000..31aa7938
> > +--- /dev/null
> > ++++ b/zvariant/LICENSE
> > +@@ -0,0 +1,23 @@
> > ++Permission is hereby granted, free of charge, to any
> > ++person obtaining a copy of this software and associated
> > ++documentation files (the "Software"), to deal in the
> > ++Software without restriction, including without
> > ++limitation the rights to use, copy, modify, merge,
> > ++publish, distribute, sublicense, and/or sell copies of
> > ++the Software, and to permit persons to whom the Software
> > ++is furnished to do so, subject to the following
> > ++conditions:
> > ++
> > ++The above copyright notice and this permission notice
> > ++shall be included in all copies or substantial portions
> > ++of the Software.
> > ++
> > ++THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF
> > ++ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
> > ++TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
> > ++PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> > ++SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
> > ++CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
> > ++OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
> > ++IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> > ++DEALINGS IN THE SOFTWARE.
> > +-- 
> > +2.34.1
> > +
> > diff --git a/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb b/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb
> > new file mode 100644
> > index 0000000000..4fe327ae07
> > --- /dev/null
> > +++ b/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb
> > @@ -0,0 +1,26 @@
> > +SUMMARY = "Provides API for encoding/decoding of data to/from D-Bus wire format"
> > +DESCRIPTION = "This crate provides API for encoding/decoding of data to/from D-Bus wire format.\
> > +This binary wire format is simple and very efficient and hence useful outside of D-Bus context as well.\
> > +A modified form of this format, GVariant is very commonly used for efficient storage of arbitrary \
> > +data and is also supported by this crate."
> > +HOMEPAGE = "https://gitlab.freedesktop.org/dbus/zbus/"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=b377b220f43d747efdec40d69fcaa69d"
> > +
> > +SRC_URI = " \
> > +    git://gitlab.freedesktop.org/dbus/zbus;protocol=https;branch=main;subpath=zvariant \
> > +    file://0001-Tweak-zvariant-crate-config.patch;striplevel=2 \
> > +"
> > +
> > +SRCREV = "07506776fab5f58e029760bb4b288f670c7eecd6"
> > +S = "${WORKDIR}/zvariant"
> > +
> > +python do_clean_lic_file_symlink() {
> > +    bb.utils.remove("LICENCE")
> > +}
> > +
> > +addtask clean_lic_file_symlink after do_unpack before do_patch
> > +
> > +inherit cargo cargo-update-recipe-crates
> > +
> > +require ${BPN}-crates.inc
> > diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
> > index 81d02017c1..94873fd19f 100644
> > --- a/meta/lib/oeqa/selftest/cases/devtool.py
> > +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> > @@ -848,6 +848,99 @@ class DevtoolModifyTests(DevtoolBase):
> >          # Try building
> >          bitbake(testrecipe)
> >  
> > +    def test_devtool_modify_git_crates_subpath(self):
> > +        # This tests two things in devtool context:
> > +        #   - that we support local git dependencies for cargo based recipe
> > +        #   - that we support patches in SRC_URI when git url contains subpath parameter
> > +
> > +        # Check preconditions:
> > +        #    recipe inherits cargo
> > +        #    git:// uri with a subpath as the main package
> > +        #    some crate:// in SRC_URI
> > +        #    others git:// in SRC_URI
> > +        #    cointains a patch
> > +        testrecipe = 'zvariant'
> > +        bb_vars = get_bb_vars(['SRC_URI', 'FILE', 'WORKDIR', 'CARGO_HOME'], testrecipe)
> > +        recipefile = bb_vars['FILE']
> > +        workdir = bb_vars['WORKDIR']
> > +        cargo_home = bb_vars['CARGO_HOME']
> > +        src_uri = bb_vars['SRC_URI'].split()
> > +        self.assertTrue(src_uri[0].startswith('git://'),
> > +                        'This test expects the %s recipe to have a git repo has its main uri' % testrecipe)
> > +        self.assertIn(';subpath=', src_uri[0],
> > +                      'This test expects the %s recipe to have a git uri with subpath' % testrecipe)
> > +        self.assertTrue(any([uri.startswith('crate://') for uri in src_uri]),
> > +                        'This test expects the %s recipe to have some crates in its src uris' % testrecipe)
> > +        self.assertGreater(sum(map(lambda x:x.startswith('git://'), src_uri)), 2,
> > +                           'This test expects the %s recipe to have several git:// uris' % testrecipe)
> > +        self.assertTrue(any([uri.startswith('file://') and '.patch' in uri for uri in src_uri]),
> > +                        'This test expects the %s recipe to have a patch in its src uris' % testrecipe)
> > +
> > +        self._test_recipe_contents(recipefile, {}, ['cargo'])
> > +
> > +        # Clean up anything in the workdir/sysroot/sstate cache
> > +        bitbake('%s -c cleansstate' % testrecipe)
> > +        # Try modifying a recipe
> > +        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
> > +        self.track_for_cleanup(tempdir)
> > +        self.track_for_cleanup(self.workspacedir)
> > +        self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
> > +        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
> > +        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
> > +        self.assertExists(os.path.join(tempdir, 'Cargo.toml'), 'Extracted source could not be found')
> > +        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created. devtool output: %s' % result.output)
> > +        matches = glob.glob(os.path.join(self.workspacedir, 'appends', 'zvariant_*.bbappend'))
> > +        self.assertTrue(matches, 'bbappend not created')
> > +        # Test devtool status
> > +        result = runCmd('devtool status')
> > +        self.assertIn(testrecipe, result.output)
> > +        self.assertIn(tempdir, result.output)
> > +        # Check git repo
> > +        self._check_src_repo(tempdir)
> > +        # Check that the patch is correctly applied
> > +        # last commit message in the tree must contain
> > +        # %% original patch: <patchname>
> > +        # ..
> > +        patchname = None
> > +        for uri in src_uri:
> > +            if uri.startswith('file://') and '.patch' in uri:
> > +                patchname = uri.replace("file://", "").partition('.patch')[0] + '.patch'
> > +        self.assertIsNotNone(patchname)
> > +        result = runCmd('git -C %s log -1' % tempdir)
> > +        self.assertIn("%%%% original patch: %s" % patchname, result.output)
> > +
> > +        # Configure the recipe to check that the git dependencies are correctly patched in cargo config
> > +        bitbake('-c configure %s' % testrecipe)
> > +
> > +        cargo_config_path = os.path.join(cargo_home, 'config')
> > +        with open(cargo_config_path, "r") as f:
> > +            cargo_config_contents = [line.strip('\n') for line in f.readlines()]
> > +
> > +        # Get back git dependencies of the recipe (ignoring the main one)
> > +        # and check that they are all correctly patched to be fetched locally
> > +        git_deps = [uri for uri in src_uri if uri.startswith("git://")][1:]
> > +        for git_dep in git_deps:
> > +            raw_url, _, raw_parms = git_dep.partition(";")
> > +            parms = {}
> > +            for parm in raw_parms.split(";"):
> > +                name_parm, _, value_parm = parm.partition('=')
> > +                parms[name_parm]=value_parm
> > +            self.assertIn('protocol', parms, 'git dependencies uri should contain the "protocol" parameter')
> > +            self.assertIn('name', parms, 'git dependencies uri should contain the "name" parameter')
> > +            self.assertIn('destsuffix', parms, 'git dependencies uri should contain the "destsuffix" parameter')
> > +            self.assertIn('type', parms, 'git dependencies uri should contain the "type" parameter')
> > +            self.assertEqual(parms['type'], 'git-dependency', 'git dependencies uri should have "type=git-dependency"')
> > +            raw_url = raw_url.replace("git://", '%s://' % parms['protocol'])
> > +            patch_line = '[patch."%s"]' % raw_url
> > +            path_patched = os.path.join(workdir, parms['destsuffix'])
> > +            path_override_line = '%s = { path = "%s" }' % (parms['name'], path_patched)
> > +            # Would have been better to use tomllib to read this file :/
> > +            self.assertIn(patch_line, cargo_config_contents)
> > +            self.assertIn(path_override_line, cargo_config_contents)
> > +
> > +        # Try to package the recipe
> > +        bitbake('-c package_qa %s' % testrecipe)
> > +
> >      def test_devtool_modify_localfiles(self):
> >          # Check preconditions
> >          testrecipe = 'lighttpd'
> > -- 
> > 2.34.1
> > 
> 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#179290): https://lists.openembedded.org/g/openembedded-core/message/179290
> > Mute This Topic: https://lists.openembedded.org/mt/97931116/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

