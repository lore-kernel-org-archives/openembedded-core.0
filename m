Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1814C00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 07:12:58 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.4313.1659683574151536897
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 00:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bDeSFEAN;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0C0B3100009;
	Fri,  5 Aug 2022 07:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659683571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DunqB4Y6hL9B02KJH1y6cXBvqCKNos0Y1kTfwQySk7Q=;
	b=bDeSFEANdP/pEglfDOr9ujKNpy/0a13Blx/AX48Nqr/v1uEz938BBmSO70bGUZXA6W54fg
	OE8WgMoHf/KpHzL9eySoDAqahMpH8IzOB0bvuXpvtpkeRw9pt/UsUXbtg5S95YqXhL7wZ1
	6lRWjEM1ERDF4oszFckIYSYVyWz4NBy6O/HT+htz+g9QjcS4ZhGb69kF9Oz2DBeXabCO3q
	iF7TzTv72S1aEO0tE274K/Rqkx+6re2qCVP2LVGok1NMkC1c6WCQTdiqyfo2Y4pE7l1Xmb
	1kRGVHYS7WfZA0sfWLMOA9CfDh3279qfFG5WBjwBgnDcnG2Rs6STeKofwqxkwA==
Date: Fri, 5 Aug 2022 09:12:48 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Pgowda" <pgowda.cve@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 richard.purdie@linuxfoundation.org, rwmacleod@gmail.com, Vinay Kumar
 <vinay.m.engg@gmail.com>
Subject: Re: [OE-core] [PATCH v8] Rust Oe-Selftest implementation
Message-ID: <20220805091248.0e83b7f0@booty>
In-Reply-To: <20220803142734.2877-1-pgowda.cve@gmail.com>
References: <20220803142734.2877-1-pgowda.cve@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 07:12:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168931

Hello Pgowda,

On Wed,  3 Aug 2022 19:57:34 +0530
"Pgowda" <pgowda.cve@gmail.com> wrote:

> From: pgowda <pgowda.cve@gmail.com>
> 
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
> do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
> do_configure(): To generate config.toml
> do_compile(): To build "remote-test-server" for qemu target image.
> 
> Approximate Number of Tests Run in the Rust Testsuite :- 18000
> Approximate Number of Tests that FAIL in bitbake environment :- 100-150
> Normally majority of the testcases are present in major folder "test/"
> It contributes to more than 80% of the testcases present in Rust test
> framework. These tests pass as expected on any Rust versions without
> much fuss. The tests that fail are of less important and contribute to
> less than 2% of the total testcases. These minor tests are observed to
> work on some versions and fail on others. They have to be added, ignored
> or excluded for different versions as per the behavior.
> These tests have been ignored or excluded in the Rust selftest
> environment to generate success of completing the testsuite.
> 
> These tests work in parallel mode even in the skipped test mode as
> expected. Although the patch to disable tests is large, it is very simple
> in that it only disables tests. When updating to a newer version of Rust,
> the patch can usually be ported in a day.
> 
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>


This patch triggers the same error I had reported for v7:

https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5588/steps/18/logs/stdio

https://lists.openembedded.org/g/openembedded-core/message/168816

Can please try to reproduce the issue locally, to ensure you can
investigate it?


Also, when sending a new version, don't forget to add a short changelog
as suggested by Randy:
https://lists.openembedded.org/g/openembedded-core/message/168821

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

