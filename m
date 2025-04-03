Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD68C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 10:07:30 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.9857.1743674844121626408
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 03:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ewd1BIot;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2D5F4314D;
	Thu,  3 Apr 2025 10:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743674842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ATQLol8IPp2E6bG3Vqgex2qLm+oQrh3/kg9XrPwSjqY=;
	b=ewd1BIotUcKKKjpLJEa4zDGn3prPWFfBD9jvry4IlN1w1HM88vs9jq76H/3aPJLh5XSxmC
	/qYiL67nvNMARvGuv4coFyWRmQrBhq2MSRquXyTlLjpUlJkcM0REt4WrgClJ9yTpBmi6Iw
	21Q1cDagtll1IdFhfshUYhQmJOD1GN8ZrpaV98RNHpYGL9mv9meg3OPj/jUAAHc0vJgq+a
	rQ0CVrTRUa1NJeMniWPzcEGMfPDrUaGZRbdzdXCgqqGzxKS3UvR590wrUB1G3Nfelqe7yQ
	rtvFjMoU6vC/RQJRa3pRihAJLruS5QAMjjXvtt2M4gc4MXNz+E6Uilu/YDeC6A==
Message-ID: <5746f47c-7e5d-46f5-b089-c613b7275d2b@bootlin.com>
Date: Thu, 3 Apr 2025 12:07:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: openembedded-core@lists.openembedded.org
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [scarthgap] multilib_header class: issue with custom multilib setup
Organization: Bootlin
Cc: Thomas Perrot <thomas.perrot@bootlin.com>,
 richard.purdie@linuxfoundation.org, Khem Raj <raj.khem@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfvhffuohevtgfgsehtkeertddtvdejnecuhfhrohhmpeflohgrohcuofgrrhgtohhsucevohhsthgruceojhhorghomhgrrhgtohhsrdgtohhsthgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetgfejveetffffgeevkeetudfhtddtffdthefhveekgfegheeiteffieetveekveenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegtsggtjeemuggutdefmegsfeeileemfheltggvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegtsggtjeemuggutdefmegsfeeileemfheltggvpdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemheehieemjegrtddtmegtsggtjeemuggutdefmegsfeeileemfheltggvngdpmhgrihhlfhhrohhmpehjohgrohhmrghrtghoshdrtghoshhtrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhop
 ehthhhomhgrshdrphgvrhhrohhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 10:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214309

Hello,

I'm facing the conflict below (among other conflicts of the same kind) 
during the rootfs creation of my image, and I would like to ask for some 
help on this:

file /usr/include/gnu/lib-names-lp64d.h conflicts between attempted 
installs of libcfi-libc6-dev-2.37-r0.riscv64cfi and 
libc6-dev-2.37-r0.riscv64

AFAIK, multilib_header.bbclass is meant to handle this kind of 
situation, so I tried the approach below:

do_install:append() {
     oe_multilib_header gnu/lib-names-lp64d.h
}

this one too, just in case:

do_install:append:virtclass-multilib-libcfi() {
     oe_multilib_header gnu/lib-names-lp64d.h
}

Am I missing something here?

With both approaches, I get the error below:

file /usr/include/gnu/lib-names-lp64d-64.h conflicts between attempted 
installs of libcfi-libc6-dev-2.37-r0.riscv64cfi and 
libc6-dev-2.37-r0.riscv64

and if I try running 'bitbake -c rootfs myimage' once again:

file /usr/include/gnu/lib-names-lp64d-64-64.h conflicts between 
attempted installs of libcfi-libc6-dev-2.37-r0.riscv64cfi and 
libc6-dev-2.37-r0.riscv64

I added some debug prints to understand what exactly was being renamed 
by oe_multilib_handler, and:

"renaming gnu/lib-names-lp64d.h to gnu/lib-names-lp64d-64.h"

That looks correct, but I don't quite understand why the original header 
remains there:

$ find image/usr/include/gnu/ -name lib-names-lp64d*h
image/usr/include/gnu/lib-names-lp64d-64.h
image/usr/include/gnu/lib-names-lp64d.h

For info, my multilib suffix is 'cfi' rather than '32' or '64'. Am I 
right to presume I would need to adapt oe_multilib_header to it?

Thanks in advance, any help provided is appreciated.

-- 
Best regards,
João Marcos Costa

