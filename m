Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912AACAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 08:11:23 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.48511.1759133472613731384
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 01:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fBEfQgP3;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 36547C00794
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 08:10:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D093B606AE;
	Mon, 29 Sep 2025 08:11:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20D38102F1840;
	Mon, 29 Sep 2025 10:11:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759133470; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Lz/xDG5h4RVKYYkaMN+nBKQbXgUsfMiweVAU1Gbj/PA=;
	b=fBEfQgP39j+d/VgYis5+YEChYdkik4he347HOPfhZ9aQZXXLAsEL0QpkDPpeWm9u9yZkhG
	s3LuWM0tt/MFWFVFPSbIfiPAjyQTteCiW6hNmwqnfql3oDTE25petWablbQOT0usqgEtnQ
	mil3Ll/nRjRkhsHzlJ7SJuswQMZ7YiidGLjxFrkz7o5eBHpqNllag2gnapLPD8+eakhPFi
	4c4o1R6lqC94ozwTqejrUX4Phl1XEmXvKm2JbWK9oNHIyv1y7L8h//LZov2t/hAkWNbXSU
	0NWCSIPedbtQv/I1BdIUoO2TnDfZrpnnt32H1zi9UIzNx8NHDnq7cfCt8sL7uQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 10:11:07 +0200
Message-Id: <DD54RQRP8CER.SGWLWEFDZ65S@bootlin.com>
Subject: Re: [OE-core] [PATCH V3 1/2] rust: Use clang instead of rust-llvm
Cc: <Sundeep.Kokkonda@windriver.com>, <Deepesh.Varatharajan@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250926102411.3742996-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250926102411.3742996-1-Deepesh.Varatharajan@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 08:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224122

On Fri Sep 26, 2025 at 12:24 PM CEST, Deepesh via lists.openembedded.org Va=
ratharajan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Updated the Rust build to depend on Clang instead.
>
> *Summary of discussion with the rust upstream about using latest LLVM ins=
tead of Rust maintained LLVM fork.
> https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-llvm=
-fork-what-rust-uses/23489
>
> *Upstream LLVM is generally compatible:
> - Rust does support building with upstream (vanilla) LLVM, especially the=
 latest
> major release and the one or two preceding ones.
> https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updating=
-llvm
>
> *Impact on Yocto Rust upgrades:
> - Rust upgrades shall always check for updates on rust forked llvm and ba=
ckport
> the relevant patches to clang's llvm.
>
> *Regarding the rust forked llvm local patches:
> - There are no local patches on rust forked llvm other than the backporte=
d fixes
> from llvm master.
>
> *We now add these flags "-Clink-arg=3D-lz -Clink-arg=3D-lzstd" because of=
 this following
> diff otherwise we will get errors during link time.
>
> Setup in rust-llvm
> -DLLVM_ENABLE_ZLIB=3DOFF \
> -DLLVM_ENABLE_ZSTD=3DOFF \
> -DLLVM_ENABLE_FFI=3DOFF \
>
> Setup in clang
> -DLLVM_ENABLE_FFI=3DON \
> -DLLVM_ENABLE_ZSTD=3DON \
>
> *When multilibs enabled:
>
> llvm-config expects static libraries to be located in the lib directory r=
ather than
> lib64. However, since LLVM is built as a non-multilib component, the lib =
directory
> doesn't contain any library files. To accommodate this without breaking m=
ultilib
> behavior, we copy the required library files appropriately.
>
> Previously, when we depended on rust-llvm, this worked because we specifi=
ed:
> -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust
>
> With this setup, llvm-config was installed inside ${libdir}/llvm-rust, wh=
ich included
> its own bin and lib directories. Thus, llvm-config located in bin would c=
orrectly find
> the libraries in the adjacent lib directory.
>
> Even when multilib was enabled or not, llvm-config would still look for l=
ibraries under
> lib in this structure, so everything functioned as expected.
>
> *Changes needs to be done when llvm splits from clang:
> In rust recipe:
> Update the dependency from:
> DEPENDS +=3D "ninja-native clang" to DEPENDS +=3D "ninja-native llvm"
>
> In llvm recipe:
> Apply the same changes that were made in the Clang recipe, as those
> configurations have now been moved to the LLVM recipe after the split.
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---

Hi Deepesh,

Thanks for your patch.

It looks like this is breaking some build, strangely only the arm64 one
with musl.

ERROR: rust-1.90.0-r0 do_install: Execution of '/srv/pokybuild/yocto-worker=
/musl-qemuarm64/build/build/tmp/work/cortexa57-poky-linux-musl/rust/1.90.0/=
temp/run.do_install.3194366' failed with exit code 1
...
| Building libunwind.a for aarch64-poky-linux-musl
| cargo:warning=3D/srv/pokybuild/yocto-worker/musl-qemuarm64/build/build/tm=
p/work/cortexa57-poky-linux-musl/rust/1.90.0/sources/rustc-1.90.0-src/src/l=
lvm-project/libunwind/src/UnwindLevel1.c:191:1: error: arch extension 'gcs'=
 should be prefixed by '+'
| cargo:warning=3D  191 | unwind_phase2(unw_context_t *uc, unw_cursor_t *cu=
rsor, _Unwind_Exception *exception_object) {
| cargo:warning=3D      | ^~~~~~~~~~~~~
| cargo:warning=3D/srv/pokybuild/yocto-worker/musl-qemuarm64/build/build/tm=
p/work/cortexa57-poky-linux-musl/rust/1.90.0/sources/rustc-1.90.0-src/src/l=
lvm-project/libunwind/src/UnwindLevel1.c:337:22: error: arch extension 'gcs=
' should be prefixed by '+'
| cargo:warning=3D  337 |                      _Unwind_Stop_Fn stop, void *=
stop_parameter) {
| cargo:warning=3D      |                      ^~~~~~~~~~~~~~~
|

Can you have a look at this failure please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


