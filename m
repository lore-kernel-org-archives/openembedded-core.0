Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800B4C32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 08:15:52 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.10768.1674029750711336503
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 00:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=I8qQB/kT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7390160005;
	Wed, 18 Jan 2023 08:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674029748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RXU0gf6P5ZyNZQa+NV0l2Ff42S/DcX2lsxtEU1Pcdb8=;
	b=I8qQB/kT/QGUYjLw2+OtXU9Tc4fc7Nf+CTroX3MvL2Zjj6xAKctb4BwYqCEr+OJCF+6muY
	Vk9kkT/Nbi5EluWrbjNWkdo0qnI+oSthd87uPkxc3cGpzlduMWkMzke6cT3xzfoLapH0DA
	C1JK2ewofACD+jGGaIOXgd9cl6hWuhiufgE9TmEYuaFhfsnw26R1cs+fA9bKeF7BIvZKeg
	25a8sXGzITCbMVvN/fEh72BYTtfcQ/7aVXc/cK9hmnt1PdPnVtBArdcJpm09u5Zpku4IyS
	RWKMizhVqVj5DEunoiSmv/JTkK6xmgpvsF6e/2zgJr7dMIcwuXQZ74uvaGSBNw==
Date: Wed, 18 Jan 2023 09:15:46 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>
Cc: luca.ceresoli@bootlin.com, "Khem Raj" <raj.khem@gmail.com>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/3] binutils: Upgrade to 2.40 release
Message-ID: <20230118091546.28d25aa4@booty>
In-Reply-To: <173B1D26203AD598.23170@lists.openembedded.org>
References: <20230115184358.2276696-1-raj.khem@gmail.com>
	<173B1D26203AD598.23170@lists.openembedded.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 08:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176078

Hi Khem,

On Tue, 17 Jan 2023 14:55:31 +0100
"Luca Ceresoli via lists.openembedded.org"
<luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:

> Hi Khem,
> 
> On Sun, 15 Jan 2023 10:43:55 -0800
> "Khem Raj" <raj.khem@gmail.com> wrote:
> 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>  
> 
> This patchset (perhaps this one specific patch) seems to be causing
> failures on the autobuilders with meta-mingw:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/6556/steps/16/logs/stdio
> 

Another failure that was possibly caused by this series, and which
disappeared when I ran tests without this series, is:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/4562/steps/13/logs/stdio

WARNING: core-image-ptest-all-1.0-r0 do_testimage: There were failing ptests.
...
AssertionError: Failed ptests:
{'elfutils': ['run-native-test.sh']}

And the ptest log says:

/usr/lib/elfutils/ptest/tests/funcretval: dwfl_module_return_value_location: cannot handle DWARF type description
FAIL: run-native-test.sh

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

