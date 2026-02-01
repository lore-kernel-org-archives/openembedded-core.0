Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65A3E7C711
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 07:52:13 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25825.1769932324733658397
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jan 2026 23:52:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FJ/M9YMf;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9433BC237CB
	for <openembedded-core@lists.openembedded.org>; Sun,  1 Feb 2026 07:52:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4008260720;
	Sun,  1 Feb 2026 07:52:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6674B119A88ED;
	Sun,  1 Feb 2026 08:51:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769932321; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iERvEaufDWbX2GqURicys/wlCg/om9xz5lDVJmaMayE=;
	b=FJ/M9YMfjgHWPaAMFc1EBbzPFAHrpKh12mCq/jA88y9fXEfYE/j1/aKAlPcEP3nTbNm5ID
	6fcUG/MOCV9wJ27TBRwxxEDZ//zJm2cWwet0YYF5C51RKx48oaepI0LNnW64sCqAwbLpV/
	WycOy0oJfrW0Tgu2Wk6K8jwnpZ0eq63fqwGsP11nKbmMDX2zNMAazecDx6QSHH79flnNxi
	qYG7au01/ZE2BTTmDr5rZLl8PMVvHy/C8KL2LqOADINU5QnsqlAQFxl8evXIA5Y0HjS0nV
	d525JVUSV+/eGmEdTzbnmu5N4/3TPL6g4gkKc9jrN1T1gtSSjYxDL8fTsC4EoQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Feb 2026 08:51:55 +0100
Message-Id: <DG3GN4VGMAU4.OOYLJKHV2X2B@bootlin.com>
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.92.0 -> 1.93.0
Cc: <Sundeep.Kokkonda@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Hemanth.KumarMD@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260130134137.2463745-1-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260130134137.2463745-1-Hemanth.KumarMD@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 07:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230253

On Fri Jan 30, 2026 at 2:41 PM CET, Hemanth.KumarMD via lists.openembedded.=
org wrote:
> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>
> https://blog.rust-lang.org/2026/01/22/Rust-1.93.0/
> Rust changes: https://github.com/rust-lang/rust/releases/tag/1.93.0
> Cargo changes: https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html#car=
go-193-2026-01-22
>
> * rust-oe-selftest.patch updated for 1.93:
>   Renamed UI test directive from add-core-stubs to add-minicore as in
>   https://github.com/rust-lang/rust/commit/3796f7de57f5d4cf4325d1f13aeb07=
fdaa57983b
>
> * OE-selftests:
>   - Exclude src/tools/remote-test-client from test suite.
>     This unit test modifies the TEST_DEVICE_ADDR environment variable,
>     which breaks the OE test harness that uses the same variable for
>     QEMU remote testing. Filed a bug with upstream:
>     https://github.com/rust-lang/rust/issues/151823
>
>   - Enable +v8a feature for cortexa57.
>     Rust 1.93.0 added a regression test (PR #149549) to verify that the
>     ARMv8-A system register ttbr0_el2 is recognized in inline assembly.
>     This addresses issue #97724 where LLVM wasn't recognizing ttbr0_el2
>     as a valid register. Upstream Rust enables +v8a by default for all
>     AArch64 targets (PR #105026), but Yocto's custom target specification
>     doesn't inherit this. Adding +v8a ensures LLVM recognizes ARMv8-A
>     system registers, fixing the test failure.
>
>     Related upstream links:
>     - PR #149549: https://github.com/rust-lang/rust/pull/149549
>     - Issue #97724: https://github.com/rust-lang/rust/issues/97724
>     - PR #105026: https://github.com/rust-lang/rust/pull/105026
>
> Test results:
>
> rust v1.93.0
> +-------------+--------+---------+
> | Machine     | Passed | Skipped |
> +-------------+--------+---------+
> | qemux86-64  | 21,689 |   646   |
> | qemux86     | 21,439 |   896   |
> | qemuarm64   | 21,495 |   840   |
> | qemuarm     | 21,421 |   914   |
> | qemuriscv64 | 21,466 |   869   |
> +-------------+--------+---------+
>
> Test results difference (1.93.0 - 1.92.0):
>
> +-------------+--------+---------+
> | Machine     | Passed | Skipped |
> +-------------+--------+---------+
> | qemux86-64  |  +205  |   +33   |
> | qemux86     |  +205  |   +33   |
> | qemuarm64   |  +206  |   +32   |
> | qemuarm     |  +205  |   +33   |
> | qemuriscv64 |  +205  |   +33   |
> +-------------+--------+---------+
>
> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> ---

Hi Hemanth,

Thanks for the upgrade.

I suspect this is responsible of the
runtime_test.RustKernel.test_kernel_rust_sample selftest failure:

2026-01-31 16:20:41,991 - oe-selftest - INFO - runtime_test.RustKernel.test=
_kernel_rust_sample (subunit.RemotedTestCase)
2026-01-31 16:20:41,994 - oe-selftest - INFO -  ... FAIL
...
ERROR: linux-yocto-6.16.11+git-r0 do_compile: Execution of '/srv/pokybuild/=
yocto-worker/oe-selftest-debian/build/build-st-766138/tmp/work/qemux86_64-p=
oky-linux/linux-yocto/6.16.11+git/temp/run.do_compile.189616' failed with e=
xit code 1
...
| error: unknown unstable option: `no-jump-tables`

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3127
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3022

Can you have a look at what is going wrong here?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


