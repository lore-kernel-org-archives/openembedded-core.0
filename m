Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2961C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 07:57:54 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.4189.1653465473682361784
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 00:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FZ9fiLHX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 910411BF207;
	Wed, 25 May 2022 07:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653465471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PexEKvDBMXLOEbWQucTdq5qVCb9y+hKh7fDMyypz/3M=;
	b=FZ9fiLHX0WY4XosKUCxCxjeVWgaGQT/MZeoVTl7VWEMVjLGL/vRYe8vFBewFSAVnc3e59t
	SflExrt9m3L1f2tYYxK6Zlo0S1qeWDLiPfBUqXIMfqirYoJbvq/s7RAAxyKKMSrnis3ldR
	JFqzXj5CBPlg6+j4ntxTO/V8JUNHcSOepumm8MNuwzXZX9ZrJMYl3mOQtQMcsaiVZyAeoa
	kxWhi/lLfpY7PtcCOS0GxNqVa3EgI1EH/u4GscZsr4ftPezyMc7rxbe69xPLq9vkN7Tb3A
	bsHTaLK/VmbPM2dSX40Bd02YCu8DaEdI4BL3X3ZHyukwNh9sfHG7urD50BAaKQ==
Date: Wed, 25 May 2022 09:57:48 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Pgowda" <pgowda.cve@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 richard.purdie@linuxfoundation.org, rwmacleod@gmail.com,
 alex.kanavin@gmail.com, vinay.m.engg@gmail.com
Subject: Re: [OE-core] [PATCH v6] Rust Oe-Selftest implementation
Message-ID: <20220525095748.4e0c522c@melee>
In-Reply-To: <20220525043258.8949-1-pgowda.cve@gmail.com>
References: <20220524225603.50d60963@melee>
	<20220525043258.8949-1-pgowda.cve@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 07:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166104

Pgowda,

Il giorno Tue, 24 May 2022 21:32:58 -0700
"Pgowda" <pgowda.cve@gmail.com> ha scritto:

> The patch implements Rust testing framework similar to other selftest,
> specifically the gcc selftest in OE. It uses the client and server
> based method to test the binaries for cross-target on the image.
> The test framework is a wrapper around the Rust build system as ./x.py
> test.
> It tests many functionalities of Rust distribution like tools,
> documentation, libraries, packages, tools, Cargo, Crater etc.
> Please refer the following link for detailed description of Rust
> testing:-
> https://rustc-dev-guide.rust-lang.org/tests/intro.html#tool-tests
> 
> To support the rust tests in oe-core, the following functions were
> added:-
> setup_cargo_environment(): Build bootstrap and some early stage tools.
> do_rust_setup_snapshot(): Install the snapshot version of rust
> binaries. do_configure(): To generate config.toml
> do_compile(): To build "remote-test-server" for qemu target image.
> 
> Approximate Number of Tests Run in the Rust Testsuite :- 18000
> Approximate Number of Tests that FAIL in bitbake environment :-
> 100-150 Normally majority of the testcases are present in major
> folder "test/" It contributes to more than 80% of the testcases
> present in Rust test framework. These tests pass as expected on any
> Rust versions without much fuss. The tests that fail are of less
> important and contribute to less than 2% of the total testcases.
> These minor tests are observed to work on some versions and fail on
> others. They have to be added, ignored or excluded for different
> versions as per the behavior. These tests have been ignored or
> excluded in the Rust selftest environment to generate success of
> completing the testsuite.
> 
> These tests work in parallel mode even in the skipped test mode as
> expected. Although the patch to disable tests is large, it is very
> simple in that it only disables tests. When updating to a newer
> version of Rust, the patch can usually be ported in a day.
> 
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |   1 +
>  meta/lib/oeqa/selftest/cases/rust.py          |  57 +++
>  meta/recipes-devtools/rust/rust-common.inc    |   1 -
>  meta/recipes-devtools/rust/rust-testsuite.inc | 163 +++++++
>  .../rust-testsuite/rust-oe-selftest.patch     | 417
> ++++++++++++++++++ .../rust/rust-testsuite_1.60.0.bb             |
> 3 + 6 files changed, 641 insertions(+), 1 deletion(-)
>  create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
>  create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc
>  create mode 100644
> meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch
> create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.60.0.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc index
> 3990d1d507..cecb02b1c6 100644 ---
> a/meta/conf/distro/include/maintainers.inc +++
> b/meta/conf/distro/include/maintainers.inc @@ -719,6 +719,7 @@
> RECIPE_MAINTAINER:pn-rust-crosssdk-${SDK_ARCH}-glibc = "Randy MacLeod
> <Randy.Mac
> RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> "Randy MacLeod <Randy.MacLeod@windriver.com>"
> RECIPE_MAINTAINER:pn-rust-hello-world = "Randy MacLeod
> <Randy.MacLeod@windriver.com>" RECIPE_MAINTAINER:pn-rust-llvm =
> "Randy MacLeod <Randy.MacLeod@windriver.com>"
> +RECIPE_MAINTAINER:pn-rust-testsuite = "Randy MacLeod
> <Randy.MacLeod@windriver.com>"
> RECIPE_MAINTAINER:pn-rust-tools-cross-canadian-${TRANSLATED_TARGET_ARCH}
> = "Randy MacLeod <Randy.MacLeod@windriver.com>"
> RECIPE_MAINTAINER:pn-rxvt-unicode = "Unassigned
> <unassigned@yoctoproject.org>" RECIPE_MAINTAINER:pn-sato-screenshot =
> "Ross Burton <ross.burton@arm.com>" diff --git
> a/meta/lib/oeqa/selftest/cases/rust.py
> b/meta/lib/oeqa/selftest/cases/rust.py new file mode 100644 index
> 0000000000..a37e3e37c5 --- /dev/null +++
> b/meta/lib/oeqa/selftest/cases/rust.py @@ -0,0 +1,57 @@ +#
> SPDX-License-Identifier: MIT +import os +import subprocess +from
> oeqa.core.decorator import OETestTag +from oeqa.core.case import
> OEPTestResultTestCase +from oeqa.selftest.case import
> OESelftestTestCase +from oeqa.utils.commands import runCmd, bitbake,
> get_bb_var, get_bb_vars, runqemu, Command +from oeqa.utils.sshcontrol
> import SSHControl + +# Total time taken for testing is of about 2hr
> 20min, with PARALLEL_MAKE set to 40 number of jobs. +class
> RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase): +
> +       def run_check_emulated(self, *args, **kwargs):
> +               # build remote-test-server before image build

Weird indentation here, 7 spaces for level 1, 15 for level 2... v5 had
a much cleaner tab-based indentation. Is it possible that you
manipulated the patch manually? It's a bad idea, I hurt myself a few
times when I used to do that! :) I recommend using plain 'git
format-patch' / 'git send-email'.

You should resend with a 4-spaces indentation, which is the Python
standard. However I'm taking the patch anyway for testing, so it's
more efficient if you just wait for the test results before resending,
so you can also include any bugfixes (if needed) in your next iteration.

Thanks!
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

