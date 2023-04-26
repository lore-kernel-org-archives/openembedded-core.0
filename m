Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71855C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 21:10:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.4738.1682543434138065068
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 14:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=esx+py20;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4FAC520002;
	Wed, 26 Apr 2023 21:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682543431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uoglnFhhBE9HjnvBQwFvHnxpnPS2wpl6eTSOOyFxyRY=;
	b=esx+py206r58bEhthlNF9dqbvJFO0zHdxyJLJmlSqNfPava897TJsuxCHFjJQHP/wa0otM
	WxpfQqyJBaodGX8dJPcINCbNpBI1LCetoJ6oz9rnkMwslLjb+3PLdh9ipo9Q4qBVmCw3lg
	1od5r+2Vi/nWUFeww6kEQvSK2tbWs9CVRVJMpSZnqS+A62oI4w8+Bnri/8ziipTv7bH1hI
	ikkEEUuj9DMgcctaiHvXz3oKgwEmIy0erTj7x4ABszbbHXnwcarMsdKortvPkXyVI51o4k
	htXsbKtGicbAYEivje/g3nWh+KZJSujCwBiFP5QjAxSxpXDupKow7yWuaVBjPA==
Date: Wed, 26 Apr 2023 23:10:29 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Frederic Martinsons" <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCHV2 0/3] Create class for building and
 installing rust tests
Message-ID: <20230426231029.6ae3c6af@booty>
In-Reply-To: <cover.1682341336.git.frederic.martinsons@gmail.com>
References: <cover.1682341336.git.frederic.martinsons@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 21:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180457

Hello Frederic,

On Mon, 24 Apr 2023 15:04:10 +0200
"Frederic Martinsons" <frederic.martinsons@gmail.com> wrote:

> From: Frederic Martinsons <frederic.martinsons@gmail.com>
> 
> This brings the possibility to use this class to build and ship
> unit tests of rust projects, the class also create (or modified)
> standard run-ptest script to run the generated rust test suite.
> 
> It has been tested successfully with core-image-sato under qemu
> for zvariant-ptest and python3-bcrypt-ptest (though the last one
> didn't define any unit tests).
> 
> Note that I tried to do the same with python3-cryptography but fail
> to build the test suite and I don't know how to do it with the rust
> extension module build by python setuptools. There must be some kind
> of way for doing that so maybe someone will put some work in it (
> because python3-cryptography rust extension do have unit tests).
> 
> Moreover, in the class, I didn't manage to share data between
> do_compile_ptest_base and do_install_ptest_base cleanly (I tried
> to d.setVar in compile and d.getVar in install but it seems that
> the data store doens't recognize my new variable) so I used a file
> for that. I'm sure there is a clever way for doing that, so feel
> free to tell me.

A build error appeared on the autobuilders with these patches applied:

  File "/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa/selftest/cases/devtool.py", line 879, in test_devtool_modify_git_crates_subpath
    self._test_recipe_contents(recipefile, {}, ['cargo'])
  File "/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa/selftest/cases/devtool.py", line 169, in _test_recipe_contents
    self.assertIn(inherit, inherits, 'Missing inherit of %s' % inherit)
  File "/usr/lib/python3.8/unittest/case.py", line 1179, in assertIn
    self.fail(self._formatMessage(msg, standardMsg))
  File "/usr/lib/python3.8/unittest/case.py", line 753, in fail
    raise self.failureException(msg)
AssertionError: 'cargo' not found in {'pkgconfig', 'cargo-update-recipe-crates', 'ptest-cargo'} : Missing inherit of cargo

Log:
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1321/steps/14/logs/stdio

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

