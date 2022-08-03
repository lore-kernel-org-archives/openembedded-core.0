Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B32ECC19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 13:43:23 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.8661.1659534195880033133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 06:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Nq79iHpE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8DD82C000A;
	Wed,  3 Aug 2022 13:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659534193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tF2GnEtVrM9UWHf/+KNX5efiWxs78mMNImt7xKhtE2A=;
	b=Nq79iHpEFoUPoRVyotlx++ajxPLNu0Hvo7Pe7GyHLnCn79vFDjjNTI89SoEfYHzoxGe38Q
	L35WrZnIRnmgURJ0v5NaFlF2t2eLQxeYrGLrrZF5rHGvvheRTT9yaw2bjOKPx2ZxyQDx+e
	yNp0W4VhY43aBTv9r3lvweHtSP7++fMIyTQ36HxRNh9EZdvEk5Zd1Z310OsVUhSzcD+npG
	bXHXoFAg5CEsTjCx1w3ubrgqE4Is5QE81NyN64SodSX9Cr7v1UnkX7sFXiWVAtmn1NBNfM
	rADSpOfMQr1dwzOqxckITh0GqnTeEJH+xDkHvUeXWUShYtMQgOV4/+M4jCteKQ==
Date: Wed, 3 Aug 2022 15:43:10 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>
Cc: luca.ceresoli@bootlin.com, "Pgowda" <pgowda.cve@gmail.com>,
 openembedded-core@lists.openembedded.org,
 richard.purdie@linuxfoundation.org, rwmacleod@gmail.com, Vinay Kumar
 <vinay.m.engg@gmail.com>
Subject: Re: [OE-core] [PATCH v7] Rust Oe-Selftest implementation
Message-ID: <20220803154310.2cf9862c@booty>
In-Reply-To: <1707D9665C148D1A.1831@lists.openembedded.org>
References: <20220802122005.31100-1-pgowda.cve@gmail.com>
	<1707D9665C148D1A.1831@lists.openembedded.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 13:43:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168816

Hi Pgowda,

On Wed, 3 Aug 2022 15:40:15 +0200
"Luca Ceresoli via lists.openembedded.org"
<luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:

> On Tue,  2 Aug 2022 17:50:05 +0530
> "Pgowda" <pgowda.cve@gmail.com> wrote:
> 
> > From: pgowda <pgowda.cve@gmail.com>
> > 
> > The patch implements Rust testing framework similar to other selftest,
> > specifically the gcc selftest in OE. It uses the client and server
> > based method to test the binaries for cross-target on the image.
> > The test framework is a wrapper around the Rust build system as ./x.py
> > test.
> > It tests many functionalities of Rust distribution like tools,
> > documentation, libraries, packages, tools, Cargo, Crater etc.
> > Please refer the following link for detailed description of Rust
> > testing:-
> > https://rustc-dev-guide.rust-lang.org/tests/intro.html#tool-tests
> > 
> > To support the rust tests in oe-core, the following functions were
> > added:-
> > setup_cargo_environment(): Build bootstrap and some early stage tools.
> > do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
> > do_configure(): To generate config.toml
> > do_compile(): To build "remote-test-server" for qemu target image.
> > 
> > Approximate Number of Tests Run in the Rust Testsuite :- 18000
> > Approximate Number of Tests that FAIL in bitbake environment :- 100-150
> > Normally majority of the testcases are present in major folder "test/"
> > It contributes to more than 80% of the testcases present in Rust test
> > framework. These tests pass as expected on any Rust versions without
> > much fuss. The tests that fail are of less important and contribute to
> > less than 2% of the total testcases. These minor tests are observed to
> > work on some versions and fail on others. They have to be added, ignored
> > or excluded for different versions as per the behavior.
> > These tests have been ignored or excluded in the Rust selftest
> > environment to generate success of completing the testsuite.
> > 
> > These tests work in parallel mode even in the skipped test mode as
> > expected. Although the patch to disable tests is large, it is very simple
> > in that it only disables tests. When updating to a newer version of Rust,
> > the patch can usually be ported in a day.
> > 
> > Signed-off-by: pgowda <pgowda.cve@gmail.com>
> > Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>  
> 
> This patch fails because of:
> 
>   AssertionError: 
>   The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
>   rust-testsuite (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-devtools/rust/rust-testsuite_1.62.0.bb)
> 
> Some logs:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3917/steps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3866/steps/14/logs/stdio

...and there is another failure, this time it is an actual build error:

| CMake Error at /home/pokybuild/yocto-worker/qemux86-64/build/build-st-789666/tmp/work/core2-64-poky-linux/rust-testsuite/1.62.0-r0/recipe-sysroot-native/usr/share/cmake-3.23/Modules/CMakeTestCXXCompiler.cmake:62 (message):
|   The C++ compiler
| 
|     "/home/pokybuild/yocto-worker/qemux86-64/build/build-st-789666/tmp/work/core2-64-poky-linux/rust-testsuite/1.62.0-r0/wrapper/build-rust-cxx"
| 
|   is not able to compile a simple test program.
| 
|   It fails with the following output:
| 
[...]
|     /home/pokybuild/yocto-worker/qemux86-64/build/build-st-789666/tmp/hosttools/ld: cannot find -lstdc++
|     collect2: error: ld returned 1 exit status

Full log at:

https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5569/steps/19/logs/stdio


-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

