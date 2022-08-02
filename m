Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A63BC00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 08:38:41 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.3796.1659429517869844670
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 01:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZgOc98in;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3BF7320004;
	Tue,  2 Aug 2022 08:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659429516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0TRsw+BlSMxejK0450zYF5JqXaneaUOybS+pjmjJvkE=;
	b=ZgOc98inKA5RVGETNCnkPu9MCqJd6G+3el0rt20zus+MjlixpUTg3oU/pyF0/zt4uQCGwD
	rxaaLn5k5SoQ+LtAwJS6uzfp/cqqLNKy1C7Bsu36OiM+VnaD65gyoEWu34AaUzqeHwPIhS
	hI2QKwcyv9NE/pu+iZ1hVV00HFk3KlBxSY9zQcnd9TlP/xxfazMOqtMJRHRU4M7uKLMpmx
	A72UMS6BG2waX+AmaHNmFXiag0p1ipEN6+0qN+UHmOEFBU2zVhlIh6fDblBX3ZNxc3caCP
	68yBoEp8mBjsGyu0HIoz5QnBWORBPeRGqzmk1s33tc1VDRwf7rIt92DHTM0I3g==
Date: Tue, 2 Aug 2022 10:38:33 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Pgowda" <pgowda.cve@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 richard.purdie@linuxfoundation.org, rwmacleod@gmail.com, Vinay Kumar
 <vinay.m.engg@gmail.com>
Subject: Re: [OE-core] [PATCH v6] Rust Oe-Selftest implementation
Message-ID: <20220802103833.0b32b669@booty>
In-Reply-To: <20220802035352.1497111-1-pgowda.cve@gmail.com>
References: <20220802035352.1497111-1-pgowda.cve@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 08:38:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168771

On Tue,  2 Aug 2022 09:23:52 +0530
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
> ---
>  meta/classes/rust-target-config.bbclass       |   2 +-
>  meta/lib/oeqa/selftest/cases/rust.py          |  57 +++
>  meta/recipes-devtools/rust/rust-testsuite.inc | 164 ++++++
>  .../rust-testsuite/rust-oe-selftest.patch     | 477 ++++++++++++++++++
>  .../rust/rust-testsuite_1.62.0.bb             |   3 +
>  5 files changed, 702 insertions(+), 1 deletion(-)
>  create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
>  create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc
>  create mode 100644 meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch
>  create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.62.0.bb
> 
> diff --git a/meta/classes/rust-target-config.bbclass b/meta/classes/rust-target-config.bbclass
> index 87b7dee3ed..26dc931971 100644
> --- a/meta/classes/rust-target-config.bbclass
> +++ b/meta/classes/rust-target-config.bbclass
> @@ -344,7 +344,7 @@ def rust_gen_target(d, thing, wd, arch):
>      tspec['linker-is-gnu'] = True
>      tspec['linker-flavor'] = "gcc"
>      tspec['has-rpath'] = True
> -    tspec['has-elf-tls'] = True
> +#    tspec['has-elf-tls'] = True

I'm not sure of the meaning of the above change, can you clarify that?

Thanks.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

