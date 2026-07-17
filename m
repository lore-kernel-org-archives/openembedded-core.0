Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96983C44516
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:04:09 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12926.1784293440693395262
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 06:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZJFjPeqT;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1B1A9C2B9FC;
	Fri, 17 Jul 2026 13:04:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46C2760361;
	Fri, 17 Jul 2026 13:03:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE4EB11BD0163;
	Fri, 17 Jul 2026 15:03:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784293434; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nwHtZEUjG2w9HUJ8VgkwzWu+bmHfGb6HwDJBWcBQOts=;
	b=ZJFjPeqTwZhYTL2erdOGhClAWVggTBlrgbPLFVgXcHTNRhpVDZkYtzBP4ws1xV5eVRJgCH
	kJDj0VmALlMTX6hOrADFremlzYRJVMfW5TcJ3R8CN6YAgMZQDu9Fc4R3tTc7auU8YoD47B
	15kXAyWYYzminw1a4JEFLMK96BB8gFDd91N5QJhdIQJk6IBIlUxIHKx41XikgdwyotsW//
	omolSZB0ua9YQ+wDpaXyKBnY2mJYBD8vGAigdOQ+vY3FampxP8q7Ubx+sd8jYZAZvngIxR
	FVOSLPfvxPGql2x2qPL+4gWTw8FAzRPvMKVPLIEVteN0Lhlr6mDKuwWkuDDRzg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 15:03:52 +0200
Message-Id: <DK0V8ES17T70.PO85FXGM6YP8@bootlin.com>
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.96.1 -> 1.97.0
Cc: <Randy.MacLeod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <sundeep.kokkonda@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260713085833.3698049-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20260713085833.3698049-1-sundeep.kokkonda@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 13:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241180

On Mon Jul 13, 2026 at 10:58 AM CEST, Sundeep KOKKONDA via lists.openembedd=
ed.org wrote:
> From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>
> Rust Changes:
> https://github.com/rust-lang/rust/releases/tag/1.97.0
>
> Cargo Changes:
> https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html#cargo-197-2026-07-=
09
>
> Release highlights:
> - v0 symbol mangling scheme now default
> - New allow-by-default `dead_code_pub_in_binary` lint
> - Cargo: stabilized `build.warnings` and `resolver.lockfile-path` configs
> - Multiple new stabilized APIs (isolate_highest_one, bit_width, etc)
>
> Drop merged patches:
> 0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch
>   (merged upstream in vendored libc 0.2.186)
> 0003-explicit-tail-calls-disable-two-tests.patch
>   (backport from fb9e970c1f93 and 250beb317422)
> 0004-explicit-tail-calls-ignore-tests-on-unsupported-llvm.patch
>   (backport from ded0aaba6ce2)
>
> New patches:
> 0003-tests-assembly-llvm-issue-141649-fix-expected-stack.patch
>   Fix expected stack allocation size for aarch64 with LLVM 22.1.8.
>   LLVM 22.1.8 optimizes non-overlapping scope stack reuse more
>   aggressively (32 bytes instead of 48). This test is new in 1.97.0
>   and was validated against bundled LLVM 22.1.6.
>
> Updated files:
> rust-source.inc: updated sha256sum, removed merged patches, added new pat=
ches
> rust-snapshot.inc: updated SNAPSHOT_VERSION 1.95.0 -> 1.96.0 with all arc=
h checksums
> tcmode-default.inc: updated RUSTVERSION 1.96.1% -> 1.97.0%
> rust_1.97.0.bb: remove vendored .a files from installed sources
>   (fix dwarfsrcfiles failure on non-ELF wit-bindgen-0.57.1 archive)
>
> Selftest Changes:
> Exclude tests/ui/codegen/huge-stacks.rs (fails in QEMU emulated
>   environments due to resource limits =E2=80=94 new test in 1.97.0.
>   Upstream discussion - https://github.com/rust-lang/rust/issues/158557)
> Fix stale exclusion path: tests/assembly-llvm/c-variadic-arm.rs ->
>   tests/assembly-llvm/c-variadic/arm.rs (file moved to subdirectory)
>
> Excluded tests:
> +---------+---------+---------+
> | Before  |  After  | Skipped |
> +---------+---------+---------+
> |   41    |   42    |   +1    |
> +---------+---------+---------+
>
> rust v1.97.0 (from autobuilder)
> +-------------+---------+---------+
> | Machine     | Passed  | Skipped |
> +-------------+---------+---------+
> | qemux86-64  |  22752  |   762   |
> | qemux86     |  22505  |  1009   |
> | qemuarm64   |  22579  |   935   |
> | qemuarm     |  22486  |  1028   |
> | qemuriscv64 |  22528  |   986   |
> +-------------+---------+---------+
>
> Test results difference (1.97.0 - 1.96.0):
>
> +-------------+--------+---------+
> | Machine     | Passed | Skipped |
> +-------------+--------+---------+
> | qemux86-64  |  +316  |   +30   |
> | qemux86     |  +315  |   +31   |
> | qemuarm64   |  +317  |   +29   |
> | qemuarm     |  +314  |   +32   |
> | qemuriscv64 |  +312  |   +34   |
> +-------------+--------+---------+
>
> Reproducibility: PASSED (x86-64)
>
> Assisted-by: Kiro
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---

Hi Sundeep,

I've got this upgrade in my branch for a few days, and I believe it is
the source of some intermittent reproducibility issue.

Some examples:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4393
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260716-z8el_9yb/=
packages/diff-html/

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4396
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260716-111q2w5w/=
packages/diff-html/

I saw you sent a new version upgrading to 1.97.1. I will test it during
the week-end, but I do expect similar issues.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


