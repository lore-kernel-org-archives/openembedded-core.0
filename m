Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D0EFC433F5
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 20:56:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.14950.1653425767569204171
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 13:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iTmlULB6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B8137FF80B;
	Tue, 24 May 2022 20:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653425765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FI9qUCi/18KjkqlDusFecbieiswhvdeZR5lH9VH83eg=;
	b=iTmlULB6Qp1rxWiS1pTAlZDade08ZisTrwj7lGyUO78ZikJ+Cixc62hV7tIRI76e6YSXlT
	+DpRW0bjsE5aWxxpj2RxAWwLquqrmuPN83QKtv4I9ilg/XFrm9hdwZtEc8BkaLEseZEdQ1
	XAEbkMhEsDWZcm7laqoj2k+p4zzXwu8KACpzmEPh4IsxHn3NCVhdma3QRzqV80se2AnnWs
	UDxD2C/WzVL9JlOnIrgjoYg+KpAHE167hXLsZhzWBTSOO4qrzy8zCjO16MOPlfo9mU9oeg
	aUeJk+dA1Urvsv5BOMDp0T0ymdBbghYEc0sFiJztHbEK7aSvB152h5iCS7ZC1g==
Date: Tue, 24 May 2022 22:56:03 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Pgowda" <pgowda.cve@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Alexander Kanavin
 <alex.kanavin@gmail.com>, Richard Purdie
 <richard.purdie@linuxfoundation.org>, Randy MacLeod <rwmacleod@gmail.com>,
 Vinay Kumar <vinay.m.engg@gmail.com>
Subject: Re: [OE-core] [PATCH v5] Rust Oe-Selftest implementation
Message-ID: <20220524225603.50d60963@melee>
In-Reply-To: 
 <CALY4987EVjw2cMmRSo78+Pjq7ToDnzD_zbS+c=Rg4LoRZ3DC+g@mail.gmail.com>
References: <20220513122032.122077-1-pgowda.cve@gmail.com>
	<CALY4987EVjw2cMmRSo78+Pjq7ToDnzD_zbS+c=Rg4LoRZ3DC+g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 20:56:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166088

hi Pgowda,

Il giorno Tue, 24 May 2022 17:23:04 +0530
"Pgowda" <pgowda.cve@gmail.com> ha scritto:

> Gentle Ping on the following patch
> 
> On Fri, May 13, 2022 at 5:50 PM pgowda <pgowda.cve@gmail.com> wrote:
> >
> > The patch implements Rust testing framework similar to other
> > selftest, specifically the gcc selftest in OE. It uses the client
> > and server based method to test the binaries for cross-target on
> > the image. The test framework is a wrapper around the Rust build
> > system as ./x.py test.
> > It tests many functionalities of Rust distribution like tools,
> > documentation, libraries, packages, tools, Cargo, Crater etc.
> > Please refer the following link for detailed description of Rust
> > testing:-
> > https://rustc-dev-guide.rust-lang.org/tests/intro.html#tool-tests
> >
> > To support the rust tests in oe-core, the following functions were
> > added:-
> > setup_cargo_environment(): Build bootstrap and some early stage
> > tools. do_rust_setup_snapshot(): Install the snapshot version of
> > rust binaries. do_configure(): To generate config.toml
> > do_compile(): To build "remote-test-server" for qemu target image.
> >
> > Approximate Number of Tests Run in the Rust Testsuite :- 18000
> > Approximate Number of Tests that FAIL in bitbake environment :-
> > 100-150 Normally majority of the testcases are present in major
> > folder "test/" It contributes to more than 80% of the testcases
> > present in Rust test framework. These tests pass as expected on any
> > Rust versions without much fuss. The tests that fail are of less
> > important and contribute to less than 2% of the total testcases.
> > These minor tests are observed to work on some versions and fail on
> > others. They have to be added, ignored or excluded for different
> > versions as per the behavior. These tests have been ignored or
> > excluded in the Rust selftest environment to generate success of
> > completing the testsuite.
> >
> > These tests work in parallel mode even in the skipped test mode as
> > expected. Although the patch to disable tests is large, it is very
> > simple in that it only disables tests. When updating to a newer
> > version of Rust, the patch can usually be ported in a day.
> >
> > Signed-off-by: pgowda <pgowda.cve@gmail.com>
> > Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>

This patch is ailing on the autobuilders:

The following recipes do not have a maintainer assigned to them. Please
add an entry to meta/conf/distro/include/maintainers.inc file.
rust-testsuite
(/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-devtools/rust/rust-testsuite_1.60.0.bb)

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3623/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3565/steps/14/logs/stdio

Can you resend with that fixed?
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

