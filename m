Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AC9C77B73
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 07:44:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.32180.1681890269822289648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 00:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=W7rcru6p;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9DA0D2000B;
	Wed, 19 Apr 2023 07:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681890267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZeSD7J9BHHyAruoocyknjhp0TS5uID3dzl56Fc+bXIc=;
	b=W7rcru6pDFkmWYKSs0JkrWpS3xyXd6n/cAqNLHPYfY7syoiMB7NltmF1lbXC7JG0zR0b/K
	+Dj/08Nnr5M43qW3pS45J6ORpzsMV9wywIjILhbJ5KflaNGqfV6iFwxTOxeMwcJRn1rbBZ
	P9FLyMuMr24bNXUxVSjY/MfEbsHjcO7PNT2SgtRjYlhpiozAQTFyKS92lazOazVZfO1pDO
	uwIxOwYYofCZiJXsUfe0QSJ02VjDKYvtXWXa/GzUKIu/z35XPl4JafIGS6disiEqfiRd6O
	PA3tw+Rzdy+psy7G99ebJVJpMUHy+SmJt69Q/XwfcokQPROOd6L8CxPjhNZQhw==
Date: Wed, 19 Apr 2023 09:44:24 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Yash Shinde" <yashinde145@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
 Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com,
 Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
 Yash.Shinde@windriver.com
Subject: Re: [OE-core] [PATCH v13] Rust Oe-Selftest implementation
Message-ID: <20230419094424.50f76431@booty>
In-Reply-To: <20230418091013.858279-1-yashinde145@gmail.com>
References: <20230418091013.858279-1-yashinde145@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 07:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180213

Hello Yash,

On Tue, 18 Apr 2023 14:40:13 +0530
"Yash Shinde" <yashinde145@gmail.com> wrote:

> The patch implements Rust testing framework similar to other selftest,
> specifically the gcc selftest in OE. It uses the client and server
> based method to test the binaries for cross-target on the image.
> The test framework is a wrapper around the Rust build system as ./x.py
> test. It tests many functionalities of Rust distribution like tools,
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
> Tested for X86, X86-64, ARM, ARM64 and MIPS64 on CentOS release 6.10
> 
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> Signed-off-by: Yash Shinde <yashinde145@gmail.com>

Testing with this patch is causing a lot of failures. Here are some
logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/6944/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/6344/steps/16/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/4337/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/6998/steps/11/logs/stdio

And here's the entire a-full build in case you need more info:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5194

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

