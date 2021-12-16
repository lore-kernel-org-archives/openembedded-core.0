Return-Path: <sjl@vctlabs.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21EF2C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 23:04:35 +0000 (UTC)
Received: from dent.vctlabs.com (dent.vctlabs.com [207.154.65.135])
 by mx.groups.io with SMTP id smtpd.web12.1679.1639695874380130880
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 15:04:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: vctlabs.com, ip: 207.154.65.135,
 mailfrom: sjl@vctlabs.com)
Received: by dent.vctlabs.com (Postfix, from userid 112)
	id F1CD8280270; Thu, 16 Dec 2021 15:06:35 -0800 (PST)
Received: from codepurple (c-73-158-3-176.hsd1.ca.comcast.net [73.158.3.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
 server-digest SHA256)
	(No client certificate requested)
	by dent.vctlabs.com (Postfix) with ESMTPSA id 54FD92800EE
	for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 15:06:35 -0800 (PST)
Date: Thu, 16 Dec 2021 15:04:30 -0800
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rust: fix arm64 link failures when building rust apps
Message-ID: <20211216230430.GF5920@codepurple>
References: <20211216091940.GE5920@codepurple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216091940.GE5920@codepurple>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 23:04:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159810

Patch withdrawn: turns out meta-tegra was pulling in an old toolchain
for CUDA reasons, and that just got fixed. Probably there isn't another
aarch64 platform still using a non-fixed toolchain, and if there happens
to be one maybe they will run across this patch to carry it in their own
layer.

Note: apologies for not CC-ing Alexander Kanavin, but I couldn't figure
out how to directly reply to his question from this list's web UI & I don't
have a copy of his email in my inbox.
https://lists.openembedded.org/g/openembedded-core/message/159775

On Thu, Dec 16, 2021 at 01:19:45AM -0800, S. Lockwood-Childs wrote:
> Typical error when trying to build a rust app (for example, librsvg)
> for aarch64 targets looks like:
>   undefined references to `__aarch64_ldadd8_rel'
> 
> The upstream rust commit
> "add target feature outline-atomics" 0f9f241aac21bc77fb9e757da18207abefdc841d
> has caused a number of such link failure regressions on platforms with aarch64
> toolchains that are not able to cope with -moutline-atomics flag. This includes
> musl toolchains [1] but some glibc toolchains also are not able to handle this
> flag [2,3]
> 
> OE gcc-cross-aarch64 is currently one of the latter, but when it *is* able to
> handle outline-atomics this patch should go away, to take advantage of the
> reported performance benefit.
> 
> [1] https://github.com/rust-lang/git2-rs/issues/706
> [2] https://www.mail-archive.com/gcc-bugs@gcc.gnu.org/msg661738.html
> [3] https://bugzilla.redhat.com/show_bug.cgi?id=1830472
> 
> Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
> ---
>  meta/recipes-devtools/rust/rust-target.inc    |  2 +
>  .../rust/rust-disable-outline-atomics.patch   | 50 +++++++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta/recipes-devtools/rust/rust/rust-disable-outline-atomics.patch
> 
> diff --git a/meta/recipes-devtools/rust/rust-target.inc b/meta/recipes-devtools/rust/rust-target.inc
> index 3f637b3ba5..bac743f66d 100644
> --- a/meta/recipes-devtools/rust/rust-target.inc
> +++ b/meta/recipes-devtools/rust/rust-target.inc
> @@ -2,6 +2,8 @@ require rust.inc
>  
>  DEPENDS += "rust-llvm (=${PV})"
>  
> +SRC_URI += "file://rust-disable-outline-atomics.patch"
> +
>  # Otherwise we'll depend on what we provide
>  INHIBIT_DEFAULT_RUST_DEPS:class-native = "1"
>  # We don't need to depend on gcc-native because yocto assumes it exists
> diff --git a/meta/recipes-devtools/rust/rust/rust-disable-outline-atomics.patch b/meta/recipes-devtools/rust/rust/rust-disable-outline-atomics.patch
> new file mode 100644
> index 0000000000..fc99a06a6a
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust/rust-disable-outline-atomics.patch
> @@ -0,0 +1,50 @@
> +rust: fix arm64 link failures when building rust apps
> +
> +Typical error when trying to build a rust app looks like: 
> +  undefined references to `__aarch64_ldadd8_rel'
> +
> +The upstream rust commit 
> +"add target feature outline-atomics" 0f9f241aac21bc77fb9e757da18207abefdc841d
> +has caused a number of such link failure regressions on platforms with aarch64
> +toolchains that are not able to cope with -moutline-atomics flag. This includes
> +musl toolchains [1] but some glibc toolchains also are not able to handle this
> +flag [2,3]
> +
> +OE gcc-cross-aarch64 is currently one of the latter, but when it *is* able to
> +handle outline-atomics this patch should go away, to take advantage of the
> +reported performance benefit.
> +
> +[1] https://github.com/rust-lang/git2-rs/issues/706
> +[2] https://www.mail-archive.com/gcc-bugs@gcc.gnu.org/msg661738.html
> +[3] https://bugzilla.redhat.com/show_bug.cgi?id=1830472
> +
> +Upstream-Status: Inappropriate [other]
> +
> +Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
> +
> +diff --git a/compiler/rustc_codegen_llvm/src/llvm_util.rs b/compiler/rustc_codegen_llvm/src/llvm_util.rs
> +index c2136f161..ca221eb4a 100644
> +--- a/compiler/rustc_codegen_llvm/src/llvm_util.rs
> ++++ b/compiler/rustc_codegen_llvm/src/llvm_util.rs
> +@@ -416,13 +416,14 @@ pub fn llvm_global_features(sess: &Session) -> Vec<String> {
> +     // -Ctarget-features
> +     features.extend(sess.opts.cg.target_feature.split(',').flat_map(&filter));
> + 
> +-    // FIXME: Move outline-atomics to target definition when earliest supported LLVM is 12.
> +-    if get_version() >= (12, 0, 0)
> +-        && sess.target.llvm_target.contains("aarch64-unknown-linux")
> +-        && sess.target.llvm_target != "aarch64-unknown-linux-musl"
> +-    {
> +-        features.push("+outline-atomics".to_string());
> +-    }
> ++//    // FIXME: Move outline-atomics to target definition when earliest supported LLVM is 12.
> ++//    if get_version() >= (12, 0, 0)
> ++//        && sess.target.llvm_target.contains("aarch64-unknown-linux")
> ++//        && sess.target.llvm_target != "aarch64-unknown-linux-musl"
> ++//    {
> ++//        features.push("+outline-atomics".to_string());
> ++//    }
> ++
> + 
> +     features
> + }
> -- 
> 2.20.1
> 

